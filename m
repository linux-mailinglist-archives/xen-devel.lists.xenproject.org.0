Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C23977D3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135069.251342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo74v-0000JE-Ug; Tue, 01 Jun 2021 16:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135069.251342; Tue, 01 Jun 2021 16:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo74v-0000GD-QF; Tue, 01 Jun 2021 16:17:17 +0000
Received: by outflank-mailman (input) for mailman id 135069;
 Tue, 01 Jun 2021 16:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70u-0005Ec-3o
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:13:08 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14052265-3ec3-46ef-a819-c5198683c5e4;
 Tue, 01 Jun 2021 16:11:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBc1Ba
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:38 +0200 (CEST)
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
X-Inumbo-ID: 14052265-3ec3-46ef-a819-c5198683c5e4
ARC-Seal: i=1; a=rsa-sha256; t=1622563899; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Nzzt+2JzYgcElHAvvU+QlBQIcLp433Kx2kvRxjzCmaxh4vGLV+IBGWpul7FPjRQgUp
    ExSTIaImPvhM2qc0wC+fAUm23xlgXu1hT39G2qHii5BTN5lnzbMUWfHQ30wQQ/8ZmSUG
    gqWRBaqik7yQRBF3K61FpUEOvVYcvMPojhx32fx4JH/by7fbgKOMKU9uj1V9SB54MU6h
    7YWBGLbTfbdLg7K51ByMrW1BKqMOA1mKkCKAQHHLR6gvNEuzBwM1WocPsV0vL72MSO7I
    qoKvd8Sf31ed/pu7Dn1UAkay9MWOdlX8zd9bLNnpZGQ2ABT3ShzY7STxUdMIH1sIMwb3
    ihIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563899;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=oEobMmPDeGkR5HKQsTMYf9poCJx2hGJ9mHWfmH/ZeOo=;
    b=eRlYMUhLv1SFTirRAn5jjC1lo61RJ9Hi2DcTjmEyK0y2Q5LHYpjnNS2P6uOzjvXwk7
    LMLKASPuzbAMVBqNj86YpY7yT+LMmWXFgbnIqTWmidpgm+OraykJjVP4uC7xDlx9imwL
    wQOJjqr4Sgab5kx6cSPTrbIYi/iYyiZG1XUHF36TvypxWkhzvaLPjDC1ljHEtlbk05az
    GLknIgAM2tquzRUpfT1qgXPGX7TjChnay13sm/W4uuc/sBslxBMKOle6mgscczhQLLEW
    X4i35d+RcDTX2WTQI0smFTKy7jN1bFpU86VQFD4xrPx0jGw/T+n26IQcWMy4EdBxPOqh
    LR7Q==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563899;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=oEobMmPDeGkR5HKQsTMYf9poCJx2hGJ9mHWfmH/ZeOo=;
    b=N4ktv5IxWOYa/s3fjZBqMunV6MlGiILphSiu69DrwtxNOEY3GK+tY8ZxEhQJXjMFge
    leQvxASgSmHfGRHoHk7ze+m70aYb5Z3Dh71d3krEa4MLzp86ZYCSChmi5ukdjPRnxAr3
    +BTml+Z7BUA9ZtAH1Viu2YKaE+qySr/VpgA7lePZLi6ohkKHqm+bN+Yiuiu1dQY2T8y+
    qEhSY5pyhSG05pbP/bH/5UvvWKZKEd4q+yV31F176QMqi2cpif6KIUq1YQqSoFSgMyek
    EvSJXIsW1eZJsnNm+Uq8zgdall5x0mLJl9pVekmR8WxfdOsMKlYD5HJfTJXmaNm1BFIu
    6hoQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210601 30/38] tools: add callback to libxl for precopy_policy and precopy_stats_t
Date: Tue,  1 Jun 2021 18:11:10 +0200
Message-Id: <20210601161118.18986-31-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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
index 8af075291a..069c35452d 100644
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

