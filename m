Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19F98DEF4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808873.1220914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EK-0004UQ-Ri; Wed, 02 Oct 2024 15:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808873.1220914; Wed, 02 Oct 2024 15:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EK-0004Sb-O5; Wed, 02 Oct 2024 15:25:32 +0000
Received: by outflank-mailman (input) for mailman id 808873;
 Wed, 02 Oct 2024 15:25:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6go0=Q6=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sw1EI-0004SG-S5
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:25:30 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ea40ae1-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:25:29 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fad100dd9fso48256851fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:25:29 -0700 (PDT)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c277726asm894554866b.10.2024.10.02.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:25:28 -0700 (PDT)
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
X-Inumbo-ID: 8ea40ae1-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727882729; x=1728487529; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7tveJz4AVmA+fvVj1KascSk3DY+D3COltbd+Dsh+Zo=;
        b=GoOVP8249iQA8uIStLR6G8fM5N0xPSLdo1MoveZ8SfwxQmHaE53tSfOi2y7UJ6AD6z
         pYlgaoLUeaZGIVsT6/mId4pE0ZTddESAjj9YvZTn5EQuG75HuUs3bFbtAwwTEOFd/F6S
         scFdI2J4wPJAkijEVNZKu09NQDZEE6eDh+w8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882729; x=1728487529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7tveJz4AVmA+fvVj1KascSk3DY+D3COltbd+Dsh+Zo=;
        b=gbt+4suOuvHqS2Nma3YUmFkivGHYG0u9FgSWQKzw3UBUlv4IF3itE+ivcgBafRj2U4
         hsFspOLUuwFpSQsAd9/Nlat6t0G9jDK8udsdtNKVfo9jlFxzUNOAStfNSgBgklBvk5Wf
         M9JOETO/6o90lD7NDu0UuQU8wSfebGOVv518xIfqxdsXEhUVecY/ecp5eXciZ+AxKcsp
         uw6lgfKjLHoHYa5j6Tx64P/O1XdyjYT1q6qYPlKeWW4voorobJ4w4pZlmLArYwnKo+IB
         fUUtHoPfjEGcc0U5MLczR1rQAE/F10tORZ3ZFDcBrldAzzVe5C7l2zjMrlfrW/UVo+GJ
         pflg==
X-Gm-Message-State: AOJu0YxZ/Z/rv4buYb7Ny/AYpM4gJwVEWtw+5h81XpFAfhR5c/VhBjMP
	2a7AD9pWzz0GPtyPYDt0CNbBx6Zd/pGYSlNy595zgeUb6NNXV3Ui0AE0mYX9s8rlnvpXA2NruMG
	O
X-Google-Smtp-Source: AGHT+IGTpHhHRSgEIQmCiEeM79gYhCjEjG+ivRv33A60tPr8Q2Unt7QLjiqqC0VIdKkesSVHQDT5kw==
X-Received: by 2002:a05:651c:210b:b0:2fa:d75b:2ef5 with SMTP id 38308e7fff4ca-2fae10a64camr28637231fa.32.1727882728770;
        Wed, 02 Oct 2024 08:25:28 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/APIC: Switch flat driver to use phys dst for ext ints
Date: Wed,  2 Oct 2024 16:17:24 +0100
Message-Id: <8c6d1fee5261169a9bbc62ed1bafd2c32406fb4c.1727880621.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727880621.git.matthew.barnes@cloud.com>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves: https://gitlab.com/xen-project/xen/-/issues/194
Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/include/asm/genapic.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index a694371c6d16..d29bccc39b4b 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -45,21 +45,21 @@ void cf_check send_IPI_self_legacy(uint8_t vector);
 
 void cf_check init_apic_ldr_flat(void);
 unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
+const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
 const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
 #define GENAPIC_FLAT \
-	.int_delivery_mode = dest_LowestPrio, \
-	.int_dest_mode = 1 /* logical delivery */, \
+	.int_delivery_mode = dest_Fixed, \
+	.int_dest_mode = 0 /* physical delivery */, \
 	.init_apic_ldr = init_apic_ldr_flat, \
-	.vector_allocation_cpumask = vector_allocation_cpumask_flat, \
-	.cpu_mask_to_apicid = cpu_mask_to_apicid_flat, \
+	.vector_allocation_cpumask = vector_allocation_cpumask_phys, \
+	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys, \
 	.send_IPI_mask = send_IPI_mask_flat, \
 	.send_IPI_self = send_IPI_self_legacy
 
 void cf_check init_apic_ldr_phys(void);
 unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
 void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector);
-const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 #define GENAPIC_PHYS \
 	.int_delivery_mode = dest_Fixed, \
 	.int_dest_mode = 0 /* physical delivery */, \
-- 
2.46.0


