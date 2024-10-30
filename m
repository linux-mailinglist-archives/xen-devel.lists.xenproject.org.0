Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9E9B623A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828131.1242971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67C8-000239-7y; Wed, 30 Oct 2024 11:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828131.1242971; Wed, 30 Oct 2024 11:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67C8-00020C-54; Wed, 30 Oct 2024 11:49:00 +0000
Received: by outflank-mailman (input) for mailman id 828131;
 Wed, 30 Oct 2024 11:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t67C7-000206-Bx
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:48:59 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f104f85a-96b4-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 12:48:55 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a156513a1so1020781766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:48:55 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f028fcesm566968666b.53.2024.10.30.04.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 04:48:54 -0700 (PDT)
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
X-Inumbo-ID: f104f85a-96b4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYxMDRmODVhLTk2YjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg4OTM1LjU3Njg3OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730288934; x=1730893734; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFA4KnpqYQAYG7V06hkXCF08eankx3XnmRg26x0tlVI=;
        b=PE6/O5SZUjJm5zcytYp2MfA/1J9DMGlWvhGNpx9GGY+uZMTQ+FnZz/VB2BQxqymiLG
         eR775DKLBQoF0fp+tYJC5xGrjufKPbzSKsFP9OdzChMgvNdROVarGQnnwIrLpMnlWgz4
         fOWifNpelCxs2RZ6M0iP9QvmJt67Uqx+CHfDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730288934; x=1730893734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFA4KnpqYQAYG7V06hkXCF08eankx3XnmRg26x0tlVI=;
        b=HKrPBzfVNdzz+oj1XLRLUjjY1pKjT1Y9YYLUnJR2d4eAUlpy/Bos2JAR0U1UWbvkeD
         HLOc0Ri+7WBDJ8CuGyWDUhhcgeTbGiNIhiaQUFtfLLYH+ZDacaJpsiihtmo8YXQQHw0f
         +OnRifiotfPtBJ14BPoF57z6DqGgmRyHN/BGfh5jheK6qzhGn8eWY1v1PeeUDkQA3YoD
         cz1Huuz1wQoNjw1/wUTNQgqvXCw6bRDcpOk2hGM45MRGaoo8OxocQhQs/B5n6biPvj4Y
         Y15jjYtDu0ZOjwcVYPVHfxTqNojzKQ9Vr0yzAQGaRn0jlRtVpEgf1hG9dGMYX5vDIYb0
         Dm6Q==
X-Gm-Message-State: AOJu0Yz9NuYwRxxyZkaR8e3JxCeEz0SgdeRQZb35kAEd+WXQgYiZK42m
	ghlq14SUhd4WnC2lOoWQdR0LaRcY8f6jVOMfbTWYduCLIJCGClT8sG9VyCrlJYb3suiKNyd0EgJ
	y
X-Google-Smtp-Source: AGHT+IEKW9z+hv1cqQeIZtcizoHAP6ApgMZ3QzzL9FXjrhDF82/rt9gl+s1ww0c30tP1lHwkbbQYvA==
X-Received: by 2002:a17:907:948b:b0:a9a:835b:fc8e with SMTP id a640c23a62f3a-a9de6330780mr1525664966b.54.1730288934508;
        Wed, 30 Oct 2024 04:48:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/mm: ensure L2 is always freed if empty
Date: Wed, 30 Oct 2024 12:48:52 +0100
Message-ID: <20241030114852.55530-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic in modify_xen_mappings() allows for fully empty L2 tables to
not be freed and unhooked from the parent L3 if the last L2 slot is not
populated.

Ensure that even when an L2 slot is empty the logic to check whether the whole
L2 can be removed is not skipped.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've attempted to find a Fixes tag for this one, but I'm afraid there have been
many changes in the function, and it's possibly the code that introduced the L2
freeing (4376c05c31132) the one that failed to originally adjust this case.
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d537a799bced..0f53dcebad95 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5717,7 +5717,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             v &= ~((1UL << L2_PAGETABLE_SHIFT) - 1);
-            continue;
+            goto check_l3;
         }
 
         if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
-- 
2.46.0


