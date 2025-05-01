Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72925AA5DA3
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 13:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974081.1362035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uARsZ-0006Q2-Ax; Thu, 01 May 2025 11:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974081.1362035; Thu, 01 May 2025 11:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uARsZ-0006O6-8G; Thu, 01 May 2025 11:14:59 +0000
Received: by outflank-mailman (input) for mailman id 974081;
 Thu, 01 May 2025 11:14:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uARsX-0006O0-HO
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 11:14:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uARsU-000xk5-1V;
 Thu, 01 May 2025 11:14:54 +0000
Received: from [15.248.2.31] (helo=[10.24.66.15])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uARsU-00G9MA-0t;
 Thu, 01 May 2025 11:14:54 +0000
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
	bh=4NV3oT3IbExqMadVEZ7mL9H7hwtfCZag5BBPfIyCjVQ=; b=epm+MGbOaLGllaYaTQfRCkhkys
	LerE3bl/oTygdTw8N+GjITPYVLHWaFydsEwjYlBCPGv71K8KIHWKSg/IQsLVYy11dtSmDs3rUjVVB
	ZV1NF24CbVaLMKmMJGXiFyCd4cqUFST3PbkaxSdhC3vTKqtKUuBpJfvhlWl5fc3AJyjw=;
Message-ID: <c026ae61-d6af-448c-a91f-8608e6d9969f@xen.org>
Date: Thu, 1 May 2025 12:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Physical address hypercall ABI ("HVMv2")
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1744981654.git.teddy.astie@vates.tech>
 <b73ca490-921b-4151-ad81-16d531634846@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b73ca490-921b-4151-ad81-16d531634846@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/04/2025 08:45, Jan Beulich wrote:
> On 18.04.2025 16:18, Teddy Astie wrote:
>> In current HVM mode, when a hypercall references a structure in guest memory,
>> it is passed to the hypervisor as its "linear address" (e.g virtual address for
>> the x86 long mode).
>> One of the caveats is that this linear address (GVA) is generally not directly
>> usable by the Xen and needs to be translated from GVA to GPA then HPA. This
>> implies a complex and potentially expensive lookup of the pagetables inside the
>> guest. This can be significant, especially if the P2M cannot use efficiently
>> superpages (or with e.g XSA-304).
>>
>> This proposal introduce a new mode where all addresses used for hypercalls are
>> GPADDR instead of GVADDR, therefore, looking up the HPA related to this GPA
>> only needs a P2M lookup and not looking through the inside-guest pagetables.
>>
>> This mode is opt-in and must be enabled explicitely by the toolstack.
> 
> Which I view as a severe downside (leaving aside the PVH Dom0 aspect): This way
> a guest needs to be converted all in one go. While doable, it'll be increasingly
> risky with the size of the guest kernel code base.

+1. It is not only the guest kernel, but also the firmware (UEFI, U-boot).

Furthermore, I don't think this can be easily adopted in public cloud 
where the admin for Xen and the guest will be different. So any 
indication of the ABI would have to come from the guest itself rather 
than the configuration.

Cheers,

-- 
Julien Grall


