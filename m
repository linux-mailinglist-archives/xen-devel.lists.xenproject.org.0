Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5509D3997
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 12:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841043.1256563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDj09-0001CE-Br; Wed, 20 Nov 2024 11:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841043.1256563; Wed, 20 Nov 2024 11:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDj09-000184-7m; Wed, 20 Nov 2024 11:36:05 +0000
Received: by outflank-mailman (input) for mailman id 841043;
 Wed, 20 Nov 2024 11:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1p6=SP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDj07-00015s-HJ
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 11:36:03 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dd6be19-a733-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 12:36:00 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso355704066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 03:36:00 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e086058sm766537066b.184.2024.11.20.03.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:35:59 -0800 (PST)
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
X-Inumbo-ID: 9dd6be19-a733-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkZDZiZTE5LWE3MzMtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTAyNTYwLjY2Mjc0MSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732102560; x=1732707360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86sTbQPzilf+WSdJgcVW1D6hKA0N+3C25zpjw6B93xw=;
        b=bFjDmi0csSktofm3JPgjwCD5E5oET0MZ+rgZiyMZxelvtGht12oBDocUgiSI+HezQ9
         X6b1c9WPA9iCh6YZcidxpg5XgJyeU0sv3PGK7Fen86pSf2rPynYZ2SJluMS37fqjIMbW
         KS2weP2Y0+w5PHZfMFaZRbxQXR1ojFWT8lEQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732102560; x=1732707360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86sTbQPzilf+WSdJgcVW1D6hKA0N+3C25zpjw6B93xw=;
        b=QqeqD/nlMOFDTo+/UzXXfmUYPHlhWJPiTwrN+hHKX7oCnYcqyFlNcqx/1/t1icafTP
         vwD2IEZvHWOcAV3kR6uTG8U8RwBuVB7Ge+snYOyYhhGOs7ilUpxOor5p6A5Qc9ip5fWn
         rtVnLIRypgrcWS8/Qfdw+EZ6VEjz8XyoMom2ga1ryvlf1co7/Mt4oeHF8IL2lWZu3bt7
         a1wtI+HAzfYq0rS/jGv6nR3whb4WvdoWhgrVwkBr8QBUiX3OpgmfPRIecDQB0PSKsIaL
         NVR337Iz+vbqRZ0dmTbq5HOdEo+2cRS+hRR5Cnv5L9R45n1qxueV5k0eoIRii6npqoEb
         A38g==
X-Gm-Message-State: AOJu0YyX+qiingvUNdaoXQ19gyHhmtaAUISFAri0wg+VJt2gL32vsk63
	BzZRZJxxXZY6GjvfPQFeSEZyFkoUVzF6VgMugeWnKSXQxm3A0yHqNyJVoY1bbMZmdMNAEzhrdI2
	Y
X-Google-Smtp-Source: AGHT+IFo4N9LnGujJoDz1RqufZwRegILqY9+Yy/YBA3+QwwcYfB0R6VoUFM8Z5hR6fBQ0o0l2/PjjQ==
X-Received: by 2002:a17:907:2da2:b0:a9f:450:48eb with SMTP id a640c23a62f3a-aa4dd71a2c0mr206835866b.45.1732102559783;
        Wed, 20 Nov 2024 03:35:59 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] x86/irq: fix calculation of max PV dom0 pIRQs
Date: Wed, 20 Nov 2024 12:35:54 +0100
Message-ID: <20241120113555.38146-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241120113555.38146-1-roger.pau@citrix.com>
References: <20241120113555.38146-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current calculation of PV dom0 pIRQs uses:

n = min(fls(num_present_cpus()), dom0_max_vcpus());

The usage of fls() is wrong, as num_present_cpus() already returns the number
of present CPUs, not the bitmap mask of CPUs.

Fix by removing the usage of fls().

Fixes: 7e73a6e7f12a ('have architectures specify the number of PIRQs a hardware domain gets')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index d44d2c9a4173..bd5ad61c85e4 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2744,7 +2744,7 @@ void __init ioapic_init(void)
 
 unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
 {
-    unsigned int n = fls(num_present_cpus());
+    unsigned int n = num_present_cpus();
     /* Bounding by the domain pirq EOI bitmap capacity. */
     const unsigned int max_irqs = min_t(unsigned int, nr_irqs,
                                         PAGE_SIZE * BITS_PER_BYTE);
-- 
2.46.0


