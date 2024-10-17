Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47039A23D3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 15:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820592.1234139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbN-0007vY-Bs; Thu, 17 Oct 2024 13:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820592.1234139; Thu, 17 Oct 2024 13:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1QbN-0007sd-6R; Thu, 17 Oct 2024 13:31:41 +0000
Received: by outflank-mailman (input) for mailman id 820592;
 Thu, 17 Oct 2024 13:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcP3=RN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1QbL-00079Y-8E
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 13:31:39 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23512cb5-8c8c-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 15:31:38 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso1256718e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 06:31:38 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29817036sm299115166b.124.2024.10.17.06.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 06:31:37 -0700 (PDT)
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
X-Inumbo-ID: 23512cb5-8c8c-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729171898; x=1729776698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=QgEVa7OmJ+TwPHVt5a1XLA0+1paZfixgP5b/ei2Anfu5yvP/PIUUth6gL9I4VaLFwZ
         52bUQicR/FaZ2jK0SQV27cQ00Ej5ZSr+DaCHuD3ZsMiMs+t1rWV0fMfsyyVqeF0UF9L3
         0REXYC1QqLdlzCw5oRa/1/lYEb/bBWx4oiN5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171898; x=1729776698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=SZjzvII2KQn+AK+QMVcF32O3Tk/Y97cyWyWcVIVqv8gRAgCZS9wz2qGI7gNHJsXeaH
         cUk1kpVhIfihNJ3ck0R16PY4Aai8pqi6WwA3r5d+ZQRBK/dTNFA90nD0IEg256WXY0az
         IDTtYEHK4bDjgn2AH/WFDOZ35EaJFp9GGilFeX+p57Uasp5YtHC1WWgMsFLNk7zUIzKF
         SUL2Sz1AJhwVjMWID/HfWabKSYq/yCypBYMfhSXcCsTEXYoYOWzo0XRtewValhmKqFEo
         g2jXtsrxxH2rSZ4CqZ+hUM9m3Coymld004TrwBjqhBXTU0g+/cgESu6OCoXCkFf0uV9b
         cSlQ==
X-Gm-Message-State: AOJu0Yxbwwf1GYdF/zj4R4I99lYvhuiWMfDz36w/bzD0lFuKWFjefoNx
	BYM6lxL6Zbk5otX0hU1IxgbTsIuVsxFrN9gzmSwN5reyC+Po8LY7Y/Lup3OKYZncVLAw3TWBP4b
	C
X-Google-Smtp-Source: AGHT+IFQ8m7GP7IvMkAOFAVyuP9c1bo224/GXyA7Alb7lgZRKE1PAPj0LVHeXKyTyxPZGR/uiwNpDw==
X-Received: by 2002:a05:6512:2384:b0:539:ea66:597e with SMTP id 2adb3069b0e04-53a03f07225mr5393333e87.2.1729171898000;
        Thu, 17 Oct 2024 06:31:38 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 5/5] x86/boot: Clarify comment
Date: Thu, 17 Oct 2024 14:31:23 +0100
Message-Id: <20241017133123.1946204-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
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


