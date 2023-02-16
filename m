Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81B6996C6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 15:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496566.767377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSexx-0001Yp-Mh; Thu, 16 Feb 2023 14:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496566.767377; Thu, 16 Feb 2023 14:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSexx-0001WG-Ju; Thu, 16 Feb 2023 14:10:29 +0000
Received: by outflank-mailman (input) for mailman id 496566;
 Thu, 16 Feb 2023 14:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7p0N=6M=citrix.com=prvs=40464162c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSexw-0001W8-V7
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 14:10:28 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a747e650-ae03-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 15:10:25 +0100 (CET)
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
X-Inumbo-ID: a747e650-ae03-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676556625;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=INVBs69BMsEB8kgIYMnuRjPYRAGZgriwJOHjHpb11Qk=;
  b=DlTaLE1r0IO4oJWK0q92i+t0PET8Q5sW8Y5MVA/SR+ZGSDegLLtQwkxS
   V1r+11GSk/9rOo8dRzOqeOXBHe/t5fToXOrnKp5wG0CMbKfFwRylhHLbI
   40geBy3x3ZoGOhVPy8Vy7XVb3R012BIQTpBszzqK/yYN+MBAHdyGJZK3g
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96698536
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2YlQRK+m2nVhjyn1z+NZDrUDoX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GQYX2uBO/bcYjGjcopzb9nlpk8P6JSDz95lSgts/Hg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6kV5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklN/
 +EWOmktVSuuuLu5woCfacdenZoaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0EwBjJ9
 j+doQwVBDkeK4W1xhe17kmJh9+Wr3OicroQMoOBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZtVpDaCn1/3OIhzPm
 j+IngwdqYcI0/degs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meJ5Wu9B7cJZhNGiJObhKrgY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 snHIZj0VyxLUPUPIN+KqwA1i+JD+8zD7TmLGcCTI+qPj9Jym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQEKWQGOqdR7BQlTfRAG6WXe95Q/mhirflA3RwnMypb5ndscRmCSt/4OzLqWp
 y/mBBQwJZiWrSSvFDhmo0tLMNvHNauTZ1pgYUTA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:fepyCaNNqf+SMcBcT4T155DYdb4zR+YMi2TDtnoBPCC9F/by+f
 xG88566faKskdsZJhNo7G90cq7MADhHOBOkOss1N6ZNWGNhILCFvAA0WKN+UyEJ8X0ntQtqp
 uJG8JFZOEZZjJB4voTL2ODfuoI8Z2/1OSNuM+b9nFqSGhRGtNdB8USMHfkLqWzLjM2dabQ0f
 Cnl7t6TkGbCBAqR/X+PGABQ+/A4/XTjfvdEGc7Li9i0hCKkTSrrJXnEx2Uty1uLg9n8PMZ6G
 3YlA68wa2mv5iAu3jh/l6W1Y1ShNzijv1cA8CW4/JlTAnEu0KTfYF8XL/HhhAZydvfkGoCoZ
 33uhI9OMY20X/LYW2vhhPo12DboU0Twk6n80acnXzg5fP0Xyg7Dc0pv/MiTifk
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="96698536"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2] libs: Fix unstable libs build on FreeBSD, auto-generate version-script
Date: Thu, 16 Feb 2023 14:10:07 +0000
Message-ID: <20230216141007.21827-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Unfortunatly, --default-symver doesn't work with LLVM's LD, LLD.
Instead, we will generate a temporary version-script.

In order to allow regenerating the script, we'll have a different
filename. In order to check if the content is up-to-date, we'll always
generated it and compare.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 98d95437edb6 ("libs: Fix auto-generation of version-script for unstable libs")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - Replace "VERS" by "lib$(LIB_FILE_NAME)" in the new .map file.
    - Set version-script to lib$(LIB_FILE_NAME).map.tmp, like the filename
      used by the library binaries. (instead of libxen$(LIBNAME).map.tmp)
    - Write temporary file in the same directory as the target (in case the
      target is in a different directory)
    - remove temporary file generated by the new rule, in case it isn't
      removed by move-if-changed..
    - use ?= to set version-script, this mean that version-script has now a
      deferred expansion instead of immediate, hoping nothing break.
    
    CC: Jan Beulich <jbeulich@suse.com>

 tools/libs/libs.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 0e4b5e0bd0..ffb6c9f064 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -5,6 +5,7 @@
 #   MAJOR:   major version of lib (Xen version if empty)
 #   MINOR:   minor version of lib (0 if empty)
 #   version-script: Specify the name of a version script to the linker.
+#     (If empty, a temporary one for unstable library is created)
 
 LIBNAME := $(notdir $(CURDIR))
 
@@ -27,6 +28,8 @@ ifneq ($(nosharedlibs),y)
 TARGETS += lib$(LIB_FILE_NAME).so
 endif
 
+version-script ?= lib$(LIB_FILE_NAME).map.tmp
+
 PKG_CONFIG ?= $(LIB_FILE_NAME).pc
 PKG_CONFIG_NAME ?= Xen$(LIBNAME)
 PKG_CONFIG_DESC ?= The $(PKG_CONFIG_NAME) library for Xen hypervisor
@@ -72,6 +75,10 @@ headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
 	@$(call move-if-changed,$@.tmp,$@)
 
+lib$(LIB_FILE_NAME).map.tmp: FORCE
+	echo 'lib$(LIB_FILE_NAME)_$(MAJOR).$(MINOR) { global: *; };' >$(@D)/.$(@F)
+	$(call move-if-changed,$(@D)/.$(@F),$@)
+
 lib$(LIB_FILE_NAME).a: $(OBJS-y)
 	$(AR) rc $@ $^
 
@@ -81,7 +88,7 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) $(version-script)
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,$(if $(version-script),--version-script=$(version-script),--default-symver) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=$(version-script) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
@@ -120,7 +127,7 @@ TAGS:
 clean::
 	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
-	rm -f headers.chk headers.lst
+	rm -f headers.chk headers.lst lib*.map.tmp .*.tmp
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


