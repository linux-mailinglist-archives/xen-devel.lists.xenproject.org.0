Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4645850E2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 15:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377532.610779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQ12-0007Rb-FC; Fri, 29 Jul 2022 13:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377532.610779; Fri, 29 Jul 2022 13:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQ12-0007Nr-Ak; Fri, 29 Jul 2022 13:26:56 +0000
Received: by outflank-mailman (input) for mailman id 377532;
 Fri, 29 Jul 2022 13:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bg2=YC=citrix.com=prvs=2023e7475=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oHQ10-0006rA-F7
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 13:26:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bfa000e-0f42-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 15:26:53 +0200 (CEST)
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
X-Inumbo-ID: 1bfa000e-0f42-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659101213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M7O2Y0l36eqJVxxchKGa1BAarrZpTn8SXsfsBruyas8=;
  b=eqKdldxxE2qIuEKsHv3YXxhE0u+RW2aVrwjDypukSGG7p2cEcBuExU6Q
   LCB2rYgFWWO2dqRPUXu+YcnRlqX5zeUB4Y9aM1HbKpXmgIJv0ADHwN6Of
   Bs3B2YziC86U+8+0JycliGay1iOGdP2QtaoFNmMvmWGn5fsXlqLnZh9MS
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76933074
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AduOXbKpqIvPf0XvGanazvq+K2C9eBgzWbkUzO?=
 =?us-ascii?q?Ej9NTP0s+dABD8hgsdSaEH9hFxiBwbI0vBa6i2HxjTGFjKJ11DbHMsG61v30?=
 =?us-ascii?q?8FQIZD4FsuOBg5xy3WHeMGe+KXVIU3yRh1DHPk1d2DiRw6Rwqqiji+aBeVlw?=
 =?us-ascii?q?5Q36PXD4JWT/P+DHIC6akoTAGvZ2VQNXiyc3IptqscBMYdDI92KATdqmfIi2?=
 =?us-ascii?q?Rn1981nIVpQQ8u0zXnVxMBzpgFnE2ze4U/bWa7arZaDOLHd5U5PUn9xUHRjD?=
 =?us-ascii?q?U0FCInXZDnLeYv94tTd5V9dXMRAqaTnuBaAuf8J/P7+LZBLtcwB0/6tU0Sku?=
 =?us-ascii?q?tNh/8m+8CeKPEjQ5ikG4JqrrcYrKvpKXOunM7riGglcZPYtRTbWDxYTCtKEq?=
 =?us-ascii?q?3qbOVLhTitcwD6HPNN1sXq+NsXCxdsyDPVbXd8zKGYFqiSPFW7pJXVnvgjF6?=
 =?us-ascii?q?8JW8Da/Ps3HPAZ8gxV6Wo/k3Z0Z1SeAI2CKlILuEsbMyXJY1cor08YgHGaQt?=
 =?us-ascii?q?j0GzCPuzAniUqKO2KdIuBXlg7BTcQ8NISH/l1/WhFbTS14tfdMFle4S5nU0E?=
 =?us-ascii?q?tN0s/GtPBv8aBa1Cquw9lXnHs0a7cpFzY2Svsxij/PMAO4/S15te9qkrPb01?=
 =?us-ascii?q?oPBeft4e2Sf4QiAPSiFqpoKEiOpOB8UB9Ug+vRuzEGpfX2X0Pv6zQOB1rIU7?=
 =?us-ascii?q?6qQJFVmoaXFU7h5rQrM59ddw7iwCDop5Jrp+OMeGYKj7uSuN8n3lEeNkVN6+?=
 =?us-ascii?q?5JVnjMoM6B3v3xHY+LS3k1SXb881bgmKp1VLQE5AehUk9t+CQce/1LvAjhrE?=
 =?us-ascii?q?f+DR/RBIEP+OxlegzPlCbECh2AnuaMBErCyHA6ssT6uoEYz2mI6FKdlqgl+K?=
 =?us-ascii?q?b1PN1KDTZkS4U6bHkndd5lL9MfrORCWuRLYHivcVno28rivlxB9qDPeK04KN?=
 =?us-ascii?q?t3O9sxe9m9Y00lILT5JJMvee2E/2KAbMrNgmhs1KbrwiuzLLk6s9m6E5t0Tu?=
 =?us-ascii?q?uHOT9PcX6TvUkq6zC5x8aRlAGdNQTLU6EHww4FtplNn9pSfAhw5DCU1cqcnj?=
 =?us-ascii?q?xBuf89/p+yxfeKZNzoZuXscZS4s+d4Xv4aGZDX2JrGFLD9kv14vKZVVUA1X0?=
 =?us-ascii?q?SfnoR3PNBbeVSpCZU2yQ89VUP/+b+Dt/pcLM8veMXwSNOHUJ22z8Jkk+gVdZ?=
 =?us-ascii?q?jmGXze8legC+dRltoiAfm7P8sNB39ruro4+J93mZVul61iNQkeXW9w+cOK5w?=
 =?us-ascii?q?VQF1qnD9Ko7otINYrvZn4uz5aM4taOs1jeJbpumBS0D41X0BBOE14uhIEuQX?=
 =?us-ascii?q?0fXfyRS7cUZbrNkLZx71nNsdysxMdPPfqSC+OB1EBKYkl4kvYeRXwnAmrKn/?=
 =?us-ascii?q?h2C5fhKS1WV3SihmYZHgYJz6Br8t14hGXir/DCM2VJow3jDku8T0NZ4W398M?=
 =?us-ascii?q?3Tj5znzcVK1R5vTNusxbip2lUPgeGI6mov7sokdNsNOiOlD9Xs8CC+jS29x3?=
 =?us-ascii?q?nVAC+Tid/Zq9Odz4uWdE8uyCEFxEogSLTNFSZ75y/iRE9bByi9I9GXs0MHLQ?=
 =?us-ascii?q?E7IyMccHJUpwJolJaPegLfuQR11ZAixUxuNRKiCWdAMRoGJCbLl+zIGvR2Yk?=
 =?us-ascii?q?cO8XiVwix1kGhG3pcQptnFXJfYY90Msn2IuaWMRniVKF8F1b/dWKf86pPEA4?=
 =?us-ascii?q?ntOR8VpFTN67p6ph6jAqVctYi0VFJusOq8PWiAM0g84GI6qIE2YaeecpokvR?=
 =?us-ascii?q?jG10cqbo0SQR/BK8JVul81wvyPmlIyrYR5WeC01ZArZ+v9swmL5a8iNouwJT?=
 =?us-ascii?q?Z9ZZHtoL1M8f2F/mNdN4VauLH7n92QsHWP5cWpdGZgTKHZ1+ArS9UB9mzIni?=
 =?us-ascii?q?lWs6Py+NsWvCotRJADDqpXWQkLkL7Umq3OKH2iL8dqDvGpvo8FhV2uvtoWaT?=
 =?us-ascii?q?v08+43kd7+rog9+qRHng1jSjj0M6GMYv0CgiFL4yJbbeoSHsQsd9vxDijMOA?=
 =?us-ascii?q?1uIxTZMusyb0yTTfvlmciqPWaxBAIqicHrQnFEfoxzfOO3dMeuNcLu7FGxSM?=
 =?us-ascii?q?7pch8FD/j8D7HAxZf0CzWM4VWIQ76cWeIgf1utSp2pXI3qXQKkBvRIR4VHRw?=
 =?us-ascii?q?kvckjj9e27YDEGBgQzJoUUmqHNuEarsc3bOTiJMiRQ78PDxxBt05kdv9hmky?=
 =?us-ascii?q?Iei9q0zvznI4wklDnzf+8uChaE2oIRcBOLmrcZQ40IKaLvdZV6ISIg4g9R8z?=
 =?us-ascii?q?+RVu1qFFVcQWLGGQBs8BgT4Z50mUFLqgpaBEnVo/TOm1jNrdBaSnwHjKdEBW?=
 =?us-ascii?q?o8Pg4dQu8lBPmGplOtSSk2TkG0AOWnBN9oQxXtp43IFDhtrAr3HU/+taDs30?=
 =?us-ascii?q?AYcN8ROruB2cvX8A7Sb3u6ZubgIwqTSEFCkmCEvifXH/frUJuXZPes82vv94?=
 =?us-ascii?q?Jd0wOr/EkFiBBAeOWUmU6JSKrbKInGiu6dgfE5GYf1hPZCVvwCnAdCacQL7s?=
 =?us-ascii?q?sRK2B9H7+2U2GTAhwhrV3g8JrhCoDqqOmp6hquzroHPB9SvKICxVxCa/MpW7?=
 =?us-ascii?q?bPdYeDt9nqLFjLa5iRC0IoHZV5pfCLi0Iz3cRCkqP9WDFlzAzxR6oFKVzV4e?=
 =?us-ascii?q?sD/fXQHWMOF9TiNF9229u4rnnJwvcA46UUKACTRjwsrNzJvFtg8nvdfq1XXK?=
 =?us-ascii?q?wagjYnT6zNK7JgYuKTv1VjGGzTwBlIXCGf1xYztzsyUamL3Xb9py8K74ctLi?=
 =?us-ascii?q?gPl5467pYDJX3KrsYUXfyjZmEMd6zO+vKX2DAFDNnlk6Dcik9wVdAhbWPwh6?=
 =?us-ascii?q?NCYi9GRCjUWZnkryGJNK/jwDZb93C1L7NIq4Tpa4xwqg22KIzJK9IGaOyP5y?=
 =?us-ascii?q?w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="76933074"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [XEN PATCH] tools/libxl: env variable to trusted default
Date: Fri, 29 Jul 2022 14:26:41 +0100
Message-ID: <20220729132641.21221-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729132641.21221-1-anthony.perard@citrix.com>
References: <20220729132641.21221-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is a forward port of "tools/libxl: env variable to signal whether
disk/nic backend is trusted", to allow the environment variable to
still work when upgrading from 4.16 or earlier.

Introduce support in libxl for fetching the default backend trusted
option for disk and nic devices.

This is part of XSA-403.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/man/xl.1.pod.in          | 24 ++++++++++++++++++++++++
 tools/libs/light/libxl_disk.c |  6 +++++-
 tools/libs/light/libxl_nic.c  |  5 ++++-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 101e14241d..a5a2af5df9 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1945,6 +1945,30 @@ shows the decimal value. For non-linear mode, it shows hexadecimal value.
 
 =back
 
+=head1 ENVIRONMENT
+
+=over 4
+
+=item B<LIBXL_DISK_BACKEND_UNTRUSTED>
+
+Use B<trusted> or B<untrusted> from L<xl-disk-configuration(5)> instead for a
+more fine grain setting.
+
+This environment variable allows to changed the default value of B<trusted>;
+if it is set to "1", the default will be B<untrusted>; if the variable is
+absent or set to "0", the default will be B<trusted>.
+
+=item B<LIBXL_NIC_BACKEND_UNTRUSTED>
+
+Use B<trusted> / B<untrusted> from L<xl-network-configuration(5)> instead for a
+more fine grain setting.
+
+This environment variable allows to changed the default value of B<trusted>;
+if it is set to "1", the default will be B<untrusted>; if the variable is
+absent or set to "0", the default will be B<trusted>.
+
+=back
+
 =head1 IGNORED FOR COMPATIBILITY WITH XM
 
 xl is mostly command-line compatible with the old xm utility used with
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 9da2b2ed27..7564a12868 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -155,11 +155,15 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
                                          libxl_device_disk *disk, bool hotplug)
 {
     int rc;
+    const char *envvar;
 
     libxl_defbool_setdefault(&disk->discard_enable, !!disk->readwrite);
     libxl_defbool_setdefault(&disk->colo_enable, false);
     libxl_defbool_setdefault(&disk->colo_restore_enable, false);
-    libxl_defbool_setdefault(&disk->trusted, true);
+
+    envvar = getenv("LIBXL_DISK_BACKEND_UNTRUSTED");
+    /* Default to trusted if envvar missing or is "0". */
+    libxl_defbool_setdefault(&disk->trusted, !envvar || !strcmp("0", envvar));
 
     rc = libxl__resolve_domid(gc, disk->backend_domname, &disk->backend_domid);
     if (rc < 0) return rc;
diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index d6bf06fc34..ff3aede6ea 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -59,6 +59,7 @@ static int libxl__device_nic_setdefault(libxl__gc *gc, uint32_t domid,
                                         libxl_device_nic *nic, bool hotplug)
 {
     int rc;
+    const char *envvar;
 
     if (!nic->mtu)
         nic->mtu = LIBXL_DEVICE_NIC_MTU_DEFAULT;
@@ -116,7 +117,9 @@ static int libxl__device_nic_setdefault(libxl__gc *gc, uint32_t domid,
         abort();
     }
 
-    libxl_defbool_setdefault(&nic->trusted, true);
+    envvar = getenv("LIBXL_NIC_BACKEND_UNTRUSTED");
+    /* Default to trusted if envvar missing or is "0". */
+    libxl_defbool_setdefault(&nic->trusted, !envvar || !strcmp("0", envvar));
 
     return rc;
 }
-- 
Anthony PERARD


