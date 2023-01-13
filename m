Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5625766A6AC
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 00:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477557.740323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAG-0007Jd-Pv; Fri, 13 Jan 2023 23:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477557.740323; Fri, 13 Jan 2023 23:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAG-0007CU-Iy; Fri, 13 Jan 2023 23:08:48 +0000
Received: by outflank-mailman (input) for mailman id 477557;
 Fri, 13 Jan 2023 23:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGTAF-0006f0-Nb
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 23:08:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b387538-9397-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 00:08:46 +0100 (CET)
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
X-Inumbo-ID: 3b387538-9397-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673651327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=RhJxNddOZnuA9cAZ20nrQNAY+XT5cis1ShPg10NhTgQ=;
  b=ar9kl0ICAkpxo5bHeQ8Whdm+c0Ow8TAH91Mxi/7Sd8q0ABpwWZ6polsz
   BROa5BPFXCzGJMaZx/LAU0jRaL6RX9KtHQbg/PQSxgDg68fl0B3ZQ5YmJ
   vX0TNisyji8oWdgUN72yugyouEUXJLmRbbk9nfbyxplbzndwfWWKyaqUl
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92558110
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:R7iNCKLMS5z0TbkDFE+RO5UlxSXFcZb7ZxGr2PjKsXjdYENS12NRz
 WFJD2+Ca/+DYGrwet9zboS29ksDv5fUxtdmSQdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVlPawjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QHHh12
 tU2OQpdUVPEncObxrOBbeRF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbH5gIzh/B/
 goq+UzrPzU8O/unkQGUqF2vhPbhgyDkV4cdQejQGvlC3wTImz175ActfVmmpfi0jGauVtQZL
 FYbkgIxqYAi+UrtScPyNzW0r3KJsQQVc8ZBGO09rgeWw+zb5BjxLmoNSDJbecElnMAzTD0uk
 FSOmrvBCSR0tbyJSVqU7rqOsS6pIi8RMHMDYikfCwAC5rHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv42g5kzOiT+oopnPTyY26x/RU2bj6Rl2DKaHTYG17VnQ7d5bMZ2UCFKGu
 RA5d9O2tb5US8vXzWrUHbtLRevyjxqYDNHCqXlyBqIO3hq8wS6cPsdKwRx4JX1OP+9RLFcFf
 3TvVRNtCI57ZSX1NvIoPd7qUqzG3oC7S427C6m8gs5mJ8EoKVTZpHwGiVu4hTiFraQ6rU0o1
 X53m+6IBG1SN6loxSHeqww1ge5ynXBWKY8+qPnGI/WbPVm2PiT9pU8tagfmUwzAxPrsTP/p2
 9heLdCW7B5UTffzZCLamaZKcw9RcyNnVcGu+5UMHgJmHuaBMDhxY8I9PJt7I9A190irvrqgE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NauTXlpiVRHAyW2AgiB5Ca72tfd3SnfCVeV/nACV5aIuH
 qZtlgTpKqgndwkrDBxEM8es9N0/Kkz17e9MVgL8CAUCk1dbb1Sh0rfZksHHrUHi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:0elSxart9ZL3gN78Y++HzcsaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.97,215,1669093200"; 
   d="scan'208";a="92558110"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_* subops
Date: Fri, 13 Jan 2023 23:08:33 +0000
Message-ID: <20230113230835.29356-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230113230835.29356-1-andrew.cooper3@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Recently in XenServer, we have encountered problems caused by both
XENVER_extraversion and XENVER_commandline having fixed bounds.

More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
array, and using an unqualified 'char' which has implementation-specific
signed-ness

Provide brand new ops, which are capable of expressing variable length
strings, and mark the older ops as broken.

This fixes all issues around XENVER_extraversion being longer than 15 chars.
More work is required to remove other assumptions about XENVER_commandline
being 1023 chars long.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Jason Andryuk <jandryuk@gmail.com>

v2:
 * Remove xen_capabilities_info_t from the stack now that arch_get_xen_caps()
   has gone.
 * Use an arbitrary limit check much lower than INT_MAX.
 * Use "buf" rather than "string" terminology.
 * Expand the API comment.

Tested by forcing XENVER_extraversion to be 20 chars long, and confirming that
an untruncated version can be obtained.
---
 xen/common/kernel.c          | 62 +++++++++++++++++++++++++++++++++++++++++++
 xen/include/public/version.h | 63 ++++++++++++++++++++++++++++++++++++++++++--
 xen/include/xlat.lst         |  1 +
 xen/xsm/flask/hooks.c        |  4 +++
 4 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 4fa1d6710115..cc5d8247b04d 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -24,6 +24,7 @@
 CHECK_build_id;
 CHECK_compile_info;
 CHECK_feature_info;
+CHECK_varbuf;
 #endif
 
 enum system_state system_state = SYS_STATE_early_boot;
@@ -470,6 +471,59 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
+static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    struct xen_varbuf user_str;
+    const char *str = NULL;
+    size_t sz;
+
+    switch ( cmd )
+    {
+    case XENVER_extraversion2:
+        str = xen_extra_version();
+        break;
+
+    case XENVER_changeset2:
+        str = xen_changeset();
+        break;
+
+    case XENVER_commandline2:
+        str = saved_cmdline;
+        break;
+
+    case XENVER_capabilities2:
+        str = xen_cap_info;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return -ENODATA;
+    }
+
+    sz = strlen(str);
+
+    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
+        return -E2BIG;
+
+    if ( guest_handle_is_null(arg) ) /* Length request */
+        return sz;
+
+    if ( copy_from_guest(&user_str, arg, 1) )
+        return -EFAULT;
+
+    if ( user_str.len == 0 )
+        return -EINVAL;
+
+    if ( sz > user_str.len )
+        return -ENOBUFS;
+
+    if ( copy_to_guest_offset(arg, offsetof(struct xen_varbuf, buf),
+                              str, sz) )
+        return -EFAULT;
+
+    return sz;
+}
+
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
@@ -683,6 +737,14 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         return sz;
     }
+
+    case XENVER_extraversion2:
+    case XENVER_capabilities2:
+    case XENVER_changeset2:
+    case XENVER_commandline2:
+        if ( deny )
+            return -EPERM;
+        return xenver_varbuf_op(cmd, arg);
     }
 
     return -ENOSYS;
diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index cbc4ef7a46e6..9287b5d3ff50 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -19,12 +19,20 @@
 /* arg == NULL; returns major:minor (16:16). */
 #define XENVER_version      0
 
-/* arg == xen_extraversion_t. */
+/*
+ * arg == xen_extraversion_t.
+ *
+ * This API/ABI is broken.  Use XENVER_extraversion2 instead.
+ */
 #define XENVER_extraversion 1
 typedef char xen_extraversion_t[16];
 #define XEN_EXTRAVERSION_LEN (sizeof(xen_extraversion_t))
 
-/* arg == xen_compile_info_t. */
+/*
+ * arg == xen_compile_info_t.
+ *
+ * This API/ABI is broken and truncates data.
+ */
 #define XENVER_compile_info 2
 struct xen_compile_info {
     char compiler[64];
@@ -34,10 +42,20 @@ struct xen_compile_info {
 };
 typedef struct xen_compile_info xen_compile_info_t;
 
+/*
+ * arg == xen_capabilities_info_t.
+ *
+ * This API/ABI is broken.  Use XENVER_capabilities2 instead.
+ */
 #define XENVER_capabilities 3
 typedef char xen_capabilities_info_t[1024];
 #define XEN_CAPABILITIES_INFO_LEN (sizeof(xen_capabilities_info_t))
 
+/*
+ * arg == xen_changeset_info_t.
+ *
+ * This API/ABI is broken.  Use XENVER_changeset2 instead.
+ */
 #define XENVER_changeset 4
 typedef char xen_changeset_info_t[64];
 #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
@@ -95,6 +113,11 @@ typedef struct xen_feature_info xen_feature_info_t;
  */
 #define XENVER_guest_handle 8
 
+/*
+ * arg == xen_commandline_t.
+ *
+ * This API/ABI is broken.  Use XENVER_commandline2 instead.
+ */
 #define XENVER_commandline 9
 typedef char xen_commandline_t[1024];
 
@@ -110,6 +133,42 @@ struct xen_build_id {
 };
 typedef struct xen_build_id xen_build_id_t;
 
+/*
+ * Container for an arbitrary variable length buffer.
+ */
+struct xen_varbuf {
+    uint32_t len;                          /* IN:  size of buf[] in bytes. */
+    unsigned char buf[XEN_FLEX_ARRAY_DIM]; /* OUT: requested data.         */
+};
+typedef struct xen_varbuf xen_varbuf_t;
+
+/*
+ * arg == xen_varbuf_t
+ *
+ * Equivalent to the original ops, but with a non-truncating API/ABI.
+ *
+ * These hypercalls can fail for a number of reasons.  All callers must handle
+ * -XEN_xxx return values appropriately.
+ *
+ * Passing arg == NULL is a request for size, which will be signalled with a
+ * non-negative return value.  Note: a return size of 0 may be legitimate for
+ * the requested subop.
+ *
+ * Otherwise, the input xen_varbuf_t provides the size of the following
+ * buffer.  Xen will fill the buffer, and return the number of bytes written
+ * (e.g. if the input buffer was longer than necessary).
+ *
+ * Some subops may return binary data.  Some subops may be expected to return
+ * textural data.  These are returned without a NUL terminator, and while the
+ * contents is expected to be ASCII/UTF-8, Xen makes no guarentees to this
+ * effect.  e.g. Xen has no control over the formatting used for the command
+ * line.
+ */
+#define XENVER_extraversion2 11
+#define XENVER_capabilities2 12
+#define XENVER_changeset2    13
+#define XENVER_commandline2  14
+
 #endif /* __XEN_PUBLIC_VERSION_H__ */
 
 /*
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index d601a8a98421..762c8a77fb27 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -172,6 +172,7 @@
 ?	build_id                        version.h
 ?	compile_info                    version.h
 ?	feature_info                    version.h
+?	varbuf                          version.h
 ?	xenoprof_init			xenoprof.h
 ?	xenoprof_passive		xenoprof.h
 ?	flask_access			xsm/flask_op.h
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 78225f68c15c..a671dcd0322e 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1777,15 +1777,18 @@ static int cf_check flask_xen_version(uint32_t op)
         /* These sub-ops ignore the permission checks and return data. */
         return 0;
     case XENVER_extraversion:
+    case XENVER_extraversion2:
         return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
                             VERSION__XEN_EXTRAVERSION, NULL);
     case XENVER_compile_info:
         return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
                             VERSION__XEN_COMPILE_INFO, NULL);
     case XENVER_capabilities:
+    case XENVER_capabilities2:
         return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
                             VERSION__XEN_CAPABILITIES, NULL);
     case XENVER_changeset:
+    case XENVER_changeset2:
         return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
                             VERSION__XEN_CHANGESET, NULL);
     case XENVER_pagesize:
@@ -1795,6 +1798,7 @@ static int cf_check flask_xen_version(uint32_t op)
         return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
                             VERSION__XEN_GUEST_HANDLE, NULL);
     case XENVER_commandline:
+    case XENVER_commandline2:
         return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
                             VERSION__XEN_COMMANDLINE, NULL);
     case XENVER_build_id:
-- 
2.11.0


