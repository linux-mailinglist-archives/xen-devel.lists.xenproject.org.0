Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F03836E26D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119615.226185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKL-00074r-JZ; Thu, 29 Apr 2021 00:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119615.226185; Thu, 29 Apr 2021 00:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKL-00074D-G7; Thu, 29 Apr 2021 00:14:45 +0000
Received: by outflank-mailman (input) for mailman id 119615;
 Thu, 29 Apr 2021 00:14:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKJ-00072A-Tc
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:14:43 +0000
Received: from mail-qt1-x82b.google.com (unknown [2607:f8b0:4864:20::82b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b171eda-13ee-459c-a382-a7efd0e3d097;
 Thu, 29 Apr 2021 00:14:39 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id j19so7738082qtx.13
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:39 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:38 -0700 (PDT)
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
X-Inumbo-ID: 1b171eda-13ee-459c-a382-a7efd0e3d097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CIwXzDWTaek3ruD8eh2yS/rqRAAsDRXtMIQbC1kOPa4=;
        b=f4V0FpJy9dRR1osaw30MbdWHpAUh9x90l7i8MllowCfeAGnUpma9AH3jZ8bTYzatum
         c7Dq6lKdNNqZPysBSV7COSk/TwuvsYfQ+BxFgh4EkzTtl5ukyN1xjO2amvCMfd76HdPZ
         5YML492by4O2ov+4fI5kux8KA8ldGwd0WIKD+73iUtj8S+Gmy3lJkXGbxNilpziBGAGI
         teUpGyA4MI8phADiH05UjHQ7Q4JqZdeiZEbah/vxIf5O+//57sDqmIK8GiyJs3eZvFOJ
         wtDqHs4EapiS0T2u7J3nGMpr2Hih/GuNM1QQmGdWPrdbypJLRJJJpnoMX6es13s3URs9
         559g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CIwXzDWTaek3ruD8eh2yS/rqRAAsDRXtMIQbC1kOPa4=;
        b=Jij7OVThzqNPxk1KIjAMZmNFIJYUDXHPK7SUYgcF/E8Y1VPleNgSsu3Z8pH821yPqx
         dvr0aj+y7nNX0UonNTMNQs339GqC2MO5dTopYx2qiMZA4SZa5+fX66b9bwkPWrCnc6F4
         3UuOhGwVJEP2sUvC48Xwx/jsOdR+ZiymRn9CBarG873VXLdtUeNX5Y+FHqao/mrWpdOQ
         LxHvhHZPK8F6b2CXrA9ToXgb8UD/mxyF6h+Y9v93L3BZyi1ASzse7HkstSIz2Fpgqo/j
         G73mH241acD+eEupc4ixI9lWLBcJFfUkGoMmlSmbdrBQwTT9E/7SK4E7N31zLfCXdwK2
         DjHA==
X-Gm-Message-State: AOAM530BWuZvO8VYw6MaTs3/foXzSldufWuju/Ej3GlxHTMejxpY/QvU
	t64OY7NNNVnOAcVSzYVqO0S+aHDUsRc=
X-Google-Smtp-Source: ABdhPJx5ujgeg0d2gbXMFIdGB8a53HLirR//KrIoxV+Z+RbA2Qo/1ZTg9ErpjBQj8PdPoOQsS9nFWA==
X-Received: by 2002:ac8:5286:: with SMTP id s6mr29135170qtn.71.1619655278457;
        Wed, 28 Apr 2021 17:14:38 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 01/12] golang/xenlight: update generated code
Date: Wed, 28 Apr 2021 20:14:23 -0400
Message-Id: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>

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


