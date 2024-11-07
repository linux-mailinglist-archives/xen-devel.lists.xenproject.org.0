Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8B9C09D7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831986.1247374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Ea-00046T-I1; Thu, 07 Nov 2024 15:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831986.1247374; Thu, 07 Nov 2024 15:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Ea-00044S-DT; Thu, 07 Nov 2024 15:15:44 +0000
Received: by outflank-mailman (input) for mailman id 831986;
 Thu, 07 Nov 2024 15:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94EZ-0002r4-E6
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:15:43 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 262c7c07-9d1b-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:15:40 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso182766766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:15:40 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc577fsm105065666b.93.2024.11.07.07.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:15:38 -0800 (PST)
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
X-Inumbo-ID: 262c7c07-9d1b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI2MmM3YzA3LTlkMWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkyNTQwLjM1MDg4OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730992539; x=1731597339; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esNbhQqTrLxjjeO/Fjv64wjBfsHTSsTnJcFIKd2KO/E=;
        b=VMiUTWH+lh6tqfdVMEdob1F4dG4u1/b4hYWYHefBz5OMWR5fWZMiRNiM8QyTRpu7fB
         oOsKDsaYU27LtuVLOXaS3uVfDwuwSqVyBjP5f9htfw+wzDk9de9p63g+Y7uQCQHBzFfm
         JqDKfVFwNahxn/6UvD6SImIVpKIAh9xianLFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992539; x=1731597339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esNbhQqTrLxjjeO/Fjv64wjBfsHTSsTnJcFIKd2KO/E=;
        b=jlrzrTBa6XMUdGLXSsaTs2tFKUjo8u5/Jc+UAKWSWffwtDM4/v9N3S2aGhTUXpLBJQ
         qNfmGdVT/HGO8f4r6BmJddsTwRRwbDsdVTPCLT6bPtZLluW8tTOQA5t4+euTg2dypNhf
         u3piPtLsUHwCAQx8eLWormIXLzD313nOHjvkNIhSOWrDNcGrsPt1FfR1wJgNTMMUxUEA
         LkAkVU+ymza1vOlUtKARlkBdkajDnXt07kjnS6X8GDJnD1LbgmrtSH1aK3zqlJoqpO0r
         sNd+XIJxMZGp67IlbtaqOJv+p83C1UDEXTyiqoDzn1nexbtmiBJbC8GgjsDWF3lXc16o
         8pvw==
X-Gm-Message-State: AOJu0YwOQ/j5BNbRAIFrXUgqq/nUiMC1mFokBzkANMm3v0M1bCn8w8H4
	6r60LAfn7hwE97gIP//dWJmssCSeFZze/xFPvlEoejzYuDlFuwwbdPS0OEEj+zSlO0udTpCPFnv
	1
X-Google-Smtp-Source: AGHT+IFGGHxjWVRiTS9h+iQ0FBRCyQVa00MB3gGIgAdh3O6Ttgjh4FyWdGEZbf9AErzCWO2quu11jw==
X-Received: by 2002:a17:907:ea6:b0:a9a:3ca0:d55a with SMTP id a640c23a62f3a-a9eeb51b547mr26028366b.57.1730992538574;
        Thu, 07 Nov 2024 07:15:38 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/4] create-diff-object: update default alt_instr size
Date: Thu,  7 Nov 2024 16:15:07 +0100
Message-ID: <20241107151509.73621-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107151509.73621-1-roger.pau@citrix.com>
References: <20241107151509.73621-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The size of the alt_instr structure in Xen is 14 instead of 12 bytes, adjust
it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index fed360a9aa68..d8a2afbf2774 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1000,7 +1000,7 @@ static int altinstructions_group_size(struct kpatch_elf *kelf, int offset)
 	char *str;
 	if (!size) {
 		str = getenv("ALT_STRUCT_SIZE");
-		size = str ? atoi(str) : 12;
+		size = str ? atoi(str) : 14;
 	}
 
 	log_debug("altinstr_size=%d\n", size);
-- 
2.46.0


