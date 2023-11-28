Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99F7FB5C7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642847.1002591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uOf-00006s-KE; Tue, 28 Nov 2023 09:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642847.1002591; Tue, 28 Nov 2023 09:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uOf-0008Vx-HG; Tue, 28 Nov 2023 09:28:49 +0000
Received: by outflank-mailman (input) for mailman id 642847;
 Tue, 28 Nov 2023 09:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3UE=HJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7uOe-0008Vr-Tf
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:28:49 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8764f6a6-8dd0-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 10:28:46 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50aab3bf71fso7111061e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 01:28:46 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a19ee14000000b0050aaafe2923sm1801262lfb.77.2023.11.28.01.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 01:28:45 -0800 (PST)
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
X-Inumbo-ID: 8764f6a6-8dd0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701163726; x=1701768526; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0XuMjoXYZeSyME50U244VGsguh0x7O1pzxe3Son4AXc=;
        b=nEd4eI0g2qWEPY3dYqRQc3W3TzSdR18aPq5miij4rmYIpYvejYU23kQXOr8nxiagfJ
         t/RIQRhE/6rW7zjqHumJxCri88+mEJxx23JjX++Dc3fmmhbrGsn85XAXrYYgEOGj7GwH
         FaGBlgDScljV7mx2BIxBtD5pnr9158CDodGFbPRL8gvqT3z0MK4z5n9wmDcjSQ4rd+ra
         TZkqbOV6ZNv/RYVvERltPLO16IZFlf0XNR5bdgQEuCc0C22eEw4q/SaxGBxQ4zT5aurL
         d3BsErzl4hPcRKc3p2CBMllcv20bIMTk8bEDyt3PnfV1AmFAV3iPr9NMnnNyOJ8DTK6c
         PF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163726; x=1701768526;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XuMjoXYZeSyME50U244VGsguh0x7O1pzxe3Son4AXc=;
        b=M8088beA4BD8VRonZqhOPWuOKtfsfdzT1mRJpbwPD0o+/PtazLdomqwjzDZTcrk8MR
         K2i9VzaU6udGwIRh/CoLXSrAthknnqsZeFo2uQ0DPiQkI1ohXCuLlLu4XwtzgLP+011u
         rumQ+X2cVk8IK+SdAqWklCycYHUgj7dh6i0OWo8Wir6GEhlJYf6jy1cPMRwMwtEULj3p
         u3dSDzJRnqQvbRKi2D9nh/e2eKS7X8rTWqcaeud2/zbye9x4bEi6Uh6v/ymPKhAUQkCa
         20MKi/EnzxRKF22UXUZSPlaWxoGjlB+UukPqm1aUgrB9wiIZoIWfxOK9wfFLC+DC/z/4
         6Umw==
X-Gm-Message-State: AOJu0YxhkrSfiOtIyHISf0q/Ca7btym7YYrwIPb/3V0w8rgCVsrXfs7k
	/biN+l4p4+RmRHRN8Fe1cF4=
X-Google-Smtp-Source: AGHT+IH0IRpAvwytA2cFcIe79uxE5kybdJ1XjyefJeU0wVOp5K67RAvP04DG+r3n/TA5aC8o0EHKjg==
X-Received: by 2002:a05:6512:280c:b0:503:3808:389a with SMTP id cf12-20020a056512280c00b005033808389amr13211737lfb.11.1701163725987;
        Tue, 28 Nov 2023 01:28:45 -0800 (PST)
Message-ID: <195a50316efde86113f6f5df269c754a90490c57.camel@gmail.com>
Subject: Re: [PATCH v4 13/14] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Tue, 28 Nov 2023 11:28:45 +0200
In-Reply-To: <405c2d66-a6f4-4bbb-ada5-2ac49c8c9744@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
	 <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
	 <6543c6aec8f69878e37912924b6d6208136a02af.camel@gmail.com>
	 <405c2d66-a6f4-4bbb-ada5-2ac49c8c9744@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-11-28 at 08:57 +0100, Jan Beulich wrote:
> On 27.11.2023 20:38, Oleksii wrote:
> > On Mon, 2023-11-27 at 15:41 +0100, Jan Beulich wrote:
> > > On 27.11.2023 15:13, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/ppc/include/asm/grant_table.h
> > > > +++ /dev/null
> > > > @@ -1,5 +0,0 @@
> > > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > > -#ifndef __ASM_PPC_GRANT_TABLE_H__
> > > > -#define __ASM_PPC_GRANT_TABLE_H__
> > > > -
> > > > -#endif /* __ASM_PPC_GRANT_TABLE_H__ */
> > >=20
> > > Removing this header would be correct only if GRANT_TABLE had a
> > > "depends on
> > > !PPC", I'm afraid. Recall that the earlier randconfig adjustment
> > > in
> > > CI was
> > > actually requested to be undone, at which point what an arch's
> > > defconfig
> > > says isn't necessarily what a randconfig should use.
> > We can do depends on !PPC && !RISCV but shouldn't it be enough only
> > to
> > turn CONFIG_GRANT_TABLE off in defconfig and set
> > CONFIG_GRANT_TABLE=3Dn
> > in EXTRA_XEN_CONFIG?
>=20
> That _might_ be sufficient for CI, but we shouldn't take CI as the
> only
> thing in the world. Personally I consider any kind of overriding for,
> in particular, randconfig at bets bogus. Whatever may not be selected
> (or must be selected) should be arranged for by Kconfig files
> themselves.
> That said, there may be _rare_ exceptions. But what PPC's and RISC-
> V's
> defconfig-s have right now is more than "rare" imo.
>=20
> > Some time ago I also tried to redefine "Config GRANT_TABLE" in
> > arch-
> > specific Kconfig + defconfig + EXTRA_XEN_CONFIG and it works for
> > me.
> > Could it be solution instead of "depends on..." ?
>=20
> Why would we want to re-define an setting? There wants to be one
> single
> place where a common option is defined. Or maybe I don't understand
> what you're suggesting ...
I just thought this change is temporary because grant_table.h will be
introduced later or earlier, and it will be needed to remove "depends
on !PPC && !RISCV". And not to litter common KConfig with the change
which will be removed, it will be better to redefine it in arch-
specific Kconfig with default n.

But after your words about one place, I realized that it would be
better to update a place where a common option is defined.

The only thing I would like to change is probably it will be better to
do the opposite, add "depends on" arches that support
CONFIG_GRANT_TABLE now so it will not need to update "depends on" for
new arches or arches that don't support CONFIG_GRANT_TABLE.

>=20
> > One more question I have do we really need this randconfig? On
> > RISC-V
> > side, I launched several time this patch series ( from v1 to v4 +
> > runs
> > during test of patch series ) and I haven't faced case
> > when CONFIG_GRANT_TABLE=3Dn. ( but I turned the config off in
> > defconfig +
> > EXTRA_XEN_CONFIG ).
>=20
> That override is why in CI you wouldn't see an issue. But as said -
> CI
> isn't everything.
From this point of view it will be better to add "depends on !PPC &&
!RISCV" to "Config GRANT_TABLE".


~ Oleksii

