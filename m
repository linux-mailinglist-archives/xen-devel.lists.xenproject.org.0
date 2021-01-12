Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EC32F385E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65854.116707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOFs-0004TU-7N; Tue, 12 Jan 2021 18:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65854.116707; Tue, 12 Jan 2021 18:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOFs-0004So-1P; Tue, 12 Jan 2021 18:18:56 +0000
Received: by outflank-mailman (input) for mailman id 65854;
 Tue, 12 Jan 2021 18:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOCo-0003Yo-1y
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:46 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bb38c76-4004-4cb6-bea8-3807869d03d5;
 Tue, 12 Jan 2021 18:14:09 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIE69c001367;
 Tue, 12 Jan 2021 19:14:06 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDmSS008028;
 Tue, 12 Jan 2021 19:13:48 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id D9E467218; Tue, 12 Jan 2021 19:13:48 +0100 (MET)
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
X-Inumbo-ID: 9bb38c76-4004-4cb6-bea8-3807869d03d5
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] libs/light: pass some infos to qemu
Date: Tue, 12 Jan 2021 19:12:37 +0100
Message-Id: <20210112181242.1570-17-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:14:06 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

Pass bridge name to qemu as command line option
When starting qemu, set an environnement variable XEN_DOMAIN_ID,
to be used by qemu helper scripts

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/light/libxl_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 3da83259c0..8866c3f5ad 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -761,6 +761,8 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
         int nr_set_cpus = 0;
         char *s;
 
+        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", domid));
+
         if (b_info->kernel) {
             LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
                  "qemu-xen-traditional");
@@ -1547,8 +1549,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                 flexarray_append(dm_args, "-netdev");
                 flexarray_append(dm_args,
                                  GCSPRINTF("type=tap,id=net%d,ifname=%s,"
+					   "br=%s,"
                                            "script=%s,downscript=%s",
                                            nics[i].devid, ifname,
+					   nics[i].bridge,
                                            libxl_tapif_script(gc),
                                            libxl_tapif_script(gc)));
 
@@ -1825,6 +1829,8 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     flexarray_append(dm_args, GCSPRINTF("%"PRId64, ram_size));
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
+        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", guest_domid));
+
         if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI)
             flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
         for (i = 0; i < num_disks; i++) {
-- 
2.29.2


