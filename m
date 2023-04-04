Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429006D6861
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518019.804142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjC2-0004SB-Sf; Tue, 04 Apr 2023 16:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518019.804142; Tue, 04 Apr 2023 16:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjC2-0004QW-Py; Tue, 04 Apr 2023 16:07:34 +0000
Received: by outflank-mailman (input) for mailman id 518019;
 Tue, 04 Apr 2023 16:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCXw=73=citrix.com=prvs=451435b33=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pjjC1-0004Q2-Mv
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:07:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cca51aa8-d302-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 18:07:31 +0200 (CEST)
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
X-Inumbo-ID: cca51aa8-d302-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680624451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OIB4XE7cSQQtZzws9p9Ga2irS8OnpzPLnMZtppaosBg=;
  b=GsB7Yy1Jo4Ow6+EFtZiwVjKi0AULlLC1H/ys9LaFkAvARqHohNo0SPOP
   tToe0+ra4bSeoli/yY5QUf1cAN/w4sMwzy0jegLkfLOG1jVaOxSAbkyvc
   UsFMfByJHhSwbITbCUCsp3ESrwL0EtYQcRiYOXTihIoHUyHypkIZwab1N
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106724130
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:yu8CZ6pwY/cYEdn6ykTvBwmglPVeBmIuZRIvgKrLsJaIsI4StFCzt
 garIBmGPKuDYzCgctEjO4u0pkIEsZXQzIRiGQc9rylgQSJE8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzyVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGtSLQDTreG3+ZSQEeJz3fYlc8boI5xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVDpUiaqLtx73na1whw+LPsLMDUapqBQsA9ckOw/
 zqYoD6lW0pCXDCZ4SSP9i20qPGVpgzmSr4rNrK47rl4iWTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBBzN1t6aOYWmA7brSpjS3UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPF1RujunKYo67xlgmJ571TY+p0H7wtv1fd7SfEVaCo
 2dRzqBy89sy4YGxeD2lGbtdRO/xu63UbFUwknY0QcB/qm3FF2qLONkJvWogfBoB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMJGPxT4M5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzOLGMylnk78i+TODJJwdVviGALWBt3VEYve+FmFm
 zqhH5DiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/Fqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMSo8Mum3Ac4u9RrW/0UEZD6V5pTqWq73hI93Snf9VeJ4nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:g3P7gK99tCdBf+9fU7Juk+DzI+orL9Y04lQ7vn2ZKCYlF/Bw8v
 rF8cjzuiWZtN98Yh4dcKm7SdC9qBDnhPxICOsqXYtKNTOO0FdASrsN0WKI+UyCJ8SRzI9gPJ
 BbAsxD4Y3LZmSSVfyKmzVQyexQpuVvLZrY4ts2E00dNT2CtZsQlTtENg==
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="106724130"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v4 1/3] tools/xenctrl: add xc_get_cpu_version()
Date: Tue, 4 Apr 2023 17:06:53 +0100
Message-ID: <20230404160655.2354-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230404160655.2354-1-sergey.dyasli@citrix.com>
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

As a wrapper for XENPF_get_cpu_version platform op.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v3 --> v4:
- Replaced DECLARE_PLATFORM_OP
- Removed NULL checks
---
 tools/include/xenctrl.h   |  1 +
 tools/libs/ctrl/xc_misc.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 05967ecc92..34b3b25289 100644
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
index 265f15ec2d..90d50faa4f 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -226,6 +226,23 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
     return ret;
 }
 
+int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
+{
+    int ret;
+    struct xen_platform_op op = {
+        .cmd = XENPF_get_cpu_version,
+        .u.pcpu_version.xen_cpuid = cpu_ver->xen_cpuid,
+    };
+
+    ret = do_platform_op(xch, &op);
+    if ( ret != 0 )
+        return ret;
+
+    *cpu_ver = op.u.pcpu_version;
+
+    return 0;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
-- 
2.17.1


