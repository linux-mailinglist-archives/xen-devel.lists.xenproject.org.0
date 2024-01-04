Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD94824702
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 18:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661866.1031605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLRIo-0004i9-Tx; Thu, 04 Jan 2024 17:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661866.1031605; Thu, 04 Jan 2024 17:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLRIo-0004fP-R2; Thu, 04 Jan 2024 17:14:42 +0000
Received: by outflank-mailman (input) for mailman id 661866;
 Thu, 04 Jan 2024 17:14:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zyaM=IO=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1rLRIn-0004fJ-68
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 17:14:41 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bca6a095-ab24-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 18:14:38 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 09:13:18 -0800
Received: from prasann2-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.20.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 09:13:17 -0800
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
X-Inumbo-ID: bca6a095-ab24-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704388478; x=1735924478;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T0bQcWJseRf0WGgp4VcVxsN/kO6X4OpiBTQalTQ5bcY=;
  b=ZIOfcyhkgn9Nhxoud+qnDs8gFbESTI7CwWgbjfAzXEtu0EdSUzJD/EH5
   F+fFjLtKSZ1mtRUpfcIJLTn4a4w7/PAlUwoCjzDPWDan8Jxn/y/GaahUZ
   s2LEgXo2GPwIbosleub3+5kJ8Z5FudvWnESkZtEECxICpbPwTQz/NloQv
   9Y0FJDEEd8VG+F9m9FzA9NGqNfn5U2m3K90Nb8cZ59OhVU7WMgA/2D2t9
   55WmaAIthyUW8k3AUq7G3XXrwAs7LpaxzSVgCz75abmBw0w2f7v6KkGgM
   hz3YJgDgLUF7F8v5I6vA/uJPHdDY0xVcxtKvMt0ywZNYbzZoYeUjJt65I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="463698812"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="463698812"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="809300059"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="809300059"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mwait-idle: fix ubsan warning
Date: Thu,  4 Jan 2024 12:13:07 -0500
Message-Id: <f0ac3890b5e2e1e98bfd3fe5fffcf3c3c031e12c.1704388276.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix warning:
(XEN) UBSAN: Undefined behaviour in arch/x86/cpu/mwait-idle.c:1300:44
(XEN) left shift of 15 by 28 places cannot be represented in type 'int'

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Fixes: 5a211704e88 ("mwait-idle: prevent SKL-H boot failure when C8+C9+C10 enabled")
---
 xen/arch/x86/include/asm/mwait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/mwait.h b/xen/arch/x86/include/asm/mwait.h
index f377d9f..9298f98 100644
--- a/xen/arch/x86/include/asm/mwait.h
+++ b/xen/arch/x86/include/asm/mwait.h
@@ -4,7 +4,7 @@
 #include <xen/types.h>
 
 #define MWAIT_SUBSTATE_MASK		0xf
-#define MWAIT_CSTATE_MASK		0xf
+#define MWAIT_CSTATE_MASK		0xfU
 #define MWAIT_SUBSTATE_SIZE		4
 
 #define CPUID_MWAIT_LEAF		5
-- 
2.34.1


