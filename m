Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69485BFAF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683578.1063166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRt7-0000Rq-4k; Tue, 20 Feb 2024 15:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683578.1063166; Tue, 20 Feb 2024 15:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRt7-0000Pj-0I; Tue, 20 Feb 2024 15:18:29 +0000
Received: by outflank-mailman (input) for mailman id 683578;
 Tue, 20 Feb 2024 15:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvC9=J5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rcRt5-0000Oq-EK
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:18:27 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b03358f-d003-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 16:18:26 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d244b28b95so14496431fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 07:18:25 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f34-20020a0565123b2200b00512aa52a37esm1090390lfv.51.2024.02.20.07.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:18:24 -0800 (PST)
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
X-Inumbo-ID: 4b03358f-d003-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708442304; x=1709047104; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gkavrmItIQeqPwKMSOFu6cj3eEHdZbxS4SZMMZneueo=;
        b=eJKEKgyAJdXAPuT5dMvjlIrwhNbQJxp0qvT7/r4OUEo67aRsjulmCdS9jdcrEaPh+M
         aP6eQsgtuuj7E4JM8QXx+JA/2nUsdgFI9FhaS58bJpMTWZOh1ENeupk42gkVN9pFaeVN
         8X9KUf0WqitIGcfBcqaavIyQnniuvMS+McNTBQ1cPd8VqF/UBIruAOR31OqcNeumWabh
         XeU/fHVG2F9aW4ALjBggEbWoE0sowOwQ2VD+/u7Fq3spCVaIYJpBPrJrhjLJyVtkJJ5j
         pNZ3x9JdiL2rHY4+058MJYPP8aW9pRuRUUv2UcvBzAtN+724euppSro7kvcuaRgJHewK
         9FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442304; x=1709047104;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gkavrmItIQeqPwKMSOFu6cj3eEHdZbxS4SZMMZneueo=;
        b=ZzHjTDBCqL3pkV8CDt+FFYFahndcdAZU6pa1ei1maywXlIrbodHpxhN3KdNePxJk5g
         fOiOVcrhflnlWtXp0TEZXdSoAyNnSf9jNjtP7OLVG8CaAkkP2aVnnD9kp6UfUQNuhHZS
         KnMbPZbHN0ekGTLX4YZ/W4/fpOA2Rr8TQ5EgyLMJiXvX2Arf/OugaaLbKf83kYQ2Was3
         hJfrHUV6tfoUn3jWos6sGIdKU6MpJgiTxm1MlO+a/ybEEqL1kCG0pJXY1tCWVC+zchZX
         lSbop7EpV0LhQJAM6XTfNzSGfWGlbDSxnVXoJo61fo6DPG1UXvnuL+sLRISDTVxaI0i7
         Hg7w==
X-Gm-Message-State: AOJu0YykySO2hAx/B65hbzHoUEqtJoURvSbjrWiXCUpNiL6bjvCQdpFg
	u/77W+F0QRBJJ9TpJkpbITUFbmil5SQWhERVlBbMHFtYCH75jdefsJr0mPaM
X-Google-Smtp-Source: AGHT+IEOWcKv59Z3JJNpBcpFd4rE0ewvVsYjebTuSFUDcCHmUOhM2dCheuwfR8QKBWZgBA+/aUL3YQ==
X-Received: by 2002:a05:6512:2342:b0:512:c1ba:9115 with SMTP id p2-20020a056512234200b00512c1ba9115mr2058064lfu.57.1708442304311;
        Tue, 20 Feb 2024 07:18:24 -0800 (PST)
Message-ID: <ee34f7eb61a1f09c18e3d5ed915e189087135a9a.camel@gmail.com>
Subject: Re: [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
 ASSERT_UNREACHABLE() to xen/bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Date: Tue, 20 Feb 2024 16:18:23 +0100
In-Reply-To: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
References: 
	<4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hello Shawn,

Could you please take a look at the patch and PPC-related changes in
xen/arch/ppc/include/asm/time.h ?

Thanks in advance.

~ Oleksii

On Fri, 2024-02-02 at 20:03 +0200, Oleksii Kurochko wrote:
> Move the macros mentioned in the commit subject to their appropriate
> locations.
> Additionally, eliminate the dependency of xen/lib.h from xen/bug.h
> and
> include "xen/bug.h" in files where xen/bug.h macros are utilized.
>=20
> Most of the changes were made because a file requires macros from
> xen/bug.h,
> except for some files for Arm which require definitions of
> BUG_OPCODE,
> BUG_INSTR, BUG_FN_REG.
>=20
> xen/lib.h was added to list-sort.c ( otherwise compilation errors
> related
> to {d}printk occur during compilation of list-sort.c. ) as xen/lib.h
> was
> removed from xen/list.h. Since nothing in xen/list.h depends on
> xen/lib.h
> functionality and only xen/bug.h is needed.
>=20
> cpufeature.h requires the inclusion of <xen/cache.h>;
> otherwise, the following error will occur:
> ld:
> common/monitor.o:/build/xen/./arch/x86/include/asm/cpufeature.h:41:
> multiple definitions of `__cacheline_aligned';
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> =C2=A0xen/arch/arm/arm32/insn.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0xen/arch/arm/arm64/cpufeature.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/arm/arm64/insn.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/arm/cpufeature.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/arm/include/asm/arm32/cmpxchg.h |=C2=A0 1 +
> =C2=A0xen/arch/arm/include/asm/arm64/cmpxchg.h |=C2=A0 2 ++
> =C2=A0xen/arch/arm/include/asm/regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/arch/arm/include/asm/vgic.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/ppc/include/asm/time.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/arch/x86/bitops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0xen/arch/x86/include/asm/cpufeature.h=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/x86/include/asm/system.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/arch/x86/include/asm/x86_64/page.h=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0xen/arch/x86/x86_emulate/private.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0xen/common/efi/common-stub.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/common/version.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
> =C2=A0xen/include/public/hvm/save.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/include/xen/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 =
+++++++++++++++++++
> =C2=A0xen/include/xen/cpumask.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/include/xen/device_tree.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/include/xen/lib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 =
-------------------
> =C2=A0xen/include/xen/list.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0xen/include/xen/livepatch.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0xen/include/xen/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
> =C2=A0xen/include/xen/param.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/lib/list-sort.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0xen/xsm/flask/ss/ebitmap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A027 files changed, 48 insertions(+), 27 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/insn.c b/xen/arch/arm/arm32/insn.c
> index 49953a042a..2a62bb9cce 100644
> --- a/xen/arch/arm/arm32/insn.c
> +++ b/xen/arch/arm/arm32/insn.c
> @@ -13,8 +13,9 @@
> =C2=A0=C2=A0 * You should have received a copy of the GNU General Public
> License
> =C2=A0=C2=A0 * along with this program.=C2=A0 If not, see
> <http://www.gnu.org/licenses/>.
> =C2=A0=C2=A0 */
> -#include <xen/lib.h>
> =C2=A0#include <xen/bitops.h>
> +#include <xen/bug.h>
> +#include <xen/lib.h>
> =C2=A0#include <xen/sizes.h>
> =C2=A0#include <asm/insn.h>
> =C2=A0
> diff --git a/xen/arch/arm/arm64/cpufeature.c
> b/xen/arch/arm/arm64/cpufeature.c
> index b4656ff4d8..864413d9cc 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -69,6 +69,7 @@
> =C2=A0 *=C2=A0=C2=A0 KVM guests.
> =C2=A0 */
> =C2=A0
> +#include <xen/bug.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <asm/sysregs.h>
> diff --git a/xen/arch/arm/arm64/insn.c b/xen/arch/arm/arm64/insn.c
> index 22f2bdebd5..773c3749d1 100644
> --- a/xen/arch/arm/arm64/insn.c
> +++ b/xen/arch/arm/arm64/insn.c
> @@ -18,6 +18,7 @@
> =C2=A0 * You should have received a copy of the GNU General Public Licens=
e
> =C2=A0 * along with this program.=C2=A0 If not, see
> <http://www.gnu.org/licenses/>.
> =C2=A0 */
> +#include <xen/bug.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/errno.h>
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index f43d5cb338..ef77473bf8 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -5,6 +5,7 @@
> =C2=A0 * Copyright (C) 2015 ARM Ltd.
> =C2=A0 */
> =C2=A0
> +#include <xen/bug.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/smp.h>
> diff --git a/xen/arch/arm/include/asm/arm32/cmpxchg.h
> b/xen/arch/arm/include/asm/arm32/cmpxchg.h
> index 37b2d64eb6..8455eb7cc3 100644
> --- a/xen/arch/arm/include/asm/arm32/cmpxchg.h
> +++ b/xen/arch/arm/include/asm/arm32/cmpxchg.h
> @@ -1,6 +1,7 @@
> =C2=A0#ifndef __ASM_ARM32_CMPXCHG_H
> =C2=A0#define __ASM_ARM32_CMPXCHG_H
> =C2=A0
> +#include <xen/bug.h>
> =C2=A0#include <xen/prefetch.h>
> =C2=A0
> =C2=A0extern void __bad_xchg(volatile void *ptr, int size);
> diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h
> b/xen/arch/arm/include/asm/arm64/cmpxchg.h
> index 031fa6d92a..f160e8e7bc 100644
> --- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
> +++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
> @@ -1,6 +1,8 @@
> =C2=A0#ifndef __ASM_ARM64_CMPXCHG_H
> =C2=A0#define __ASM_ARM64_CMPXCHG_H
> =C2=A0
> +#include <xen/bug.h>
> +
> =C2=A0extern void __bad_xchg(volatile void *ptr, int size);
> =C2=A0
> =C2=A0static inline unsigned long __xchg(unsigned long x, volatile void
> *ptr, int size)
> diff --git a/xen/arch/arm/include/asm/regs.h
> b/xen/arch/arm/include/asm/regs.h
> index f998aedff5..0d9f239a77 100644
> --- a/xen/arch/arm/include/asm/regs.h
> +++ b/xen/arch/arm/include/asm/regs.h
> @@ -5,7 +5,7 @@
> =C2=A0
> =C2=A0#ifndef __ASSEMBLY__
> =C2=A0
> -#include <xen/lib.h>
> +#include <xen/bug.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <public/xen.h>
> =C2=A0#include <asm/current.h>
> diff --git a/xen/arch/arm/include/asm/vgic.h
> b/xen/arch/arm/include/asm/vgic.h
> index 922779ce14..79b73a0dbb 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -22,6 +22,7 @@
> =C2=A0#include <asm/new_vgic.h>
> =C2=A0#else
> =C2=A0
> +#include <xen/bug.h>
> =C2=A0#include <xen/radix-tree.h>
> =C2=A0#include <xen/rbtree.h>
> =C2=A0
> diff --git a/xen/arch/ppc/include/asm/time.h
> b/xen/arch/ppc/include/asm/time.h
> index aa9dda82a3..f23eec173e 100644
> --- a/xen/arch/ppc/include/asm/time.h
> +++ b/xen/arch/ppc/include/asm/time.h
> @@ -2,7 +2,7 @@
> =C2=A0#ifndef __ASM_PPC_TIME_H__
> =C2=A0#define __ASM_PPC_TIME_H__
> =C2=A0
> -#include <xen/lib.h>
> +#include <xen/bug.h>
> =C2=A0#include <asm/processor.h>
> =C2=A0#include <asm/regs.h>
> =C2=A0
> diff --git a/xen/arch/x86/bitops.c b/xen/arch/x86/bitops.c
> index f6ee71512c..720ab32362 100644
> --- a/xen/arch/x86/bitops.c
> +++ b/xen/arch/x86/bitops.c
> @@ -1,6 +1,6 @@
> =C2=A0
> =C2=A0#include <xen/bitops.h>
> -#include <xen/lib.h>
> +#include <xen/bug.h>
> =C2=A0
> =C2=A0unsigned int __find_first_bit(
> =C2=A0=C2=A0=C2=A0=C2=A0 const unsigned long *addr, unsigned int size)
> diff --git a/xen/arch/x86/include/asm/cpufeature.h
> b/xen/arch/x86/include/asm/cpufeature.h
> index 896483a900..be16492c68 100644
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef __ASM_I386_CPUFEATURE_H
> =C2=A0#define __ASM_I386_CPUFEATURE_H
> =C2=A0
> +#include <xen/cache.h>
> =C2=A0#include <xen/const.h>
> =C2=A0#include <asm/cpuid.h>
> =C2=A0
> diff --git a/xen/arch/x86/include/asm/system.h
> b/xen/arch/x86/include/asm/system.h
> index 6e40a03cb3..debf6bfa17 100644
> --- a/xen/arch/x86/include/asm/system.h
> +++ b/xen/arch/x86/include/asm/system.h
> @@ -1,8 +1,8 @@
> =C2=A0#ifndef __ASM_SYSTEM_H
> =C2=A0#define __ASM_SYSTEM_H
> =C2=A0
> -#include <xen/lib.h>
> =C2=A0#include <xen/bitops.h>
> +#include <xen/bug.h>
> =C2=A0#include <asm/cpufeature.h>
> =C2=A0#include <asm/x86-defns.h>
> =C2=A0
> diff --git a/xen/arch/x86/include/asm/x86_64/page.h
> b/xen/arch/x86/include/asm/x86_64/page.h
> index f49e10475f..19ca64d792 100644
> --- a/xen/arch/x86/include/asm/x86_64/page.h
> +++ b/xen/arch/x86/include/asm/x86_64/page.h
> @@ -19,6 +19,8 @@ static inline unsigned long
> canonicalise_addr(unsigned long addr)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return addr & ~CANONICAL=
_MASK;
> =C2=A0}
> =C2=A0
> +#include <xen/bug.h>
> +
> =C2=A0#include <xen/types.h>
> =C2=A0
> =C2=A0#include <xen/pdx.h>
> diff --git a/xen/arch/x86/x86_emulate/private.h
> b/xen/arch/x86/x86_emulate/private.h
> index 33f2870508..0fa26ba00a 100644
> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -8,6 +8,7 @@
> =C2=A0
> =C2=A0#ifdef __XEN__
> =C2=A0
> +# include <xen/bug.h>
> =C2=A0# include <xen/kernel.h>
> =C2=A0# include <asm/endbr.h>
> =C2=A0# include <asm/msr-index.h>
> diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-
> stub.c
> index 5a91fe28cc..77f138a6c5 100644
> --- a/xen/common/efi/common-stub.c
> +++ b/xen/common/efi/common-stub.c
> @@ -1,6 +1,6 @@
> +#include <xen/bug.h>
> =C2=A0#include <xen/efi.h>
> =C2=A0#include <xen/errno.h>
> -#include <xen/lib.h>
> =C2=A0
> =C2=A0bool efi_enabled(unsigned int feature)
> =C2=A0{
> diff --git a/xen/common/version.c b/xen/common/version.c
> index e807ef4de0..80869430fc 100644
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -1,3 +1,4 @@
> +#include <xen/bug.h>
> =C2=A0#include <xen/compile.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/errno.h>
> diff --git a/xen/include/public/hvm/save.h
> b/xen/include/public/hvm/save.h
> index ff0048e5f8..5561495b27 100644
> --- a/xen/include/public/hvm/save.h
> +++ b/xen/include/public/hvm/save.h
> @@ -51,7 +51,7 @@ struct hvm_save_descriptor {
> =C2=A0=C2=A0=C2=A0=C2=A0 struct __HVM_SAVE_TYPE_##_x { _type t; char c[_c=
ode]; char
> cpt[2];};=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 struct __HVM_SAVE_TYPE_COMPAT_##_x { _ctype t; }
> =C2=A0
> -# include <xen/lib.h> /* BUG() */
> +# include <xen/bug.h> /* BUG() */
> =C2=A0# define DECLARE_HVM_SAVE_TYPE(_x, _code,
> _type)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 static inline int __HVM_SAVE_FIX_COMPAT_##_x(voi=
d *h, uint32_t
> size) \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { BUG(); return -1;
> }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> index 4bd0be5088..7c150b7032 100644
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -16,6 +16,7 @@
> =C2=A0
> =C2=A0#ifndef __ASSEMBLY__
> =C2=A0
> +#include <xen/compiler.h>
> =C2=A0#include <xen/macros.h>
> =C2=A0#include <xen/types.h>
> =C2=A0
> @@ -127,6 +128,24 @@ static void always_inline
> run_in_exception_handler(
> =C2=A0} while ( false )
> =C2=A0#endif
> =C2=A0
> +#define BUG_ON(p)=C2=A0 do { if (unlikely(p)) BUG();=C2=A0 } while (0)
> +#define WARN_ON(p)=C2=A0 ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 bool ret_warn_on_ =3D (p);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 if ( unlikely(ret_warn_on_) )=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN();=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 unlikely(ret_warn_on_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +})
> +
> +#ifndef NDEBUG
> +#define ASSERT(p) \
> +=C2=A0=C2=A0=C2=A0 do { if ( unlikely(!(p)) ) assert_failed(#p); } while=
 (0)
> +#define ASSERT_UNREACHABLE() assert_failed("unreachable")
> +#else
> +#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
> +#define ASSERT_UNREACHABLE() do { } while (0)
> +#endif
> +
> =C2=A0#ifdef CONFIG_GENERIC_BUG_FRAME
> =C2=A0
> =C2=A0/*
> diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
> index 145e140481..46e75d54ba 100644
> --- a/xen/include/xen/cpumask.h
> +++ b/xen/include/xen/cpumask.h
> @@ -55,6 +55,7 @@
> =C2=A0 * for_each_present_cpu(cpu)		for-loop cpu over
> cpu_present_map
> =C2=A0 */
> =C2=A0
> +#include <xen/bug.h>
> =C2=A0#include <xen/bitmap.h>
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <xen/random.h>
> diff --git a/xen/include/xen/device_tree.h
> b/xen/include/xen/device_tree.h
> index 94a836cb4e..6fe2fa8b21 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -14,6 +14,7 @@
> =C2=A0#include <asm/device.h>
> =C2=A0#include <public/xen.h>
> =C2=A0#include <public/device_tree_defs.h>
> +#include <xen/bug.h>
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <xen/string.h>
> =C2=A0#include <xen/types.h>
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 1793be5b6b..4c755cc275 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -5,31 +5,12 @@
> =C2=A0
> =C2=A0#ifndef __ASSEMBLY__
> =C2=A0
> -#include <xen/bug.h>
> =C2=A0#include <xen/inttypes.h>
> =C2=A0#include <xen/stdarg.h>
> =C2=A0#include <xen/types.h>
> =C2=A0#include <xen/xmalloc.h>
> =C2=A0#include <xen/string.h>
> =C2=A0
> -#define BUG_ON(p)=C2=A0 do { if (unlikely(p)) BUG();=C2=A0 } while (0)
> -#define WARN_ON(p)=C2=A0 ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> -=C2=A0=C2=A0=C2=A0 bool ret_warn_on_ =3D (p);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> -=C2=A0=C2=A0=C2=A0 if ( unlikely(ret_warn_on_) )=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN();=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> -=C2=A0=C2=A0=C2=A0 unlikely(ret_warn_on_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> -})
> -
> -#ifndef NDEBUG
> -#define ASSERT(p) \
> -=C2=A0=C2=A0=C2=A0 do { if ( unlikely(!(p)) ) assert_failed(#p); } while=
 (0)
> -#define ASSERT_UNREACHABLE() assert_failed("unreachable")
> -#else
> -#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
> -#define ASSERT_UNREACHABLE() do { } while (0)
> -#endif
> -
> =C2=A0#define __ACCESS_ONCE(x) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(void)(typeof(x))0; /* Scalar typecheck. */ \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(volatile typeof(x) *)&(x); })
> diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
> index dc5a8c461b..b5eab3a1eb 100644
> --- a/xen/include/xen/list.h
> +++ b/xen/include/xen/list.h
> @@ -7,7 +7,7 @@
> =C2=A0#ifndef __XEN_LIST_H__
> =C2=A0#define __XEN_LIST_H__
> =C2=A0
> -#include <xen/lib.h>
> +#include <xen/bug.h>
> =C2=A0#include <asm/system.h>
> =C2=A0
> =C2=A0/*
> diff --git a/xen/include/xen/livepatch.h
> b/xen/include/xen/livepatch.h
> index 45df4bba4f..ad0eae28bd 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -18,6 +18,8 @@ struct xen_sysctl_livepatch_op;
> =C2=A0
> =C2=A0#ifdef CONFIG_LIVEPATCH
> =C2=A0
> +#include <xen/lib.h>
> +
> =C2=A0/*
> =C2=A0 * We use alternative and exception table code - which by default
> are __init
> =C2=A0 * only, however we need them during runtime. These macros allows u=
s
> to build
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 3d9b2d05a5..bb29b352ec 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -61,6 +61,7 @@
> =C2=A0#ifndef __XEN_MM_H__
> =C2=A0#define __XEN_MM_H__
> =C2=A0
> +#include <xen/bug.h>
> =C2=A0#include <xen/compiler.h>
> =C2=A0#include <xen/mm-frame.h>
> =C2=A0#include <xen/types.h>
> diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
> index 9170455cde..d8471ffe18 100644
> --- a/xen/include/xen/param.h
> +++ b/xen/include/xen/param.h
> @@ -1,6 +1,7 @@
> =C2=A0#ifndef _XEN_PARAM_H
> =C2=A0#define _XEN_PARAM_H
> =C2=A0
> +#include <xen/bug.h>
> =C2=A0#include <xen/hypfs.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/lib.h>
> diff --git a/xen/lib/list-sort.c b/xen/lib/list-sort.c
> index de1af2ef8b..251764804c 100644
> --- a/xen/lib/list-sort.c
> +++ b/xen/lib/list-sort.c
> @@ -15,6 +15,7 @@
> =C2=A0 * this program; If not, see <http://www.gnu.org/licenses/>.
> =C2=A0 */
> =C2=A0
> +#include <xen/lib.h>
> =C2=A0#include <xen/list.h>
> =C2=A0#include <xen/list_sort.h>
> =C2=A0
> diff --git a/xen/xsm/flask/ss/ebitmap.h b/xen/xsm/flask/ss/ebitmap.h
> index bb43de891d..7b2da8179a 100644
> --- a/xen/xsm/flask/ss/ebitmap.h
> +++ b/xen/xsm/flask/ss/ebitmap.h
> @@ -15,6 +15,7 @@
> =C2=A0#define _SS_EBITMAP_H_
> =C2=A0
> =C2=A0#include <xen/bitmap.h>
> +#include <xen/bug.h>
> =C2=A0
> =C2=A0#define EBITMAP_UNIT_NUMS	((32 - sizeof(void *) -
> sizeof(u32))	\
> =C2=A0					/ sizeof(unsigned long))


