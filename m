Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6F93091A3
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 04:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78687.143307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqT-0004gm-KV; Sat, 30 Jan 2021 03:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78687.143307; Sat, 30 Jan 2021 03:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqT-0004g9-F3; Sat, 30 Jan 2021 03:22:45 +0000
Received: by outflank-mailman (input) for mailman id 78687;
 Sat, 30 Jan 2021 03:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gqR-0004Zu-I1
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 03:22:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4074e347-0968-4fec-b047-e7c27fdda9a6;
 Sat, 30 Jan 2021 03:22:38 +0000 (UTC)
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
X-Inumbo-ID: 4074e347-0968-4fec-b047-e7c27fdda9a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611976958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E8vioGfpWLYISSx0UoqTMfyzq7qbKLhm5mGBEhNOnQY=;
  b=IxSMYydTc25OXETdP3X/2pUaterhIDg6OpMDGJ/iTZAkBZrDRdXPV+9C
   rC/k9t/eXB7Xd7+563HJMxPs8V7EQw4eIJ5FQAcS+VEpHcCQY5At2+Iz9
   iFF6Rs6CiuFp8NDjtC+KL2oRHqA2//IgyLoxSXlRTz6HXV7i46qUH5gWO
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PQWvHuibPIMbIUc/1f4YgtdPPtDnlCszu5V2qxJQTASeQsKpYA7z8HTnhXplFL+9eSKkATx/yz
 FSg1PqQFjs4zUABKPswkCWrOsKrN7Q+L7l7zbktMWbI+e9+/Vn36jA3VKArYAZ6WexEJR0gxYo
 7zL7wcUCU0Oyw6eJIcejfzmgHpEHJuYLIQRKTjZFXFPSef4ua91e4XdjvYmbgBtRIUZh6/6+lJ
 ElBRSpz55NDG+qfy0gvJd8fNPu1RgI7HgYHsTqPWo0VguuKNffh5v1Im83c4inuV+xxyXLlomz
 fXo=
X-SBRS: 5.1
X-MesageID: 36195587
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="36195587"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v8 16/16] x86/vm_event: Carry the vmtrace buffer position in vm_event
Date: Sat, 30 Jan 2021 02:58:52 +0000
Message-ID: <20210130025852.12430-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Tamas K Lengyel <tamas.lengyel@intel.com>

Add vmtrace_pos field to x86 regs in vm_event. Initialized to ~0 if
vmtrace is not in use.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v8:
 * Use 'vmtrace' consistently.

v7:
 * New
---
 xen/arch/x86/vm_event.c       | 3 +++
 xen/include/public/vm_event.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 848d69c1b0..36272e9316 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -251,6 +251,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
 
     req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
     req->data.regs.x86.dr6 = ctxt.dr6;
+
+    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
+        req->data.regs.x86.vmtrace_pos = ~0;
 #endif
 }
 
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 141ea024a3..147dc3ea73 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -223,6 +223,13 @@ struct vm_event_regs_x86 {
      */
     uint64_t npt_base;
 
+    /*
+     * Current position in the vmtrace buffer, or ~0 if vmtrace is not active.
+     *
+     * For Intel Processor Trace, it is the upper half of MSR_RTIT_OUTPUT_MASK.
+     */
+    uint64_t vmtrace_pos;
+
     uint32_t cs_base;
     uint32_t ss_base;
     uint32_t ds_base;
-- 
2.11.0


