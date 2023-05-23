Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D270E20C
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538601.838714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VAd-0006ii-AZ; Tue, 23 May 2023 16:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538601.838714; Tue, 23 May 2023 16:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1VAd-0006de-44; Tue, 23 May 2023 16:47:35 +0000
Received: by outflank-mailman (input) for mailman id 538601;
 Tue, 23 May 2023 16:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V2Q-0006Dr-EE
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:39:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5365c366-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:39:04 +0200 (CEST)
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
X-Inumbo-ID: 5365c366-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CUr6Ia8hka4MDdYyEkCHkmCAcxvFP9VRnjNhVX7Kyj0=;
  b=QrX94MT2nLvMK7ov1dkRAEoc7v/E8vKdoyPHO/DszDViYpBAmSD6Jnx2
   f8AzT8AZAVMeNCO73ZuztKU1D+10yFDHPwjlIOZRyuzDPY+JhihJ/tBbU
   roLvkU/BUpSneGTVrFzSHhEWn10AsxXKZYkt9nL0o+oSTXOQOflXiJa3c
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108859061
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:D/UT8aIYpTbgJanbFE+R4pUlxSXFcZb7ZxGr2PjKsXjdYENS1DMPm
 mZKCm7Qb62PZGXxfohyPNy2oUpX68fUy4JmSAtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HX2xi/
 uEJFgscMEGmitOsm7uXds1V05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZUFwxfA+
 DuuE2LREChKNMSNlyi86V2zrLXGnir0c78NLejtnhJtqALKnTFCYPEMbnOguuWwgEO6X9NZK
 mQX9zAooKx081akJvH/Qhm5rXisrhMaHd1KHIUS9wWl2qfSpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnF4g5VvTv15usRG+2m
 mrRxMQju1kNpf5V2omw4EH5uCPy973EfxRu7ynrelvwu2uVe7WZT4Cv7FHa69NJI4CYUkSNs
 RA4piSO0AwdJcrTzXLQGY3hCJnsvq/Ya2OE3TaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C6TbwJtdiONLKih6SdkyfZlByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1lnxhlTuPHsGil0jPPV+iiJm9EO1tDbdzRrphsPPsTPv9q
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOK0aX/d/L7bZSiI/QTFJNhMk6e95E2CTt/gPx7igE
 7DUchMw9WcTclWccV/bNS87OOKzNXu9xFpiVRER0Z+T8yBLSe6SAG03J/PboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:xHAr66iFYpiKja7gCBVG0uA6YXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-Talos-CUID: 9a23:LWJsim4kRj7cSE9xI9ssxBAZNss4Y0Pm3SmBBkKJEz1gZIGxcArF
X-Talos-MUID: 9a23:rxKyPgjR7Zoc9PX/l/qAdcMpJv4447y8VlI0iroZkZONNiV/EAqCtWHi
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="108859061"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 10/15] build: rename $(AFLAGS) to $(XEN_AFLAGS)
Date: Tue, 23 May 2023 17:38:06 +0100
Message-ID: <20230523163811.30792-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We don't want the AFLAGS from the environment, they are usually meant
to build user space application and not for the hypervisor.

Config.mk doesn't provied any $(AFLAGS) so we can start a fresh
$(XEN_AFLAGS).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile         | 10 ++++++----
 xen/arch/x86/arch.mk |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 127c0e40b5..c4a83fca76 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -258,6 +258,8 @@ export KBUILD_DEFCONFIG := $(ARCH)_defconfig
 # reparsing Config.mk by e.g. arch/x86/boot/.
 export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
 
+XEN_AFLAGS =
+
 # CLANG_FLAGS needs to be calculated before calling Kconfig
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS :=
@@ -412,9 +414,9 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
 CFLAGS += -Wa,--strip-local-absolute
 endif
 
-AFLAGS += -D__ASSEMBLY__
+XEN_AFLAGS += -D__ASSEMBLY__
 
-$(call cc-option-add,AFLAGS,CC,-Wa$(comma)--noexecstack)
+$(call cc-option-add,XEN_AFLAGS,CC,-Wa$(comma)--noexecstack)
 
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 
@@ -425,7 +427,7 @@ CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
 # Most CFLAGS are safe for assembly files:
 #  -std=gnu{89,99} gets confused by #-prefixed end-of-line comments
 #  -flto makes no sense and annoys clang
-AFLAGS += $(filter-out -std=gnu% -flto,$(CFLAGS)) $(AFLAGS-y)
+XEN_AFLAGS += $(filter-out -std=gnu% -flto,$(CFLAGS)) $(AFLAGS-y)
 
 # LDFLAGS are only passed directly to $(LD)
 LDFLAGS += $(LDFLAGS_DIRECT) $(LDFLAGS-y)
@@ -462,7 +464,7 @@ include $(srctree)/arch/$(TARGET_ARCH)/arch.mk
 
 # define new variables to avoid the ones defined in Config.mk
 export XEN_CFLAGS := $(CFLAGS)
-export XEN_AFLAGS := $(AFLAGS)
+export XEN_AFLAGS := $(XEN_AFLAGS)
 export XEN_LDFLAGS := $(LDFLAGS)
 export CFLAGS_UBSAN
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 7b5be9fe46..13ec88a628 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -80,7 +80,7 @@ ifeq ($(CONFIG_LD_IS_GNU),y)
 AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY
 else
 # Assume all versions of LLD support this.
-AFLAGS += -DHAVE_LD_SORT_BY_INIT_PRIORITY
+XEN_AFLAGS += -DHAVE_LD_SORT_BY_INIT_PRIORITY
 endif
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-- 
Anthony PERARD


