Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A72FF79A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72475.130516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hsb-0000iQ-2h; Thu, 21 Jan 2021 21:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72475.130516; Thu, 21 Jan 2021 21:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hsa-0000hz-VN; Thu, 21 Jan 2021 21:52:36 +0000
Received: by outflank-mailman (input) for mailman id 72475;
 Thu, 21 Jan 2021 21:52:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hsZ-0000hu-9L
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:52:35 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c8481c-d379-4e99-bb30-9231fc32ec76;
 Thu, 21 Jan 2021 21:52:34 +0000 (UTC)
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
X-Inumbo-ID: 90c8481c-d379-4e99-bb30-9231fc32ec76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611265954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zH10SOrS7TRCmlRhWyG1y7Y9O10ncjn3XWV3SJVhL6Y=;
  b=gga2V/WHyJ063ht6vuo3T+EliWp00GLnNHYHpphtKa2O2DYoMCCJI/3m
   xQ11VnurqXaZzHooEIEbQUP4AN3UprucBMyi/1adNbxyncjQ/YR3l2fP6
   oj4WZNF065Txt/Kkiz9XJkpzKXUaG2JytecZPmTh7WXebRNJ3+65rY6ug
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Z5eoCsesdA5J0UFxtp/KuY8s6qAAYZrfcrxD/3PJKeCdae9f9Q5cx4sOQDRyplc9S/5Rx5tyNk
 FcXLVipkwbPT7CMTgSM7YnTEz8EzkaY1cZoO5MsHF7PFOnlQ8HlCdWS83L6sgAmAZTwLFAWkZE
 zqt7oOHH5k07/khV9Yjt/n4Ag9jVytHirgZbsK9cfKgKMQ6TS9SJOWkM1fBJ58NGM30SP+P24n
 PvRG7euZrF08Z5XvVF4hSMRkKYc/fV/XK+l6G3s6dH5tkYvW5/8uAZ2f7CvRGWG4Y2wOOQ+/bf
 Vqo=
X-SBRS: 5.1
X-MesageID: 36915711
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="36915711"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 10/10] x86/vm_event: Carry Processor Trace buffer offset in vm_event
Date: Thu, 21 Jan 2021 21:27:18 +0000
Message-ID: <20210121212718.2441-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Tamas K Lengyel <tamas.lengyel@intel.com>

Add pt_offset field to x86 regs in vm_event. Initialized to ~0 if PT
is not in use.

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

v7:
 * New
---
 xen/arch/x86/vm_event.c       | 3 +++
 xen/include/public/vm_event.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 848d69c1b0..09dfc0924e 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -251,6 +251,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
 
     req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
     req->data.regs.x86.dr6 = ctxt.dr6;
+
+    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.pt_offset) != 1 )
+        req->data.regs.x86.pt_offset = ~0;
 #endif
 }
 
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 141ea024a3..57f34bf902 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -223,6 +223,12 @@ struct vm_event_regs_x86 {
      */
     uint64_t npt_base;
 
+    /*
+     * Current offset in the Processor Trace buffer. For Intel Processor Trace
+     * this is MSR_RTIT_OUTPUT_MASK. Set to ~0 if no Processor Trace is active.
+     */
+    uint64_t pt_offset;
+
     uint32_t cs_base;
     uint32_t ss_base;
     uint32_t ds_base;
-- 
2.11.0


