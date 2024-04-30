Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE88B7DF0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715128.1116657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qon-0005r9-T7; Tue, 30 Apr 2024 16:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715128.1116657; Tue, 30 Apr 2024 16:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qon-0005pw-Q2; Tue, 30 Apr 2024 16:59:01 +0000
Received: by outflank-mailman (input) for mailman id 715128;
 Tue, 30 Apr 2024 16:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ve62=MD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1qom-0005Xj-Jz
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:59:00 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef9663b1-0712-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:58:58 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-78ecd752a7cso423523485a.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:58:58 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 sg18-20020a05620a935200b00790fedd9262sm1420114qkn.42.2024.04.30.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:58:56 -0700 (PDT)
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
X-Inumbo-ID: ef9663b1-0712-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714496337; x=1715101137; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Kuc/dHNbs05v7aWRXT2GIYcN5J0aHj10Td0wtI6Les=;
        b=BEHmHmT3rngsjT83s2MXo/BeMwvPQroymTsD63uqp1BLtzE4oGgI+elFF9r3QlBMGL
         T7z5rcyaiCXQ3AEHrZM1OeV7SgvLXFVj7Mbavfss/7rTlzHYnz7YwZ5iIcRVwTKw/atH
         hio0IUsBF5Vg4IsNO6vHQtELrIaqPvys2tQZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714496337; x=1715101137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kuc/dHNbs05v7aWRXT2GIYcN5J0aHj10Td0wtI6Les=;
        b=eePGQ/rcyLAY8iFHlikxHPD/qxHHqGgPSa75M94xpDcjYj3wt2pQm1aCt0qUpXWUrm
         WGGTL3zz8zAbHlIsJAaI2/psiAP6x4bVNAkSMCUDvHUxHmleyQbbAFEyjReLwwScA7SR
         wAfHgK9og7gsPQvBWXxMrcr1AkaGgr+snP66Jzb7UwiBvDevkyYl+vEHd2Y18D5Fn09T
         DcAtY4e0zOjwVoYhWQLTGSWvST8pQPbTIu6Uo4PcReSwhOVOjm7fPWPzUdftZCF+ScVl
         o0Y3cceTPNI4k0Vkqv/1vS9gkrAuvP7PlZwE4Pz3v1Cg4vNR5QKVjqmJEXX09L7tVSaU
         n5PA==
X-Gm-Message-State: AOJu0YyAe6+mIOjGh8+Go4TpMBALZiXuMi00VmVkzPrBT6rT4IRanBAv
	118xzEJ5r1kHBohGQpMCFOTlbnYMWZKzQwv4yWvVxeN3p+MHH1LRJ1oHam/pRhZfeB1Llf2JZy7
	R
X-Google-Smtp-Source: AGHT+IEb4pX+qJH52aPh72xor/1XOHlskv5DRNPZx/MfY56V0w/5FhTDuS9JiMb24jlmU9vDCiAHhg==
X-Received: by 2002:a05:620a:5e48:b0:790:c81e:7840 with SMTP id ya8-20020a05620a5e4800b00790c81e7840mr10707432qkn.12.1714496336968;
        Tue, 30 Apr 2024 09:58:56 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH for-4.19? 1/2] xen/x86: account for max guest gfn and number of foreign mappings in the p2m
Date: Tue, 30 Apr 2024 18:58:44 +0200
Message-ID: <20240430165845.81696-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430165845.81696-1-roger.pau@citrix.com>
References: <20240430165845.81696-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keep track of the maximum gfn that has ever been populated into the p2m, and
also account for the number of foreign mappings.  Such information will be
needed in order to remove foreign mappings during teardown for HVM guests.

Right now the introduced counters are not consumed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/p2m.h | 11 +++++++++++
 xen/arch/x86/mm/p2m.c          |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 111badf89a6e..d95341ef4242 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -380,6 +380,14 @@ struct p2m_domain {
         unsigned int flags;
         unsigned long entry_count;
     } ioreq;
+
+    /*
+     * Max gfn possibly mapped into the guest p2m.  Note max_gfn is not
+     * adjusted to account for removals from the p2m.
+     */
+    gfn_t              max_gfn;
+    /* Number of foreign mappings. */
+    unsigned long      nr_foreign;
 #endif /* CONFIG_HVM */
 };
 
@@ -1049,6 +1057,8 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
         if ( !page_get_owner_and_reference(mfn_to_page(nfn)) )
             return -EBUSY;
 
+        p2m->nr_foreign++;
+
         break;
 
     default:
@@ -1069,6 +1079,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
             return -EINVAL;
         }
         put_page(mfn_to_page(ofn));
+        p2m->nr_foreign--;
         break;
 
     default:
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index ce742c12e0de..05d8536adcd7 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -413,6 +413,8 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
         set_rc = p2m->set_entry(p2m, gfn, mfn, order, p2mt, p2ma, -1);
         if ( set_rc )
             rc = set_rc;
+        else
+            p2m->max_gfn = gfn_max(gfn_add(gfn, 1u << order), p2m->max_gfn);
 
         gfn = gfn_add(gfn, 1UL << order);
         if ( !mfn_eq(mfn, INVALID_MFN) )
-- 
2.44.0


