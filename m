Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D915F779FBE
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 13:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582863.912854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUmvv-0006iw-5K; Sat, 12 Aug 2023 11:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582863.912854; Sat, 12 Aug 2023 11:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUmvv-0006h5-2D; Sat, 12 Aug 2023 11:37:27 +0000
Received: by outflank-mailman (input) for mailman id 582863;
 Sat, 12 Aug 2023 11:37:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUmvu-0006gz-C8
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 11:37:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUmvt-0004Wp-Aa; Sat, 12 Aug 2023 11:37:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUmvs-0002pY-Vg; Sat, 12 Aug 2023 11:37:25 +0000
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
	bh=O5RnqtMFkLL0EemsOF5G9SOWdDVwu8Ei7mAqvUtDR8M=; b=Qlzs727TI3B9fOaUIJzWwGz1P2
	zMhpQyiVSGsHDmeGjOZxtmeLSnQQ4503nPCOj7FLVA07d+Q6XlaRF6IL1NXOurar4Ce2GaOR0oBBg
	4Sex5+WuegWR2IV2cyc5kV7x0EGVH9qvXc3iyhK3vzdoBl3iwR/D/KYsc4Q55W9sWjkY=;
Message-ID: <2319b8b3-a6cc-7e04-0f2a-ad73a87deb22@xen.org>
Date: Sat, 12 Aug 2023 12:37:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 tamas@tklengyel.com
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308111600190.2127516@ubuntu-linux-20-04-desktop>
 <449fa348676e754b7eae9b8acc00fb86@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <449fa348676e754b7eae9b8acc00fb86@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/08/2023 10:53, Nicola Vetrini wrote:
> 
>>> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
>>> index 7027c08a926b..499b6b349d79 100644
>>> --- a/xen/arch/x86/vm_event.c
>>> +++ b/xen/arch/x86/vm_event.c
>>> @@ -20,6 +20,7 @@
>>>
>>>  #include <xen/sched.h>
>>>  #include <xen/mem_access.h>
>>> +#include <xen/vm_event.h>
>>>  #include <asm/vm_event.h>
>>>
>>>  /* Implicitly serialized by the domctl lock. */
>>
>> I think the problem here is that ./arch/x86/include/asm/vm_event.h,
>> differently from ./arch/arm/include/asm/vm_event.h, doesn't #include
>> <xen/vm_event.h>
> 
> I see your point. Do you think it would be better to include xen/vm_event.h
> in asm/vm_event.h for x86 or move the inclusion of xen/vm_event.h for 
> arm to
> the source file, as done in the patch?

I think it is a bit odd require the C file to include the arch-specific 
header and the common one. It would be better to include only one.

My preference would be to include <asm/...> from <xen/...> and then only 
include the latter in the C file.

Cheers,

-- 
Julien Grall

