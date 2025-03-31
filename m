Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E53A76BCE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 18:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932839.1334901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHpp-0003Up-Ju; Mon, 31 Mar 2025 16:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932839.1334901; Mon, 31 Mar 2025 16:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHpp-0003TM-HK; Mon, 31 Mar 2025 16:18:01 +0000
Received: by outflank-mailman (input) for mailman id 932839;
 Mon, 31 Mar 2025 16:18:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tzHpo-0003TB-My
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 16:18:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzHpk-002RL6-0O;
 Mon, 31 Mar 2025 16:17:56 +0000
Received: from [2a02:8012:3a1:0:4a4:ac1c:109c:a95]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzHpj-00CXyY-32;
 Mon, 31 Mar 2025 16:17:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=oS3eXU7frhy4tBXFsH87lZkMpMrxmp6W9+vYkfhiNFA=; b=fqs37kGWPzpirUUAq6pvM6oykt
	82zoYVjiWq0uwVPQf7D9f/0aqOsbW7WnsCpFbXkHhM6Bo4XoMksduxgwaJf0OEFolVu1mmMVlYSCG
	J/cgoPe3d5NXDGtRSIfJBv7Gqn6scXsFH6YBHpQKqInRFecvNRYBTAq3ua/KSkOc0KLc=;
Message-ID: <6f0efa9a-876e-4ae1-9367-ccd89f51bab0@xen.org>
Date: Mon, 31 Mar 2025 17:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 31/03/2025 17:14, Jan Beulich wrote:
> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>> A randconfig job failed with the following issue:
>>    riscv64-linux-gnu-ld: Xen too large for early-boot assumptions
>>
>> The reason is that enabling the UBSAN config increased the size of
>> the Xen binary.
>>
>> Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
>> and GCOV to be enabled together, with some slack for future growth.
> 
> At some point you may want to use 2M mappings for .text (rx), .rodata
> (r), and .data (rw).

OOI, why would we want to switch to 2MB? At least on Arm, Xen is tiny 
enough that it can fit in less than a couple of MB. I would expect the 
same for RISC-V.

Cheers,

-- 
Julien Grall


