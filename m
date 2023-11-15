Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839D7EC730
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 16:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633744.988786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Hnz-0007KU-AS; Wed, 15 Nov 2023 15:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633744.988786; Wed, 15 Nov 2023 15:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Hnz-0007IK-7z; Wed, 15 Nov 2023 15:27:51 +0000
Received: by outflank-mailman (input) for mailman id 633744;
 Wed, 15 Nov 2023 15:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CM7O=G4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3Hnx-0007IE-Bc
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 15:27:49 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c364a3-83cb-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 16:27:47 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c79d8b67f3so78705001fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 07:27:47 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z39-20020a2ebe27000000b002c0414c3b6csm1684132ljq.121.2023.11.15.07.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:27:45 -0800 (PST)
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
X-Inumbo-ID: 87c364a3-83cb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700062067; x=1700666867; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A3jY49AiU77kANltAjrb4gWhNAe0I3mMqoAQYPGa4U0=;
        b=h53UzGoxvO+SjoXwabHyb7wCCXmCxvjwDMhnai4vjVUajGie5qmznZvTNM1c7ecAwx
         lYmFMPWJBDCj9UJCQtsSOGnMrpAHjrIYr8nWDBwux+4sV8kYk4ZPLLAVrv7AAqEC/BDH
         7cMFmrRql/sB/39w+bBev1yH8VCq99Hw/jQCcU1U3js+zzbtadYEE9oAt2o3BzlUIg5R
         kotjOT25VyE0AilEoZxv2fS7exM/xTGbZrivjFLKwle+/PHqizpQFL0FD8Mjgc4y0rqU
         vOJDHne+ut/Q76aXBoEy+hKbwLVvTVmu+VOaAFGVofHgFnwu/aAA21JNyohxuZk31XEs
         h+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700062067; x=1700666867;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3jY49AiU77kANltAjrb4gWhNAe0I3mMqoAQYPGa4U0=;
        b=TUpo9oYCytDy/T8Jml91ra2y3m99qvisj1mk/SqeLpyt1UO9SB9uRSt3Jok/xZ3828
         HBEVXO2TGwmxVMdo5b82FRz4WhZMrfhHmJ2mgVoyi+MjxSt4m86tozU42MGSVRpZlzHe
         JwA2+lxDkKgjlFDIdi1IYI7iAKWSGE6fb+zxQ2iHoAc7d8mNHTVorPJwArQsvCoGhPJF
         WdqgMq1NyBX3asP+p8tYtXn4qwvIdZ7VvuFiXqIylQZwvs8DcD3PN840DqvMY10aTKQi
         d1VWrX07JhTa+JR4KTOCQqYTeqCDL6hIRvqvvxMuSFMm9FSKqq6qO1o9POhthSSp7SBk
         hGPw==
X-Gm-Message-State: AOJu0YwTS0i4X+oe6iOAmZVdSG6sQevDnybXsmaTvFHjvbrvyjjSqV+f
	IWFIjv+WyBYqY3g1ZlCa6fUZFWgU/bg=
X-Google-Smtp-Source: AGHT+IGFwKnWIO7z19b72dgwGFbLZXRqpGemRCoxI3IgnG2BgD3xxvYGxmsiyDPZuy2W16I/LeVY6w==
X-Received: by 2002:a2e:be89:0:b0:2c6:ed6a:780f with SMTP id a9-20020a2ebe89000000b002c6ed6a780fmr4696191ljr.11.1700062066703;
        Wed, 15 Nov 2023 07:27:46 -0800 (PST)
Message-ID: <accc07bd3ab9d7e819d7f2d670362a9570e2bc19.camel@gmail.com>
Subject: Re: [PATCH v2 08/15] xen/asm-generic: introduce generic header
 percpu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>
Date: Wed, 15 Nov 2023 17:27:45 +0200
In-Reply-To: <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

I have to drop arch specific headers and switch to asm-generic version.
I'll do the same for patches 09-12 in the next patch version.

~ Oleksii
On Fri, 2023-11-10 at 18:30 +0200, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- use smp_processor_id() =
instead of get_processor_id().
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update commit message .
> ---
> =C2=A0xen/include/asm-generic/percpu.h | 35
> ++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 35 insertions(+)
> =C2=A0create mode 100644 xen/include/asm-generic/percpu.h
>=20
> diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-
> generic/percpu.h
> new file mode 100644
> index 0000000000..85a3f3ef17
> --- /dev/null
> +++ b/xen/include/asm-generic/percpu.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_PERCPU_H__
> +#define __ASM_GENERIC_PERCPU_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>
> +
> +extern char __per_cpu_start[], __per_cpu_data_end[];
> +extern unsigned long __per_cpu_offset[NR_CPUS];
> +void percpu_init_areas(void);
> +
> +#define per_cpu(var, cpu)=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
> +
> +#define this_cpu(var) \
> +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(&per_cpu__##var,
> __per_cpu_offset[smp_processor_id()]))
> +
> +#define per_cpu_ptr(var, cpu)=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
> +#define this_cpu_ptr(var) \
> +=C2=A0=C2=A0=C2=A0 (*RELOC_HIDE(var, smp_processor_id()))
> +
> +#endif
> +
> +#endif /* __ASM_GENERIC_PERCPU_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


