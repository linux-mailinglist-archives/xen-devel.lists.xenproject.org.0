Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B34DD64C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 09:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291799.495820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV88K-0001Mh-PH; Fri, 18 Mar 2022 08:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291799.495820; Fri, 18 Mar 2022 08:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV88K-0001Kg-Ly; Fri, 18 Mar 2022 08:38:52 +0000
Received: by outflank-mailman (input) for mailman id 291799;
 Thu, 17 Mar 2022 23:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Os4G=T4=gmail.com=colin.i.king@srs-se1.protection.inumbo.net>)
 id 1nUzpS-0005lX-2V
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 23:46:50 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82d5d68b-a64c-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 00:46:48 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id d7so9579338wrb.7
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 16:46:48 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm4860565wrm.82.2022.03.17.16.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 16:46:47 -0700 (PDT)
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
X-Inumbo-ID: 82d5d68b-a64c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44jSVu9ViGX65V2KV4sJoKN91g8S2sbZ550L2N5DUJ4=;
        b=l/0VWzdsq+0tapKmp9GM2+I2R4GUGVKdkGWYWuAwvHzKLPI3p5TshglsScGVDa6NFW
         DaUSL0XENlAwNhjU9nCyUGZAAKbuLTE5fPZkTuqREBsP1ImFELxbCE3lmp3Tj4nI/jZy
         9MwmBjSZpXSmwI4DVJZDYjtVulXynQRqIUs3I7K0QsW9YAidOZSK0Tv9Ac8x3k42NYBa
         rI6tO6VGSjlkuhdZoQ0C6BU3ba7i/97qKi1VIMAusTrJVubzZfr5sUa8Dru53eP9ebuz
         wQGxh7PiQr4lqSAjy9LGqm91YM5rAGN3LoMMnC2WtFXix6zXjBdx0Wr+n4qempHJNmVk
         hZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44jSVu9ViGX65V2KV4sJoKN91g8S2sbZ550L2N5DUJ4=;
        b=lJ9KCiYWSl63t/Ihvu688m9sOwaL+Z9wNLImdeJPORLDLg/o5GWa1cwklkok1qv8NL
         0jxLVwJ1d7msBIriuliY8e5w++ZyML5/vWExpFKzcut3GvAzBUsz4iwUi6yltEX3tiDH
         OGNAjP3gtk/JKkqcr8nBWcrCuvBhe6EmXxAWwsbeUnwU/5KxKVUvyi727eO8V6I0M5DS
         eAyEQvWUBwcE1w35lwoJndyeOWUdfTRT/S8e5MEMRDWSXsRtf4//NRWXS4Q435QVLtCP
         Zdfry5fjHIcNeMZAFv1OLspcrr+umoJJIONG56QjLG1E9cMajPWoaX+Kz5t/cB8RC58p
         cHZQ==
X-Gm-Message-State: AOAM530HW+u53FZnPD018sGKSJiJkvsWAtTMvGSIJbbdlrMqFon1D9oA
	Cfm5vocy6URxy2Ln9nD8A9M=
X-Google-Smtp-Source: ABdhPJxdH/WN2xf224PSCmdD+V5oRw0iLxFKpaeNeTNgCZ9Kx3jYO0+gAPl3kcA/9A7EbQbNAzpyng==
X-Received: by 2002:adf:efd2:0:b0:203:db42:c56c with SMTP id i18-20020adfefd2000000b00203db42c56cmr5842974wrp.698.1647560808002;
        Thu, 17 Mar 2022 16:46:48 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] xen-blkback: remove redundant assignment to variable i
Date: Thu, 17 Mar 2022 23:46:46 +0000
Message-Id: <20220317234646.78158-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable i is being assigned a value that is never read, it is being
re-assigned later in a for-loop. The assignment is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/block/xen-blkback/blkback.c:934:14: warning: Although the value
stored to 'i' is used in the enclosing expression, the value is never
actually read from 'i' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/block/xen-blkback/blkback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index d1e26461a64e..de42458195bc 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -931,7 +931,7 @@ static int xen_blkbk_parse_indirect(struct blkif_request *req,
 	if (rc)
 		goto unmap;
 
-	for (n = 0, i = 0; n < nseg; n++) {
+	for (n = 0; n < nseg; n++) {
 		uint8_t first_sect, last_sect;
 
 		if ((n % SEGS_PER_INDIRECT_FRAME) == 0) {
-- 
2.35.1


