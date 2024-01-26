Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7183D6BA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 10:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671892.1045402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIlV-00034x-0m; Fri, 26 Jan 2024 09:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671892.1045402; Fri, 26 Jan 2024 09:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIlU-000337-UK; Fri, 26 Jan 2024 09:44:48 +0000
Received: by outflank-mailman (input) for mailman id 671892;
 Fri, 26 Jan 2024 09:44:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTIlT-000331-KE
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 09:44:47 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89af7013-bc2f-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 10:44:45 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cf161b5eadso1367881fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 01:44:45 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a2e8e91000000b002cd3e4d712asm111203ljk.51.2024.01.26.01.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 01:44:44 -0800 (PST)
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
X-Inumbo-ID: 89af7013-bc2f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706262285; x=1706867085; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PHno6lDjNrDl1xq3lRo8a1gpAFJigxBmIk9Hsda5wTA=;
        b=K04pdz6B95ObDziU1zxb4ALXbRP9tH++LyOPTy2Wdk1wqBSfHKUK8RIUim7IF3EbFm
         RM29oEmBeQHLqFCtRcTLxym8XIMRftF8eE73oJAXJfIqCiZIgyBCliOSipziEHE/WKiC
         bltTMc+Cczon4QUmxcBu4bWAXwzTImvQxOm3TXBXMmOkGGjyYJKjamIMoAZDDv8Klz5p
         Zh/LFNNhAzfSUhHuvfNnopOVce45hQi6Fkd3nCltT9QnAJ1tyLZvyUL11tTZKvERGLlF
         oTt8iQ7PoKRpT80RkUUENSJ/MZFb6aQqSq84SB2NKkBfpd4u2JnGBb4E3Vhtiyq0YQNV
         ggKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706262285; x=1706867085;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHno6lDjNrDl1xq3lRo8a1gpAFJigxBmIk9Hsda5wTA=;
        b=TANSppEtbamupG564GPvBCBKS7ValJPV17U7RxDUQW1V17piefqENOusqLKwFgHTw9
         1PxpC0BGp4nfVNKrTBwUrSc9PMNI+Lru+MgtuGyPzSKE7NyFzUikNueYZ03bcaFaKz1M
         CuBrpW8UP5iksmyi2a7OUWPUeag7us0WX/XNWzcSA+zfg+vC6ENBbtj8+Q+qWDeLPJkt
         5ZA59kckNpZVXxFbPu4J/khabXl1SkfiPSF7ZYZ/JO1/pGHsDXDR6LVzyNOLtRW9azMR
         jvl1YdrSHf9QZgSvKBr5HpZWslQZUkPtU3m+Ig5uj6am+uIjs4J7lYQ8Hh3pUuQes72b
         MI9w==
X-Gm-Message-State: AOJu0Yx+X+P/e/zpLKqxiJOTIar2o7M/wC9ysjRAmk+sxo++V+q/kvqj
	spAKrqLYgmnS12X/kD+UnwOaMmZODmR39urQ/F8I1t+oKkcDEwBW
X-Google-Smtp-Source: AGHT+IHejFXNArCz74cKS664T5P/UjmoneDIg/SsRh5CjDd7fbEI9IV/MpFqTWrgLgFlxw59T6nQcQ==
X-Received: by 2002:a2e:5c88:0:b0:2cf:48e2:794f with SMTP id q130-20020a2e5c88000000b002cf48e2794fmr727625ljb.22.1706262284588;
        Fri, 26 Jan 2024 01:44:44 -0800 (PST)
Message-ID: <c899f039185d02ea49db29641ff5ca46a29008dd.camel@gmail.com>
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 26 Jan 2024 11:44:43 +0200
In-Reply-To: <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
	 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
	 <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
	 <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 14:37 +0100, Jan Beulich wrote:
> On 23.01.2024 13:34, Oleksii wrote:
> > On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > --- a/xen/common/Kconfig
> > > > +++ b/xen/common/Kconfig
> > > > @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
> > > > =C2=A0config GENERIC_BUG_FRAME
> > > > =C2=A0	bool
> > > > =C2=A0
> > > > +config GENERIC_FIND_NEXT_BIT
> > > > +	bool
> > >=20
> > > There's no need for this, as ...
> > >=20
> > > > --- a/xen/lib/Makefile
> > > > +++ b/xen/lib/Makefile
> > > > @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) +=3D x86/
> > > > =C2=A0lib-y +=3D bsearch.o
> > > > =C2=A0lib-y +=3D ctors.o
> > > > =C2=A0lib-y +=3D ctype.o
> > > > +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) +=3D find-next-bit.o
> > >=20
> > > ... you're moving this to lib/. Or have you encountered any issue
> > > with building this uniformly, and you forgot to mention this in
> > > the description?
> > I didn't check. My intention was to provide opportunity to check if
> > an
> > architecture want to use generic version or not. Otherwise, I
> > expected
> > that we will have multiple definiotion of the funcion.
> >=20
> > But considering that they are all defined under #ifdef...#endif we
> > can
> > remove the declaration of the config GENERIC_FIND_NEXT_BIT.
>=20
> What #ifdef / #endif would matter here? Whats in lib/ is intended to
> be
> generic anyway. And what is in the resulting lib.a won't be used by
> an
> arch if it has an arch-specific implementation. Problems could arise
> if
> an arch had an inline function colliding with the out-of-line one.
> But
> that's about the old case where I could see a need to make the
> building
> of one of the objects conditional. And you'll note that withing this
> Makefile there are pretty few conditionals.
We will have such issue with PPC:
...
static inline unsigned long find_next_bit(const unsigned long *addr,
                                          unsigned long size,
                                          unsigned long offset)
...

It looks like an introduction of new config for find_next_bit is
needed.

Does a better option exist? Would making find_next_bit non inline non
inline for PPC better?

~ Oleksii

