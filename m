Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780886E70D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 18:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687763.1071548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg6Zu-0004dT-At; Fri, 01 Mar 2024 17:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687763.1071548; Fri, 01 Mar 2024 17:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg6Zu-0004ax-7U; Fri, 01 Mar 2024 17:21:46 +0000
Received: by outflank-mailman (input) for mailman id 687763;
 Fri, 01 Mar 2024 17:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfCR=KH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rg6Zt-0004ar-G2
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 17:21:45 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c7d45e1-d7f0-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 18:21:43 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512f892500cso1865724e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 09:21:43 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a056512349000b0051330fe6604sm294477lfr.51.2024.03.01.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 09:21:41 -0800 (PST)
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
X-Inumbo-ID: 2c7d45e1-d7f0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709313702; x=1709918502; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wn8a3OeiJELe0XVOp6Fr9h++++WquncjbVpxs2mnou8=;
        b=C+bYQB2MjQ1s2aqNQiZyG10gXb3WoX8x+9MdKzDimsO6JaunPCt95F6Ikfiruy4ORD
         Z/VL6V1Gm7djEa+2VEPtK/HO9lFQoLg45OfT5qLLVkq52M7UKNJEP9D1ODlDrPniBAe9
         vzU7iJTSVG+3nYDNDEXx7hB4eu+KsDd8DcbhXiVHxGkqukjcEN7aS7wjiTHpRPIUhcok
         oWYTfCNLZwcOeTwUv/IWtvwdMbRriBZeOUCZ4KYYQoAWisqbKM+HAiJ15D9f4kbxVosW
         geznKZBq2D3K3ZAmw42f8lhoB37o+301y+Ce+c9v6+PzQ38+BpGOx0vODoBM9YLK2fiR
         yOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709313702; x=1709918502;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wn8a3OeiJELe0XVOp6Fr9h++++WquncjbVpxs2mnou8=;
        b=rsF8RqmdI7yPiXlUT6A5cA1hRgVs/lM6R+OMU93xgAUkgfitOc3md39lxe5CO71Eaw
         rn+sGOoE3IUh3+rJOIsTQi+dqvoCYLDiQBUouwf6TSuh6ly+DO993ho+3b58C50/ORvi
         1mn7J6AYJwurGk27DJgP2CzNT7hFY3+e04HYt8ttaMQ24HIXrGaL0wOVno0+Z3XeRrPr
         KEmTdgz+90MyB/qY0c33x37hAMSdvxN1LYW7H4IionamoNbbMJWGTJPkhFGRg1N/wF6o
         eP7eLRkIkJUugLqUnZjsRNIaug3CiRJ4Xfeie3FGH2FPmbEPuQ9X0zxiQO7ZtiR/psBa
         okqA==
X-Gm-Message-State: AOJu0Yw58VvMb3OiHRghZyn2PGGLZpTwgqbfhcOZ8ECsy5jFrxR89Yxu
	N5/kLFJryLLhvYuNN2t1y6cci/t9tjJR7rZbB5sIv1Y/hrEYfLfvfvBE/77N
X-Google-Smtp-Source: AGHT+IE0bNBAG6kNbs0JSkj/7ReuZ/4n73Xsa9qZSerYXDv7I+w+tQz9N3bv5igDv2ECCFiLp+Blkg==
X-Received: by 2002:a05:6512:39d0:b0:513:177f:ef57 with SMTP id k16-20020a05651239d000b00513177fef57mr2119764lfu.10.1709313701822;
        Fri, 01 Mar 2024 09:21:41 -0800 (PST)
Message-ID: <91cc3f76029357f34bd5ca21966c42f0acb73720.camel@gmail.com>
Subject: Xen 4.19 release status tracking list [ March ]
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Fri, 01 Mar 2024 18:21:40 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hello everyone,

I would like to share with you a list for status tracking based on Xen
ML and community members comments:

Arm:
  * [PATCH v6 00/15] Arm cache coloring [
https://lore.kernel.org/xen-devel/20240129171811.21382-1-carlo.nonato@miner=
vasys.tech/
]:
    new patch series version [v6] was sent

  * [PATCH v13 00/14] PCI devices passthrough on Arm, part 3 [
https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hildebra=
nd@amd.com/
]

PPC:
  * [PATCH v2 0/7] Early Boot Allocation on Power [
https://lore.kernel.org/xen-devel/cover.1702607884.git.sanastasio@raptoreng=
ineering.com/
]

RISC-V:
  * [PATCH v4 05/23]  Enable build of full Xen for RISC-V [
https://lore.kernel.org/xen-devel/cover.1708962629.git.oleksii.kurochko@gma=
il.com/
]:
    a bulk of patch have been merged already and a new version was sent
to ML

x86:
  * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.c=
om/
]:=20
    * almost patch series have been merged already except the patch:
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
]:
    * [PATCH v4 3/8] VMX: tertiary execution control infrastructure -
was merged
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
    * [PATCH v2 01/12] x86: introduce ioremap_wc() - were merged

common:
  * annotate entry points with type and size" series:
    The bulk of this has gone in, but there'll want to be follow-ups.

  * limit passing around of cpu_user_regs [
https://lore.kernel.org/xen-devel/ebc330a9-eafa-4858-b5cf-5694c4da911d@suse=
.com/
]:
    new patch series version was sent.

  * [PATCH v2 (resend) 00/27] Remove the directmap [
https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazon.co=
m/
]

  * [PATCH v9 0/7] Introduce generic headers [
https://lore.kernel.org/all/cover.1708086091.git.oleksii.kurochko@gmail.com=
/
]:
    Almost fully patch series were merged except several patches:
       * [PATCH v9 1/7] automation: introduce fixed randconfig for
RISC-V
       * [PATCH v9 2/7] xen/asm-generic: introduce stub header
monitor.h
       * [PATCH v9 6/7] xen/ppc: switch PPC to use asm-generic/device.h
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
    [PATCH v2] docs/misra/rules.rst update [
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2402131431070.1925432=
@ubuntu-linux-20-04-desktop/T/#maded3df1bebe68d0fe53c73e89f996ec395a39e5
]

  * [XEN PATCH 00/10] address some violations of MISRA C Rule 20.7 [
https://lore.kernel.org/xen-devel/cover.1709219010.git.nicola.vetrini@bugse=
ng.com/T/#t
]
   =20
  * [PATCH v4 00/12] xen/spinlock: make recursive spinlocks a dedicated
type [
https://lore.kernel.org/xen-devel/20231212094725.22184-1-jgross@suse.com/T/=
#t
]

  * [PATCH v2 0/5] xen/livepatch: fixes for the pre-apply / post-revert
hooks [
https://lore.kernel.org/xen-devel/20240227112528.4540-1-roger.pau@citrix.co=
m/T/#m620c827bd097522d9d87b7f6511bc1599f6a8c84
]

Completed:
  Arm:
      * [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code
(idmap) so it is self-contained [
https://lore.kernel.org/xen-devel/20240116143709.86584-1-julien@xen.org/
]
 =20
  x86:
      * [PATCH v9 0/6] tools: enable xenstore-stubdom to use 9pfs [
https://lore.kernel.org/xen-devel/20240229124830.13680-1-jgross@suse.com/
]=20

  common:
      * [PATCH v2] NUMA: no need for asm/numa.h when !NUMA [
https://lore.kernel.org/xen-devel/94cffa48-5e31-4557-827d-c6dec6031d05@suse=
.com/
]
      * [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
ASSERT_UNREACHABLE() to xen/bug.h [
https://lore.kernel.org/xen-devel/4887b2d91a4bf2e8b4b66f03964259651981403b.=
1706897023.git.oleksii.kurochko@gmail.com/
]
      * [PATCH] xen/lib: introduce generic find next bit operations [
https://lore.kernel.org/xen-devel/52730e6314210ba4164a9934a720c4fda201447b.=
1706266854.git.oleksii.kurochko@gmail.com/
]

Please reply with items you would like to see in 4.19 so that people
know what is happening and prioritize accordingly.
You're welcome to provide a description and use cases of the feature
you're working on.

Have a nice week!

Best regards,
 Oleksii

