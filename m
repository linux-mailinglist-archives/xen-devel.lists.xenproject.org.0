Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F178CF380B
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 13:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195363.1513310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjdc-0006OZ-Uf; Mon, 05 Jan 2026 12:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195363.1513310; Mon, 05 Jan 2026 12:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjdc-0006N8-RY; Mon, 05 Jan 2026 12:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1195363;
 Mon, 05 Jan 2026 12:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GBWX=7K=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vcjdb-0006Mx-Bq
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 12:24:43 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81e240b4-ea31-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 13:24:40 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so6485566f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 04:24:40 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa08efsm100989410f8f.29.2026.01.05.04.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 04:24:38 -0800 (PST)
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
X-Inumbo-ID: 81e240b4-ea31-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767615879; x=1768220679; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dF/48okZMvDl5o4Ue3bSiWkxn9CbY3LNREFlu8eqb0o=;
        b=aeIsjYp/ZbujhHMA35HWOUq+xmNZ67tbGcxp7Jt5CDok0MtrrVr1yvx+HdsQK++BoN
         3MiCKDQbbjypNZIcZv7OMnLIt3t6jVfaBe7cC6mQuIkXZSIWcE7Bu2H3Ho2RrfesKbVZ
         hwUsiZrBREgSg7sQtNtxtglveWHXd5fnBYkGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615879; x=1768220679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF/48okZMvDl5o4Ue3bSiWkxn9CbY3LNREFlu8eqb0o=;
        b=QGTRCSF4Pvhu1reBFA1szPTBF4gkGseJ0F3m4iqDG49HCslMsM8apeHum2xus0KXta
         Jkf4C2RziKSCtTZ7egHLBwN98HZquu0bKwdAya2teRa/yPoVrR9AjchznPOPJABKAVDA
         GNgvuJ7bau+xXqW12Sl4BxhqIp40PZzGaof2l+g0vwWY0UBBEH8y/Zloj2atrtDWcCo2
         nSHBJhNmL3+KBApw66NhRw/+AyRCHNpEEag1G4gcEhR0zrdbz50w+fIEX6R3duHB22ae
         EwK00aZX9ezFmtP4uf+DTVgcRc95hNIrjso/lTCnqNFKTsNaCnuN+ZlyoAvDltd9G8J9
         LeIw==
X-Gm-Message-State: AOJu0YwicxlHNECapzdgKNfXN6P7Cq8oTk+ROT1f5Ds+i4uyeMq3GC1g
	nlo7MtGtS6BE/zJ6Eg3lWxyCa/6JgavqwU41rV30tGMihRhIVr5vSsKI6elHCkWI1OjqrUQQrUe
	1kLLh
X-Gm-Gg: AY/fxX5NGSXUB22Bcx5ACSLj/3cZaiiMAceZGISU589aK7y+jKOr9KpgmYgQ4+PgVon
	i+KAle/Dd090gQiHFQA7Xlr2mUUELUpSpMVci9f7p1c2pDn2duSd5O8q35JPTGjwTBlEFTLMGJ4
	fHDLNe8EsC/buXT9osCH9SYxcYfS18ITl9v2u0+OcQkyLiuUE+cLD+OGC+NAYK623R9bHcdgB9D
	LqpsBHv0O3CKurjPG6rhJ3U5+GEBvz8c6LfNUXvrjabSn1KaWJx9m1MqZBhHI24LvII4DRMLcPQ
	Gn44E+8vBDfwWTDJKFxATxrJ0/QJv1iN1q8I0lMZKAmfPsbhkHwkd6XbdNC7N32clT/WUsMoh6q
	/bF4wo/qPeuEno4LCSp3VGAxOrnGlD8Fm0F/rpf45Rwn/83Do4ykVUxtiWDAs1Cr2c5K295nGwQ
	qzCnZiuFVe8WsVT2UVAy3b815RH31Yfy6OVzsOUM+SeM1K2LEaG0sriPLXts+6kA==
X-Google-Smtp-Source: AGHT+IFIqdxg7o4PK24Anp1jrtIbVfLvpHwzqAbxxmfwYf5T8jcxdhj16al95MKHB34tw35sLdqxAQ==
X-Received: by 2002:a05:6000:2909:b0:42b:55a1:214c with SMTP id ffacd0b85a97d-4324e709a9dmr53182310f8f.55.1767615879346;
        Mon, 05 Jan 2026 04:24:39 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] CI: Extend eclair-*-allcode to enable as much as possible
Date: Mon,  5 Jan 2026 12:24:36 +0000
Message-Id: <20260105122436.555444-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On x86, this is basically everything.

For ARM, CONFIG_MPU and CONFIG_MMU are mutually exclusive (with
CONFIG_STATIC_MEMORY in the mix), as well as CONFIG_NEW_VGIC being mutually
exclusive with the other VGIC infrastructure.

No functional change, but a lot of new Eclair reports (non-blocking).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2245142422

Maintaining these lists is going to be a nightmare.  I think we really do need
to implement CONFIG_COMPILE_TEST
---
 automation/gitlab-ci/analyze.yaml | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index a472692fcb31..7a2c0bfa77d1 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -44,6 +44,24 @@ eclair-x86_64-allcode:
     LOGFILE: "eclair-x86_64.log"
     VARIANT: "X86_64"
     RULESET: "monitored"
+    EXTRA_XEN_CONFIG: |
+      CONFIG_ARGO=y
+      CONFIG_DEBUG_LOCK_PROFILE=y
+      CONFIG_DEBUG_TRACE=y
+      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
+      CONFIG_EXPERT=y
+      CONFIG_HYPERV_GUEST=y
+      CONFIG_LATE_HWDOM=y
+      CONFIG_MEM_PAGING=y
+      CONFIG_MEM_SHARING=y
+      CONFIG_PERF_ARRAYS=y
+      CONFIG_PERF_COUNTERS=y
+      CONFIG_PV32=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_XENOPROF=y
+      CONFIG_XEN_GUEST=y
+      CONFIG_XHCI=y
+      CONFIG_XSM=y
   allow_failure: true
 
 eclair-x86_64-testing:
@@ -104,6 +122,33 @@ eclair-ARM64-allcode:
     LOGFILE: "eclair-ARM64.log"
     VARIANT: "ARM64"
     RULESET: "monitored"
+    EXTRA_XEN_CONFIG: |
+      CONFIG_ACPI=y
+      CONFIG_ARGO=y
+      CONFIG_ARM64_SVE=y
+      CONFIG_ARM_SMMU_V3=y
+      CONFIG_BOOT_TIME_CPUPOOLS=y
+      CONFIG_DEBUG_LOCK_PROFILE=y
+      CONFIG_DEBUG_TRACE=y
+      CONFIG_DEVICE_TREE_DEBUG=y
+      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
+      CONFIG_EXPERT=y
+      CONFIG_FFA=y
+      CONFIG_FFA_VM_TO_VM=y
+      CONFIG_GICV3_ESPI=y
+      CONFIG_HAS_ITS=y
+      CONFIG_IOREQ_SERVER=y
+      CONFIG_IPMMU_VMSA=y
+      CONFIG_LIVEPATCH=y
+      CONFIG_LLC_COLORING=y
+      CONFIG_OPTEE=y
+      CONFIG_OVERLAY_DTB=y
+      CONFIG_PCI_PASSTHROUGH=y
+      CONFIG_PERF_ARRAYS=y
+      CONFIG_PERF_COUNTERS=y
+      CONFIG_STACK_PROTECTOR=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_VM_EVENT=y
   allow_failure: true
 
 eclair-ARM64-testing:
-- 
2.39.5


