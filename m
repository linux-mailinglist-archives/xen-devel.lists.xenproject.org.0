Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0D9B354F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826686.1241061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0M-0000sJ-Dd; Mon, 28 Oct 2024 15:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826686.1241061; Mon, 28 Oct 2024 15:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0M-0000nN-9u; Mon, 28 Oct 2024 15:50:06 +0000
Received: by outflank-mailman (input) for mailman id 826686;
 Mon, 28 Oct 2024 15:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0K-000874-7I
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:04 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b9450bb-9544-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:50:03 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so669318766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:03 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:01 -0700 (PDT)
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
X-Inumbo-ID: 4b9450bb-9544-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130602; x=1730735402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5K6Nspj7vj9C6pOy10gyRqgpDSP036JKIQJVf2EbyY=;
        b=H9iNfog2o4W3yH7pweobUggwnKMC3cbeaU/vJ9G/Fe1nsRBc331R8tjNFKjQnlLDAc
         vAtoc9SC66bTH5stZNyqi/6zLf91VqIGe4jBpksI3v8OyJUDC2jKenFgxCyE5AlaCa/o
         964JPEf2Ij/rbwQRDMNMaubdlLhrXA3hYFteg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130602; x=1730735402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5K6Nspj7vj9C6pOy10gyRqgpDSP036JKIQJVf2EbyY=;
        b=Kysb1+TmLtv7qSUYl4zW06MdyVlMNlDH5dTTFEJhY/8gcRX8OFT2uMHZqqI3UuuVlu
         zII4nG8KcW0EQkT7uEYQFHAG14ZDUTufv022b0gDNhjlpB2yjIONWoLAE8sZ/6UOVDqN
         vRLecuSUPAcSmhjx2Hhst4KxlH4c86jGIX8pVPcWBkfgK4YkQia5GaCYF4PrR8o+IR3F
         0s9rJTDZdPJWaukHfic0i+wKG0n2Ylp3yI8ER2iHywakqvP+AYSmokMrZSaZ/jqHMgdC
         7QfaLt8pYbAeWWnm+IFEDnsLUpnSniqy7836YqW2EQprNSNkx79wf/x1y68zTyiN1oxF
         M/Ew==
X-Gm-Message-State: AOJu0YwOHe7f0lny7dM4DZmDE952IYoZGjCFSIwKst0+iIKQzn7YnC1a
	uevUB3tMgm8dnjm4Np5KbrLqstuKu5krjq577aiHZKmMp+pQ3b0RtbXiPQGeJlHZhIRcabaDV86
	v
X-Google-Smtp-Source: AGHT+IENOkisnUIp/1ZDjvE3uVJQj41jLy+2PM5YAn3FaDRjW+hclm6tDVlVyAKvEArohDjyyFFtSg==
X-Received: by 2002:a17:907:2da2:b0:a9a:a5c:e23b with SMTP id a640c23a62f3a-a9de619c1camr773093266b.58.1730130602288;
        Mon, 28 Oct 2024 08:50:02 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/14] x86/hvm: Map/unmap xsave area in hvm_save_cpu_ctxt()
Date: Mon, 28 Oct 2024 15:49:21 +0000
Message-ID: <20241028154932.6797-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/hvm/hvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 018d44a08b6b..77b975f07f32 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -914,11 +914,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 
     if ( v->fpu_initialised )
     {
-        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) !=
-                     sizeof(v->arch.xsave_area->fpu_sse));
-        memcpy(ctxt.fpu_regs, &v->arch.xsave_area->fpu_sse,
-               sizeof(ctxt.fpu_regs));
+        const struct xsave_struct *xsave_area = vcpu_map_xsave_area(v);
 
+        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
+        memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
+        vcpu_unmap_xsave_area(v, xsave_area);
         ctxt.flags = XEN_X86_FPU_INITIALISED;
     }
 
-- 
2.47.0


