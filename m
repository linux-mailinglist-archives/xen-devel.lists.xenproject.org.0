Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16019BCCF8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 13:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830200.1245120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Iud-0000Dx-G8; Tue, 05 Nov 2024 12:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830200.1245120; Tue, 05 Nov 2024 12:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Iud-0000CM-CY; Tue, 05 Nov 2024 12:43:59 +0000
Received: by outflank-mailman (input) for mailman id 830200;
 Tue, 05 Nov 2024 12:43:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3dk=SA=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1t8Iub-0000CE-Pd
 for xen-devel@lists.xen.org; Tue, 05 Nov 2024 12:43:57 +0000
Received: from smarthost01c.ixn.mail.zen.net.uk
 (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c20383e-9b73-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 13:43:51 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1t8IuT-006UZx-Ja
 for xen-devel@lists.xen.org; Tue, 05 Nov 2024 12:43:51 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id C33D0B18F32
 for <xen-devel@lists.xen.org>; Tue,  5 Nov 2024 12:43:50 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpGNBQSHJYyJ for <xen-devel@lists.xen.org>;
 Tue,  5 Nov 2024 12:43:50 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 92EE0B18F2D
 for <xen-devel@lists.xen.org>; Tue,  5 Nov 2024 12:43:50 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id D7002CA; Tue,  5 Nov 2024 12:43:50 +0000 (GMT)
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
X-Inumbo-ID: 9c20383e-9b73-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxMi4yMy4xLjIyIiwiaGVsbyI6InNtYXJ0aG9zdDAxYy5peG4ubWFpbC56ZW4ubmV0LnVrIn0=
X-Custom-Transaction: eyJpZCI6IjljMjAzODNlLTliNzMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODEwNjMxLjgyNDUzMSwic2VuZGVyIjoiamFtZXNAZGluZ3dhbGwubWUudWsiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZyJ9
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Tue, 5 Nov 2024 12:43:50 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xen.org
Subject: [PATCH] drop setting XEN_QEMU_CONSOLE_LIMIT in the environment
Message-ID: <ZyoTBgbGGYTyphH6@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="NL3BdUKXuzckRVF2"
Content-Disposition: inline
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


--NL3BdUKXuzckRVF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Since qemu-xen-4.18.0 the corresponding code which responds to this
environment variable was not applied to the qemu tree.  It doesn't make
sense to me that it continues to be set in libxl so here's a patch
which removes it.

These are the relevant commits for various qemu tags:

qemu-xen-4.10.0: c349189772cec43498b0bec8a84146f10b8937af
qemu-xen-4.11.0: 2b033e396f4fa0981bae1213cdacd15775655a97
qemu-xen-4.12.0: 4f080070a9809bde857851e68a3aeff0c4b9b6a6
qemu-xen-4.13.0: c81d7597747f29432a0e197bf2c2109e77f2b6cf
qemu-xen-4.14.0: 410cc30fdc590417ae730d635bbc70257adf6750
qemu-xen-4.15.0: 677cbe1324c29294bb1d1b8454b3f214725e40fd
qemu-xen-4.16.0: b6e539830bf45e2d7a6bd86ddfdf003088b173b0
qemu-xen-4.17.0: 9a5e4bc76058766962ab3ff13f42c1d39a8e08d3
qemu-xen-4.18.0: not present
qemu-xen-4.19.0: not present

If this is approved is someone able to apply it to the tree?

Regards,
James

--NL3BdUKXuzckRVF2
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="remove-XEN_QEMU_CONSOLE_LIMIT.diff"

commit 86bfb2b8105c840311645a5587bc6cce6e5312ef
Author: James Dingwall <james@dingwall.me.uk>
Date:   Tue Nov 5 11:16:20 2024 +0000

    libxl: drop setting XEN_QEMU_CONSOLE_LIMIT in the environment (XSA-180 / CVE-2014-3672)
    
    The corresponding code in the Xen qemu repository was not applied from
    qemu-xen-4.18.0.

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 1f2f5bd97a..b193a5dc37 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -638,20 +638,6 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
     return ERROR_FAIL;
 }
 
-/* XSA-180 / CVE-2014-3672
- *
- * The QEMU shipped with Xen has a bodge. It checks for
- * XEN_QEMU_CONSOLE_LIMIT to see how much data QEMU is allowed
- * to write to stderr. We set that to 1MB if it is not set by
- * system administrator.
- */
-static void libxl__set_qemu_env_for_xsa_180(libxl__gc *gc,
-                                            flexarray_t *dm_envs)
-{
-    if (getenv("XEN_QEMU_CONSOLE_LIMIT")) return;
-    flexarray_append_pair(dm_envs, "XEN_QEMU_CONSOLE_LIMIT", "1048576");
-}
-
 const libxl_vnc_info *libxl__dm_vnc(const libxl_domain_config *guest_config)
 {
     const libxl_vnc_info *vnc = NULL;
@@ -704,8 +690,6 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
 
     assert(state->dm_monitor_fd == -1);
 
-    libxl__set_qemu_env_for_xsa_180(gc, dm_envs);
-
     flexarray_vappend(dm_args, dm,
                       "-d", GCSPRINTF("%d", domid), NULL);
 
@@ -1210,8 +1194,6 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     dm_args = flexarray_make(gc, 16, 1);
     dm_envs = flexarray_make(gc, 16, 1);
 
-    libxl__set_qemu_env_for_xsa_180(gc, dm_envs);
-
     flexarray_vappend(dm_args, dm,
                       "-xen-domid",
                       GCSPRINTF("%d", guest_domid), NULL);
@@ -3656,7 +3638,6 @@ void libxl__spawn_qemu_xenpv_backend(libxl__egc *egc,
     flexarray_append(dm_args, NULL);
     args = (char **) flexarray_contents(dm_args);
 
-    libxl__set_qemu_env_for_xsa_180(gc, dm_envs);
     envs = (char **) flexarray_contents(dm_envs);
 
     logfile_w = libxl__create_qemu_logfile(gc, GCSPRINTF("qdisk-%u", domid));

--NL3BdUKXuzckRVF2--

