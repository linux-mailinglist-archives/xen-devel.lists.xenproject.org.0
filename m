Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBE47808B1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 11:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585901.917109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWvty-0000mi-NO; Fri, 18 Aug 2023 09:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585901.917109; Fri, 18 Aug 2023 09:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWvty-0000jN-K3; Fri, 18 Aug 2023 09:36:18 +0000
Received: by outflank-mailman (input) for mailman id 585901;
 Fri, 18 Aug 2023 09:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdLL=ED=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWvtw-0000jH-VQ
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 09:36:17 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id accd6f63-3daa-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 11:36:15 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso951881e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 02:36:14 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w5-20020ac254a5000000b004fe142afd1esm268360lfk.152.2023.08.18.02.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 02:36:13 -0700 (PDT)
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
X-Inumbo-ID: accd6f63-3daa-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692351374; x=1692956174;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4MDiBvR5doqcFrcgVA6jJZk89eGPiqIy4GVoh8CypNo=;
        b=mA1uLE+0clYXKGNxMA066clRA8QbqXuaJbBzHYpCMNSnGGcQ+Zr49G1J8qWsNXqKoC
         s4wb941XTKDQE1wzozyMbO8gdUmF44Vs0KhpXWKs9RAyOmM9t60M63hkx/V6IpskVnji
         uigIF6WkqJggq3EAZwAbx0WYpn6mXrVhADfQ1g+1dW4yg+nfjaLMxUEzXW6koO1UoF9U
         pr4ofGuA3rdM0fiarS09kmPIrK0HoAoF3+Xgd7CBeXJlvbu84gb58KZkr9DRtx28cgf3
         fMNOlKKw439GfooshxfFx9hrhdv1zVyQsCOZiS3evh84xLhBF9Lk2di3jIJ7eb1cdXcC
         TxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692351374; x=1692956174;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MDiBvR5doqcFrcgVA6jJZk89eGPiqIy4GVoh8CypNo=;
        b=blLr/WC1yhwhAP42/tsTHayXk4vXj45IXKoN0T/ouSo9N8U2tlRQTywKZxpShz0Xio
         P70l00DlwZ4Z1dseza9HUaa59xKB+FnvwCODpXlwHdQwJkBuCBW6Fjbr7k4Y50HDZWN1
         bQz0+Hf3ooMNpyZZIA9TVgY8/YDG16LAbLKQhLPdHaIwT7y1SKorNQpVRSDZJIH6ZJqq
         LQYFZiJIb5iq2KBFxRHZIAhyppID5tTzT7ANZr168hJlxRqECCBNtPVqHXscjQm9pgt6
         7rld0AZQJ+7naGLAwRQGCf3rmB1BANUZWiX/3cClZ3Hsgzg9nR8CSE8cb1YwC8TH6l34
         KiFQ==
X-Gm-Message-State: AOJu0YzW8O3OD/20rJ/RCMo0pJXGwRw3rkiErHHsRVAgqwz8uHwEQvWz
	EBBaE+/SHYHRVxbVq7hM9w8=
X-Google-Smtp-Source: AGHT+IGsVOgM9Ra4AVUsZd1rc2WHRcSdPtXQZzoWfY6wUPLVudQcEYC6eTYT0+4aG93Jk1vLX0ZaiQ==
X-Received: by 2002:a05:6512:3494:b0:4fe:3724:fdae with SMTP id v20-20020a056512349400b004fe3724fdaemr1045543lfr.66.1692351373927;
        Fri, 18 Aug 2023 02:36:13 -0700 (PDT)
Message-ID: <f6d459f7c6736dde859ef3f508cdb9e0d626fcd1.camel@gmail.com>
Subject: Re: [PATCH v1 02/57] xen/riscv: add public arch-riscv.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Fri, 18 Aug 2023 12:36:13 +0300
In-Reply-To: <2b9cd73c-8ad2-9c82-bdfa-4b9af41f967f@suse.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
	 <d9721f72f4a51b1240ba180e33193c551b987251.1692181079.git.oleksii.kurochko@gmail.com>
	 <2b9cd73c-8ad2-9c82-bdfa-4b9af41f967f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-08-17 at 17:00 +0200, Jan Beulich wrote:
> On 16.08.2023 12:19, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/public/arch-riscv.h
> > @@ -0,0 +1,90 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Guest OS interface to RISC-V Xen.
> > + * Initially based on the ARM implementation.
> > + */
> > +
> > +#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
> > +#define __XEN_PUBLIC_ARCH_RISCV_H__
> > +
> > +#define=C2=A0 int64_aligned_t=C2=A0 int64_t __attribute__((__aligned__=
(8)))
> > +#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
> > +
> > +#ifndef __ASSEMBLY__
> > +#define ___DEFINE_XEN_GUEST_HANDLE(name, type)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +=C2=A0=C2=A0=C2=A0 typedef union { type *p; unsigned long q; }=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __guest_handle_ ## name;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 typedef union { type *p; uint64_aligned_t q; }=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __guest_handle_64_ ## name
> > +
> > +/*
> > + * XEN_GUEST_HANDLE represents a guest pointer, when passed as a
> > field
> > + * in a struct in memory. On RISCV is always 8 bytes sizes and 8
> > bytes
> > + * aligned.
> > + * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed
> > as an
> > + * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on
> > aarch64.
>=20
> Nit: aarch{32,64}?
Thanks. It should be updated to RISC-V.
>=20
> > + */
> > +#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
> > +=C2=A0=C2=A0=C2=A0 ___DEFINE_XEN_GUEST_HANDLE(name, type);=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0 ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type=
)
> > +#define DEFINE_XEN_GUEST_HANDLE(name)=C2=A0=C2=A0
> > __DEFINE_XEN_GUEST_HANDLE(name, name)
> > +#define __XEN_GUEST_HANDLE(name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __guest_handle_64_ ## name
> > +#define XEN_GUEST_HANDLE(name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 __XEN_GUEST_HANDLE(name)
> > +#define XEN_GUEST_HANDLE_PARAM(name)=C2=A0=C2=A0=C2=A0 __guest_handle_=
 ## name
> > +#define set_xen_guest_handle_raw(hnd, val)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=C2=A0=C2=A0=C2=A0 do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typeof(&(hnd)) _sxghr_tmp =
=3D &(hnd);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sxghr_tmp->q =3D 0;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sxghr_tmp->p =3D (val);=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 } while ( 0 )
>=20
> While I realize you simply took this from Arm, in new code I think it
> would be helpful to avoid name space violations from the beginning.
> Hence no leading underscore please for macro local variables.
> Trailing
> underscores is what we mean to use instead.
>=20
> It's also not really valid to use a gcc extension here, but I guess
> that's hard to avoid.
Thank you. Understood. I'll make the update.
>=20
> > +#define set_xen_guest_handle(hnd, val)
> > set_xen_guest_handle_raw(hnd, val)
> > +
> > +typedef uint64_t xen_pfn_t;
> > +#define PRI_xen_pfn PRIx64
> > +#define PRIu_xen_pfn PRIu64
> > +
> > +typedef uint64_t xen_ulong_t;
> > +#define PRI_xen_ulong PRIx64
> > +
> > +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> > +
> > +struct vcpu_guest_context {
> > +};
> > +typedef struct vcpu_guest_context vcpu_guest_context_t;
> > +DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> > +
> > +struct xen_arch_domainconfig {
> > +};
>=20
> While these are okay to remain empty, ...
>=20
> > +#endif
> > +
> > +struct arch_vcpu_info {
> > +};
> > +typedef struct arch_vcpu_info arch_vcpu_info_t;
> > +
> > +struct arch_shared_info {
> > +};
> > +typedef struct arch_shared_info arch_shared_info_t;
>=20
> ... these two need to gain a "todo" marker so that we won't forget
> to at least add a placeholder entry if no real ones surface.
I'll make the update. Thanks.

>=20
> > +/* Maximum number of virtual CPUs in legacy multi-processor
> > guests. */
> > +/* Only one. All other VCPUS must use VCPUOP_register_vcpu_info */
>=20
> Nit: Style (missing full stop). And quite likely the two comments
> could
> be joined to a single one.
I'll take it into account.
>=20
> > +#define XEN_LEGACY_MAX_VCPUS 1
> > +
> > +#endif /* __ASSEMBLY__ */
> > +
> > +#ifndef __ASSEMBLY__
>=20
> Why not continue the earlier !__ASSEMBLY__ section?
Sure, we can continue the earlier !__ASSEBLY__ section. I'll update
this part.

~ Oleksii

