Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE165C7DF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 21:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470704.730310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnbo-0005Eh-AZ; Tue, 03 Jan 2023 20:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470704.730310; Tue, 03 Jan 2023 20:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCnbo-0005Bq-7B; Tue, 03 Jan 2023 20:10:04 +0000
Received: by outflank-mailman (input) for mailman id 470704;
 Tue, 03 Jan 2023 20:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCnbm-0004TZ-Sh
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 20:10:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a018dc3-8ba2-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 21:10:00 +0100 (CET)
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
X-Inumbo-ID: 9a018dc3-8ba2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672776600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=JKdrRr7waCmGtSepF69W8Ba+E4SGmyEJw2vd/HieU84=;
  b=ffSbfg2XRS+ZCjyF/xrg7vJqJ8yWr+HTHFhj4+sdz3Tc2NX+mqRprw4k
   AoDajDy01nxfofsqU5pZzrrBtzup5rBynJbVgu4JIi6k3Ed3U12rG54c6
   EZMfFwaSXVJ7+fbA+1LETXLD+ZSAleBS+1gmXfufsojCbV8NsXL2MLg09
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90516757
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rqrKsqJugGU/2yUtFE+R55UlxSXFcZb7ZxGr2PjKsXjdYENShjIDm
 GAdCmGGb/bbMWqhco10bI7jpENUvJeHyYQwGgdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wRlPawjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4uOWNWr
 84XGAwBbxyyqcafxK2EYPNj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUo3SGJwLwRvHz
 o7A12LdKT1ABffc8jPbzHmto82fggnSUatHQdVU8dY12QbOlwT/EiY+TkCnqPO0jkq/XdN3K
 EEO/Ccq668o+ySDUd3VTxC+5nmesXY0WcdUEuA8wBGAzOzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0opkuRFJA5Svfz14CrX2Grq
 9yXkMQgr+wrj9ZR5aqLwVzGjwOCgrHNUTEf/AqCCwpJ8ThFTIKiYoWp733S4vBBMJuVQzG9g
 ZQUpySNxLtQVM/QzURhVM1IRej0vKjdbFUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6exwlsAM9vy/DJg4i+aihbAvHDJrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75DjuV0mXhulTuKGcCTI/GbPV22PSf9dFv4GAHWMrBRAF2s+m05D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEEXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Km2CSfcVzbNyA8AF4tNL4mxU8G0eUXFQ7A8xAejUyHt8/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:rENAKKPYHoXrDcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="90516757"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Date: Tue, 3 Jan 2023 20:09:43 +0000
Message-ID: <20230103200943.5801-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230103200943.5801-1-andrew.cooper3@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Recently in XenServer, we have encountered problems caused by both
XENVER_extraversion and XENVER_commandline having fixed bounds.

More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
array, and using an unqualified 'char' which has implementation-specific
signed-ness.

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

Tested by forcing XENVER_extraversion to be 20 chars long, and confirming that
an untruncated version can be obtained.

API/ABI wise, XENVER_build_id could be merged into xenver_varstring_op(), but
the internal infrastructure is awkward.
---
 xen/common/kernel.c          | 69 ++++++++++++++++++++++++++++++++++++++++++++
 xen/include/public/version.h | 56 +++++++++++++++++++++++++++++++++--
 xen/include/xlat.lst         |  1 +
 xen/xsm/flask/hooks.c        |  4 +++
 4 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 70e7dff87488..56bd6c6f5d9c 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -24,6 +24,7 @@
 CHECK_compile_info;
 CHECK_feature_info;
 CHECK_build_id;
+CHECK_var_string;
 #endif
 
 enum system_state system_state = SYS_STATE_early_boot;
@@ -469,6 +470,66 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
+static long xenver_varstring_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    const char *str = NULL;
+    size_t sz = 0;
+    union {
+        xen_capabilities_info_t info;
+    } u;
+    struct xen_var_string user_str;
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
+        memset(u.info, 0, sizeof(u.info));
+        arch_get_xen_caps(&u.info);
+        str = u.info;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    if ( !str ||
+         !(sz = strlen(str)) )
+        return -ENODATA; /* failsafe */
+
+    if ( sz > INT32_MAX )
+        return -E2BIG; /* Compat guests.  2G ought to be plenty. */
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
+    if ( copy_to_guest_offset(arg, offsetof(struct xen_var_string, buf),
+                              str, sz) )
+        return -EFAULT;
+
+    return sz;
+}
+
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
@@ -670,6 +731,14 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         return sz;
     }
+
+    case XENVER_extraversion2:
+    case XENVER_capabilities2:
+    case XENVER_changeset2:
+    case XENVER_commandline2:
+        if ( deny )
+            return -EPERM;
+        return xenver_varstring_op(cmd, arg);
     }
 
     return -ENOSYS;
diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index c8325219f648..cf2d2ef38b54 100644
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
@@ -88,6 +106,11 @@ typedef struct xen_feature_info xen_feature_info_t;
  */
 #define XENVER_guest_handle 8
 
+/*
+ * arg == xen_commandline_t.
+ *
+ * This API/ABI is broken.  Use XENVER_commandline2 instead.
+ */
 #define XENVER_commandline 9
 typedef char xen_commandline_t[1024];
 
@@ -103,6 +126,35 @@ struct xen_build_id {
 };
 typedef struct xen_build_id xen_build_id_t;
 
+/*
+ * Container for an arbitrary variable length string.
+ */
+struct xen_var_string {
+    uint32_t len;                          /* IN:  size of buf[] in bytes. */
+    unsigned char buf[XEN_FLEX_ARRAY_DIM]; /* OUT: requested data.         */
+};
+typedef struct xen_var_string xen_var_string_t;
+
+/*
+ * arg == xenver_string_t
+ *
+ * Equivalent to the original ops, but with a non-truncating API/ABI.
+ *
+ * Passing arg == NULL is a request for size.  The returned size does not
+ * include a NUL terminator, and has a practical upper limit of INT32_MAX for
+ * 32bit guests.  This is expected to be plenty for the purpose.
+ *
+ * Otherwise, the input xenver_string_t provides the size of the following
+ * buffer.  Xen will fill the buffer, and return the number of bytes written
+ * (e.g. if the input buffer was longer than necessary).
+ *
+ * These hypercalls can fail, in which case they'll return -XEN_Exx.
+ */
+#define XENVER_extraversion2 11
+#define XENVER_capabilities2 12
+#define XENVER_changeset2    13
+#define XENVER_commandline2  14
+
 #endif /* __XEN_PUBLIC_VERSION_H__ */
 
 /*
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index f2bae220a6df..19cef4424add 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -172,6 +172,7 @@
 ?	compile_info                    version.h
 ?	feature_info                    version.h
 ?	build_id                        version.h
+?	var_string                      version.h
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


