Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB44ACEE5E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006655.1385894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aY-0002Cq-P1; Thu, 05 Jun 2025 11:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006655.1385894; Thu, 05 Jun 2025 11:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aY-00029H-Jk; Thu, 05 Jun 2025 11:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1006655;
 Thu, 05 Jun 2025 11:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uN8aX-0001od-54
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:16:49 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f4bc1f5-41fe-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 13:16:43 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a522224582so484847f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:16:43 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526f4c808sm2043887f8f.28.2025.06.05.04.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 04:16:41 -0700 (PDT)
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
X-Inumbo-ID: 8f4bc1f5-41fe-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749122202; x=1749727002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LwfB2gF9isEgIiM5Co6kyT/fwMQ7m7hvxAgSTzQdrA=;
        b=K+v9MopssMNGw8HdOn+44h2jX56dz8SEVoNkGzOXsEG4kVoud/oRwZv7aM1ZNxnKMr
         +tdEdh1ltQwa0wAd2aEH4EWq1zczsj06k96uA1QUmdrX5XGTA42c5Ob8g4m5Nmd06482
         nSra8EImvrPwU9jRNT9Bi6YgEYKFSySeuSV1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122202; x=1749727002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LwfB2gF9isEgIiM5Co6kyT/fwMQ7m7hvxAgSTzQdrA=;
        b=G0hfG8ij//bJs7FEU8u2lvySdXrr01B62/4Qh/gSyCMNzzTx0cVB9sv6+0WxdHXvKD
         EhgBzvpWgaO1vERWg2DpFQ8qaxBT/OUpgUGADVQClQNiEXjf+1h+Azyv26fycvxAuKdI
         r90bF7zYQAXziFaGjtoxQsK+Q6VpBdCrcoa2atIuHTZpnC0Q65UURzPUkd33pCS9fZCT
         fpzu3xdkDLWROpc7gWbWheDLuKLS1jYNSaGH93MHOoVBXnGAeb60hx7HfPA+yjYx6ilf
         EYMB/0ufgeI1Kjh8OGf4Py0kr1ZLV897JCMg7MIqh+GEBslGhZFqDurCJDG8fXvVEit3
         eoug==
X-Gm-Message-State: AOJu0Yw/XfiLQCTENEPBo/Dx0opkewQH4nlNyhIYR7QlOeRrDL/7In+Q
	OwNDgAXNLiddP3AU7jS5AXUAaUlS4QOP72gxQ+B6kF+aUBgmXcfl2DZZwiTFUMb+dDAHQhMgdAL
	y0xK4
X-Gm-Gg: ASbGncvflaE856IJXhJbOPAb6+mzQRC9Oj37KFas1DfxfBBTWKl+FV9cAgCp+tpj7Kg
	ztXOPtGi+7VsKlErKtxzEXAHC3bf1YPZ9y2CKRHn8mVVssORQf5sxUiiDE0oNfA/Ppibh+HFZIx
	3gJknJ7d3BpaSyi82wvG12VnXuQW6BquvMRjnvv9Qu+bJFrLJUQaxRc28gGztFolo372I4EnDYr
	IalWfDkPk6kYFGUMU5LE+AJMvtR6Pe9zM09yM2IZZQg3aduMpl6rffTDVmH+Obzmndto4HIQzw+
	MCQRvhJsldLeV98WLeSlcDhcKS8AFaa3gwvZ8uL0Y576+Yq6BM0TmKIVw38A0/mM7wge/KCbfn/
	xhQo6no/dDEAYo6Ie5CWcvlGw
X-Google-Smtp-Source: AGHT+IFVlMhltrqqcKZXTRbuUVmCW3hd9rmmakfK2vK2/mAGdohruOl3xoKC6/s8KgnJs25bYvBvig==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:eecf:b8cb with SMTP id ffacd0b85a97d-3a51dbe3d35mr5517306f8f.28.1749122202237;
        Thu, 05 Jun 2025 04:16:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/3] x86/EFI: Fix detection of buildid
Date: Thu,  5 Jun 2025 12:16:36 +0100
Message-Id: <20250605111638.2869914-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The format of the buildid is a property of the binary, not a property of how
it was loaded.  This fixes buildid recognition when starting xen.efi from it's
MB2 entrypoint.

Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

I don't like this patch and tried hard to do it in a better way, but the EFI
aspects of the build system are too intractable.

While on x86 I can in principle pull the same common-stubs.o trick, split on
XEN_BUILD_PE rather than XEN_BUILD_EFI, that doesn't work on ARM which
hand-codes it's PE-ness.  Also, it's really not EFI related, other than as a
consequence of that being the only reason we use PE32+ binaries.

Binutils 2.25 is now the minimum, and the makefiles can be cleaned up
somewhat, but I need to backport this patch, internally at least.
---
 xen/common/version.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/version.c b/xen/common/version.c
index 5474b8e385be..56b51c81d2fc 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -203,8 +203,11 @@ void __init xen_build_init(void)
     rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
 
 #ifdef CONFIG_X86
-    /* Alternatively we may have a CodeView record from an EFI build. */
-    if ( rc && efi_enabled(EFI_LOADER) )
+    /*
+     * xen.efi built with a new enough toolchain will have a CodeView record,
+     * not an ELF note.
+     */
+    if ( rc )
     {
         const struct pe_external_debug_directory *dir = (const void *)n;
 
-- 
2.39.5


