Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97D4B50FD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271643.466189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb29-0000G3-By; Mon, 14 Feb 2022 13:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271643.466189; Mon, 14 Feb 2022 13:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb29-00009Q-7I; Mon, 14 Feb 2022 13:04:49 +0000
Received: by outflank-mailman (input) for mailman id 271643;
 Mon, 14 Feb 2022 13:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb27-0008IH-U8
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:04:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad5bf47e-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:04:46 +0100 (CET)
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
X-Inumbo-ID: ad5bf47e-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Hp8XnKkx9GSqf6AkS0zSNG6Qc1BDd2mSHAJ1CWLZ67A=;
  b=KEYNINcKXbCFcUlAb0rtyySzGDIHasWKWDgM1YVcXkLuJysbnOhBKttp
   BtTmfQeIkk3O5jh6BdPpz7ZvP3xmAurWb5l40Yf8n7vD0N4/FY4Joyo0O
   wAHPV+dApsf8HWCalLWMKBy9XrWpvdzgc8K+Brhs0jOWA2RKo/l4iszi3
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: b8XcuBXMKkkieRBqBxoKX2f/U+w8fBkueBB1uchr00ZLQ782fgivKa4VtfsQdZ0i8DAAwG1kMo
 DAsIros95B0kTCDCojtIurVtZNbSi0ObYHFMjR6fLElE48qLIiTEbjONBFVdhx5IBDkPEMjgEQ
 WqzRhnQ3RxJPUvMrpREyjJpfyhISYfvCp3yyxHbTGbjJDQImQL6OlTUuQxAvG7E3jnbOBRpE06
 LW3acygO/i7zV3Qn0oP2Y/l8ZQvpImBGYQv0pyLbO7EmYogBnLDEMo1VQosH5qv4Ilm8QTpZhT
 LRossTjr23IIqbplcHVWydFX
X-SBRS: 5.1
X-MesageID: 64149314
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MGNz2K04BID6lCN9PvbD5cx2kn2cJEfYwER7XKvMYLTBsI5bpzUHy
 GQfCGHTO6uPZWXzft0nYdu0oElQuZeDzIVqSVE6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpftT4
 e1Jk7aKZBo3LI2Wl+FMXxtqKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u2pkSTK2HO
 6L1bxJDUz/KbwV3HWxIEY5gw+Sxmnn9fiBh/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfycTjTAdxIUufir7gz3QPVljd75AAquUWTm9Kbo3a6ffhlB
 lEK6Ap0oq1j+E6Zd4yoN/Gnm0KsshkZUttWNuQ17gCR16bZizqk6ng4oi1pM4J/6pJvLdA+/
 hrQxo6yW2Qz2FGAYS/Frt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTgBj3d3/buZRjs1XGGwrZBr2+PD0ovYdvFm/Y45cxloRiHSZT4Kp80PHyv1LMZyUSFKM1
 FBdxZTCs7BeUMzVzXfXKAnoIF1Oz6zbWAAwfHY1R8Vxn9hT0yLLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKK/z1PxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eF3mH5unz6PLX05pjz+uYejiLeuYe9tGDOzgioRtstoeS3Zr
 IRSMdWk0RJaXLGsayXb69dLf1sLMWI6Fdb9rMkOLryPJQ9vGWcADf7NwOx+J9w5zvoNzuqYr
 GugXkJ4yUbkgSGVIwu9dX0+OqjkWoxyrCxnMHV0b0qowXUqfa2m8LwbK8ksZbAi+eE6lax0Q
 vAJdt+uGPNKTjibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz+
 uTy2BnaTJwPQxVZIPzXMP//nUmsuXU9mf5pWxeaKNdkZ0ixopNhLDb8j6FrLphUewnD3DaTy
 y2fHQwc+bvWu4Yw/dTE2fKEooOuH7csF0ZWBTCGv7O/NC2c9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHuY517866vvuu6Ren1ZtE3j8Zli2Dq9tfyud1s5Vu6wRnrJUtGNag
 K5UFgW27VlRBP7YLQ==
IronPort-HdrOrdr: A9a23:yGHfJ6lbxd44LP+EGVWInaMw9+7pDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149314"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 57/70] x86/misc: CFI hardening
Date: Mon, 14 Feb 2022 12:51:14 +0000
Message-ID: <20220214125127.17985-58-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/extable.c | 4 ++--
 xen/common/efi/boot.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 51ef863d786c..4d1875585f9d 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -23,7 +23,7 @@ static inline unsigned long ex_cont(const struct exception_table_entry *x)
 	return EX_FIELD(x, cont);
 }
 
-static int init_or_livepatch cmp_ex(const void *a, const void *b)
+static int init_or_livepatch cf_check cmp_ex(const void *a, const void *b)
 {
 	const struct exception_table_entry *l = a, *r = b;
 	unsigned long lip = ex_addr(l);
@@ -37,7 +37,7 @@ static int init_or_livepatch cmp_ex(const void *a, const void *b)
 	return 0;
 }
 
-static void init_or_livepatch swap_ex(void *a, void *b, size_t size)
+static void init_or_livepatch cf_check swap_ex(void *a, void *b, size_t size)
 {
 	struct exception_table_entry *l = a, *r = b, tmp;
 	long delta = b - a;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index f31f68fd4cd1..4dd5ea6a0602 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1497,7 +1497,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
     unmap_domain_page(l3dst);
 }
 
-static bool __init ram_range_valid(unsigned long smfn, unsigned long emfn)
+static bool __init cf_check ram_range_valid(unsigned long smfn, unsigned long emfn)
 {
     unsigned long sz = pfn_to_pdx(emfn - 1) / PDX_GROUP_COUNT + 1;
 
@@ -1506,7 +1506,7 @@ static bool __init ram_range_valid(unsigned long smfn, unsigned long emfn)
                          pfn_to_pdx(smfn) / PDX_GROUP_COUNT) < sz;
 }
 
-static bool __init rt_range_valid(unsigned long smfn, unsigned long emfn)
+static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emfn)
 {
     return true;
 }
-- 
2.11.0


