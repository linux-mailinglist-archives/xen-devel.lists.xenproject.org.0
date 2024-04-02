Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB18955A6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 15:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700148.1092783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rreQN-0005Tr-Je; Tue, 02 Apr 2024 13:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700148.1092783; Tue, 02 Apr 2024 13:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rreQN-0005RP-Ge; Tue, 02 Apr 2024 13:43:39 +0000
Received: by outflank-mailman (input) for mailman id 700148;
 Tue, 02 Apr 2024 13:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5be=LH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rreQM-0005RJ-Hl
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 13:43:38 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01c76470-f0f7-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 15:43:37 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a4e65dec03eso277114866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 06:43:37 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 jx2-20020a170906ca4200b00a46d9966ff8sm6686696ejb.147.2024.04.02.06.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 06:43:36 -0700 (PDT)
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
X-Inumbo-ID: 01c76470-f0f7-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712065417; x=1712670217; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HeeIdYHN14sQ1IAtnk9ABfVG3UrustBm8x+heZnOYg4=;
        b=aS5IxyyMW/No3di0dak34y5aSOncYlXQ7SskVTMDFgjeqFv1B3R6jcrroMggU7gmln
         t0XfGpDeSmIqKEN3EYaQJqx+Fqo65Xo5hlsGPLfdE7pgXqPgYBxElInRl2Z0GcCsfCr0
         E342poPvkfcPnwFlqvTbu4zQOO7NLerX8gpJ0oTuvwlBKshYkXaCSGJMpUiwgtexD8LV
         G5SQ9VxTjj5TVCAzoJR2ewS+jJu9akjALk9WKwCnLXIwRhQrvtYxT/7ZdFMqUoYAAHFF
         AMGpyAGsCJgpwxtCI0ZOaRg8s2mXpwKWZLX6E9tAq7b0Ixp4Jis9y/CuJgog6Ut0v6YA
         JE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712065417; x=1712670217;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeeIdYHN14sQ1IAtnk9ABfVG3UrustBm8x+heZnOYg4=;
        b=jjoVqTKMRo0OiF74p9BYDYYF7OQgUX1EXolNQ7/kdfnyMh0Cp2z84ltDcVavXADaxr
         6Bu4rqa0Xk4JJrFxzyOzuh+zaEucX+jnpcT3mXNuQk0cLxD2sc0qsyLL9/dF99AR3ca4
         BGp4QNVDQWDbmMB3/iVMsIOqMiWMwn0ZrKgkgYwtbWr6vPXbwTuM+UkOgdFbBtlsVlUd
         88QmS6961AR2OnXD8Hw89yzyoQxhfLgIN+mIudvjzwVXcw2VDDwFvxwBs7fhsRKFNxh0
         b27kvKFAGYNIp12fW9riGS7ksdpt5WXYoHxU83fkmia+pUzdunmZv+TseyO4VabBHOdr
         XgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAUPbRD+Rzd2XITdfeUdkJBeXnPnBsPVyF0ONNOoWf3ITA+f4MGv2DjapXUEVbZwvgDnI06oThmmXmmlNa9eWcmJPkyupulCtnBidGWks=
X-Gm-Message-State: AOJu0Yztwd8RLG25PUAL3p+YNHJZc7ekrfTZ48HSWgknhhBAv9sMAvL4
	XFtD1ku1BDkmwqCs7fSbLMgtJIUHpgqigZ8IG1XxKZvoT8ok9J4m
X-Google-Smtp-Source: AGHT+IGVuumwOVC604wtGQQS9FmWZnT87ZOhHWuY6AYGcUF5EPMcF7M2YA3FSz3ksBVjsaBaXKYylQ==
X-Received: by 2002:a17:907:2d91:b0:a4e:8003:30ba with SMTP id gt17-20020a1709072d9100b00a4e800330bamr2430413ejc.15.1712065416664;
        Tue, 02 Apr 2024 06:43:36 -0700 (PDT)
Message-ID: <2b504d9a4ab2905440932adecf350d21c0143874.camel@gmail.com>
Subject: Re: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 02 Apr 2024 15:43:35 +0200
In-Reply-To: <76fa325b-2074-438f-a953-f2ed4a23fcb3@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
	 <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
	 <87a51cb7a2d663f292ccddbba78e41fd6a1c12db.camel@gmail.com>
	 <76fa325b-2074-438f-a953-f2ed4a23fcb3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-04-02 at 14:54 +0200, Jan Beulich wrote:
> On 02.04.2024 13:43, Oleksii wrote:
> > On Thu, 2024-03-21 at 13:07 +0100, Jan Beulich wrote:
> > > > + * If resulting 4-byte access is still misalgined, it will
> > > > fault
> > > > just as
> > > > + * non-emulated 4-byte access would.
> > > > + */
> > > > +#define emulate_xchg_1_2(ptr, new, lr_sfx, sc_sfx) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 uint32_t *aligned_ptr =3D (uint32_t *)((unsigne=
d long)ptr &
> > > > ~(0x4 - sizeof(*(ptr)))); \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int new_val_pos =3D ((unsigned long)(p=
tr) & (0x4 -
> > > > sizeof(*(ptr)))) * BITS_PER_BYTE; \
> > >=20
> > > You parenthesize ptr here correctly, but not in the line above.
> > >=20
> > > Instead of "_pos" in the name, maybe better "_bit"?
> > >=20
> > > Finally, here and elsewhere, please limit line length to 80
> > > chars.
> > > (Omitting
> > > the 0x here would help a little, but not quite enough. Question
> > > is
> > > whether
> > > these wouldn't better be sizeof(*aligned_ptr) anyway.)
> >=20
> > I'm unsure if using sizeof(*aligned_ptr) is correct in this
> > context.
> > The intention was to determine the position for the value we're
> > attempting to exchange.
> >=20
> > Let's consider a scenario where we have 0xAABBCCDD at address 0x6.
> > Even
> > though this would result in misaligned access, I believe
> > new_val_pos
> > should still be calculated accurately. Let's say we want to
> > exchange
> > two bytes (AABB) with FFFF.
> >=20
> > With the current implementation, we would calculate:
> > 0x6 & 2 =3D 2 * 8 =3D 16, which is the value on which the new value
> > should
> > be shifted.
> >=20
> > However, if this value is then ANDed with sizeof(*aligned_ptr):
> > 0x6 & 4 =3D 6 * 8 =3D 48, which is not the expected value.
> >=20
> > Am I overlooking something?
>=20
> I'm afraid I can only reply with a counter question (feels like there
> is
> some misunderstanding): Do you agree that 0x4 =3D=3D 4 =3D=3D
> sizeof(*aligned_ptr)?
> It's the 0x4 that the latter part of my earlier reply was about. I'm
> pretty
> sure you have, over the various reviews I've done, noticed my dislike
> for
> the use of literal numbers, when those aren't truly "magic".
Yes, it was misunderstading. Thanks for clarifying.

~ Oleksii

