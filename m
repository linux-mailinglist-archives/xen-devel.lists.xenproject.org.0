Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072D56BE14
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363582.594203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiG-0005V8-OH; Fri, 08 Jul 2022 16:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363582.594203; Fri, 08 Jul 2022 16:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiG-0005O5-KG; Fri, 08 Jul 2022 16:20:16 +0000
Received: by outflank-mailman (input) for mailman id 363582;
 Fri, 08 Jul 2022 16:20:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i666=XN=citrix.com=prvs=181ea21da=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o9qiF-00054g-LD
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:20:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f26d42-fed9-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 18:20:14 +0200 (CEST)
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
X-Inumbo-ID: d8f26d42-fed9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657297214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OPOL1lal7rsNW/hGS9xlZBwEc0R8DY+uuDGsN9y09zc=;
  b=Z8ftb2+CVvHOuZSmjAI88GMqsBBg2ZFj5wXeE2Sg0oQSt9bsYKv9jblb
   D4OQwXNVW0+JLd0kLYOzPbtFb5xsemx+pjNxwCk1ZkpOesGtLI3SoRAmq
   97PrCedNbxyq3tgyqMUaBLzGpGcHHQLYyOLqU8eifRw6BcgWZra6fjuLO
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74700441
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VWtQ06LMl24ztx6hFE+RzZUlxSXFcZb7ZxGr2PjKsXjdYENS1zVVn
 DEeDWiFOK2IZmv9Ldp/ao2x9x8HsJHWndI3TQZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3dY42YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NVKn6TtblcKBPLFoeMTeQJjFgJAErITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQqqBP
 5JFNWMHgBLoPj1AawY0I6oFjsSDv3b/fAN4lFSonP9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PL+37Plxm3WI23ceThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYHQMZZGeA+7ACLy4LX7hyfC2xCSSROAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcESiE9vv6zg7tshyvIQPx4K6uWsPLqTGSYL
 y+xkMQuu1kCpZdVivrhpAyY027ESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT6FWyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp3kvK5RYu1DK6OPrKih6SdkiferUmCgmbJhgjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQjt/VKONn+NxK+SIXc19z4/1w
 510YWcAoHKXuJENAVzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:I+wugKxPXK4b/no+Q5r5KrPwKL1zdoMgy1knxilNoRw8SK2lfq
 GV7YwmPHDP+VUssR0b9uxofZPwJU80lqQFmLX5X43SPjUO0VHAROoJgOffKn/bakrDH4ZmpM
 FdmsNFaOEYY2IVsS+D2njcL+od
X-IronPort-AV: E=Sophos;i="5.92,256,1650945600"; 
   d="scan'208";a="74700441"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] xen/cmdline: Extend parse_boolean() to signal a name match
Date: Fri, 8 Jul 2022 17:19:33 +0100
Message-ID: <20220708161934.10095-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220708161934.10095-1-andrew.cooper3@citrix.com>
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This will help parsing a sub-option which has boolean and non-boolean options
available.

First, rework 'int val' into 'bool has_neg_prefix'.  This inverts it's value,
but the resulting logic is far easier to follow.

Second, reject anything of the form 'no-$FOO=' which excludes ambiguous
constructs such as 'no-$foo=yes' which have never been valid.

This just leaves the case where everything is otherwise fine, but parse_bool()
can't interpret the provided string.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 xen/common/kernel.c   | 20 ++++++++++++++++----
 xen/include/xen/lib.h |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index adff2d2c77f3..74dbaf31ea70 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -272,9 +272,9 @@ int parse_bool(const char *s, const char *e)
 int parse_boolean(const char *name, const char *s, const char *e)
 {
     size_t slen, nlen;
-    int val = !!strncmp(s, "no-", 3);
+    bool has_neg_prefix = !strncmp(s, "no-", 3);
 
-    if ( !val )
+    if ( has_neg_prefix )
         s += 3;
 
     slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
@@ -286,11 +286,23 @@ int parse_boolean(const char *name, const char *s, const char *e)
 
     /* Exact, unadorned name?  Result depends on the 'no-' prefix. */
     if ( slen == nlen )
-        return val;
+        return !has_neg_prefix;
+
+    /* Inexact match with a 'no-' prefix?  Not valid. */
+    if ( has_neg_prefix )
+        return -1;
 
     /* =$SOMETHING?  Defer to the regular boolean parsing. */
     if ( s[nlen] == '=' )
-        return parse_bool(&s[nlen + 1], e);
+    {
+        int b = parse_bool(&s[nlen + 1], e);
+
+        if ( b >= 0 )
+            return b;
+
+        /* Not a boolean, but the name matched.  Signal specially. */
+        return -2;
+    }
 
     /* Unrecognised.  Give up. */
     return -1;
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index aab1fc7c4a69..05ee1e18af6b 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -89,7 +89,8 @@ int parse_bool(const char *s, const char *e);
 /**
  * Given a specific name, parses a string of the form:
  *   [no-]$NAME[=...]
- * returning 0 or 1 for a recognised boolean, or -1 for an error.
+ * returning 0 or 1 for a recognised boolean.  Returns -1 for general errors,
+ * and -2 for "not a boolean, but $NAME= matches".
  */
 int parse_boolean(const char *name, const char *s, const char *e);
 
-- 
2.11.0


