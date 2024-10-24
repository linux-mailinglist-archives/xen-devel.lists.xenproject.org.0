Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB669AE5F5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825240.1239468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xnB-0005cF-IK; Thu, 24 Oct 2024 13:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825240.1239468; Thu, 24 Oct 2024 13:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xnB-0005Z3-Ed; Thu, 24 Oct 2024 13:22:21 +0000
Received: by outflank-mailman (input) for mailman id 825240;
 Thu, 24 Oct 2024 13:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3xn9-0004K5-8r
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:22:19 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fddcedac-920a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 15:22:17 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c9388a00cfso939419a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:22:17 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm618574766b.79.2024.10.24.06.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 06:22:16 -0700 (PDT)
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
X-Inumbo-ID: fddcedac-920a-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729776137; x=1730380937; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+Vu4sa4HxAQKCzqJBSz5wGkRTNCR1UROUB1VCBQ9dk=;
        b=vdk772wloLjmp6vG6mwCcBDim4POV6xDwwb/1VIE1F89sEAkyCxl9yqxxyV1w5htOa
         wnWae8+73GH08WoLGG1wGAqVATfsv1fP7QFt6vtAASRypAO8j/FC5KISSSLc6XQR2cBc
         fjjWrQEQB5slrqLTVe9FE820PwSokpg9CL5nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776137; x=1730380937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+Vu4sa4HxAQKCzqJBSz5wGkRTNCR1UROUB1VCBQ9dk=;
        b=BV3pvY2MiSRIbMfJPn0q1uDc0X5Hg11TxLU59EprsThvwzTEeCulsqP9FKoCBE/7mf
         ssO6FZ/KeyjetjvkyLMcm1X9U2wHYSYb4j94zxtYkQeFdR+wyeH89qC/HGwr4BYu7KFu
         Jag+HfCnw06mCs7fQG7rxcDAtrYPUdfU69nVUsQeRziUaApCWU+QU6uYsTbcT4bShvYb
         ECbfLioZzvLNCfnpXPkhDKT54daUz7ajLFpZ4KdT8A6YoEBgcTAEzxdNpFNnl/2s+4ty
         MFg602pNjNJBO38HxouyGHvQJn/VD4QqRHgEc6YdSNHGnevBH1YSK+UD3evdCVzdMM+Q
         /oDA==
X-Gm-Message-State: AOJu0YyzvHw3utbdlU+XNAiww4DS2qHAXfQMPgPWoe5xtTjFXYEIG7th
	QNAz8XLri4noSW2Zqitg71M7sIytFNm3hRRQG5UXxGMMd4Q5+D3VOCIYTBjNcB6HcV7EewOtHqQ
	d
X-Google-Smtp-Source: AGHT+IG5UiRpv59wek7ARqF1JmC/N1DSP8R4HlnvXFJTMftXoiNvYECFNOZrMesXeC1zgylbgJaWxg==
X-Received: by 2002:a17:907:97cd:b0:a9a:13dd:2734 with SMTP id a640c23a62f3a-a9ad27600cbmr160663366b.36.1729776136782;
        Thu, 24 Oct 2024 06:22:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/5] x86/ucode: Drop the match_reg[] field from AMD's microcode_patch
Date: Thu, 24 Oct 2024 14:22:05 +0100
Message-Id: <20241024132205.987042-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024132205.987042-1-andrew.cooper3@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was true in the K10 days, but even back then the match registers were
really payload data rather than header data.

But, it's really model specific data, and these days typically part of the
signature, so is random data for all intents and purposes.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

The single difference from this is:

  @@ -207587,7 +207587,7 @@
   ffff82d0402ad261:	4c 89 ce             	mov    %r9,%rsi
   ffff82d0402ad264:	4c 39 c8             	cmp    %r9,%rax
   ffff82d0402ad267:	0f 82 c2 11 f6 ff    	jb     ffff82d04020e42f <amd_ucode_parse.cold+0x55>
  -ffff82d0402ad26d:	41 83 f9 3f          	cmp    $0x3f,%r9d
  +ffff82d0402ad26d:	41 83 f9 1f          	cmp    $0x1f,%r9d
   ffff82d0402ad271:	0f 86 b8 11 f6 ff    	jbe    ffff82d04020e42f <amd_ucode_parse.cold+0x55>
   ffff82d0402ad277:	85 ed                	test   %ebp,%ebp
   ffff82d0402ad279:	75 55                	jne    ffff82d0402ad2d0 <amd_ucode_parse+0x170>

which is "mc->len < sizeof(struct microcode_patch)" expression in
amd_ucode_parse().
---
 xen/arch/x86/cpu/microcode/amd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 1845f51ba330..54acd6928781 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -48,7 +48,6 @@ struct microcode_patch {
     uint8_t  sb_rev_id;
     uint8_t  bios_api_rev;
     uint8_t  reserved1[3];
-    uint32_t match_reg[8];
 };
 
 #define UCODE_MAGIC                0x00414d44
-- 
2.39.5


