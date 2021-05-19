Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA63892CF
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 17:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130203.244035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOIb-0008E9-6H; Wed, 19 May 2021 15:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130203.244035; Wed, 19 May 2021 15:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOIb-0008Bm-3C; Wed, 19 May 2021 15:39:53 +0000
Received: by outflank-mailman (input) for mailman id 130203;
 Wed, 19 May 2021 15:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljOIZ-0008Be-Hn
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 15:39:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73546a6d-b89d-4d01-b144-87c20a559093;
 Wed, 19 May 2021 15:39:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB86BB01E;
 Wed, 19 May 2021 15:39:49 +0000 (UTC)
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
X-Inumbo-ID: 73546a6d-b89d-4d01-b144-87c20a559093
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621438789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wevaPow5YfXo4W6yF0r59ykU5BpQ+t1e1n7P7fEPngQ=;
	b=bazLB7xUhaavFfNGGvg1xlZkzkUVQ9wOE5MQAofz7SJML6Bwn1Lyb9LtsPiy3Wj7evK3jp
	Xr/cUUgF9+jLPJn+QddUYmDX03Tj0b/uV7WiJ1aKeFg19WjET5TtELVCECwnsEzHa7ixrI
	y9U65/Qtph7F17R4KMO/S0KaMNYXl20=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: make hypervisor build with gcc11
Message-ID: <ca7a78e5-2ee9-4109-7905-3b9186475f3d@suse.com>
Date: Wed, 19 May 2021 17:39:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Gcc 11 looks to make incorrect assumptions about valid ranges that
pointers may be used for addressing when they are derived from e.g. a
plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100680.

Utilize RELOC_HIDE() to work around the issue, which for x86 manifests
in at least
- mpparse.c:efi_check_config(),
- tboot.c:tboot_probe(),
- tboot.c:tboot_gen_frametable_integrity(),
- x86_emulate.c:x86_emulate() (at -O2 only).
The last case is particularly odd not just because it only triggers at
higher optimization levels, but also because it only affects one of at
least three similar constructs. Various "note" diagnostics claim the
valid index range to be [0, 2⁶³-1].

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -8,6 +8,13 @@
 
 #define ERR_PTR(val) NULL
 
+/* See gcc bug 100680, but here don't bother making this version dependent. */
+#define gcc11_wrap(x) ({                  \
+    unsigned long x_;                     \
+    __asm__ ( "" : "=g" (x_) : "0" (x) ); \
+    (typeof(x))x_;                        \
+})
+
 #define cpu_has_amd_erratum(nr) 0
 #define cpu_has_mpx false
 #define read_bndcfgu() 0
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -726,7 +726,7 @@ union vex {
 #define copy_VEX(ptr, vex) ({ \
     if ( !mode_64bit() ) \
         (vex).reg |= 8; \
-    (ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 : 0x8f; \
+    gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 : 0x8f; \
     (ptr)[1 - PFX_BYTES] = (vex).raw[0]; \
     (ptr)[2 - PFX_BYTES] = (vex).raw[1]; \
     container_of((ptr) + 1 - PFX_BYTES, typeof(vex), raw[0]); \
--- a/xen/include/asm-x86/fixmap.h
+++ b/xen/include/asm-x86/fixmap.h
@@ -78,7 +78,7 @@ extern void __set_fixmap(
 
 #define clear_fixmap(idx) __set_fixmap(idx, 0, 0)
 
-#define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
+#define __fix_to_virt(x) gcc11_wrap(FIXADDR_TOP - ((x) << PAGE_SHIFT))
 #define __virt_to_fix(x) ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT)
 
 #define fix_to_virt(x)   ((void *)__fix_to_virt(x))
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -140,6 +140,12 @@
     __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
     (typeof(ptr)) (__ptr + (off)); })
 
+#if CONFIG_GCC_VERSION >= 110000 /* See gcc bug 100680. */
+# define gcc11_wrap(x) RELOC_HIDE(x, 0)
+#else
+# define gcc11_wrap(x) (x)
+#endif
+
 #ifdef __GCC_ASM_FLAG_OUTPUTS__
 # define ASM_FLAG_OUT(yes, no) yes
 #else
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -19,7 +19,7 @@ extern u64 pdx_region_mask(u64 base, u64
 extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
 
 #define page_to_pdx(pg)  ((pg) - frame_table)
-#define pdx_to_page(pdx) (frame_table + (pdx))
+#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
 
 bool __mfn_valid(unsigned long mfn);
 

