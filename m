Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0A673D65
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 16:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481200.745951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWkz-0000aH-6i; Thu, 19 Jan 2023 15:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481200.745951; Thu, 19 Jan 2023 15:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWkz-0000TZ-1S; Thu, 19 Jan 2023 15:23:13 +0000
Received: by outflank-mailman (input) for mailman id 481200;
 Thu, 19 Jan 2023 15:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBPQ=5Q=citrix.com=prvs=3763d7854=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIWkx-0000C1-Gf
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 15:23:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a4d8cb2-980d-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 16:23:04 +0100 (CET)
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
X-Inumbo-ID: 2a4d8cb2-980d-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674141788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xn/IxrW5V76kot9CBVjdkzIoSE64b8psdGUefGXif2Q=;
  b=Zl6tYApfV4dYZIzl/yAxvUrcDAQepnslwt8PlTsh03YqQt3F42hA2l+n
   cNblds2662MS2yxYDCaVuSLQBqYpML4W5YsF6vDUC9mr+hNJWURPLlLXR
   Rf8zhEHuPq/pcWIh//RC2IJBINjt0lNgFjkp3zCtHUCl3cXI0Quh4mdSv
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93399569
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:MDORKaJV4m0sXmLGFE+R/5UlxSXFcZb7ZxGr2PjKsXjdYENShmQDy
 WoZDW/TPPaNMGTwed9+OoviphlU65GDztM1SVRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c59K010y
 tgSNwsnLRWE17vszrulbcVV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbHp4EzxvG9
 woq+Uz5CzEHaNKV0QHdrHicuOz/uiXEctINQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxLmoZSj9MbvQ2uclwQiYlv
 neShM/gDzFrtLyTSFqe+62SoDf0PjIaRUcdYQcUQA1D5MPsyLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s7h+Qn7Zqf90/8qXGpociQFAA8+CL7Zzfwhu9mX7JJd7BE+HCCs6kbfdzDFgbR1
 JQXs5PAtb5TVPlhgATIGbxQR+/xup5pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgKrrUazGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 svDL5jyVidLWfQPIN+KqwE1i+dDKscWnDO7eHwG507/jer2iIC9F9/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 izsBBEGkwKl2BUq62yiMxheVV8mZr4nxVpTAMDmFQ/AN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:7JwMX6FyMZLCHDtppLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.97,229,1669093200"; 
   d="scan'208";a="93399569"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 3/3] build: compat-xlat-header.py: optimisation to search for just '{' instead of [{}]
Date: Thu, 19 Jan 2023 15:22:56 +0000
Message-ID: <20230119152256.15832-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119152256.15832-1-anthony.perard@citrix.com>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

`fields` and `extrafields` always all the parts of a sub-struct, so
when there is '}', there is always a '{' before it. Also, both are
lists.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/compat-xlat-header.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-header.py
index ae5c9f11c9..d0a864b68e 100644
--- a/xen/tools/compat-xlat-header.py
+++ b/xen/tools/compat-xlat-header.py
@@ -105,7 +105,7 @@ def handle_field(prefix, name, id, type, fields):
         else:
             k = id.replace('.', '_')
             print("%sXLAT_%s_HNDL_%s(_d_, _s_);" % (prefix, name, k), end='')
-    elif not re_brackets.search(' '.join(fields)):
+    elif not '{' in fields:
         tag = ' '.join(fields)
         tag = re.sub(r'\s*(struct|union)\s+(compat_)?(\w+)\s.*', '\\3', tag)
         print(" \\")
@@ -290,7 +290,7 @@ def build_body(name, tokens):
     print(" \\\n} while (0)")
 
 def check_field(kind, name, field, extrafields):
-    if not re_brackets.search(' '.join(extrafields)):
+    if not '{' in extrafields:
         print("; \\")
         if len(extrafields) != 0:
             for token in extrafields:
-- 
Anthony PERARD


