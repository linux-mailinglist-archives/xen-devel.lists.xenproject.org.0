Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC18BB148
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 18:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716599.1118736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2wBK-0000nS-MM; Fri, 03 May 2024 16:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716599.1118736; Fri, 03 May 2024 16:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2wBK-0000lS-Je; Fri, 03 May 2024 16:54:46 +0000
Received: by outflank-mailman (input) for mailman id 716599;
 Fri, 03 May 2024 16:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrlW=MG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s2wBI-0000lM-NB
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 16:54:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d70b7299-096d-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 18:54:43 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a59a17fcc6bso9027766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 09:54:43 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 oz19-20020a170906cd1300b00a599165a96esm859398ejb.23.2024.05.03.09.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 09:54:42 -0700 (PDT)
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
X-Inumbo-ID: d70b7299-096d-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714755283; x=1715360083; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qniKA5uv84tUxFNOf3yqEYy7oL/o+0y9C1S9PMYnU6A=;
        b=SV493vGrdbcgW30zOiAIVNIjwf4SriGxIu6KYGBuihjkXtHb8I1ui0CUvKSn+FpYmk
         79fNzJQbrUA6VYLfYy1Wdqb7YWc/IeIQISnujBRJsBVz7MrP+L2Z9vD87xj9Ni/SbQlX
         GSwuz+6YGsvaU779xXg8J0XqngQaObFUmjNPncw2eBG00AwuESYpcKwi60659pToVLNZ
         JPQiBSayEpWs52gQ3r6xmDURKfzsDaWNtbSyQblkDIg9KX58GfK1IRLk7jc6hyM0g8Eg
         TsMTo+I4Q7CjyKkmt289+qoAGPINWrqdnt3yv8FKuzb5iIBGgSwLDQFnI+OQCiIBN4o5
         QyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714755283; x=1715360083;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qniKA5uv84tUxFNOf3yqEYy7oL/o+0y9C1S9PMYnU6A=;
        b=KtARv5ryYTCYl4N2aPPBOD7mwly/Ly2oXwyBHdjmXOAQ79NTciWobP3zeGl6jtyZuy
         MWY+0mwiDZkLyWX8guJrdnoqBTd8Zw0XCK93vkqJRHc/Y5N3RR/qeTGkvRGjNVFwEGBh
         JPnkUb8XTme9WOZqPotDzjkScl0qBfnG2Km4nCpkVnzoJme6O6kBDzGtxB/X215AAdkn
         JptCAyuR8uX3FH0aREJNEuznXVdODoQOEVgURIPZg0vFOeIQf+10+RHRz7XhRGeZW8KA
         W6Vp2PtD2siuZaIXOchWn/XDfw5eXPz+HhYtO09gnyXIItSbAYKZMKfw4yQBQ0H/K2Fh
         4c5g==
X-Gm-Message-State: AOJu0YzXL2Q1ndy+cetoxUdwahio8i5X0IlijpemQ2XU4JUySIGaKqGR
	Y9ZNiC8qVr3hZ39rPPlfk/5SdlwdtXj5zdChZyitib7YnqNXy9yUaPxLpw==
X-Google-Smtp-Source: AGHT+IF0vYB5VeZvt3MCe9FqwZ2rLEyEWO3Vkk0i49AX4QzY/2wFIecq0iAL1B1Ndq2YbPDB/KUs+g==
X-Received: by 2002:a17:906:3ad3:b0:a58:f186:8af with SMTP id z19-20020a1709063ad300b00a58f18608afmr2150467ejd.60.1714755282493;
        Fri, 03 May 2024 09:54:42 -0700 (PDT)
Message-ID: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>
Subject: Xen 4.19 release status tracking list [ May ]
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: :, committers@xenproject.org, community.manager@xenproject.org, Kelly
 Choi <kelly.choi@cloud.com>
Date: Fri, 03 May 2024 18:54:40 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

Hello everyone,

I would like to share with you a list for status tracking based on Xen
ML and community members comments:

*** Arm ***:
  * Arm cache coloring [
https://lore.kernel.org/xen-devel/20240502165533.319988-1-carlo.nonato@mine=
rvasys.tech/
]:
    - new patch series version [v8] was sent

  * PCI devices passthrough on Arm, part 3 [
https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hildebra=
nd@amd.com/
]
=20
  * DOMCTL-based guest magic region allocation for 11
domUs [
https://lore.kernel.org/xen-devel/20240409045357.236802-1-xin.wang2@amd.com=
/
]
     - new patch series verstion [v4] was sent
=20
  * [XEN v6 0/3] xen/arm: Add emulation of Debug Data Transfer
Registers [
https://patchew.org/Xen/20240307123943.1991755-1-ayan.kumar.halder@amd.com/
]

*** PPC ***:
  * [PATCH v4 0/6] Early Boot Allocation on Power [
https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptoreng=
ineering.com/
]:
    new patch series version [v4] was sent

*** RISC-V ***:
  * [PATCH v8 00/17] Enable build of full Xen for RISC-V
https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko@gma=
il.com/
]:
    - several patches were merged
    - new patch series version [v8] were sent


*** x86 ***:
  * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.c=
om/
]:
    - almost patch series have been merged already except the patch:
        [PATCH 4/4] iommu/x86: make unity range checking more strict

  * [PATCH 0/8] x86: support AVX10.1 [
https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@suse=
.com/
]:
    - two patches of patch series are waitng to merged/reviewed:
      [PATCH 1/4] amd-vi: fix IVMD memory type checks
      [PATCH 4/4] iommu/x86: make unity range checking more strict=20
 =20
  * APX support?

  * [PATCH v4 0/8] x86emul: misc additions [
https://lore.kernel.org/xen-devel/9dd23064-c79e-4a50-9c71-c0e73b189944@suse=
.com/
]
  =20
  * [PATCH v2 00/12] VT-d: SATC handling; ATS: tidying[
https://lore.kernel.org/xen-devel/64b028be-2197-4951-ae5b-32f9eabfa84a@suse=
.com/
]:
    new version was sent [ v2 ]

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
]: 2/3 were merged.

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
    - only one patch required to be merged:
    =20
https://patchew.org/Xen/20240327152229.25847-1-jgross@suse.com/202403271522=
29.25847-9-jgross@suse.com/
  =20
  * [PATCH 0/7] GRUB: Supporting Secure Boot of xen.gz [
https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/
]:
  =20
  * [PATCH v6 0/7] MSI-X support with qemu in stubdomain, and other
related changes:
    - new patch version was sent
=20
  * [PATCH 0/7] xen/bitops: Reduce the mess, starting with ffs() [
https://patchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.com/
]:
=20
  * [PATCH 0/7] xen/trace: Treewide API cleanup [
https://patchew.org/Xen/20240318163552.3808695-1-andrew.cooper3@citrix.com/
]:
    patches were merged to staging:
     - [PATCH 3/7] xen/rt: Clean up trace handling
     - [PATCH 4/7] xen/sched: Clean up trace handling
=20
  * [PATCH v3 0/4] xenwatchdogd bugfixes and enhancements [
https://lore.kernel.org/xen-devel/20240411182023.56309-1-leigh@solinno.co.u=
k/
]:
    new patch series were sent.

  * [RFC XEN PATCH v7 0/5] Support device passthrough when dom0 is PVH
on Xen [
https://patchew.org/Xen/20240419035340.608833-1-Jiqian.Chen@amd.com/ ]:
    - new patch series were sent [v7].


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
     * Introduce generic headers
     * xen/livepatch: fixes for the pre-apply / post-revert hooks
     * limit passing around of cpu_user_regs

Please reply with items you would like to see in 4.19 so that people
know what is happening and prioritize accordingly.
You're welcome to provide a description and use cases of the feature
you're working on.

Have a nice week!

Best regards,
 Oleksii

