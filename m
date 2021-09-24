Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6876417FBF
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 06:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195622.348663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTzR0-0004CO-VM; Sat, 25 Sep 2021 04:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195622.348663; Sat, 25 Sep 2021 04:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTzR0-0004AZ-Rx; Sat, 25 Sep 2021 04:37:10 +0000
Received: by outflank-mailman (input) for mailman id 195622;
 Fri, 24 Sep 2021 19:40:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MekI=OO=gmail.com=this.is.a0lson@srs-us1.protection.inumbo.net>)
 id 1mTr3Y-0003IB-Vf
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 19:40:25 +0000
Received: from mail-qv1-xf32.google.com (unknown [2607:f8b0:4864:20::f32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f4ebd2d-6a11-4205-aac2-f93601508c98;
 Fri, 24 Sep 2021 19:40:24 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id jo30so6980984qvb.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Sep 2021 12:40:24 -0700 (PDT)
Received: from localhost.localdomain ([24.214.236.228])
 by smtp.gmail.com with ESMTPSA id s10sm6957971qko.134.2021.09.24.12.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 12:40:23 -0700 (PDT)
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
X-Inumbo-ID: 2f4ebd2d-6a11-4205-aac2-f93601508c98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ChVaZv1jb3kHb49X6DQZKb1FYMKbVWrD9eIvacxmHqU=;
        b=Z76KdCIRM/kNv5rQJjuvfa8w+r/kjnJqsBl6lNhJqpgNKEllB2PMLCVtnf9Xg3d9yQ
         aY9qvJa0yXvKh2xE5WEjYDnmcz6ualhNczi4RMgSbmuvi1/NB6zjIWt/sGl7a6NCNqNq
         zJGZ3wWpgthqLTNlX2hRps+2646HXz+8sP9nYj3EjPiF7dLz0A0W8Ap9Pj8m9ETxExP4
         Ewc7WTwL5bTq+EAychBWf/OEaH5zSCew82hcqmbW2YRsJD8rlgbgV6SSK4+iCtopjN4T
         9ZZP/PyBRMPQ5+45PG20C99jXQpWjNVpfpVLypL5c5buSHWYnHuDlR0ca8EO7ftQkEPi
         Q9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ChVaZv1jb3kHb49X6DQZKb1FYMKbVWrD9eIvacxmHqU=;
        b=3raujs5zfblQF8nBRjALEzfTF8hsSgLbXn0e30qjVIT20u+XEcXdKoBODfBrGFcUas
         2EbPRdYpNN2wueliH5fdHNOSDUIiZ9554g5e1kHU87Y2VlV5vgQ4DRTLpV+F1Me3neqz
         Y8SqNArexHBz6CxbinChdK0W4UT+ghFqGsH6PJWHSnCxgZ8JeX9gwK7nQ+JdAuCLpSpe
         SxvgMdBfMqEVaiJ5J3m/EoYts9rsxzITSMM1PUKcDfFhwolc5Q6zvJbC6v9CYEgjcb0p
         N8zcnUsUItqlQ/YRBcnRvJ7IRzZBNc49O1ijZ76ktLuWV8c+yDySBLoNdE2yXwRhBGFJ
         Dq0g==
X-Gm-Message-State: AOAM530GwpKgJz4EmOuLAIEU83PQhE1ciig0Ih3z24tYjtPdJ+l6VyMK
	4pc/k6jRiRbldLMN6EjV7uJukhUin4Uv1Q==
X-Google-Smtp-Source: ABdhPJyz/2eLETM/dg1zwLYUM7sH88/cKFfkgBOAD9IXz8HIxSWRicPrSyibPbN72DecR+WVZpqeNQ==
X-Received: by 2002:a0c:b3c9:: with SMTP id b9mr11688934qvf.40.1632512423894;
        Fri, 24 Sep 2021 12:40:23 -0700 (PDT)
From: Alex Olson <this.is.a0lson@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Alex Olson <this.is.a0lson@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/1] x86: centralize default APIC id definition
Date: Fri, 24 Sep 2021 14:39:54 -0500
Message-Id: <cover.1632512149.git.this.is.a0lson@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am interested in making the x86 topology seen by guests more flexible.
This patch keeps the original functionality but allows the APIC identifier
seen by guests for each vCPU to be altered more easily in future revisions.

Since the same mapping of vcpu_id to vlapic id is currently preserved,
the existing adjustments for 'logical processors per package' are left unchanged.

Alex Olson (1):
  x86: centralize default APIC id definition

 tools/firmware/hvmloader/Makefile      |  2 +-
 tools/firmware/hvmloader/config.h      |  1 -
 tools/firmware/hvmloader/hvmloader.c   |  3 +-
 tools/firmware/hvmloader/mp_tables.c   |  3 +-
 tools/firmware/hvmloader/smp.c         |  3 +-
 tools/firmware/hvmloader/topology.c    | 54 ++++++++++++++++++++++++++
 tools/firmware/hvmloader/topology.h    | 33 ++++++++++++++++
 tools/firmware/hvmloader/util.c        |  6 ++-
 tools/include/xenctrl.h                |  6 +++
 tools/libacpi/build.c                  |  4 +-
 tools/libacpi/libacpi.h                |  3 +-
 tools/libs/ctrl/xc_domain.c            | 27 +++++++++++++
 tools/libs/light/libxl_x86_acpi.c      |  9 ++++-
 xen/arch/x86/cpuid.c                   | 14 +++++--
 xen/arch/x86/hvm/hvm.c                 | 36 ++++++++++++++++-
 xen/arch/x86/hvm/vlapic.c              | 18 ++++++---
 xen/include/asm-x86/hvm/vlapic.h       |  4 +-
 xen/include/public/arch-x86/hvm/save.h |  1 +
 xen/include/public/hvm/hvm_op.h        | 17 ++++++++
 19 files changed, 222 insertions(+), 22 deletions(-)
 create mode 100644 tools/firmware/hvmloader/topology.c
 create mode 100644 tools/firmware/hvmloader/topology.h

-- 
2.25.1


