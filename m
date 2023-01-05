Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659EF65F0E1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472065.732176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSpJ-0000EZ-Qd; Thu, 05 Jan 2023 16:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472065.732176; Thu, 05 Jan 2023 16:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSpJ-0000Cg-O0; Thu, 05 Jan 2023 16:10:45 +0000
Received: by outflank-mailman (input) for mailman id 472065;
 Thu, 05 Jan 2023 16:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDSpH-0000Ca-Uv
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:10:44 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80764ce5-8d13-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 17:10:41 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1696015wms.5
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 08:10:41 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm3319613wmb.42.2023.01.05.08.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:10:41 -0800 (PST)
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
X-Inumbo-ID: 80764ce5-8d13-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y5mKZv7OSvb+gUvfokTjsdLcRFx1w454ZQ5fGUDCzkc=;
        b=mLRGhG4N2khtiYCt0m2gljJKvR5S6u3EOJQNLukMupFWL7inRHP+h85SmPZUph10lg
         JWM56s82st49lZEq075Jb0l+VN/hZ969l/j9iPFwgWK8g10kROhPQ97LUUmCZOnh2ZVu
         W7SZglo/H6cwoCZa9AdqS4Z+mfSRHowsFEk/Ou2ET7VPDfGRom799hoxNejczlyEy02S
         05FBdnuzRc8ZyVbxIKDufDdtCm2fJbvZlqgQafVlJxiqW1+JJV0iDPVXiO+KjcFVeafP
         cSEq5202DsNMb2yuEZ2PKmFxdJPjP9/EuxjuHr2QPPpPqWxb/BIHOokQ+QfFv0bRagCB
         XktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5mKZv7OSvb+gUvfokTjsdLcRFx1w454ZQ5fGUDCzkc=;
        b=4WFarSJpmF/Mh/Nd1ORHKK9OZ6+/htwi7oge25C5u1bF9JHMQ2lDes0EyGANvJRn68
         zWKviIJ49UtEyE6+OgA+3CububWDYSQOcDvtFsVGq5VcKmfL9S1aa8hqOF+r5KufoSrq
         cUXteQ8BMFUELjKLToB+a3neQjNPKWAd7bGdz2QHs1oaDsTZt/+3JofFugCJabJJYXdF
         Cm26EdQGVROGUpHZ8mkXkJkzDzZkHQTCkuQv+MwNtkgmaLwxm+vsO3KSezvddVCSpsCI
         pBuahWVMk43unNRqSNcxxKc3+60cijdcJf9O8YvYzfXvTw3K5Zj2vXbCzjobrBSfRJFh
         eX9w==
X-Gm-Message-State: AFqh2kr7ErHVVdp5ra7YCjBYznoUfI4oH+UYapWHJUxEBdulVRcv2l1M
	3SKriAP84+0IOI9ZUisOrTs=
X-Google-Smtp-Source: AMrXdXt8/5c0/IzSkBmxdpQks124bU7k/ld+ca9ksdm1QYFSy+VyjzGBbu+UMDMdaO2U0KjQrHm05A==
X-Received: by 2002:a05:600c:4da2:b0:3d2:39dc:f50e with SMTP id v34-20020a05600c4da200b003d239dcf50emr36630874wmp.7.1672935041317;
        Thu, 05 Jan 2023 08:10:41 -0800 (PST)
Message-ID: <439a5b7624dbf4d4ff6acbb9b3a6f15b777ba0fc.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run
 minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Thu, 05 Jan 2023 18:10:39 +0200
In-Reply-To: <01888162-49fb-a280-a088-5e81edff3919@citrix.com>
References: <cover.1672912316.git.oleksii.kurochko@gmail.com>
	 <ef6dbb71b27c75fe0dffb72d65ab457d27430475.1672912316.git.oleksii.kurochko@gmail.com>
	 <591d6624-2bd2-93f0-f5d6-760043230756@suse.com>
	 <01888162-49fb-a280-a088-5e81edff3919@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-01-05 at 15:48 +0000, Andrew Cooper wrote:
> On 05/01/2023 1:40 pm, Jan Beulich wrote:
> > On 05.01.2023 13:01, Oleksii Kurochko wrote:
> > > To run in debug mode should be done the following instructions:
> > > =C2=A0$ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -kernel xen/xen -s -S
> > > =C2=A0# In separate terminal:
> > > =C2=A0$ riscv64-buildroot-linux-gnu-gdb
> > > =C2=A0$ target remote :1234
> > > =C2=A0$ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
> > > =C2=A0$ hb *0x80200000
> > > =C2=A0$ c # it should stop at instruction j 0x80200000 <start>
> > This suggests to me that Xen is meant to run at VA 0x80200000,
> > whereas ...
> >=20
> > > --- a/xen/arch/riscv/include/asm/config.h
> > > +++ b/xen/arch/riscv/include/asm/config.h
> > > @@ -1,6 +1,9 @@
> > > =C2=A0#ifndef __RISCV_CONFIG_H__
> > > =C2=A0#define __RISCV_CONFIG_H__
> > > =C2=A0
> > > +#include <xen/const.h>
> > > +#include <xen/page-size.h>
> > > +
> > > =C2=A0#if defined(CONFIG_RISCV_64)
> > > =C2=A0# define LONG_BYTEORDER 3
> > > =C2=A0# define ELFSIZE 64
> > > @@ -28,7 +31,7 @@
> > > =C2=A0
> > > =C2=A0/* Linkage for RISCV */
> > > =C2=A0#ifdef __ASSEMBLY__
> > > -#define ALIGN .align 2
> > > +#define ALIGN .align 4
> > > =C2=A0
> > > =C2=A0#define ENTRY(name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > =C2=A0=C2=A0 .globl name;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > @@ -36,6 +39,10 @@
> > > =C2=A0=C2=A0 name:
> > > =C2=A0#endif
> > > =C2=A0
> > > +#define XEN_VIRT_START=C2=A0 _AT(UL, 0x00200000)
> > ... here you specify a much lower address (and to be honest even
> > 0x80200000
> > looks pretty low to me for 64-bit, and perhaps even for 32-bit).
> > Could you
> > clarify what the plans here are? Maybe this is merely a temporary
> > thing,
> > but not called out as such?
>=20
> It's stale from v1 which had:
>=20
> #define XEN_VIRT_START=C2=A0 0x80200000
>=20
>=20
> But honestly, I don't think the qemu details in the commit message
> are
> useful.=C2=A0 This series is just about making "make build" work.
>=20
> The next series (being worked on, but not posted yet) is only a few
> patches and gets a full Gitlab CI smoke test, at which point the
> smoke
> test shell script is the reference for how to invoke qemu.
>=20
>=20
> I'm happy to R-by this series and drop that part of the commit
> message
> on commit.
>=20
I'm happy with that. Thanks.
> ~Andrew


