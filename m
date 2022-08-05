Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA6B58AAFC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381157.615727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwhA-0005F1-Qx; Fri, 05 Aug 2022 12:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381157.615727; Fri, 05 Aug 2022 12:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwhA-0005Bc-K1; Fri, 05 Aug 2022 12:44:52 +0000
Received: by outflank-mailman (input) for mailman id 381157;
 Fri, 05 Aug 2022 12:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJwh9-0004qq-5V
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:44:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65302a48-14bc-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:44:50 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id l4so3094541wrm.13
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 05:44:50 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a5d698b000000b0021eff2ecb31sm3993185wru.95.2022.08.05.05.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 05:44:49 -0700 (PDT)
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
X-Inumbo-ID: 65302a48-14bc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VhNWeIBhD0ahO/HsUZnkkDtHhV0EasH/pgWjfOxpRkc=;
        b=bkb1rXYyFU5hNcge0JinQrDqZngqcTakb6MnA5dReBB5kkIlceSLCJ6PM+i4sH7eMT
         Ys5t9YizLNIrBHenG4zKoBaDKYr664HjUK35Cd6NjkW1+hx8fFhAh0s7LWIq+M6JzYCp
         DKIQzFMFDFns/vm8Nm6960cH8eZh3n5JYuXFFSc5u320z8BwYxcEkjKYw0uepOmmoT5k
         gNoJsx+W8wpQbFYjpe7rMXsV3DrMGTblRGz0NcoLBmAoBqzF5CEMvvz223te6qd+RAHo
         c3TFI33XkFEWJxt1wPnU5YDfCLQSjkuzAgPaQ/YzFspeXnnPW4pen85PDpR38lY86LDM
         AMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VhNWeIBhD0ahO/HsUZnkkDtHhV0EasH/pgWjfOxpRkc=;
        b=iLQVq23CCxv9ff6zY3zxIcUg1LkdTj+F4Un+7AepwlgEtQYNqWkcUQdXgib7gfWahA
         SPhyHLqjvdEmPXxnUWNDT4aUGKj9ayJ+pEqVkGgJgNmtdLqH/AI+JF6zQU9Tndv3ROET
         L2OSqhFiJe2t6SnRgp4r6vnBeDsK9Wi3mJlWThhV8A9c9RWJwDqxfAu5ZgRfKHp8Jsga
         vTlI160BtcV7jtfBdQc7K6rgL+VZ8Tn2RrFMvpbJIpsgxeaWSWu+Ku2ll+Er4MhsUzY+
         JetGHwVMWQXiLpdVi9k9brLtYOjSuAuEUvoC6G2oSQJqpeKOg/OEPr1RO5ru6P6T3ClV
         uB+Q==
X-Gm-Message-State: ACgBeo3FlWKZBbWkLvr3wz5pXoezC9+hlbNyGXFFpntbuMSR6wrLavzG
	9PLCXDlCBhv7YFA3BTqaDx6iHxTVtCM=
X-Google-Smtp-Source: AA6agR7dqhpV+NLotH9pCvm+py5M3jygWpuBvRUzcBFCO8zEZA3m+7jqUVFbB5J26A59y5xQlXV3+Q==
X-Received: by 2002:a5d:584d:0:b0:220:6cca:706d with SMTP id i13-20020a5d584d000000b002206cca706dmr3964610wrf.363.1659703489781;
        Fri, 05 Aug 2022 05:44:49 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] xen/cpu: Add missing white space around arithmetic operators
Date: Fri,  5 Aug 2022 15:44:41 +0300
Message-Id: <20220805124442.1857692-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805124442.1857692-1-burzalodowa@gmail.com>
References: <20220805124442.1857692-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- new patch

 xen/common/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index feb2a6634e..c48a1cabd2 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -25,12 +25,12 @@ const cpumask_t cpumask_all = {
  */
 
 /* cpu_bit_bitmap[0] is empty - so we can back into it */
-#define MASK_DECLARE_1(x) [(x)+1][0] = 1UL << (x)
-#define MASK_DECLARE_2(x) MASK_DECLARE_1(x), MASK_DECLARE_1((x)+1)
-#define MASK_DECLARE_4(x) MASK_DECLARE_2(x), MASK_DECLARE_2((x)+2)
-#define MASK_DECLARE_8(x) MASK_DECLARE_4(x), MASK_DECLARE_4((x)+4)
+#define MASK_DECLARE_1(x) [(x) + 1][0] = 1UL << (x)
+#define MASK_DECLARE_2(x) MASK_DECLARE_1(x), MASK_DECLARE_1((x) + 1)
+#define MASK_DECLARE_4(x) MASK_DECLARE_2(x), MASK_DECLARE_2((x) + 2)
+#define MASK_DECLARE_8(x) MASK_DECLARE_4(x), MASK_DECLARE_4((x) + 4)
 
-const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
+const unsigned long cpu_bit_bitmap[BITS_PER_LONG + 1][BITS_TO_LONGS(NR_CPUS)] = {
 
     MASK_DECLARE_8(0),  MASK_DECLARE_8(8),
     MASK_DECLARE_8(16), MASK_DECLARE_8(24),
-- 
2.34.1


