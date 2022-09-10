Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108205B4745
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 17:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404800.647388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2KZ-0000SC-ET; Sat, 10 Sep 2022 15:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404800.647388; Sat, 10 Sep 2022 15:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2KZ-0000Pi-Ap; Sat, 10 Sep 2022 15:23:39 +0000
Received: by outflank-mailman (input) for mailman id 404800;
 Sat, 10 Sep 2022 15:23:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oX2KY-0000Oc-Bm
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 15:23:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX2KX-0006NZ-FY; Sat, 10 Sep 2022 15:23:37 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX2KX-0007aO-AJ; Sat, 10 Sep 2022 15:23:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=XFq1iLrR+55pgikNEV1cjpYYEeJOfG9uF25Z3klKTwY=; b=KPwfYcMOVp59XAIldTX2fde/vh
	EJq5fgJy0bFw+WRTuxTS7zpQR7eSdSbPywZoBn1Eey/aynC1ws6rJ/tvUprakn00EqSn5hxFbTYJU
	JH43ge1R75PQpU4pjmIaRYfWLFq5p3LG9CR28fCflRUuQhNALxyolQIN23KTiBqz8l38=;
Message-ID: <698fa1df-6457-e560-3aab-9bd56978c4aa@xen.org>
Date: Sat, 10 Sep 2022 16:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 12/12] xen/arm: add cache coloring support for Xen
From: Julien Grall <julien@xen.org>
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-13-carlo.nonato@minervasys.tech>
 <0adb27f2-dee8-310a-eea7-bdc31bfa40ca@xen.org>
In-Reply-To: <0adb27f2-dee8-310a-eea7-bdc31bfa40ca@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/09/2022 16:22, Julien Grall wrote:
> Hi Carlo,
> 
> I haven't fully reviewed the patch yet. Just point out a couple of 
> things I noticed while looking how you dealt with the relocation (I need 
> some code to test my series :)).
> 
> On 26/08/2022 13:51, Carlo Nonato wrote:
>> -#ifdef CONFIG_ARM_64
>> +#ifdef CONFIG_CACHE_COLORING
>> +    /* Copy Xen to the new location */
>> +    memcpy((void *)BOOT_RELOC_VIRT_START, (const void *)XEN_VIRT_START,
>> +           (_end - _start));
> 
> If I am not mistaken, at this point, Xen will still be using the stack 
> that is part of Xen binary (see cpu0_boot_stack). However, until the 
> point switch_ttbr() is called the stack can still be used. In particular...
> 
>> +    clean_dcache_va_range((void *)BOOT_RELOC_VIRT_START, (_end - 
>> _start)); > +
>> +    ttbr = virt_to_maddr_colored((vaddr_t)xen_pgtable);
>> +#elif CONFIG_ARM_64
>>       ttbr = (uintptr_t) xen_pgtable + phys_offset;
>>   #else
>>       ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
>> @@ -530,6 +610,18 @@ void __init setup_pagetables(unsigned long 
>> boot_phys_offset)
> 
> ... the compiler may need to save some information on the stack. And 
> then...
> 
>>       switch_ttbr(ttbr);
> 
> ... restore it after switch_ttbr(). Xen will be using a different stack 
> (same virtual address but different physical address) so the wrong value 
> will be loaded.
> 
> I am not aware of any guaranteed from the AAPCS{32, 64} that this can 
> point (please provide a pointer if I am wrong). So I think we either 

s/point/not happen/

> want to copy the new Xen to the correct position in the assembly.
> 
> This means we would want to revive partially f60658c6ae47 "xen/arm: Stop 
> relocating Xen".
> 
> Cheers,
> 

-- 
Julien Grall

