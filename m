Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76A698DEEE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808875.1220928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EL-0004g1-Fn; Wed, 02 Oct 2024 15:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808875.1220928; Wed, 02 Oct 2024 15:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EL-0004Z5-8C; Wed, 02 Oct 2024 15:25:33 +0000
Received: by outflank-mailman (input) for mailman id 808875;
 Wed, 02 Oct 2024 15:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6go0=Q6=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sw1EJ-0004SG-GU
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:25:31 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ee4fa98-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:25:30 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so938887566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:25:30 -0700 (PDT)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c277726asm894554866b.10.2024.10.02.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:25:29 -0700 (PDT)
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
X-Inumbo-ID: 8ee4fa98-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727882729; x=1728487529; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftVpwFrv3Tr8Qw6HD3kvpMxXyPv+rWBj3ohY8visQ1w=;
        b=QggERJCgFg8Dev4d9Nc6ZWTYN8DO1fqG2JFIWphCoaBwpXWD2Ws3+F1fgExZwgnYWj
         hg0QcsrKdcGE1msIY8EQk9ISo+I2ckzltQMNRJNhjuzHQ4Hqb+nQXXrS83wbHEYJLgPz
         6TK1mE39azLROGLX4sHZnj2F/vhAQbtHNnb+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882729; x=1728487529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftVpwFrv3Tr8Qw6HD3kvpMxXyPv+rWBj3ohY8visQ1w=;
        b=q+nOnSt2rqaaiDC791uuCCY9QA5y5bS2DkQ3OzOGw51CG5nGyaynDFSxZ8t26+hREa
         XVfSEdfAHYKoWCsZkY47FiwBOw3U+FpmnoEzZbP/H5nzu4tQiqiHc0fjn2gn7RLYszPq
         C0CrB51WAO77wJ1tQBv52oFxsRT8tREV1XeKtJ8arzGmeKMX8sjJzS+1qaKELVE7GPvc
         NWmT5iZE7+b5ZnqyEOZZ2OG4xkX9AISJOoBk5bJNFa40t/FqI7pdxfVb2Pe02iDFLmsg
         yiD2miCg2ayE43Y/6A4CU7cPj3LNwEdtPDRLbR++TNw9XwcQJ9kDB7BHaxb9y5Ew4/EL
         9Yaw==
X-Gm-Message-State: AOJu0YyCItxbbCEAgpcFWlTvtQcRDsfFCUlkdGAKB0TwUOKM/zjfMqzZ
	Al0unUX6KwhBbGlq3pYLUnbDIDUe9d4S8VHB9AmJHNaEYMOluI2yR/X/Ez13l3pGwH3mjXwy/dp
	O
X-Google-Smtp-Source: AGHT+IFcJ6SivyjVc79Wr7urQz7+iHwEd2Xh8Ovp8EG6CvbeoDPUS6f5sl5feOgPr0mdny2zdjTWow==
X-Received: by 2002:a17:907:3f86:b0:a98:f1b3:83d5 with SMTP id a640c23a62f3a-a98f8206930mr331064266b.2.1727882729222;
        Wed, 02 Oct 2024 08:25:29 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/APIC: Remove unnecessary logical flat functions
Date: Wed,  2 Oct 2024 16:17:25 +0100
Message-Id: <fc3176baecd67c23dff710e4a1934c2caae47ebd.1727880621.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727880621.git.matthew.barnes@cloud.com>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that GENAPIC_FLAT uses physical destination for external interrupts,
these functions implementing logical flat for external interrupts are no
longer used.

No functional change.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/genapic/delivery.c    | 10 ----------
 xen/arch/x86/include/asm/genapic.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
index d1f99bf6834a..3def78f380d3 100644
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -19,16 +19,6 @@ void cf_check init_apic_ldr_flat(void)
 	apic_write(APIC_LDR, val);
 }
 
-const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu)
-{
-	return &cpu_online_map;
-} 
-
-unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask)
-{
-	return cpumask_bits(cpumask)[0]&0xFF;
-}
-
 /*
  * PHYSICAL DELIVERY MODE (unicast to physical APIC IDs).
  */
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index d29bccc39b4b..91fdeaca47b3 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -44,10 +44,8 @@ extern const struct genapic apic_bigsmp;
 void cf_check send_IPI_self_legacy(uint8_t vector);
 
 void cf_check init_apic_ldr_flat(void);
-unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
 const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
-const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
 #define GENAPIC_FLAT \
 	.int_delivery_mode = dest_Fixed, \
 	.int_dest_mode = 0 /* physical delivery */, \
-- 
2.46.0


