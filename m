Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gADHJmfb4Gk/mwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:51:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8840E626
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283369.1565617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMC0-0003HY-P0; Thu, 16 Apr 2026 12:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283369.1565617; Thu, 16 Apr 2026 12:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMC0-0003El-L5; Thu, 16 Apr 2026 12:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1283369;
 Thu, 16 Apr 2026 12:51:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wDMBy-0003Ef-QE
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMBw-00E95X-L2
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:51:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e0db4a-e002-0a2a0a5209dd-0a2a4507a988-44
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:51:34 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e0db55-229c-0a2a45070019-d155d036d155-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:51:34 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-671ae79e617so5532583a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:51:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776343893; cv=none;
        d=google.com; s=arc-20240605;
        b=eKZ1q8EHPRm3Cc8RXay4BVUCGkGYBtSawVd1xz9STYMlQFnU5//hEvZwC3VPw9BB2W
         dErJh64bJmIfm3K3QsfevMjia+zuerxpEl/18PDDwzahCWWL82Kd4jMH+vn45Nc1pdkb
         ILN9TAtzxQhWjb3Wg5jQ+rq5X35E0GCcqnKCIunUHzHwEszXZra9eRruj5RFpeSJQEVO
         9QNO6JAgWgvIGqr4l42rayM3GpK8HJvqfPdumW3P31tUlgbhrpVGxhbowzYbJPJSzpSC
         Jdntrj1uoDseHTrCBO9E15X0i/rWBK6I5O5wRoyRd+/O006NiKb5IlZkDHUum4p6/ia0
         1PCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uWWJ9mP4NDk9cmYvS5SgrgvtiEhcfJ12dbTuCvEl8X0=;
        fh=BxAOn7jMslPpxCh+ZwJ42wvijNvg8M+sVi4YM41sbzk=;
        b=hybbjYEtvg66sgGIGilQxPJcBElmsl1ddcxhlZ/djyOxqzUgl3jmsQx57HHcLvpuiJ
         m0okqjwDGGkEYx77Ez7pNp9MoinbmW6t4/0vHfSIvSWCh5iI+BidX2yt00plHXqrmkqD
         Q6S5A+pnu1jfXEOSiEQp9dyW5LeXtjUpULxGgesNwUs3y6Ie14MkipDN8u/ExCzc/I9v
         mfB/x0VvrjLidjYWp4Crb2qkQGq+dBHbcKcwCmUmBq+yp0AEnuXeAoWOjJUcSH2xO/SO
         Kd6S5QwtGD9XdXS134ZD2+QXlocwNlu95UK6NkzAz3w2bKt0ZI1I98eCMnbfH3G5TuUG
         AJlQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776343893; x=1776948693; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWWJ9mP4NDk9cmYvS5SgrgvtiEhcfJ12dbTuCvEl8X0=;
        b=OdWHYW00cyXXeWa0ca74tlQmnSHKEn6x1Q1uZcUwI1xOc0jHEb5UkU24JCZbVx7nkY
         I3HbdV0xfQZnq8PJb95Fdn1b5DHopsmZd5lGlDcqoVXmfU+x3OZFSKgPdbMY7QfZdKoF
         CXUfVrcSDOo1xKCGQfcHDMS/AmtGI1JRY75B50jAvhnEtSssBFu0bOdKpP3nFMgF+G+M
         cmAAtFssYfqp/ZtsJZdbo3Dhv+lq12CTEhfLTQ/HfAwJbaQPI64xmMc75WUvR3pO42N8
         1JbRbdL+lteDDr9veyVTs6wYei95nO3A84Vm+0RcUtA7Kf+6KTq2gGDjnyIB4w2BZnFB
         zUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343893; x=1776948693;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWWJ9mP4NDk9cmYvS5SgrgvtiEhcfJ12dbTuCvEl8X0=;
        b=Ns2hFNJMPFyJBCuWaLPo9X7KyypL9iFCZNmn1ZgErUU5aDjAStflkVleQZTBneK5CO
         4hqNZcz3gRPS9hU0bnV+iJVcj+lkQeDCuSQbDf/BE1buPDDYJEZPS8VEgp3G/1nDCKHE
         HzynGkUYRuQHh5R/inNHwV8gPz0y4X2LYcp+StwgNF0KGh4z7ocpao/HG5fo8KSLHyDG
         T50zghCQ0r5zVG6NIJbyfwksCYcEez6H0wcbgIeCYUizTI8eIPkosPywNInQyDbQboLJ
         usJ3DsZBL3CQ0FsyNncrq/XPqito4XM5LhLRKm7Guq5KRb3ZhAERm9pehjUuALk6z3pF
         iTUQ==
X-Gm-Message-State: AOJu0Yx4FwB8iju2KLqLyntJrmsD5IrsF8V7cVm6CzjwKNsYj4U1nAT6
	Yi0HAIcvWL/IX5DYymLl2QAK+KVsmNoz0xVgT0v0i9FNDue1d/5Rc3l1iT8gaYAKnejeE/bGGj2
	9wGdBVGDkSi2QLgUJu34cweLvc4iAivbJAHC0
X-Gm-Gg: AeBDiesvEC3+tI72qqb0eOwOnnaWMEmv/YhkXfiJ28XvaCcmtzX8bG6Uk4F+8QPGFTg
	mrhaSCpv22AV+4H2XzjqoQzIutBc+JD8aWCNXAigYOZplvDGraRx4qxKDBKYSPcsHi/fd/HF8jg
	SgU6ssVaUwAWdc/unzc9Mg5RvMvIeayidts6afxecIV389vTKr0T5366GNHb5Rmj+4yaZU4zUI2
	9V3OUMVr6So4BxPPF9TAvKIpOknrWPXxymhBdumzshuiXT7Ldp7p94j0909iD8pPGrnhti6MRAk
	YhqJvGcva+n4KXX+Vw==
X-Received: by 2002:a17:907:848:b0:b9d:1670:6794 with SMTP id
 a640c23a62f3a-b9d729bc9d5mr1332158166b.35.1776343892565; Thu, 16 Apr 2026
 05:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 16 Apr 2026 15:51:19 +0300
X-Gm-Features: AQROBzCXb_sn7BntMTwyQVG-72fbLmBAK4nVwRUIbr_john-FM3-bB9YxeaMzNo
Message-ID: <CAGeoDV-FXvFvrH5sWb=dO9rWrj6H2SA_cWEDB6d+fo9OkiukHg@mail.gmail.com>
Subject: PING: Re: [PATCH v8 00/13] Add initial Xen Suspend-to-RAM support on ARM64
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1776343894-2BF7EC48-1967113E/0/0
X-purgate-type: clean
X-purgate-size: 5859
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0CA8840E626
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

A gentle ping on this series. It's been a couple of weeks since v8 was post=
ed.

Please let me know if there are any further comments or if anything else is
needed from my side to move this forward.

Thanks!

Best regards,
Mykola

On Thu, Apr 2, 2026 at 1:47=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> This is part 2 of version 8 of the ARM Xen system suspend/resume patch
> series, based on earlier work by Mirela Simonovic and Mykyta Poturai.
>
> The first part is in mainline.
>
> NOTE: Most of the code is guarded by CONFIG_SYSTEM_SUSPEND, which can
> currently only be selected when UNSUPPORTED is set, and thus the
> functionality is neither enabled by default nor even built.
>
> This version is ported to Xen master and includes extensive improvements
> based on reviewer feedback. The patch series restructures code to improve
> robustness, maintainability, and implements system Suspend-to-RAM support
> on ARM64 hardware/control domains.
>
> Key updates in this series:
>  - Introduced architecture-specific suspend/resume infrastructure
>  - Integrated GICv2/GICv3 suspend and resume, including memory-backed con=
text
>    save/restore with error handling
>  - Added time and IRQ suspend/resume hooks, ensuring correct timer/interr=
upt
>    state across suspend cycles
>  - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
>  - Improved state management and recovery in error cases during suspend/r=
esume
>  - Added support for IPMMU-VMSA/SMMUv3 context save/restore
>  - Added support for GICv3 eSPI registers context save/restore
>  - Added support for ITS registers context save/restore
> ---
>
> TODOs:
>  - Enable "xl suspend" support on ARM
>  - Add suspend/resume CI test for ARM (QEMU if feasible)
>  - PCI suspend ?
> ---
>
> Detailed changelogs can be found in each patch.
>
> Changes in v8:
> - Rebased to latest master and refreshed the series accordingly.
> - Added a new GICv3 patch to tolerate retained redistributor LPI state
>   across CPU_OFF/CPU_ON.
> - GICv2 suspend now disables the CPU interface and distributor before
>   saving state.
> - GICv3 suspend/resume fixes the redistributor base used for LPI state.
> - ITS and SMMUv3 suspend/resume paths were tightened, with safer
>   restore/rollback handling and stricter fatal-error handling.
> - System suspend now checks that all domains are already in
>   SHUTDOWN_suspend before proceeding, and renames the hardware-domain
>   suspend capability/helper for clearer semantics.
> - Fixed alignment/cleanup issues in the low-level suspend/resume code.
>
> Changes in v7:
> - Timer helper renamed/clarified; virtual/hyper/phys handling documented.
> - GICv2 uses one context block; restore saved CTLR; panic on alloc failur=
e.
> - GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
> - IPMMU suspend context allocated before PCI setup.
> - System suspend: control domain drives host suspend.
> - Dropped v6 IRQ descriptor restore patches; use setup_irq and re-registe=
r
>   local IRQs on resume instead.
>
> For earlier changelogs, please refer to the previous cover letters.
>
> Mirela Simonovic (6):
>   xen/arm: Add suspend and resume timer helpers
>   xen/arm: gic-v2: Implement GIC suspend/resume functions
>   xen/arm: Resume memory management on Xen resume
>   xen/arm: Save/restore context on suspend/resume
>   xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
>   xen/arm: Add support for system suspend triggered by hardware domain
>
> Mykola Kvach (6):
>   xen/arm: gic-v3: tolerate retained redistributor LPI state across
>     CPU_OFF
>   xen/arm: gic-v3: Implement GICv3 suspend/resume functions
>   xen/arm: gic-v3: add ITS suspend/resume support
>   xen/arm: tee: keep init_tee_secondary() for hotplug and resume
>   xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
>   arm/smmu-v3: add suspend/resume handlers
>
> Oleksandr Tyshchenko (1):
>   iommu/ipmmu-vmsa: Implement suspend/resume callbacks
>
>  xen/arch/arm/Kconfig                     |   2 +
>  xen/arch/arm/Makefile                    |   1 +
>  xen/arch/arm/arm64/head.S                | 112 ++++++++
>  xen/arch/arm/gic-v2.c                    | 132 +++++++++
>  xen/arch/arm/gic-v3-its.c                | 126 +++++++-
>  xen/arch/arm/gic-v3-lpi.c                |  80 +++++-
>  xen/arch/arm/gic-v3.c                    | 349 ++++++++++++++++++++++-
>  xen/arch/arm/gic.c                       |  29 ++
>  xen/arch/arm/include/asm/gic.h           |  12 +
>  xen/arch/arm/include/asm/gic_v3_defs.h   |   1 +
>  xen/arch/arm/include/asm/gic_v3_its.h    |  24 ++
>  xen/arch/arm/include/asm/mm.h            |   2 +
>  xen/arch/arm/include/asm/psci.h          |   1 +
>  xen/arch/arm/include/asm/suspend.h       |  31 ++
>  xen/arch/arm/include/asm/time.h          |   5 +
>  xen/arch/arm/mmu/smpboot.c               |   2 +-
>  xen/arch/arm/psci.c                      |  23 +-
>  xen/arch/arm/suspend.c                   | 195 +++++++++++++
>  xen/arch/arm/tee/ffa_notif.c             |  63 +++-
>  xen/arch/arm/tee/tee.c                   |   2 +-
>  xen/arch/arm/time.c                      |  44 ++-
>  xen/arch/arm/vpsci.c                     |  12 +-
>  xen/common/Kconfig                       |   3 +
>  xen/common/domain.c                      |   7 +-
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 305 +++++++++++++++++++-
>  xen/drivers/passthrough/arm/smmu-v3.c    | 172 ++++++++---
>  xen/drivers/passthrough/arm/smmu.c       |  10 +
>  xen/include/xen/list.h                   |  14 +
>  28 files changed, 1670 insertions(+), 89 deletions(-)
>  create mode 100644 xen/arch/arm/suspend.c
>
> --
> 2.43.0

