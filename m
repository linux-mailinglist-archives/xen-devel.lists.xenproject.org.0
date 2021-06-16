Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E483E3A9BA9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143052.263888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGq-0007xx-81; Wed, 16 Jun 2021 13:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143052.263888; Wed, 16 Jun 2021 13:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVGq-0007vg-4P; Wed, 16 Jun 2021 13:07:52 +0000
Received: by outflank-mailman (input) for mailman id 143052;
 Wed, 16 Jun 2021 13:07:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV2N-00075D-9W
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:55 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2b453df-01fb-4b67-9fad-bdacdf928dd0;
 Wed, 16 Jun 2021 12:51:55 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpltmP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:47 +0200 (CEST)
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
X-Inumbo-ID: f2b453df-01fb-4b67-9fad-bdacdf928dd0
ARC-Seal: i=1; a=rsa-sha256; t=1623847907; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kIuewaBaUo7N4cc0L8a9lIZxZRuflXX7CS3wZNNzDXoBBAFZK8OgO5Vgn7jTiXKbHu
    F4D58+c7d5+4Z2ezbhWTlNpJF0l0Y6XER3UScRfd52ggzeIE+iaFltig9uXMSEwCAcUm
    zbPBypeK9qBKXuvulxrB2zYStI+7hi3uA2tYoQ5QfTX/BfskBO8mc7kv1Z2w23zgb2Y1
    cPPTPHbnbp/qmYBvkvsBfrD+TNmzrBAiEG212yqlb/i/6Cwm6Sas4wKuMxm7GNEvGXl9
    HUQJl0tzAtosl9LEExc50fO5k+e/W9OxtBsCo/fv+o2BKnjX3HezgR6+2GZSP2GMRMSh
    PlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847907;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=am1tugVzg71doIb/LdiNWtayiDvPFoCjZNyMmciOrqY=;
    b=GqFb2vbB+Jh89wB/deQ9VqUiTbVkXdOAaLyOfBMuvAOeFlEEJQCYaBIfsFIiYwEo7u
    KAwSemkL/0AstwiAPeaGhNv9uC7QnrUR1TbD+AmUtD6t3n+2PhejtIvKccKBHRz666sw
    S5iZKwghbJVzONTNoYPeFWNGcl6778xol3DgrXtn2Rcl38Ob7MYxjSc2RAe1aA6qM5G+
    mZroe03cbZ1o/sCwIXK11WhYdCpIAftpb+gVYC/+oOWjFGAAlMeEIE6F3KVVyy1zvGTJ
    aB0b2vU1m8I0huk4P3Nu17YIGc4/4bFOxceFvtKNGMLTp4FN1YDWjfrFB23AJ4h7jV+u
    HUBQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847907;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=am1tugVzg71doIb/LdiNWtayiDvPFoCjZNyMmciOrqY=;
    b=ZyPflmDE/hyYGB/vXZcl7u7B+KonkHuWE4Mfv2YzW2JwqivRJ0Zrfz8oNrJEYVF9xX
    crKYZV8633x4FUi6IQpDkEKP0/8al9TL6vmmoe5RJgUBirwguDpNMHeEIyhBPTYIP4jC
    E4ZK+JbnP513hgwumJ504JhFWRvvAJm6fyNyTwbLVicuPejYmqpZFVbjRq5kjUWNLNeg
    BWTxwa9FWaE7hjzFQVZ5catJMO5nSelGGbvnQW16LaW0+PGZMxyPZNG+10d6tWdGLoP9
    +oQQ0koGIFuI3mlgF8zRRNRP4gE9jpSyJWV8Sa6GtlX0FOpBVNYH+8CFcBHQu9EbOhCM
    jpYg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 30/36] tools: add callback to libxl for precopy_policy and precopy_stats_t
Date: Wed, 16 Jun 2021 14:51:23 +0200
Message-Id: <20210616125129.26563-31-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index 439c654733..57d7e4b4b8 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -125,6 +125,8 @@
 #define DOMID_XS_PATH "domid"
 #define PVSHIM_BASENAME "xen-shim"
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
+#define LIBXL_XGS_POLICY_MAX_ITERATIONS 5
+#define LIBXL_XGS_POLICY_TARGET_DIRTY_COUNT 50
 
 /* Size macros. */
 #define __AC(X,Y)   (X##Y)
diff --git a/tools/libs/light/libxl_save_msgs_gen.pl b/tools/libs/light/libxl_save_msgs_gen.pl
index f263ee01bb..ab55c81644 100755
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

