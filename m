Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8666CB5896
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 11:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183857.1506441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTe4O-0003qf-Nh; Thu, 11 Dec 2025 10:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183857.1506441; Thu, 11 Dec 2025 10:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTe4O-0003oR-Ks; Thu, 11 Dec 2025 10:38:48 +0000
Received: by outflank-mailman (input) for mailman id 1183857;
 Thu, 11 Dec 2025 10:38:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BerU=6R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTe4N-0003oL-1u
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 10:38:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91a58c2e-d67d-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 11:38:45 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 02B774EEBF88;
 Thu, 11 Dec 2025 11:38:43 +0100 (CET)
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
X-Inumbo-ID: 91a58c2e-d67d-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765449524;
	b=1B60xamV09W0Ps+3VZTcJdmns73IBm75IeDmQ5mGbG1sHUb4JpkMU0xSGcWUNdsxcTWB
	 fblknHC2DOHJAJhj7fBaYyfRAJsO7IPO34dZCptEBr0ngYWaYzE9CeA4MldJZnfCYxNmW
	 6+eqW6UCktEfnFbywcRvXmzla9OEDy3Ktk/2HFXyyVyZXKKClxMOYsg+4Ww94IBIGY8SL
	 mN6UHOjxAbGLDQqFo5qtKtCRSw0dtn85gEFz5dPeW9nadTT/V5Uvndc042Xxe0IgkCuC8
	 VBVdrHnlBn1pxmlDEMchprjjBBfdz/Immk8W+rLrXo6NkO87AJc9/JvM7HIC3lSnfbcHx
	 4DgpJgc3Qbf+7gzUBqtjqBAP6yOZJrrZtvQc8JzbpLHL/Xm7Cazq2/zGCJK6hl4ghL64H
	 HrghFUGZpfTfC6r6TFylU9Xz7CbaygmxYWqUPxb3JvzlxPfxiPCbCJ8SSW95s7niHFEpR
	 L6gM1Tm1gPHdjKlQO/5tp8+DovU9cu1vzef/WjhMYkSTwQBXgq9gqcwfVTtOz8Jq1SGcF
	 y3vJGoB24t+PbDcCDJuE3KwP8U5DVJJ/b+1hG4fLNCMsNQ/1kWHSlPH/vpSk6sPNt82qn
	 sfa2T6K9XoX1Lo+KrIRRmf2GjI4brR7Gl1c2K0Y9JbYPpFnYedh/Uw0mhlw/7j8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765449524;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=QQUmeSUY54y6e/gZRXgXNlQ42fOtBeg2u5S4xEHZrW4=;
	b=095EPJGfEAx4Ar6A1+h800b3LXCu3/adQFroisRhHZ+XBfALx9UubVbDO4BcyOrnCImn
	 Eyqyj9fgUCkH05tnCTnCOMFPQQHcdDjgINHyjA0KqxiNnW3eTjolqamBzFWQuNbxqRswF
	 +ephyJ8lgvtvzUQn+0+UshqkOOerK05VzSi5uwWALw7qisyVNwR9s4mQbvTtK+zPGXC4u
	 nQ+XA7V9n1b/G0bJyYFCNx1LizaJIKBFH942bmITkb+OjX9tkKbdxp+9ikKlN9x0I7MUT
	 wjCof7MJW8BbziAUxEv8bgyfJC2HIMy7azDlTIi/qHF04RJ/IE5Gevrbbjif3xDMJ/IrE
	 VH7r47sjoJZxOE8f4OVxJJOM9i6NdXDxCkGd/PUgW1Z+A4Bn932HH85HHc5V7L4tE/2gz
	 6IahuPJKlm6AyWchdudTZZKh1H9FaZFny9zjsDymLR4fY3tEfz/bw7I6rPJh1mkR9vCHd
	 w0SBHPm0NY0Q6lN/7O87xoiNO8stC9KlWjB2nMktPeIZCpxKyikrJj3s1lpEqdpf9UpOu
	 DbBdRfguzdZAHP1EDiEJZ3MtMJYe40VtWDZxLTtyMkxqNZ6G6k/v10DFlA/v9bZ/AeDkT
	 OA55KfeMucoajMhjW+ulicBnsbOycSXeOrWIbrWtX1r3Eawok478Zuh/vM1UZ/o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765449524; bh=FearIX+GF0kUzySgx1VItg3wefPuHp6k0C6M3N6ybrE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rJ7+Z1eG4qZYv4bl9ozfdATUrdFkvMJbSj2hdPlpBZCcRvjpoz9M0+0d3rXrNd0Ll
	 WZBuVbE4mLH5ZsHwNxSoKIJK4AokRSIarf8bcVRXeI7VnBQMXDSOhj9MLs8t1+8MJK
	 r/H4vy080jbQxxfnKi43hdK3txDwAIhRsu4iiaAYPGx/0d2lh6Qi4s6LF6FQmTzZTK
	 k9u6VvSaOUVS4iWMb0bgPR354Tk3MhlSqJUznPmiWBioPGPeCLCaxUEBldNTHGUpzv
	 zl3lOlFoVrWwYHGWYM0XAHF7a3JmDeA71ndNzRMJ6Nhcg9OcD5SDZBiq3Ka9JVPaib
	 mGWpYSofY0N0g==
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 11:38:43 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
In-Reply-To: <d2988b31-66e0-4a6b-8f77-4ae2cf2c4bd4@suse.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-6-andrew.cooper3@citrix.com>
 <5a4695fa-1520-4d52-adc3-72c159892e33@suse.com>
 <fdf95d1d02274a6442d4eb4c6b7284b8@bugseng.com>
 <d2988b31-66e0-4a6b-8f77-4ae2cf2c4bd4@suse.com>
Message-ID: <9aee3813bc96718ce0d772ead4f0578f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-11 10:30, Jan Beulich wrote:
> On 11.12.2025 10:15, Nicola Vetrini wrote:
>> On 2025-12-11 09:36, Jan Beulich wrote:
>>> On 10.12.2025 19:30, Andrew Cooper wrote:
>>>> With the wider testing, some more violations have been spotted.  
>>>> This
>>>> addresses violations of Rule 20.7 which requires macro parameters to
>>>> be
>>>> bracketed.
>>>> 
>>>> No functional change.
>>>> 
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: consulting@bugseng.com <consulting@bugseng.com>
>>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>>  xen/arch/x86/mm/shadow/multi.c     | 2 +-
>>>>  xen/arch/x86/mm/shadow/private.h   | 6 +++---
>>>>  xen/drivers/passthrough/vtd/dmar.h | 2 +-
>>>>  xen/include/xen/kexec.h            | 4 ++--
>>>>  4 files changed, 7 insertions(+), 7 deletions(-)
>>>> 
>>>> diff --git a/xen/arch/x86/mm/shadow/multi.c
>>>> b/xen/arch/x86/mm/shadow/multi.c
>>>> index 03be61e225c0..36ee6554b4c4 100644
>>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>>> @@ -781,7 +781,7 @@ do {
>>>>                      \
>>>>          (_sl1e) = _sp + _i;
>>>>   \
>>>>          if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )
>>>>   \
>>>>              {_code}
>>>>   \
>>>> -        if ( _done ) break;
>>>>   \
>>>> +        if ( (_done) ) break;
>>>>   \
>>> 
>>> I don't understand this: There are parentheses already from if()
>>> itself.
>> 
>> Yeah, syntactically there are, but those are parsed as part of the if,
>> rather than its condition; the AST node contained within does not have
>> parentheses around it.
> 
> I fear I don't follow. Besides us not using parentheses elsewhere when
> if() is used like this macros, the point of requiring parentheses is 
> (aiui)
> to make precedence explicit. There already is no ambiguity here due to 
> the
> syntactically require parentheses in if(). Why would a rule and/or the
> tool require redundant ones?
> 

this is parsed as (more or less) "if_stmt(integer_literal(0))" rather 
than "if_stmt(paren_expr(integer_literal(0)))" when the macro is invoked 
with 0 as parameter _done. Now, syntactically the parentheses are in the 
source code, so the letter of the rule is satisfied (as long as there is 
a single condition in the if condition), but the presence of those 
parentheses is lost when parsing. I see how this can be seen as a false 
positive, and we will definitely add some special handling so that cases 
like this are properly recognized, but for simplicity here I would add 
some extra parentheses, at least until the false positive is not 
resolved

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

