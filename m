Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF120CFD7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 17:51:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpw3k-0002tZ-1K; Mon, 29 Jun 2020 15:51:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jpw3i-0002tU-Qm
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 15:51:02 +0000
X-Inumbo-ID: 54e09cbc-ba20-11ea-8587-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54e09cbc-ba20-11ea-8587-12813bfff9fa;
 Mon, 29 Jun 2020 15:51:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0241AD26;
 Mon, 29 Jun 2020 15:51:00 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: fix compat header generation
Message-ID: <0e617191-d61f-08e2-eaa9-b324cd6501f0@suse.com>
Date: Mon, 29 Jun 2020 17:50:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As was pointed out by "mm: fix public declaration of struct
xen_mem_acquire_resource", we're not currently handling structs
correctly that has uint64_aligned_t fields. #pragma pack(4) suppresses
the necessary alignment even if the type did properly survive (which
it also didn't) in the process of generating the headers. Overall,
with the above mentioned change applied, there's only a latent issue
here afaict, i.e. no other of our interface structs is currently
affected.

As a result it is clear that using #pragma pack(4) is not an option.
Drop all uses from compat header generation. Make sure
{,u}int64_aligned_t actually survives, such that explicitly aligned
fields will remain aligned. Arrange for {,u}int64_t to be transformed
into a type that's 64 bits wide and 4-byte aligned, by utilizing that
in typedef-s the "aligned" attribute can be used to reduce alignment.

Note that this changes alignment (but not size) of certain compat
structures, when one or more of their fields use a non-translated struct
as their type(s). This isn't correct, and hence applying alignof() to
such fields requires care, but the prior situation was even worse.

There's one change to generated code according to my observations: In
arch_compat_vcpu_op() the runstate area "area" variable would previously
have been put in a just 4-byte aligned stack slot (despite being 8 bytes
in size), whereas now it gets put in an 8-byte aligned location.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -34,15 +34,6 @@ headers-$(CONFIG_XSM_FLASK) += compat/xs
 cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
 cppflags-$(CONFIG_X86)    += -m32
 
-# 8-byte types are 4-byte aligned on x86_32 ...
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-prefix-$(CONFIG_X86)      := \#pragma pack(push, 4)
-suffix-$(CONFIG_X86)      := \#pragma pack(pop)
-else
-prefix-$(CONFIG_X86)      := \#pragma pack(4)
-suffix-$(CONFIG_X86)      := \#pragma pack()
-endif
-
 endif
 
 public-$(CONFIG_X86) := $(wildcard public/arch-x86/*.h public/arch-x86/*/*.h)
@@ -57,16 +48,16 @@ compat/%.h: compat/%.i Makefile $(BASEDI
 	echo "#define $$id" >>$@.new; \
 	echo "#include <xen/compat.h>" >>$@.new; \
 	$(if $(filter-out compat/arch-%.h,$@),echo "#include <$(patsubst compat/%,public/%,$@)>" >>$@.new;) \
-	$(if $(prefix-y),echo "$(prefix-y)" >>$@.new;) \
 	grep -v '^# [0-9]' $< | \
 	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py | uniq >>$@.new; \
-	$(if $(suffix-y),echo "$(suffix-y)" >>$@.new;) \
 	echo "#endif /* $$id */" >>$@.new
 	mv -f $@.new $@
 
+.PRECIOUS: compat/%.i
 compat/%.i: compat/%.c Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
+.PRECIOUS: compat/%.c
 compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
 	grep -v 'DEFINE_XEN_GUEST_HANDLE(long)' $< | \
--- a/xen/tools/compat-build-header.py
+++ b/xen/tools/compat-build-header.py
@@ -3,7 +3,7 @@
 import re,sys
 
 pats = [
- [ r"__InClUdE__(.*)", r"#include\1\n#pragma pack(4)" ],
+ [ r"__InClUdE__(.*)", r"#include\1" ],
  [ r"__IfDeF__ (XEN_HAVE.*)", r"#ifdef \1" ],
  [ r"__ElSe__", r"#else" ],
  [ r"__EnDif__", r"#endif" ],
@@ -13,7 +13,8 @@ pats = [
  [ r"(struct|union|enum)\s+(xen_?)?(\w)", r"\1 compat_\3" ],
  [ r"@KeeP@", r"" ],
  [ r"_t([^\w]|$)", r"_compat_t\1" ],
- [ r"(8|16|32|64)_compat_t([^\w]|$)", r"\1_t\2" ],
+ [ r"(8|16|32|64_aligned)_compat_t([^\w]|$)", r"\1_t\2" ],
+ [ r"(\su?int64(_compat)?)_T([^\w]|$)", r"\1_t\3" ],
  [ r"(^|[^\w])xen_?(\w*)_compat_t([^\w]|$$)", r"\1compat_\2_t\3" ],
  [ r"(^|[^\w])XEN_?", r"\1COMPAT_" ],
  [ r"(^|[^\w])Xen_?", r"\1Compat_" ],
--- a/xen/tools/compat-build-source.py
+++ b/xen/tools/compat-build-source.py
@@ -9,6 +9,7 @@ pats = [
  [ r"^\s*#\s*endif /\* (XEN_HAVE.*) \*/\s+", r"__EnDif__" ],
  [ r"^\s*#\s*define\s+([A-Z_]*_GUEST_HANDLE)", r"#define HIDE_\1" ],
  [ r"^\s*#\s*define\s+([a-z_]*_guest_handle)", r"#define hide_\1" ],
+ [ r"^\s*#\s*define\s+(u?int64)_aligned_t\s.*", r"typedef \1_T __attribute__((aligned(4))) \1_compat_T;" ],
  [ r"XEN_GUEST_HANDLE(_[0-9A-Fa-f]+)?", r"COMPAT_HANDLE" ],
 ];
 

