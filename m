Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92677D4DC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584049.914450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fq-0004jU-Ah; Tue, 15 Aug 2023 21:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584049.914450; Tue, 15 Aug 2023 21:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fq-0004gk-6w; Tue, 15 Aug 2023 21:07:06 +0000
Received: by outflank-mailman (input) for mailman id 584049;
 Tue, 15 Aug 2023 21:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fp-0004ge-3X
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac71ad15-3baf-11ee-9b0c-b553b5be7939;
 Tue, 15 Aug 2023 23:07:01 +0200 (CEST)
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
X-Inumbo-ID: ac71ad15-3baf-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P9ncB1v6j5aDBItocB4oPyuTy7Lm3WylBJuWoQzKWS8=;
  b=e7ZXPq477sspb1lpBr2Jt3ajwXjbU8QbI6A229VcnV0Rv34tIZ0Q5dSG
   bkdDXQ/FObi9LDfF41tu1GWymRq0J1xEY17chDPbgVJh+38wkZr39J/lM
   dWwVWzweXiMJOy6WXDSx4KDsSRF48/KfT5r7rTlpA4KwfPLbiJf8QxB8I
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119453627
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Q3f6pKr+6otI6kBKMuoTbArxgXFeBmKEZRIvgKrLsJaIsI4StFCzt
 garIBmHbv+JazCjedx3Pd+/8h9X6pKDmt81TgZo+S4xF3hD85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOziRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHMNSRWxg7O7+ZvhdLdD3dwCAZn7OoxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jufrjikWU9Aa7RzzxKE6mi2l+bM2hjiWYQ1TIHl0P1Lh3Ockzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6giLxrDF/gWxCW0NTzoHY9sj3OcUbzE30
 l6Cn/vyGCdi9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbkRbnXttlVqmvgbXdGyz0w
 j2MhDgzgfMUl8Fj/6m08V3ImTuEuonCTglz4B7eGG2i8GtRaJa+Yo206XDS9ftaMJuCVV6Fo
 WQFnM6FqusJCPmltCGLWvRLI7iv6N6MKjiaillqd6TN7Bz0pSTlJ9oJpmgjegEwaJ1slSLVj
 FH7+gN24a1XbXaTRPVJPa3qE+UHnbjmGoGwPhzLVeZmbp90fQ6B2ShhY0+Mwmzg+HQRfbED1
 YSzKpj1UytDYUhz5H/vHrpGj+d3rswr7TmLLa0X2ShLxlZ3iJS9bb4eeGWDYekihE9viFWEq
 o0PXydmJvg2bQEfXsU12dRORbzpBSJhbXwTlyCwXrfaSjeK4El7V5fsLUoJIuSJZZh9mObS5
 W2aUURF0lf5jnCvAVzUOyo6Mu+zDMkv9CJT0ckQ0bGAgSRLXGpSxP1HK8tfkUcPpYSPMsKYv
 9FaIp7dU5yjuxzM+igHbImVkWCRXE3DuO56BAL8OGJXV8c5F2T0FirMIlOHGN8mUnDm6qPTY
 tSIimvmfHb0b18/UZuKMKjxkAvZULp0sLsaYnYk6+J7IC3EmLWG4QSo5hPrC6ng8Sn++wY=
IronPort-HdrOrdr: A9a23:gIaeYq5NvEtfbXWBZwPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: 9a23:r9KSeW52AH9LUz3+mdsst04zH/IhI3Dk5S3ufWDjEUdEGK2TRgrF
X-Talos-MUID: 9a23:h7scbQg0+Fn+NjYm/aAjAMMpNd9y+bWnCwc2iJQAnJG4aApzGjCzg2Hi
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="119453627"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Wei Liu" <wl@xen.org>, Julien Grall <julien@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, "Henry
 Wang" <Henry.Wang@arm.com>
Subject: [PATCH v3 02/10] xen/version: Introduce non-truncating deterministically-signed XENVER_* subops
Date: Tue, 15 Aug 2023 22:06:42 +0100
Message-ID: <20230815210650.2735671-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recently in XenServer, we have encountered problems caused by both
XENVER_extraversion and XENVER_commandline having fixed bounds.

More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
array, and using an unqualified 'char' which has implementation-specific
signed-ness.

Provide brand new ops, which are capable of expressing variable length
strings, and mark the older ops as broken.

This fixes all issues around XENVER_extraversion being longer than 15 chars.
Further work beyond just this API is needed to remove other assumptions about
XENVER_commandline being 1023 chars long.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Henry Wang <Henry.Wang@arm.com>

v3:
 * Modify dummy.h's xsm_xen_version() in the same way as flask.
v2:
 * Remove xen_capabilities_info_t from the stack now that arch_get_xen_caps()
   has gone.
 * Use an arbitrary limit check much lower than INT_MAX.
 * Use "buf" rather than "string" terminology.
 * Expand the API comment.

Tested by forcing XENVER_extraversion to be 20 chars long, and confirming that
an untruncated version can be obtained.
---
 xen/common/kernel.c          | 62 +++++++++++++++++++++++++++++++++++
 xen/include/public/version.h | 63 ++++++++++++++++++++++++++++++++++--
 xen/include/xlat.lst         |  1 +
 xen/include/xsm/dummy.h      |  3 ++
 xen/xsm/flask/hooks.c        |  4 +++
 5 files changed, 131 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f822480a8ef3..79c008c7ee5f 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -24,6 +24,7 @@
 CHECK_build_id;
 CHECK_compile_info;
 CHECK_feature_info;
+CHECK_varbuf;
 #endif
 
 enum system_state system_state = SYS_STATE_early_boot;
@@ -498,6 +499,59 @@ static int __init cf_check param_init(void)
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
@@ -711,6 +765,14 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
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
index cbc4ef7a46e6..0dd6bbcb43cc 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -19,12 +19,20 @@
 /* arg == NULL; returns major:minor (16:16). */
 #define XENVER_version      0
 
-/* arg == xen_extraversion_t. */
+/*
+ * arg == xen_extraversion_t.
+ *
+ * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
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
+ * This API/ABI is broken.  Use XENVER_capabilities2 where possible.
+ */
 #define XENVER_capabilities 3
 typedef char xen_capabilities_info_t[1024];
 #define XEN_CAPABILITIES_INFO_LEN (sizeof(xen_capabilities_info_t))
 
+/*
+ * arg == xen_changeset_info_t.
+ *
+ * This API/ABI is broken.  Use XENVER_changeset2 where possible.
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
+ * This API/ABI is broken.  Use XENVER_commandline2 where possible.
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
index 9c41948514bf..a61ba85ed0ca 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -173,6 +173,7 @@
 ?	build_id                        version.h
 ?	compile_info                    version.h
 ?	feature_info                    version.h
+?	varbuf                          version.h
 ?	xenoprof_init			xenoprof.h
 ?	xenoprof_passive		xenoprof.h
 ?	flask_access			xsm/flask_op.h
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 8671af1ba4d3..a4a920f74e6e 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -828,9 +828,12 @@ static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
         block_speculation();
         return 0;
     case XENVER_extraversion:
+    case XENVER_extraversion2:
     case XENVER_compile_info:
     case XENVER_capabilities:
+    case XENVER_capabilities2:
     case XENVER_changeset:
+    case XENVER_changeset2:
     case XENVER_pagesize:
     case XENVER_guest_handle:
         /* These MUST always be accessible to any guest by default. */
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
2.30.2


