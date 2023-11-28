Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176897FBB8A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643168.1003111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7y8d-0004AR-9H; Tue, 28 Nov 2023 13:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643168.1003111; Tue, 28 Nov 2023 13:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7y8d-00047t-67; Tue, 28 Nov 2023 13:28:31 +0000
Received: by outflank-mailman (input) for mailman id 643168;
 Tue, 28 Nov 2023 13:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3UE=HJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7y8c-00047n-9F
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:28:30 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0459e259-8df2-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 14:28:29 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9b7bd6fffso5269641fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 05:28:29 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 16-20020a2e1450000000b002c8872c9d53sm1842529lju.8.2023.11.28.05.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 05:28:28 -0800 (PST)
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
X-Inumbo-ID: 0459e259-8df2-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701178108; x=1701782908; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0dkruUYMz1Go2XKY5BGJdjB2yV6sYl0gEVmAWd3+4eY=;
        b=YqIkV6DYG4syN2ZRIa9BuUlQY//z1pw/vjfiq4yC2Zx2lFjpMhIcGXi9n3XZc+T/XM
         57pTFlWu0shDFxDv2uNrPrEROBn7mbAlmKrSaykhQBzSKwxjnFfIOhQIKtOmbM6pQnDS
         pKDh6u3l3I56Pj11zTJ5hTFc6GoDh3KC1DxPKvNx2/h7iVzsz72ZmRVUZ9GSOYxl/I/u
         zByaas0JDR6aE9VA4NYlA6v+DxsdjFoBoA03s0qeaBnFvLM0x+36yw/AOkOiwWYZhHXv
         vM37CdvDguNntUleKrdEumg1O0NF/bJ7zp0q3ZWDVlDBAFk0/21SUPBf90DOJIDpNCId
         mDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701178108; x=1701782908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0dkruUYMz1Go2XKY5BGJdjB2yV6sYl0gEVmAWd3+4eY=;
        b=BhmZf+sJ5r0IfqibRWj7Ob6NKPDVIKfmxf5qIE23v01W6nzg4XKJlsht93ovFGrPbc
         rBOzoz+kR0YksyX8ZKA5PRxHnQhWTtXrMSreBXOcCH1xasMnKn1MS3HzrxwDH967IGEF
         Tdq2fG6AEsuJ3hSGK8RE1Y/5ohT39DFfq0s5R+tAdwPuL7CANkbdgQXD8wuszc81tjDf
         bdrPx/H817T3o3JfBszA2QXiUZi9fi2VzywEHmRH7RN3wcGI9Noi9WgSS0XWFLH171wg
         SYHKn8tCLPGvuBN2io2vY6npr3GdqHVk++OEwWwgb+WMyYsWIBEVqU09ZJlnfXtmJscW
         uGvg==
X-Gm-Message-State: AOJu0YyJ77LEjAOnoJAvFjCA//XUahBnGRqSAwLlx1rujWCpclw8NAIX
	AD1O9CdZrevXdeKLFPyFT+f+3AWD0q1Heg==
X-Google-Smtp-Source: AGHT+IG7YVV/N59R58+lAFyo4Qnu8/iJSllGM+HwQ5pjOnvrHZ3NlJontOpIHXqduYGy/iot+BPQCA==
X-Received: by 2002:a2e:9218:0:b0:2c9:afeb:79ad with SMTP id k24-20020a2e9218000000b002c9afeb79admr1393579ljg.25.1701178108286;
        Tue, 28 Nov 2023 05:28:28 -0800 (PST)
Message-ID: <4489087a5daed388f23f7a5138ea031be2bb15f9.camel@gmail.com>
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
Date: Tue, 28 Nov 2023 15:28:27 +0200
In-Reply-To: <6e486d72-d223-46a3-b52d-aaad2fc861ea@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
	 <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
	 <6543c6aec8f69878e37912924b6d6208136a02af.camel@gmail.com>
	 <405c2d66-a6f4-4bbb-ada5-2ac49c8c9744@suse.com>
	 <195a50316efde86113f6f5df269c754a90490c57.camel@gmail.com>
	 <b81607e0-409f-4805-a4ee-8be8fdd959b8@suse.com>
	 <893de5be9743dd4fc908dfbbfd1e7dc890f74b07.camel@gmail.com>
	 <6e486d72-d223-46a3-b52d-aaad2fc861ea@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-11-28 at 13:53 +0100, Jan Beulich wrote:
> On 28.11.2023 12:49, Oleksii wrote:
> > On Tue, 2023-11-28 at 10:58 +0100, Jan Beulich wrote:
> > > On 28.11.2023 10:28, Oleksii wrote:
> > > > On Tue, 2023-11-28 at 08:57 +0100, Jan Beulich wrote:
> > > > > On 27.11.2023 20:38, Oleksii wrote:
> > > > > > On Mon, 2023-11-27 at 15:41 +0100, Jan Beulich wrote:
> > > > > > > On 27.11.2023 15:13, Oleksii Kurochko wrote:
> > > > > > > > --- a/xen/arch/ppc/include/asm/grant_table.h
> > > > > > > > +++ /dev/null
> > > > > > > > @@ -1,5 +0,0 @@
> > > > > > > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > > > > -#ifndef __ASM_PPC_GRANT_TABLE_H__
> > > > > > > > -#define __ASM_PPC_GRANT_TABLE_H__
> > > > > > > > -
> > > > > > > > -#endif /* __ASM_PPC_GRANT_TABLE_H__ */
> > > > > > >=20
> > > > > > > Removing this header would be correct only if GRANT_TABLE
> > > > > > > had
> > > > > > > a
> > > > > > > "depends on
> > > > > > > !PPC", I'm afraid. Recall that the earlier randconfig
> > > > > > > adjustment
> > > > > > > in
> > > > > > > CI was
> > > > > > > actually requested to be undone, at which point what an
> > > > > > > arch's
> > > > > > > defconfig
> > > > > > > says isn't necessarily what a randconfig should use.
> > > > > > We can do depends on !PPC && !RISCV but shouldn't it be
> > > > > > enough
> > > > > > only
> > > > > > to
> > > > > > turn CONFIG_GRANT_TABLE off in defconfig and set
> > > > > > CONFIG_GRANT_TABLE=3Dn
> > > > > > in EXTRA_XEN_CONFIG?
> > > > >=20
> > > > > That _might_ be sufficient for CI, but we shouldn't take CI
> > > > > as
> > > > > the
> > > > > only
> > > > > thing in the world. Personally I consider any kind of
> > > > > overriding
> > > > > for,
> > > > > in particular, randconfig at bets bogus. Whatever may not be
> > > > > selected
> > > > > (or must be selected) should be arranged for by Kconfig files
> > > > > themselves.
> > > > > That said, there may be _rare_ exceptions. But what PPC's and
> > > > > RISC-
> > > > > V's
> > > > > defconfig-s have right now is more than "rare" imo.
> > > > >=20
> > > > > > Some time ago I also tried to redefine "Config GRANT_TABLE"
> > > > > > in
> > > > > > arch-
> > > > > > specific Kconfig + defconfig + EXTRA_XEN_CONFIG and it
> > > > > > works
> > > > > > for
> > > > > > me.
> > > > > > Could it be solution instead of "depends on..." ?
> > > > >=20
> > > > > Why would we want to re-define an setting? There wants to be
> > > > > one
> > > > > single
> > > > > place where a common option is defined. Or maybe I don't
> > > > > understand
> > > > > what you're suggesting ...
> > > > I just thought this change is temporary because grant_table.h
> > > > will
> > > > be
> > > > introduced later or earlier, and it will be needed to remove
> > > > "depends
> > > > on !PPC && !RISCV". And not to litter common KConfig with the
> > > > change
> > > > which will be removed, it will be better to redefine it in
> > > > arch-
> > > > specific Kconfig with default n.
> > >=20
> > > Right. But if it's indeed temporary, what's the point of this
> > > patch?
> > > The entire series is (supposed to be) to improve code structure
> > > for
> > > longer term purposes. If a non-generic grant_table.h is going to
> > > appear for PPC and RISC-V, I don't see why the present dummy
> > > would
> > > need removing. That's only useful if an arch can be expected to
> > > live
> > > with GRANT_TABLE=3Dn even when otherwise feature-complete, and at
> > > that
> > > point modifying the Kconfig dependencies would (imo) be
> > > appropriate.
> > I agree. Let's proceed by adding the dependency in the KConfig
> > file.
> >=20
> > So which one option will be better:
> > 1. depends on !PPC && !RISCV
> > 2. depends on ARM || X86
>=20
> Agreeing and then making this suggestion contradicts one another.
> Unless
> the long-term plan is for PPC and RISC-V to not use grant tables.
On RISC-V side, I can run guests in dom0less and still don't use
grant_tables. And I am not sure when I'll start to implement it. Only
one thing I defined in grant_table.h is:
#define gnttab_dom0_frames()                                         =20
\
    min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext -
_stext))

But I think it can moved somewhere or dropped as it was defined because
of:

void __init create_dom0(void)
{
    struct domain *dom0;
    struct xen_domctl_createdomain dom0_cfg =3D {
        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
        .max_evtchn_port =3D -1,
        .max_grant_frames =3D gnttab_dom0_frames(),
        .max_maptrack_frames =3D -1,
        .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
    };
...

Which was copied from Arm.

Taking into account that opt_max_grant_frames is 0 in case when
CONFIG_GRANT_TABLE=3Dn then ".max_grant_frames =3D" will be 0 in case of
!CONFIG_GRANT_TABLE so for time being the macros gnttab_dom0_frames can
be dropped until CONFIG_GRANT_TABLE will be introduced.

But I am not aware of PPC plans of usage this config.

~ Oleksii

