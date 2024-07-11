Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54892E39C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 11:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757232.1166015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqHr-0003QF-Ol; Thu, 11 Jul 2024 09:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757232.1166015; Thu, 11 Jul 2024 09:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqHr-0003Nc-Lq; Thu, 11 Jul 2024 09:40:27 +0000
Received: by outflank-mailman (input) for mailman id 757232;
 Thu, 11 Jul 2024 09:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRqHq-0003NW-BF
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 09:40:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f351e1-3f69-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 11:40:24 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7979c3ffb1so47441666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 02:40:24 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bda30a24sm3261251a12.86.2024.07.11.02.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 02:40:23 -0700 (PDT)
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
X-Inumbo-ID: 98f351e1-3f69-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720690824; x=1721295624; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/f6Z6eMWa2sbcSzD/SLnjmWiOP67Xb549U5LBScDtn0=;
        b=ACUisDROweQ9N8a9KAmu0EhO0eWovAgduUxTDsTc196XPFl2vlMdpkW6LbsfMu7jBO
         fsRG1k5u+f5tt7UmEbIr1YaBY+8RdP7uSgnQe2Wro4ZEQCXUsgokQdXEc34uybIRLFNB
         wL6Q04LlrqeKCvbOGT6o/jHB6njWmHu+3SnXrvui5k2Pgf/6LBOXft4WHEVURA7VDpWM
         JS1wzmL9OJxuDUIIxnmrhlIwD+46DPQ9EJdpmTOAnCu1q11Yzn6WE8nunX847l8r1vhn
         xr0PmcA9eKULnyf4+8UegdcSdMdoke2QN5BrZhkitx9Fi5vTl2w5DgEiKe+XcrML+lWj
         iDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720690824; x=1721295624;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/f6Z6eMWa2sbcSzD/SLnjmWiOP67Xb549U5LBScDtn0=;
        b=DWcRueVJTRAdggDzt8Wro/oLlNPsi4Qj2FpoZUUlpmtgpETycO12BGjqJwiPRG5gWA
         K4EC9mKUXEnY6M1jo46kAsiLL/BldJ4f/vZqgAb8u0kp97WJoryDEj1/fJjh4t03gMcp
         6OG86G++qWhsKHbjhR5nIKN+TdKjGQnGNv7Nqk5vePPtR2N5BgBFhq+XN9JURW1hq+JR
         a/Tc9gXblAZjPUIDMMhN7BeKUnouBesZmwkkupCdciANSeODfmK+SyYa3HH9ES1blsHb
         Rb4hsTgJQox3/nXO/Dxow2rlUFpQ63GaXy1n9pvBwDt9mqhyD3cNdF9onVrFDpy2dAAY
         6ZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMH3FYg5vKuI3xko3zyi4tudX5YiqCbuxs3kGXgrMzAEcMK/2H3gYSph9OWVxGHPvv+TI6VFM6QSsyj02lxOaLf+E/HN5xMokNTPa4utM=
X-Gm-Message-State: AOJu0YyJANhzHGH2Dppiyaz6xqA42Sq7Jz6Lxcma3Va0zc2F+yi9uE0D
	PtY6BYusrAGpRQD47QGooiLDlueL14ZGKW355nxv2ilMB0C/lbej
X-Google-Smtp-Source: AGHT+IGyJYW8B5zdFqX1BSHd7d6L5PR7eurBXD2lMyNKDg8cNtfd/aWeiPUBWH2j5589S8VkkUm5Hg==
X-Received: by 2002:aa7:d0d5:0:b0:58e:2f7c:a9c with SMTP id 4fb4d7f45d1cf-594bc7cab19mr5986348a12.26.1720690823367;
        Thu, 11 Jul 2024 02:40:23 -0700 (PDT)
Message-ID: <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 11:40:22 +0200
In-Reply-To: <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
	 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
> On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > Except mapping of FDT, it is also printing command line passed by
> > a DTB and initialize bootinfo from a DTB.
>=20
> I'm glad the description isn't empty here. However, ...
>=20
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -41,6 +41,9 @@ FUNC(start)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 setup_initial_pagetables
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 a0, s1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=C2=A0=
 fdt_map
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Calculate proper VA=
 after jump from 1:1 mapping */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 a0, .L_primary_switched
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=A0=C2=A0=
=C2=A0 a0, a0, s2
>=20
> ... it could do with clarifying why this needs calling from assembly
> code. Mapping the FDT clearly looks like something that wants doing
> from start_xen(), i.e. from C code.
fdt_map() expected to work while MMU is off as it is using
setup_initial_mapping() which is working with physical address.

>=20
> > @@ -33,15 +35,34 @@ static void test_macros_from_bug_h(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 printk("WARN is most likely working\n");
> > =C2=A0}
> > =C2=A0
> > +void __init fdt_map(paddr_t dtb_addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 device_tree_flattened =3D early_fdt_map(dtb_addr);
> > +=C2=A0=C2=A0=C2=A0 if ( !device_tree_flattened )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("wrong FDT\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die();
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > =C2=A0void __init noreturn start_xen(unsigned long bootcpu_id,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t dtb_addr)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 size_t fdt_size;
> > +=C2=A0=C2=A0=C2=A0 const char *cmdline;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 remove_identity_mapping();
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 trap_init();
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 test_macros_from_bug_h();
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 fdt_size =3D boot_fdt_info(device_tree_flattened, d=
tb_addr);
>=20
> You don't use the return value anywhere below. What use is the local
> var
> then?
I returned just for debug ( to see what is the fdt size ), it can be
dropped now.

~ Oleksii

>=20
> Jan
>=20
> > +=C2=A0=C2=A0=C2=A0 cmdline =3D boot_fdt_cmdline(device_tree_flattened)=
;
> > +=C2=A0=C2=A0=C2=A0 printk("Command line: %s\n", cmdline);
> > +=C2=A0=C2=A0=C2=A0 cmdline_parse(cmdline);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 printk("All set up\n");
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
>=20


