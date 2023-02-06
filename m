Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8495A68C4D5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 18:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490671.759479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP5Jm-0000Ku-UW; Mon, 06 Feb 2023 17:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490671.759479; Mon, 06 Feb 2023 17:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP5Jm-0000J6-R5; Mon, 06 Feb 2023 17:30:14 +0000
Received: by outflank-mailman (input) for mailman id 490671;
 Mon, 06 Feb 2023 17:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K59t=6C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pP5Jl-0000J0-9Y
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 17:30:13 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e9520d-a643-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 18:30:12 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id a2so10834466wrd.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 09:30:12 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000186200b002bddd75a83fsm9979966wri.8.2023.02.06.09.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:30:11 -0800 (PST)
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
X-Inumbo-ID: e8e9520d-a643-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sKmFv+Y+fHTwV8G4a9TkOiAdfk5N2aZo0z6M5KjFABU=;
        b=RKC3jEtyZnPlL92R77zlXgBYgN+4WGuzpFmlrE48Mat7077sJy5pReBQgBTn6k7kA5
         8486zgYIEJerDiMo1CeGxTZjIwVz36gTsStvNdR/uP2LC29un18aVmYWdgptukauHDaw
         5jiSils3kmjCwnrfykXrU9n4gIVqCbOOyt3SybVb8J7dH9e4Jr9ox/lnJ0WITE5/0/xs
         cF0i0RUBt7jOSGuJXcZjFWfk5LrPcJWsgoPmV2uTdlVj/qdJ/q7c+cOmSE+wS6jsHkMj
         5/6B4Ts1Tg4EA9fBZf1HBhAvJpjq2WgB/zP4OSR32GbKkEvnpqC2/LeopgUuTXkLLdG0
         AvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKmFv+Y+fHTwV8G4a9TkOiAdfk5N2aZo0z6M5KjFABU=;
        b=jZ68GjyXJMrLYAZANX7WoHdwZ0bSGitIT44yOAOOAKQ4XpdITRal2tsKgrZqhNKBeP
         +sa/ro/YT90zQHkWW+GzQVqdz/ZEBr+SKZ3lzAM6G1CnwD2wBw4Lakj0m7j5dbelycZt
         siqlP21NhoDHDksxqoif5DGumVoDwF4nqO5mpvfYiIgAKkaiYImqkZyC5FgRZncxkTzY
         419S/rPECelYqpzSfmV8w815DSweQEX0aTmsNwo0h9uUMY5SSSAttGHCLu8Ujt+Srsja
         TIU0tJs/6uwLRV5PM8QKGxoJpnwi1aYqW3T5IndJixhJvaYBfWEtDU+1A+VVvAdR7Fov
         ZkCQ==
X-Gm-Message-State: AO0yUKVa94cO1uJUt8ysrK+QWJBqp6s/7NdmwHFFfL1AUI27eJNxNfwF
	KBY2D2DZBKb7oUXW0nha1dk=
X-Google-Smtp-Source: AK7set+/uR4EPeIMP9HefYZxm4x0hB0Aikwa4fU5buMRhgscylD7e7ZxX+RNTcgFO/AyqLXIoPb/0A==
X-Received: by 2002:adf:fb4b:0:b0:2bf:c4be:e987 with SMTP id c11-20020adffb4b000000b002bfc4bee987mr15873692wrs.26.1675704611505;
        Mon, 06 Feb 2023 09:30:11 -0800 (PST)
Message-ID: <6573131ec6cde4eecce9959637965d10ef55ec71.camel@gmail.com>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Andrew Cooper <amc96@srcf.net>, Alistair
	Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Connor Davis <connojdavis@gmail.com>, Bobby
 Eshleman <bobby.eshleman@gmail.com>
Date: Mon, 06 Feb 2023 19:30:09 +0200
In-Reply-To: <1a1e9b46-e665-f33a-b122-31a5af5b22da@xen.org>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
	 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
	 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
	 <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
	 <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org>
	 <CAKmqyKNwH4-D3dKGQEsW_Zup4OT32C1RwaA7_Sey4fo_jOzFcA@mail.gmail.com>
	 <9d5841b2-5d0b-390f-6e95-cf492e99e5a2@srcf.net>
	 <1a1e9b46-e665-f33a-b122-31a5af5b22da@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi all,

On Wed, 2023-02-01 at 09:06 +0000, Julien Grall wrote:
> Hi Andrew,
>=20
> On 01/02/2023 00:21, Andrew Cooper wrote:
> > On 31/01/2023 11:17 pm, Alistair Francis wrote:
> > > On Tue, Jan 31, 2023 at 10:03 PM Julien Grall <julien@xen.org>
> > > wrote:
> > > > On 31/01/2023 11:44, Alistair Francis wrote:
> > > > > On Sat, Jan 28, 2023 at 12:15 AM Oleksii
> > > > > <oleksii.kurochko@gmail.com> wrote:
> > > > >=20
> > > > =C2=A0 From my understanding, on RISC-V, the use of PC-relative
> > > > address is
> > > > only guaranteed with medany. So if you were going to change the
> > > > cmodel
> > > > (Andrew suggested you would), then early_*() may end up to be
> > > > broken.
> > > >=20
> > > > This check serve as a documentation of the assumption and also
> > > > help the
> > > > developer any change in the model and take the appropriate
> > > > action to
> > > > remediate it.
> > > >=20
> > > > > I think this is safe to remove.
> > > > Based on what I wrote above, do you still think this is safe?
> > > With that in mind it's probably worth leaving in then. Maybe the
> > > comment should be updated to make it explicit why we want this
> > > check
> > > (I find the current comment not very helpful).
> >=20
> > The presence of this check pre-supposes that Xen will always
> > relocate
> > itself, and this simply not true.=C2=A0 XIP for example typically does
> > not
> >=20
> > Furthermore it's not checking the property wanted.=C2=A0 The way C is
> > compiled has no bearing on what relocation head.S uses to call it.
>=20
> I think we are still cross-talking each other because this is not my=20
> point. I am not sure how to explain differently...
>=20
> This check is not about how head.S call early_*() but making sure the
> C=20
> function can be executed with the MMU off. In which case, you will=20
> likely have VA !=3D PA.
>=20
> In theory head.S could apply some relocations before hand, but it may
> be=20
> too complicated to do it before calling early_*().
>=20
> >=20
> > It is a given that we compile the hypervisor with a consistent code
> > model, meaning that the properly actually making the check do what
> > is
> > wanted is also the property that means it is not needed in the
> > first place.
>=20
> See above.
>=20
> >=20
> > This check is literally not worth the bytes it's taking up on disk,
> > and
> > not worth the added compiler time, nor the wasted time of whoever
> > comes
> > to support something like XIP in the future finds it to be in the
> > way.
> > Xen as a whole will really genuinely function as intended in models
> > other than medany, and it demonstrates a misunderstanding of the
> > topic
> > to put in such a check to begin with.
>=20
> Then enlight me :). So far it looks more like you are not
> understanding=20
> my point: I am talking about C function call with MMU off (e.g. VA !=3D
> PA) and you are talking about Xen as a whole.
>=20
> I guess the only way to really know is to implement a different
> model.=20
> At which point there are three possible outcome:
> =C2=A0=C2=A0 1) We had the compiler check, it fired and the developper wi=
ll
> take=20
> action to fix it (if needed).
> =C2=A0=C2=A0 2) We have no compiler check, the developper knew what to do=
 it
> and=20
> fixed it.
> =C2=A0=C2=A0 3) We have no compiler check, the developper where not aware=
 of
> the=20
> problem and we will waste time.
>=20
> Even if you disagree with the check, then I think 1 is still the best
> because it would explain our assumption. Yes it may waste a few
> minutes=20
> to the developer switching the model. But that probably nothing
> compare=20
> to the time you could waste if you don't notice it.
>=20
> Anyway, Alistair has now all the information to take an informative=20
> decision.
>=20

I'll bring back the check and send the new version of the patch
tomorrow as Bobby&Alistair lean toward it.

Andrew, do you have other thoughts?

> Cheers,
>=20
~ Oleksii


