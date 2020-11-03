Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F292A50B0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 21:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18678.43680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka2Yf-0006ZT-Rw; Tue, 03 Nov 2020 20:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18678.43680; Tue, 03 Nov 2020 20:05:33 +0000
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
	id 1ka2Yf-0006Z4-O9; Tue, 03 Nov 2020 20:05:33 +0000
Received: by outflank-mailman (input) for mailman id 18678;
 Tue, 03 Nov 2020 20:05:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9NW0=EJ=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1ka2Yd-0006Yz-TU
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 20:05:32 +0000
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06068785-d566-466f-89da-6d579dc82a36;
 Tue, 03 Nov 2020 20:05:30 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 12so12391830qkl.8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 12:05:30 -0800 (PST)
Received: from [100.64.74.11] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id 19sm11824433qkf.93.2020.11.03.12.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 12:05:29 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9NW0=EJ=gmail.com=persaur@srs-us1.protection.inumbo.net>)
	id 1ka2Yd-0006Yz-TU
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 20:05:32 +0000
X-Inumbo-ID: 06068785-d566-466f-89da-6d579dc82a36
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 06068785-d566-466f-89da-6d579dc82a36;
	Tue, 03 Nov 2020 20:05:30 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 12so12391830qkl.8
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 12:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=/K+j6MUmo9QZfRRtW1WN2ZHDw+ebAOYRkq1Ti/Y24Ik=;
        b=nh29CwME8VFbRKAYPXiIXq5Ys6YNYEpDegukX1cgSStgq6X8+HjJc+ymKQXGxEo2IM
         wcF3DZs5P5qtCiGu5Qn8E5HHRm0lORadA4HaStMdOx09Zx8y7Gy3ZKHyJuBccldlTMS9
         33Q6shvKQ+g/AvmPMIABAyjDEdsUX++8sIfdGFCq3wGOl5wa2hPt9Lzvlc4rl2U3Emoz
         FtVzi933+yAgpYML7j8hZR4GCzPJXiOC5iEXecG++hTH/eyEQZHVSrTdZTDZBUQXv8Wn
         I/PVv0i2H1wK8jeomTHUyk1qXbfUZryjN2vayU9UIqWY7Yj0pzEtlXE5YJAnVGrJ39zP
         D7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=/K+j6MUmo9QZfRRtW1WN2ZHDw+ebAOYRkq1Ti/Y24Ik=;
        b=H5+Hhb+DvENB9NsKzMymjwM92Tl18Oq11UKnPgmxKRmcdMCM/MNtE2CzXvVDSGFBKS
         1IAFSlmTDscgapxi1mKzjK/qAO07Xh3THMoY0FN1G7cChe0v6VrCRDP4YJV3eOGlBmEV
         VlEBfuULsGcLMGPDgUeC10/oTuelo06xRf6Jd0w0vN0vkdMxjRv+aMZLGneRsAX4+RIr
         7+Cy3HJxFmRa+Xhv/kw6VNYBt8FBnp5tjRkZ5hAQm9eoObiHmRiNBSrLFzhJdM21P+ud
         rnA46nJyf/7PF/BVGfsPZPsmPo6OdrnIfaUavCP1eSKIl5Yp3IZK/MjYi0cfNsfvHj6i
         Dx3A==
X-Gm-Message-State: AOAM5303xG2kbt1NWEJlEMoecoxUR77GnkMJGb0l88yNqmnD4Y3r9euE
	BDg9eg6/6NTTOOebOrmFGeAQGO4HqBSECA==
X-Google-Smtp-Source: ABdhPJzq8RXLBFiye+POImtg2s5h98c8xut2WGrsrtC+NCMPi3n1i+wQTpceCeg3xgDhSSPosO21qQ==
X-Received: by 2002:a37:4692:: with SMTP id t140mr22333513qka.275.1604433930209;
        Tue, 03 Nov 2020 12:05:30 -0800 (PST)
Received: from [100.64.74.11] ([173.245.215.240])
        by smtp.gmail.com with ESMTPSA id 19sm11824433qkf.93.2020.11.03.12.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 12:05:29 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
Date: Tue, 3 Nov 2020 15:05:28 -0500
Message-Id: <E359BD65-2917-4087-A6E1-0AD5521CF823@gmail.com>
References: <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org,
 Daniel DeGraaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Roman Shaposhnik <roman@zededa.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
In-Reply-To: <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: iPad Mail (18A8395)

On Nov 3, 2020, at 14:37, Stefano Stabellini <sstabellini@kernel.org> wrote:=

>=20
> =EF=BB=BFOn Tue, 3 Nov 2020, Jan Beulich wrote:
>>> On 02.11.2020 22:41, Stefano Stabellini wrote:
>>> On Mon, 2 Nov 2020, Jan Beulich wrote:
>>>> On 31.10.2020 01:24, Stefano Stabellini wrote:
>>>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
>>>>>      SBSA Generic UART implements a subset of ARM PL011 UART.
>>>>>=20
>>>>> config ARM_SSBD
>>>>> -    bool "Speculative Store Bypass Disable" if EXPERT
>>>>> -    depends on HAS_ALTERNATIVE
>>>>> +    bool "Speculative Store Bypass Disable"
>>>>> +    depends on HAS_ALTERNATIVE && EXPERT
>>>>>    default y
>>>>=20
>>>> At the example of this, I'm afraid when the default isn't "n"
>>>> (or there's no default directive at all, as ought to be
>>>> equivalent to and preferred over "default n"), such a
>>>> transformation is not functionally identical: Before your
>>>> change, with !EXPERT this option defaults to y. After your
>>>> change this option is unavailable (which resolves to it being
>>>> off for all consuming purposes).
>>>>=20
>>>> IOW there are reasons to have "if ..." attached to the prompts
>>>> (for this construct indeed only making the prompt conditional,
>>>> not the entire option), but there are also cases where the
>>>> cleanup you do is indeed desirable / helpful.
>>>=20
>>> Yeah, thanks for catching it, it is obviously a problem.
>>>=20
>>> My intention was just to "tag" somehow the options to EXPERT so that it
>>> would show on the menu. Maybe a better, simpler, way to do it is
>>> to add the word "EXPERT" to the one line prompt:
>>>=20
>>> config ARM_SSBD
>>> -    bool "Speculative Store Bypass Disable" if EXPERT
>>> +    bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
>>>    depends on HAS_ALTERNATIVE
>>>    default y
>>>    help
>>>=20
>>>=20
>>> What do you think?
>>=20
>> While on the surface this may look like an improvement, I don't
>> see how it would actually help: If you read the Kconfig file
>> itself, the dependency is seen anyway. And on the menu I don't
>> see the point of telling someone who has enabled EXPERT that a
>> certain option is (or is not) an expert one. If they think
>> they're experts, so should they be treated. (It was, after all,
>> a deliberate decision to make enabling expert mode easier, and
>> hence easier to use for what one might consider not-really-
>> experts. I realize saying so may be considered tendentious; I
>> mean it in a purely technical sense, and I'd like to apologize
>> in advance to anyone not sharing this as a possible perspective
>> to take.)
>>=20
>> Plus, of course, the addition of such (EXPERT) markers to
>> future options' prompts is liable to get forgotten now and then,
>> so sooner or later we'd likely end up with an inconsistent
>> mixture anyway.
>=20
> I tend to agree with you on everything you wrote. The fundamental issue
> is that we are (mis)using EXPERT to tag features that are experimental,
> as defined by SUPPORT.md.
>=20
> It is important to be able to distinguish clearly at the kconfig level
> options that are (security) supported from options that are
> unsupported/experimental. Today the only way to do it is with EXPERT
> which is not great because:
>=20
> - it doesn't convey the idea that it is for unsupported/experimental
>  features
> - if you want to enable one unsupported feature, it is not clear what
>  you have to do
>=20
> So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
> the Kconfig menu?
>=20
> It would make it clearer that by enabling UNSUPPORTED you are going to
> get a configuration that is not security supported.

If going down this path, there should be one, authoritative, in-tree definit=
ion of feature-level support from which Kconfig (build-time policy enforceme=
nt) and SUPPORT.md (documentation) can be derived.  Later, even run-time enf=
orcement can be similarly classified.  FuSA may also wish for documented pol=
icy to align with enforcement.

Rich

> And ideally we would
> also tag features like ACPI as UNSUPPORTED as I suggested above.
>=20

