Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5887F20AB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 23:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637325.993054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D55-0005Np-15; Mon, 20 Nov 2023 22:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637325.993054; Mon, 20 Nov 2023 22:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D54-0005Li-Tw; Mon, 20 Nov 2023 22:49:26 +0000
Received: by outflank-mailman (input) for mailman id 637325;
 Mon, 20 Nov 2023 22:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5D54-0004rh-1M
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 22:49:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d911e74-87f7-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 23:49:25 +0100 (CET)
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
X-Inumbo-ID: 0d911e74-87f7-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700520565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c/mEDl4nIaExCRMi2dipvNsJyeJ3pq2/9bVYc4elcvc=;
  b=gs02KOr/y2tCt+xS7YqMa+mZF2160tPk7DXY28KxtDX4jxV415EhfUji
   vqnl9d9km+CTJjX7CZdaK5dF+l220dVIcRex9MTlwZYqQs0vA6yUpT3WI
   xMpO+3bCfS1HSoV7BACjPipYYSxPzxsx+vkilde+Qyoz0NObBe0a3wuBV
   A=;
X-CSE-ConnectionGUID: WaXQkFtXSsexmHBFI/oWVg==
X-CSE-MsgGUID: A4kbFKoySjesE7EgccrYIQ==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128662992
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:FZKGUaJ2JD4XcNl8FE+RN5UlxSXFcZb7ZxGr2PjKsXjdYENS0zFTm
 jdLCGGAa/qDNzT2e9hzaYix8kxSuJKEn4NnS1dlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrfwP9TlK6q4mhB5wZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5ICFF39
 tIEGAsWYwCGp8iY4fW8dddj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQFZsLxBfJ/
 Aoq+UzQXhIQGv+Y2AGH/2mB2cLAlijhaaMrQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkNiRbIQsdmAbSCpNT/EjHtw
 BiHtCE7wb4UiKYj3aih4UrOhT7qo5HTVxM0/S3eRGfj5QR8DKa/YIal80Tcq/xJI4CQVFCpt
 mULgMWY46YFCpTlvCqMS+IJFfe36uqfMTvdqVRyEIIs8Tvr8HmmFb28+xkneh0vaJxdP2a0M
 QmM4Wu9+aO/IlOVZJ9OYKytO/8xwLjlNf7Ld7fTUeRBN80ZmBC8wM1+WaKB9zmyyBBwwP9lY
 MnzTCq6MZoN5U1aINuKqwQ1i+ZDKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 I4HapPXkUkGCbKgCsUyzWL1BQpSRZTcLcquw/G7i8bZelY2cI3fI6O5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3TAk2PnIjHBM4lxVpiZHxEALpd8yR7CWpZxPtFJsRfkHhO3LAL8MOYu
 NFcKpnZX6wWEmuWk9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:IYIENaOnLV/Rx8BcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3AzrTsP2ggC6LxgXZzV/51me8Z+TJuTXTt9XT+P3+?=
 =?us-ascii?q?DEmt5TZ2/Z37X/5xanJ87?=
X-Talos-MUID: 9a23:tNyTDwWjzwsB7JHq/BawhztMF8B52KajE21SvJoNsNO1FBUlbg==
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="128662992"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: [PATCH 2/6] x86/setup: Rework cmdline_cook() to be compatible with -Wwrite-strings
Date: Mon, 20 Nov 2023 22:49:08 +0000
Message-ID: <20231120224912.1421916-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Constify both cmdline variables in create_dom0() and __start_xen().
Initialise Xen's variable to the empty string to simplify the parsing logic.

Update cmdline_cook() to take and return const pointers, changing it to have
an early exit for a NULL input (which can happen if the mbi-> pointers happen
to be 0).

Note this only compiles because strstr() launders the const off the pointer
when assigning to the mutable kextra, but that logic only mutates the
mbi->cmdline buffer.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

I don't particularly like this, but it's the best I can come up with.
---
 xen/arch/x86/setup.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c41dfdb2bdf8..a06a241943f6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -837,9 +837,10 @@ static bool __init loader_is_grub2(const char *loader_name)
     return (p != NULL) && (p[5] != '0');
 }
 
-static char * __init cmdline_cook(char *p, const char *loader_name)
+static const char *__init cmdline_cook(const char *p, const char *loader_name)
 {
-    p = p ? : "";
+    if ( !p )
+        return "";
 
     /* Strip leading whitespace. */
     while ( *p == ' ' )
@@ -885,7 +886,7 @@ static struct domain *__init create_dom0(const module_t *image,
         },
     };
     struct domain *d;
-    char *cmdline;
+    const char *cmdline;
     domid_t domid;
 
     if ( opt_dom0_pvh )
@@ -971,8 +972,8 @@ static struct domain *__init create_dom0(const module_t *image,
 /* SAF-1-safe */
 void __init noreturn __start_xen(unsigned long mbi_p)
 {
-    const char *memmap_type = NULL, *loader;
-    char *cmdline, *kextra;
+    const char *memmap_type = NULL, *loader, *cmdline = "";
+    char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
@@ -1027,9 +1028,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                                            : "unknown";
 
     /* Parse the command-line options. */
-    cmdline = cmdline_cook((mbi->flags & MBI_CMDLINE) ?
-                           __va(mbi->cmdline) : NULL,
-                           loader);
+    if ( mbi->flags & MBI_CMDLINE )
+        cmdline = cmdline_cook(__va(mbi->cmdline), loader);
+
     if ( (kextra = strstr(cmdline, " -- ")) != NULL )
     {
         /*
-- 
2.30.2


