Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04CCB14E3F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062670.1428398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkBk-000271-SN; Tue, 29 Jul 2025 13:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062670.1428398; Tue, 29 Jul 2025 13:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkBk-00024i-Oz; Tue, 29 Jul 2025 13:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1062670;
 Tue, 29 Jul 2025 13:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AlSl=2K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ugkBj-00024b-62
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:16:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3347a2a9-6c7e-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 15:16:13 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8F38A4EE3C20;
 Tue, 29 Jul 2025 15:16:11 +0200 (CEST)
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
X-Inumbo-ID: 3347a2a9-6c7e-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753794971;
	b=rhnDTEH9YxSODIJ/+rTm+Zpmzt4b0QvoqSR43DnerRf0H6Ii1yDVZhXaeVHTF6hBwGub
	 dEnApiW/TQuKFkW7Z4ERzt/TnqW1ADMZv0kInnCc+0L7L2i6rHUOL1ZFVGmJ8AOJ/Lr0I
	 W1ENMZC973gQv4AeoUUjPZsewByAnXfyLBxe2KzfyCg01zEwt7OS7XpWQed/Y226cvaPg
	 8RNL+UdAzZd4WWd7KMZKJ/XqSEOdsuE+iPYWBTH2h7PLIcXM/Qlan6JYfvPWXJTPGWVeJ
	 eDFmRgwd6UhRvS4aHKSysqO7EWDbP59WDdKzt/VWH/gx93qcC2FLUeHMf2FZmSDLlyrvp
	 JZ2UOx75IUMVk39LQ2YgpUa4lBOEJWL0z6VB6DWZx0w93mQKAYcdkQ84wZIwmGk/Ec3bX
	 hPOjqs5ApTMPpwF/Cbz1LPCWl/z+bPws+5g7cVydtirXjJQDx1L7S/s1qBdzLk5Ve7O19
	 V1isx3IqobqU4+aIL4u/i/16/xWBmfHKMyE8bAsCcnIbVHeKm7RL34Z4Pod5M24PtgnuK
	 qYULwXv1mq+2LtTp/hNWHFDmhht8U/y5qOd8tyyHIwhtkrHDz6t2v6ycZrK3V/RVajynZ
	 ehCs9LUftz3v0YGGZMLd20WsZuDNGGBlaBNjF1MQu9uJ0hi6/QEljz1B9A8tYpE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753794971;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=A2y+0+zpLJGgSxMDpG7Gfpf2CEvhKgip/uW4B4SZFww=;
	b=dGkpJtJVKiiFw24tEDtAohL1FGNGsePzcO5aEKu5+0fuKEjASz2TK5v0ei+Wx+URmbKt
	 JXd+C9c+QYqq8FJ51hpGl1hMcftymR116IA9anpZWxbR5n5gK2c8nZjF/3CH+7qus+q0Y
	 01lc1NU3VMfgGbUHCI+LYsiQ9KjHOnKhYQpiP5rJaRarPv+UzzHQyvnAod0giROPG/FUl
	 8j+LM7e7ytOWTG4iJyhahR+qd30kxp4qml/t9jm0ySTwtvQQRLrmj/kT/5JnbH8nT9NS2
	 DCoFBagpd0tb3pyMYSAOMejTX+9/S4LsnnLQTzRMpgAq3iWuMWVW/dH/GmADL+hYWbj3S
	 X2O2g3cgEWJI8URVHRPZRw4SlWD88UUznpq2yvopyOSq1pcFiMlzBBci1ES1mV6NUdTZN
	 xY1PiJL1Q4J92q5V4SEC7uzzxK4LafW26UtPP6Aee3NQy34M3r3yK/A9IFtMnxwE0YJqd
	 hDM6H/N3mJBg0k/vMekVauIxfrMzpBB5a/xsOFLEKxt/A/JQD2Lum1PtVYrsrBiueBs7c
	 5P+STPcg3Dh1mmolo+dWgMKdbSjRfEIezXudu/ojIB2uFhWJZpXg4sKVeokpgIoe8tQPN
	 X4rKbITZRJMoGMFD/QigwU2okptox5ZTYnq7KwmpO1eKIEEofDffl8MF/20Mjgg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753794971; bh=hoEHeOHl/thNPq0MVd3CrVxMl276JsV7XSIiC6bQ4R8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Nsnyx71MK7iaubNUINE4ItYuJiYhGwa+6q2d+V3QAR3F6s97K9MJheHhUNhyE0vEu
	 +/F+QhbvR0hy8B+jV2nUTXvLGXpHEDbTihwXHH/NIgmimcUQhhiKT8GQo2lO4H3pLx
	 YRXDJGES9L3pMDBvQovEHt+UQcENzCplNwevxs1OuINdyGzVbXOvTqOu6FRHtY+HUA
	 nTW6ob2Kt4Z+6BkM3wV5r5d6pqWnJGM9UubpcWwFlyv8ORHVG4tYHysMjfFIlDJJRC
	 105XSzQ5kdJWQoO2FG7RZbBux3IFg7bNF8QalofBIlReBWmevzcI60Oibh5L7oHZgo
	 KcTDnWBtHuX9g==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 15:16:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
In-Reply-To: <f94586c9-fdf8-4d04-8490-1a9b1a57bcc2@suse.com>
References: <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
 <2ef0d0a9-065c-4288-badd-21de4cfc5d14@suse.com>
 <029ca331fd380a855aff95ae9cae799e@bugseng.com>
 <f94586c9-fdf8-4d04-8490-1a9b1a57bcc2@suse.com>
Message-ID: <df2d021f8b50989cf77ec226a6a5a9b4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-29 15:09, Jan Beulich wrote:
> On 29.07.2025 15:02, Nicola Vetrini wrote:
>> On 2025-07-29 14:39, Jan Beulich wrote:
>>> On 29.07.2025 14:21, Dmytro Prokopchuk1 wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -367,6 +367,13 @@ constant expressions are required.\""
>>>>  }
>>>>  -doc_end
>>>> 
>>>> +-doc_begin="The conversion from 'void noreturn (*)(void *)' to 
>>>> 'void
>>>> (*)(void *)' is safe
>>>> +because the semantics of the 'noreturn' attribute do not alter the
>>>> calling convention or behavior of the resulting code."
>>>> +-config=MC3A2.R11.1,casts+={safe,
>>>> +
>>>> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1,
>>>> pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
>>>> +   ref(property(noreturn)))))"}
>>>> +-doc_end
>>> 
>>> As I understand it, this is about any function, not just void (void 
>>> *)
>>> ones.
>>> Hence throughout anything textual in this patch, may I ask that this 
>>> be
>>> made
>>> explicit by inserting e.g. "e.g." everywhere?
>> 
>> Technically yes, in practice other implicit function pointer 
>> conversions
>> would be caught by -Wincompatible-pointer-types and similar flags so
>> they don't even come into play. However I agree that adding that is
>> clearer.
> 
> Perhaps a misunderstanding: With "any" I meant any which has a noreturn
> attribute, when converted to one with otherwise the same signature. But
> irrespective of the particular return type or parameter types (i.e.
> specifically not just void (void *) ones).
> 

Ah, sorry, I misunderstood. We check the destination type of the 
conversion with 
"to(type(pointer(inner(return(builtin(void))&&all_param(1, 
pointer(builtin(void)))))))". In principle it could be avoided but I 
think that at the moment it's ok as it is, then if it needs to be 
extended when more cases emerge I can do that.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

