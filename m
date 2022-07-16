Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9C576F8D
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 16:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368760.600147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjEL-0002Qm-K3; Sat, 16 Jul 2022 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368760.600147; Sat, 16 Jul 2022 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjEL-0002OZ-HI; Sat, 16 Jul 2022 14:57:17 +0000
Received: by outflank-mailman (input) for mailman id 368760;
 Sat, 16 Jul 2022 14:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oCjEK-0002OT-Bm
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 14:57:16 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9479f075-0517-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 16:57:15 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id o12so8666508ljc.3
 for <xen-devel@lists.xenproject.org>; Sat, 16 Jul 2022 07:57:15 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a19504d000000b00489e64dcf75sm1500151lfj.204.2022.07.16.07.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 07:57:13 -0700 (PDT)
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
X-Inumbo-ID: 9479f075-0517-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+NcaTZFgfiP0eoFL71IUd0qkS2K5R9KmoF4rAY2ohQ=;
        b=qOg58/SBYgZEHIQSoU92g09pU7mKL2ywx+oT7Y+Yal1Lif5PIj4bgjIGg6IVB/M/R+
         Z5GACmWnBDAvDQZKkZZqCiWXWh9IeqQUN5StZCi/7gS7WgT9veD30LhGEt7SgR9M0HUQ
         RmyIP/c49StDJZp9DCEQDHPgYB7iRQBW7N4hyw98B78ee5LIAzmI3MZjtCJx+zVcjWeY
         CxvGFgIKhd5ZdBEQkws/83+jDQakAct+EMO60fNR9GEvs2Qcnv0RMiyhvfWvuSoL24QG
         H08kh7z1VVHCvforPQreUJG50xSV/WN5awjJ1Cz4EPXELlIvgaiT7QO4/JV7Vw19rY6K
         qHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+NcaTZFgfiP0eoFL71IUd0qkS2K5R9KmoF4rAY2ohQ=;
        b=f4LLRWNARduFm1JSuURLWyLN0Mpc3WftKf0gFRFgUHa2J+zZWmvUH2EM3VZN7D+Eh5
         MMhv4xCGpB1IK5Y012btpUCWrzoL7D5r/ENGX4cEi4AKwdYpoU/vhuooITVOlv5+rE+q
         spEs6NT7D0k0WdV0nVgskPgc1S7jG3EtBBRegZJDHhrTC9oZrxFnIFMrSk81mFzXj1BV
         +LgOr+2ZLG0ddsPh5frRL/oh3P8bnFpN2eBpEcfTrwS9FUsvNMrmC6t5nGnKJ7VdKr0L
         Z9pEGB8l/DPnxyIfHp9777RG3CyXx/ZR9EZ2o9WWcAYMcsD1TBkaFEvouhL5gG6JQuwn
         mcrA==
X-Gm-Message-State: AJIora+BOGi0gu0sVsfUFbAY3IXYGHQ+Tyqt4pjcPQxNpR5JBa/c/VIT
	RWa2ME6pwFkzPmmmw7pQzFe/jVOFSV3wDA==
X-Google-Smtp-Source: AGRyM1uqz1fvzo324unIq/HAStICivJUs7FuREFQ5tCJTfLKcWIQxiWDSduv98MIzDvVntCvJSCw0Q==
X-Received: by 2002:a05:651c:4cb:b0:25d:9a43:16fd with SMTP id e11-20020a05651c04cb00b0025d9a4316fdmr6626776lji.493.1657983434261;
        Sat, 16 Jul 2022 07:57:14 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH V7 1/2] xen/arm: Harden the P2M code in p2m_remove_mapping()
Date: Sat, 16 Jul 2022 17:56:57 +0300
Message-Id: <20220716145658.4175730-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Borrow the x86's check from p2m_remove_page() which was added
by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
"x86/p2m: don't assert that the passed in MFN matches for a remove"
and adjust it to the Arm code base.

Basically, this check will be strictly needed for the xenheap pages
after applying a subsequent commit which will introduce xenheap based
M2P approach on Arm. But, it will be a good opportunity to harden
the P2M code for *every* RAM pages since it is possible to remove
any GFN - MFN mapping currently on Arm (even with the wrong helpers).

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
You can find the corresponding discussion at:
https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/
https://lore.kernel.org/xen-devel/1652294845-13980-2-git-send-email-olekstysh@gmail.com/

Changes V6 -> V7:
   - make this commit to be the first
   - update commit description and add a comment in code
---
 xen/arch/arm/p2m.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index d00c2e462a..2a0d383df4 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1308,11 +1308,39 @@ static inline int p2m_remove_mapping(struct domain *d,
                                      mfn_t mfn)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned long i;
     int rc;
 
     p2m_write_lock(p2m);
+    /*
+     * Before removing the GFN - MFN mapping for any RAM pages make sure
+     * that there is no difference between what is already mapped and what
+     * is requested to be unmapped.
+     * If they don't match bail out early. For instance, this could happen
+     * if two CPUs are requesting to unmap the same P2M concurrently.
+     */
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
2.25.1


