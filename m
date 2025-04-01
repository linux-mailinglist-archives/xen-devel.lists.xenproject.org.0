Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A96A77BCC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934208.1336018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPd-00086D-Va; Tue, 01 Apr 2025 13:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934208.1336018; Tue, 01 Apr 2025 13:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbPd-000847-Rv; Tue, 01 Apr 2025 13:12:17 +0000
Received: by outflank-mailman (input) for mailman id 934208;
 Tue, 01 Apr 2025 13:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMb-0000Od-JU
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:09:09 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e3f2c1c-0efa-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:09:07 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso10198523a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:09:07 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac71927b013sm774356166b.63.2025.04.01.06.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:09:06 -0700 (PDT)
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
X-Inumbo-ID: 7e3f2c1c-0efa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512946; x=1744117746; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qwa4790XsBU40/HS4XW3tzOpxssCxzWLfWfhM2utiU=;
        b=BkvfiEE7gG+1K3C9XyJGMTrQg+FNHyl+MsDTN9zPCawRnuBV232J4lrMwk6eVzh4rS
         H+7kv35lKaHOCyl/b63ZMZznKXyQijbnk0Y+XMc90HWb47EcZfTpgx4DVcVKIgPDEhVv
         jN1ucFGRGeubeXmKUw5U8JulmsF5Y4Q6GPtkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512946; x=1744117746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Qwa4790XsBU40/HS4XW3tzOpxssCxzWLfWfhM2utiU=;
        b=JkLcV2X9wXb9WiDFg2cyJVwZdRcyyz43HQf8y6e4V3Z2U/i+vfsQoZZ4MgLYevCtxH
         wt+kSU00GI0e8ZsmCcwEazc7n4YswklEkK8j8+XSAwpdrF54mjlqu7iC4St8dKOGw0Bo
         oXXtipEdmjGaCWZ5mzVFz4o9M/Q1AIBajFZ1jRAZnU+XAOrbKDC0WtPFB1/SkenmmD+P
         A7ZuI1k7XP+x7y9aXwmJ3UHzcFRF5UEe9t/Og/S3h7lE5wnKKhevQtBsfpnncL1z+o0P
         VFwDXB1kf8pi8tzpbz2HaOPfsBlZhFGExPvF93M4k9h4A5zGzfRG86k1Xp7yesKbrVzL
         hcag==
X-Gm-Message-State: AOJu0YwVg+sqoMl+t4bKwXrhwuhOtg75iNyx36VLZj6jaF7usj8IgGP+
	phgve2XoA0dkQDwPRFQ5gNMUzUeVDlfTk9ViGcDMoFTk/FFB3iLBidL8mZacviV3+rrybMugqE9
	R
X-Gm-Gg: ASbGnct5LwZGfHkos4lixRAPMLV6dgb7RkvdwO+DL8B3IfLph9GX4IFcgQQ1w7+27v+
	cV6kQ8SPaH10Z2B7AmRUFyyMVjaxWr7IREu8ehHshhYWQ0Ig8nqUxw9EM5AzVpvo1VSbcKH6TdY
	JymXxySlBO9T4e0RY4tUt3eMvpgO1uvvirQilWQ3XN/5ArRyrg7xSH1WXtYzwIX3j9TjlcSJWBs
	ZbJK8VwK/Er3+O4of2/Jhc+eezj4dNdWI9JB2juoFV/E9cKMwiEg3uGIVR78yxxzhoUcqnsoJ98
	sK6j19PiMK65i7Apj3OrA2chAW5NXKpxiKpjVjMwisO0wyFDbiH+BPsyAftT
X-Google-Smtp-Source: AGHT+IGaTL4+DNncckQbpL2w1mfIC0PN54mgxJ8UCHZmW+A0RvqhvxCvguiv22/squAYZqlGE4+Jag==
X-Received: by 2002:a17:906:d551:b0:ac3:26ff:11a0 with SMTP id a640c23a62f3a-ac738bac990mr1068582266b.38.1743512946332;
        Tue, 01 Apr 2025 06:09:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 09/11] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Tue,  1 Apr 2025 15:08:38 +0200
Message-ID: <20250401130840.72119-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of using the absolute __start_xen address, calculate it as an
offset from the current instruction pointer.  The relocation would be
problematic if the loader has acknowledged the Xen image section
attributes, and mapped .init.text with just read and execute permissions.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/efi/efi-boot.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 1d8902a9a724..c5cbf56cc0c4 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -266,7 +266,9 @@ static void __init noreturn efi_arch_post_exit_boot(void)
 
                    /* Jump to higher mappings. */
                    "mov    stack_start(%%rip), %%rsp\n\t"
-                   "movabs $__start_xen, %[rip]\n\t"
+                   "lea    __start_xen(%%rip), %[rip]\n\t"
+                   "add    %[offset], %[rip]\n\t"
+
                    "push   %[cs]\n\t"
                    "push   %[rip]\n\t"
                    "lretq"
@@ -274,7 +276,8 @@ static void __init noreturn efi_arch_post_exit_boot(void)
                      [cr4] "+&r" (cr4)
                    : [cr3] "r" (idle_pg_table),
                      [cs] "i" (__HYPERVISOR_CS),
-                     [ds] "r" (__HYPERVISOR_DS)
+                     [ds] "r" (__HYPERVISOR_DS),
+                     [offset] "r" (__XEN_VIRT_START - xen_phys_start)
                    : "memory" );
     unreachable();
 }
-- 
2.48.1


