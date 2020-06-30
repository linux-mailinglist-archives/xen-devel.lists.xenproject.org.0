Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3E20F4B8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFTo-0007qf-3l; Tue, 30 Jun 2020 12:35:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFTm-0007qV-M6
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:14 +0000
X-Inumbo-ID: 24b551fa-bace-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24b551fa-bace-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 12:35:13 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B3983A37EC;
 Tue, 30 Jun 2020 14:35:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A61BEA37EA;
 Tue, 30 Jun 2020 14:35:11 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1_3k26MCDEPO; Tue, 30 Jun 2020 14:35:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2BD43A37E8;
 Tue, 30 Jun 2020 14:35:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8H_NizuV-mB5; Tue, 30 Jun 2020 14:35:11 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EF7E4A37E6;
 Tue, 30 Jun 2020 14:35:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E02E82262F;
 Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GU5N094yJdgX; Tue, 30 Jun 2020 14:34:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 65ED522617;
 Tue, 30 Jun 2020 14:34:35 +0200 (CEST)
X-Quarantine-ID: <J5WRtkotLrCM>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id J5WRtkotLrCM; Tue, 30 Jun 2020 14:34:35 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 3BEEC22613;
 Tue, 30 Jun 2020 14:34:35 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 01/10] x86/vmx: add Intel PT MSR definitions
Date: Tue, 30 Jun 2020 14:33:44 +0200
Message-Id: <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Jan Beulich <jbeulich@suse.com>, luwei.kang@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Define constants related to Intel Processor Trace features.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/include/asm-x86/msr-index.h | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index b328a47ed8..0203029be9 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -69,6 +69,43 @@
 #define MSR_MCU_OPT_CTRL                    0x00000123
 #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
 
+/* Intel PT MSRs */
+#define MSR_RTIT_OUTPUT_BASE                0x00000560
+
+#define MSR_RTIT_OUTPUT_MASK                0x00000561
+
+#define MSR_RTIT_CTL                        0x00000570
+#define  RTIT_CTL_TRACEEN                    (_AC(1, ULL) <<  0)
+#define  RTIT_CTL_CYCEN                      (_AC(1, ULL) <<  1)
+#define  RTIT_CTL_OS                         (_AC(1, ULL) <<  2)
+#define  RTIT_CTL_USR                        (_AC(1, ULL) <<  3)
+#define  RTIT_CTL_PWR_EVT_EN                 (_AC(1, ULL) <<  4)
+#define  RTIT_CTL_FUP_ON_PTW                 (_AC(1, ULL) <<  5)
+#define  RTIT_CTL_FABRIC_EN                  (_AC(1, ULL) <<  6)
+#define  RTIT_CTL_CR3_FILTER                 (_AC(1, ULL) <<  7)
+#define  RTIT_CTL_TOPA                       (_AC(1, ULL) <<  8)
+#define  RTIT_CTL_MTC_EN                     (_AC(1, ULL) <<  9)
+#define  RTIT_CTL_TSC_EN                     (_AC(1, ULL) <<  10)
+#define  RTIT_CTL_DIS_RETC                   (_AC(1, ULL) <<  11)
+#define  RTIT_CTL_PTW_EN                     (_AC(1, ULL) <<  12)
+#define  RTIT_CTL_BRANCH_EN                  (_AC(1, ULL) <<  13)
+#define  RTIT_CTL_MTC_FREQ                   (_AC(0x0F, ULL) <<  14)
+#define  RTIT_CTL_CYC_THRESH                 (_AC(0x0F, ULL) <<  19)
+#define  RTIT_CTL_PSB_FREQ                   (_AC(0x0F, ULL) <<  24)
+#define  RTIT_CTL_ADDR(n)                    (_AC(0x0F, ULL) <<  (32 + (4 * (n))))
+
+#define MSR_RTIT_STATUS                     0x00000571
+#define  RTIT_STATUS_FILTER_EN               (_AC(1, ULL) <<  0)
+#define  RTIT_STATUS_CONTEXT_EN              (_AC(1, ULL) <<  1)
+#define  RTIT_STATUS_TRIGGER_EN              (_AC(1, ULL) <<  2)
+#define  RTIT_STATUS_ERROR                   (_AC(1, ULL) <<  4)
+#define  RTIT_STATUS_STOPPED                 (_AC(1, ULL) <<  5)
+#define  RTIT_STATUS_BYTECNT                 (_AC(0x1FFFF, ULL) <<  32)
+
+#define MSR_RTIT_CR3_MATCH                  0x00000572
+#define MSR_RTIT_ADDR_A(n)                  (0x00000580 + (n) * 2)
+#define MSR_RTIT_ADDR_B(n)                  (0x00000581 + (n) * 2)
+
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
-- 
2.20.1


