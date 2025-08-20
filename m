Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED05B2DA4E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 12:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087303.1445388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uogLy-0005BX-H7; Wed, 20 Aug 2025 10:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087303.1445388; Wed, 20 Aug 2025 10:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uogLy-00059u-EM; Wed, 20 Aug 2025 10:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1087303;
 Wed, 20 Aug 2025 10:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qmnz=3A=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uogLx-00052a-6y
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 10:47:37 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1525f06a-7db3-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 12:47:36 +0200 (CEST)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-30cceb3864aso641111fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Aug 2025 03:47:36 -0700 (PDT)
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
X-Inumbo-ID: 1525f06a-7db3-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755686855; x=1756291655; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9etWxezhAaAF0Ea1VJDYZxwEpb3zoaddms27rr/aeHc=;
        b=Rcvtz70Yw4DuhudR1j9ZaxkzsM34OL+hBLxQwZtoLymnFZXWwhqmJermxW+gXjSUkA
         1lUNzCep+URJHCMT02lZulNegT/SdUcAxIDoBNDywegodmZVRCia1vr5iMxf6mj10i5A
         9M9XTf4k0qqS+/schZ3Geo2PCzwu6oEOnAFVKnt7vONR90eUgZ+Rkm5FD0SQREGxNV+/
         8VkPABSO71O2e6milzuZL0RD2lmrYwCRAUp7Nf6lkyQejVKylX0Hux8uQHfZniW7NTzw
         A6ZyYxL0BuEf/RALzC/K1IpNFeU1cCI6X+uflcE7ejZyUt77pygyIgoDxlBMR9eRwENP
         6HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755686855; x=1756291655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9etWxezhAaAF0Ea1VJDYZxwEpb3zoaddms27rr/aeHc=;
        b=bM0G4E5MupeRWVqIuYnji6VXRCqaM7sRKNDXcU7RRNeDW8M9uE5QbD/mq9ooPZbNUd
         +d/TNiqAm8XxO9BdT2jzJOaTXFhLhbEEbxSTNKXiu+hgR9JCoGx07OL0p/he7n4PTUAm
         sh0ySLB1UvijoENlyU/9rYEOiO3ByQu4oZBYEDazN/+r6z9qxqqzhnYwOfUGShCk0cie
         IUBwVQPyXCezeaMrH+cjvNrldVAPvCkiccsqqypvNp0IYjXdZRA0DbAruLkvOcv/lPlC
         f+l9JUG4f3O8cFgGWeJC+0te0EWeXs4UMtL8zwZWVPmuM72fVVbeVfY8LY7UPsN2xkJe
         jxXg==
X-Gm-Message-State: AOJu0YzwROrCO83xdXLTgytBRg+TQy/755n06+fMaW4qyhq023iCyeGL
	cMb3NMq84gGpm4EIQh/JzoM9djLEjUPHaZTT+zeIsHN+nroOnkphC0k37nAyGFR2BwQtLTSJJRF
	qjSrWVCrCpnV+Z4vsXOJlWxl9c6Hw1/7ysw==
X-Gm-Gg: ASbGncvSJeUiJjMT1jUPsAJYqG+gcX0QgNoeh4U2mX/laf0tBmZ3vTz12Ye0ty/cwrv
	UB5YqiVg6NJGwwXC8Njy8pwu3klCMcw54LTv6nBuSWr3yTrtJJEttx6kWV6qXRe8TPbKDu7JSpn
	bVIRLVHkv6zIev7SA3OH+XNyOk5tbk7CdhhH97iMMH01Y1Fb1uFQpzXnfH0PyAgREBBRPhza8lg
	LD2grx0VcXs7qWSYb1GVyDvlcE0tPNRfEAClAYv
X-Google-Smtp-Source: AGHT+IGpsoWcd1Bmgi+N51BrG1BSVgctU6F020xvqjGLIZCRmGzB/eoTYCYCsIsXx5q1PGIW84HSRqRZbfH4+0pjzRE=
X-Received: by 2002:a05:6808:6d81:b0:404:a28c:ca53 with SMTP id
 5614622812f47-43771f10d15mr639228b6e.0.1755686854634; Wed, 20 Aug 2025
 03:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753953832.git.w1benny@gmail.com>
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 20 Aug 2025 12:47:23 +0200
X-Gm-Features: Ac12FXxYl83BJ0yF35i4xwoTS_kTA2Aef5V6Nkax9m5KwI7cj1eK8LPZ60nRDVQ
Message-ID: <CAKBKdXiKpsmmcGR6A3jEfHSPBE4eG=9uyBzZTW21seGUuzzi0A@mail.gmail.com>
Subject: Ping: [PATCH v12 0/6] x86: Make MAX_ALTP2M configurable
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Juergen Gross <jgross@suse.com>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 11:28=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com=
> wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> This series introduces the ability to configure the maximum number of alt=
p2m
> tables during domain creation. Previously, the limits were hardcoded to a
> maximum of 10. This change allows for greater flexibility in environments=
 that
> require more or fewer altp2m views.
>
> This enhancement is particularly relevant for users leveraging Xen's feat=
ures
> for virtual machine introspection.
>
> Changes since v11:
> - altp2m: Drop p2m_altp2m_check() stubs on non-x86, move prototype, and g=
uard
>   uses
>     - s/following/subsequent/ in the commit message + Reviewed-by: Jan Be=
ulich
>     - Despite agreeing to let Jan make this change, this commit wasn't st=
ill in
>       the staging branch at the time of sending this patch.
>
> - x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
>     - Change typo #else /* !CONFIG_HVM */ -> #else /* !CONFIG_ALTP2M */ i=
n p2m.h
>     - Move p2m_altp2m_get_or_propagate & p2m_altp2m_propagate_change outs=
ide of
>       #ifdef CONFIG_ALTP2M / #else / #endif and added comment mentioning =
that
>       these altp2m declarations are outside of the #ifdef scope intention=
ally.
>
> Changes since v10:
> - x86/altp2m: Remove p2m_altp2m_check stubs from unsupported architecture=
s
>     - (now "altp2m: drop p2m_altp2m_check() stubs on non-x86, move protot=
ype,
>        and guard uses").
>     - Changed commit message to reflect new changes.
>     - Removed p2m_altp2m_check from x86/include/asm/p2m.h.
>     - Introduced p2m_altp2m_check in xen/include/xen/p2m-common.h.
>     - Replaced #ifdef CONFIG_ALTP2M with IS_ENABLED(CONFIG_ALTP2M) in
>       vm_event.c.
>
> - x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
>     - Added `else if ( IS_ENABLED(CONFIG_ALTP2M) )` before calling
>       hvm_fast_singlestep in vm_event_toggle_singlestep, to make sure tha=
t
>       hvm_fast_singlestep is unreachable when ALTP2M=3Dn.
>
>       Also, the #ifdef CONFIG_ALTP2M inside hvm_fast_singlestep was moved=
 to be
>       _outside_ the function (wrapping it entirely).
>
>     - Removed formatting of the hvmemul_vmfunc function header + moved
>       the #ifdef to be inside the function body.
>
>     - Removed altp2m_vcpu_update_{p2m,vmfunc_ve}() declarations
>       from hvm.h, since they are not used when CONFIG_ALTP2M is not set.
>
> - xen: Make the maximum number of altp2m views configurable for x86
>     - In do_altp2m_op, -EOPNOTSUPP is now returned when nr_altp2m =3D=3D =
0, instead
>       of -EINVAL.
>
>     - Removed stray empty lines that were introduced in
>       p2m_mem_access_emulate_check & p2m_mem_access_check.
>
> Changes since v9:
> - Introduced 3 more patches:
>   - x86/p2m: Short-circuit p2m_is_altp2m() when CONFIG_ALTP2M=3Dn
>     - Needed to optimize out `if ( p2m_is_altp2m(p2m) )` when CONFIG_ALTP=
2M=3Dn.
>   - x86/altp2m: Remove p2m_altp2m_check stubs from unsupported architectu=
res
>     - Removes p2m_altp2m_check stubs from archs that don't support altp2m=
.
>   - x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
>     - Self-explanatory - based on Jans review suggestion
> - Small changes based on review:
>   - if ( v->domain->nr_altp2m =3D=3D 0 ) -> if ( !v->domain->nr_altp2m )
>   - removed unnecessary condition in p2m_teardown_altp2m
>   - Added ASSERT(!config->altp2m.nr) when CONFIG_ALTP2M=3Dn in domain_cre=
ate
>
> Changes since v8:
> - Removed 1st patch, which was already applied.
> - Removed Reviewed-by from "tools/xl: Add altp2m_count parameter" patch.
> - (No code changes)
>
> Changes since v7:
> - Fix condition in libxl_create.c that caused assertions in CI.
> - Removed incorrect mention of introduction of hvm_altp2m_supported() in =
commit
>   message of patch 0004.
> - Adjust comments in altp2m_is_eptp_valid().
> - Guard ALTP2M features with CONFIG_ALTP2M where appropriate. I made my b=
est to
>   ensure that the following configurations compile correctly:
>   * CONFIG_HVM=3Dn (CONFIG_ALTP2M=3Dn implied)
>   * CONFIG_HVM=3Dy CONFIG_ALTP2M=3Dn
>   * CONFIG_HVM=3Dy CONFIG_ALTP2M=3Dy
>   * Note: Besides taking inspiration from CONFIG_MEM_SHARING &
>     CONFIG_MEM_PAGING, the reason for guards instead of wrapper methods i=
s that
>     all ALTP2M features and fields became guarded by CONFIG_ALTP2M - ther=
efore,
>     lots of code inside ALTP2M blocks would be touching inexisting fields=
.
>
>     This could be solved by introducing wrapped functions for each ALTP2M
>     field, but I believe that would be overkill.
>
> Changes since v6:
> - Rebased on top of staging
> - Added missing Acks/Reviewed-bys where appropriate.
> - No changes in patches since v6, with the exception of 0004: xen: Make t=
he
>   maximum number of altp2m views configurable for x86... which was the on=
ly
>   patch that was left unacked/not reviewed
>   - In that patch, I made changes suggested by Jan - that is:
>     - Create altp2m_is_eptp_valid function and use it in places where
>       we don't control the index
>     - Fixed a nit: "Number of altp2ms to allocate." -> "... to permit."
>     - Cosmetic: moved altp2m_vcpu_idx() in altp2m.h up, so the order of
>       functions matches with the order in the #else block
>
> Changes since v5:
> - Reverted "Introduction of accessor functions for altp2m arrays and
>   refactoring the code to use them."
>   - Reason is minimizing the code changes, and save the code consistency.
>   - I've addressed (hopefully all) issues with long lines and mismatched
>     _nospec replacements mentioned in previous reviews.
> - Removed "struct domain *d" from altp2m_vcpu_initialise/destroy.
>
> Changes since v4:
> - Rebased on top of staging (applying Roger's changes).
> - Fix mixed tabs/spaces in xenctrl_stubs.c.
> - Add missing OCaml bindings for altp2m_opts.
> - Substitute altp2m_opts into an unnamed structure. (This is a preparatio=
n for
>   the next patch that will introduce the `nr` field.)
> - altp2m.opts is then shortened to uint16_t and a new field altp2m.nr is =
added -
>   also uint16_t. This value is then verified by libxl to not exceed the m=
aximum
>   uint16_t value.
>
>   This puts a hard limit to number of altp2m to 65535, which is enough, a=
t least
>   for the time being. Also, altp2m.opts currently uses only 2 bits. There=
fore
>   I believe this change is justified.
> - Introduction of accessor functions for altp2m arrays and refactoring th=
e code
>   to use them.
> - Added a check to arm/arch_sanitise_domain_config() to disallow creating
>   domains with altp2m.nr !=3D 0.
> - Added dummy hvm_altp2m_supported() to avoid build errors when CONFIG_HV=
M is
>   disabled.
> - Finally, expose altp2m_count to OCaml bindings (and verify both altp2m_=
opts
>   and altp2m_count fit uint16_t).
> - I also removed Christian Lindig from the Acked-by, since I think this c=
hange
>   is significant enough to require a re-review.
>
> Changes since v3:
> - Rebased on top of staging (some functions were moved to altp2m.c).
> - Re-added the array_index_nospec() where it was removed.
>
> Changes since v2:
> - Changed max_altp2m to nr_altp2m.
> - Moved arch-dependent check from xen/common/domain.c to xen/arch/x86/dom=
ain.c.
> - Replaced min(d->nr_altp2m, MAX_EPTP) occurences for just d->nr_altp2m.
> - Replaced array_index_nospec(altp2m_idx, ...) for just altp2m_idx.
> - Shortened long lines.
> - Removed unnecessary comments in altp2m_vcpu_initialise/destroy.
> - Moved nr_altp2m field after max_ fields in xen_domctl_createdomain.
> - Removed the commit that adjusted the initial allocation of pages from 2=
56
>   to 1024. This means that after these patches, technically, the nr_altp2=
m will
>   be capped to (256 - 1 - vcpus - MAX_NESTEDP2M) instead of MAX_EPTP (512=
).
>   Future work will be needed to fix this.
>
> Petr Bene=C5=A1 (6):
>   altp2m: Drop p2m_altp2m_check() stubs on non-x86, move prototype, and
>     guard uses
>   x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
>   xen: Make the maximum number of altp2m views configurable for x86
>   tools/libxl: Activate the altp2m_count feature
>   xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
>     =3D=3D 0
>   tools/ocaml: Add altp2m_count parameter
>
>  tools/libs/light/libxl_create.c     |  4 ++
>  tools/ocaml/libs/xc/xenctrl.ml      |  1 +
>  tools/ocaml/libs/xc/xenctrl.mli     |  1 +
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 19 ++++++--
>  xen/arch/arm/domain.c               |  2 +-
>  xen/arch/arm/include/asm/p2m.h      |  6 ---
>  xen/arch/ppc/include/asm/p2m.h      |  5 --
>  xen/arch/riscv/include/asm/p2m.h    |  5 --
>  xen/arch/x86/domain.c               | 41 +++++++++++++---
>  xen/arch/x86/hvm/emulate.c          |  4 ++
>  xen/arch/x86/hvm/hvm.c              | 18 +++++++-
>  xen/arch/x86/hvm/monitor.c          |  2 +
>  xen/arch/x86/hvm/vmx/vmx.c          | 10 +++-
>  xen/arch/x86/include/asm/altp2m.h   | 28 +++++++++--
>  xen/arch/x86/include/asm/domain.h   | 11 +++--
>  xen/arch/x86/include/asm/hvm/hvm.h  |  6 +++
>  xen/arch/x86/include/asm/hvm/vcpu.h |  4 ++
>  xen/arch/x86/include/asm/p2m.h      | 43 +++++++++--------
>  xen/arch/x86/mm/altp2m.c            | 72 +++++++++++++++--------------
>  xen/arch/x86/mm/hap/hap.c           | 12 +++--
>  xen/arch/x86/mm/mem_access.c        | 28 +++++------
>  xen/arch/x86/mm/mem_sharing.c       |  4 +-
>  xen/arch/x86/mm/p2m-ept.c           | 11 +++--
>  xen/arch/x86/mm/p2m-pt.c            |  2 +
>  xen/arch/x86/mm/p2m.c               | 17 +++++--
>  xen/arch/x86/vm_event.c             |  2 +-
>  xen/common/domain.c                 |  6 +++
>  xen/common/vm_event.c               |  3 +-
>  xen/include/public/domctl.h         |  5 +-
>  xen/include/xen/p2m-common.h        |  3 ++
>  xen/include/xen/sched.h             |  4 ++
>  31 files changed, 261 insertions(+), 118 deletions(-)
>
> --
> 2.34.1
>

