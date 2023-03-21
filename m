Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF66C30BE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512361.792356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaT9-0001FC-Lf; Tue, 21 Mar 2023 11:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512361.792356; Tue, 21 Mar 2023 11:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaT9-0001DP-IN; Tue, 21 Mar 2023 11:47:59 +0000
Received: by outflank-mailman (input) for mailman id 512361;
 Tue, 21 Mar 2023 11:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9ZV=7N=citrix.com=prvs=437435c1e=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1peaT8-0001D8-0x
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:47:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 367e2b73-c7de-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 12:47:55 +0100 (CET)
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
X-Inumbo-ID: 367e2b73-c7de-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679399275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=U9Ac8kfawVwJyTiVqm0kbmJdZ36EQ83/TJ8nOn83CLs=;
  b=Drvn3K4fAOsjBqKHJD5V8VQPZIPWLGrQFjPTiQY1B5h2SWony8oBd3eD
   JLo6NFSYWMwzEnSWWn1U4qBsYMNC0tg6ZG9W5Gli6O66NbW/MumfxnhFl
   ug519Ko1rPQRq7nQjuI7I0yIR/xMoDH7NehUZtEWy98/qkNkHArqPmJPQ
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101602006
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:j1AOMaJH058XRtNXFE+R5ZUlxSXFcZb7ZxGr2PjKsXjdYENS1TZRz
 TBMUGmEb/mKY2r2fNsjbY+1oUNQ65LVzdNiGwFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5cGXth6
 6M8Dwood0yJgs2W3L+6cshj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWh+qyiXTuNTFJoUmRpII84nTJzRw327/oWDbQUoXSHJsNxB7A+
 Aoq+Uz6AEAWK/LPxACo90iJhrTNpDnDaac7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebT4lz
 FiShPvyGCdi9raSTBq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwmd2FpAu6QlUCYe/h/4QD2ByTlcfdKvYqOI9VXa1ddPedPxoka6g
 JQUpySPxLlQUsDWynHdGb5l8KKBvKjcbmCF6bJ7N9x4rmn2pSb+FWxFyGsmTHqFJProbtMAj
 KX7nQpKrKFeM3KxBUOcS9LgUp96pUQM+DmMaxw1UjatSsIrHON/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlCgORwmXhgnjuDH/gXKihLN5LEPBaopUotagPSPojVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zLP/2WsidCBhbbiv8pQ/XrfacmJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4AOi2CadclnaNBiOqtrHBP5CkJ7yBgR0VX7A5pTpSd3HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:LiKQ46hEUK1UdSstc2eIy4eMcHBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101602006"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v3 1/3] tools/xenctrl: add xc_get_cpu_version()
Date: Tue, 21 Mar 2023 11:47:43 +0000
Message-ID: <20230321114745.11044-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321114745.11044-1-sergey.dyasli@citrix.com>
References: <20230321114745.11044-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

As a wrapper for XENPF_get_cpu_version platform op.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 tools/include/xenctrl.h   |  1 +
 tools/libs/ctrl/xc_misc.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 23037874d3..8aa747dc2e 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1186,6 +1186,7 @@ int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
 int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
+int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
 int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance);
 int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 265f15ec2d..f2f6e4348e 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -226,6 +226,26 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
     return ret;
 }
 
+int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
+{
+    int ret;
+    DECLARE_PLATFORM_OP;
+
+    if ( !xch || !cpu_ver )
+        return -1;
+
+    platform_op.cmd = XENPF_get_cpu_version;
+    platform_op.u.pcpu_version.xen_cpuid = cpu_ver->xen_cpuid;
+
+    ret = do_platform_op(xch, &platform_op);
+    if ( ret != 0 )
+        return ret;
+
+    *cpu_ver = platform_op.u.pcpu_version;
+
+    return 0;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
-- 
2.17.1


