Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8B7D2EAC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621161.967330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurRn-0001h0-On; Mon, 23 Oct 2023 09:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621161.967330; Mon, 23 Oct 2023 09:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurRn-0001fL-Lm; Mon, 23 Oct 2023 09:42:07 +0000
Received: by outflank-mailman (input) for mailman id 621161;
 Mon, 23 Oct 2023 09:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qurRl-0001fF-Ss
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:42:05 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf3e639-7188-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:42:03 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507962561adso4331295e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:42:03 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 be33-20020a056512252100b005079fa0b1c3sm1638124lfb.243.2023.10.23.02.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:42:01 -0700 (PDT)
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
X-Inumbo-ID: 6bf3e639-7188-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698054123; x=1698658923; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MhSLSdUs5thPEVL2bd2GtxQ7WFe6OUIMos7GDofniaM=;
        b=duGJc350SeXHXC9S0OLbsYL/DBcOn0rvyXJs7NaIdASza51gP8dsp7DSbXbr3+23kd
         i6bBWWxTa01SzKRZFyTYvw0M0WRgL9PcD7/CDOEwbwDkgZkvm07nHn1bB6euu7aUNzhx
         3s1ENkouBAfDAPSslrThtxGnpX6jCDbmACPX1oFQUgPPMqzccBR11Tjp+x1Cbtw3TZ81
         KjCurspNRLD5eiz9ddvkeuRou3LGLU2XD7GevLXL/WOItqyU504y+nCMK2bR0UOgbZNK
         UeBtShFJ6DQyDf5+EnEp8vAPuQJmlSsNag9YQUHN7T4TX4eTNRgk+rh8TqCMHyfpr5k/
         xgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054123; x=1698658923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhSLSdUs5thPEVL2bd2GtxQ7WFe6OUIMos7GDofniaM=;
        b=hO1Rr63s4h9Z8Sxye+HR/PjDZOL+BYv+s5TXriokQBNnGoM8OsPbLUo1p3dLk9KPxY
         wUZbZMv0tPP0jktKk6l0MI3bvTDEGewVAQeqc47cUU21NKb8BcAPU6YxSiSqOhUC0cRq
         A4aBbmCpNFmLC9oD8VLzaw7PzmVdazQDYUHmrU3CaoJtiASQSePV9NBVSCcx0Hr+xLo6
         Jx/O+qVOcP+k+XV9Zh1h2nWOrDrZA4abAD/urSPTePMduo/YahLQ0ilo9+4lyLN+YcIh
         JcOuO06czRvtE5LbgWEz/hmUHctCOa/mn2qt4MdZLidcDQi0bDqNwifNjJ/U0KA6U5t4
         CvIQ==
X-Gm-Message-State: AOJu0YwqUwEUcSq3qE+sqk0OeivAcKBrA+TyYg8UR7AHr71rcWc9OaMW
	Jyi0CqH80kgOKyggQumi/5s=
X-Google-Smtp-Source: AGHT+IGXBwPfc5j9v4a/zL2pV0OTIIYOWU1uNcXMopjQzPAUKGbI65m3IlyndeTzEDSNQF0glevtAQ==
X-Received: by 2002:a05:6512:6c4:b0:507:99d6:95fc with SMTP id u4-20020a05651206c400b0050799d695fcmr7977047lff.45.1698054122883;
        Mon, 23 Oct 2023 02:42:02 -0700 (PDT)
Message-ID: <13601cd1fc51ded17ec3363eea7382de43e7312a.camel@gmail.com>
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 12:42:01 +0300
In-Reply-To: <a05c39b64004398fbb42ec83a452fa7af6603f95.camel@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
	 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
	 <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
	 <09d0449004162ccd339e9e8559b7efad3e2335bb.camel@gmail.com>
	 <7d59acfd-26d0-bb9b-568e-d273252d1f2c@suse.com>
	 <a05c39b64004398fbb42ec83a452fa7af6603f95.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-09-22 at 09:00 +0300, Oleksii wrote:
> On Mon, 2023-09-18 at 14:38 +0200, Jan Beulich wrote:
> > On 18.09.2023 14:05, Oleksii wrote:
> > > On Mon, 2023-09-18 at 11:29 +0200, Jan Beulich wrote:
> > > > On 18.09.2023 10:51, Oleksii wrote:
> > > > > On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
> > > > > > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > > > > > Based on two patch series [1] and [2], the idea of which
> > > > > > > is
> > > > > > > to
> > > > > > > provide minimal
> > > > > > > amount of things for a complete Xen build, a large amount
> > > > > > > of
> > > > > > > headers are the same
> > > > > > > or almost the same, so it makes sense to move them to
> > > > > > > asm-
> > > > > > > generic.
> > > > > > >=20
> > > > > > > Also, providing such stub headers should help future
> > > > > > > architectures
> > > > > > > to add
> > > > > > > a full Xen build.
> > > > > > >=20
> > > > > > > [1]
> > > > > > > https://lore.kernel.org/xen-devel/cover.1694543103.git.sanast=
asio@raptorengineering.com/
> > > > > > > [2]
> > > > > > > https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksi=
i.kurochko@gmail.com/
> > > > > > >=20
> > > > > > > Oleksii Kurochko (29):
> > > > > > > =C2=A0 xen/asm-generic: introduce stub header spinlock.h
> > > > > >=20
> > > > > > At the example of this, personally I think this goes too
> > > > > > far.
> > > > > > Headers
> > > > > > in
> > > > > > asm-generic should be for the case where an arch elects to
> > > > > > not
> > > > > > implement
> > > > > > certain functionality. Clearly spinlocks are required
> > > > > > uniformly.
> > > > > It makes sense. Then I will back to the option [2] where I
> > > > > introduced
> > > > > all this headers as part of RISC-V architecture.=20
> > > >=20
> > > > You did see though that in a reply to my own mail I said I take
> > > > back
> > > > the
> > > > comment, at least as far as this header (and perhaps several
> > > > others)
> > > > are
> > > > concerned.
> > > >=20
> > > I missed that comment on the patch about spinlock.
> > >=20
> > > Well, then, I don't fully understand the criteria.
> > >=20
> > > What about empty headers or temporary empty headers?
> > >=20
> > > For example, asm/xenoprof.h is empty for all arches except x86,
> > > so
> > > it
> > > is a good candidate for asm-generic.
> >=20
> > That's an example where I think it is wrong (or at least
> > unnecessary)
> > for
> > the xen/ header to include the asm/ one irrespective of the
> > controlling
> > CONFIG_* setting. From what I can tell common code would build fine
> > with
> > the #include moved; x86 code may require an adjustment or two. IOW
> > this
> > is a case where I think preferably presence of an arch header was
> > required only when XENOPROF can actually be yet to y in Kconfig.
> >=20
> > > But asm/grant_table.h is empty for PPC and RISC-V for now but
> > > won't
> > > be
> > > empty in the future. Does it make sense to put them to asm-
> > > generic?
> > > The
> > > only benefit I see is that in future architecture if they follow
> > > the
> > > same way of adding support for the arch to Xen, they will face
> > > the
> > > same
> > > issue: building full Xen requires this empty header.
> >=20
> > Here I can see different ways of looking at it. Personally I'd
> > prefer
> > stub headers to be used only if, for the foreseeable future, they
> > are
> > intended to remain in use. grant_table.h pretty clearly doesn't
> > fall
> > in
> > this category. (You may want to peek at what's being done on the
> > PPC
> > side. Nevertheless some of what's done there could likely benefit
> > from
> > what you're doing here.)
> >=20
> > > So, should I wait for some time on other patches of the patch
> > > series?
> >=20
> > Well, afaic I'd prefer if I got a chance to look over at least some
> > more
> > of the patches in this series. But you're of course free to submit
> > a
> > v2
> > at any time.
> I think that it will be better to wait for some time not to produce
> unnecessary patches.
Hmm... but my gitlab CI told me that there is an issue with riscv64
build I'll double-check.

~ Oleksii

