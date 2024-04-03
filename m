Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34719896ECB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700518.1093787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzZt-0001gv-Nj; Wed, 03 Apr 2024 12:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700518.1093787; Wed, 03 Apr 2024 12:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzZt-0001eQ-KI; Wed, 03 Apr 2024 12:18:53 +0000
Received: by outflank-mailman (input) for mailman id 700518;
 Wed, 03 Apr 2024 12:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrzZt-0001eK-5d
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:18:53 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54e80b52-f1b4-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 14:18:51 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a4715991c32so817206166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 05:18:51 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906a18c00b00a4672fb2a03sm7740552ejy.10.2024.04.03.05.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 05:18:49 -0700 (PDT)
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
X-Inumbo-ID: 54e80b52-f1b4-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712146730; x=1712751530; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L4AiNrkxX5H2YmpgV2jGOL8k8M+RZPdPK6HaaXIaoIw=;
        b=Lmm9FC5e0j/S4L/vBaBj2jpZNAz5ZijzUiL9cOFIVvIerDcK8FoKI7hPYti+1MBxdj
         E4oV9aSUPrwi4/QkmZHCYpY81tuLLLBmC+fhagf5oOc5F69Y+3FAprMRyMozJd18O2NT
         VzXPSmd2hZyWcqamCD0I5VMHXY6/PWpBh0s7VxHz1TVmXSJxblyQvz9cgEPnKtLYvc1+
         NwZTVh4RHJ9sELRkDfQDjCKrmKCtde6pPmbvp1dvfZo0IU5F4BVv4YjIp9d2IL4HcTjX
         2ISmO4NQFPL1koXYJYTA+yIunrq4gsLIiF5YFevTAI5MMZ3EKAEWGt44lAvmJ98aUMiR
         +lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712146730; x=1712751530;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4AiNrkxX5H2YmpgV2jGOL8k8M+RZPdPK6HaaXIaoIw=;
        b=q2PMxylK6b29TFFdVPUW8Bw8Q7Nk0gbcRnIo72mA4yRwnBBD7wrC+6nVpJuibyuCjH
         uWaev87m4DGrIPJpYGPK5wsI5lMXF8nQvB9I9oyigbXng2XOL6Xqf8uxWzdAmnKre+OX
         jEhT/7PVBxJnJtVyIzXtlSlXh+cKNm5oyd6GIscQrFt+35hIG6F0UDREv7EqpHQEVWpi
         HfZNW/FKfT/DJwzQkxG9UA823Pd+c1IvbM1iaB59ZBrftw67ylLSSfpXfN3MxgkpR0CO
         Z57cHLgqLnDGR4gm+6Q2sqE3sZP6f+tAb9A3sJwYG6gtB/PUN9m8y/WbNJhmOG1l+Rmm
         M4CQ==
X-Gm-Message-State: AOJu0YyqQObFbbuE8DRi12OcjlvLienYIDRtjkGKAtFMN0WQBuAd5Un2
	URHbNCXvaibuYR3ljveU+8Auhvs/2eP6kuKxfZJkb7nOR9+CyibjHYLthu1t
X-Google-Smtp-Source: AGHT+IGxS6uh+JQoGWkBPyukxW298Heuv7I/az6hbKmLIgpnr9OEVZK4HfZPr9LeeVezsiJXsdhuWQ==
X-Received: by 2002:a17:906:abc1:b0:a47:533f:2d0f with SMTP id kq1-20020a170906abc100b00a47533f2d0fmr9358482ejb.66.1712146730184;
        Wed, 03 Apr 2024 05:18:50 -0700 (PDT)
Message-ID: <2b03174eb033dfaacdff2cc76a281575d2922d2f.camel@gmail.com>
Subject: Xen 4.19 release status tracking list [ April ]
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Wed, 03 Apr 2024 14:18:48 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hello everyone,

I would like to share with you a list for status tracking based on Xen
ML and community members comments:

*** Arm ***:
  * [PATCH v7 00/14] Arm cache coloring [
https://patchew.org/Xen/20240315105902.160047-1-carlo.nonato@minervasys.tec=
h/
]:
    - new patch series version [v7] was sent

  * [PATCH v13 00/14] PCI devices passthrough on Arm, part 3 [
https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hildebra=
nd@amd.com/
]
 =20
  * [PATCH v3 0/4] DOMCTL-based guest magic region allocation for 11
domUs [
https://patchew.org/Xen/20240403081626.375313-1-xin.wang2@amd.com/ ]
 =20
  * [XEN v6 0/3] xen/arm: Add emulation of Debug Data Transfer
Registers [
https://patchew.org/Xen/20240307123943.1991755-1-ayan.kumar.halder@amd.com/
]


*** PPC ***:
  * [PATCH v3 0/9] Early Boot Allocation on Power [
https://patchew.org/Xen/cover.1710443965.git.sanastasio@raptorengineering.c=
om/
]:
    new patch series version [v3] was sent

*** RISC-V ***:
  * [PATCH v4 05/23]  Enable build of full Xen for RISC-V [
https://lore.kernel.org/xen-devel/cover.1708962629.git.oleksii.kurochko@gma=
il.com/
]:
    - one patch of the patch series was merged
    - new patch series version [v7] were sent


*** x86 ***:
  * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.c=
om/
]:=20
    - almost patch series have been merged already except the patch:
        [PATCH 4/4] iommu/x86: make unity range checking more strict

  * [PATCH 0/8] x86: support AVX10.1 [
https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@suse=
.com/
]
 =20
  * APX support?

  * [PATCH v4 0/8] x86emul: misc additions [
https://lore.kernel.org/xen-devel/9dd23064-c79e-4a50-9c71-c0e73b189944@suse=
.com/
]
   =20
  * [PATCH 0/7] VT-d: SATC handling and ATS tidying [
https://lore.kernel.org/xen-devel/25506838-b818-4686-8c16-3a198338af44@suse=
.com/
]

  * [XEN PATCH 0/9] x86: parallelize AP bring-up during boot [
https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb=
.com/
]

  * [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus
fallout [
https://lore.kernel.org/xen-devel/8f56a8f4-0482-932f-96a9-c791bebb4610@suse=
.com/
]
    - 6/12 are merged.
 =20
  * [PATCH v6 0/4] x86/pvh: Support relocating dom0 kernel [
https://patchew.org/Xen/20240327215102.136001-1-jason.andryuk@amd.com/
]
 =20
  * x86/spec-ctrl: IBPB improvements [
https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/
]


*** common ***:
  * annotate entry points with type and size" series:
    The bulk of this has gone in, but there'll want to be follow-ups.

  * [PATCH v2 (resend) 00/27] Remove the directmap [
https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazon.co=
m/
]
    - 7/27 were merged.
=20
  * [PATCH] move __read_mostly to xen/cache.h [
https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse=
.com/
]

  * [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() [
https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340dc84.=
1706259490.git.federico.serafini@bugseng.com/
]

  * MISRA rules updates:
   - [PATCH v2] docs/misra/rules.rst update [
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2402131431070.1925432=
@ubuntu-linux-20-04-desktop/T/#maded3df1bebe68d0fe53c73e89f996ec395a39e5
]: 1/3 were merged.

   - [XEN PATCH v3 0/7] address violations of MISRA C Rule 20.7[
https://patchew.org/Xen/cover.1711700095.git.nicola.vetrini@bugseng.com/
]: new patch series version (v3) were sent.

   - [XEN PATCH v3 00/16] xen: address violation of MISRA C:2012
Directive 4.10 [
https://patchew.org/Xen/cover.1710145041.git.simone.ballarin@bugseng.com/
]: 2/16 were merged.

  * [PATCH v6 00/8] xen/spinlock: make recursive spinlocks a dedicated
type [ https://patchew.org/Xen/20240327152229.25847-1-jgross@suse.com/
]:
    - new patch series version were sent
   =20
  * [PATCH 0/7] GRUB: Supporting Secure Boot of xen.gz [
https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/
]:
   =20
  * [PATCH v5 0/7] MSI-X support with qemu in stubdomain, and other
related changes:
=20
  * [PATCH 0/7] xen/bitops: Reduce the mess, starting with ffs() [
https://patchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.com/
]:
 =20
  * [PATCH 0/7] xen/trace: Treewide API cleanup [
https://patchew.org/Xen/20240318163552.3808695-1-andrew.cooper3@citrix.com/
]:
 =20
  * [PATCH v2 0/6] xenwatchdogd bugfixes and enhancements

  * [RFC XEN PATCH v6 0/5] Support device passthrough when dom0 is PVH
on Xen [
https://patchew.org/Xen/20240328063402.354496-1-Jiqian.Chen@amd.com/ ]


*** Completed ***:
  *** Arm ***:
     * xen/arm64: Rework the MMU-off code (idmap) so it is self-
contained

  *** x86 ***:
     * tools: enable xenstore-stubdom to use 9pfs

  *** common ***:
     * NUMA: no need for asm/numa.h when !NUMA
     * xen: move BUG_ON(), WARN_ON(), ASSERT(), ASSERT_UNREACHABLE() to
xen/bug.h
     * xen/lib: introduce generic find next bit operations
     * Introduce generic headers=20
     * xen/livepatch: fixes for the pre-apply / post-revert hooks
     * limit passing around of cpu_user_regs

Please reply with items you would like to see in 4.19 so that people
know what is happening and prioritize accordingly.
You're welcome to provide a description and use cases of the feature
you're working on.

Have a nice week!

Best regards,
 Oleksii

