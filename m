Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E093911B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762111.1172218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuUA-0007bD-MB; Mon, 22 Jul 2024 14:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762111.1172218; Mon, 22 Jul 2024 14:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuUA-0007ZM-JV; Mon, 22 Jul 2024 14:57:58 +0000
Received: by outflank-mailman (input) for mailman id 762111;
 Mon, 22 Jul 2024 14:57:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sVuU9-0007ZG-5q
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:57:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVuU7-0000Nw-0r; Mon, 22 Jul 2024 14:57:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVuU6-0002qB-Pw; Mon, 22 Jul 2024 14:57:54 +0000
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
	bh=+QYaDGqTgRtC4dMpFUId0MUWzHRtRQ9J2KwclGyfN9Q=; b=e2SBwU/MQr459Lxrpxv3sZ2shB
	wzmKO08020eece6/VLLHiYGCtbKbLCjKiygaNavdtF6+jYrvbls2Yu6YEIov3T7Zrt8kwtm5X0jSN
	sMbRgO02doU/22d1lA34jOWnEYfWnaAm/11FWAB1tihwbAA6abgSDXe3ysSsddCq5Sas=;
Message-ID: <9ff73d5c-fe83-4b65-b3c7-c17b4ce2e4f7@xen.org>
Date: Mon, 22 Jul 2024 15:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
 <15375179-1c94-43c3-a256-42a856905e21@xen.org>
 <c6a06c8d-ed6c-42d2-9ba3-56c37e878d9c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c6a06c8d-ed6c-42d2-9ba3-56c37e878d9c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/07/2024 13:58, Jan Beulich wrote:
> On 21.07.2024 10:51, Julien Grall wrote:
>> On 12/07/2024 17:22, Oleksii Kurochko wrote:
>>> +inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
>>> +{
>>> +    /* there is no attr field in RISC-V's pte */
>>> +    (void) attr;
>>
>> Surely you have a way to say indicate whether an entry is readable/writable?
> 
> I'm puzzled by this question. The sole outlier in Arm code is pmap.h, in
> passing PAGE_HYPERVISOR_RW to this function when all others pass memory
> types (MT_*).  > Afaics only the low three bits are then used in the
> function, discarding access control bits altogether. R/W access appears
> to be implied.

Arm is not exempt of odd interfaces. However, from just this patch, it 
is not clear why RISC-V would continue to use the same appropach if the 
attributes doesn't exist.

Looking at the rest of the series, it seems to be because we wanted to 
have a generic page-table code. If there are a desire to continue 
towards this direction, then I would assume we would need a arch 
specific way to set the read/write bit.

At which point it makes a lot more sense to push setting the access bits 
in mfn_to_xen_entry().

Even if we don't do any code consolidation, I think it is odd for Arm 
that a caller will assume mfn_to_xen_entry() will always return a 
read-writable page and update as necessary. It would be nicer to push 
this decision to mfn_to_xen_entry().

Cheers,

-- 
Julien Grall

