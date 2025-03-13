Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0DA60179
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 20:43:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913434.1319476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoT3-0002wi-0y; Thu, 13 Mar 2025 19:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913434.1319476; Thu, 13 Mar 2025 19:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoT2-0002uf-Tq; Thu, 13 Mar 2025 19:43:44 +0000
Received: by outflank-mailman (input) for mailman id 913434;
 Thu, 13 Mar 2025 19:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8/y=WA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tsoT1-0002to-Ib
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 19:43:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7707e5fd-0043-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 20:43:41 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 2C9704EF54C0;
 Thu, 13 Mar 2025 20:43:39 +0100 (CET)
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
X-Inumbo-ID: 7707e5fd-0043-11f0-9898-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1741895020;
	b=X8wNtUEOpWyHeEkc3nDhYtyvLAlL9xlCOBqHVNJ1uBRJWFmtkEYRnBs8/DE8hrglQU4x
	 sYxE2ly8XUD1eZ2gjqj6JyWZknZDXVJbP9IToStrbWAnaCIfrZU0AkckuqGigrHZB508b
	 03N0i3NHiHSjivMP3I8aPRKOSy9wcwe7Htd9lvyMvx2CCXXEFGeEOFFZIlOC8MSJcILLu
	 wMyTSigwLEYQuZQV+b8twI+WeUwpCLXA/44u/sim7OiIWoSgUAj7jvpsUm2yVxbYKizlM
	 IRiUiudybQe2C/6aBih4uyxI+NAF/KnqVDuOpHLpomv8PX22eblnJ33IUuyQvAdYlQXG6
	 nzXWRdXAgTxtdnrc5oDx5E9xPj4nNPtM+7v+4czwaK1TvDuz5nAnMrIX88anfhYk3ROQn
	 bCpxqf0Cbqb/iu2tc2DduIeJPwUhNSimCmY5PAzdzxFxUfuK0QTn4tQgR7RdjbLYWMbaw
	 lVboO9F8mpzhHx8vOGMz3TSYE7edL47Rqzm1GRhfI6GDzulJ0QGuirnZiCQH4uhGtD62T
	 OItp1AQQ0Ch7E1wYypLIJFDXWxPVcXEYmJDauytI4niGiSklYhcgVA8eIYxUDsKTNcHA0
	 GZ/lIFjYE/y3c3SOiugFxGnpdw0712sozcQpHJiT84U1jcfyUoJQa6xS1Gdf6z4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1741895020;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=4Hg4rEQIz84i3eXNf89kUyROq9+jTMVjGNOvXEybiMw=;
	b=h4AURNqKFbgAY9fF+venZfbNaol+bRXICygNTOmIOnq4BTdItHBRXuHuWMzsmJiojhRR
	 PIsjpsgo73I7blNtEuWyp4V7ha80gr2qheN3UhFoQkl2lLTRLoPSTugujl68/3mtpHag3
	 wUHfNuRO8fm6pQJNWcTVCJ5e7/Tjo2yu5TO/5X7jFNH62xDlCXem/XXVu46x2Zi4LGepd
	 r8YOpWy/IriaVPeReN+Cx4DKBelFosWC39beOn46wnkbqb0Neg3DsYR27ldAfxITIr9OV
	 epBzPC2z51wxTfVToYWbUrkfmhL2OaSJbDcx2QGQAVawmJJ8c2XgzfImbjzmVkAS9E4pW
	 Yj1TXhMykcCFAfOD7fYGgBDX41StNLAAS708+r44XH92o1kuZJoy6qaCzu4kyh4uLNBa2
	 bO+iQZR/EYAuteoHNxL8XhhRABQgz298+DpEIKMupEU0diX12TdFXRRpytoXyRD7Xhs7E
	 1JA0A3PcDWYLuuGgdoa51Attn6ouMRjbfdqVsUj/m/q4Zn1N1Esa42k2pNhFkbPtiuRKH
	 ik98LCCq7If7MVY5cMkj3DyntB/hZDdRCfC10fN7xlP2Kkp97CY35ALh7FB74D6UNy6+x
	 TjNMlGVyqeI1DH3mG4F3RklLMtKohKQChiqZ4oCPeOIz8RWxFHVJewE9SNtl1Xc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1741895020; bh=lUOB01YNEw9qTXvoGTZHuuGCOfb3ipeH09EfpWibOEc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u3Nmz6Br1zi6KcQdjhi/nziE1mMZcCNeYgQDBMup5ESo8N2+Y29lO/OT3gBYV9UxZ
	 VvdAjbA6WajBdBz679NrKv8m3EeFqtQJptH3PAZzzqpoL8YrieBdBi33G/SmbWo5Pj
	 ttMtkmzHzYPaZROdPthHNoZLjQOP+W7tZsey8r+WjCJAJmYIpgZZxiOU9dPt+vsiUO
	 8GxxWE0g/5tQcRc6RfrNqo/HTkyOtlsjsRDjcgQlJzrjNcgr6Qup1YeW/4oohYMsks
	 Y3+59zGDzmqpGSiKyjnHEHr7ESZ4TmpRvr3FnvEyA812MdJt98MULIGDdV5CNAQnS4
	 aX997tlbhO1rw==
MIME-Version: 1.0
Date: Thu, 13 Mar 2025 20:43:39 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/8] xen/common: Split tlb-clock.h out of mm.h
In-Reply-To: <89fbb5ac-242a-4271-96ad-ea1bc8f77691@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-5-andrew.cooper3@citrix.com>
 <6d910ac4-cf1d-48ee-b088-17254d2272ab@suse.com>
 <89fbb5ac-242a-4271-96ad-ea1bc8f77691@citrix.com>
Message-ID: <8d8cdb19fc6eabc05329ad0e16da4d1a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-13 14:35, Andrew Cooper wrote:
> On 13/03/2025 12:59 pm, Jan Beulich wrote:
>> On 12.03.2025 18:45, Andrew Cooper wrote:
>>> xen/mm.h includes asm/tlbflush.h almost at the end, which creates a 
>>> horrible
>>> tangle.  This is in order to provide two common files with an 
>>> abstraction over
>>> the x86-specific TLB clock logic.
>>> 
>>> First, introduce CONFIG_HAS_TLB_CLOCK, selected by x86 only.  Next, 
>>> introduce
>>> xen/tlb-clock.h, providing empty stubs, and include this into 
>>> memory.c and
>>> page_alloc.c
>>> 
>>> No functional change.
>>> 
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> 
>>> There is still a mess here with the common vs x86 split, but it's 
>>> better
>>> contained than before.
>>> ---
>>>  xen/arch/x86/Kconfig        |  1 +
>>>  xen/common/Kconfig          |  3 +++
>>>  xen/common/memory.c         |  1 +
>>>  xen/common/page_alloc.c     |  1 +
>>>  xen/include/xen/mm.h        | 27 --------------------
>>>  xen/include/xen/tlb-clock.h | 49 
>>> +++++++++++++++++++++++++++++++++++++
>>>  6 files changed, 55 insertions(+), 27 deletions(-)
>>>  create mode 100644 xen/include/xen/tlb-clock.h
>>> 


>> However, see below.
>> 
>>> +        arch_flush_tlb_mask(&mask);
>>> +    }
>>> +}
>>> +
>>> +#else /* !CONFIG_HAS_TLB_CLOCK */
>>> +
>>> +struct page_info;
>>> +static inline void accumulate_tlbflush(
>>> +    bool *need_tlbflush, const struct page_info *page,
>>> +    uint32_t *tlbflush_timestamp) {}
>>> +static inline void filtered_flush_tlb_mask(uint32_t 
>>> tlbflush_timestamp) {}
>> Is doing nothing here correct?
> 
> Yeah, it's not, but this only occurred to me after sending the series.
> 
> Interestingly, CI is green across the board for ARM, which suggests to
> me that this logic isn't getting a workout.
> 
>>  mark_page_free() can set a page's
>> ->u.free.need_tlbflush. And with that flag set the full
>> 
>> static inline void accumulate_tlbflush(
>>     bool *need_tlbflush, const struct page_info *page,
>>     uint32_t *tlbflush_timestamp)
>> {
>>     if ( page->u.free.need_tlbflush &&
>>          page->tlbflush_timestamp <= tlbflush_current_time() &&
>>          (!*need_tlbflush ||
>>           page->tlbflush_timestamp > *tlbflush_timestamp) )
>>     {
>>         *need_tlbflush = true;
>>         *tlbflush_timestamp = page->tlbflush_timestamp;
>>     }
>> }
>> 
>> reduces to (considering that tlbflush_current_time() resolves to 
>> constant 0,
>> which also implies every page's ->tlbflush_timestamp is only ever 0)
>> 
>> static inline void accumulate_tlbflush(
>>     bool *need_tlbflush, const struct page_info *page,
>>     uint32_t *tlbflush_timestamp)
>> {
>>     if ( !*need_tlbflush )
>>         *need_tlbflush = true;
>> }
>> 
>> which means a not-stubbed-out filtered_flush_tlb_mask(), with 
>> tlbflush_filter()
>> doing nothing, would actually invoke arch_flush_tlb_mask() (with all 
>> online CPUs
>> set in the mask) when called. And arch_flush_tlb_mask() isn't a no-op 
>> on Arm.
> 
> Yes.  Sadly, fixing this (without Eclair complaining in the middle of
> the series) isn't as easy as I'd hoped.
> 

Hi Andrew,

I didn't quite follow the whole thread (been busy the last couple of 
days), but could you explain briefly what's the issue here? Just a link 
to a failing pipeline should be fine as well.

>> I therefore think that while moving stuff into a separate header makes 
>> sense,
>> HAS_TLB_CLOCK isn't overly useful to introduce.
> 
> It takes a cpumask_t off the stack, because we can pass cpu_online_mask
> straight into arch_flush_tlb_mask(), and it removes a bitmap_copy that
> the compiler can't optimise out.
> 
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

