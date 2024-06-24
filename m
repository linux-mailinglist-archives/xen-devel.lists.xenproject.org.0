Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0F91442A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746211.1153203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLegx-0000g7-Uj; Mon, 24 Jun 2024 08:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746211.1153203; Mon, 24 Jun 2024 08:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLegx-0000dx-Rn; Mon, 24 Jun 2024 08:04:47 +0000
Received: by outflank-mailman (input) for mailman id 746211;
 Mon, 24 Jun 2024 08:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLegw-0000dr-DH
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:04:46 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b31ee49-3200-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 10:04:45 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52ce12707d9so1139156e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:04:45 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce51ccdeesm286439e87.274.2024.06.24.01.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 01:04:44 -0700 (PDT)
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
X-Inumbo-ID: 6b31ee49-3200-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719216285; x=1719821085; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l4ww27Yb3LTNkNA5SYuIcJfCisP5kao3G9YNomzHN00=;
        b=GhJPq3/fdbtbZndV9wy/28rt8hK1+KcEqegQ+a6f++75eheEtoUy/WzjfHfEOKQeM+
         UaetsxfqE3ssIlBCu5OcyvmTTY6eyyazC636wWDGsAOH1jmGb7vNJrwSYYtEtqRoeYI7
         3JasJoUSLPQTogMpFOBzFcDOmCU3Tl7mML/eKVqyR/VSB2ygqNEaiHpQprKqMplB3+KR
         GcuURNp5L9RkSeTJBlUuMJxy8JToh9DF43zkg0bA90iM5Te2MvBTiwR4hSiObdcC+Lf+
         1atf/3NGymhUQQsTZu2UBOld1R+/+IKsx1UPoFrzjaEATtm1imTnkS7I1Llqo/SL8CTr
         0PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216285; x=1719821085;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l4ww27Yb3LTNkNA5SYuIcJfCisP5kao3G9YNomzHN00=;
        b=TUZ0w/ufmQTIIh+51NfMASz+zKa9Ede+uRCK8slzJ7fKEyq/YZ3/0k3Vg2O4GGlMkv
         JAs/ZiEs99dQJMB2aDlS5fcsbJ7i7DqkYXdsj0R17CCP1wN9MB/MuCMjI753R+K0r60D
         F+E3606MBZjVe5GLfQMneYkFK5FTmRd7XeMbVf/efOuQap4zHoHDJJbv84yCnH3CSZnW
         tryVj2rCRAq4EjpopSc3zg/qKiUMIk+Lmb6iqopQN4QWSh45ge0IsMW59lCNQdnPRKuT
         00IH4UixHpgxtHMLeqWhkSt/hnpd3UQO842IX2GLNdSHrv6kL5Iu2kCvi5NN+oJW/42j
         hMlA==
X-Forwarded-Encrypted: i=1; AJvYcCWhaCpr9hMxmL+OqgDLef/bVHSOe3XhWvWETgPPvDyMF3+5ZIb+nx49k8Ient+QwP1cyhKNo/C2UPeE6phZaV72hF5ubItoG9LkpH3PMXg=
X-Gm-Message-State: AOJu0YwqCn5PijrE9yQHHzyzwGT2qQGHo+DA/Tz/hg4gtX0MzqtWMMAO
	Pt3JwsBDYg+SLmNFnzAp76KPBbRR5Gjaxm2ab5tgaUKieFV0mPIH8aSQArsn
X-Google-Smtp-Source: AGHT+IGt9nWScohvdd6VHN8jFjVDzkfSAN64JQtt8M36Fq7fL4USRatG2ASlJBGmyEBEa6JZNH77bQ==
X-Received: by 2002:a05:6512:348c:b0:52c:da38:b2c6 with SMTP id 2adb3069b0e04-52ce0672770mr2207650e87.50.1719216284387;
        Mon, 24 Jun 2024 01:04:44 -0700 (PDT)
Message-ID: <384405c4718838398c3a8272027f526b53340e7a.camel@gmail.com>
Subject: Re: [PATCH 3/3] xen/ppc: Avoid using the legacy
 __read_mostly/__ro_after_init definitions
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, George Dunlap
 <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Date: Mon, 24 Jun 2024 10:04:43 +0200
In-Reply-To: <20240621201928.319293-4-andrew.cooper3@citrix.com>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
	 <20240621201928.319293-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 21:19 +0100, Andrew Cooper wrote:
> RISC-V wants to introduce a full build of Xen without using the
> legacy
> definitions.=C2=A0 PPC64 has the most minimal full build of Xen right now=
,
> so make
> it compile without the legacy definitions.
>=20
> Mostly this is just including xen/sections.h in a variety of common
> files.=C2=A0 In
> a couple of cases, we can drop an inclusion of {xen,asm}/cache.h, but
> almost
> all files get the definitions transitively.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleskii

> ---
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
>=20
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342714126
> ---
> =C2=A0xen/arch/ppc/include/asm/cache.h | 3 ---
> =C2=A0xen/arch/ppc/mm-radix.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/argo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/debugtrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/event_channel.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 =
++
> =C2=A0xen/common/keyhandler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/memory.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/page_alloc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/pdx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/radix-tree.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/random.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/common/rcupdate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/sched/cpupool.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> =C2=A0xen/common/sched/credit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 +
> =C2=A0xen/common/sched/credit2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> =C2=A0xen/common/shutdown.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/spinlock.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/version.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--
> =C2=A0xen/common/virtual_region.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0xen/common/vmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/drivers/char/console.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> =C2=A0xen/drivers/char/ns16550.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> =C2=A0xen/drivers/char/serial.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
> =C2=A0xen/include/xen/cache.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/xen/hypfs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A030 files changed, 30 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/ppc/include/asm/cache.h
> b/xen/arch/ppc/include/asm/cache.h
> index 13c0bf3242c8..8a0a6b7b1756 100644
> --- a/xen/arch/ppc/include/asm/cache.h
> +++ b/xen/arch/ppc/include/asm/cache.h
> @@ -3,7 +3,4 @@
> =C2=A0#ifndef _ASM_PPC_CACHE_H
> =C2=A0#define _ASM_PPC_CACHE_H
> =C2=A0
> -/* TODO: Phase out the use of this via cache.h */
> -#define __read_mostly __section(".data.read_mostly")
> -
> =C2=A0#endif /* _ASM_PPC_CACHE_H */
> diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
> index ab5a10695c5f..0a47959e64f2 100644
> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -2,6 +2,7 @@
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <xen/mm.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <xen/lib.h>
> =C2=A0
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index a10691165b1b..0e7a26dadbc1 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <xen/domain.h>
> =C2=A0#include <xen/irq.h>
> =C2=A0#include <xen/nodemask.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/time.h>
> =C2=A0#include <public/domctl.h>
> =C2=A0#include <public/vm_event.h>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 901f41eb2dbe..df19006744a3 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -25,6 +25,7 @@
> =C2=A0#include <xen/nospec.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/time.h>
> =C2=A0
> =C2=A0#include <xsm/xsm.h>
> diff --git a/xen/common/cpu.c b/xen/common/cpu.c
> index 6e35b114c080..f09af0444b6a 100644
> --- a/xen/common/cpu.c
> +++ b/xen/common/cpu.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <xen/event.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/stop_machine.h>
> =C2=A0#include <xen/rcupdate.h>
> =C2=A0
> diff --git a/xen/common/debugtrace.c b/xen/common/debugtrace.c
> index a272e5e43761..ca883ad9198d 100644
> --- a/xen/common/debugtrace.c
> +++ b/xen/common/debugtrace.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/percpu.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/serial.h>
> =C2=A0#include <xen/smp.h>
> =C2=A0#include <xen/spinlock.h>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 67cadb7c3f4f..3db0e0b793f9 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -11,6 +11,7 @@
> =C2=A0#include <xen/err.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/domain.h>
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/event.h>
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index a67feff98976..822b2c982489 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -26,6 +26,8 @@
> =C2=A0#include <xen/guest_access.h>
> =C2=A0#include <xen/hypercall.h>
> =C2=A0#include <xen/keyhandler.h>
> +#include <xen/sections.h>
> +
> =C2=A0#include <asm/current.h>
> =C2=A0
> =C2=A0#include <public/xen.h>
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 127ca506965c..674e7be39e9d 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -6,6 +6,7 @@
> =C2=A0#include <xen/delay.h>
> =C2=A0#include <xen/keyhandler.h>
> =C2=A0#include <xen/param.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/shutdown.h>
> =C2=A0#include <xen/event.h>
> =C2=A0#include <xen/console.h>
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index de2cc7ad92a5..a6f2f6d1b348 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -23,6 +23,7 @@
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/perfc.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/trace.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <asm/current.h>
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 054b7edb3989..33c8c917d984 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -134,6 +134,7 @@
> =C2=A0#include <xen/pfn.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/softirq.h>
> =C2=A0#include <xen/spinlock.h>
> =C2=A0
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index d3d63b075032..b8384e6189df 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -19,6 +19,7 @@
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/bitops.h>
> =C2=A0#include <xen/nospec.h>
> +#include <xen/sections.h>
> =C2=A0
> =C2=A0/**
> =C2=A0 * Maximum (non-inclusive) usable pdx. Must be
> diff --git a/xen/common/radix-tree.c b/xen/common/radix-tree.c
> index adc3034222dc..fb283a9d52fc 100644
> --- a/xen/common/radix-tree.c
> +++ b/xen/common/radix-tree.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/radix-tree.h>
> =C2=A0#include <xen/errno.h>
> +#include <xen/sections.h>
> =C2=A0
> =C2=A0struct radix_tree_path {
> =C2=A0	struct radix_tree_node *node;
> diff --git a/xen/common/random.c b/xen/common/random.c
> index a29f2fcb991a..35a9f387fd5c 100644
> --- a/xen/common/random.c
> +++ b/xen/common/random.c
> @@ -1,6 +1,6 @@
> -#include <xen/cache.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/percpu.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/random.h>
> =C2=A0#include <xen/time.h>
> =C2=A0#include <asm/random.h>
> diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
> index 212a99acd8c8..fd5d3d7484a5 100644
> --- a/xen/common/rcupdate.c
> +++ b/xen/common/rcupdate.c
> @@ -35,6 +35,7 @@
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/param.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/spinlock.h>
> =C2=A0#include <xen/smp.h>
> =C2=A0#include <xen/rcupdate.h>
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d84b65f197b3..1a3ff5ae4dec 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/domain.h>
> =C2=A0#include <xen/delay.h>
> =C2=A0#include <xen/event.h>
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index ad8f60846273..57dfee26f21f 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -22,6 +22,7 @@
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/percpu.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/warning.h>
> =C2=A0
> =C2=A0#include "private.h"
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index 020f44595ed0..a6bb321e7da1 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/domain.h>
> =C2=A0#include <xen/delay.h>
> =C2=A0#include <xen/event.h>
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 685929c2902b..a7da60f40376 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -14,6 +14,7 @@
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/domain.h>
> =C2=A0#include <xen/delay.h>
> =C2=A0#include <xen/event.h>
> diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
> index 5f8141edc6b2..f413f331af17 100644
> --- a/xen/common/shutdown.c
> +++ b/xen/common/shutdown.c
> @@ -2,6 +2,7 @@
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/domain.h>
> =C2=A0#include <xen/delay.h>
> =C2=A0#include <xen/watchdog.h>
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 28c6e9d3ac60..0b877384451d 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -5,6 +5,7 @@
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/smp.h>
> =C2=A0#include <xen/time.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/spinlock.h>
> =C2=A0#include <xen/guest_access.h>
> =C2=A0#include <xen/preempt.h>
> diff --git a/xen/common/timer.c b/xen/common/timer.c
> index a21798b76f38..da0d069cc674 100644
> --- a/xen/common/timer.c
> +++ b/xen/common/timer.c
> @@ -11,6 +11,7 @@
> =C2=A0#include <xen/sched.h>
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/param.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/smp.h>
> =C2=A0#include <xen/perfc.h>
> =C2=A0#include <xen/time.h>
> diff --git a/xen/common/version.c b/xen/common/version.c
> index 80869430fc7c..b7d7d515a3dc 100644
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -3,14 +3,13 @@
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/errno.h>
> =C2=A0#include <xen/lib.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/string.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <xen/efi.h>
> =C2=A0#include <xen/elf.h>
> =C2=A0#include <xen/version.h>
> =C2=A0
> -#include <asm/cache.h>
> -
> =C2=A0const char *xen_compile_date(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 return XEN_COMPILE_DATE;
> diff --git a/xen/common/virtual_region.c
> b/xen/common/virtual_region.c
> index 52405d84b25c..1dc2e9f592ed 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -6,6 +6,7 @@
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/rcupdate.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/spinlock.h>
> =C2=A0#include <xen/virtual_region.h>
> =C2=A0
> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
> index 966a7e763f0f..b3b4ddf65311 100644
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -1,6 +1,6 @@
> =C2=A0#ifdef VMAP_VIRT_START
> =C2=A0#include <xen/bitmap.h>
> -#include <xen/cache.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/pfn.h>
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 3a3a97bcbe3a..7da8c5296f3b 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -32,6 +32,7 @@
> =C2=A0#include <xen/warning.h>
> =C2=A0#include <xen/pv_console.h>
> =C2=A0#include <asm/setup.h>
> +#include <xen/sections.h>
> =C2=A0
> =C2=A0#ifdef CONFIG_X86
> =C2=A0#include <xen/consoled.h>
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 8f76bbe676bc..eaeb0e09d01e 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -22,6 +22,7 @@
> =C2=A0#include <xen/irq.h>
> =C2=A0#include <xen/param.h>
> =C2=A0#include <xen/sched.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/timer.h>
> =C2=A0#include <xen/serial.h>
> =C2=A0#include <xen/iocap.h>
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index f28d8557c0a5..591a00900869 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -10,8 +10,8 @@
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/param.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/serial.h>
> -#include <xen/cache.h>
> =C2=A0
> =C2=A0#include <asm/processor.h>
> =C2=A0
> diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
> index 82a3ba38e3e7..a19942fd63ef 100644
> --- a/xen/include/xen/cache.h
> +++ b/xen/include/xen/cache.h
> @@ -15,7 +15,7 @@
> =C2=A0#define __cacheline_aligned
> __attribute__((__aligned__(SMP_CACHE_BYTES)))
> =C2=A0#endif
> =C2=A0
> -#if defined(CONFIG_ARM) || defined(CONFIG_X86) ||
> defined(CONFIG_PPC64)
> +#if defined(CONFIG_ARM) || defined(CONFIG_X86)
> =C2=A0/* TODO: Phase out the use of this via cache.h */
> =C2=A0#define __ro_after_init __section(".data.ro_after_init")
> =C2=A0#endif
> diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
> index 1b65a9188c6c..d8fcac23b46b 100644
> --- a/xen/include/xen/hypfs.h
> +++ b/xen/include/xen/hypfs.h
> @@ -4,6 +4,7 @@
> =C2=A0#ifdef CONFIG_HYPFS
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/list.h>
> +#include <xen/sections.h>
> =C2=A0#include <xen/string.h>
> =C2=A0#include <public/hypfs.h>
> =C2=A0


