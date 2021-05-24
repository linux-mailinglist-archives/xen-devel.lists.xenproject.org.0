Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8338F47C
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131878.246274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKd-0001ye-5h; Mon, 24 May 2021 20:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131878.246274; Mon, 24 May 2021 20:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKd-0001vX-1y; Mon, 24 May 2021 20:37:47 +0000
Received: by outflank-mailman (input) for mailman id 131878;
 Mon, 24 May 2021 20:37:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHKb-0001ey-RT
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:37:45 +0000
Received: from mail-qt1-x82f.google.com (unknown [2607:f8b0:4864:20::82f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff609dc3-16ff-4f17-a461-4436cc8d12bc;
 Mon, 24 May 2021 20:37:40 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id m13so21561299qtk.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:40 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:40 -0700 (PDT)
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
X-Inumbo-ID: ff609dc3-16ff-4f17-a461-4436cc8d12bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=CIwXzDWTaek3ruD8eh2yS/rqRAAsDRXtMIQbC1kOPa4=;
        b=uv44pKs+RQk5sBayWXiXgIjbhPRtNWOqguwJDtAFR1bs9T4nPpWlzNvZPj2xjT7UN5
         /A8RxqOKZ0sY3PK2K8DkaQJhz6bnbbr8/n2/Yd1Oe25+mGCQYOQvlvYJaQVblmKK6AxE
         T48iEUUddTzwnEpMAz8IN7H5ocOML1wG2QC1dQHcuuv0g35qlQ7TdmHXh54+aKP/GEMw
         SNolx0pyM55oubpZoQXCL82g00/iol0Bjbu5I3O4QVyBgSJHWBTGmi8GHUobnai/1pOP
         QQnDgaP5LdBfcNWCnF6/hgrp2PuAZHrWQuqvujovTFyLhzuJc/XxBsEAe4X9iWGbc9pf
         nCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=CIwXzDWTaek3ruD8eh2yS/rqRAAsDRXtMIQbC1kOPa4=;
        b=BVASBTUnUIKb31fjocPNh2f5Bp4TGgZBEfpAGi8pAEOc58Az6a68GHg5dVgZU9fep8
         DebRc1pbBdYnNLWUkbDykX2TlcqrsfEbVMGQM2SAhqzgZe0iFW2pZER6NFD7iwhMQcBB
         Xi+ZUdpny24cnFvWcIre3K/xS8lgoO667Q4RP307+V01hJDm36sMltggYWYGYCzhn4jo
         jk3imrtXtHgUzPYPTNTmSImP2Hq8WfJCVaVOyo7knbpIipRn+HBpwEJvyHHRuPDj8LVM
         X8uGBuTNrMrmPaHMGE7dwHGIGFc7K96Ebh9Ffs2x85whKy8tglsknFS8A8XpYD1QtdD4
         zbjA==
X-Gm-Message-State: AOAM533+Of3BrCKMHCiS1fRZGeybN92VILG3hSA0O9ogk0r4V4UGSiDR
	7LVU/MZdtIj7+rGBgxeaXnc=
X-Google-Smtp-Source: ABdhPJz88N55/dJlF3pa57aofg5JUU6h/isN9xjSgCfLuMY6ifvnffVmSKBe5Fv8qihdht66qEeyaQ==
X-Received: by 2002:ac8:505a:: with SMTP id h26mr29001740qtm.252.1621888660522;
        Mon, 24 May 2021 13:37:40 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 01/12] golang/xenlight: update generated code
Date: Mon, 24 May 2021 16:36:42 -0400
Message-Id: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

Re-generate code to reflect changes to libxl_types.idl from the
following commits:

0570d7f276 x86/msr: introduce an option for compatible MSR behavior selection
7e5cffcd1e viridian: allow vCPU hotplug for Windows VMs
9835246710 viridian: remove implicit limit of 64 VPs per partition

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/helpers.gen.go | 6 ++++++
 tools/golang/xenlight/types.gen.go   | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 4c60d27a9c..b454b12d52 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1113,6 +1113,9 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
+if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
+return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
+}
 x.Altp2M = Altp2MMode(xc.altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 
@@ -1589,6 +1592,9 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
+if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
+return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
+}
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index cb13002fdb..f2ceceb61c 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -211,6 +211,8 @@ ViridianEnlightenmentSynic ViridianEnlightenment = 7
 ViridianEnlightenmentStimer ViridianEnlightenment = 8
 ViridianEnlightenmentHcallIpi ViridianEnlightenment = 9
 ViridianEnlightenmentExProcessorMasks ViridianEnlightenment = 10
+ViridianEnlightenmentNoVpLimit ViridianEnlightenment = 11
+ViridianEnlightenmentCpuHotplug ViridianEnlightenment = 12
 )
 
 type Hdtype int
@@ -513,6 +515,9 @@ ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
 }
+ArchX86 struct {
+MsrRelaxed Defbool
+}
 Altp2M Altp2MMode
 VmtraceBufKb int
 }
-- 
2.17.1


