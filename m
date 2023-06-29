Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274F7423F6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556768.869523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEorK-00070e-IW; Thu, 29 Jun 2023 10:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556768.869523; Thu, 29 Jun 2023 10:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEorK-0006yQ-Fq; Thu, 29 Jun 2023 10:26:42 +0000
Received: by outflank-mailman (input) for mailman id 556768;
 Thu, 29 Jun 2023 10:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPCb=CR=citrix.com=prvs=53747fb4b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qEorJ-0006yD-5h
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:26:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d1f6171-1667-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 12:26:38 +0200 (CEST)
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
X-Inumbo-ID: 6d1f6171-1667-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688034397;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hWO24kZNM8OyTmbgatuxO2U8/usIdwhTY/CkiAkjcYU=;
  b=Wcnb0iMBScdZ1XSExiMTvpEUXzzJvVjuN6UGcnyYAudGN8zl5tePX3Os
   eSaVPqsZMsD/bdKYTZHXNM97zUInJnyvnpb4TWZqOpIsan+gIqpa6ik2U
   75Rw+XM5QAd1vIjC07i/3SJFRZ9daeKowcpQCaovPmAuruZW2tXmGD6fQ
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113899458
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Pp6hMqIgo6rhg6fnFE+R0ZUlxSXFcZb7ZxGr2PjKsXjdYENShDUDn
 GIWWjuHO/aLYDf1et10PIm3804CucTdmoVmSAplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4AZvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5vX2sRq
 NkHawkKY0zS3+Wu7q/lRfRj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJ4FzxfE+
 zKuE2LRBDYYLceZ2x++9nuMvMbTtD/XaI5NPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9NTEIOnIhUkg85NS/8dk0ljzSENl+H/vg5jHqIg0c0
 wxmvQBn2eVM3JFQifrrlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM93gVJtykvKxTYmNuhXogjxmOMMZmOivpnkGWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dFJdgpQcyNnVPgbaaV/L4a+H+avI0l5Y9e5/F/rU9U590iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:g4gufKy6UDWMHyAe6Ed5KrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AwHVsAmlhRtiVMNwiHc058gH1xnTXOWWDxiiNBlD?=
 =?us-ascii?q?7MGFkFOzNTke+5f1rjsU7zg=3D=3D?=
X-Talos-MUID: 9a23:ndlXCwQfdHXyh7eARXTqozN7L8F6xp+qAWA3uIkvp+W0OXNZbmI=
X-IronPort-AV: E=Sophos;i="6.01,168,1684814400"; 
   d="scan'208";a="113899458"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/sysctl: Correct comments after renaming xen_sysctl_cpu_policy fields
Date: Thu, 29 Jun 2023 11:26:00 +0100
Message-ID: <20230629102600.61262-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes: 21e3ef57e040 ("x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/public/sysctl.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9d06e92d0f6a..045f8617b81f 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1047,12 +1047,12 @@ struct xen_sysctl_cpu_policy {
 #define XEN_SYSCTL_cpu_policy_pv_default   4
 #define XEN_SYSCTL_cpu_policy_hvm_default  5
     uint32_t index;       /* IN: Which policy to query? */
-    uint32_t nr_leaves;   /* IN/OUT: Number of leaves in/written to
-                           * 'cpuid_policy', or the maximum number of leaves
-                           * if the guest handle is NULL. */
-    uint32_t nr_msrs;     /* IN/OUT: Number of MSRs in/written to
-                           * 'msr_policy', or the maximum number of MSRs if
-                           * the guest handle is NULL. */
+    uint32_t nr_leaves;   /* IN/OUT: Number of leaves in/written to 'leaves',
+                           * or the maximum number of leaves if the guest
+                           * handle is NULL. */
+    uint32_t nr_msrs;     /* IN/OUT: Number of MSRs in/written to 'msrs', or
+                           * the maximum number of MSRs if the guest handle is
+                           * NULL. */
     uint32_t _rsvd;       /* Must be zero. */
     XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) leaves; /* OUT */
     XEN_GUEST_HANDLE_64(xen_msr_entry_t)  msrs;   /* OUT */
-- 
2.30.2


