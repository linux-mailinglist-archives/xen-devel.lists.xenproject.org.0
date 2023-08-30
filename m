Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0778D74E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593117.926040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVe-0006C9-8p; Wed, 30 Aug 2023 15:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593117.926040; Wed, 30 Aug 2023 15:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVe-00067B-4c; Wed, 30 Aug 2023 15:53:34 +0000
Received: by outflank-mailman (input) for mailman id 593117;
 Wed, 30 Aug 2023 15:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xver=EP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qbNVc-00064j-5c
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:53:32 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d8d3718-474d-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 17:53:30 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so4807571f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 08:53:30 -0700 (PDT)
Received: from localhost.localdomain ([66.81.173.62])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff244000000b0031423a8f4f7sm17000009wrp.56.2023.08.30.08.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 08:53:29 -0700 (PDT)
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
X-Inumbo-ID: 5d8d3718-474d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693410809; x=1694015609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dobP6P8l4AYMBynSMIGcC0q85eHhUW/vtT4xfzskF/0=;
        b=Yqs33wJFMdwR3JyH4RLceA6hwqKxMW4p7vnASR0ihwwIMVbxcexONUAYDnSL6qauqq
         c1LwqVlq9myTL5RisPMCsxKqOn9S0bdPyYx/g73k5KvsJaPAFii+5KFQg8e1Ofts5YoL
         OpicYloHyyVnHLBPe4h/d/HMsuoLUBQJtDavc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410809; x=1694015609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dobP6P8l4AYMBynSMIGcC0q85eHhUW/vtT4xfzskF/0=;
        b=FTmuS3JcksBYMCyvTSvNtJZIEkCgPUaOI2KyL8XBWd+4gqqklo8wtFX3VsVTcmYqGl
         Rb1mfxUE3JNLl0qeTpRuJ8f2k2v66h6Ijm2v0KEC52v1VwdRJVj34padGLtKLMZffWBS
         ZWtOt/QmpLbmT4gBJTsz0wxkGXVWQkfJlSSk7MTT7F/4YqrmL39jlEasN0wQdYeXnTkS
         Mzyp6QjZSUo/hePMyPMb2PdNiZvTLUVxL7JrmEnSFKzQYft5LYC3f+1gqB3hq5JxegeR
         hoVasUtDUD9+0ZIuiijZni67n3jc7ko7Fh9i+58gNCkw/ZLySiE1d/kU+oMUPt/au1Ue
         KfOA==
X-Gm-Message-State: AOJu0YyoaUoxgC7vSoCZA/lbkHe3tgNY2vqm6ytAy1z16qquSDu402tU
	QD2WB9AMt7teNdCYCigi+m1RGOviblU6hcta+9g=
X-Google-Smtp-Source: AGHT+IEGe6SwdvQhesFepbl18K/Efr9XxR9LWLElBGcageHuST2xxal6aPIULtm3GCg46F7H+JG8lA==
X-Received: by 2002:a5d:4a84:0:b0:314:124f:12be with SMTP id o4-20020a5d4a84000000b00314124f12bemr1945393wrq.3.1693410809565;
        Wed, 30 Aug 2023 08:53:29 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 1/4] x86/microcode: WARN->INFO for the "no ucode loading" log message
Date: Wed, 30 Aug 2023 16:53:23 +0100
Message-Id: <20230830155326.10199-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
References: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there's a printk statement triggered when no ucode loading
facilities are discovered. This statement should have severity INFO rather
than WARNING because it's not reporting anything wrong. Warnings ought
to be reserved for recoverable system errors.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

--
v8:
  * New patch to unify the severity of this printk statement with the
    statement introduced in patch 2
---
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 9fcb9c1c3a..e5e03cad34 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -863,7 +863,7 @@ int __init early_microcode_init(unsigned long *module_map,
 
     if ( !ucode_ops.apply_microcode )
     {
-        printk(XENLOG_WARNING "Microcode loading not available\n");
+        printk(XENLOG_INFO "Microcode loading not available\n");
         return -ENODEV;
     }
 
-- 
2.34.1


