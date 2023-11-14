Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE47EB282
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632634.986952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZY-00086Q-DB; Tue, 14 Nov 2023 14:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632634.986952; Tue, 14 Nov 2023 14:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZY-00083N-9T; Tue, 14 Nov 2023 14:39:24 +0000
Received: by outflank-mailman (input) for mailman id 632634;
 Tue, 14 Nov 2023 14:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uZW-0003b0-MB
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:39:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98fc5ac9-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:39:21 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso1146179066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:39:21 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 rp13-20020a170906d96d00b009ddb919e0aasm5622830ejb.138.2023.11.14.06.39.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:39:20 -0800 (PST)
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
X-Inumbo-ID: 98fc5ac9-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972760; x=1700577560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNMQSJ9n3HwpNaurQlo3tUtiIa6U/WmLwhKlbRCATs0=;
        b=Dx7VXhFxIiIngIEJ1XutLBKC7QnBtzYF6jW7YwITSKt2Hm5oMM51qflx7tS+jWs5Vl
         Yv7hZg6OxIhD7gUVsBF5gYYIjUIOcf9XVYEqfLRkiHIVqzQ8XomlnS3SnClcxyT2hSie
         8OdB1QJJp65YwdQiIzhh7y6vU2Iod2yiRSGohseEz1F+FmKdhh179peR6qFTLGThrfaP
         v2uoq9Cs7UQn4cHJELwA7ZKQnnjLWwQqGK4NIj6OW9+8X7j4I9G9637SO4g3tNlVIVH7
         zIiHbfH+Ah9GIl43JG21vkEaAo6keMsZW8yJ2LiXINyoJlARwHcu+KttrCgde8dbmnzn
         6PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972760; x=1700577560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNMQSJ9n3HwpNaurQlo3tUtiIa6U/WmLwhKlbRCATs0=;
        b=KtBEoy9XQq+r+reRFS31Mt3Wo2iz22EqatiN8IJdTXQ5wqX4Yc544kvMLgtbt19fbU
         mTvVpN0ZV7k8E3edhdiOjJA6sqzu0WymrCvJ4DhAdzQZ8db32JoMXBcjfyc504huUEaS
         hERH5ivor4yrBwMmi6hogYhP/R865M4UCQ5FRFOZy/xPjUP+qiQrJ+A0ZHLl4LlWN7VV
         /gjyXGedOT7PzEgIp1MzRjacnA48ERShJ3L6P7NVAsfhhVEG+FyUjJeZpfSEVQoQldMi
         +HHmeZGVG7POo8OGcL6S6dG7KxWprgh73nY3dUDj0EIGWW4vL8+iFkzI1nsPXTJGnK2I
         webg==
X-Gm-Message-State: AOJu0YxQAuRgOUJ1AVKz2wbfdcEmiUQBe7YjLLulGiVyEOdPowjT6bgK
	L4Qq2qHVt3vNpQzsU57cWqH7rg==
X-Google-Smtp-Source: AGHT+IEprkHMikBtwTk6Pc2HglM2aACFqynKnIxKilr0MgI5mWMBku8mpMF5XwofVv89mcZ1ndbJxA==
X-Received: by 2002:a17:906:d7b2:b0:9ef:b466:abe0 with SMTP id pk18-20020a170906d7b200b009efb466abe0mr1430110ejb.8.1699972760684;
        Tue, 14 Nov 2023 06:39:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH-for-9.0 v2 09/19] hw/block/xen_blkif: Align structs with QEMU_ALIGNED() instead of #pragma
Date: Tue, 14 Nov 2023 15:38:05 +0100
Message-ID: <20231114143816.71079-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Except imported source files, QEMU code base uses
the QEMU_ALIGNED() macro to align its structures.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/xen_blkif.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/block/xen_blkif.h b/hw/block/xen_blkif.h
index 99733529c1..c1d154d502 100644
--- a/hw/block/xen_blkif.h
+++ b/hw/block/xen_blkif.h
@@ -18,7 +18,6 @@ struct blkif_common_response {
 };
 
 /* i386 protocol version */
-#pragma pack(push, 4)
 struct blkif_x86_32_request {
     uint8_t        operation;        /* BLKIF_OP_???                         */
     uint8_t        nr_segments;      /* number of segments                   */
@@ -26,7 +25,7 @@ struct blkif_x86_32_request {
     uint64_t       id;               /* private guest value, echoed in resp  */
     blkif_sector_t sector_number;    /* start sector idx on disk (r/w only)  */
     struct blkif_request_segment seg[BLKIF_MAX_SEGMENTS_PER_REQUEST];
-};
+} QEMU_ALIGNED(4);
 struct blkif_x86_32_request_discard {
     uint8_t        operation;        /* BLKIF_OP_DISCARD                     */
     uint8_t        flag;             /* nr_segments in request struct        */
@@ -34,15 +33,14 @@ struct blkif_x86_32_request_discard {
     uint64_t       id;               /* private guest value, echoed in resp  */
     blkif_sector_t sector_number;    /* start sector idx on disk (r/w only)  */
     uint64_t       nr_sectors;       /* # of contiguous sectors to discard   */
-};
+} QEMU_ALIGNED(4);
 struct blkif_x86_32_response {
     uint64_t        id;              /* copied from request */
     uint8_t         operation;       /* copied from request */
     int16_t         status;          /* BLKIF_RSP_???       */
-};
+} QEMU_ALIGNED(4);
 typedef struct blkif_x86_32_request blkif_x86_32_request_t;
 typedef struct blkif_x86_32_response blkif_x86_32_response_t;
-#pragma pack(pop)
 
 /* x86_64 protocol version */
 struct blkif_x86_64_request {
-- 
2.41.0


