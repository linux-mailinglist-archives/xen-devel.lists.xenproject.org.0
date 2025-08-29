Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED63B3C070
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101819.1454751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mv-0006s0-AY; Fri, 29 Aug 2025 16:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101819.1454751; Fri, 29 Aug 2025 16:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mv-0006n4-6F; Fri, 29 Aug 2025 16:17:17 +0000
Received: by outflank-mailman (input) for mailman id 1101819;
 Fri, 29 Aug 2025 16:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4pU=3J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1us1mu-0006FV-Ev
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:17:16 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0dfa72d-84f3-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 18:17:16 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3d17731ac0fso163252f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 09:17:16 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a7691340sm2973328f8f.39.2025.08.29.09.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 09:17:14 -0700 (PDT)
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
X-Inumbo-ID: a0dfa72d-84f3-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756484235; x=1757089035; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xypB0QaWO3EyRJnuNNKYcPZslwzFz81Bl9dW+OTBh3w=;
        b=RN4WntICOsvs/G1Zeol/YZQDMb+feEF3WNUbzNft1UVVuuyr/h1yCjxpDpvXHKNU7B
         1AQ/GpsGgqJGHlsvW3JNC8zBm+FNq9vitdkm4WqfQCotDqhX7yDlOPsh3GwaweLtyLOv
         xTwrrLSwTID+bhXKgbbz7xVkAQE5aNeQldA5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484235; x=1757089035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xypB0QaWO3EyRJnuNNKYcPZslwzFz81Bl9dW+OTBh3w=;
        b=ltSR7MoM3LZMVQy21+h9LroQ6OCgpQonbORswJFda5eAS4B7zlhWyex+R5ns3HK+Pr
         6CZlCilhSvovnIS10MR4OpJGk02FpBHTQVLb3HZ86PGXJCjRw1C6kTDLa8NnzxfzlWdx
         qdkA07gH2QKP2Kai4FbHFsbHh8FT68KzEUWZdtwUAylAu2lJ3yXso6HuybmJU1WIy6qj
         BE3qOLyGrCo2AnMZLPdmL9gvSyzA1/04zJOsDG4AMwo+Ulrg0Z3R5hKAjhng8Fd71UUq
         TROjzfJiZRUtO6yDkqphAKEKKa4KR63M+OeX4Wp1UJSj6DmpplD/4p1xEgyygoNg3cQE
         Dp0A==
X-Gm-Message-State: AOJu0YxrMGHh6tVpZx81OL/FqjfPpLjMrZz+iPI/OUC6uZ/ef4zXNFPP
	LTs4iVsuNpvPBlT0G1ER88de9SW99J3jL4c6E2fcn77CPUzUqv+jmmLYaYpyv7jgbSaoWvknHYs
	vgU6Y
X-Gm-Gg: ASbGncvKK2ADOWpm52e2/HW0J/BcGJTPCT4oO/P7etq6GBCpC5VuebSXgoeOeV/12cV
	aVJlw9x6rJSOGTXai2UTMMx9WUOiFEIO0MabzL/jB6MSu8E6aJMfidWn/8uP7pwla721kfzzqwu
	EQrkN33uwqBAvk2rnnbQF93YnRtovzMVHhI1Uyi8b1Ru095HCGa6klqKM0/Ewl7SuT6DZYZhWrh
	MvbKdm9U2G2bkkaAULzcBkxeo+at2Z7F/oF/cD7Ieen9/i4PTC068aRH1jz1zTPGBA4yctBCXzT
	LmCAX+2iSVcEZ1R3zTA1ltFDUAx/T/Mg8Lt5CY2jSazvA/Y4fIzrCTI+ETSUtoGoFcwxe3nzUYB
	u6hIBvM7p5h/S4rqPVMq7qdMWa7kVHm4B3hjrHHZaDGt5yQdCyQb3tMla8ioN8VxIgwYKmy5G2e
	Jx
X-Google-Smtp-Source: AGHT+IHmAm+14XR15ZHgzCO/nodXWPgrcrxMGvgH0v5HPDtt591SMA3JKPerKkQV4vkAKJngNG+V9w==
X-Received: by 2002:a5d:5f4b:0:b0:3d0:cd3e:7ad5 with SMTP id ffacd0b85a97d-3d0cd3e8402mr1759230f8f.32.1756484235117;
        Fri, 29 Aug 2025 09:17:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/apic: Drop sync_Arb_IDs()
Date: Fri, 29 Aug 2025 17:17:10 +0100
Message-Id: <20250829161710.1056772-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
References: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is not obvious at first glance, but this is dead logic.

On Intel, xAPIC (which is what modern_apic() is really checking for) predates
64bit support, while the Family 0xf check on AMD is the K8 processor.

Simply drop the logic, rather than trying to adjust vendor/family logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

  add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-166 (-166)
  Function                                     old     new   delta
  setup_IO_APIC                               2992    2987      -5
  sync_Arb_IDs                                 161       -    -161
---
 xen/arch/x86/apic.c             | 32 --------------------------------
 xen/arch/x86/include/asm/apic.h |  1 -
 xen/arch/x86/io_apic.c          |  2 +-
 3 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 70636b0bb585..774771860002 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -91,23 +91,6 @@ static enum apic_mode apic_boot_mode = APIC_MODE_INVALID;
 bool __read_mostly x2apic_enabled;
 bool __read_mostly directed_eoi_enabled;
 
-static int modern_apic(void)
-{
-    unsigned int lvr, version;
-    /* AMD systems use old APIC versions, so check the CPU */
-    if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-        boot_cpu_data.x86 >= 0xf)
-        return 1;
-
-    /* Hygon systems use modern APIC */
-    if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
-        return 1;
-
-    lvr = apic_read(APIC_LVR);
-    version = GET_APIC_VERSION(lvr);
-    return version >= 0x14;
-}
-
 /*
  * 'what should we do if we get a hw irq event on an illegal vector'.
  * each architecture has to answer this themselves.
@@ -396,21 +379,6 @@ int __init verify_local_APIC(void)
     return 1;
 }
 
-void __init sync_Arb_IDs(void)
-{
-    /* Unsupported on P4 - see Intel Dev. Manual Vol. 3, Ch. 8.6.1
-       And not needed on AMD */
-    if (modern_apic())
-        return;
-    /*
-     * Wait for idle.
-     */
-    apic_wait_icr_idle();
-
-    apic_printk(APIC_DEBUG, "Synchronizing Arb IDs.\n");
-    apic_write(APIC_ICR, APIC_DEST_ALLINC | APIC_INT_LEVELTRIG | APIC_DM_INIT);
-}
-
 /*
  * An initial setup of the virtual wire mode.
  */
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index d22854953689..918f1cee3567 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -166,7 +166,6 @@ extern void disconnect_bsp_APIC (int virt_wire_setup);
 extern void disable_local_APIC (void);
 extern int verify_local_APIC (void);
 extern void cache_APIC_registers (void);
-extern void sync_Arb_IDs (void);
 extern void init_bsp_APIC (void);
 extern void setup_local_APIC(bool bsp);
 extern void init_apic_mappings (void);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 42a9b653d397..17e6827f4bb3 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2163,7 +2163,7 @@ void __init setup_IO_APIC(void)
      */
     if (!acpi_ioapic)
         setup_ioapic_ids_from_mpc();
-    sync_Arb_IDs();
+
     setup_IO_APIC_irqs();
     init_IO_APIC_traps();
     check_timer();
-- 
2.39.5


