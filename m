Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35B7DBB4F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625127.974073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSrk-00061p-N6; Mon, 30 Oct 2023 14:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625127.974073; Mon, 30 Oct 2023 14:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSrk-0005zK-KK; Mon, 30 Oct 2023 14:03:40 +0000
Received: by outflank-mailman (input) for mailman id 625127;
 Mon, 30 Oct 2023 14:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFdh=GM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qxSrk-0005zE-3l
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:03:40 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f6a9249-772d-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 15:03:38 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507962561adso6556115e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 07:03:38 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t24-20020ac24c18000000b00504211d2a73sm1451017lfq.230.2023.10.30.07.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 07:03:36 -0700 (PDT)
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
X-Inumbo-ID: 1f6a9249-772d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698674617; x=1699279417; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Et7bLkuUyjr6eBHNiSQU/8YQxesnW4GB9tMYVVUOI5M=;
        b=YTjOvZYsTjpHmbzq6mkUby/FXAvbl+E1onjd66U/aGi7NezGHNN95SmHiF+xIVzD+O
         Pl3iD3fBUtN/G5SBkv21s4b1kTVuWwKTJ3QKK9Y3tvAyoQCjcyKVOhoPXqASzzFQUPb3
         gIl8ecIy0q0uUHBty42lfssO8xZGbpTRkN3GYaJoWGk1L+K+5Q69HbUqLn40mUXIdjpE
         4TQe4N7XTk0qL3pTeQ85kw5NSrL0gVY6EALq5vVoZItjNMmiJXoTiPPjB/fX0/JGwIhU
         hWUOWAEZHnhFCJv/2p4SrlmblZO4SaONPYVQQ/knm3reOzrhBq0PrM86oL+fK+YZ/xZY
         LHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674617; x=1699279417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Et7bLkuUyjr6eBHNiSQU/8YQxesnW4GB9tMYVVUOI5M=;
        b=UwZbwnI6Np+Lq8BGAzhDwn36lCvv6AZreECUlaVVyDFusEwcbdbV+7/3LkJ3TlW/lh
         jPkTmtuwyVH0nKNclDNOaSqGKO6j7gwAKBtCItATmIkmBBfF7kyh9VZegzEj14kmqXrS
         oABTsr8QIQMVWmtElpdCauI2g3pHzN2tnHldqNLtlvutlDpJy5G60x3/FukjrkYf8ZHr
         Pv5m8xbl0NMB/S7xZx2BKjLGyDCQAqyhixsnKUJk8aOTc653W3BRWv3SEdZbaCMR1Ny4
         r3khriZrODpGjeGjmOSvvZY3JlHta5ECQa3ZoJgBZZSvLFowdq4p91JuBhGG8iyIvQ7U
         xW7Q==
X-Gm-Message-State: AOJu0YyHvzW8fGRkACbp8lpCxPP+PiaqWVcRqodPCjGodhjVzBtYl1wq
	ZwVM50p5BVPYVAjrq3nWKSs=
X-Google-Smtp-Source: AGHT+IFafuIln79IsyY8FovSxsN3m14VlgFTSQysbeWGIvM4n+mPlxkaJMg7VqEsrAs/boBxHnTJDQ==
X-Received: by 2002:ac2:4843:0:b0:507:a823:fac5 with SMTP id 3-20020ac24843000000b00507a823fac5mr7183908lfy.8.1698674617098;
        Mon, 30 Oct 2023 07:03:37 -0700 (PDT)
Message-ID: <ab1c73bf5d0661fd35b370b5324d2fcb452024c2.camel@gmail.com>
Subject: Re: [PATCH] xenoprof: move asm/ include
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
  Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Mon, 30 Oct 2023 16:03:35 +0200
In-Reply-To: <4fda4793-6fdc-70e6-575d-062f72c8c0dc@suse.com>
References: <4fda4793-6fdc-70e6-575d-062f72c8c0dc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi Jan,

On Mon, 2023-10-30 at 14:19 +0100, Jan Beulich wrote:
> There's no need for xen/xenoprof.h to include the arch header when
> the
> respective config option is off. The only compensation needed is for
> svm.c to explicitly include the arch header instead of the common one
> (matching what vmx.c and traps.c do).
>=20
> With that Arm's header can be deleted, and neither RISC-V nor PPC
> will
> need to introduce one.
>=20
> While there also adjust and move the (prior) inclusion of inttypes.h.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/arm/include/asm/xenoprof.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#ifndef __ASM_XENOPROF_H__
> -#define __ASM_XENOPROF_H__
> -
> -#endif /* __ASM_XENOPROF_H__ */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -12,7 +12,6 @@
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/sched.h>
> =C2=A0#include <xen/trace.h>
> -#include <xen/xenoprof.h>
> =C2=A0
> =C2=A0#include <asm/amd.h>
> =C2=A0#include <asm/apic.h>
> @@ -38,6 +37,7 @@
> =C2=A0#include <asm/processor.h>
> =C2=A0#include <asm/p2m.h>
> =C2=A0#include <asm/x86_emulate.h>
> +#include <asm/xenoprof.h>
> =C2=A0
> =C2=A0#include <public/sched.h>
> =C2=A0
> --- a/xen/include/xen/xenoprof.h
> +++ b/xen/include/xen/xenoprof.h
> @@ -10,15 +10,15 @@
> =C2=A0#ifndef __XEN_XENOPROF_H__
> =C2=A0#define __XEN_XENOPROF_H__
> =C2=A0
> -#include <xen/inttypes.h>
> -#include <asm/xenoprof.h>
> -
> =C2=A0#define PMU_OWNER_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0#define PMU_OWNER_XENOPROF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> =C2=A0#define PMU_OWNER_HVM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2
> =C2=A0
> =C2=A0#ifdef CONFIG_XENOPROF
> =C2=A0
> +#include <xen/stdint.h>
> +#include <asm/xenoprof.h>
> +
> =C2=A0struct domain;
> =C2=A0struct vcpu;
> =C2=A0struct cpu_user_regs;

Looks good to me.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


