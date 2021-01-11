Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000B62F1D06
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65207.115557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KD-0005e1-4m; Mon, 11 Jan 2021 17:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65207.115557; Mon, 11 Jan 2021 17:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KD-0005dS-0Y; Mon, 11 Jan 2021 17:49:53 +0000
Received: by outflank-mailman (input) for mailman id 65207;
 Mon, 11 Jan 2021 17:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Eg-0002aB-Rl
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:10 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.101])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8a6f426-9023-4fc0-a14a-a17fe184f81d;
 Mon, 11 Jan 2021 17:42:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHghM3q
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:43 +0100 (CET)
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
X-Inumbo-ID: a8a6f426-9023-4fc0-a14a-a17fe184f81d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386969;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=clFuA5dm8kf+TupFXbRehw0MdtvQRL6yDn/vfyT50os=;
	b=AJfg5dAWadNusFzpEkTmSRKy0vxoPSc02fbcQefF+eHUGJQ7xVv3uQV2AUozrsyKdy
	JNs+EyW/R0V3UAlUOE3UcJ8LIpiHhfOyHgJjWCPxKIaHSkkmSPttfeQh5Fu9mlV+qFBU
	xrks+pL/pj7RKIZnI7qsOblseX/JlThJiIvYT+zQezW0sy2Q6/2gSbliOBN3Ms9qI9SI
	8Jwrza5sSkCUOzZQRxkHDQphYNq6P+yfYDzqE4sV2hYwL8LuuOf8B48Ql/D9dWXfzUlb
	zt39bTqIrON4EfW4pGIH/ZpNxQR7ZXRPOQeHZbaomm8w7140NVyuEAs6H/xR9y9hdmIs
	Nzsw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 36/39] tools: add callback to libxl for precopy_policy and precopy_stats_t
Date: Mon, 11 Jan 2021 18:42:21 +0100
Message-Id: <20210111174224.24714-37-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This duplicates simple_precopy_policy. To recap its purpose:
- do up to 5 iterations of copying dirty domU memory to target,
  including the initial copying of all domU memory, excluding
  the final copying while the domU is suspended
- do fewer iterations in case the domU dirtied less than 50 pages

Take the opportunity to also move xen_pfn_t into qw().

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/light/libxl_dom_save.c       | 19 +++++++++++++++++++
 tools/libs/light/libxl_internal.h       |  2 ++
 tools/libs/light/libxl_save_msgs_gen.pl |  3 ++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index 32e3cb5a13..3f3cff0342 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -373,6 +373,24 @@ int libxl__save_emulator_xenstore_data(libxl__domain_save_state *dss,
     return rc;
 }
 
+static int libxl__domain_save_precopy_policy(precopy_stats_t stats, void *user)
+{
+    libxl__save_helper_state *shs = user;
+    libxl__domain_save_state *dss = shs->caller_state;
+    STATE_AO_GC(dss->ao);
+
+    LOGD(DEBUG, shs->domid, "iteration %u dirty_count %ld total_written %lu",
+         stats.iteration, stats.dirty_count, stats.total_written);
+    if (stats.dirty_count >= 0 && stats.dirty_count < LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT)
+        goto stop_copy;
+    if (stats.iteration >= LIBXL_XGS_POLICY_MAX_ITERATIONS)
+        goto stop_copy;
+    return XGS_POLICY_CONTINUE_PRECOPY;
+
+stop_copy:
+    return XGS_POLICY_STOP_AND_COPY;
+}
+
 /*----- main code for saving, in order of execution -----*/
 
 void libxl__domain_save(libxl__egc *egc, libxl__domain_save_state *dss)
@@ -430,6 +448,7 @@ void libxl__domain_save(libxl__egc *egc, libxl__domain_save_state *dss)
         callbacks->suspend = libxl__domain_suspend_callback;
 
     callbacks->switch_qemu_logdirty = libxl__domain_suspend_common_switch_qemu_logdirty;
+    callbacks->precopy_policy = libxl__domain_save_precopy_policy;
 
     dss->sws.ao  = dss->ao;
     dss->sws.dss = dss;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c79523ba92..d4cc694c01 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -124,6 +124,8 @@
 #define DOMID_XS_PATH "domid"
 #define PVSHIM_BASENAME "xen-shim"
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
+#define LIBXL_XGS_POLICY_MAX_ITERATIONS 5
+#define LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT 50
 
 /* Size macros. */
 #define __AC(X,Y)   (X##Y)
diff --git a/tools/libs/light/libxl_save_msgs_gen.pl b/tools/libs/light/libxl_save_msgs_gen.pl
index 9d425b1dee..7481818361 100755
--- a/tools/libs/light/libxl_save_msgs_gen.pl
+++ b/tools/libs/light/libxl_save_msgs_gen.pl
@@ -23,6 +23,7 @@ our @msgs = (
                                              STRING doing_what),
                                             'unsigned long', 'done',
                                             'unsigned long', 'total'] ],
+    [ 'scxW',   "precopy_policy", ['precopy_stats_t', 'stats'] ],
     [ 'srcxA',  "suspend", [] ],
     [ 'srcxA',  "postcopy", [] ],
     [ 'srcxA',  "checkpoint", [] ],
@@ -142,7 +143,7 @@ static void bytes_put(unsigned char *const buf, int *len,
 
 END
 
-foreach my $simpletype (qw(int uint16_t uint32_t unsigned), 'unsigned long', 'xen_pfn_t') {
+foreach my $simpletype (qw(int uint16_t uint32_t unsigned precopy_stats_t xen_pfn_t), 'unsigned long') {
     my $typeid = typeid($simpletype);
     $out_body{'callout'} .= <<END;
 static int ${typeid}_get(const unsigned char **msg,

