Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67DC928B85
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754382.1162833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkkA-0001Ii-KD; Fri, 05 Jul 2024 15:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754382.1162833; Fri, 05 Jul 2024 15:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkkA-0001F5-Gq; Fri, 05 Jul 2024 15:21:02 +0000
Received: by outflank-mailman (input) for mailman id 754382;
 Fri, 05 Jul 2024 15:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPkk8-0000wu-8m
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:21:00 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e964345-3ae2-11ef-bbfb-fd08da9f4363;
 Fri, 05 Jul 2024 17:20:59 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77dc08db60so42852966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:20:59 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c8ad6c6esm78100366b.49.2024.07.05.08.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:20:55 -0700 (PDT)
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
X-Inumbo-ID: 2e964345-3ae2-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720192857; x=1720797657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYsj2Y7Nqyn4D2wCHalE/98+37692yqAWg1oGpLx1Eg=;
        b=m1ZryXSD+ZNR0kckVErXDkNOX2+b9CRlopOUV6pLqG3VtuiQlaRdfe2NLQp95nfD1S
         WMs/c+yiFgzyirJNJgHX43dbdgAsyx1Nj5K4VYE2pTYjbj0GVzTkR3AzhFDrQcdgQwQ2
         afaPHN82n1+jjAD48lpsxOp/lenjsC0UdKm/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192857; x=1720797657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYsj2Y7Nqyn4D2wCHalE/98+37692yqAWg1oGpLx1Eg=;
        b=OkswTzTQHYpPXf8Z1ZXCSn8qLA5BYSzoVYAlRiD27LenpEOlIu+t4xnvzoPoK1sEnB
         v7Y75lvEVVz7XMiU84BkkWvarbsoBc6JwpzLduNQUnu8Vz/2V2RRrB8IpgQMhIwGPnLw
         rlcmST7QY6DHBGR2xPSGF8FMOEeB3szZvQnLX8D2Jdpi61p2R5ttgkskLDJnNToj88vp
         6+TZPexKHYGmpNoMfqt5LfwbmWeV5lUF+xk+8LEkXXvV8gAiDevy0v3WHlktuV4E0BT1
         7GoCdroJBnM1sLscvtv2nhS/OZizOBJ+k5X6Jp1BLOPfz2pcM8qO9tbeIEw3cL7ct23A
         mfBA==
X-Gm-Message-State: AOJu0Yxd9SLbnqfBAFCD3sPF/fRzJ85/UFq+G2efus7+Vz9Veid7bo6C
	+XKJl9KHUko+IhWIEnUAxDDdx05fdVksq7j7+IHf4VMBE0mqGlKtb5VNkeFVkrivfbPDtNLVxUK
	H
X-Google-Smtp-Source: AGHT+IFRbOGurfv59zC9qn5TLJtpqb9RPgCgMax2itDGmMfsMfHQAwkabLK81IJttLIcrCvcd+h4gQ==
X-Received: by 2002:a17:906:b352:b0:a72:6e13:a4b6 with SMTP id a640c23a62f3a-a77ba70d6d7mr348126466b.58.1720192857367;
        Fri, 05 Jul 2024 08:20:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 5/6] build: Drop libiconv as a build dependecy
Date: Fri,  5 Jul 2024 16:20:36 +0100
Message-Id: <20240705152037.1920276-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The final user was blktap2, removed in Xen 4.13.

Strip out the ./configure check for it, and stop explicitly installing it in
the FreeBSD testing.

Fixes: 2a556b63a22d ("Drop blktap2")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 .cirrus.yml        |  2 +-
 config/Tools.mk.in |  1 -
 tools/configure    | 44 --------------------------------------------
 tools/configure.ac |  2 --
 4 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index c431d8d2447d..72227916c736 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -5,7 +5,7 @@ freebsd_template: &FREEBSD_TEMPLATE
     APPEND_INCLUDES: /usr/local/include
 
   install_script: pkg install -y seabios gmake ninja bash
-                                 pkgconf python libiconv bison perl5
+                                 pkgconf python bison perl5
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git
 
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 50fbef841f3f..37c071961e57 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -61,7 +61,6 @@ LINUX_BACKEND_MODULES := @LINUX_BACKEND_MODULES@
 #System options
 ZLIB_CFLAGS         := @ZLIB_CFLAGS@
 ZLIB_LIBS           := @ZLIB_LIBS@
-CONFIG_LIBICONV     := @libiconv@
 EXTFS_LIBS          := @EXTFS_LIBS@
 CURSES_LIBS         := @CURSES_LIBS@
 TINFO_LIBS          := @TINFO_LIBS@
diff --git a/tools/configure b/tools/configure
index d160ca296202..d64818f258d0 100755
--- a/tools/configure
+++ b/tools/configure
@@ -659,7 +659,6 @@ libnl
 LIBNL3_LIBS
 LIBNL3_CFLAGS
 argp_ldflags
-libiconv
 PTHREAD_LIBS
 PTHREAD_LDFLAGS
 PTHREAD_CFLAGS
@@ -9741,49 +9740,6 @@ else $as_nop
   as_fn_error $? "Could not find zlib" "$LINENO" 5
 fi
 
-{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for libiconv_open in -liconv" >&5
-printf %s "checking for libiconv_open in -liconv... " >&6; }
-if test ${ac_cv_lib_iconv_libiconv_open+y}
-then :
-  printf %s "(cached) " >&6
-else $as_nop
-  ac_check_lib_save_LIBS=$LIBS
-LIBS="-liconv  $LIBS"
-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-/* end confdefs.h.  */
-
-/* Override any GCC internal prototype to avoid an error.
-   Use char because int might match the return type of a GCC
-   builtin and then its argument prototype would still apply.  */
-char libiconv_open ();
-int
-main (void)
-{
-return libiconv_open ();
-  ;
-  return 0;
-}
-_ACEOF
-if ac_fn_c_try_link "$LINENO"
-then :
-  ac_cv_lib_iconv_libiconv_open=yes
-else $as_nop
-  ac_cv_lib_iconv_libiconv_open=no
-fi
-rm -f core conftest.err conftest.$ac_objext conftest.beam \
-    conftest$ac_exeext conftest.$ac_ext
-LIBS=$ac_check_lib_save_LIBS
-fi
-{ printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_iconv_libiconv_open" >&5
-printf "%s\n" "$ac_cv_lib_iconv_libiconv_open" >&6; }
-if test "x$ac_cv_lib_iconv_libiconv_open" = xyes
-then :
-  libiconv="y"
-else $as_nop
-  libiconv="n"
-fi
-
-
 ac_fn_c_check_header_compile "$LINENO" "argp.h" "ac_cv_header_argp_h" "$ac_includes_default"
 if test "x$ac_cv_header_argp_h" = xyes
 then :
diff --git a/tools/configure.ac b/tools/configure.ac
index be58f06be450..0dd6d747abb5 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -444,8 +444,6 @@ AX_CHECK_PTHREAD
 AC_CHECK_LIB([yajl], [yajl_alloc], [],
     [AC_MSG_ERROR([Could not find yajl])])
 AC_CHECK_LIB([z], [deflateCopy], [], [AC_MSG_ERROR([Could not find zlib])])
-AC_CHECK_LIB([iconv], [libiconv_open], [libiconv="y"], [libiconv="n"])
-AC_SUBST(libiconv)
 AC_CHECK_HEADER([argp.h], [
 AC_CHECK_LIB([argp], [argp_usage], [argp_ldflags="-largp"])
 ], [AC_MSG_ERROR([Could not find argp])])
-- 
2.39.2


