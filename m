Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C4D45DB7D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231263.400160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5r-00018w-87; Thu, 25 Nov 2021 13:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231263.400160; Thu, 25 Nov 2021 13:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5q-0000zR-PW; Thu, 25 Nov 2021 13:47:18 +0000
Received: by outflank-mailman (input) for mailman id 231263;
 Thu, 25 Nov 2021 13:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0C-0007NX-8R
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61f79501-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:27 +0100 (CET)
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
X-Inumbo-ID: 61f79501-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bOo1Z/T3w/mQYlFp7E4qcB5DbSAxG5uo05MNRdVl4wM=;
  b=WmeMt6eol6eXiJiDQHaBeQt+BeUhVjf6XdQmY1J5eqAzvPsjDKl2RmW9
   fBfF96meiQC2+YtJH3JgiU8LOK6SugiFBBxSaDaQhi77B/lYOpVJISLjt
   +s5pmt3qAl9SosUcebiIBx5cJjErwRXCCE0trLZBiiPz2KetVd5saVsOY
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +AdAtrej9VQcLCNpbiZ2x08WtITeZXq32uP157ac+kl7ZTVAVH2dOY2W1eXGn48ZGsqdipKmEE
 g7jzeit6lnDIjV8o7ZQyrd7+W3sccuQy65coc+yXa/y0XtLgLB3XThh6jirkmAhbMXo6ZE4yRM
 2G5lFJNbpycYnGhftFNwl1cjiQxxahMVOzqR5o/hjGoyLgrCE4RCOH3gRGGPFaiwKIji8G9cFA
 3odwANGryscHjCRKm2/0QqB97rlFUCkU2ZLj/nNGndWbMst4sNJFkfXamG7APEKCGu86N/tPOM
 bnUU+YAQ3K24FPP8rX0UvgWR
X-SBRS: 5.1
X-MesageID: 58135478
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Gydnl65YohovGKVaAfNshwxRtMXAchMFZxGqfqrLsTDasY5as4F+v
 mcXXWiCbKrcazD8eN1yYdzk9kwGusSEyIdqTAo+r31hHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 NZPl5GpFgMSBe7TheoHcClnNHxPBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTa+FO
 pZGOVKDajzNZRZmJnMeUa5lhbm6olfaWBtDqGy88P9fD2/7k1UqjemF3MDuUt6XQcRYmG6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZ1hHWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAFUTxpeNEgrNUxRzEhy
 hmOhdyBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZVMG4fvuud43tSmMUcttCo2FsfqoKAill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3HY5
 CBc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2cDBs2WirnUWWwC
 KM2he+2zMUOVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOhD+yzxl8wfBlZ
 8bznSOQ4ZEyU/oP8dZLb71Fje9DKt4WmQs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iF69z
 jqrDOPTk083eLSnOkH/qNdPRXhXfSlTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6INc790mU/8+Vl
 kyAtrhwlACi2CaZcFrSMRiOqtrHBP5CkJ7yBgR0VX7A5pTpSd/HAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:i+1JrK7viDgtcXJUdQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135478"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 25/47] build: rework coverage and ubsan CFLAGS handling
Date: Thu, 25 Nov 2021 13:39:44 +0000
Message-ID: <20211125134006.1076646-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When assigning a value a target-specific variable, that also affect
prerequisite of the target. This is mostly fine, but there is one case
where we will not want the COV_FLAGS added to the CFLAGS.

In arch/x86/boot, we have "head.o" with "cmdline.S" as prerequisite
and ultimately "cmdline.o", we don't want COV_FLAGS to that last one.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v8:
    - reorder target-specific assignments
    - fix typo in comment
    - reviewed

 xen/Rules.mk | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 9eb3093f43fb..d6eabd3415b5 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -126,19 +126,31 @@ targets += $(targets-for-builtin)
 
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
+non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
+
 ifeq ($(CONFIG_COVERAGE),y)
 ifeq ($(CONFIG_CC_IS_CLANG),y)
     COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
 else
     COV_FLAGS := -fprofile-arcs -ftest-coverage
 endif
-$(filter-out %.init.o $(nocov-y),$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += $(COV_FLAGS)
+
+# Reset COV_FLAGS in cases where an objects has another one as prerequisite
+$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+    COV_FLAGS :=
+
+$(non-init-objects): _c_flags += $(COV_FLAGS)
 endif
 
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize= options need to come after any -fsanitize= options
-$(filter-out %.init.o $(noubsan-y),$(obj-y) $(obj-bin-y) $(extra-y)): \
-CFLAGS-y += $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
+UBSAN_FLAGS := $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
+
+# Reset UBSAN_FLAGS in cases where an objects has another one as prerequisite
+$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+    UBSAN_FLAGS :=
+
+$(non-init-objects): _c_flags += $(UBSAN_FLAGS)
 endif
 
 ifeq ($(CONFIG_LTO),y)
@@ -167,6 +179,9 @@ a_flags = -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
 
 include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 
+c_flags += $(_c_flags)
+a_flags += $(_c_flags)
+
 c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
-- 
Anthony PERARD


