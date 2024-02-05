Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93784A3A0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 20:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676481.1052622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX4Zh-0000Pd-Eb; Mon, 05 Feb 2024 19:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676481.1052622; Mon, 05 Feb 2024 19:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX4Zh-0000Mz-Bm; Mon, 05 Feb 2024 19:24:13 +0000
Received: by outflank-mailman (input) for mailman id 676481;
 Mon, 05 Feb 2024 19:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX4Zf-0000Mt-3b
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 19:24:11 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 216a6e30-c45c-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 20:24:07 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51025cafb51so7199209e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 11:24:07 -0800 (PST)
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
X-Inumbo-ID: 216a6e30-c45c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707161046; x=1707765846; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cwJBPcNJmmrerSUs52ZYrXNaXNd9wYCH1lR6Sjnrv0Q=;
        b=IvKojqNxHOxHpbTb5FbbdO9uErxhczthKhd5xSI6CsTgkL51A/a6pznnQei1Y7nLH5
         j9ST7y7FvcYuRclhaaLA/IgjZmJwh4CuL1lgLD5vuFitR6QI0X8pLle8AALKwo8TtJXq
         hkZ90iOXP2JnX6fB+G1oi1R8Z7st6MNKCEHAhSVJV4I1GedYwUD+sgi46sxa0wEQFD0H
         PyegYo1L383rpDOE/6vO0haE3YbNT3RR2tGjh6PI3d0ANL6v0nwZAoH5hK/nqH9DTnIj
         wsOx52q7ktWfoCZ0aZfQ3VOfgsBwuB2gHvH3gHzRpSRJWyDnEl9DFlz+uBCMAOoEKF47
         8EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707161046; x=1707765846;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwJBPcNJmmrerSUs52ZYrXNaXNd9wYCH1lR6Sjnrv0Q=;
        b=NyLXxkM1mrRlQnN1VhJjiGEOMIB9YzxQOlR1bu/+iLJqCzqEX06L3OPlmXUycmk8dI
         i2NiZL5MIYqyJ1BEVifCbdrYkhoYWBotkJTqbxtbJk00L5mG1KxPo0zaWl+Z8qm/+pxf
         2NYa20fyzs4Ggs8OSdQMOoOiKGbmjxsnh2/SVRhPvlcEuCPro2cPmC3xuuaz7BnAgAG3
         IhFk4o8cdOtwtzcDNIYnaFJ952/0bMfliAkyCxh+XLZk0t3BYRPkuV5uFo1andcn/4cn
         OKb5ucnVn86c54CdrEP4nlW/J6uOwFuljN27iRpnFfG17+Ndc/GH2ue+FWCQKLJUjaBy
         l6CA==
X-Gm-Message-State: AOJu0YyjsPfzKE6UbB6iQDbyU63UaUU9+604Pr4xz3U/rddbkiRfsxmX
	gppxX0Tkf/kc271bXXIMMbaAeKDi/UCy2GyJKN21cFKEQPrl0TTBAtBEJTWdvbGzUdddPRwVBE1
	31OvmmJ/xx3udMFuLNmzGzwbC0WOQp3Bnb34=
X-Google-Smtp-Source: AGHT+IHdBHHkk5HS55p2dNgPu7P+oVVVa9HqzAuMQX6DSnLjFQ5Hh6vx04QiUHFyZKy+Dv+YlMRnfLMAMkCVm+JKpUA=
X-Received: by 2002:ac2:530a:0:b0:511:5936:c874 with SMTP id
 c10-20020ac2530a000000b005115936c874mr266319lfh.6.1707161046149; Mon, 05 Feb
 2024 11:24:06 -0800 (PST)
MIME-Version: 1.0
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date: Mon, 5 Feb 2024 20:23:30 +0100
Message-ID: <CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
Subject: Xen 4.19 release status tracking list
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: committers@xenproject.org, community.manager@xenproject.org, 
	Kelly Choi <kelly.choi@cloud.com>
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I would like to share with you a list for status tracking based on Xen ML:

Arm:
  * [PATCH v5 00/13] Arm cache coloring [
https://lore.kernel.org/xen-devel/20240102095138.17933-1-carlo.nonato@minervasys.tech/
]
  * [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code (idmap)
so it is self-contained [
https://lore.kernel.org/xen-devel/20240116143709.86584-1-julien@xen.org/
]
  * [PATCH v13 00/14] PCI devices passthrough on Arm, part 3 [
https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hildebrand@amd.com/
]

PPC:
  *  [PATCH v2 0/7] Early Boot Allocation on Power [
https://lore.kernel.org/xen-devel/cover.1702607884.git.sanastasio@raptorengineering.com/
]

RISC-V:
  *  [PATCH v4 00/30]  Enable build of full Xen for RISC-V [
https://lore.kernel.org/xen-devel/cover.1707146506.git.oleksii.kurochko@gmail.com/
]

x86:
  * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/
]
  * [PATCH 0/8] x86: support AVX10.1 [
https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com/
]
  * [PATCH v13 00/35] x86: enable FRED for x86-64 [
https://lore.kernel.org/xen-devel/20231205105030.8698-1-xin3.li@intel.com/
]
  * [PATCH v4 0/8] x86emul: misc additions
https://lore.kernel.org/xen-devel/9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com/
  * [PATCH 0/7] VT-d: SATC handling and ATS tidying [
https://lore.kernel.org/xen-devel/25506838-b818-4686-8c16-3a198338af44@suse.com/
]
  * [XEN PATCH 0/9] x86: parallelize AP bring-up during boot [
https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
]
  * [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus
fallout [ https://lore.kernel.org/xen-devel/8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com/
]

common:
  * annotate entry points with type and size" series [
https://lore.kernel.org/xen-devel/5e74a501-2824-42af-804b-47b515aa9bcf@suse.com/
]
  * [PATCH v2 0/8] limit passing around of cpu_user_regs [
https://lore.kernel.org/xen-devel/33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com/
]
  * [PATCH v2 (resend) 00/27] Remove the directmap [
https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazon.com/
]
  * [PATCH v4 00/32] tools: enable xenstore-stubdom to use 9pfs [
https://lore.kernel.org/xen-devel/20240205105001.24171-1-jgross@suse.com/
]
  * [PATCH v7 0/7] Introduce generic headers [
https://lore.kernel.org/xen-devel/cover.1706281994.git.oleksii.kurochko@gmail.com/
]
  * [PATCH] move __read_mostly to xen/cache.h
[https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/]
  * [PATCH v2] NUMA: no need for asm/numa.h when !NUMA [
https://lore.kernel.org/xen-devel/94cffa48-5e31-4557-827d-c6dec6031d05@suse.com/
]
  * [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() [
https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com/
]
  * [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
ASSERT_UNREACHABLE() to xen/bug.h [
https://lore.kernel.org/xen-devel/4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com/
]
  * [PATCH] xen/lib: introduce generic find next bit operations [
https://lore.kernel.org/xen-devel/52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com/
]

Please reply with items you would like to see in 4.19 so that people
know what is happening and prioritize accordingly.
You're welcome to provide a description and use cases of the feature
you're working on.

Have a nice week!

Best regards,
 Oleksii

