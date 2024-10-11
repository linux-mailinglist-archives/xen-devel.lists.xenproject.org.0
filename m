Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC91999F57
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816780.1230934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBOS-00037i-0u; Fri, 11 Oct 2024 08:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816780.1230934; Fri, 11 Oct 2024 08:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBOR-00034x-Sh; Fri, 11 Oct 2024 08:53:03 +0000
Received: by outflank-mailman (input) for mailman id 816780;
 Fri, 11 Oct 2024 08:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szBOQ-0001pW-2k
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:53:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ceffee-87ae-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 10:53:00 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a99b1f43aceso167644966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:53:00 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc290sm186131566b.155.2024.10.11.01.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:52:59 -0700 (PDT)
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
X-Inumbo-ID: 37ceffee-87ae-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728636779; x=1729241579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=OLnUT6Yitv2Gtmooe6pGIdG9k9ScqxrHgy6OnIZ0Jn4fMF+UW9SUqeekj2+7C7zysL
         L0qQlGvFWchbTqabaNWldqDXQMcCZNiPoh7zVMV8ibCNFv1dgh0Z8N8hxmSK1y7nxy+w
         5Sr+LwP7Usykym7mJF96gLm+XJ+VgRv23ogF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636779; x=1729241579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=mC9hMl2z6RZdEDCjw4aQS4OI95NStH/MGHzM1QSshnyRWo0g1FGRAKSZp2hqxO+1kM
         +GEMMkySimaXbFg1dN/Hip0UTOjzCSXKcQkfeS2dXnCoaHbzQOL/xeM+dVBvV9/Ie4Bn
         OkFLjmT4xbbBQFGbgffxOJJh+WL18euV0rZzXB0ZIc2W781I7GArHVbNFHf+n+tjJbVV
         O6n0aEylgaJn/5CctbK4a46i78spasG0/zkmSy53CSjeaEh0lyQBuRr3bt1LPNlOxoM2
         sIJmbuZYU2uTDs3BzlZlXjr2WAmwchpSl8DjcDdYe1WoopJmoZS/0cj+5ODu4GkLpXjr
         xwQg==
X-Gm-Message-State: AOJu0YyH+NUfLSBlsG2q8cM+ITVqI/yXrVQE+0mv2mAPdWpqoc1w3TBx
	QecKFJ4QpBvPEMvkZ+7w4CYGQz+c4EE1eXrgPIpC9pa0Q4hSkVIw3ixdTJQLFBaW8UA4qJrdA2S
	Q
X-Google-Smtp-Source: AGHT+IGBOYE4zyCRUvPPmI/UkTNGIfxKjFn2FgdW0kCrdoLIEAb+RPQdUsb4nxpLbmx23vbnvusOqw==
X-Received: by 2002:a17:907:3e9f:b0:a8a:8dd3:f135 with SMTP id a640c23a62f3a-a99a10edd5dmr494381266b.14.1728636779566;
        Fri, 11 Oct 2024 01:52:59 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 5/5] x86/boot: Clarify comment
Date: Fri, 11 Oct 2024 09:52:44 +0100
Message-Id: <20241011085244.432368-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011085244.432368-1-frediano.ziglio@cloud.com>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/reloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e50e161b27..e725cfb6eb 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -65,7 +65,7 @@ typedef struct memctx {
     /*
      * Simple bump allocator.
      *
-     * It starts from the base of the trampoline and allocates downwards.
+     * It starts on top of space reserved for the trampoline and allocates downwards.
      */
     uint32_t ptr;
 } memctx;
-- 
2.34.1


