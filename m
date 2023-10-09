Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E987BDCDA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 14:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614364.955410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjn-0008Ap-Vr; Mon, 09 Oct 2023 12:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614364.955410; Mon, 09 Oct 2023 12:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjn-00082y-Pv; Mon, 09 Oct 2023 12:51:55 +0000
Received: by outflank-mailman (input) for mailman id 614364;
 Mon, 09 Oct 2023 12:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTJG=FX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qppjm-0007s6-43
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 12:51:54 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c04f31c-66a2-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 14:51:48 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40684f53bfcso41473925e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 05:51:48 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm9589576wru.35.2023.10.09.05.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 05:51:47 -0700 (PDT)
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
X-Inumbo-ID: 9c04f31c-66a2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696855907; x=1697460707; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJrVk7LMkW0zXyVZPEan5SEC7eFr57cgF9BbE1wu9kQ=;
        b=dMJKf9gUQMIb2G9kivhJBzjZ8FeeqDer0X3ES1cNX/7GztKs3RUU/lJCX0BvN9GYu5
         Q9nrsqgqNJ585dOArfjkXx0j+JlQ2dnc2BgEJjudEoLVS+gP1BOh8gfSFEYqMfzEAjG2
         wkJ9XKY1kTa8TNQlRlXUpoWxZ0mMpdhmZOTd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855907; x=1697460707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJrVk7LMkW0zXyVZPEan5SEC7eFr57cgF9BbE1wu9kQ=;
        b=dQRGs0vBp4b0H1LEhfuDB4H/7S5A/eIq1gVTCXM9q0eDXlSUJdzqprEMzyFuzta7CQ
         moJXhe4fk47XnpJgH+2oTFlWkzJcNiifxdaHrCuyoFXctk7jO1XpVZAnVAD5PLQQLm5s
         INvxudxCVEmB1oU8Laj0GwaFTkVMJJxhnFEgJw9bg2mHElUYB0AcQ6Fw3LoE8t6n15cv
         YIhY1sQY9KteNckqiuSnHQ7WS575CUPWHRhyVPhy4WIsqT2jg6iFUJPsgRSqBVrHAU1s
         9FtZ60GLx6RxeY+GcLSkh7tBu8PmEgyrC3rC3PgfGcfnRaHpQaL/Tk77kBOR7sEz/B2e
         //Pw==
X-Gm-Message-State: AOJu0YzzJasZ1WQxjXhIdmpr1FP3LGeo+SUCFOgdvXY3AU5WMMxEzv3N
	++dFTfQBhZs68z2k4F3DP79Silu7XLCoawiqhqA=
X-Google-Smtp-Source: AGHT+IESjYH2aLK0ihomB1LR5F4AseZXlMV2cuD6IJLvNY5H4vuHIn7kzIHSjhTNJ93N/w3aW2SXyQ==
X-Received: by 2002:a5d:6051:0:b0:321:4b47:d1c0 with SMTP id j17-20020a5d6051000000b003214b47d1c0mr11245954wrt.71.1696855907562;
        Mon, 09 Oct 2023 05:51:47 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: [PATCH for-4.18 3/5] xenalyze: Don't expect an HVM_HANDLER trace for PAUSE vmexits
Date: Mon,  9 Oct 2023 13:51:35 +0100
Message-Id: <20231009125137.1329146-4-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009125137.1329146-1-george.dunlap@cloud.com>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither vmx nor svm trace anything, nor is there anything obvious
worth tracing.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Release justification: This is a bug fix; a minor one, but also in a
non-critical part of the code.

CC: Anthony Perard <anthony.perard@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiodakou <xenia.ragiadakou@amd.com>
---
 tools/xentrace/xenalyze.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index fc25ac3589..2faf66500d 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -4631,6 +4631,7 @@ void hvm_generic_postprocess(struct hvm_data *h)
             switch(h->exit_reason)
             {
             case VMEXIT_VINTR: /* Equivalent of PENDING_VIRT_INTR */
+            case VMEXIT_PAUSE:
                 return;
             default:
                 break;
@@ -4643,6 +4644,7 @@ void hvm_generic_postprocess(struct hvm_data *h)
                 /* These just need us to go through the return path */
             case EXIT_REASON_PENDING_VIRT_INTR:
             case EXIT_REASON_TPR_BELOW_THRESHOLD:
+            case EXIT_REASON_PAUSE_INSTRUCTION:
                 /* Not much to log now; may need later */
             case EXIT_REASON_WBINVD:
                 return;
-- 
2.25.1


