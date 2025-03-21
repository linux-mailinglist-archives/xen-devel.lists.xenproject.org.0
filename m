Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A9EA6C5F6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 23:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924600.1327725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvks7-0001cf-E7; Fri, 21 Mar 2025 22:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924600.1327725; Fri, 21 Mar 2025 22:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvks7-0001af-Bc; Fri, 21 Mar 2025 22:29:47 +0000
Received: by outflank-mailman (input) for mailman id 924600;
 Fri, 21 Mar 2025 22:29:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvks6-0001aZ-2l
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 22:29:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvks6-00HGhL-01;
 Fri, 21 Mar 2025 22:29:45 +0000
Received: from [2a02:8012:3a1:0:d473:3eed:4e56:a8b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvks5-00FIja-1w;
 Fri, 21 Mar 2025 22:29:45 +0000
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
	bh=Zt9ubl7uDBma7HfJv2VLK3JIyEWacKkKO0y4q0StrXY=; b=yCzekkQUWdc3W5tNhZ2teRRVUM
	psnJL0EqdUu5vj4YTaJEn6wPqudtwKMzjeeckwAoIIHiihdSTCjqWJQIeTQe/9enHy8qp0qNAjrlq
	kgQv59lUtG3sSFETtvrNHvPTiMWXjwEpxySF2ohfd06pixpIC/druuBUf3EP2wh26eN8=;
Message-ID: <db10c2e3-2791-4945-af62-b6901d5f8f5d@xen.org>
Date: Fri, 21 Mar 2025 22:29:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm/efi: merge neighboring banks
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.22.394.2503211403040.2325679@ubuntu-linux-20-04-desktop>
 <85ac456a-ae11-4a04-8d73-dfafba04de98@xen.org>
In-Reply-To: <85ac456a-ae11-4a04-8d73-dfafba04de98@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/03/2025 22:22, Julien Grall wrote:
> Hi Stefano,
> 
> On 21/03/2025 21:14, Stefano Stabellini wrote:
>> When booting from U-Boot bootefi, there can be a high number of
>> neighboring RAM banks. See for example:
>>
>> (XEN) RAM: 0000000000000000 - 0000000000bfffff
>> (XEN) RAM: 0000000000c00000 - 0000000000c00fff
>> (XEN) RAM: 0000000000c01000 - 0000000000dfffff
>> (XEN) RAM: 0000000000e00000 - 000000000279dfff
>> (XEN) RAM: 000000000279e000 - 00000000029fffff
>> (XEN) RAM: 0000000002a00000 - 0000000008379fff
>> (XEN) RAM: 000000000837a000 - 00000000083fffff
>> (XEN) RAM: 0000000008400000 - 0000000008518fff
>> (XEN) RAM: 0000000008519000 - 00000000085fffff
>> (XEN) RAM: 0000000008600000 - 0000000008613fff
>> (XEN) RAM: 0000000008614000 - 00000000097fffff
>> (XEN) RAM: 0000000009800000 - 00000000098a7fff
>> (XEN) RAM: 00000000098a8000 - 0000000009dfffff
>> (XEN) RAM: 0000000009e00000 - 0000000009ea7fff
>> (XEN) RAM: 0000000009ea8000 - 000000001fffffff
>> (XEN) RAM: 0000000020000000 - 000000002007ffff
>> (XEN) RAM: 0000000020080000 - 0000000077b17fff
>> (XEN) RAM: 0000000077b19000 - 0000000077b2bfff
>> (XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
>> (XEN) RAM: 0000000077c8e000 - 0000000077c91fff
>> (XEN) RAM: 0000000077ca7000 - 0000000077caafff
>> (XEN) RAM: 0000000077cac000 - 0000000077caefff
>> (XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
>> (XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
>> (XEN) RAM: 0000000077cd8000 - 000000007bd07fff
>> (XEN) RAM: 000000007bd09000 - 000000007fd5ffff
>> (XEN) RAM: 000000007fd70000 - 000000007fefffff
>> (XEN) RAM: 0000000800000000 - 000000087fffffff
>>
>> It is undesirable to keep them separate, as this approach consumes more
>> resources.
> 
> What resources? This is pre-allocated static array in the binary. They 
> are also dropped after init. The more interesting argument is...
> 
>>
>> Additionally, Xen does not currently support boot modules that span
>> multiple banks: at least one of the regions get freed twice. The first
>> time from setup_mm->populate_boot_allocator, then again from
>> discard_initial_modules->fw_unreserved_regions. With a high number of
>> banks, it can be difficult to arrange the boot modules in a way that
>> avoids spanning across multiple banks.
> 
> ... this one. Although, I find weird that U-boot would create tons of 
> banks. Have you considered to ask them what's going on?
> 
> Also, what about the cases where U-boot is not booting Xen without UEFI? 
> Why is this not a problem? Asking just in case the merge should happen 
> in code common rather than in UEFI.
> 
>>
>> This small patch merges neighboring regions, to make dealing with them
>> more efficient, and to make it easier to load boot modules.
> 
> While I understand the value for this, I ...
> 
>> The patch
>> also takes the opportunity to check and discard duplicates.
> 
> don't understand why we need to check for duplicates. This also doesn't 
> properly work for a few reasons:
>    * This doesn't cover partial overlap
>    * This would not work if an entry was merged with another previously
> 
> So I think the code to check duplicates should be removed. If you are 
> concerned about overlap, then it would be better to enable 
> check_reserved  just drop the code. If you are concerned about to detect 
> and warn/panic.

What I wrote is a bit mangled. I meant that if you are concern about 
duplicates then it would be better to check if there is an overlap and
either warn or panic.

Cheers,

-- 
Julien Grall


