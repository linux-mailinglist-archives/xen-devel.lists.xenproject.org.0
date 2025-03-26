Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4109CA71AEC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928021.1330780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSvL-0003ET-If; Wed, 26 Mar 2025 15:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928021.1330780; Wed, 26 Mar 2025 15:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSvL-0003Ca-G6; Wed, 26 Mar 2025 15:44:11 +0000
Received: by outflank-mailman (input) for mailman id 928021;
 Wed, 26 Mar 2025 15:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XIkG=WN=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1txSvK-0003CS-2K
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:44:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28260706-0a59-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 16:44:09 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so991887966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 08:44:09 -0700 (PDT)
Received: from localhost ([46.149.103.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef86e4f1sm1053698066b.29.2025.03.26.08.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 08:44:08 -0700 (PDT)
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
X-Inumbo-ID: 28260706-0a59-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1743003848; x=1743608648; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/gA25aNLaH15+MxnPrTob9W9SY86dCiAks8WiBXv5M=;
        b=QGjyLTRz3UHNwlNnnIy4bi9yNPbgPe5OcULlei3cwd7PDeKb1/gtYF1/ISBKYOzvT1
         Locna1zwhJ3G5QeBMtH59ES9t3xqWPlSc69MDRh7WnmRgM9zBUp9nq08GJbDgYQDOs8/
         2kSPRXeVNqcJYju1h/+Q73lYkXOhrMxO1WDe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743003848; x=1743608648;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/gA25aNLaH15+MxnPrTob9W9SY86dCiAks8WiBXv5M=;
        b=lJGMFU7lnQApe9AY7JX4DM7NXVnPHPN/rSONfh7jI0BLSvolVKVTaCenMGoX5xkRzL
         4q7a/yO5jjSR914FZaGw0SK+iXXum1A8rcE3ymCSj004clmPRNwHQRXT+bIjLRZXb0mZ
         xpgNi5DVdFxBSSozWHp7qMeazN6tsg27n7p8C1Qus8fxKbqMtodQEv5vYTHii/6yMmRE
         4BClkq2WP2US6IsvkhG2GTEgnIuocC236M5xINo8q8+OVW7DxIXu7ztIku9NSdX5ypVL
         AVXJhUx5fxd0O3fyDFJyIeUkSvDn1Qp45CKIv5Kh/5mnwr/PjpJ8DjzCDqUkqRvM0S99
         rG5w==
X-Gm-Message-State: AOJu0Yzyme3tg2ED5H+wlVQT5GHc11T4ifZuBeziuofql/+jLdICTjhK
	6eQ9FHssbFWnEflJuwKukq+RIIExLX+6rBQffmY6AVYs2luh+C2a5qtZxlUHWe8=
X-Gm-Gg: ASbGncvqCzGlDedZLukzMIUWc4KmMBu/Y2upxAoV4nmH5F0LGsiHwOG+ibA/1jXyjPF
	LHhMz7xMpAp5rNc4f2aAyKlLfndxseW2l0pEzJaEvL8JEpPAv04pkGfzkwv3hS6dhXo2GfvEtjO
	GWbvotC6f9cSNjjzXl48tO3KT3whdy9v9XfQg3+H5RoRZIsuke1nh7esxEXSD4Oa7sg1V4z00Ug
	dOh+JJLStdnURyO4gVSm1xcNwf9uXvZL+qXdWrxpTzHlc8jt390ob6t6JGhonGgGBz6Z4OcTApH
	TuBWJkp0z4LFgMykCZdeXOH+T5qidUHNmS46KWYdyBuWOexjB0Mk1jZ1fHObxQ==
X-Google-Smtp-Source: AGHT+IGGxe5drznngos4Vd7+Dh2Mofsgf6B/DAjK4gVuktDK4a9UQeKp8n3KVKEa/blQJTNglaqQ6Q==
X-Received: by 2002:a17:906:4fcd:b0:ac3:49f0:4d10 with SMTP id a640c23a62f3a-ac3f24b42camr2300812866b.38.1743003848464;
        Wed, 26 Mar 2025 08:44:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Mar 2025 15:44:05 +0000
Message-Id: <D8QBAOE8U497.UAKETQOU3D2Y@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>,
 "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH] tools: Remove support for qemu-trad's battery reporting
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
X-Mailer: aerc 0.18.2
References: <20250325174110.467-1-alejandro.vallejo@cloud.com>
 <Z-QIOJax7of-y79f@mail-itl>
In-Reply-To: <Z-QIOJax7of-y79f@mail-itl>

On Wed Mar 26, 2025 at 1:59 PM GMT, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Mar 25, 2025 at 05:41:10PM +0000, Alejandro Vallejo wrote:
> > The way this undocumented feature works is via qemu-trad (who nobody
> > uses anymore), by intercepting 3 magic PIOs. 0x88 is one of them, and
> > it's probed by hvmloader as a means of detecting support for this (so,
> > on qemu-upstream this check always fails). If hvmloader detects the
> > feature, it appends an SSDT with AML inherited from some laptop ~20y
> > ago. QEMU then communicates with a userspace daemon (xenpmd) via an
> > undocumented xenstore key ("refreshbatterystatus") in order to report
> > battery levels.
> >=20
> > Seeing how no one uses, mantains or cares about qemu-trad anymore, rip
> > it all out. The hvmloader check, the SSDT generation logic and xenpmd.
>
> Oh, I didn't know something like this existed!

In retrospect, it might've been for the best. I really dislike the way it's=
 put
together. Using xenstore feels really pointless.

> We needed a feature like this, and solved it via extra kernel module +
> PV-like interface to feed it with data from dom0:
> https://github.com/QubesOS/qubes-dummy-psu/

I did wonder (after learning how this all works) how you guys did it withou=
t
qemu-trad. I guess that explains it. FWIW, it's not hard to do this properl=
y on
QEMU upstream. We could create a new field under a BAR of the Xen platform
device and instruct some (much, much, much simpler) AML to read the battery
level from there. Then QEMU can ask the real system what the battery level =
is
and Bob's your uncle.

But...

>
> I guess it doesn't make much sense for me to resurrect the old interface
> and bring it to QEMU upstream, as I need the battery info in PVH too.
> So, I'm fine with removing it as is.

... in principle I'd say QubesOS and OpenXT are the two only plausible user=
s of
this feature. So it's a tad pointless if you've since developed a working
solution many years ago.

Cheers,
Alejandro

