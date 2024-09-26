Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017E9871C4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805305.1216386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwc-0004Fz-Qm; Thu, 26 Sep 2024 10:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805305.1216386; Thu, 26 Sep 2024 10:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlwc-0004EI-MT; Thu, 26 Sep 2024 10:41:58 +0000
Received: by outflank-mailman (input) for mailman id 805305;
 Thu, 26 Sep 2024 10:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=coMH=QY=flex--ardb.bounces.google.com=3dDr1ZggKCfsduge+jlwjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@srs-se1.protection.inumbo.net>)
 id 1stlwb-0003PD-O5
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:41:57 +0000
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com
 [2a00:1450:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f055e3-7bf3-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:41:57 +0200 (CEST)
Received: by mail-ej1-x649.google.com with SMTP id
 a640c23a62f3a-a8a92ab4cdbso56161766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:41:57 -0700 (PDT)
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
X-Inumbo-ID: f3f055e3-7bf3-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347317; x=1727952117; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ownyzv9FvJUARNva8kkWN7DdL7kgRVlMI6W55f3d3tc=;
        b=CmAYAotApeoeWCzZrzHiW6RnaYdDMjS1vFAHGwqiWcpyOveFdVzvGHtdpEVX/vReS4
         uPNH9Gskd8bX311dzJsE/ZFXQrc+t8KQLoB0EK66U4k2w4w6ksGWjq09TCZ+3UHTJ0S8
         2aoyLA/Lk47HU70uSqjKOJCOumcgCacJaQCxOfyTGy5Vs1OOpei2ok6CALoinECDCUCg
         8RntlxcB5XHHtPd2G3bqzSOQfQZPXVfyg/aGKwfDwNeEFgh0XYXX4DzduqjYn2FObSTa
         x01W/tWRV2NJmwmOELpQkeYuV8F67hmE95QVZvcRh5CWoHSGntMsT+iSf4jAtGorxwcv
         stHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347317; x=1727952117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ownyzv9FvJUARNva8kkWN7DdL7kgRVlMI6W55f3d3tc=;
        b=NCZEIFoOrTPdaMMUdaEp/ABVnyfBVpejGOZw+nu9zsHqJPDfQzyNhRh+nnM+/SouI+
         T6gR0pxRzixyN7QwCx2JDwszkmXelkcDABrSPN2/J7Xtz4+dfsZ/9jU+ARQbvRqhxBv0
         wp6Tx176+utaW4kQdiJZ/R/6PhtT9NvH2g8v65xDBtPgbyINmJgX53aK+SzKKjpypb2J
         jEWCCterXOs8j6aVb56tjA/ZM22/6wGPYomTV0DlRVRh9EqBdGDwBOA0e++YHGTOsavU
         Ubccqp/rkllQ4F05FHbWDZAtG/t2HCitj5Wqe5EyPcXbtvf3bMmih7rZW+UBKB3G1TXQ
         nVMg==
X-Forwarded-Encrypted: i=1; AJvYcCXLUvQBSZuURMWUX986wGjUYWN96LHMP6EOmwLtS9jkjpgTIe1gbpVbK8si48kK92rzi172/dkHKIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx14Rfocrk17ENveYtl3vHQdxRuUiK9UD6bn/sg6Z7YhVvSBCj
	BCuy1iGpdTo/ju+Ead+7+DdY/xYLoMLm3KnnJh0KXdMtaQ7NPymJYn8RQ+nfOlye2p9vSA==
X-Google-Smtp-Source: AGHT+IGy82jujwPzArGAUf1MuUGtrrrgAoLRL/QZd4vc5rXaUoeqVqj+O60HWt1N3meFf9X0ymoxcaJv
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a17:906:1642:b0:a7d:e176:71d1 with SMTP id
 a640c23a62f3a-a93a05c19a3mr293266b.9.1727347316493; Thu, 26 Sep 2024 03:41:56
 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:41:17 +0200
In-Reply-To: <20240926104113.80146-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=ardb@kernel.org;
 h=from:subject; bh=SK89jirZxlyhNPfrfzxj4qoYkybGiruH5hLSJPLATEs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2rlZ/E9V0L29KWOv/h8NISPt5Qf6nif2NoSM088ZqgV
 b0Oy9Z1lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIl81WD4Z7rxIf/2XQpOzxxi
 q5977XTzWHJUoKvkSs5y83eJYekuDxkZev2uM8t8FD0tYzvjxseQtEWvZX8cSOZMLDU648yRJyn GDwA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926104113.80146-10-ardb+git@google.com>
Subject: [PATCH 3/5] x86/pvh: Omit needless clearing of phys_base
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Since commit

  d9ec1158056b ("x86/boot/64: Use RIP_REL_REF() to assign 'phys_base'")

phys_base is assigned directly rather than added to, so it is no longer
necessary to clear it after use.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f09e0fb832e4..592747f2d731 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -179,13 +179,6 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	ANNOTATE_RETPOLINE_SAFE
 	call *%rax
 
-	/*
-	 * Clear phys_base.  __startup_64 will *add* to its value,
-	 * so reset to 0.
-	 */
-	xor  %rbx, %rbx
-	movq %rbx, phys_base(%rip)
-
 	/* startup_64 expects boot_params in %rsi. */
 	lea pvh_bootparams(%rip), %rsi
 	jmp startup_64
-- 
2.46.0.792.g87dc391469-goog


