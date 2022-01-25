Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2A849B2A7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260107.449339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfw-0001Hv-SM; Tue, 25 Jan 2022 11:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260107.449339; Tue, 25 Jan 2022 11:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfv-0000sC-GP; Tue, 25 Jan 2022 11:07:47 +0000
Received: by outflank-mailman (input) for mailman id 260107;
 Tue, 25 Jan 2022 11:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJag-0006Mn-2r
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 438d330b-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:02:20 +0100 (CET)
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
X-Inumbo-ID: 438d330b-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Psez3OYaVE5bX/QmUtAs61cVLP5HRuMSgeTcQjtWt8A=;
  b=MIWakkhlTvQexKEyd6d18zVg1C6dCOMOZnlyugEbEnmw3IN0Hs7rYLts
   Wt7svjCG5rMV8G5tjyvpKdI0UeAV89FzyxrB9LzPqOH+Cvoiz6eQVrWGa
   Os4uXDQno3fU/0cyN5nP6WftFGoeLuvF/U+miwP/Q/2ixtTodYohOLQSn
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FT/MaR0d5YmCjuauTWaoIIUU+cluer4T1hor8eDjOVcxBoGECRlKvZ1Gi4guz8oKtLyVLJCAJJ
 jrmLDYDrjewyXTJIM9HzHKwu9j0u1ff4ysIfC9OpctfiNUnHuywov6+Re63KN8ZBI2mfzL110d
 2w9lIT3fLwAG7QLv7Ejy3w+eXrxa1L3YiyENeyOIHeLp92EQMZdWJI+uDiE5H5s47IcEIqnwbL
 rpHKkxcH7H5fn4aIhWus2awVl59BeGIdtOSClXERhAkMw/mRG0ObJEHUcMdj2y2zex0z+ZygIq
 dJPVmXy+FrIM/MmJ3UkSRZs8
X-SBRS: 5.2
X-MesageID: 62699813
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MTBWR6om2+vA3pITA76fUCqbo8FeBmLnYhIvgKrLsJaIsI4StFCzt
 garIBmGPP6JZmLweYp2bNy3p0lQ7Jfdy9RhSAA/pH8wEylD+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ+5Ulp5EZKPpNUiAxV+UB0vBpZ68rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZBHOGs/NU+ojxtnA04ULJ8Uw+KT22CkSTN3gUOx+LIV7D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZonVmSy2o7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy19b6P8GOdBmspHFBSaQlHcVo+2OXpr9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNP9P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YyR/HNFBz3ohZPmLy8BhkkeC+F1e5fIVfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMQqLFPWo34wNB/It4wIrKTKuftjU
 Xt8WZ30ZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rNBPRXhXcylTLc2m+qR/K7/YSiI7ST5JNhMk6e57E2CTt/4Lxr6gE
 7DUchIw9WcTclWeeVzVMSgyMe22NXu9xFpiVRER0Z+T8yBLSe6SAG03LsNfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:snmHZaknWmw6mQuXbKbQo9rVVWDpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699813"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 27/30] build: rework "headers*.chk" prerequisite in include/
Date: Tue, 25 Jan 2022 11:01:00 +0000
Message-ID: <20220125110103.3527686-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Listing public headers when out-of-tree build are involved becomes
more annoying where every path to every headers needs to start with
"$(srctree)/$(src)", or $(wildcard ) will not work. This means more
repetition. ( "$(srcdir)" is a shortcut for "$(srctree)/$(src)" )

This patch attempt to reduce the amount of duplication and make better
use of make's meta programming capability. The filters are now listed
in a variable and don't have to repeat the path to the headers files
as this is added later as needed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v9:
    - reorder *-headers variables
    - call public-filter-headers on $(public-c99-headers) as well, for this I
      needed to rework $(public-c99-headers) and $(public-ansi-headers-filter)
    
    v8:
    - add prefix "public-" to newly introduced macros.
    - make use of the new "$(srcdir)" shortcut.

 xen/include/Makefile | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 5a2b4c9f65fa..fddf5a575bf6 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -39,8 +39,8 @@ cppflags-$(CONFIG_X86)    += -m32
 
 endif
 
-public-$(CONFIG_X86) := $(wildcard $(src)/public/arch-x86/*.h $(src)/public/arch-x86/*/*.h)
-public-$(CONFIG_ARM) := $(wildcard $(src)/public/arch-arm/*.h $(src)/public/arch-arm/*/*.h)
+public-$(CONFIG_X86) := $(wildcard $(srcdir)/public/arch-x86/*.h $(srcdir)/public/arch-x86/*/*.h)
+public-$(CONFIG_ARM) := $(wildcard $(srcdir)/public/arch-arm/*.h $(srcdir)/public/arch-arm/*/*.h)
 
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y))
@@ -81,10 +81,23 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
 all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
 
-PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h) $(public-y))
+public-hdrs-path := $(srcdir)/public
 
-PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
-PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
+public-list-headers = $(wildcard $1/*.h $1/*/*.h)
+public-filter-headers = $(filter-out $(addprefix $(public-hdrs-path)/, $($1-filter)), $($1))
+
+public-headers := $(call public-list-headers, $(public-hdrs-path)) $(public-y)
+public-ansi-headers := $(public-headers)
+public-c99-headers := $(addprefix $(public-hdrs-path)/, io/9pfs.h io/pvcalls.h)
+
+public-headers-filter := dom0_ops.h arch-%
+public-ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) \
+    $(patsubst $(public-hdrs-path)/%,%,$(public-c99-headers))
+public-c99-headers-filter :=
+
+PUBLIC_HEADERS := $(call public-filter-headers,public-headers)
+PUBLIC_ANSI_HEADERS := $(call public-filter-headers,public-ansi-headers)
+PUBLIC_C99_HEADERS := $(call public-filter-headers,public-c99-headers)
 
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
-- 
Anthony PERARD


