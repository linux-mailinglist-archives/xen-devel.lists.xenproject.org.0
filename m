Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F83F5C9D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170974.312127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBQ-0005GY-Au; Tue, 24 Aug 2021 11:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170974.312127; Tue, 24 Aug 2021 11:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBP-00057G-Sb; Tue, 24 Aug 2021 11:01:31 +0000
Received: by outflank-mailman (input) for mailman id 170974;
 Tue, 24 Aug 2021 11:01:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2R-0001EC-Ah
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdf2d3ba-4e2a-49c7-b534-17960bb9caa3;
 Tue, 24 Aug 2021 10:51:22 +0000 (UTC)
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
X-Inumbo-ID: fdf2d3ba-4e2a-49c7-b534-17960bb9caa3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R0ELoo+7nNz0sid1BROwVq9XSwu7Jmvu/Gqb1wk09qU=;
  b=gzxVU9cridmz+ubVLYa7jwbY2CJzK/hlHcqJCOICUXX1qb619b4zYvmg
   H9pV8hFcK8tU0BKtBy+DspbWpt20tnPZeaE3bdqsDTI5NA1erQAmJ7N09
   Ftzalq2kFOPYnH6f4SC46LaU0e1/zzfLzBi9jo6mxgwxn82JLDeG8U37H
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PQ3LFFBQZQNFDhB5zYo3jISxm/h2RT0bxuS357LbZxPJrtZRLBAvvwrTdHwO7tqjdA6HubXp/Q
 RwT9WMvDo6hFcsV0GZFOoqmjTosx3Mjl/I9l5IRYCdueIqL3s4DMAXSIUNydxNWvKOmt7BGDAn
 L6ZAPOi8Lz7xm0i2b3PVLf6ms+pMp2umBYrZ3AwL9zVNwWp4RTybSN0ivCbs5xEnHSvXNnAEx0
 PhSZXQrnQc9SHtw6k4Zkvh1cnCGvlGtAWvnF8v1vJ78OaAL1LRv0vZ2GNap1haVuMMrjBDmFe8
 ePnF4ypTCJhm4jS0IQrDqNUN
X-SBRS: 5.1
X-MesageID: 51153557
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gy42IKGGoyHBd1HspLqFWpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhcYtKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAudD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dl8awTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontRrcZrau5h+7f63+40owwbX+0KVjUNaKvq/VQUO0aOSAZAR4Z
 /xSlkbTp1OAjjqDxyISFPWqnXdOXAVmjHfIBaj8ATeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFv9dYvGlqv1vjxR5zyJSEAZ4KcuZr1kIPkjQa4UqZZa8FJeEZ8GEi6/4Ic7EP
 N2BMWZ4PpNa1uVY33Qo2EqmbWXLz4ONwbDRlJHtt2e0jBQknw8x0wExNYHlnNF8J4mUZFL6+
 nNL6wtnrBTSc0da757GY46MICKI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw/+2ucIxg9upEpH
 0AaiItiYcWQTOiNSSj5uw7zvn9ehTJYd228LAh23FQgMyNeIbW
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51153557"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 17/51] build: set XEN_BUILD_EFI earlier
Date: Tue, 24 Aug 2021 11:50:04 +0100
Message-ID: <20210824105038.1257926-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to need the variable XEN_BUILD_EFI earlier.

But a side effect of calculating the value of $(XEN_BUILD_EFI) is to
also to generate "efi/check.o" which is used for further checks.
Thus the whole chain that check for EFI support is moved to
"arch.mk".

Some other changes are made to avoid too much duplication:
    - $(efi-check-o): Used to avoid repeating "efi/check.*". We don't
      set it to the path to the source as it would be wrong as soon
      as we support out-of-tree build.
    - $(LD_PE_check_cmd): As it is called twice, with an updated
      $(EFI_LDFLAGS).

$(nr-fixups) is renamed to $(efi-check-relocs) as the former might be
a bit too generic.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v7:
    - Do the whole check for EFI support in arch.mk. So efi/check.o is
      produce there and used there, and produce efi/check.efi and use it there.
      Thus avoid the need to repeat the test done for XEN_BUILD_EFI.

 xen/arch/x86/Makefile | 36 ++----------------------------------
 xen/arch/x86/arch.mk  | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 5e1d38d6cd5b..dfcbd01bb4ed 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -123,41 +123,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 	mv $(TMP) $(TARGET)
 
 ifneq ($(efi-y),)
-
-# Check if the compiler supports the MS ABI.
-export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
-
-# Check if the linker supports PE.
-EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
-XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o))
-# If the above failed, it may be merely because of the linker not dealing well
-# with debug info. Try again with stripping it.
-ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
-EFI_LDFLAGS += --strip-debug
-XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o)
-endif
-
-ifeq ($(XEN_BUILD_PE),y)
-
-# Check if the linker produces fixups in PE by default
-nr-fixups := $(shell $(OBJDUMP) -p efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
-ifeq ($(nr-fixups),2)
-MKRELOC := :
-relocs-dummy :=
-else
-MKRELOC := efi/mkreloc
-relocs-dummy := efi/relocs-dummy.o
-# If the linker produced fixups but not precisely two of them, we need to
-# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
-# recognize the option.
-ifneq ($(nr-fixups),0)
-EFI_LDFLAGS += --disable-reloc-section
-endif
-endif
-
-endif # $(XEN_BUILD_PE)
-
 endif # $(efi-y)
 
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
@@ -218,8 +184,10 @@ endif
 
 $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 ifeq ($(MKRELOC),:)
+relocs-dummy :=
 $(TARGET).efi: ALT_BASE :=
 else
+relocs-dummy := efi/relocs-dummy.o
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
 endif
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index eea320e618b9..98dd41d32118 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -60,5 +60,47 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
+ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+
+efi-check-o = arch/x86/efi/check.o
+
+# Check if the compiler supports the MS ABI.
+XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(efi-check-o:.o=.c) -o $(efi-check-o),y)
+
+# Check if the linker supports PE.
+EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
+LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check-o:.o=.efi) $(efi-check-o))
+XEN_BUILD_PE := $(LD_PE_check_cmd)
+
+# If the above failed, it may be merely because of the linker not dealing well
+# with debug info. Try again with stripping it.
+ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
+EFI_LDFLAGS += --strip-debug
+XEN_BUILD_PE := $(LD_PE_check_cmd)
+endif
+
+ifeq ($(XEN_BUILD_PE),y)
+
+# Check if the linker produces fixups in PE by default
+efi-check-relocs := $(shell $(OBJDUMP) -p $(efi-check-o:.o=.efi) | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
+
+ifeq ($(efi-check-relocs),2)
+MKRELOC := :
+else
+MKRELOC := efi/mkreloc
+# If the linker produced fixups but not precisely two of them, we need to
+# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
+# recognize the option.
+ifneq ($(efi-check-relocs),0)
+EFI_LDFLAGS += --disable-reloc-section
+endif
+endif
+
+endif # $(XEN_BUILD_PE)
+
+export XEN_BUILD_EFI XEN_BUILD_PE MKRELOC
+export EFI_LDFLAGS
+endif
+
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
-- 
Anthony PERARD


