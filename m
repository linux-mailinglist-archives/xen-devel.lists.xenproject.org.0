Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3473C7653
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155634.287389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MxJ-0001Qu-8W; Tue, 13 Jul 2021 18:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155634.287389; Tue, 13 Jul 2021 18:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MxJ-0001KS-0L; Tue, 13 Jul 2021 18:16:29 +0000
Received: by outflank-mailman (input) for mailman id 155634;
 Tue, 13 Jul 2021 18:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoW-0002UL-Ht
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:24 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d529767-36b1-4653-86ed-96c892b17c81;
 Tue, 13 Jul 2021 18:06:30 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6MtB7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:22 +0200 (CEST)
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
X-Inumbo-ID: 2d529767-36b1-4653-86ed-96c892b17c81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199582;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+k3zEXoyDaXQEiwvjOV10rf+liXTt7laH3C3jd8kr68=;
    b=FOKUhjofFTsweTT9yIXVCx+FyE+wsZGTUdNwhv7ts3CvDvMsT/m/Ih+OZszMb2BqK0
    EQY51Er931hHXpHOVSLjw90N6/lzp7qO0VAfzr0sii+XeDjQIMw/KCo8lSPnAyb8xw3S
    YxBXIrL6EbowucDFcKLrQdjkvvVJCZ7FlIDLTzFOHYeqnsqtgzUj9oA2PT3vKb5ACmcz
    ou9fBTCDsSsQboq4HVYFioY3KeJo6rta0zyTFF6RJshhXvHry3GKuY9pnJ8Hpe3LWo2m
    1sOMeDcZzyE7e2i4jcZrDpEHw+me9xJZW9zqoH5MDLK1fPy6N5z9A4k++C0HwceqHP9A
    iEAw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 25/31] tools: add callback to libxl for precopy_policy and precopy_stats
Date: Tue, 13 Jul 2021 20:05:59 +0200
Message-Id: <20210713180605.12096-26-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
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
v02:
- use plain struct precopy_stats instead of inventing
  a new precopy_stats_t (anthony)
---
 tools/libs/light/libxl_dom_save.c       | 19 +++++++++++++++++++
 tools/libs/light/libxl_internal.h       |  2 ++
 tools/libs/light/libxl_save_msgs_gen.pl |  3 ++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index 32e3cb5a13..839e061881 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -373,6 +373,24 @@ int libxl__save_emulator_xenstore_data(libxl__domain_save_state *dss,
     return rc;
 }
 
+static int libxl__domain_save_precopy_policy(struct precopy_stats stats, void *user)
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
index 0b4671318c..f7df4ab397 100644
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
index 9d425b1dee..b95942ed91 100755
--- a/tools/libs/light/libxl_save_msgs_gen.pl
+++ b/tools/libs/light/libxl_save_msgs_gen.pl
@@ -23,6 +23,7 @@ our @msgs = (
                                              STRING doing_what),
                                             'unsigned long', 'done',
                                             'unsigned long', 'total'] ],
+    [ 'scxW',   "precopy_policy", ['struct precopy_stats', 'stats'] ],
     [ 'srcxA',  "suspend", [] ],
     [ 'srcxA',  "postcopy", [] ],
     [ 'srcxA',  "checkpoint", [] ],
@@ -142,7 +143,7 @@ static void bytes_put(unsigned char *const buf, int *len,
 
 END
 
-foreach my $simpletype (qw(int uint16_t uint32_t unsigned), 'unsigned long', 'xen_pfn_t') {
+foreach my $simpletype (qw(int uint16_t uint32_t unsigned xen_pfn_t), 'struct precopy_stats', 'unsigned long') {
     my $typeid = typeid($simpletype);
     $out_body{'callout'} .= <<END;
 static int ${typeid}_get(const unsigned char **msg,

