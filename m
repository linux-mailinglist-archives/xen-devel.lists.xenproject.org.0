Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7293D623
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765513.1176160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv0-00010s-Ia; Fri, 26 Jul 2024 15:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765513.1176160; Fri, 26 Jul 2024 15:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv0-0000yD-FG; Fri, 26 Jul 2024 15:31:42 +0000
Received: by outflank-mailman (input) for mailman id 765513;
 Fri, 26 Jul 2024 15:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMuz-00084T-50
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:41 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26aa0850-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:39 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6b97097f7fdso5314326d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:39 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8d81e2sm17439186d6.25.2024.07.26.08.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:37 -0700 (PDT)
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
X-Inumbo-ID: 26aa0850-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007898; x=1722612698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmNhqru4TlGrw3ILyEg6ph0OyPR73zD1eJAHzMTaW8w=;
        b=YwoJa+jXdGxX2gahklZ0pc6vJclaPRbfY1eMfduE3W5Spgv0LIpt7b4HsmTm34mevH
         AzMTN0yfDAKiIvx5g5/XEsRqXKto1SX/iqLlxCLL8vQ9euysukwra9Iu48Ox169BJVhN
         mublEqQUz2ZYTBm0c47Riq+QYuz1WBUvsbuvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007898; x=1722612698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmNhqru4TlGrw3ILyEg6ph0OyPR73zD1eJAHzMTaW8w=;
        b=igfEBfUTg3BwnkYca0Ws0FztKrpBMm4L55APlsFFeO2pS/MUIyZeNYOwhGz9/qtgQ5
         f8WmKCiWhi2vjDfP5j+FePrLVX+uWFFDajaTlKVs7Rq+eVWRvAuXKONDdnKIowQAKitG
         LSRbGqUBvWTWh5goeg141jQrB6bawRKhjnP0bvfz1R0Iwee+ff57HTXT0Nzis/CTFLXj
         tF0lRBc35t7cjuxSZkzpEXMuP9VORSiU8N/jQzfP1vLtlANosDgDDqxQeQIFkVR5CEwz
         JxdrzLbDuwQ3Nz61QeSqfK/+3KK645zp6w3e2w62yiVOaoRoTZlI5Zlh9sZ89jxiSd85
         dNUQ==
X-Gm-Message-State: AOJu0YzRx+qaztXb7FHQ/i6PSxfhWJt1E2kKXbJf5dQGGZN6HyQ9l2aB
	/0A4qhUY1Z9gwIEgfXI26T4jr0f/av+MvsVeI4nq0/KlYmsszS8DsdcNZXPY8vfe189HvIZc6CW
	e
X-Google-Smtp-Source: AGHT+IFVo7RCWrzdGCf8WbHKXJS7FPJoMhkuGB/902ihUsT3Fi3KBTh0NjvB6zh1fvY99h7U1GZriw==
X-Received: by 2002:a05:6214:62e:b0:6b5:e403:4418 with SMTP id 6a1803df08f44-6bb5597d56dmr1948886d6.10.1722007897691;
        Fri, 26 Jul 2024 08:31:37 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 05/22] x86/mm: make virt_to_xen_l1e() static
Date: Fri, 26 Jul 2024 17:21:49 +0200
Message-ID: <20240726152206.28411-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no callers outside the translation unit where it's defined, so make
the function static.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mm.h | 2 --
 xen/arch/x86/mm.c             | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 98b66edaca5e..b3853ae734fa 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -567,8 +567,6 @@ mfn_t alloc_xen_pagetable(void);
 void free_xen_pagetable(mfn_t mfn);
 void *alloc_mapped_pagetable(mfn_t *pmfn);
 
-l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
-
 int __sync_local_execstate(void);
 
 /* Arch-specific portion of memory_op hypercall. */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 01380fd82c9d..ca3d116b0e05 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5087,7 +5087,7 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
     return map_l2t_from_l3e(l3e) + l2_table_offset(v);
 }
 
-l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
+static l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 {
     l2_pgentry_t *pl2e, l2e;
 
-- 
2.45.2


