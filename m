Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB39B6566
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 15:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828258.1243119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t69SS-0006Ce-TI; Wed, 30 Oct 2024 14:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828258.1243119; Wed, 30 Oct 2024 14:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t69SS-0006Ae-Qm; Wed, 30 Oct 2024 14:14:00 +0000
Received: by outflank-mailman (input) for mailman id 828258;
 Wed, 30 Oct 2024 14:13:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXHf=R2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t69SR-0006AY-Ah
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 14:13:59 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31703acb-96c9-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 15:13:53 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a3dc089d8so999986266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 07:13:53 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a08478bsm576411566b.199.2024.10.30.07.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 07:13:52 -0700 (PDT)
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
X-Inumbo-ID: 31703acb-96c9-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMxNzAzYWNiLTk2YzktMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjk3NjMzLjc0NjgwMSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730297633; x=1730902433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pN2Oe8S29+yawm9p3c07bqHt4J/ZBZsq4OxQrlPr8Lk=;
        b=UC8cIujV3GWySptI/fnc72Rs/LP+P/sE6WlaXAjIllIp/Zx4JC3SzRTASKg/27bsxr
         y0IMtEay3OKxGNbNokjvyxboF5dqWWh44peFaUIYpze3iGL4ECss8vFbt5d0kiURcH0M
         SZtgj4XqMF1DvXvawUkadskKhCMF9PRXNmPA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730297633; x=1730902433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pN2Oe8S29+yawm9p3c07bqHt4J/ZBZsq4OxQrlPr8Lk=;
        b=xPxVakJ1FfDF8fBMD98jTXw8aBr1tvEVb6IGaXDZkAsqwEVwhJuSRsKsH7/sTIe8wm
         c+TYSWMcj+4HHG5PnDsgDtx62xO0H8fEelogJIrMUIh1gN359uvDasQB7Z+Lb7VwvvNq
         qc9wdXFwXYDVzieE57cNlLSVjnjI9w0v7dFB9x3PRMXnwcSwWHA7BpiMjBvP4GthtpZh
         gzhO4RZplSYQoQaP1awyCsAp3ctf+sG0AF187dC/qVch0Wgt1yVn0Zea5rZsl4VqFUk2
         Xtb4gdxMLcefQY9WaYop0JBJ1BJO9+i8d9X3e0Ej5rY8EYm7cC6N7Ue++p8EjRoIrJbH
         Xoig==
X-Gm-Message-State: AOJu0YxThfo2TyxeNUr0XDM9mCupAxdpjbQNDiQEd73slrYAWSJOTjE9
	8KOjsNxk3ROs4sMuP/53/9HJdtrNBKkyGTgYgoi/hkGwubbVbeFP3C4khjPOandtKoVIIDuW+Px
	R
X-Google-Smtp-Source: AGHT+IEyVntG6F08VAiDxqGqAkGcrtFbvRef0kx2BS14NuUqEZEORKN7/iGxKeY7ujaHzGW60OiEiA==
X-Received: by 2002:a17:907:3a96:b0:a9e:1fc7:fc11 with SMTP id a640c23a62f3a-a9e1fc7fd27mr448389566b.40.1730297632720;
        Wed, 30 Oct 2024 07:13:52 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/setup: Make setup.h header self contained
Date: Wed, 30 Oct 2024 14:13:41 +0000
Message-Id: <20241030141341.2236343-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header uses rangeset structure pointer.
Forward declare the structure.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- use structure forward declaration instead of including header.
---
 xen/arch/x86/include/asm/setup.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 4874ee8936..d7ed4f4002 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -43,6 +43,7 @@ void *bootstrap_map_bm(const struct boot_module *bm);
 void *bootstrap_map(const module_t *mod);
 void bootstrap_unmap(void);
 
+struct rangeset;
 int remove_xen_ranges(struct rangeset *r);
 
 int cf_check stub_selftest(void);
-- 
2.34.1


