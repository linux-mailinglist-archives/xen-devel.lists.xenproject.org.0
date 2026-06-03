Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R44QGarrH2qtsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F85635E2E
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=R9bwjgl7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1325896.1591260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhM6-0003Uv-Eh; Wed, 03 Jun 2026 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325896.1591260; Wed, 03 Jun 2026 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhM6-0003Nc-Ae; Wed, 03 Jun 2026 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 1325896;
 Wed, 03 Jun 2026 08:53:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUhM4-0003L5-Bh
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:53:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhM3-006GVP-OU
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:53:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1feb8e-e002-0a2a0a5209dd-0a2a450ac73c-26
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:39 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1feb93-56b3-0a2a450a0019-d155802da550-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:39 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so3652785e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:53:39 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b7c6b966sm24070335e9.2.2026.06.03.01.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 01:53:38 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780476819; x=1781081619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w38Yjl39w+6P4RkuP/+W/4L2yeNf72EBMIuJEUD/P7o=;
        b=R9bwjgl7k1Xl5kEe1Q6UPbX2RhhBioOCLWyOXTZZn/zi76FHc99LYcR49+wIuX1W8q
         rA1B3ARTsQcvBDhhzitKUt+HmbWRA528TRAEkbYse5fPTbyTwRkFZ6JnsapKeOkzXamf
         WinV+Y2+hpWSuSkH90h2SPJabNQB/6w2Bt1hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476819; x=1781081619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w38Yjl39w+6P4RkuP/+W/4L2yeNf72EBMIuJEUD/P7o=;
        b=WIWkHERV33QAV1EnILeqGrP+PugI7OyUJIFaWSeBYyxtPgk0UITuGomqygE+VtIYag
         iKzzZ5j1jHjGWtW/Usn//L6WKhCIU4U+FICSe0l+Ed01/J3jr5sBiMkIzm7uF6vmVg6H
         Ml7w9Z07QDnWysV/4IxQ+CKgHqhmXfibsaVdxtUnDLQnEwkt/Nqmn/0NMXOOr7oa9mcs
         OBj0vwVrBrtAqwIXIiguiH+BKW1zJMqRmCYre/5GxpGb8Alnznv93HBErp9XYO7HBO7+
         vCrtlv6Qk5DmyzQ2E058fO1UhNEcmRPS1SnEDkjqoTyT4kX97jBcrYUjRYnmCulUDM9I
         dJ0Q==
X-Gm-Message-State: AOJu0Yy0UEIk/Hy7J//mIS2MSDca6HP+Vtn+Bv5TjMq/qfnsEx/L91OL
	YgyhebnVo+HZn9Lyr+AlnWZ56zPy9StjB2PhEkjgC6MiYU7bPYBJHbwwJcvivqjldPK5hzx/4M+
	6lL3F
X-Gm-Gg: Acq92OEdDO66Nu3rhUBCnntiY0kxe7wBIjSNUQ+AyN+FdvJqhgO/hp45l8VRTh4Ikju
	l9kpAVfWZDVXD+Wb45z001KL/OhCkO0TxqZ+4e2HwlHuPOqk5kS0wqmNx64xKMPRddb+uuTsI4t
	BpiBgMEb0/6rAR+eQQ8nPY36iIE6R7/I5gUyY++eYJHe+x9GAi94qqJDUZu+wt+XAcJ/tUkE2Q6
	WhJFLz+VmSyYqyJHQ1TXKwZoV6hiQZv2yk+Z2RsJ8VUXq6ygEXPsxBBf5B1xGI6Ha02tiTBxtg3
	2SiFyXJCYkBprt+Uz1NFNuCDsGeRiHDLLLkcOKY8NfY+pX+OGufaYfzXWV78gJwHOwcei5cMcLX
	uXUNDmeIOX1D866c1NPlnd/c0a1vRsZng/hFKXNKMCgS3gebLGzpY7EngprhmPNHNgzxi5l64Zd
	f1KxM6DQzf5LIamK0hViX3RSDIxOxNleApHB6lqAHKhVQLtcwYsrwCmKsUM6ijxfRGoKrJIcdoY
	4cN3yxL6bbiDzw=
X-Received: by 2002:a05:600c:8b2a:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490b614df8dmr29300895e9.13.1780476818608;
        Wed, 03 Jun 2026 01:53:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] tools/configure: Detect the presence of liblz4
Date: Wed,  3 Jun 2026 09:53:30 +0100
Message-Id: <20260603085331.2704108-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780476819-70F618B7-EB8F556F/10/73395122804
X-purgate-type: spam
X-purgate-size: 5741
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1F85635E2E

As with other compression libraries, group liblz4 into ZLIB_{CFLAGS,LIBS}.

Add the packages to the Debian Trixie build containers for coverage.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Rebuild the containers when pushed.
---
 automation/build/debian/13-arm64v8.dockerfile |  1 +
 automation/build/debian/13-x86_64.dockerfile  |  1 +
 tools/configure                               | 79 +++++++++++++++++++
 tools/configure.ac                            |  4 +
 4 files changed, 85 insertions(+)

diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
index b9062ee8b443..ee9bb841eb92 100644
--- a/automation/build/debian/13-arm64v8.dockerfile
+++ b/automation/build/debian/13-arm64v8.dockerfile
@@ -28,6 +28,7 @@ RUN <<EOF
         wget
         # libxenguest dombuilder
         libbz2-dev
+        liblz4-dev
         liblzma-dev
         liblzo2-dev
         libzstd-dev
diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 2c6c9d4a5098..e0a722595233 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -29,6 +29,7 @@ RUN <<EOF
         wget
         # libxenguest dombuilder
         libbz2-dev
+        liblz4-dev
         liblzma-dev
         liblzo2-dev
         libzstd-dev
diff --git a/tools/configure b/tools/configure
index 6f69b0b52634..bf14864cfb03 100755
--- a/tools/configure
+++ b/tools/configure
@@ -669,6 +669,8 @@ PTHREAD_CFLAGS
 EXTFS_LIBS
 ZLIB_LIBS
 ZLIB_CFLAGS
+liblz4_LIBS
+liblz4_CFLAGS
 libzstd_LIBS
 libzstd_CFLAGS
 FETCHER
@@ -885,6 +887,8 @@ pixman_CFLAGS
 pixman_LIBS
 libzstd_CFLAGS
 libzstd_LIBS
+liblz4_CFLAGS
+liblz4_LIBS
 libjsonc_CFLAGS
 libjsonc_LIBS
 LIBNL3_CFLAGS
@@ -1638,6 +1642,9 @@ Some influential environment variables:
               C compiler flags for libzstd, overriding pkg-config
   libzstd_LIBS
               linker flags for libzstd, overriding pkg-config
+  liblz4_CFLAGS
+              C compiler flags for liblz4, overriding pkg-config
+  liblz4_LIBS linker flags for liblz4, overriding pkg-config
   libjsonc_CFLAGS
               C compiler flags for libjsonc, overriding pkg-config
   libjsonc_LIBS
@@ -9458,6 +9465,78 @@ printf "%s\n" "yes" >&6; }
      ZLIB_LIBS="$ZLIB_LIBS $libzstd_LIBS"
 fi
 
+pkg_failed=no
+{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for liblz4" >&5
+printf %s "checking for liblz4... " >&6; }
+
+if test -n "$liblz4_CFLAGS"; then
+    pkg_cv_liblz4_CFLAGS="$liblz4_CFLAGS"
+ elif test -n "$PKG_CONFIG"; then
+    if test -n "$PKG_CONFIG" && \
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"liblz4\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "liblz4") 2>&5
+  ac_status=$?
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; then
+  pkg_cv_liblz4_CFLAGS=`$PKG_CONFIG --cflags "liblz4" 2>/dev/null`
+		      test "x$?" != "x0" && pkg_failed=yes
+else
+  pkg_failed=yes
+fi
+ else
+    pkg_failed=untried
+fi
+if test -n "$liblz4_LIBS"; then
+    pkg_cv_liblz4_LIBS="$liblz4_LIBS"
+ elif test -n "$PKG_CONFIG"; then
+    if test -n "$PKG_CONFIG" && \
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"liblz4\""; } >&5
+  ($PKG_CONFIG --exists --print-errors "liblz4") 2>&5
+  ac_status=$?
+  printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; then
+  pkg_cv_liblz4_LIBS=`$PKG_CONFIG --libs "liblz4" 2>/dev/null`
+		      test "x$?" != "x0" && pkg_failed=yes
+else
+  pkg_failed=yes
+fi
+ else
+    pkg_failed=untried
+fi
+
+
+
+if test $pkg_failed = yes; then
+   	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+
+if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
+        _pkg_short_errors_supported=yes
+else
+        _pkg_short_errors_supported=no
+fi
+        if test $_pkg_short_errors_supported = yes; then
+	        liblz4_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "liblz4" 2>&1`
+        else
+	        liblz4_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "liblz4" 2>&1`
+        fi
+	# Put the nasty error message in config.log where it belongs
+	echo "$liblz4_PKG_ERRORS" >&5
+
+	true
+elif test $pkg_failed = untried; then
+     	{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: no" >&5
+printf "%s\n" "no" >&6; }
+	true
+else
+	liblz4_CFLAGS=$pkg_cv_liblz4_CFLAGS
+	liblz4_LIBS=$pkg_cv_liblz4_LIBS
+        { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+printf "%s\n" "yes" >&6; }
+	ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZ4 $liblz4_CFLAGS"
+     ZLIB_LIBS="$ZLIB_LIBS $liblz4_LIBS"
+fi
+
 
 
 ac_fn_c_check_header_compile "$LINENO" "ext2fs/ext2fs.h" "ac_cv_header_ext2fs_ext2fs_h" "$ac_includes_default"
diff --git a/tools/configure.ac b/tools/configure.ac
index ecd45e782eb8..74b9f56025cb 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -403,6 +403,10 @@ PKG_CHECK_MODULES([libzstd], [libzstd],
     [ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_ZSTD $libzstd_CFLAGS"
      ZLIB_LIBS="$ZLIB_LIBS $libzstd_LIBS"],
     [true])
+PKG_CHECK_MODULES([liblz4], [liblz4],
+    [ZLIB_CFLAGS="$ZLIB_CFLAGS -DHAVE_LZ4 $liblz4_CFLAGS"
+     ZLIB_LIBS="$ZLIB_LIBS $liblz4_LIBS"],
+    [true])
 AC_SUBST([ZLIB_CFLAGS])
 AC_SUBST([ZLIB_LIBS])
 AX_CHECK_EXTFS
-- 
2.39.5


