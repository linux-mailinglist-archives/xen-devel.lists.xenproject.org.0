Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D8577C5B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369272.600597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1k-0004yE-EC; Mon, 18 Jul 2022 07:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369272.600597; Mon, 18 Jul 2022 07:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1k-0004uT-BB; Mon, 18 Jul 2022 07:18:48 +0000
Received: by outflank-mailman (input) for mailman id 369272;
 Mon, 18 Jul 2022 07:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDL1i-0004to-Vl
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:18:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daf19339-0669-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 09:18:45 +0200 (CEST)
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
X-Inumbo-ID: daf19339-0669-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658128725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F6JK8R4vklGJZNuhaf1bZprn0UinPkgJRlwtPk8D4E8=;
  b=HZK3hd3kiqWSIHd/x1jXWXR8ib2eGtSumJ/y/am1jHgNUn3jQnwoxrJV
   PiVyrphtfpQ4a1saxqDjdYAXNEtepVzCMeAfIhoI4HVIst5awZCN3UL+X
   hDnBmx4shia/Yo4UsiXSNt7r/9tSH8WkDhvYspbURR6cV+gXq4D9xJL5S
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76007331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Ae1brrKP0+ugpJ/zvrXNrnJYgzKimJRAgMBhAA?=
 =?us-ascii?q?5OJyBtyWkJYtZNa93r/TTRbcNWNAwAcmmIG0TFDXW4DK0JKoVnUygFF/X7yB?=
 =?us-ascii?q?ptrHy3eogHlySd64WL/45REHnRZwXvr0cO00x4icwyFQPofEgcEg2A9myiYE?=
 =?us-ascii?q?v9wJDbu2DlYKfYgvPGDMBIhVKJL48ReOvCXKqpniY5GLvlbxIQggiE59Xnbz?=
 =?us-ascii?q?Zi68uGBRy3+JDcSLhVh36GdRVC1ubN0aWN7JSUWeWN1V0phqE4k8tAatNnXP?=
 =?us-ascii?q?ck7dADaMfnpsO2IhMoGwUIXklH7v6FVIQVsPe3YflA2/L+ABkPjXNH1bo8mv?=
 =?us-ascii?q?pQEH5eAXkPLTEEqCK2N5HnFphwakPmhBHBSn+slivtfCFQG81Z5/ll82YUld?=
 =?us-ascii?q?xN/GbdiKQiE1aVCJMHx5Jkc2yBM1T9NgtjHVF93U8cvndjzBQdNiU8ADZNtF?=
 =?us-ascii?q?E0mrCzvbbyl0QJ/9z1iY/lY2zNr+e+vKHFq21Wy8Y/aExTk/Fk03u55Xb7/l?=
 =?us-ascii?q?p01yOrhe++d1rZAaqYxosbi+GZO8SMQfUfj4cWE3pX6tCtSnN+hdDJmwKPSQ?=
 =?us-ascii?q?WNNjyv3WowYP9eByCdtkVdnZffBSlWokb3JTU8KFyZ7cWVN5uWMHvE2TB/mV?=
 =?us-ascii?q?7dCC/lMbsVxFDgztceO+m1hk6WE8rover18RBGHyMun3r8akIqLlc8X0BxB8?=
 =?us-ascii?q?KPKzwSLKKLaZox7dCewjh7uWwRH4/OV8oXud/2q003eHU5jBC60S576otRN9?=
 =?us-ascii?q?KQ/aFfo2bdsWfc8HYwtdZKBSjchkB7lsg4ulVHbJ/TdbSeVOjkSjRnsjxZgq?=
 =?us-ascii?q?wdOh0ec0cm/7NGjQ6mdRKUmUecLzhQzzSLzNdkkKD9hsMZlqoqGQjZB4IjRo?=
 =?us-ascii?q?KJAssNvEGLycLdqJWW02YcG90fR+vLlhCNqcGPdGgDAsMQTRfKdCrCf7mw4R?=
 =?us-ascii?q?wGMkdw1MOac7qIq2GOKfQhbwCbQrV8xeKaZS8IGXL46B1r3gIW4ijgHHNHz/?=
 =?us-ascii?q?sGBpOI8fjcRWXw9TSRgN/ICgtkZcyoE3YWZo39Ea6GEFQD2OiW3910/aoTbM?=
 =?us-ascii?q?zJ6QIRUvYu0AWtCwhNDA4rn3KwonBqiP46DAW6C8DJR22pL+ZuMEESNCT58l?=
 =?us-ascii?q?e6QP8YUi8ernjKQuViv/mtFjGrybNJdmGwT0Ha7N0ZO32pybvYDm9Z+XixTA?=
 =?us-ascii?q?rysugTj0poqGbjUqPKZ0U2LYhIG1rmPDFTiEvq2x687Y4VMG0H7RUvFSjeZX?=
 =?us-ascii?q?56rg8rabFSvjIRedtpv+ImH31p57hqqp2cj4F00Xj0KaQCpIwkIFicH+8mgn?=
 =?us-ascii?q?1s4EVsp4IlwxwKN4qvPjx3oyfdTB/7Hb5VlaljhnPLILgw1Dk2zfnEODnK+n?=
 =?us-ascii?q?O4QOAC4hIBG5jIuFbKo/8ZoySQNrZWVLFtxMldfd80rJh14Wx7U1WdBv6TYo?=
 =?us-ascii?q?z0FHeJoTuuhvPr+izHegFPGk5F14bcaF9esGdxtCaFaHZ5bnY+PBXAYs6JNe?=
 =?us-ascii?q?v7x1TVmWRfm0Dzz8n1RLIwTDvohD1Kapz9JtRhDBbKEUmSFGDGV/QacltqJM?=
 =?us-ascii?q?Y15Fo4X4d+joQ3UfK9H2r2uzY0zN4k15XCegBgVza/UXEJAVDUKZIQrIY33v?=
 =?us-ascii?q?L7yrS1CY2D962FtyO2dx4JK3rNmYvyNzvO8TcOlT6T0k59Z+i75bhUJ22nQB?=
 =?us-ascii?q?ZJdTJLGCa7p5v3lYydZv895/k9Z9sm1y8f2BQT62NLFXxPTgn3lyl/zKh/qo?=
 =?us-ascii?q?nB546CCFVDSfOf7POkesdYW7JoYRAiL/TpX6052YL5WuP4pGkHKZGtTgzULq?=
 =?us-ascii?q?M7bW+pvYtmKR31NWyTiSvhi4LFh9n5LAtJ3IRwypxKfo99J/J7lh/0aTvtAL?=
 =?us-ascii?q?s6gfUde9hNuCIImQ1hroMfyxGvr+/H9CpgM9Hq1q12r1IAPp6WQxWwmA3YaB?=
 =?us-ascii?q?/Jy4WQ4Wt05qDYHzk/iuLHbwAAqgl3AsdQMvfmoxGzhuv9NXtC7v4r5axjTd?=
 =?us-ascii?q?92RR/meuYTlHeIda7xUsKX2aedzBaEYldB8RxCQrnfavPTHHb6DtZaHMft7O?=
 =?us-ascii?q?JCPzOX6ag5biexcO3FvUdXJzEGG3jVS50ekjgjUsGB7PyGJ5iHKxArTZTFEb?=
 =?us-ascii?q?MXcdhQIJKo4wliWOQgpRGnbMlOUiosvkXS70eQTKzIdGXE/JDyAxRskUVTVw?=
 =?us-ascii?q?hHRZnIYfwFbVZZlgT0BAolCfDaFiT7+P9wGOgZXS2+ELeDsQYHjGLKr8A1cE?=
 =?us-ascii?q?X8iWEbjjeseBC8MZidyaJdQHbs/iOH9mdEkImoumGZ/QEAqg2VxFoLAYv3UR?=
 =?us-ascii?q?FHrAcI64UkNnn3Df0ywgniN6sD0YL/hDiuBmEdOXs5opcKG4cjy+Exv7UVIL?=
 =?us-ascii?q?KvO218hY+LgAtJI7Gh1wugXAad2NS8kJQh2D4fl1YqykeZLwsoBzzwL4TyUy?=
 =?us-ascii?q?YnYvVpHY7q7xgWCG6qbKm001crSPd0Kop7xDQMTZwRzcqumEVY6eYQKtu8R6?=
 =?us-ascii?q?HELunW1qxXW4IiRKJ+6U5BIUmtJ9P+1hjfUyesROhwOL6COc5liJF0GFudPm?=
 =?us-ascii?q?IU0nkWdbSFsjlnf63+9LmQLdmEtn4D05fUOHgVUEC8ZXYMn/UHyP0lwFdZhV?=
 =?us-ascii?q?t8h/jpwdnXf6EFB9uZoBIAGBpTKbOTYxzBtxVkC8bF0zufqLP23uQYoaqaVT?=
 =?us-ascii?q?mFUgAHWUkdkPJd0vIFlObk5KSStdVqJvtvCC0SPIliCTn6tNuPIk/riYAsnp?=
 =?us-ascii?q?g1gUW2P+m2O6PiPWtyeW6tq?=
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76007331"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] xen/wait: Extend the description of how this logic actually works
Date: Mon, 18 Jul 2022 08:18:22 +0100
Message-ID: <20220718071825.22113-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718071825.22113-1-andrew.cooper3@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/wait.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index 3ebb884fe738..4dcfa17a8a3f 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -137,7 +137,19 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
             do_softirq();
     }
 
-    /* Hand-rolled setjmp(). */
+    /*
+     * Hand-rolled setjmp().
+     *
+     * __prepare_to_wait() is the leaf of a deep calltree.  Preserve the GPRs,
+     * bounds check what we want to stash in wqv->stack, copy the active stack
+     * (up to cpu_info) into wqv->stack, then return normally.  Our caller
+     * will shortly schedule() and discard the current context.
+     *
+     * The copy out is performed with a rep movsb.  When
+     * check_wakeup_from_wait() longjmp()'s back into us, %rsp is pre-adjusted
+     * to be suitable and %rsi/%rdi are swapped, so the rep movsb instead
+     * copies in from wqv->stack over the active stack.
+     */
     asm volatile (
         "push %%rax; push %%rbx; push %%rdx; push %%rbp;"
         "push %%r8;  push %%r9;  push %%r10; push %%r11;"
@@ -199,9 +211,18 @@ void check_wakeup_from_wait(void)
     }
 
     /*
-     * Hand-rolled longjmp().  Returns to __prepare_to_wait(), and lands on a
-     * `rep movs` instruction.  All other GPRs are restored from the stack, so
-     * are available for use here.
+     * Hand-rolled longjmp().
+     *
+     * check_wakeup_from_wait() is always called with a shallow stack,
+     * immediately after the vCPU has been rescheduled.
+     *
+     * Adjust %rsp to be the correct depth for the (deeper) stack we want to
+     * restore, then prepare %rsi, %rdi and %rcx such that when we intercept
+     * the rep movs in __prepare_to_wait(), it copies from wqv->stack over the
+     * active stack.
+     *
+     * All other GPRs are available for use; they're either restored from
+     * wqv->stack or explicitly clobbered.
      */
     asm volatile (
         "mov %1,%%"__OP"sp; jmp .L_wq_resume;"
-- 
2.11.0


