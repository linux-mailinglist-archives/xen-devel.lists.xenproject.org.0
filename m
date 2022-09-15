Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543CE5B9C82
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407393.649902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpRj-00056X-Jo; Thu, 15 Sep 2022 14:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407393.649902; Thu, 15 Sep 2022 14:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpRj-00054G-Gh; Thu, 15 Sep 2022 14:02:27 +0000
Received: by outflank-mailman (input) for mailman id 407393;
 Thu, 15 Sep 2022 14:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hFM=ZS=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1oYpRh-00054A-HJ
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:02:25 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0336e94c-34ff-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 16:02:21 +0200 (CEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 07:02:12 -0700
Received: from tlengyel-mobl3.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.176.180])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 07:02:11 -0700
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
X-Inumbo-ID: 0336e94c-34ff-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663250542; x=1694786542;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nm8d2LCDVjaNR+AJEi3DoLWSkOMQhFvCTPiTWL4iOaU=;
  b=mhJOYPgXKLNASBATZypDeG4Vw2L7sVtbQHbWY8DM6K2pXz9Bn62CabrB
   oSyp07pubq2o/jLpzg4Vcb9PTdwWIf2wuNMPSm5R1/SWCBV26C+9A7Unx
   dvYxDy+rGDaZLeX6cBkxuVwhsv3JVP6pAOxWcfX9uyqRzX37/ZIcbo6U1
   0SNMwV7zqi7jf/yA8p2yqESocPb9JTuSmX6S8HzfSM6jfLqCQe+TW6LvA
   /2EYHRhc/g9kVcTUtPp+EiEdehGsSYRu/S06zu9dcwtkEtZ7DP07H18tG
   Dw/++cl3xl+Px7ooSiuXboHVDCrBjZOS76HN+zK8G4ZnY70p+5BSmBCh2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="324981275"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="324981275"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="685735205"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vpmu: fix race-condition in vpmu_load
Date: Thu, 15 Sep 2022 10:01:59 -0400
Message-Id: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While experimenting with the vPMU subsystem an ASSERT failure was
observed in vmx_find_msr because the vcpu_runnable state was true.

The root cause of the bug appears to be the fact that the vPMU subsystem
doesn't save its state on context_switch. The vpmu_load function will attempt
to gather the PMU state if its still loaded two different ways:
    1. if the current pcpu is not where the vcpu ran before doing a remote save
    2. if the current pcpu had another vcpu active before doing a local save

However, in case the prev vcpu is being rescheduled on another pcpu its state
has already changed and vcpu_runnable is returning true, thus #2 will trip the
ASSERT. The only way to avoid this race condition is to make sure the
prev vcpu is paused while being checked and its context saved. Once the prev
vcpu is resumed and does #1 it will find its state already saved.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/cpu/vpmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index cacc24a30f..076c2e5a8d 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
         vpmu = vcpu_vpmu(prev);
 
         /* Someone ran here before us */
+        vcpu_pause(prev);
         vpmu_save_force(prev);
         vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
+        vcpu_unpause(prev);
 
         vpmu = vcpu_vpmu(v);
     }
-- 
2.34.1


