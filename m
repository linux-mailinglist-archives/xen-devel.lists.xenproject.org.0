Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809891086D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744742.1151847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIpf-0003bQ-HE; Thu, 20 Jun 2024 14:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744742.1151847; Thu, 20 Jun 2024 14:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIpf-0003ZD-DW; Thu, 20 Jun 2024 14:32:11 +0000
Received: by outflank-mailman (input) for mailman id 744742;
 Thu, 20 Jun 2024 14:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gwum=NW=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sKIpe-0003Z7-1h
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:32:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df2d6674-2f11-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 16:32:07 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so136499466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 07:32:07 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([2.223.45.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56fa674bsm777411866b.210.2024.06.20.07.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 07:32:06 -0700 (PDT)
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
X-Inumbo-ID: df2d6674-2f11-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718893927; x=1719498727; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nFWNbUX04u1jqwokJYULDxHiHNUVzv4LdA47biAV6MA=;
        b=ke4T+h+oUgGeIvr7OE0WUgKPjGEd+AYRDVfJmQfp2ZXr+CS201h9Wu8wli6jTxJFsu
         yQ59rMcJ1ccCFyMGvA3wo7G5D/7AxnTAuxJVofXxy083yifv6kHHN8cLOXzk4pQRdLsa
         UfaCMXLoJJZZJgrQHVvmXvSYLaoXHr0NifEJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718893927; x=1719498727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFWNbUX04u1jqwokJYULDxHiHNUVzv4LdA47biAV6MA=;
        b=bIC69fI7r4zPDXn63xcBth1b8/hgLef2rMUJTmEcF5OqvoX/8LQSvvjgY5QxjfVhqU
         5EQgm3bdV6MRkh9d/Yrr5mDPx6m/wLpdJEUHUmDHrvjxdJ5uj8YcL9PsvXj83/kWj6JL
         afYflaVNAqpj5AvKZ1SRO0FTDHcBJtFtHIGbBg1R5+A8POL+wfP/Ix3Jlv9skYjdzZX8
         jJ6LTLZ+BE2R9bJ4/6cF+5K2522EvnsxuPxzEZwYsOrxTQabtLfxPMiL67eqKe74szb/
         1bt9e5mpZ6yIR8pl8rODt06gL6uTU+gzB4tbh1IIn78kxfCjJMmyX1T+YLSzR7Yv48nu
         mnfw==
X-Gm-Message-State: AOJu0YxYCvSe94X2BQaZUEcWjYtCVBs2rQ4UT6VPrCOq5feM72a9R+e2
	1ulipNO5PxSFrZ6+GinXqinHcLUMNvaAapCujKqc/Ddhbxivu4IO8E77EdxyswgFPPLmQRdx2PU
	1
X-Google-Smtp-Source: AGHT+IEUvcK+vo1hmj3l9vNJmeQfFb4RFY9Whm35bcrYkvWEO5wNS6pCDXzbJ9W5oFCO55RCC6QQ5w==
X-Received: by 2002:a17:907:590:b0:a6f:b717:cb6 with SMTP id a640c23a62f3a-a6fb7171592mr206928466b.53.1718893927009;
        Thu, 20 Jun 2024 07:32:07 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] x86/apic: Fix signing in left bitshift
Date: Thu, 20 Jun 2024 15:31:54 +0100
Message-Id: <6fe6d88c0e07348d3e08fd51863402827126ecb0.1718893590.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There exists a bitshift in the IOAPIC code where a signed integer is
shifted to the left by at most 31 bits. This is undefined behaviour,
and can cause faults in xtf tests such as pv64-pv-iopl~hypercall.

This patch fixes this by changing the integer from signed to unsigned.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/io_apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index b48a64246548..ae88b1b898fe 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1756,7 +1756,7 @@ static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
          !io_apic_level_ack_pending(desc->irq) )
         move_native_irq(desc);
 
-    if (!(v & (1 << (i & 0x1f)))) {
+    if (!(v & (1U << (i & 0x1f)))) {
         spin_lock(&ioapic_lock);
         __mask_IO_APIC_irq(desc->irq);
         __edge_IO_APIC_irq(desc->irq);
-- 
2.34.1


