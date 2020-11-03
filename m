Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C52A5770
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 22:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18726.43728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka44p-0006z8-M0; Tue, 03 Nov 2020 21:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18726.43728; Tue, 03 Nov 2020 21:42:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka44p-0006yj-IV; Tue, 03 Nov 2020 21:42:51 +0000
Received: by outflank-mailman (input) for mailman id 18726;
 Tue, 03 Nov 2020 21:42:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9NW0=EJ=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1ka44o-0006yb-3J
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 21:42:50 +0000
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63cf9b9f-aa78-4083-8b83-91223c99b922;
 Tue, 03 Nov 2020 21:42:49 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p3so16719348qkk.7
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 13:42:49 -0800 (PST)
Received: from [100.64.72.4] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id i70sm60359qke.11.2020.11.03.13.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 13:42:48 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9NW0=EJ=gmail.com=persaur@srs-us1.protection.inumbo.net>)
	id 1ka44o-0006yb-3J
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 21:42:50 +0000
X-Inumbo-ID: 63cf9b9f-aa78-4083-8b83-91223c99b922
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 63cf9b9f-aa78-4083-8b83-91223c99b922;
	Tue, 03 Nov 2020 21:42:49 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p3so16719348qkk.7
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 13:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=wWBQuSmJ0RTFNuUYO+pCJ1rcL0RhxzAkjUXcspA1ppE=;
        b=rQM8Tn2pN8ZyBdUJRsjhDny2ytxhm2MuAbXN780M+BUUf7eEc8RMXpxkP4iH9f+li2
         iTmhQ0eyat3WhttVH1KCaGBX8PqSyLlNZLaKSNuv/nVOKsF+sSU6nqtz8qvjUt25zKsz
         AQfCU40VxqO/OTxTP1hOa/9x+/4KQRIb6GjB7xW6w9lwAO/xHA8MIyOCygsipqTBr+C8
         wQqhCitx3klBBm2o0qZeRltgXa1MzbNWyuPxMgUkOko78X10ye/oEzo8SHhFpU/H99Kr
         eJ6yhz1wggBID9O5kN8dcXOVTqO9T+BaGimWNwwBLVF+pJPsb04WHHgYd4Qn4X0240nn
         uaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=wWBQuSmJ0RTFNuUYO+pCJ1rcL0RhxzAkjUXcspA1ppE=;
        b=SBURcn8Sx/DHw8y0L9kPzpeT8m4caMpVvYK1tpo1zubiQxWD/C7zO/i27EJziO69A1
         R+1CryUMah8qZClZQ4aXCrf/CfETZFxYfLIzsRALR2Kn+FvYDhGAdj9Lh+gZvXQz9hbb
         HUDa2B1IXCTorKJxmxOyh5PRDJdZdhaJJ7EFwq04SZ4k0OFX6/rPPd29tVHdY4nA87RG
         sUZqBqVfAr/kjNyrboU6i3ND+FuXrli8q4WcqubNJywQqel+inS1rJdpKwug40UDmDSm
         u7UbdlCxuv68e792BBLW4e4xzimoeg3COPdZocNzVjge3Qe9/4EznCBzypF3Boe94HpT
         EPMA==
X-Gm-Message-State: AOAM5337iR+UUAtj7C5c/Nru6/V9R+HJmOohl2HpGW75JJcqavtKqEzt
	wydN/WCGf3t/spwkVjR+aI0LC5p5mQXgZw==
X-Google-Smtp-Source: ABdhPJzY7pCaUi5h6Dxzb8SA6w24n13qI3HvvmQ9RdK18UKWhEaJ1pPJ4lgEkjsmFloKR+enOvewWQ==
X-Received: by 2002:a37:652:: with SMTP id 79mr21286241qkg.163.1604439768588;
        Tue, 03 Nov 2020 13:42:48 -0800 (PST)
Received: from [100.64.72.4] ([173.245.215.240])
        by smtp.gmail.com with ESMTPSA id i70sm60359qke.11.2020.11.03.13.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 13:42:48 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
Date: Tue, 3 Nov 2020 16:42:47 -0500
Message-Id: <2A013D8F-C5C3-44E9-8113-1932434D9DDA@gmail.com>
References: <alpine.DEB.2.21.2011031307430.5812@sstabellini-ThinkPad-T480s>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, George.Dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org,
 Daniel DeGraaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Roman Shaposhnik <roman@zededa.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
In-Reply-To: <alpine.DEB.2.21.2011031307430.5812@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: iPhone Mail (18A8395)



> On Nov 3, 2020, at 16:15, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> =EF=BB=BFOn Tue, 3 Nov 2020, Rich Persaud wrote:
>>> On Nov 3, 2020, at 14:37, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> =EF=BB=BFOn Tue, 3 Nov 2020, Jan Beulich wrote:
>>>>> On 02.11.2020 22:41, Stefano Stabellini wrote:
>>>>> On Mon, 2 Nov 2020, Jan Beulich wrote:
>>>>>> On 31.10.2020 01:24, Stefano Stabellini wrote:
>>>>>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
>>>>>>>     SBSA Generic UART implements a subset of ARM PL011 UART.
>>>>>>>=20
>>>>>>> config ARM_SSBD
>>>>>>> -    bool "Speculative Store Bypass Disable" if EXPERT
>>>>>>> -    depends on HAS_ALTERNATIVE
>>>>>>> +    bool "Speculative Store Bypass Disable"
>>>>>>> +    depends on HAS_ALTERNATIVE && EXPERT
>>>>>>>   default y
>>>>>>=20
>>>>>> At the example of this, I'm afraid when the default isn't "n"
>>>>>> (or there's no default directive at all, as ought to be
>>>>>> equivalent to and preferred over "default n"), such a
>>>>>> transformation is not functionally identical: Before your
>>>>>> change, with !EXPERT this option defaults to y. After your
>>>>>> change this option is unavailable (which resolves to it being
>>>>>> off for all consuming purposes).
>>>>>>=20
>>>>>> IOW there are reasons to have "if ..." attached to the prompts
>>>>>> (for this construct indeed only making the prompt conditional,
>>>>>> not the entire option), but there are also cases where the
>>>>>> cleanup you do is indeed desirable / helpful.
>>>>>=20
>>>>> Yeah, thanks for catching it, it is obviously a problem.
>>>>>=20
>>>>> My intention was just to "tag" somehow the options to EXPERT so that i=
t
>>>>> would show on the menu. Maybe a better, simpler, way to do it is
>>>>> to add the word "EXPERT" to the one line prompt:
>>>>>=20
>>>>> config ARM_SSBD
>>>>> -    bool "Speculative Store Bypass Disable" if EXPERT
>>>>> +    bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
>>>>>   depends on HAS_ALTERNATIVE
>>>>>   default y
>>>>>   help
>>>>>=20
>>>>>=20
>>>>> What do you think?
>>>>=20
>>>> While on the surface this may look like an improvement, I don't
>>>> see how it would actually help: If you read the Kconfig file
>>>> itself, the dependency is seen anyway. And on the menu I don't
>>>> see the point of telling someone who has enabled EXPERT that a
>>>> certain option is (or is not) an expert one. If they think
>>>> they're experts, so should they be treated. (It was, after all,
>>>> a deliberate decision to make enabling expert mode easier, and
>>>> hence easier to use for what one might consider not-really-
>>>> experts. I realize saying so may be considered tendentious; I
>>>> mean it in a purely technical sense, and I'd like to apologize
>>>> in advance to anyone not sharing this as a possible perspective
>>>> to take.)
>>>>=20
>>>> Plus, of course, the addition of such (EXPERT) markers to
>>>> future options' prompts is liable to get forgotten now and then,
>>>> so sooner or later we'd likely end up with an inconsistent
>>>> mixture anyway.
>>>=20
>>> I tend to agree with you on everything you wrote. The fundamental issue
>>> is that we are (mis)using EXPERT to tag features that are experimental,
>>> as defined by SUPPORT.md.
>>>=20
>>> It is important to be able to distinguish clearly at the kconfig level
>>> options that are (security) supported from options that are
>>> unsupported/experimental. Today the only way to do it is with EXPERT
>>> which is not great because:
>>>=20
>>> - it doesn't convey the idea that it is for unsupported/experimental
>>> features
>>> - if you want to enable one unsupported feature, it is not clear what
>>> you have to do
>>>=20
>>> So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
>>> the Kconfig menu?
>>>=20
>>> It would make it clearer that by enabling UNSUPPORTED you are going to
>>> get a configuration that is not security supported.
>>=20
>> If going down this path, there should be one, authoritative, in-tree defi=
nition of feature-level support from which Kconfig (build-time policy enforc=
ement) and SUPPORT.md (documentation) can be derived.  Later, even run-time e=
nforcement can be similarly classified.  FuSA may also wish for documented p=
olicy to align with enforcement.
>=20
> The goal is trying to align Kconfig and SUPPORT.md by clarifying the
> EXPERT option, which today is a poor implementation of "experimental".
>=20
> There could be further improvements down the line, for instance we could
> taint Xen when UNSUPPORTED is selected and even have separate kconfig
> options for UNSUPPORTED, EXPERIMENTAL, and TECHPREVIEW. FuSa is likely
> going to need its own SAFETY option too. Like you suggested, we could
> even have a single source of feature-level support information for both
> Kconfig and SUPPORT.md.
>=20
> However, I didn't want to increase the scope of this one patch. For now,
> it would be a good start if we replaced EXPERT with something that covers
> anything not security supported, for which UNSUPPORTED looks like a good
> name.

Kconfig UI is aimed at humans. There is a gulf of semantic difference betwee=
n EXPERT (human assessment based on local expertise and contextual prioritie=
s) and UNSUPPORTED (binary policy assertion independent of local context, wh=
ich can be parsed by computer).  We also have the supported-with-caveat cate=
gory of features in SUPPORT.md. =20

It's not clear that every human-interpreted instance of EXPERT should be rep=
laced by UNSUPPORTED, even if some instances may qualify.  It may be better t=
o have a separate patch which introduces a comprehensive set of labels with m=
atching policy statements.

Another option is to embed/copy SUPPORT.md feature support policy text into t=
he description field of relevant Kconfig menu options.  A human expert can t=
hen consider support criteria in their decision, informing consent for use o=
f "supported" (with/without caveats) and "unsupported" features.

Rich=

