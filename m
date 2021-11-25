Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C045DB5C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231208.399949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzN-0007lu-0h; Thu, 25 Nov 2021 13:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231208.399949; Thu, 25 Nov 2021 13:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzM-0007jd-Qh; Thu, 25 Nov 2021 13:40:36 +0000
Received: by outflank-mailman (input) for mailman id 231208;
 Thu, 25 Nov 2021 13:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzK-00076i-UV
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 429f4ad1-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:40:33 +0100 (CET)
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
X-Inumbo-ID: 429f4ad1-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nGDIsDb6T+EAmgMztobre/7LJOc8NJGsQjeWYOHBbk8=;
  b=Ouf/tb3utT5zvnmGHTKDvynTxwMPy9UIRjCd+tQep1CGX6ZDhsU3JIJy
   S2LFoAdKOu8/Lc4FBYa2FcWF41rQUQgMSUJTP1KRy3uJrohjLNYH9y9+6
   d9qbwzKgnXoaJUbNv0AYIYUPNabqpT0bIpDAQXhYiR8iRAOVulcrUeI2q
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZNcqcpY5cip9ez4m28cyPyD+v1uU72dX8Nlm6tj6/WzseUDxnnAMIZ3dts2PukDTqIrqQevZVJ
 pLkXY7hE8HKW+76lKEj3v9jfBoyU8HKrHBCn3fDs1JHPDYB17zir6WLBD3CjQ62fVqIAIROrxV
 Te/4PVjO7VmGULtz5tdyRxvh/idbtDndSWKe2XlGMTMgiw+GNsjThz/S8WiGQrNu/9xtf4fUPp
 F/xiK4jxrXMQzjmmlXrRtVQMSom2clfTOq0H6xlhjv9xcVMKodwPlSMRzhHlM9OG6RJwxlqqKq
 tPPEoEsy7q9nPHNfH7f1b0QC
X-SBRS: 5.1
X-MesageID: 58617609
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5S89BK3bP76VCwjv9PbD5ep2kn2cJEfYwER7XKvMYLTBsI5bpzAOm
 mdJWWjTPv+KYWaheI91PI6wp00Hv5CBzddgHlZupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhk8JN6
 9pL8pmKdCB1H7PCntsafkRWKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t1p4XQqiGN
 qL1bxJUQkj/RAZuGmwPS84kg+Wx3V3bUyNx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalhIOZ/lfFao/0jyqlovK7QCmAUVZQAcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL6D2BLwQKChRqlEGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zoCH8ItEAsGAkehYB3iM4ldjBO
 hG7hO+szMULYCvCgVFfP+pd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/F+Ir
 o0BbpTSkH2ykoTWO0HqzGLaFnhSRVBTOHw8g5U/mjerLlU0FWc/JeXWxL99KYVpk74MzrXD/
 22nW18ew1363CWVJQKPY3FlSbXuQZcg8i5rYX1yZQ6liyo5fIKizKYDbJ9rL7Mpw/NukKxvR
 P4fdsTeXvkWEmbb+y4QZIXWpZB5cEj5nhqHOieoOWBtf5NpSwHT1MXjew/jqHsHAiat7JNsq
 Ly8zALLB5EEQl06XsrRbfuuyXK3vGQcx70uDxeZfIELdRy1ooZwKiH3gvsmGO02KE3OlmmAy
 gKbIRYEvu2R8YU7x8bE2PKfpICzHuogQkcDRzvH7ay7PDXx93a4xdMSS/6BeD3QWT+m+KimY
 ukJnfjwPOdewQRPuot4Vb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPeTbMczoJ1cdOQ45Y7nRzvoTgDTTsaw4LUiSCPWbJ1ZbvZG+5yWxtRE=
IronPort-HdrOrdr: A9a23:TeNFVq7BsRK6x6TIDAPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617609"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 04/47] build: set XEN_BUILD_EFI earlier
Date: Thu, 25 Nov 2021 13:39:23 +0000
Message-ID: <20211125134006.1076646-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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

$(nr-fixups) is renamed to $(efi-nr-fixups) as the former might be
a bit too generic.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - rename to efi-nr-fixups rather than efi-check-relocs
    - use := when assigning variable in makefile when recursive expansion
      isn't needed.
    - no more check of $(efi-y) value for "CFLAGS-$(XEN_BUILD_EFI) +=
      -DXEN_BUILD_EFI".
    
    v7:
    - Do the whole check for EFI support in arch.mk. So efi/check.o is
      produce there and used there, and produce efi/check.efi and use it there.
      Thus avoid the need to repeat the test done for XEN_BUILD_EFI.

 xen/arch/x86/Makefile | 38 ++------------------------------------
 xen/arch/x86/arch.mk  | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8db4cb98edbb..d7d2adc1881e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -121,44 +121,8 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 		{ echo "No Multiboot2 header found" >&2; false; }
 	mv $(TMP) $(TARGET)
 
-ifneq ($(efi-y),)
-
-# Check if the compiler supports the MS ABI.
-export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
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
-endif # $(efi-y)
-
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
 
 ifeq ($(CONFIG_LTO),y)
@@ -217,8 +181,10 @@ endif
 
 $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 ifeq ($(MKRELOC),:)
+relocs-dummy :=
 $(TARGET).efi: ALT_BASE :=
 else
+relocs-dummy := efi/relocs-dummy.o
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
 endif
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index eea320e618b9..19c9cd206ed0 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -60,5 +60,47 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
+ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+
+efi-check-o := arch/x86/efi/check.o
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
+efi-nr-fixups := $(shell $(OBJDUMP) -p $(efi-check-o:.o=.efi) | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
+
+ifeq ($(efi-nr-fixups),2)
+MKRELOC := :
+else
+MKRELOC := efi/mkreloc
+# If the linker produced fixups but not precisely two of them, we need to
+# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
+# recognize the option.
+ifneq ($(efi-nr-fixups),0)
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


