Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C6EB43A6D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 13:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109893.1459270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8M2-0007SI-Eu; Thu, 04 Sep 2025 11:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109893.1459270; Thu, 04 Sep 2025 11:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8M2-0007PV-B4; Thu, 04 Sep 2025 11:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1109893;
 Thu, 04 Sep 2025 11:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vqu=3P=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uu8M1-0007PP-GP
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 11:42:13 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 312caebe-8984-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 13:42:11 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 85C2A1D002A4;
 Thu,  4 Sep 2025 07:42:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 04 Sep 2025 07:42:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 07:42:07 -0400 (EDT)
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
X-Inumbo-ID: 312caebe-8984-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1756986129; x=1757072529; bh=ndzTJbL+Lm2p/b7sczaFIUrnFM/1frrJ
	UDrPdeoO0b4=; b=lOHRuLde4jBoUfOC/19uJ+hxE+fJiiwpPQpASK3AKaloYQxV
	Cb8huJOmVTRYeRBXVsNDJ3TJv9bCjaTW1AdXX7OzXabTIeBaD9XDu1JNV05KkAIf
	dbQMbCjmOAGHsRdLbQK7tv5/GSFZhd80kvol1MYF4NacNZLjO/ZcXfO6iQElIALG
	kuqP9JVTSqQUYG5Hbgl6YlbX20eBFicrkosXy6VjOYtxfZ/L/4RNlhlZDKfruZCj
	GUOlp9m0CVjSnUlHipi9tPL4GfOx1DkkgmOa1e4r4qZRQD4iZz5fpYtI/i0DydaZ
	sUPIB+tI1rvISw7uDIVFSlCIGh/UAO7+XdLp5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1756986129; x=1757072529; bh=ndzTJbL+Lm2p/b7sczaFIUrnFM/1
	frrJUDrPdeoO0b4=; b=PJHBaPkrO6161uEPmfwCG2QhcWWT30Ut484QTc6ylfsq
	sg8euX0HMqa4eXmXlpJe8evfDgN6XATKeOlzsIGXpw4rhs2WEBQ9OqX1hhOFVrfM
	K9/UbqhOTMrlz3HrUW549/id5+rItLmZKbI+FlVjM4Vtaoqa2Hxq2kfy4Y/NQK7D
	TMDoThDpwgAhXMsunwVg0rdIwkEi+cY279Zj7I/LaI2XWO1kp2nIm9k0ymF8lalo
	U0t2+m+anYRnJgTu7QhB7Tse6x6A5ux+BNa8pY1BfY0s8uJqh1MsJx4jxg2dV7dG
	9lCaGLtaEgUVqTn7TKZvBW/1XEhVF9z6tMvFA2TXng==
X-ME-Sender: <xms:EHu5aL8g0BDqnFAlw21VkWOk4wL0ew5P-8vATilZsoEDbj7ot3Jmjw>
    <xme:EHu5aElgO3_jtfU1XAqJNUYARfjuh5Qf49PzRkBRFfIqjARl20u_k6Ea9yWkBvBWH
    EQfYjvnn-mX7A>
X-ME-Received: <xmr:EHu5aIxKoqPjVj9WtsfNYw2ov6dQ5TjZIAyQI0S97wFNXNGg45XX8JKbdkvDDgz32k00nzrBXC4vpfkO6zBnWYlyLvBUmMpJPLiH6K4mJpGpBF8WKkO9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefhudelteel
    leelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgr
    rhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgu
    rdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtth
    hopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegt
    ihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:EHu5aG61ox2Cvgk-qmTmRxipTzYfg9WTwR3mXB24dzoIZ4X9bPhMPQ>
    <xmx:EHu5aAXKvmrJ8bJWSsEdeJeHdD23dmJaY2wH2sH-pz2H1hXJK1wqcQ>
    <xmx:EHu5aGJ-Xzh9W-wJ9a71b_9gzaaFvm2ff_KnT2LCAg3ozYUCVkM4Mg>
    <xmx:EHu5aKvCWMIT7wzd0sjzgZhU8HpsWnBXo-lY-gQ0chbQ_LjZi7bJzA>
    <xmx:EXu5aKXQELqYIWbAN7H6pj6mLopPcAHsMjZEqS6tbzqduy8B5hQ26DtH>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] Strip build path directories in tools and hypervisor
Date: Thu,  4 Sep 2025 13:41:40 +0200
Message-ID: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use -fdebug-prefix-map in preference to -ffile-prefix-map, as it's
available in earlier toolchain versions. But use it together with
-fmacro-prefix-map (if available) for hypervisor build, otherwise it
still contains some paths in out-of-tree builds.

The out of tree build requires -fdebug-prefix-map mapping for both source
dir and object dir - otherwise the latter is included (2 occurrences) in
xen-syms. Note the ./xen path for out of tree builds may not be strictly
correct choice, but it's consistent across the tree, and just require
starting debugger from the source, not object, directory.

Ensure to have a realpath for XEN_ROOT else it fails to substitute
properly paths in strings sections.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
- re-add chunk wrapping XEN_ROOT with realpath; simplify it with patsubst
  in hypervisor makefile
- fix cc-option-add usage
- extend commit message
- claim authorship of the patch, as no single line remained from the
  original version
- drop change in xen/arch/x86/Makefile
---
 tools/Makefile | 2 +-
 tools/Rules.mk | 2 ++
 xen/Makefile   | 6 +++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 6ecf7c0da821..80ec82a15979 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -1,4 +1,4 @@
-XEN_ROOT = $(CURDIR)/..
+XEN_ROOT = $(realpath $(CURDIR)/..)
 
 export PKG_CONFIG_DIR = $(CURDIR)/pkg-config
 
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 725c3c32e9a2..428fce094819 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -166,6 +166,8 @@ endif
 CFLAGS-$(CONFIG_X86_32) += $(call cc-option,$(CC),-mno-tls-direct-seg-refs)
 CFLAGS += $(CFLAGS-y)
 
+$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)
+
 CFLAGS += $(EXTRA_CFLAGS_XEN_TOOLS)
 
 INSTALL_PYTHON_PROG = \
diff --git a/xen/Makefile b/xen/Makefile
index 49da79e10fb4..015255971804 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -208,7 +208,7 @@ VPATH := $(srctree)
 
 export srctree objtree VPATH
 
-export XEN_ROOT := $(abs_srctree)/..
+export XEN_ROOT := $(patsubst %/xen,%,$(abs_srctree))
 
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to tools/kconfig/Makefile
@@ -412,6 +412,10 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
 CFLAGS += -Wa,--strip-local-absolute
 endif
 
+$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(abs_objtree)=./xen)
+$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(abs_srctree)=./xen)
+$(call cc-option-add,CFLAGS,CC,-fmacro-prefix-map=$(abs_srctree)=./xen)
+
 AFLAGS += -D__ASSEMBLY__
 
 $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
-- 
2.49.0


