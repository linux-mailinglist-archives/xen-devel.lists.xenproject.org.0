Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8720A77A43
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933906.1335744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaHI-0001YM-St; Tue, 01 Apr 2025 11:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933906.1335744; Tue, 01 Apr 2025 11:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaHI-0001Vn-QH; Tue, 01 Apr 2025 11:59:36 +0000
Received: by outflank-mailman (input) for mailman id 933906;
 Tue, 01 Apr 2025 11:59:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tzaHG-0001Vh-PK
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 11:59:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzaHA-005Q8Q-0F;
 Tue, 01 Apr 2025 11:59:28 +0000
Received: from [2a02:8012:3a1:0:31b1:5de8:95ef:d60f]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzaH9-00G2er-2g;
 Tue, 01 Apr 2025 11:59:27 +0000
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
	bh=FUyksunoxaosTWI6TbzQrWg+usM93yjXi/2kA70+rmM=; b=S9zqNLfPIJyNzoJt9obWQRJmaw
	Gqj2ODlDigW127LK0GHhhRoohR7VFhDc1EoOHhZVqiKXJ8XPBTz7wRK9Wq2/SoWac+gwb1fGMJ5iA
	aMbFScBzjzh0vFjLb1hPU7kLZ7ryDdLDbUO40T3ooFdeVNIJZoZFwN9SXO00xqTmdLBY=;
Message-ID: <33786f0b-eefa-4f1f-ac57-7f1b2c74715e@xen.org>
Date: Tue, 1 Apr 2025 12:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
 <6f0efa9a-876e-4ae1-9367-ccd89f51bab0@xen.org>
 <c8a786f0-cc78-41f4-8323-dabde70a7c91@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c8a786f0-cc78-41f4-8323-dabde70a7c91@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2025 07:24, Jan Beulich wrote:
> On 31.03.2025 18:17, Julien Grall wrote:
>> On 31/03/2025 17:14, Jan Beulich wrote:
>>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>>> A randconfig job failed with the following issue:
>>>>     riscv64-linux-gnu-ld: Xen too large for early-boot assumptions
>>>>
>>>> The reason is that enabling the UBSAN config increased the size of
>>>> the Xen binary.
>>>>
>>>> Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
>>>> and GCOV to be enabled together, with some slack for future growth.
>>>
>>> At some point you may want to use 2M mappings for .text (rx), .rodata
>>> (r), and .data (rw).
>>
>> OOI, why would we want to switch to 2MB? At least on Arm, Xen is tiny
>> enough that it can fit in less than a couple of MB. I would expect the
>> same for RISC-V.
> 
> For TLB efficiency reasons for example. On x86 we switched to using 2Mb
> pages quite some time back, just to find that (at least) one of the
> bootloaders choked on the then larger binary. Hence we ended up with
> the XEN_ALIGN_2M Kconfig symbol plus the unconditional use of 2Mb
> mappings for xen.efi. For the original change see cf393624eec3 ("x86:
> use 2M superpages for text/data/bss mappings").

For Arm, we can using the contiguous bit (it allows to combine a few 
entries into one TLB on some CPUs) to reduce the TLB usage. Not sure if 
RISC-V has a similar feature.

Cheers,

-- 
Julien Grall


