Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295776C4B5E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513439.794421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyG8-0001zO-BC; Wed, 22 Mar 2023 13:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513439.794421; Wed, 22 Mar 2023 13:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyG8-0001xS-8P; Wed, 22 Mar 2023 13:12:08 +0000
Received: by outflank-mailman (input) for mailman id 513439;
 Wed, 22 Mar 2023 13:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1peyG6-0001xM-Ki
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:12:06 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24807966-c8b3-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 14:12:05 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso11471833wmo.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 06:12:05 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c020500b003ee72a1b90bsm488427wmi.13.2023.03.22.06.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 06:12:04 -0700 (PDT)
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
X-Inumbo-ID: 24807966-c8b3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679490725;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0+4lVRBR9TvDNrfIaJmA0XwDY2AKVPJHVc4KjU/l0dQ=;
        b=g7mM9qekXOCosTfWKj3bPRqgX6pXWyXDtZbPTwPL6M2tZHmCKWHcwEXP/7F5ElP0l3
         JBatHhD+3A+Xb9iakb3d40dmEC0Z/GpN3NuOQT61exFetw3KXdQQEyg7Q1w9vxwlTEib
         pXVHTpvgnhMpU58nmnL/O/IM5YmhaV/7MtwRNf72j66YcbauXYaBJKQkI1ZohUT3T+lL
         G95hmPUm+DOJM3zVbN+4HACO4ffg79/SYbdvUA2ku5FFRNZlmm+RiwlrEGhyOsShm7Tf
         e6Wb6Beq6AQjB/fZ/Pub4iHhslfMbwBXEjOmSDcvr2zzuyxuWaYfWdWmTJB7wpMvD2TY
         IDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679490725;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+4lVRBR9TvDNrfIaJmA0XwDY2AKVPJHVc4KjU/l0dQ=;
        b=UCylDi3NdpwHEbmmPKIYbjkm+rxdFsIzUqv3PMSn2iYSCt3RdqL5YmEyfnLBLAKNro
         ZUeH7z/CtCXeU0JNr/E1iXvfXLbFHzuS0DPKQVtuv1SpyJkfZ/KkBmniqcOussYr+pnT
         TAwuJ1xwqMZAnvCEWizDeXIg/iOLDsEu1roDmcrPLhV1OItXno50s99e8tRolgtgdz1d
         XyBCg2slnzm+DjBCE3m0G/YL+wkHWV5TzR23oyJ+XT4nO0ozMpLy/o/Smvie8DSkDLJS
         u9ikXBNPwNFZslUASqY6o0g3gMq6U/cPNoScC3NRwwVzEdtiLG4H8VncyYdSCY9rhbwC
         T+LA==
X-Gm-Message-State: AO0yUKVXbnzYljnX3UZxCf3AMK0MiddiK8z63/G52H7OWFouNrpqxVuB
	/Ix5guNM+nxFxyxr5PR+zWM=
X-Google-Smtp-Source: AK7set+Kk6dMJBTIe2gZkdK0SoeVHyzNvzAkc4BDcSgxRugjxfCDvaj1ZuFcYmw4O2gZx3Fczo4SUQ==
X-Received: by 2002:a7b:ce8a:0:b0:3ea:f883:53ea with SMTP id q10-20020a7bce8a000000b003eaf88353eamr5480650wmj.7.1679490725057;
        Wed, 22 Mar 2023 06:12:05 -0700 (PDT)
Message-ID: <8190c7129ea9f5d90867d4f88233103d1cfb5e44.camel@gmail.com>
Subject: Re: [PATCH v5 1/7] xen/riscv: introduce boot information structure
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 15:12:02 +0200
In-Reply-To: <05b04f94-9867-64f4-53e1-57e8238b049d@citrix.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <553b07e967f56b78eba2d27c9115cce707a45c08.1678976127.git.oleksii.kurochko@gmail.com>
	 <05b04f94-9867-64f4-53e1-57e8238b049d@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-21 at 11:56 +0000, Andrew Cooper wrote:
> On 16/03/2023 2:39 pm, Oleksii Kurochko wrote:
> > The structure holds information about:
> > 1. linker start/end address
> > 2. load start/end address
> >=20
> > Also the patch introduces offsets for boot information structure
> > members to access them in assembly code.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V5:
> > =C2=A0* the patch was introduced in the current patch series (V5)
> > ---
> > =C2=A0xen/arch/riscv/include/asm/boot-info.h | 15 +++++++++++++++
> > =C2=A0xen/arch/riscv/riscv64/asm-offsets.c=C2=A0=C2=A0 |=C2=A0 3 +++
> > =C2=A02 files changed, 18 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/boot-info.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/boot-info.h
> > b/xen/arch/riscv/include/asm/boot-info.h
> > new file mode 100644
> > index 0000000000..cda3d278f5
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/boot-info.h
> > @@ -0,0 +1,15 @@
> > +#ifndef _ASM_BOOT_INFO_H
> > +#define _ASM_BOOT_INFO_H
> > +
> > +extern struct boot_info {
> > +=C2=A0=C2=A0=C2=A0 unsigned long linker_start;
> > +=C2=A0=C2=A0=C2=A0 unsigned long linker_end;
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_start;
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_end;
> > +} boot_info;
> > +
> > +/* LINK_TO_LOAD() and LOAD_TO_LINK() works only when MMU isn't
> > enabled. */
> > +#define LINK_TO_LOAD(addr) ((addr) - boot_info.linker_start +
> > boot_info.load_start)
> > +#define LOAD_TO_LINK(addr) ((addr) - boot_info.load_start +
> > boot_info.linker_start)
> > +
> > +#endif
> > \ No newline at end of file
>=20
> As a minor point, you should have newlines at the end of each file.
>=20
> However, I'm not sure boot info like this is a clever move.=C2=A0 You're
> creating a 3rd different way of doing something which should be
> entirely
> common.=C2=A0 Some details are in
> https://lore.kernel.org/xen-devel/115c178b-f0a7-cf6e-3e33-e6aa49b17baf@sr=
cf.net/
> and note how many errors I already found in x86 and ARM.
>=20
In the link above you mentioned that:
  Reviewing its usage shows that ARM is broken when trying to handle
  BUG/ASSERT in livepatches, because they don't check is_patch() on the
  message target.
Check is_patch() will be added to ARM implementation after generic bug
implementation will be merged:=20
https://lore.kernel.org/xen-devel/2afad972cd8da98dcb0ba509ba29ff239dc47cd0.=
1678900513.git.oleksii.kurochko@gmail.com/
> Perhaps its time to dust that plan off again.=C2=A0 As Jan says, there's
> _start and _end (or future variations therefore), and xen_phys_start
> which is all that ought to exist in order to build the common
> functionality.
I am unsure that I understand why the introduction of boot_info is a
bad idea.
Basically, it is only a wrapper/helper over _start, _end, and
xen_phys_start ( it is not introduced explicitly as taking into account
that access of _start will be PC-relative it is equal to xen_phys_start
).

~ Oleksii

