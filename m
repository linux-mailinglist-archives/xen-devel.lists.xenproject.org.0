Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76447523CD2
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 20:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327185.549938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norN4-0003Ew-6O; Wed, 11 May 2022 18:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327185.549938; Wed, 11 May 2022 18:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norN4-00039P-1E; Wed, 11 May 2022 18:47:38 +0000
Received: by outflank-mailman (input) for mailman id 327185;
 Wed, 11 May 2022 18:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbwJ=VT=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1norN2-0002t5-DT
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 18:47:36 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2ce5dda-d15a-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 20:47:35 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id t25so5114135lfg.7
 for <xen-devel@lists.xenproject.org>; Wed, 11 May 2022 11:47:35 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651234cc00b0047255d21189sm396230lfr.184.2022.05.11.11.47.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 May 2022 11:47:33 -0700 (PDT)
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
X-Inumbo-ID: d2ce5dda-d15a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vctV/iLL9dxD/cFUite3RxHXN54TqR8bRkXbFjuYkMw=;
        b=Yek1mTVmaEi46z3QQJsz2e1Ta4uvlY1Tm4ODXeMoxGsTACb85Z01IF5V6/+PQFDE0q
         PQkeKb0w19D9rK18XngwqHdYlJ3bAraQi/ttv+ickXfwlgU8dcXLUZOvpLzewAQiifbL
         08UiZFYKk5rpNunv0gW0buARJry3W0ogycyxx5FWK91fMF2q02T9KKHZfKj/oF3yhbH5
         IOmYLcYFXriq67m3uvZVHy3NmjjH3NOG4UoZlf2dSdhOuwfc85LOoWOvVCEiqeGsDy/K
         zE0FNTx2WFR42Yyx+HqRGxPAeJxL1HPgITebPFCIz+kt55i56G+gNlHnYeWsXqijcA0/
         N83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vctV/iLL9dxD/cFUite3RxHXN54TqR8bRkXbFjuYkMw=;
        b=49prpnX2L54mstsrlAXWKjUJsJVrxQ52Pd1F/Z1fLOEqm4x0Dn8+d2Dg1/U8+uTNZA
         0EjvjXNlgc5QvmQ/w1f83y62cBv3xzJj0CR8eZ4cJuTgNjFUS3HVgYb6Vc0XjBpywRup
         RhrzdMr4CpVwicRkb3uAZoY7sbYsU+hmGNT3R61O2gMDjoh2kmJx5YDg+yi1DNWfHzpA
         heFUx2zfEucP7TrLCAzC4lIlEQa3x0t0B/7qhaf1LiUsZ8IzzHnXwWZe4fmPMOiN+9cE
         rmZKLaulNf6Mkn0IsLRzdusV2W/Sbo7qASGhRubAMjmI7ECQduKv5dFqc2fW1bqvY7v5
         +d0A==
X-Gm-Message-State: AOAM530BGY3PDpfNZdlIYZuCYSnbDKX2+rkxqQXSCIyx+jKaV60PV3II
	59HlBW9qlt6bbxoQSxN577V8IB0uxsI=
X-Google-Smtp-Source: ABdhPJwNtbxDzwFgJ57XcIMT8iqJWTz51fLWvllpe43kx41E3ujr9FO+aMOq+lloUt41DdnKh1toSg==
X-Received: by 2002:ac2:44cd:0:b0:471:eff9:d698 with SMTP id d13-20020ac244cd000000b00471eff9d698mr21496835lfm.251.1652294854659;
        Wed, 11 May 2022 11:47:34 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V6 2/2] xen/arm: Harden the P2M code in p2m_remove_mapping()
Date: Wed, 11 May 2022 21:47:25 +0300
Message-Id: <1652294845-13980-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Borrow the x86's check from p2m_remove_page() which was added
by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
"x86/p2m: don't assert that the passed in MFN matches for a remove"
and adjust it to the Arm code base.

Basically, this check is strictly needed for the xenheap pages only
since there are several non-protected read accesses to our simplified
xenheap based M2P approach on Arm (most calls to page_get_xenheap_gfn()
are not protected by the P2M lock).

But, it will be a good opportunity to harden the P2M code for *every*
RAM pages since it is possible to remove any GFN - MFN mapping
currently on Arm (even with the wrong helpers). This can result in
a few issues when mapping is overridden silently (in particular when
building dom0).

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
You can find the corresponding discussion at:
https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/

Changes V5 -> V6:
 - new patch
---
 xen/arch/arm/p2m.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f87b48e..635e474 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1311,11 +1311,32 @@ static inline int p2m_remove_mapping(struct domain *d,
                                      mfn_t mfn)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned long i;
     int rc;
 
     p2m_write_lock(p2m);
+    for ( i = 0; i < nr; )
+    {
+        unsigned int cur_order;
+        p2m_type_t t;
+        mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), &t, NULL,
+                                         &cur_order, NULL);
+
+        if ( p2m_is_any_ram(t) &&
+             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
+        {
+            rc = -EILSEQ;
+            goto out;
+        }
+
+        i += (1UL << cur_order) -
+             ((gfn_x(start_gfn) + i) & ((1UL << cur_order) - 1));
+    }
+
     rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
                        p2m_invalid, p2m_access_rwx);
+
+out:
     p2m_write_unlock(p2m);
 
     return rc;
-- 
2.7.4


