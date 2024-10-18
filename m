Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3B59A4147
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 16:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822007.1236013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1o4z-0008N7-Jl; Fri, 18 Oct 2024 14:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822007.1236013; Fri, 18 Oct 2024 14:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1o4z-0008Jx-GI; Fri, 18 Oct 2024 14:35:49 +0000
Received: by outflank-mailman (input) for mailman id 822007;
 Fri, 18 Oct 2024 14:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazm=RO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t1o4x-0008Jo-DT
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 14:35:47 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41bae230-8d5e-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 16:35:44 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-539f0f9ee49so2615033e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 07:35:44 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b98f8sm234634e87.112.2024.10.18.07.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 07:35:42 -0700 (PDT)
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
X-Inumbo-ID: 41bae230-8d5e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729262143; x=1729866943; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P4oiMBtryCtNP+mMGg52fNSmnKoCLQVz0Uw7et1Q7kM=;
        b=EbOXkl/WBONPgqlch0fEPTAyXP2qv+1BEasqb4hnSwLQmTdwo8GkZvcRciLiobKZpR
         zZiA3DPHb3Cq3znkg/vB5Oi3qpmUI0pgLPD6PaWpnZ/8bR3qgLVKdemB6KDsp8SNyfLz
         4CauItGLJXpF2/VLDG2kZD7glfmiXbi96nuz3sOaf95/N6E5+Jq5VIfpm5X2uGivMk4v
         guSqWKut6LeAJy58OkZtt7Z3/QtYLqinURlq4thAvkbvtlecQyZ/ee+g3boj+x6yPF0n
         VbGdj8O2uMZNRXCdTGgiX2qfWLBhKmj0us6FVZnF2/vzz0RsBpUahiesql75JHTd6qkB
         eEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729262143; x=1729866943;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4oiMBtryCtNP+mMGg52fNSmnKoCLQVz0Uw7et1Q7kM=;
        b=dkMKGQnIDpOgIbndMYz7+pnwQDhiqCK3LMZT1gstKUMcIfk/TYO7Wslp1oWUxwJ6EP
         d6fg4i9smQugbs2iUlBFSBqM7moxucf1IFnxueeHVXB7xBN7QqqyIDzzoQKMTJzXbggL
         HQKYtUoo9R//E7TKYK9OidFZ/fmZa2U9sx/ZKu7SvOKNoZPXiHGKXBVcsBl9Lp/odbX7
         1z029I6eRoyc99nT23dbmOYNHw+07A870jVNOCaxsgp9FsqX3FLor3/Z/VttT18Mg2vA
         S4ICABZ5zvjODMwGUkPL1+VAgtc4uxsHiFUn8s8/+0pNu21G+Ne/qjL0YhFRBSqcr/Py
         GfXg==
X-Forwarded-Encrypted: i=1; AJvYcCVs1eGWdYGBTV3iRh18u+F2UFpNU6JDhI/Rik2hqdeycAz2AawBjxHJdlPzdp1oSRxsriHaKg8/4BM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY0K6ZPPwMa7vmFmy91VWWEGSTtjMXvFVgPd6WsxlutJYI1MTx
	Ha7HnaqfRVYpl/wbgMJ3n/oP1uv3V4c9DDFNojkLJ3FldKzB8odA
X-Google-Smtp-Source: AGHT+IFF+3rS+nSjom7GOjrszEnh6chz4cC9Ky/rf3JRrLfWs9OE4ubfxKZxuIKx+rONR+P/PMnT/Q==
X-Received: by 2002:a05:6512:1582:b0:539:f619:b459 with SMTP id 2adb3069b0e04-53a15444f43mr1715384e87.17.1729262143186;
        Fri, 18 Oct 2024 07:35:43 -0700 (PDT)
Message-ID: <b1a38c60291b15b550834027f69cec9f4613e6e3.camel@gmail.com>
Subject: Re: [PATCH v2] Update deprecated SPDX license identifiers
From: oleksii.kurochko@gmail.com
To: Frediano Ziglio <frediano.ziglio@cloud.com>, 
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>,  Ross Lagerwall <ross.lagerwall@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, Paul Durrant <paul@xen.org>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,  George
 Dunlap <gwd@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Date: Fri, 18 Oct 2024 16:35:41 +0200
In-Reply-To: <20241018135725.2357572-1-frediano.ziglio@cloud.com>
References: <20241018135725.2357572-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-10-18 at 14:57 +0100, Frediano Ziglio wrote:
> As specified in LICENSES/GPL-2.0:
> - GPL-2.0 -> GPL-2.0-only;
> - GPL-2.0+ -> GPL-2.0-or-later.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
For RISC-V: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> =C2=A0CODING_STYLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/alternative.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0xen/arch/arm/arm32/mmu/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/arm64/mmu/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/cpuerrata.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0xen/arch/arm/cpufeature.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/arch/arm/dm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/domctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/early_printk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/gic-v3-its.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/arch/arm/gic-v3-lpi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/arch/arm/guest_atomics.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/guest_walk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/arch/arm/guestcopy.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0xen/arch/arm/hvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/include/asm/nospec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/ioreq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/kernel.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/livepatch.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0xen/arch/arm/mem_access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/arch/arm/mmu/p2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/monitor.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/p2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/physdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/platform_hypercall.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/shutdown.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/sysctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/vgic-v3-its.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0xen/arch/arm/vm_event.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/vpl011.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/arm/vsmc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/riscv/early_printk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/riscv/include/asm/acpi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/riscv/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/riscv/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/riscv/include/asm/cache.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/riscv/include/asm/string.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/x86/cpu/mcheck/intel-nonfatal.c=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/arch/x86/debug.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/x86/hvm/svm/nestedhvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/x86/hvm/svm/svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0xen/arch/x86/include/asm/gdbsx.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/x86/include/asm/guest/hyperv-tlfs.h | 2 +-
> =C2=A0xen/arch/x86/include/asm/intel-family.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0xen/arch/x86/include/asm/nospec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/arch/x86/include/asm/prot-key.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/common/device-tree/bootfdt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/common/sched/boot-cpupool.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/asm-generic/atomic-ops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/asm-generic/monitor.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/xen/alternative-call.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/xen/nospec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0xen/include/xen/unaligned.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/expr.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0xen/tools/kconfig/images.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0xen/tools/kconfig/lexer.l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/tools/kconfig/list.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lkc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lkc_proto.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lxdialog/checklist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lxdialog/dialog.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lxdialog/inputbox.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lxdialog/menubox.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lxdialog/textbox.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lxdialog/util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/lxdialog/yesno.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/tools/kconfig/nconf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0xen/tools/kconfig/parser.y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0xen/tools/kconfig/qconf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A071 files changed, 71 insertions(+), 71 deletions(-)
>=20
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 554c69a16a..e3b1da6048 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -20,7 +20,7 @@ SPDX
> =C2=A0New files should start with a single-line SPDX comment to express
> the
> =C2=A0license, e.g.:
> =C2=A0
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> =C2=A0See LICENSES/ for a list of licenses and SPDX tags currently used.
> =C2=A0
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index c56caba010..d99b507093 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * alternative runtime patching
> =C2=A0 * inspired by the x86 version
> diff --git a/xen/arch/arm/arm32/mmu/mm.c
> b/xen/arch/arm/arm32/mmu/mm.c
> index 30a7aa1e8e..063611412b 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/lib.h>
> diff --git a/xen/arch/arm/arm64/mmu/mm.c
> b/xen/arch/arm/arm64/mmu/mm.c
> index 0de4f3c079..671eaadbc1 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/mm.h>
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index afd0605922..eef9c0ea0e 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <xen/cpu.h>
> =C2=A0#include <xen/cpumask.h>
> =C2=A0#include <xen/init.h>
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index b45dbe3c66..1a80738571 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Contains CPU feature definitions
> =C2=A0 *
> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> index 5569efa121..773a0a2592 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (c) 2019 Arm ltd.
> =C2=A0 */
> diff --git a/xen/arch/arm/domain_build.c
> b/xen/arch/arm/domain_build.c
> index 669970c86f..2c30792de8 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/compile.h>
> =C2=A0#include <xen/lib.h>
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index 12a12ee781..9d047065ba 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/******************************************************************=
*
> ***********
> =C2=A0 * Arch-specific domctl.c
> =C2=A0 *
> diff --git a/xen/arch/arm/early_printk.c
> b/xen/arch/arm/early_printk.c
> index 03cbe0fb88..9c54f77c78 100644
> --- a/xen/arch/arm/early_printk.c
> +++ b/xen/arch/arm/early_printk.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * printk() for use before the final page tables are setup.
> =C2=A0 *
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 55bed3fe87..5fd83af25a 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * xen/arch/arm/gic-v3-its.c
> =C2=A0 *
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index eb0a5535e4..de4b0eb4a4 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * xen/arch/arm/gic-v3-lpi.c
> =C2=A0 *
> diff --git a/xen/arch/arm/guest_atomics.c
> b/xen/arch/arm/guest_atomics.c
> index 6ba77f082d..678b57d197 100644
> --- a/xen/arch/arm/guest_atomics.c
> +++ b/xen/arch/arm/guest_atomics.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * arch/arm/guest_atomics.c
> =C2=A0 */
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 2f7d3a0da7..09fe486598 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Guest page table walk
> =C2=A0 * Copyright (c) 2017 Sergej Proskurin <proskurin@sec.in.tum.de>
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index 6716b03561..497e785ec4 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <xen/domain_page.h>
> =C2=A0#include <xen/guest_access.h>
> =C2=A0#include <xen/lib.h>
> diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
> index 0989309fea..86e49bf474 100644
> --- a/xen/arch/arm/hvm.c
> +++ b/xen/arch/arm/hvm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * arch/arm/hvm.c
> =C2=A0 *
> diff --git a/xen/arch/arm/include/asm/nospec.h
> b/xen/arch/arm/include/asm/nospec.h
> index efac51fc03..9c70eed605 100644
> --- a/xen/arch/arm/include/asm/nospec.h
> +++ b/xen/arch/arm/include/asm/nospec.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights
> Reserved. */
> =C2=A0
> =C2=A0#ifndef _ASM_ARM_NOSPEC_H
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 2e829d2e7f..b4211f0159 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * arm/ioreq.c: hardware virtual machine I/O emulation
> =C2=A0 *
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 674388fa11..669d143cee 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Kernel image loading.
> =C2=A0 *
> diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
> index bbca1e5a5e..037746d952 100644
> --- a/xen/arch/arm/livepatch.c
> +++ b/xen/arch/arm/livepatch.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 *=C2=A0 Copyright (C) 2016 Citrix Systems R&D Ltd.
> =C2=A0 */
> diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
> index 31db846354..0ec3462364 100644
> --- a/xen/arch/arm/mem_access.c
> +++ b/xen/arch/arm/mem_access.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * arch/arm/mem_access.c
> =C2=A0 *
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 1725cca649..bfa312cc8a 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <xen/cpu.h>
> =C2=A0#include <xen/domain_page.h>
> =C2=A0#include <xen/ioreq.h>
> diff --git a/xen/arch/arm/monitor.c b/xen/arch/arm/monitor.c
> index 6c93a9e993..49f5df8513 100644
> --- a/xen/arch/arm/monitor.c
> +++ b/xen/arch/arm/monitor.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * arch/arm/monitor.c
> =C2=A0 *
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 2465c266e9..65b70955e3 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <xen/iocap.h>
> =C2=A0#include <xen/lib.h>
> =C2=A0#include <xen/sched.h>
> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
> index 7b1682ee10..d63a8bf5ae 100644
> --- a/xen/arch/arm/physdev.c
> +++ b/xen/arch/arm/physdev.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/******************************************************************=
*
> ***********
> =C2=A0 * Arch-specific physdev.c
> =C2=A0 *
> diff --git a/xen/arch/arm/platform_hypercall.c
> b/xen/arch/arm/platform_hypercall.c
> index fde4bc3e58..ac55622426 100644
> --- a/xen/arch/arm/platform_hypercall.c
> +++ b/xen/arch/arm/platform_hypercall.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/******************************************************************=
*
> ***********
> =C2=A0 * platform_hypercall.c
> =C2=A0 *
> diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
> index 205a5e7f8c..c9778e5786 100644
> --- a/xen/arch/arm/shutdown.c
> +++ b/xen/arch/arm/shutdown.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <xen/console.h>
> =C2=A0#include <xen/cpu.h>
> =C2=A0#include <xen/delay.h>
> diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
> index bb65a08fc1..c11bba93ad 100644
> --- a/xen/arch/arm/smp.c
> +++ b/xen/arch/arm/smp.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <asm/system.h>
> =C2=A0#include <asm/smp.h>
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 5cda0dc674..32cab4feff 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/******************************************************************=
*
> ***********
> =C2=A0 * Arch-specific sysctl.c
> =C2=A0 *
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 70b5aeb822..c65c1dbf52 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * xen/arch/arm/vgic-v3-its.c
> =C2=A0 *
> diff --git a/xen/arch/arm/vm_event.c b/xen/arch/arm/vm_event.c
> index ccfd25bbbc..31812d9da3 100644
> --- a/xen/arch/arm/vm_event.c
> +++ b/xen/arch/arm/vm_event.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * arch/arm/vm_event.c
> =C2=A0 *
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 7856b4b5f5..1fc3114cce 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * arch/arm/vpl011.c
> =C2=A0 *
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 7f2f5eb9ce..f679cced7f 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * xen/arch/arm/vsmc.c
> =C2=A0 *
> diff --git a/xen/arch/riscv/early_printk.c
> b/xen/arch/riscv/early_printk.c
> index 610c814f54..634141354c 100644
> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * RISC-V early printk using SBI
> =C2=A0 *
> diff --git a/xen/arch/riscv/include/asm/acpi.h
> b/xen/arch/riscv/include/asm/acpi.h
> index f0b5e90969..0c553bd6b8 100644
> --- a/xen/arch/riscv/include/asm/acpi.h
> +++ b/xen/arch/riscv/include/asm/acpi.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> =C2=A0#ifndef ASM__RISCV__ACPI_H
> =C2=A0#define ASM__RISCV__ACPI_H
> diff --git a/xen/arch/riscv/include/asm/bitops.h
> b/xen/arch/riscv/include/asm/bitops.h
> index 9a6f576187..d22eec1e87 100644
> --- a/xen/arch/riscv/include/asm/bitops.h
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/* Copyright (C) 2012 Regents of the University of California */
> =C2=A0
> =C2=A0#ifndef ASM__RISCV__BITOPS_H
> diff --git a/xen/arch/riscv/include/asm/bug.h
> b/xen/arch/riscv/include/asm/bug.h
> index fa18dba20e..c395b809c6 100644
> --- a/xen/arch/riscv/include/asm/bug.h
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2012 Regents of the University of California
> =C2=A0 * Copyright (C) 2021-2023 Vates
> diff --git a/xen/arch/riscv/include/asm/cache.h
> b/xen/arch/riscv/include/asm/cache.h
> index 9a9e5162ab..d4cf1ac8e2 100644
> --- a/xen/arch/riscv/include/asm/cache.h
> +++ b/xen/arch/riscv/include/asm/cache.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> =C2=A0#ifndef ASM__RISCV__CACHE_H
> =C2=A0#define ASM__RISCV__CACHE_H
> diff --git a/xen/arch/riscv/include/asm/string.h
> b/xen/arch/riscv/include/asm/string.h
> index 75a2048fb1..a20af81f67 100644
> --- a/xen/arch/riscv/include/asm/string.h
> +++ b/xen/arch/riscv/include/asm/string.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> =C2=A0#ifndef ASM__RISCV__STRING_H
> =C2=A0#define ASM__RISCV__STRING_H
> diff --git a/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> index 092a828812..607c0f88c9 100644
> --- a/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> +++ b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Non Fatal Machine Check Exception Reporting
> =C2=A0 * (C) Copyright 2002 Dave Jones. <davej@codemonkey.org.uk>
> diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
> index b10f1f12b6..e99e663ba5 100644
> --- a/xen/arch/x86/debug.c
> +++ b/xen/arch/x86/debug.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2023 XenServer.
> =C2=A0 */
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h
> b/xen/arch/x86/hvm/svm/nestedhvm.h
> index 43245e13de..9bfed5ffd7 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * nestedsvm.h: Nested Virtualization
> =C2=A0 *
> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
> index 8dbf37ff49..beeaaab4f7 100644
> --- a/xen/arch/x86/hvm/svm/svm.h
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * svm.h: SVM Architecture related definitions
> =C2=A0 *
> diff --git a/xen/arch/x86/include/asm/gdbsx.h
> b/xen/arch/x86/include/asm/gdbsx.h
> index e906be9ea3..6315a7cfeb 100644
> --- a/xen/arch/x86/include/asm/gdbsx.h
> +++ b/xen/arch/x86/include/asm/gdbsx.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#ifndef __X86_GDBX_H__
> =C2=A0#define __X86_GDBX_H__
> =C2=A0
> diff --git a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> index a6915ad731..79cfc90dd8 100644
> --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> =C2=A0/*
> =C2=A0 * This file contains definitions from Hyper-V Hypervisor Top-Level
> Functional
> diff --git a/xen/arch/x86/include/asm/intel-family.h
> b/xen/arch/x86/include/asm/intel-family.h
> index d44dd3f69f..ab20cce124 100644
> --- a/xen/arch/x86/include/asm/intel-family.h
> +++ b/xen/arch/x86/include/asm/intel-family.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#ifndef _ASM_X86_INTEL_FAMILY_H
> =C2=A0#define _ASM_X86_INTEL_FAMILY_H
> =C2=A0
> diff --git a/xen/arch/x86/include/asm/nospec.h
> b/xen/arch/x86/include/asm/nospec.h
> index e058a3bb0e..150e78e884 100644
> --- a/xen/arch/x86/include/asm/nospec.h
> +++ b/xen/arch/x86/include/asm/nospec.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights
> Reserved. */
> =C2=A0
> =C2=A0#ifndef _ASM_X86_NOSPEC_H
> diff --git a/xen/arch/x86/include/asm/prot-key.h
> b/xen/arch/x86/include/asm/prot-key.h
> index 0dcd31b7ea..0cbecc2df4 100644
> --- a/xen/arch/x86/include/asm/prot-key.h
> +++ b/xen/arch/x86/include/asm/prot-key.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (c) 2021-2022 Citrix Systems Ltd.
> =C2=A0 */
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-
> tree/bootfdt.c
> index 911a630e7d..927f59c64b 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Early Device Tree
> =C2=A0 *
> diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-
> cpupool.c
> index feeac3b704..641f3495cb 100644
> --- a/xen/common/sched/boot-cpupool.c
> +++ b/xen/common/sched/boot-cpupool.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * xen/common/boot_cpupools.c
> =C2=A0 *
> diff --git a/xen/include/asm-generic/atomic-ops.h b/xen/include/asm-
> generic/atomic-ops.h
> index 98dd907942..769583b766 100644
> --- a/xen/include/asm-generic/atomic-ops.h
> +++ b/xen/include/asm-generic/atomic-ops.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * The header provides default implementations for every
> xen/atomic.h-provided
> =C2=A0 * forward inline declaration that can be synthesized from other
> atomic
> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-
> generic/monitor.h
> index 1ade289099..cad2b6ff24 100644
> --- a/xen/include/asm-generic/monitor.h
> +++ b/xen/include/asm-generic/monitor.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * include/asm-generic/monitor.h
> =C2=A0 *
> diff --git a/xen/include/xen/alternative-call.h
> b/xen/include/xen/alternative-call.h
> index 10f7d7637e..62672b7324 100644
> --- a/xen/include/xen/alternative-call.h
> +++ b/xen/include/xen/alternative-call.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#ifndef XEN_ALTERNATIVE_CALL
> =C2=A0#define XEN_ALTERNATIVE_CALL
> =C2=A0
> diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
> index 828dbd4e0a..c8167a8a24 100644
> --- a/xen/include/xen/nospec.h
> +++ b/xen/include/xen/nospec.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/* Copyright(c) 2018 Linus Torvalds. All rights reserved. */
> =C2=A0/* Copyright(c) 2018 Alexei Starovoitov. All rights reserved. */
> =C2=A0/* Copyright(c) 2018 Intel Corporation. All rights reserved. */
> diff --git a/xen/include/xen/unaligned.h
> b/xen/include/xen/unaligned.h
> index d9bb599e65..8c8b08338b 100644
> --- a/xen/include/xen/unaligned.h
> +++ b/xen/include/xen/unaligned.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#ifndef __XEN_UNALIGNED_H__
> =C2=A0#define __XEN_UNALIGNED_H__
> =C2=A0
> diff --git a/xen/tools/kconfig/expr.h b/xen/tools/kconfig/expr.h
> index 017843c9a4..fd08add33f 100644
> --- a/xen/tools/kconfig/expr.h
> +++ b/xen/tools/kconfig/expr.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
> =C2=A0 */
> diff --git a/xen/tools/kconfig/images.h b/xen/tools/kconfig/images.h
> index d8ff614bd0..565466511d 100644
> --- a/xen/tools/kconfig/images.h
> +++ b/xen/tools/kconfig/images.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
> =C2=A0 */
> diff --git a/xen/tools/kconfig/lexer.l b/xen/tools/kconfig/lexer.l
> index 4b7339ff4c..1e57543900 100644
> --- a/xen/tools/kconfig/lexer.l
> +++ b/xen/tools/kconfig/lexer.l
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
> =C2=A0 */
> diff --git a/xen/tools/kconfig/list.h b/xen/tools/kconfig/list.h
> index 45cb237ab7..979cd516d6 100644
> --- a/xen/tools/kconfig/list.h
> +++ b/xen/tools/kconfig/list.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#ifndef LIST_H
> =C2=A0#define LIST_H
> =C2=A0
> diff --git a/xen/tools/kconfig/lkc.h b/xen/tools/kconfig/lkc.h
> index 4fb16f3166..18282e7b0b 100644
> --- a/xen/tools/kconfig/lkc.h
> +++ b/xen/tools/kconfig/lkc.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
> =C2=A0 */
> diff --git a/xen/tools/kconfig/lkc_proto.h
> b/xen/tools/kconfig/lkc_proto.h
> index f9ab98238a..7598a2ef20 100644
> --- a/xen/tools/kconfig/lkc_proto.h
> +++ b/xen/tools/kconfig/lkc_proto.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0#include <stdarg.h>
> =C2=A0
> =C2=A0/* confdata.c */
> diff --git a/xen/tools/kconfig/lxdialog/checklist.c
> b/xen/tools/kconfig/lxdialog/checklist.c
> index fd161cfff1..29960ed000 100644
> --- a/xen/tools/kconfig/lxdialog/checklist.c
> +++ b/xen/tools/kconfig/lxdialog/checklist.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> =C2=A0/*
> =C2=A0 *=C2=A0 checklist.c -- implements the checklist box
> =C2=A0 *
> diff --git a/xen/tools/kconfig/lxdialog/dialog.h
> b/xen/tools/kconfig/lxdialog/dialog.h
> index 68b565e3c4..3930d93a4a 100644
> --- a/xen/tools/kconfig/lxdialog/dialog.h
> +++ b/xen/tools/kconfig/lxdialog/dialog.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> =C2=A0/*
> =C2=A0 *=C2=A0 dialog.h -- common declarations for all dialog modules
> =C2=A0 *
> diff --git a/xen/tools/kconfig/lxdialog/inputbox.c
> b/xen/tools/kconfig/lxdialog/inputbox.c
> index 1dcfb288ee..b8b6f15779 100644
> --- a/xen/tools/kconfig/lxdialog/inputbox.c
> +++ b/xen/tools/kconfig/lxdialog/inputbox.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> =C2=A0/*
> =C2=A0 *=C2=A0 inputbox.c -- implements the input box
> =C2=A0 *
> diff --git a/xen/tools/kconfig/lxdialog/menubox.c
> b/xen/tools/kconfig/lxdialog/menubox.c
> index 58c2f8afe5..4287745566 100644
> --- a/xen/tools/kconfig/lxdialog/menubox.c
> +++ b/xen/tools/kconfig/lxdialog/menubox.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> =C2=A0/*
> =C2=A0 *=C2=A0 menubox.c -- implements the menu box
> =C2=A0 *
> diff --git a/xen/tools/kconfig/lxdialog/textbox.c
> b/xen/tools/kconfig/lxdialog/textbox.c
> index 4e339b1266..b5987735b0 100644
> --- a/xen/tools/kconfig/lxdialog/textbox.c
> +++ b/xen/tools/kconfig/lxdialog/textbox.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> =C2=A0/*
> =C2=A0 *=C2=A0 textbox.c -- implements the text box
> =C2=A0 *
> diff --git a/xen/tools/kconfig/lxdialog/util.c
> b/xen/tools/kconfig/lxdialog/util.c
> index 1b490d4af0..0de2b05352 100644
> --- a/xen/tools/kconfig/lxdialog/util.c
> +++ b/xen/tools/kconfig/lxdialog/util.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> =C2=A0/*
> =C2=A0 *=C2=A0 util.c
> =C2=A0 *
> diff --git a/xen/tools/kconfig/lxdialog/yesno.c
> b/xen/tools/kconfig/lxdialog/yesno.c
> index bcaac9b7ba..ff1db42b3d 100644
> --- a/xen/tools/kconfig/lxdialog/yesno.c
> +++ b/xen/tools/kconfig/lxdialog/yesno.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL-2.0-or-later
> =C2=A0/*
> =C2=A0 *=C2=A0 yesno.c -- implements the yes/no box
> =C2=A0 *
> diff --git a/xen/tools/kconfig/nconf.h b/xen/tools/kconfig/nconf.h
> index fa5245eb93..eab138b30d 100644
> --- a/xen/tools/kconfig/nconf.h
> +++ b/xen/tools/kconfig/nconf.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2008 Nir Tzachar <nir.tzachar@gmail.com>
> =C2=A0 *
> diff --git a/xen/tools/kconfig/parser.y b/xen/tools/kconfig/parser.y
> index 822fc89fc8..5bac26bd91 100644
> --- a/xen/tools/kconfig/parser.y
> +++ b/xen/tools/kconfig/parser.y
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
> =C2=A0 */
> diff --git a/xen/tools/kconfig/qconf.h b/xen/tools/kconfig/qconf.h
> index 45bfe9b2b9..61ecd5bdab 100644
> --- a/xen/tools/kconfig/qconf.h
> +++ b/xen/tools/kconfig/qconf.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> =C2=A0 * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
> =C2=A0 */


