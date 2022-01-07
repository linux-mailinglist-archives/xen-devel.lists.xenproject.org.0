Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2022A4877DD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 13:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254427.436251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5omq-0005XM-89; Fri, 07 Jan 2022 12:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254427.436251; Fri, 07 Jan 2022 12:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5omq-0005Uu-4S; Fri, 07 Jan 2022 12:56:04 +0000
Received: by outflank-mailman (input) for mailman id 254427;
 Fri, 07 Jan 2022 12:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R3Uf=RX=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1n5omp-0005TO-GQ
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 12:56:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05f98a5d-6fb9-11ec-81c0-a30af7de8005;
 Fri, 07 Jan 2022 13:55:00 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 az31-20020a05600c601f00b003475c3c3d03so919940wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jan 2022 04:55:51 -0800 (PST)
Received: from banana.davidvrabel.org.uk (banana.davidvrabel.org.uk.
 [82.70.146.42])
 by smtp.googlemail.com with ESMTPSA id c11sm9287264wmq.48.2022.01.07.04.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 04:55:50 -0800 (PST)
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
X-Inumbo-ID: 05f98a5d-6fb9-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DO2WVkGVgOC/LALR+U5f0JmohdQdLYsVuU45cS69bnQ=;
        b=ATDsX/hwyy28kcpq+CZTqMgCt+f/Rl9HW1TDz3o/lNjemK0kkcjeyF4ucBs9WHn4Eb
         IxAEewHusd3cYwIHtQ2XuMBl10DjDSdcBMWzXXCXY3sStnZsSZDxxeWaOgwfhXBe8d+u
         QTD5Rksto8FhU7JETvM6tjPBIREOjR/aFj8OEEfxrcmusTCmjMviVk7464cxO1THyGVK
         FGhPR1kPKAoMwrVUxIMgNECaZJQEr2jBMDCWCAOJGgxJbHQSf2Nb7/E/eNMmK26me9zn
         96aKB7OyJB2P25nht43E+4WSpaGKuEyBYmPuJxe1es8cpr42Hunt+/7jgVJ1WKJquh09
         y5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=DO2WVkGVgOC/LALR+U5f0JmohdQdLYsVuU45cS69bnQ=;
        b=m+avo1fN0CoUC6oLlsJIy/S/yP/j1dIB7PmGY3N/zxqI5gF7PZblUa/l0HV6VXk9sk
         XpeaWXRRsxe2b6jHmHDY2U2NzI9Uf7AoiVXxkPYh7q7TKVkjv5wwvIKSqaJCkRBr/11h
         LzhQwTfaz6taFwuZgdyUwKxxYxkVSpeuXh81H3qs3Kp/XcQnGkadKXAjWK2sNgSg+Dgk
         DuRzZwZLEgVzpAvmQQpdMljo6LP87cqiy1HfYp9m9jYlkEHxMhDsvKPElZ4p9iU2Iq97
         Rmux4t85/NkcINok2trplUAQQ0ocDT/gCPMbl5X1FSjXAhZqKmvt7hilNPsSafvPup+y
         Y46A==
X-Gm-Message-State: AOAM5303dd7Lu07d5fCcisoNSjGYSpaiX9cRmsgO8oZaolYUjtWzlQbO
	w4nZ989sQ7BES+ukvHxx2qPldg0dx+qLlw==
X-Google-Smtp-Source: ABdhPJxW8AgVGnOkEOu3yFTNFQXu+nE9gdCzlkl/I/89snuU5KEBNw0gTXoQmo5EqknHJH92g9rvFQ==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr11110961wmk.96.1641560150514;
        Fri, 07 Jan 2022 04:55:50 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH] x86/hvm: reserve another HVM context save record ID for Amazon
Date: Fri,  7 Jan 2022 12:55:42 +0000
Message-Id: <20220107125542.212725-1-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amazon's guest transparent live migration work needs another save
record (for event channel upcall vectors). Reserve another HVM context
save record ID for this.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
I've added it to the end, keeping the unused ID at 21.
---
 xen/include/public/arch-x86/hvm/save.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..2de3dfd9bb 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -641,7 +641,7 @@ struct hvm_msr {
 
 #define CPU_MSR_CODE  20
 
-/* Range 22 - 34 (inclusive) reserved for Amazon */
+/* Range 22 - 35 (inclusive) reserved for Amazon */
 
 /*
  * Largest type-code in use
-- 
2.30.2


