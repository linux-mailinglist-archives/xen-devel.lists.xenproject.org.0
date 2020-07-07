Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6306D21780D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:40:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSK-0007d9-V1; Tue, 07 Jul 2020 19:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSJ-0007at-8A
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:40:39 +0000
X-Inumbo-ID: b7ba091c-c089-11ea-8de3-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7ba091c-c089-11ea-8de3-12813bfff9fa;
 Tue, 07 Jul 2020 19:40:32 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EEF6DA265A;
 Tue,  7 Jul 2020 21:40:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E020EA268B;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PinkwRJevqWr; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 66F75A2657;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hshjaMDDlq4C; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 35734A261F;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 12F762245C;
 Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rQdVHyLH4fzM; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 70EEE2241B;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Quarantine-ID: <2pmxzWWtxK_F>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2pmxzWWtxK_F; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 45657222A3;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 02/11] x86/vmx: add Intel PT MSR definitions
Date: Tue,  7 Jul 2020 21:39:41 +0200
Message-Id: <ba3de1d4cd926b16a297d90055a03fda0762c2b5.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
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
Cc: luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Jan Beulich <jbeulich@suse.com>, tamas.lengyel@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Define constants related to Intel Processor Trace features.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/include/asm-x86/msr-index.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 0fe98af923..4fd54fb5c9 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -72,7 +72,31 @@
 #define MSR_RTIT_OUTPUT_BASE                0x00000560
 #define MSR_RTIT_OUTPUT_MASK                0x00000561
 #define MSR_RTIT_CTL                        0x00000570
+#define  RTIT_CTL_TRACE_EN                  (_AC(1, ULL) <<  0)
+#define  RTIT_CTL_CYC_EN                    (_AC(1, ULL) <<  1)
+#define  RTIT_CTL_OS                        (_AC(1, ULL) <<  2)
+#define  RTIT_CTL_USR                       (_AC(1, ULL) <<  3)
+#define  RTIT_CTL_PWR_EVT_EN                (_AC(1, ULL) <<  4)
+#define  RTIT_CTL_FUP_ON_PTW                (_AC(1, ULL) <<  5)
+#define  RTIT_CTL_FABRIC_EN                 (_AC(1, ULL) <<  6)
+#define  RTIT_CTL_CR3_FILTER                (_AC(1, ULL) <<  7)
+#define  RTIT_CTL_TOPA                      (_AC(1, ULL) <<  8)
+#define  RTIT_CTL_MTC_EN                    (_AC(1, ULL) <<  9)
+#define  RTIT_CTL_TSC_EN                    (_AC(1, ULL) << 10)
+#define  RTIT_CTL_DIS_RETC                  (_AC(1, ULL) << 11)
+#define  RTIT_CTL_PTW_EN                    (_AC(1, ULL) << 12)
+#define  RTIT_CTL_BRANCH_EN                 (_AC(1, ULL) << 13)
+#define  RTIT_CTL_MTC_FREQ                  (_AC(0xf, ULL) << 14)
+#define  RTIT_CTL_CYC_THRESH                (_AC(0xf, ULL) << 19)
+#define  RTIT_CTL_PSB_FREQ                  (_AC(0xf, ULL) << 24)
+#define  RTIT_CTL_ADDR(n)                   (_AC(0xf, ULL) << (32 + 4 * (n)))
 #define MSR_RTIT_STATUS                     0x00000571
+#define  RTIT_STATUS_FILTER_EN              (_AC(1, ULL) <<  0)
+#define  RTIT_STATUS_CONTEXT_EN             (_AC(1, ULL) <<  1)
+#define  RTIT_STATUS_TRIGGER_EN             (_AC(1, ULL) <<  2)
+#define  RTIT_STATUS_ERROR                  (_AC(1, ULL) <<  4)
+#define  RTIT_STATUS_STOPPED                (_AC(1, ULL) <<  5)
+#define  RTIT_STATUS_BYTECNT                (_AC(0x1ffff, ULL) << 32)
 #define MSR_RTIT_CR3_MATCH                  0x00000572
 #define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
 #define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
-- 
2.17.1


