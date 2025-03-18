Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E8A66F8A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:19:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918732.1323405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6Z-000205-4u; Tue, 18 Mar 2025 09:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918732.1323405; Tue, 18 Mar 2025 09:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6Z-0001xZ-1E; Tue, 18 Mar 2025 09:19:23 +0000
Received: by outflank-mailman (input) for mailman id 918732;
 Tue, 18 Mar 2025 09:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuT6Y-0001pb-Dj
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:19:22 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12f21450-03da-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 10:19:20 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso4565944f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:19:20 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb7ea197sm17267527f8f.84.2025.03.18.02.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:19:19 -0700 (PDT)
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
X-Inumbo-ID: 12f21450-03da-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742289560; x=1742894360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvu5eIZtMQ2sjDw7pRYIO1mjfh/0Xg7gt34ETQV6Y38=;
        b=RAznACR7A6JqGxfEt0mjEomlqUYjy6MnmbRpaavvVuJasGZdMYlLlEIVM1niI5PR7q
         BmVE5UTywNDkObFiBDMimC13mikoJ9Bx/CBDzt2sSnndDIu+zzFxArSFeM0DyhZJh82f
         ZVO1bukoqOlNLroYfQe+hE4Ucyzv/teggYmZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289560; x=1742894360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvu5eIZtMQ2sjDw7pRYIO1mjfh/0Xg7gt34ETQV6Y38=;
        b=O5yPR7U3sKRhM3hq61pArvIJNdnfWL5b9jb0a8p/uJpbgSCWWwOo3bvsVyGYurHQsp
         YPZDfl4NSmsMnI7fSEm/7MhUxpuzgn/xiFR3yTWCjbOGJT8eIGUM7OmTzAN9x8GNoF4z
         XCtB+uyBol8Q69OMbaMcKNXFMI+L5jHqZ21QT7Sv3/cA9Z0+9HMcp0NzHREYyoH0ke1j
         tBSrK5zjIleMXOVko/1jojrkfKeTriKxsXApuE81KE/mXGJE4sWqOiaTccFBbnzyzG+A
         aO/fx8NpGV0iXNoG4jI32Irv5w6M4XY92f8r1ePkp0vPBTdQoW5Xa44/SlFES5SrDS2e
         JwSw==
X-Gm-Message-State: AOJu0YxdgesyWxzHbxgzAFDwuR1nmYEkwrzbykJ14dJaCR9v760wXvlD
	zvTulKadlNQltGWJYWLFbIoFwONXKvVbouMsE7sjvW5jOvyF4nesVLBqX9++cHrpHUnjoxrCFR7
	h
X-Gm-Gg: ASbGncs9b5Insx9/NDUwiu2R6RtTKkNItfqxVs+i9tjoIREBm5BVS2yYPIf1NLR5tsE
	xPxUm8ljzP2i1tlddY2HpswwZf9oqjhq1gQ3NVVZbMukhhXRcyVzcbOPgtyz31ruiu9YjJk2Ogr
	SH3Bd0sy3OWhgFZ1GKNhcUF5G12suhW+OEWO+lGpSOdz1UMirdUpqHOjI0lVlCFfI/j3TOqLyoN
	XlUIc6ISyKRarw/1Pi7TT66T6glrTAxpPHZ1Oqby/x8MSmEmK5xJVDhCO+8CyTB/fv3ZoeJsLsT
	714qCmAKXm5U/XKWqtKnoiAlmldUbGduxs58/dYvZ31tpocaKg==
X-Google-Smtp-Source: AGHT+IGZoxRERBI2o5PdcYEf0GTFklKZscfnxI6ptTAwbkD0XhjdjMKBMAO21xu5GZUvgQ2Sxr70gg==
X-Received: by 2002:a05:6000:4023:b0:391:487f:2828 with SMTP id ffacd0b85a97d-3996b445302mr2703349f8f.10.1742289559732;
        Tue, 18 Mar 2025 02:19:19 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 4/5] x86/shadow: fix UB pointer arithmetic in sh_mfn_is_a_page_table()
Date: Tue, 18 Mar 2025 10:19:03 +0100
Message-ID: <20250318091904.52903-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091904.52903-1-roger.pau@citrix.com>
References: <20250318091904.52903-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UBSAN complains with:

UBSAN: Undefined behaviour in arch/x86/mm/shadow/private.h:515:30
pointer operation overflowed ffff82e000000000 to ffff82dfffffffe0
[...]
Xen call trace:
   [<ffff82d040303882>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
   [<ffff82d040304cc3>] F lib/xxhash64.c#__ubsan_handle_pointer_overflow+0xcb/0x100
   [<ffff82d040471c5d>] F arch/x86/mm/shadow/guest_2.c#sh_page_fault__guest_2+0x1e350
   [<ffff82d0403b216b>] F lib/xxhash64.c#svm_vmexit_handler+0xdf3/0x2450
   [<ffff82d0402049c0>] F lib/xxhash64.c#svm_stgi_label+0x5/0x15

Fix by moving the call to mfn_to_page() after the check of whether the
passed gmfn is valid.  This avoid the call to mfn_to_page() with an
INVALID_MFN parameter.

While there make the page local variable const, it's not modified by the
function.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/mm/shadow/private.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index a5fc3a7676eb..cef9dbef2e77 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -512,13 +512,14 @@ static inline unsigned long __backpointer(const struct page_info *sp)
 static inline int
 sh_mfn_is_a_page_table(mfn_t gmfn)
 {
-    struct page_info *page = mfn_to_page(gmfn);
+    const struct page_info *page;
     struct domain *owner;
     unsigned long type_info;
 
     if ( !mfn_valid(gmfn) )
         return 0;
 
+    page = mfn_to_page(gmfn);
     owner = page_get_owner(page);
     if ( owner && shadow_mode_refcounts(owner)
          && (page->count_info & PGC_shadowed_pt) )
-- 
2.48.1


