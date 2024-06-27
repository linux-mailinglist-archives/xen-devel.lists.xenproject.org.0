Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7991A640
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 14:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750026.1158287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnvH-0007r5-Ad; Thu, 27 Jun 2024 12:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750026.1158287; Thu, 27 Jun 2024 12:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnvH-0007pb-7m; Thu, 27 Jun 2024 12:08:19 +0000
Received: by outflank-mailman (input) for mailman id 750026;
 Thu, 27 Jun 2024 12:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMnvG-0007pV-1R
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 12:08:18 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef6e02e7-347d-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 14:08:16 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52ce6c93103so5799365e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 05:08:16 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e71305ebbsm181177e87.126.2024.06.27.05.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 05:08:15 -0700 (PDT)
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
X-Inumbo-ID: ef6e02e7-347d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719490096; x=1720094896; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GzMk4hDJpHjtb6UvNw+sjRlOkUSAlQ4OZLHK0CoE3Vg=;
        b=QyZHKYsh+PMgchWYvvHgXoJ1iizkeg65cHaVYlVsaF4FjeW1FrAhWtzH19BqCqe+P/
         DFifLFrYid8ZYOGsiLlB0rt3h05hFEhbcBLvhkugCwNvkV4nWZkvtnl2ZwObLMT6Uu2G
         yLVCAR+CNREgqPzi3EiTWj7Dv4kn1XjcapnxCQCFZ/ktXfOLciJIPpUcTtSEe+QqMoNU
         eN8Q/fjJsTf12c8s7NUCW7ulWpLkOE4VLLSCTsq0h4MrpVCgaZaTIHt3nYjo6EWhYbD4
         9h/NcXQXkyaw539aSSge/6FMfKqePvomF+mRNYHQFmM1z1+ttn6oef46ZKa2bRu/SyuY
         /p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719490096; x=1720094896;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GzMk4hDJpHjtb6UvNw+sjRlOkUSAlQ4OZLHK0CoE3Vg=;
        b=m470KSZxC0nlZET+b6d+ZsF6t6TtKGEomuNkV4wzba64dV+D5O0ZFtIUe+JIVFGKTw
         h7XLytX2ogUTOxHvSsWTvV9lK5gt4lR2lNv1IcnpN2Z1raofrapnR4ETjkC4L/Ugv4Ne
         C2w5qTDnHmcGFAToXMpqCn02jecmVZ/JEiRzIYs7vGHYM+jwo/v7ZS/y2wIa8tAnGMKB
         +2X/DWR5pOJwXA1c6vvSwfqzzGLFbHMt/fFr832yaSofTIvG5ZP0bowM0kN8v0XYG0Gb
         f8KTGwUtBsNYjwXxbp7cRguBNMogD06eITeAd5mefv1J/Ngd3J1qoxU6UwCscqO+WSp/
         dZew==
X-Gm-Message-State: AOJu0YzCnwQrAFtmv6179y3afKIyDrE/jtL/dhNziBVcR1H0eC8F//lb
	29ZHcOuDsUFpBagVYvFCVw2j2s0o+ziKUBzJGfXJ1iz7V8NQxWSmksopKJdt
X-Google-Smtp-Source: AGHT+IH+zjlweNDC61QjtpvFb+Rtcnx6PdOFlfao8ffZ6e6DN7NGWk+cQvn6EIem56xO9AHTVZ0owg==
X-Received: by 2002:a19:2d0e:0:b0:529:b718:8d00 with SMTP id 2adb3069b0e04-52ce182bcffmr9509144e87.8.1719490095260;
        Thu, 27 Jun 2024 05:08:15 -0700 (PDT)
Message-ID: <e8ad8849f10ab8658b84ce18670549ef6314ae4e.camel@gmail.com>
Subject: Re: [PATCH for-4.19? v13 0/10]  Enable build of full Xen for RISC-V
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
Date: Thu, 27 Jun 2024 14:08:14 +0200
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

I saw a message in the xen-devel channel:```
erm...  We've got a problem.=20
https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7185148004
very clearly failed with a panic(), but reported success out to Gitlab
```
However, I couldn't determine if this is related to the patches in this
series or to patches that were merged earlier.

I would like to understand what needs to be done to be sure that this
patch series could be merged.

Thanks in advance.

Best regards,
 Oleksii



On Tue, 2024-06-25 at 15:51 +0200, Oleksii Kurochko wrote:
> ***
> I think that I need to write a separate email requesting approval for
> this patch
> series to be included in Xen 4.19. Most of the patches are RISC-V
> specific,
> so there is a low risk of breaking anything else.
> There is only one patch that touches common or arch-specific files,
> and it
> doesn't introduce any functional changes.
> Since I can't approve it myself, I am asking for someone else to do
> so.
> ***
>=20
> This patch series performs all of the additions necessary to drop the
> build overrides for RISCV and enable the full Xen build. Except in
> cases
> where compatibile implementations already exist (e.g. atomic.h and
> bitops.h), the newly added definitions are simple.
>=20
> The patch series is based on the following patch series:
> =C2=A0- [PATCH 3/3] xen/ppc: Avoid using the legacy
> __read_mostly/__ro_after_init definitions [1]
>=20
> The link to the branch with rebased patches on top of [1] could be
> found here:
> =C2=A0
> https://gitlab.com/xen-project/people/olkur/xen/-/commits/riscv-full-xen-=
build-v13
>=20
> [1]
> https://lore.kernel.org/xen-devel/20240621201928.319293-4-andrew.cooper3@=
citrix.com/
>=20
> ---
> Changes in V13:
> =C2=A0- Patch was merged to staging:
> =C2=A0=C2=A0 - [PATCH v12 ] xen/riscv: Update Kconfig in preparation for =
a full
> =C2=A0- Rebase on top of the current staging.
> =C2=A0- Update cover letter message
> =C2=A0- It was added 2 new patches ( patches 8 and 9 ) which are not
> necessary for testing environment we
> =C2=A0=C2=A0 have in CI but they improves compatability with older gcc an=
d
> binutils.
> =C2=A0- It was added patch 10 as a clean up of [PATCH v12 2/8] xen:
> introduce generic non-atomic test_*bit()
> =C2=A0=C2=A0 for x86.
> =C2=A0- Drop [PATCH v12 4/8] xen/riscv: add definition of __read_mostly a=
s
> it was defined as generic now
> =C2=A0=C2=A0 for all architectures.
> =C2=A0- It was added the patch [PATCH v13 07/10] xen/common: fix build
> issue for common/trace.c
> =C2=A0=C2=A0 to resolve compilation issue for RISC-V after reabsing on to=
p of
> current staging.
> =C2=A0- Other changes are specific to specific patches. Please look at
> changes for
> =C2=A0=C2=A0 specific patch.
> ---
> Changes in V12:
> =C2=A0- Rebase the patch series on top of [1] mentioned above.
> =C2=A0- Update the cover letter message.
> =C2=A0- "[PATCH v11 3/9] xen/bitops: implement fls{l}() in common logic"
> was droped
> =C2=A0=C2=A0 as it is a part of patch series [1] mentioned above.
> =C2=A0- Other changes are specific to specific patches. Please look at
> changes for
> =C2=A0=C2=A0 specific patch.
> ---
> Changes in V11:
> =C2=A0 - Patch was merged to staging:
> =C2=A0=C2=A0=C2=A0 - [PATCH v10 05/14] xen/riscv: introduce cmpxchg.h
> 	=C2=A0 - [PATCH v10 06/14] xen/riscv: introduce atomic.h
> 	=C2=A0 - [PATCH v10 07/14] xen/riscv: introduce monitor.h
> 	=C2=A0 - [PATCH v10 09/14] xen/riscv: add required things to
> current.h
> 	=C2=A0 - [PATCH v10 11/14] xen/riscv: introduce vm_event_*()
> functions
> =C2=A0- Other changes are specific to specific patches. Please look at
> changes for
> =C2=A0=C2=A0 specific patch.
> ---
> Changes in V10:
> =C2=A0 - Patch was merged to staging:
> =C2=A0=C2=A0=C2=A0 - [PATCH v9 04/15] xen/bitops: put __ffs() into linux =
compatible
> header
> =C2=A0- Other changes are specific to specific patches. Please look at
> changes for
> =C2=A0=C2=A0 specific patch.
> ---
> Changes in V9:
> =C2=A0- Patch was merged to staging:
> =C2=A0=C2=A0=C2=A0 - [PATCH v8 07/17] xen/riscv: introduce io.h
> =C2=A0=C2=A0	- [PATCH v7 14/19] xen/riscv: add minimal stuff to page.h to
> build full Xen
> =C2=A0- Other changes are specific to specific patches. Please look at
> changes for
> =C2=A0=C2=A0 specific patch.
> ---
> Changes in V8:
> =C2=A0- Patch was merged to staging:
> =C2=A0=C2=A0=C2=A0 - [PATCH v7 01/19] automation: introduce fixed randcon=
fig for
> RISC-V
> =C2=A0=C2=A0=C2=A0 - [PATCH v7 03/19] xen/riscv: introduce extenstion sup=
port check
> by compiler
> =C2=A0- Other changes are specific to specific patches. Please look at
> changes for
> =C2=A0=C2=A0 specific patch.
> =C2=A0- Update the commit message:
> =C2=A0=C2=A0=C2=A0=C2=A0 - drop the dependency from STATIC_ASSERT_UNREACH=
ABLE()
> implementation.
> =C2=A0=C2=A0=C2=A0=C2=A0 - Add suggestion to merge arch-specific changes =
related to
> __read_mostly.
> ---
> Changes in V7:
> =C2=A0- Patch was merged to staging:
> =C2=A0=C2=A0 [PATCH v6 15/20] xen/riscv: add minimal stuff to processor.h=
 to
> build full Xen.
> =C2=A0- Other changes are specific to specific patches. Please look at
> changes for
> =C2=A0=C2=A0 specific patch.
> ---
> Changes in V6:
> =C2=A0- Update the cover letter message: drop already merged dependecies
> and add
> =C2=A0=C2=A0 a new one.
> =C2=A0- Patches were merged to staging:
> =C2=A0=C2=A0 - [PATCH v5 02/23] xen/riscv: use some asm-generic headers (=
 even
> v4 was
> =C2=A0=C2=A0=C2=A0=C2=A0 merged to staging branch, I just wasn't apply ch=
anges on top of
> the latest staging branch )
> =C2=A0=C2=A0 - [PATCH v5 03/23] xen/riscv: introduce nospec.h
> =C2=A0=C2=A0 - [PATCH v5 10/23] xen/riscv: introduces acrquire, release a=
nd
> full barriers
> =C2=A0- Introduce new patches:
> =C2=A0=C2=A0 - xen/riscv: introduce extenstion support check by compiler
> =C2=A0=C2=A0 - xen/bitops: put __ffs() and ffz() into linux compatible he=
ader
> =C2=A0=C2=A0 - xen/bitops: implement fls{l}() in common logic
> =C2=A0- The following patches were dropped:
> =C2=A0=C2=A0 - drop some patches related to bitops operations as they wer=
e
> introduced in another
> =C2=A0=C2=A0=C2=A0=C2=A0 patch series [...]
> =C2=A0=C2=A0 - introduce new version for generic __ffs(), ffz() and fls{l=
}().
> =C2=A0- Merge patch from patch series "[PATCH v9 0/7]=C2=A0 Introduce gen=
eric
> headers" to this patch
> =C2=A0=C2=A0 series as only one patch left in the generic headers patch s=
eries
> and it is more about
> =C2=A0=C2=A0 RISC-V.
> =C2=A0- Other changes are specific to specific patches. please look at
> specific patch.
> ---
> Changes in V5:
> =C2=A0- Update the cover letter as one of the dependencies were merged to
> staging.
> =C2=A0- Was introduced asm-generic for atomic ops and separate patches fo=
r
> asm-generic bit ops
> =C2=A0- Moved fence.h to separate patch to deal with some patches
> dependecies on fence.h
> =C2=A0- Patches were dropped as they were merged to staging:
> =C2=A0=C2=A0 * [PATCH v4 03/30] xen: add support in public/hvm/save.h for=
 PPC
> and RISC-V
> =C2=A0=C2=A0 * [PATCH v4 04/30] xen/riscv: introduce cpufeature.h
> =C2=A0=C2=A0 * [PATCH v4 05/30] xen/riscv: introduce guest_atomics.h
> =C2=A0=C2=A0 * [PATCH v4 06/30] xen: avoid generation of empty asm/iommu.=
h
> =C2=A0=C2=A0 * [PATCH v4 08/30] xen/riscv: introduce setup.h
> =C2=A0=C2=A0 * [PATCH v4 10/30] xen/riscv: introduce flushtlb.h
> =C2=A0=C2=A0 * [PATCH v4 11/30] xen/riscv: introduce smp.h
> =C2=A0=C2=A0 * [PATCH v4 15/30] xen/riscv: introduce irq.h
> =C2=A0=C2=A0 * [PATCH v4 16/30] xen/riscv: introduce p2m.h
> =C2=A0=C2=A0 * [PATCH v4 17/30] xen/riscv: introduce regs.h
> =C2=A0=C2=A0 * [PATCH v4 18/30] xen/riscv: introduce time.h
> =C2=A0=C2=A0 * [PATCH v4 19/30] xen/riscv: introduce event.h
> =C2=A0=C2=A0 * [PATCH v4 22/30] xen/riscv: define an address of frame tab=
le
> =C2=A0- Other changes are specific to specific patches. please look at
> specific patch
> ---
> Changes in V4:
> =C2=A0- Update the cover letter message: new patch series dependencies.
> =C2=A0- Some patches were merged to staging, so they were dropped in this
> patch series:
> =C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v3 09/34] xen/riscv: introduce system.h
> =C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v3 18/34] xen/riscv: introduce domain.h
> =C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v3 19/34] xen/riscv: introduce guest_acce=
ss.h
> =C2=A0- Was sent out of this patch series:
> =C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v3 16/34] xen/lib: introduce generic find=
 next bit
> operations
> =C2=A0- [PATCH v3 17/34] xen/riscv: add compilation of generic find-next-
> bit.c was
> =C2=A0=C2=A0 droped as CONFIG_GENERIC_FIND_NEXT_BIT was dropped.
> =C2=A0- All other changes are specific to a specific patch.
> ---
> Changes in V3:
> =C2=A0- Update the cover letter message
> =C2=A0- The following patches were dropped as they were merged to staging=
:
> =C2=A0=C2=A0=C2=A0 [PATCH v2 03/39] xen/riscv:introduce asm/byteorder.h
> =C2=A0=C2=A0=C2=A0 [PATCH v2 04/39] xen/riscv: add public arch-riscv.h
> =C2=A0=C2=A0=C2=A0 [PATCH v2 05/39] xen/riscv: introduce spinlock.h
> =C2=A0=C2=A0=C2=A0 [PATCH v2 20/39] xen/riscv: define bug frame tables in=
 xen.lds.S
> =C2=A0=C2=A0=C2=A0 [PATCH v2 34/39] xen: add RISCV support for pmu.h
> =C2=A0=C2=A0=C2=A0 [PATCH v2 35/39] xen: add necessary headers to common =
to build
> full Xen for RISC-V
> =C2=A0- Instead of the following patches were introduced new:
> =C2=A0=C2=A0=C2=A0 [PATCH v2 10/39] xen/riscv: introduce asm/iommu.h
> =C2=A0=C2=A0=C2=A0 [PATCH v2 11/39] xen/riscv: introduce asm/nospec.h
> =C2=A0- remove "asm/"=C2=A0 for commit messages which start with "xen/ris=
cv:"
> =C2=A0- code style updates.
> =C2=A0- add emulation of {cmp}xchg_* for 1 and 2 bytes types.
> =C2=A0- code style fixes.
> =C2=A0- add SPDX and footer for the newly added headers.
> =C2=A0- introduce generic find-next-bit.c.
> =C2=A0- some other mionor changes. ( details please find in a patch )
> ---
> Changes in V2:
> =C2=A0 - Drop the following patches as they are the part of [2]:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 06/57] xen/riscv: introduce pagi=
ng.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 08/57] xen/riscv: introduce asm/=
device.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 10/57] xen/riscv: introduce asm/=
grant_table.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 12/57] xen/riscv: introduce asm/=
hypercall.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 13/57] xen/riscv: introduce asm/=
iocap.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 15/57] xen/riscv: introduce asm/=
mem_access.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 18/57] xen/riscv: introduce asm/=
random.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 21/57] xen/riscv: introduce asm/=
xenoprof.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 24/57] xen/riscv: introduce asm/=
percpu.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 29/57] xen/riscv: introduce asm/=
hardirq.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 33/57] xen/riscv: introduce asm/=
altp2m.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 38/57] xen/riscv: introduce asm/=
monitor.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 39/57] xen/riscv: introduce asm/=
numa.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v1 42/57] xen/riscv: introduce asm/=
softirq.h
> =C2=A0 - xen/lib.h in most of the cases were changed to xen/bug.h as
> =C2=A0=C2=A0=C2=A0 mostly functionilty of bug.h is used.
> =C2=A0 - align arch-riscv.h with Arm's version of it.
> =C2=A0 - change the Author of commit with introduction of asm/atomic.h.
> =C2=A0 - update some definition from spinlock.h.
> =C2=A0 - code style changes.
> ---
>=20
>=20
> Oleksii Kurochko (10):
> =C2=A0 xen: introduce generic non-atomic test_*bit()
> =C2=A0 xen/riscv: introduce bitops.h
> =C2=A0 xen/riscv: add minimal stuff to mm.h to build full Xen
> =C2=A0 xen/riscv: add minimal amount of stubs to build full Xen
> =C2=A0 xen/riscv: enable full Xen build
> =C2=A0 xen/README: add compiler and binutils versions for RISC-V64
> =C2=A0 xen/common: fix build issue for common/trace.c
> =C2=A0 xen/riscv: change .insn to .byte in cpu_relax()
> =C2=A0 xen/riscv: introduce ANDN_INSN
> =C2=A0 xen/x86: drop constanst_test_bit() in asm/bitops.h
>=20
> =C2=A0README=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0xen/arch/arm/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 69 ----
> =C2=A0xen/arch/ppc/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 54 ----
> =C2=A0xen/arch/ppc/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0xen/arch/ppc/mm-radix.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +-
> =C2=A0xen/arch/riscv/arch.mk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 -
> =C2=A0xen/arch/riscv/early_printk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 168 ----------
> =C2=A0xen/arch/riscv/include/asm/bitops.h=C2=A0=C2=A0=C2=A0 | 137 +++++++=
+
> =C2=A0xen/arch/riscv/include/asm/cmpxchg.h=C2=A0=C2=A0 |=C2=A0 16 +-
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 235 ++++++++++++++
> =C2=A0xen/arch/riscv/include/asm/processor.h |=C2=A0=C2=A0 2 +-
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
43 ++-
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> =C2=A0xen/arch/riscv/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 418
> +++++++++++++++++++++++++
> =C2=A0xen/arch/riscv/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 ++
> =C2=A0xen/arch/x86/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 39 +--
> =C2=A0xen/common/trace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> =C2=A0xen/include/xen/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 182 +++++++++++
> =C2=A019 files changed, 1096 insertions(+), 331 deletions(-)
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/bitops.h
> =C2=A0create mode 100644 xen/arch/riscv/stubs.c
>=20


