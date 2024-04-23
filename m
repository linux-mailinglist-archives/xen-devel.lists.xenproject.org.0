Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D58AEB00
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710852.1110402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzI37-0000Cd-Mh; Tue, 23 Apr 2024 15:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710852.1110402; Tue, 23 Apr 2024 15:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzI37-0000Am-Ih; Tue, 23 Apr 2024 15:27:13 +0000
Received: by outflank-mailman (input) for mailman id 710852;
 Tue, 23 Apr 2024 15:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpn-0003wh-DE
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0846565a-0184-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:13:25 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 489C74EE0743;
 Tue, 23 Apr 2024 17:13:23 +0200 (CEST)
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
X-Inumbo-ID: 0846565a-0184-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 08/10] x86/hvm: hpet: address violations of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:50 +0200
Message-Id: <063ad5abee7765a921fd7f68372a4d7fe0e04e54.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/hpet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 1db9c0b60ee0..5f456221cbfb 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -43,11 +43,11 @@
     ((s_time_t)((((tick) > (h)->hpet_to_ns_limit) ?     \
         ~0ULL : (tick) * (h)->hpet_to_ns_scale) >> 10))
 
-#define timer_config(h, n)       (h->hpet.timers[n].config)
+#define timer_config(h, n)       ((h)->hpet.timers[n].config)
 #define timer_enabled(h, n)      (timer_config(h, n) & HPET_TN_ENABLE)
 #define timer_is_periodic(h, n)  (timer_config(h, n) & HPET_TN_PERIODIC)
 #define timer_is_32bit(h, n)     (timer_config(h, n) & HPET_TN_32BIT)
-#define hpet_enabled(h)          (h->hpet.config & HPET_CFG_ENABLE)
+#define hpet_enabled(h)          ((h)->hpet.config & HPET_CFG_ENABLE)
 #define timer_level(h, n)        (timer_config(h, n) & HPET_TN_LEVEL)
 
 #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n), HPET_TN_ROUTE)
-- 
2.34.1


