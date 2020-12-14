Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8A12D9F33
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52402.91756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshd-0002tb-JJ; Mon, 14 Dec 2020 18:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52402.91756; Mon, 14 Dec 2020 18:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshb-0002lg-R6; Mon, 14 Dec 2020 18:36:07 +0000
Received: by outflank-mailman (input) for mailman id 52402;
 Mon, 14 Dec 2020 16:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqrh-0006vN-Lq
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:38:25 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f338a86-e757-4555-9dbd-e383e782b2e1;
 Mon, 14 Dec 2020 16:36:35 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaXW1000190;
 Mon, 14 Dec 2020 17:36:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaWlF002558;
 Mon, 14 Dec 2020 17:36:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 9F8C5AAC67; Mon, 14 Dec 2020 17:36:33 +0100 (MET)
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
X-Inumbo-ID: 5f338a86-e757-4555-9dbd-e383e782b2e1
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 14/24] Pass bridge name to qemu and set XEN_DOMAIN_ID
Date: Mon, 14 Dec 2020 17:36:13 +0100
Message-Id: <20201214163623.2127-15-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

Pass bridge name to qemu
When starting qemu, set an environnement variable XEN_DOMAIN_ID,
to be used by qemu helper scripts

---
 tools/libs/light/libxl_dm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 3da83259c0..5948ace60d 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -761,6 +761,10 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
         int nr_set_cpus = 0;
         char *s;
 
+	static char buf[12];
+	snprintf(buf, sizeof(buf), "%d", domid);
+        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", buf);
+
         if (b_info->kernel) {
             LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
                  "qemu-xen-traditional");
@@ -1547,8 +1551,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                 flexarray_append(dm_args, "-netdev");
                 flexarray_append(dm_args,
                                  GCSPRINTF("type=tap,id=net%d,ifname=%s,"
+					   "br=%s,"
                                            "script=%s,downscript=%s",
                                            nics[i].devid, ifname,
+					   nics[i].bridge,
                                            libxl_tapif_script(gc),
                                            libxl_tapif_script(gc)));
 
@@ -1825,6 +1831,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     flexarray_append(dm_args, GCSPRINTF("%"PRId64, ram_size));
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
+	static char buf[12];
+	snprintf(buf, sizeof(buf), "%d", guest_domid);
+        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", buf);
+
         if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI)
             flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
         for (i = 0; i < num_disks; i++) {
-- 
2.28.0


