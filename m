Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DE45DB79
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231240.400104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5Y-0006x9-6O; Thu, 25 Nov 2021 13:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231240.400104; Thu, 25 Nov 2021 13:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5Y-0006un-2C; Thu, 25 Nov 2021 13:47:00 +0000
Received: by outflank-mailman (input) for mailman id 231240;
 Thu, 25 Nov 2021 13:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0n-0007NX-5T
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7939a6f8-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:42:04 +0100 (CET)
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
X-Inumbo-ID: 7939a6f8-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oFeKa3n2Me2dmtKknD0wmyFv64+zX/Oc/3RcLG01aY8=;
  b=QKDeCyBWJqiy0VH36rEbjbG6+kiJUQ0rdC/NklQk55pB8AxMGG/VOfEK
   8abQPNEnqOnfzXTWnmFGjJkVOu6OJvdDWZF3mMWENxyyKVzyLOM+a6tNs
   y2eP2CKSwUJS0bOMWolSTzuPiHGvUGbflp683PxRNNtWL0V2waWgA+TR6
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bQI5etgoOvWX87AC6g3ns5eeLZQ2U8w7g1Xlwa45ec0xy8WLASwHxsxDlZlvEWaR4Aw0EDypYS
 W8qUid2ThOeZ5VkE1keU8gL4k0D/S6QU+bYNBBAw+UlXAKCDRHfjzushR7cl6x521ujgtNhBbP
 udAyfY9oY3qSfn2Hj53oN7eUrA+A6Hg3DhFLABTYFYq2GjwFbFiL6HwRFOeMqQJK5LgxZ9arQO
 A4c/3m4n8rGq4xbxX/jvwHheQVjBX1H8S2S8BL9xFfARZp07tMjuvJEvucD+hk9g0YWtM9JrsZ
 Zs1KdaqylmAKMoUGiCPz6Noo
X-SBRS: 5.1
X-MesageID: 58637890
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lYongKIXb5NdWn7jFE+RRpIlxSXFcZb7ZxGr2PjKsXjdYENS3zAHx
 mpJUG7XaPfZZTShft91b9y+9hxX78Xcz9A2HgNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2mx9tg8
 9pXt6avYjV2Y5X1k7UebQFhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpg2JsRTaeGD
 yYfQSV2cUzdRBFLAQYSI85jo+yDvX6nbzIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yw+fGmgDSC8HcNE8vdU6bTMv3
 16N2djuAFRHsaKXYWKQ8K+OqjG/MjRTKnUNDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxnfm
 zublyckhY8MpvxUip2C9gHEvSqV882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 iFaxpH2APQmSMjUyXfTGLll8KSBvq7daFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4crPOpd6OxwlMAM8OgJsdiOM7JzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmHpGLhMge96nH5vrY82eXwc5075uYdymVbPEetVWLdwRrxRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhRRUXX8ave8pQNHsbae1IOMDh4V5f5nONwE6Q4zv89vrqZo
 RmAtrpwlQOXaYvvcl7RNBiOqdrHAP5CkJ7MFXB2YAvzhSF8Od3HAWV2X8JfQITLPddLlZZcJ
 8Tpse3ZahiWYjiYqTkbc7fnq4luKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSlQwFtvSZdKu00i14SoXltVtUhaaOdJUYkjtrtRncnSjkv8tLsgQAhzf3T/Gh
 R2OCBIVqLCV8Y84+dXEn46eqIKtH7csF0ZWBTCDv723KTPb7iyoxooZCLSEejXUVWXV/qS+Z
 LoKk6GgYaNfxFsT6thyCbdmy6469uDDnb4Cw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZlzSOv/Q4JEL2uH1+8LadCBgAOhCNjGpWLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q5sMAHYvmqgs30VUTM5XTBxj/7IyLd9gRYFIhJ
 SWZhfaairlRrqYYn6HfyZQZMTJhuKkz
IronPort-HdrOrdr: A9a23:3+e+N68GIEyVRw/8rYRuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58637890"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"George Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v8 41/47] WIP, no-VPATH: build object from generated C files
Date: Thu, 25 Nov 2021 13:40:00 +0000
Message-ID: <20211125134006.1076646-42-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

we need to tell that the efi source files are "generated"

Maybe listing generated sources would be better, and then we can
automaticaly select the right rule.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk                 | 9 ++++++++-
 xen/common/efi/efi_common.mk | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 45d2b72158b8..44af005fd57e 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -24,6 +24,8 @@ include $(srctree)/scripts/Kbuild.include
 obj-y :=
 lib-y :=
 targets :=
+## targets made from generated sources
+gen-objs-c :=
 subdir-y :=
 CFLAGS-y :=
 AFLAGS-y :=
@@ -96,6 +98,7 @@ targets         := $(addprefix $(obj)/,$(targets))
 lib-y           := $(addprefix $(obj)/,$(lib-y))
 obj-y           := $(addprefix $(obj)/,$(obj-y))
 obj-bin-y       := $(addprefix $(obj)/,$(obj-bin-y))
+gen-objs-c      := $(addprefix $(obj)/,$(gen-objs-c))
 subdir-y        := $(addprefix $(obj)/,$(subdir-y))
 nocov-y         := $(addprefix $(obj)/,$(nocov-y))
 noubsan-y       := $(addprefix $(obj)/,$(noubsan-y))
@@ -242,7 +245,11 @@ define rule_cc_o_c
     $(call cmd,objcopy_fix_sym)
 endef
 
-$(obj)/%.o: $(src)/%.c FORCE
+ifdef building_out_of_srctree
+$(gen-objs-c): $(obj)/%.o: $(obj)/%.c FORCE
+	$(call if_changed_rule,cc_o_c)
+endif
+$(obj)/%.o: $(srctree)/$(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 quiet_cmd_cc_o_S = CC      $@
diff --git a/xen/common/efi/efi_common.mk b/xen/common/efi/efi_common.mk
index d059bb30afa5..232cb508ee85 100644
--- a/xen/common/efi/efi_common.mk
+++ b/xen/common/efi/efi_common.mk
@@ -1,6 +1,9 @@
 EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
 EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
+# common-efi-objs := boot.c  compat.c  ebmalloc.c  pe.c  runtime.c
+gen-objs-c := boot.o compat.o ebmalloc.o pe.o runtime.o
+
 CFLAGS-y += -fshort-wchar
 CFLAGS-y += -iquote $(srctree)/common/efi
 CFLAGS-y += -iquote $(srcdir)
-- 
Anthony PERARD


