Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E34BD8E8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275960.471989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XQ-0000zQ-S1; Mon, 21 Feb 2022 10:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275960.471989; Mon, 21 Feb 2022 10:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XQ-0000wM-Mx; Mon, 21 Feb 2022 10:03:24 +0000
Received: by outflank-mailman (input) for mailman id 275960;
 Mon, 21 Feb 2022 10:03:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nM5XO-0000em-K2
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:03:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e10aed3-92fd-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 11:03:20 +0100 (CET)
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
X-Inumbo-ID: 7e10aed3-92fd-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645437800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=XhnhyXBfcCg1IFjeQ8rcSX9ITITWwAZ7WnOmhbzucr0=;
  b=OoeXe/j0jyaDDUlXZXWfwyxq17XQzunoQGwoCmig+qDxr1/9VO8hNGT/
   mToX6T0iWMCyJp9KVMMetEp++LY61i9qxqzr4QpX4ZnE0rnPc+wikRr6K
   owXubbTu56N+n25qwGYlIo+MDKBiwNMlj5bweaj7yIvMwO8O8YIsM1CGN
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65042091
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Jsln+6rziWGtcyAd+T1qgaCfildeBmIjZRIvgKrLsJaIsI4StFCzt
 garIBnUO6yKajPzLY1waYuy9h4AuZ/Uxt9gHQs9/Cg8H3hG+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 4qq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBDqHBxbokXwtkHjBiBaF44qGdIV24rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMUycOUUeYz/7DroFnr+EhyGjdQRmk2mqnKkHxDSI0Q5+he2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34TiY9nOhgMffkCW9X5gdfJWg/+NuqE2ewCoUEhJ+fUCgvfCzh0q6WtReA
 08Z4Cwjqe417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpacMknN87QyQw0
 V2ElM+vAiZg2JW3Y3+A8rafrRupJDMYa2QFYEc5oRAtuoe55ttp11SWE4glQPXdYsDJ9S/Y8
 zyH8XYHi6cvgN8X76mF506dgxeruc2cJuIq3Tn/UmWg5wJ/QYeqYY209FTWhcp9wJalokqp5
 yZdxZXHhAwaJdTUzXHWHr1RdF28z6vdaFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4cqOepd6OxwlMAM8OgJsdiOM7JzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmbrHLdBgOJ6m3pvrY82eXwc5076uYdymVbPEetVWLdwRrtRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhRRUXX8ave8pQNHsbae1IOMDh4V5f5nONwE6Q4zv89vrqZo
 RmAtrpwlQOXaYvvcl7RNBiOqdrHAP5CkJ7MFXZyZQ3xgyB7O+5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5zo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:WtkwNakGjCxkVLRjy1Z+ifWYVffpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="65042091"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Date: Mon, 21 Feb 2022 10:02:53 +0000
Message-ID: <20220221100254.13661-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220221100254.13661-1-andrew.cooper3@citrix.com>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Coverity reports that there is a memory leak in
ioreq_server_alloc_rangesets().  This would be true if Xen's implementation of
asprintf() had glibc's return semantics, but it doesn't.

Rename to xasprintf() to reduce confusion for Coverity and other developers.

While at it, fix style issues.  Rearrange ioreq_server_alloc_rangesets() to
use a tabulated switch statement, and not to have a trailing space in the
rangeset name for an unknown range type.

Coverity-ID: 1472735
Coverity-ID: 1500265
Fixes: 780e918a2e54 ("add an implentation of asprintf() for xen")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
---
 xen/common/ioreq.c    | 16 ++++++++++------
 xen/common/vsprintf.c | 11 ++++++-----
 xen/include/xen/lib.h |  4 ++--
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 689d256544c8..5c94e74293ce 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -501,13 +501,17 @@ static int ioreq_server_alloc_rangesets(struct ioreq_server *s,
 
     for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
     {
-        char *name;
+        char *name, *type;
 
-        rc = asprintf(&name, "ioreq_server %d %s", id,
-                      (i == XEN_DMOP_IO_RANGE_PORT) ? "port" :
-                      (i == XEN_DMOP_IO_RANGE_MEMORY) ? "memory" :
-                      (i == XEN_DMOP_IO_RANGE_PCI) ? "pci" :
-                      "");
+        switch ( i )
+        {
+        case XEN_DMOP_IO_RANGE_PORT:   type = " port";   break;
+        case XEN_DMOP_IO_RANGE_MEMORY: type = " memory"; break;
+        case XEN_DMOP_IO_RANGE_PCI:    type = " pci";    break;
+        default:                       type = "";        break;
+        }
+
+        rc = xasprintf(&name, "ioreq_server %d%s", id, type);
         if ( rc )
             goto fail;
 
diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index 185a4bd5610a..b278961cc387 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -859,7 +859,7 @@ int scnprintf(char * buf, size_t size, const char *fmt, ...)
 EXPORT_SYMBOL(scnprintf);
 
 /**
- * vasprintf - Format a string and allocate a buffer to place it in
+ * xvasprintf - Format a string and allocate a buffer to place it in
  *
  * @bufp: Pointer to a pointer to receive the allocated buffer
  * @fmt: The format string to use
@@ -870,7 +870,7 @@ EXPORT_SYMBOL(scnprintf);
  * guaranteed to be null terminated. The memory is allocated
  * from xenheap, so the buffer should be freed with xfree().
  */
-int vasprintf(char **bufp, const char *fmt, va_list args)
+int xvasprintf(char **bufp, const char *fmt, va_list args)
 {
     va_list args_copy;
     size_t size;
@@ -891,7 +891,7 @@ int vasprintf(char **bufp, const char *fmt, va_list args)
 }
 
 /**
- * asprintf - Format a string and place it in a buffer
+ * xasprintf - Format a string and place it in a buffer
  * @bufp: Pointer to a pointer to receive the allocated buffer
  * @fmt: The format string to use
  * @...: Arguments for the format string
@@ -901,14 +901,15 @@ int vasprintf(char **bufp, const char *fmt, va_list args)
  * guaranteed to be null terminated. The memory is allocated
  * from xenheap, so the buffer should be freed with xfree().
  */
-int asprintf(char **bufp, const char *fmt, ...)
+int xasprintf(char **bufp, const char *fmt, ...)
 {
     va_list args;
     int i;
 
     va_start(args, fmt);
-    i=vasprintf(bufp,fmt,args);
+    i = xvasprintf(bufp, fmt, args);
     va_end(args);
+
     return i;
 }
 
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index c6987973bf88..aea60d292724 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -158,9 +158,9 @@ extern int scnprintf(char * buf, size_t size, const char * fmt, ...)
     __attribute__ ((format (printf, 3, 4)));
 extern int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
     __attribute__ ((format (printf, 3, 0)));
-extern int asprintf(char ** bufp, const char * fmt, ...)
+extern int xasprintf(char **bufp, const char *fmt, ...)
     __attribute__ ((format (printf, 2, 3)));
-extern int vasprintf(char ** bufp, const char * fmt, va_list args)
+extern int xvasprintf(char **bufp, const char *fmt, va_list args)
     __attribute__ ((format (printf, 2, 0)));
 
 long simple_strtol(
-- 
2.11.0


