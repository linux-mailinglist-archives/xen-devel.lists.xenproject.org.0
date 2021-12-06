Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A046A256
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239502.415301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTA-0006XF-QU; Mon, 06 Dec 2021 17:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239502.415301; Mon, 06 Dec 2021 17:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTA-0006SP-J1; Mon, 06 Dec 2021 17:08:04 +0000
Received: by outflank-mailman (input) for mailman id 239502;
 Mon, 06 Dec 2021 17:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHP5-0005ta-6k
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a879e1f-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:49 +0100 (CET)
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
X-Inumbo-ID: 7a879e1f-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BHKgdcCFIcw2aiewzH6pZ1uVlVigf4URrqTZQIJcZwI=;
  b=aWAlpeRPquChvIDdxnpX6wHzzAIuOAEFMGyzOUu1kshr98uix1niOO02
   55uxkwsBg3xRDiVDXqp2nIIKi2U76ClZ4lWm0xk44Ejxdsa5104jU/pNJ
   aalJ27VffPoTTKSKKCGfT4i4vU8i4IhyQ3jmmfwWpS8x2eZLOPfuYkvJ9
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: awMe2UEYGgJ6YVSNJTcx4uOQBPZtcMozEo6Gb0XSc5/gjJpI/J1x5WSIwh5RKy0Sst6+qLRvHY
 +kvYfuB/0MtGUz2UzWeeoaJSPcFPAM6+dV82njyVa/NqTe0mV2aiTfMhqadskkpyaY6mSgk2VB
 qsXkg38jpOkufAuoZeWpSIJh9IYqG1RIsol4Db+vogdA9jzn2r5aqrglEFYLgcLcOH1HccN5x6
 BF5SsHhzI6K9Yh3I5cXWZ7XQ0PT2n9/Oilfr1yT4gl7EArt4aoZPK0LYMuB44+tE6dUIgptUGn
 25SxMsOVel72n0dmof0BCmui
X-SBRS: 5.1
X-MesageID: 59324094
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:o7nY7azFhEaYtWPCfgh6t+eswSrEfRIJ4+MujC+fZmUNrF6WrkVSy
 WYeDD+BO6mNNzHwe95yPN+y/RhX6JfWm9FmGlNrpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wbZn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4Eo+
 e1ui4eecgwKFIqLnu88bDBUFRgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25EVR6qGN
 pZxhTxHSBXyXw1kKkksBbUejOjr33PdfRYCtwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ6fpCkFCVgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xD24YTjlHeZo+udU/XzAC2
 VqAntevDjtq2JWUVnC15rqStSm1OyUeMSkFfyBscOcey4C9+sdp1EuJF4s9Vv7u5jHoJd3u6
 2HTnRAdua49tsUo/YL8+1vmvBugoKGcG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7caGWE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9/oYyjJ5fK5fTgAahwyRoAUCnSWXFXYlByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1nXBhnzKOH8qlkETPPV+iiJi9E+1t3LymNL9R0U95iF+Nr
 4Y32zWilX2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClEOJY3VMNeImelJU9U8x8x9z76Ul
 lngCh4w4Aeu3hXvdFTVAk2PnZuyBP6TW1pgZndyVbtpslB+CbuSAFA3K8FqIOJ5rbM7lpaZj
 ZAtIq29PxiGcRyfkxx1UHU3hNAKmM2DiV3cMiy7TiI4epI8FQXF9sW9Jlnk9TUUDzrxvsw7+
 uXy2gTeSJsFZgJjEMeJN67/kwLv5SAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkSrMsHkdTE2TBw6yxMC3WojiqzYNaCb7adjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3quYDnAp+HXjNY1C6MZ9aIyGLjZtVq6lA5r5Fog/qC
 EiBzcZXZOeSM8T/HV9PeAd8Nraf1esZkyX55OguJBmo/zd++beKXBkAPxSIjyABfrJ5PJl8n
 LUksc8SrQe+lgArIpCNiSUNrzaAKXkJUqMGsJAGAdC01lp3mw8aOZGMWDXr5JyvaslXNhh4K
 zCZs6POmrBAyxeQaHE0D3XMgbJQiJlmVMqmF7Pey4BlQub4u8I=
IronPort-HdrOrdr: A9a23:N+xA662ldZKWd4fSpzOQyQqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59324094"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 27/57] tools/fuzz/libelf: rework makefile
Date: Mon, 6 Dec 2021 17:02:10 +0000
Message-ID: <20211206170241.13165-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rename ELF_LIB_OBJS to LIBELF_OBJS as to have the same name as in
libs/guest/.

Replace "-I" by "-iquote".

Remove the use of "vpath". It will not works when we will convert this
makefile to subdirmk. Instead, we create symlinks to the source files.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitignore                 |  1 +
 tools/fuzz/libelf/Makefile | 21 ++++++++++-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/.gitignore b/.gitignore
index c31fa9b841..4267bb4dee 100644
--- a/.gitignore
+++ b/.gitignore
@@ -197,6 +197,7 @@ tools/flask/utils/flask-setenforce
 tools/flask/utils/flask-set-bool
 tools/flask/utils/flask-label-pci
 tools/fuzz/libelf/afl-libelf-fuzzer
+tools/fuzz/libelf/libelf-*.c
 tools/fuzz/x86_instruction_emulator/asm
 tools/fuzz/x86_instruction_emulator/afl-harness
 tools/fuzz/x86_instruction_emulator/afl-harness-cov
diff --git a/tools/fuzz/libelf/Makefile b/tools/fuzz/libelf/Makefile
index 9eb30ee40c..9211f75951 100644
--- a/tools/fuzz/libelf/Makefile
+++ b/tools/fuzz/libelf/Makefile
@@ -1,25 +1,24 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-# libelf fuzz target
-vpath %.c ../../../xen/common/libelf
-CFLAGS += -I../../../xen/common/libelf
-ELF_SRCS-y += libelf-tools.c libelf-loader.c libelf-dominfo.c
-ELF_LIB_OBJS := $(patsubst %.c,%.o,$(ELF_SRCS-y))
+LIBELF_OBJS := libelf-tools.o libelf-loader.o libelf-dominfo.o
 
-$(patsubst %.c,%.o,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
-
-$(ELF_LIB_OBJS): CFLAGS += -DFUZZ_NO_LIBXC $(CFLAGS_xeninclude)
+CFLAGS += -iquote ../../../xen/common/libelf
+$(LIBELF_OBJS): CFLAGS += -Wno-pointer-sign
+$(LIBELF_OBJS): CFLAGS += -DFUZZ_NO_LIBXC $(CFLAGS_xeninclude)
 
 libelf-fuzzer.o: CFLAGS += $(CFLAGS_xeninclude)
 
-libelf.a: libelf-fuzzer.o $(ELF_LIB_OBJS)
+$(LIBELF_OBJS:.o=.c): libelf-%.c: ../../../xen/common/libelf/libelf-%.c FORCE
+	ln -nsf $< $@
+
+libelf.a: libelf-fuzzer.o $(LIBELF_OBJS)
 	$(AR) rc $@ $^
 
 .PHONY: libelf-fuzzer-all
 libelf-fuzzer-all: libelf.a libelf-fuzzer.o
 
-afl-libelf-fuzzer: afl-libelf-fuzzer.o libelf-fuzzer.o $(ELF_LIB_OBJS)
+afl-libelf-fuzzer: afl-libelf-fuzzer.o libelf-fuzzer.o $(LIBELF_OBJS)
 	$(CC) $(CFLAGS) $^ -o $@
 
 # Common targets
@@ -31,7 +30,7 @@ distclean: clean
 
 .PHONY: clean
 clean:
-	rm -f *.o .*.d *.a *-libelf-fuzzer
+	rm -f *.o .*.d *.a *-libelf-fuzzer $(LIBELF_OBJS:.o=.c)
 
 .PHONY: install
 install: all
-- 
Anthony PERARD


