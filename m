Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0FC81454
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171434.1496439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYHs-0000CE-8X; Mon, 24 Nov 2025 15:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171434.1496439; Mon, 24 Nov 2025 15:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYHs-00009c-5r; Mon, 24 Nov 2025 15:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1171434;
 Mon, 24 Nov 2025 15:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWoN=6A=bounce.vates.tech=bounce-md_30504962.6924768f.v1-be97a69976e1431bad4d73e6c83dd8a0@srs-se1.protection.inumbo.net>)
 id 1vNYHq-00009U-ET
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:15:30 +0000
Received: from mail8.wdc04.mandrillapp.com (mail8.wdc04.mandrillapp.com
 [205.201.139.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68d5f77d-c948-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 16:15:28 +0100 (CET)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail8.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4dFTsW1Xm8z3sNRHG
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 15:15:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 be97a69976e1431bad4d73e6c83dd8a0; Mon, 24 Nov 2025 15:15:27 +0000
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
X-Inumbo-ID: 68d5f77d-c948-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763997327; x=1764267327;
	bh=sdb4nF8xjPoi1bLfu+Y4Eb1S0OoGU8HrJP8IN24c6wc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JAEuJUY8KqHk01fu+0fIh2P8YyddcvWfy1VzhAchL0nTAA26zT6WYo4r7sSSPKlqJ
	 Hqe2zbBXgKrV+t39tsFRNblaH2o9S0A9+XP3bXGp+K3slB8tRpSv7zxjS9Q7gxFJXl
	 dhulIyFYTAY/GE9A8ZMwPRNaFSX9Q5Hw8KMYOqJ1PV/TygB36MO7fFD0jMthPkuXIv
	 Y3bVKeps0odu3x0xKMBtkMA1cT15JBXvhbQhZGz7swYGQwsijYNeO0BJicq8cPNIbC
	 roT/n/TUrWTHebxtK7mja9pGlYb3rkanJCpQCaduP7+aloansInftBTQ78sMucH2dQ
	 izPFDnlZqhL2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763997327; x=1764257827; i=ngoc-tu.dinh@vates.tech;
	bh=sdb4nF8xjPoi1bLfu+Y4Eb1S0OoGU8HrJP8IN24c6wc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZIkQ6tsYz7mYBn5hx8a/JA8kf0u9exSJI6liwcCVP5mpdJz/chZ9tHEUsvjJmqQv/
	 3egGsY67PNa1lAcne1yXGDYNAz3TJs+Ufgso9wtfYwYWRwLl12WbxeBzB99xZPMPak
	 1n06Kyi6RsDDFJCLzJKytTlaN800EY8BjIlbtRgPC+cclJ1XA+pgDoSWxpwKYKGeru
	 p6mQa2WgqRCmZ9NYKqd8EIQjCOyNjZqw9W++SsCnSUlSdOqrC+HFDdYdVjhL+rktfu
	 EQoi3+9hhCHcQF81y1fMk+l9r82vkixB3004DsZA+qGtBCYjceSJJ31oUJS9Fp0axt
	 /+PaYrJ5pEapw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/vhpet:=20Fix=20sanitization=20of=20legacy=20IRQ=20route?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763997326201
Message-Id: <5a64e80b-f1d5-4826-85dd-cba9e7522e4c@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20251124134344.456-1-ngoc-tu.dinh@vates.tech> <8581c3ce-e0f7-41e5-aee7-cf607f8f338d@suse.com> <143076ee-6ade-4fe8-924a-a2b8a5af1a5f@vates.tech> <98c23088-a40f-41eb-9a10-3d310cfba255@suse.com>
In-Reply-To: <98c23088-a40f-41eb-9a10-3d310cfba255@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.be97a69976e1431bad4d73e6c83dd8a0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251124:md
Date: Mon, 24 Nov 2025 15:15:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 24/11/2025 16:09, Jan Beulich wrote:
> On 24.11.2025 16:02, Tu Dinh wrote:
>> On 24/11/2025 15:53, Jan Beulich wrote:
>>> On 24.11.2025 14:43, Tu Dinh wrote:
>>>> When setting a timer's config register, timer_sanitize_int_route will
>>>> always reset the IRQ route value to what's valid corresponding to the
>>>> !HPET_CFG_LEGACY case. This is applied even if the HPET is set to
>>>> HPET_CFG_LEGACY.
>>>>
>>>> When some operating systems (e.g. Windows) try to write to a timer
>>>> config, they will verify and rewrite the register if the values don't
>>>> match what they expect. This causes an unnecessary write to HPET_Tn_CFG.
>>>>
>>>> Note, the HPET specification states that for the Tn_INT_ROUTE_CNF field:
>>>>
>>>> "If the value is not supported by this prarticular timer, then the value
>>>> read back will not match what is written. [...] If the LegacyReplacement
>>>> Route bit is set, then Timers 0 and 1 will have a different routing, and
>>>> this bit field has no effect for those two timers."
> 
> According to this, ...
> 
>>>> Therefore, Xen should not reset timer_int_route if legacy mode is
>>>> enabled, regardless of what's in there.
>>>
>>> Fixes: ec40d3fe2147 ("x86/vhpet: check that the set interrupt route is valid")
>>> (I think)
>>
>> Yes, thanks.
>>
>>>
>>>> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
>>>> ---
>>>>    xen/arch/x86/hvm/hpet.c | 11 ++++++++---
>>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> --- a/xen/arch/x86/hvm/hpet.c
>>>> +++ b/xen/arch/x86/hvm/hpet.c
>>>> @@ -48,6 +48,8 @@
>>>>    #define timer_is_32bit(h, n)     (timer_config(h, n) & HPET_TN_32BIT)
>>>>    #define hpet_enabled(h)          ((h)->hpet.config & HPET_CFG_ENABLE)
>>>>    #define timer_level(h, n)        (timer_config(h, n) & HPET_TN_LEVEL)
>>>> +#define timer_is_legacy(h, n) \
>>>> +    (((n) <= 1) && ((h)->hpet.config & HPET_CFG_LEGACY))
>>>>    
>>>>    #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n), HPET_TN_ROUTE)
>>>>    
>>>> @@ -244,7 +246,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
>>>>             (timer_level(h, tn) && test_bit(tn, &h->hpet.isr)) )
>>>>            return;
>>>>    
>>>> -    if ( !timer_int_route_valid(h, tn) )
>>>> +    if ( !timer_is_legacy(h, tn) && !timer_int_route_valid(h, tn) )
>>>
>>> Seeing this and the other use together with timer_int_route_valid(),
>>> wouldn't timer_int_route_valid() better itself invoke the new macro?
>>
>> I thought about it, but I found that it was overloading the definition
>> of timer_int_route_valid a little too much. Since timer_is_legacy() is
>> being used by itself later anyway, I figured it'd be better to just
>> separate the two.
> 
> ... the route setting is valid (because of being ignored) when in legacy
> mode. Hence why I think the check wants integrating there.

Okay, I can offload the check there.

> 
>>>> @@ -379,6 +381,9 @@ static int cf_check hpet_write(
>>>>            h->hpet.config = hpet_fixup_reg(new_val, old_val,
>>>>                                            HPET_CFG_ENABLE | HPET_CFG_LEGACY);
>>>>    
>>>> +        for ( i = 0; i < HPET_TIMER_NUM; i++ )
>>>> +            timer_sanitize_int_route(h, i);
>>>
>>> Strictly speaking this is needed only when HPET_CFG_LEGACY went from
>>> 1 to 0. Plus it's needed only on the first 2 channels, as it's only
>>> there where timer_sanitize_int_route() changes behavior. I'm not going
>>> to insist to limit it like this, but if you don't, then I'd like to ask
>>> for a comment here clarifying that excess work is done for simplicity's
>>> sake.
>>
>> Agreed, I can limit it to i <= 1.
> 
> May I ask that you avoid such open-coding and use timer_is_legacy(h, i) as
> the loop continuation expression instead?

That wouldn't work as timer_is_legacy would check for hpet.config & 
HPET_CFG_LEGACY, whereas we want to sanitize in the opposite case, i.e. 
!(hpet.config & HPET_CFG_LEGACY).

It's probably better to use i < HPET_TIMER_NUM and add a comment as you 
suggested.

> 
> Jan



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


