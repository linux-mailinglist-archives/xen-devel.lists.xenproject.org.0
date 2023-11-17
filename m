Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612947EEF86
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634993.990668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vcd-0004XE-BR; Fri, 17 Nov 2023 09:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634993.990668; Fri, 17 Nov 2023 09:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vcd-0004UO-8D; Fri, 17 Nov 2023 09:58:47 +0000
Received: by outflank-mailman (input) for mailman id 634993;
 Fri, 17 Nov 2023 09:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3vcb-0004UA-DB
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:58:45 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4dc4921-852f-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 10:58:44 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c5210a1515so23761971fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 01:58:44 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a2e2d01000000b002bce77e4ddfsm153677ljt.97.2023.11.17.01.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 01:58:42 -0800 (PST)
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
X-Inumbo-ID: e4dc4921-852f-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700215123; x=1700819923; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tL/0MeBckHihb8R5f6rYh+uiemrcgAOHpBmk3gavQXY=;
        b=nfVNBAXIN1dgFeaXZRLoCntwvVxTPEDvMlj/ic0EoomtHBP8X/5xYJa8Q0DX4qtto8
         1oXai+4b135cIbNz+t06RnAHR7Yq8x6wqUNBWybm2/dHlKVkEyupUsHVeQnXSVKondAt
         qI260SNxjdb8iiQf2yHPgMU09vAh3aid5aEyFDW3ZwlvHdd27dnNacX3OEKdUyvnzYJl
         CqM7ftNqlf+5NUCWtT3EN2Akjkssk1g6OxjBJrcMwBWZ8bVYZePYT6Vxf5bjKqV3c8jm
         CZiN3A2M1JrdsbXm4az8A2feVY1jCZ/3H+0LZrz6nKdrYOESBZrieOJWQ2FOjQPVK2Ow
         Qi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700215123; x=1700819923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tL/0MeBckHihb8R5f6rYh+uiemrcgAOHpBmk3gavQXY=;
        b=KxcyLWrDrSbykeix4xawBFEu0TidiwHQcEoa99MB/JoojaX6xenOASOkiYgbxMnMVl
         X8ocqlxLWpvPJ03yvP8RY7azJ2IebRnTQY5bvWbZSKMvLxQ4wNwN8U7hAlRdV1aQOMY3
         XmBdXhcU8G2CwnE5c7USaJCBxesGRuCU2QHdZnfSqHatBYkTekjiDecIJgspCfPgK1X+
         estyYHFU317ZMck8dzoGQSuD5ffJRtnepjQDHee+05taMY0O9t/y9nDhwqBiVIn0Auw5
         50yAEYJy1VF5Yh/5Nuwf96Znpoii63C5LLVNIetNzUtfkumUZp2lfiJay2lxvmA7u9Z7
         QdSQ==
X-Gm-Message-State: AOJu0YxLdpCJi5FKC8MxhUCVaUyVOD9BmJqz2E9/7+h4As1qh9EibGcl
	QDimpozVKmpJ8hDQCawmLEs77mNSW+E=
X-Google-Smtp-Source: AGHT+IEKvbNbiKelTa6LWD4E5hUrOg1NLvetZBpMnYCPwjS3FnXSDafOsQHYz3cuTWrGzvnL301I+Q==
X-Received: by 2002:a2e:1451:0:b0:2c5:4a5:9560 with SMTP id 17-20020a2e1451000000b002c504a59560mr8317608lju.41.1700215123107;
        Fri, 17 Nov 2023 01:58:43 -0800 (PST)
Message-ID: <cc1aba5e773255317fbcfdb522f089d8733108d7.camel@gmail.com>
Subject: Re: [PATCH v2 09/15] xen/asm-generic: introduce generic header smp.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>
Date: Fri, 17 Nov 2023 11:58:41 +0200
In-Reply-To: <bf7b027f7ae05533a6b2034e2ad4882ae27f2c67.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <bf7b027f7ae05533a6b2034e2ad4882ae27f2c67.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

I will drop this patch as it will be hard to make it generic for Arm,
PPC and RISC-V.

~ Oleksii

On Fri, 2023-11-10 at 18:30 +0200, Oleksii Kurochko wrote:
> <asm/smp.h> is expcted to be generic between Arm, PPC and RISC-V
> there by it is moved to asm-generic.
>=20
> Right now it is common only by PPC and RISC-V but during work on
> support of the mentioned arhcs <asm/smp.h> is expected to be the
> same.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- drop #ifded ASSEMBLY as=
 this header isn't expected to be
> included in asm files.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the commit messa=
ge.
> ---
> =C2=A0xen/include/asm-generic/smp.h | 28 ++++++++++++++++++++++++++++
> =C2=A01 file changed, 28 insertions(+)
> =C2=A0create mode 100644 xen/include/asm-generic/smp.h
>=20
> diff --git a/xen/include/asm-generic/smp.h b/xen/include/asm-
> generic/smp.h
> new file mode 100644
> index 0000000000..6740a2064c
> --- /dev/null
> +++ b/xen/include/asm-generic/smp.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_SMP_H
> +#define __ASM_GENERIC_SMP_H
> +
> +#include <xen/cpumask.h>
> +#include <xen/percpu.h>
> +
> +DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> +DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> +
> +#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
> +
> +/*
> + * Do we, for platform reasons, need to actually keep CPUs online
> when we
> + * would otherwise prefer them to be off?
> + */
> +#define park_offline_cpus false
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: BSD
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


