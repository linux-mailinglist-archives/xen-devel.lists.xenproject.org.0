Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BBA910A05
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 17:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744811.1151933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJqs-0007Bv-Oz; Thu, 20 Jun 2024 15:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744811.1151933; Thu, 20 Jun 2024 15:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJqs-00079f-Lj; Thu, 20 Jun 2024 15:37:30 +0000
Received: by outflank-mailman (input) for mailman id 744811;
 Thu, 20 Jun 2024 15:37:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gwum=NW=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sKJqr-00079V-DI
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 15:37:29 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feb1685e-2f1a-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 17:37:26 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57d07f07a27so1108146a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 08:37:26 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([2.223.45.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdf52sm9852778a12.8.2024.06.20.08.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:37:25 -0700 (PDT)
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
X-Inumbo-ID: feb1685e-2f1a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718897845; x=1719502645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KC6rl9EXhuFpskqMgYdFWCq/EEUOO/iNi0wsiHqBJLw=;
        b=RXgOIF93hswGJyYrwymE4ZKfZjCMzj5W7hEavNPCCsjUjddxRqg0s7Xk+gximoEiyT
         8Rw8qvx6+CZBPU8OG4QttBiU8THNVjryysl/7oI+mKRa848JSrzw//A6eoyPi8xrny3b
         SmCKg7Wi/i9sasvvMuT5y5MCaoIjxQ9u/TwIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718897845; x=1719502645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KC6rl9EXhuFpskqMgYdFWCq/EEUOO/iNi0wsiHqBJLw=;
        b=Ayho/P64d7jtM7zT/8WSW02TpbYSPhgrSqLXDxb3zsXlwHK3RJJBEUDNP3UPGGkvpO
         vGCjCbl679BLDKJtziq2vOhlSiwtIR9eCXlYdWBoNG1nabsqL7XRV1ByhDfrw7trsFtS
         0nbSOo712vAsjOdBpiiGsJqlXApIuCmJJlzC4bjtXKzVNuTs4OnFS7mGjtfiPTDvnCiX
         E24TBLLSLsjU6JUCf+Datka0dvAiHCrI55cFNlq6U9/AGXyTs4uy06m2hdpGIYFv/Bup
         6KG6A28OTk+PidihefbyO0H4VWIOCIhg7Lo3Me1krfNR9aVMcwFPXfj2muvG0gNnfgnh
         lI4g==
X-Gm-Message-State: AOJu0Ywms+TH4cQDerslJat8Q9L2N4XNPbkwYfHMYZz+aiiCt0+9hRR6
	m4sE/QJcOYFYEYDSdiDBkLL27vIMQ/cgWOJcWABGXZCW2khOgxVEHys3uybssqx8VLHZye98x6b
	y
X-Google-Smtp-Source: AGHT+IHv9xbMjgfvHAw8tHesSqBG900ed11MhqqkeJFss7E4gUcRTNAh1AjCwGk1Z9JbKEHeJrTjbg==
X-Received: by 2002:a50:cd1e:0:b0:57a:1e0a:379f with SMTP id 4fb4d7f45d1cf-57d18005efbmr2193314a12.16.1718897845342;
        Thu, 20 Jun 2024 08:37:25 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH v2] x86/apic: Fix signed shift in io_apic.c
Date: Thu, 20 Jun 2024 16:36:46 +0100
Message-Id: <d71b732050d4fff3208205b3117ac5164f889a63.1718897157.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There exists bitshifts in the IOAPIC code where signed integers are
shifted to the left by up to 31 bits, which is undefined behaviour.

This patch fixes this by changing the integers from signed to unsigned.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- Correct signed shifting in mask_and_ack_level_ioapic_irq()
- Adjust bracket spacing to uphold Xen style
- Improve commit message
---
 xen/arch/x86/io_apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index b48a64246548..d9070601a26f 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1692,7 +1692,7 @@ static void cf_check mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
        !io_apic_level_ack_pending(desc->irq))
         move_masked_irq(desc);
 
-    if ( !(v & (1 << (i & 0x1f))) ) {
+    if ( !(v & (1U << (i & 0x1f))) ) {
         spin_lock(&ioapic_lock);
         __edge_IO_APIC_irq(desc->irq);
         __level_IO_APIC_irq(desc->irq);
@@ -1756,7 +1756,7 @@ static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
          !io_apic_level_ack_pending(desc->irq) )
         move_native_irq(desc);
 
-    if (!(v & (1 << (i & 0x1f)))) {
+    if ( !(v & (1U << (i & 0x1f))) ) {
         spin_lock(&ioapic_lock);
         __mask_IO_APIC_irq(desc->irq);
         __edge_IO_APIC_irq(desc->irq);
-- 
2.34.1


