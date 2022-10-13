Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5C5FD9DB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422029.667912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuC-0004sF-L9; Thu, 13 Oct 2022 13:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422029.667912; Thu, 13 Oct 2022 13:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuC-0004oj-E5; Thu, 13 Oct 2022 13:05:44 +0000
Received: by outflank-mailman (input) for mailman id 422029;
 Thu, 13 Oct 2022 13:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixuA-0002ig-If
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc557b41-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:05:41 +0200 (CEST)
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
X-Inumbo-ID: bc557b41-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/gk/zrc7mUau8n7u3084orMZkSKyjao6ioLVB6VKyZU=;
  b=hSmZqwzn5ISahHFWLEg2zgH5M1Z7tuvlpzPbOR4n1zr6XunF8j/QK17d
   Amp4Y2uT2MUCkEfm0kfJ2l4/9H3CQKQqVvM8kYk+Ka6FEDggnNHVHmnvT
   daUg7eEFjolmTvb9ya1zoRC6leMotFLpY1H01/lrQcA5NDCXTqLvbyAna
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 85173820
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q0ylEKB239wVMxVW/yzjw5YqxClBgxIJ4kV8jS/XYbTApD1z1j1Um
 DQYXmjQM/fcYGv3L9l+b463oUoAup7SmIM2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2p4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kIYrY8otsqQl1Uy
 uQ0GSoxdxKOv+GflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+OiwaYWOKobSLSlTtmG+t
 jzIon3LPhM1PtK8ljS5rXSxiNaayEsXX6pNTeblp5aGmma7xGMJDwYNfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYUzCzZPMkG7xBTIqNUMzfxMdTwY94PC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWG3DaD/LF7rVxBHkJPmqgBiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+S4m7DqiMNoQRO8IZmOq7EMZGPBf44owQuBJ0zfFX1
 WmzK65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOPGDEN5vJ9fbzNimMhls/7fyOgUm
 v4DX/a3J+J3CbGuP3aGr9BJcDjn7xETXPjLliCeTcbbSiIOJY3rI6O5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:uMMOjqOXaAcqjcBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="85173820"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v5 09/17] libs: Avoid exposing -Wl,--version-script to other built library
Date: Thu, 13 Oct 2022 14:05:05 +0100
Message-ID: <20221013130513.52440-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

$(SHLIB_LDFLAGS) is used by more targets that the single targets that
except it (libxenfoo.so.X.Y). There is also some dynamic libraries in
stats/ that uses $(SHLIB_LDFLAGS) (even if those are never built), and
there's libxenlight_test.so which doesn't needs a version script.

Also, libxenlight_test.so might failed to build if the version script
doesn't exist yet.

For these reasons, avoid changing the generic $(SHLIB_LDFLAGS) flags,
and add the flag directly on the command line.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/libs/libs.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index e47fb30ed4..3eb91fc8f3 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -12,8 +12,6 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 endif
 MINOR ?= 0
 
-SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
-
 CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
@@ -85,7 +83,7 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=libxen$(LIBNAME).map $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
-- 
Anthony PERARD


