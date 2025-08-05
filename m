Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40466B1B17F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070233.1433945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMG-00040K-Cp; Tue, 05 Aug 2025 09:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070233.1433945; Tue, 05 Aug 2025 09:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMG-0003vb-5M; Tue, 05 Aug 2025 09:53:24 +0000
Received: by outflank-mailman (input) for mailman id 1070233;
 Tue, 05 Aug 2025 09:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEMD-0001yh-RQ
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:21 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04c6e06f-71e2-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 11:53:20 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so3581404f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458b73868a4sm128606745e9.11.2025.08.05.02.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:19 -0700 (PDT)
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
X-Inumbo-ID: 04c6e06f-71e2-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387600; x=1754992400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLIn3FF6zwDcWQpb5QcmoMzmzTKK4Qs20CfUmv+TlvU=;
        b=pryDO7v4wpFvoa4dmDMvxdpOKkRxHpN7dF6Okli9zEBoyuEdbvVNgrGmx3UqXUa/Kd
         yRBJppAOglSfAL1iPUmjcDB0c4RWIPfDY+Gn4yoUjFIGlnbDqfdR8rPM7R/WFMOQBVCn
         UTCSQAkvxVI608jbJ3MRArKTS4HGkFBgrF774=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387600; x=1754992400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLIn3FF6zwDcWQpb5QcmoMzmzTKK4Qs20CfUmv+TlvU=;
        b=emBCJ0WJbH/KaxcUKZ9q1mLdaCE8jKSGFnIWRDPSHM617T9sHCs40d2jcxwO2O/R1v
         xAy1t1EC3bCWu0tRrdVcuIn9yC+1WYEuGXeG5PlhWjn3kKGG54HpyQi0pL+ssM9dLV46
         NUTnbdJr62iO1IAWT0nELhoUs865thF2DW8HKyYXfvgsWem9pGBo9gFFtRusFMhkLxhz
         fJlOGU9sBPca+uoTtF5vd8Ljr0BSGzhhwWktKtZWW8rwFvv9nxmzLRoD+NVBUqP+mbZW
         2veCoF7hnwR7RNO62i/wIJ8hrDstQDV7j7wQi2Tbfam5oEFRaG2B1O5dNiqB8lfwyJC6
         s1qw==
X-Gm-Message-State: AOJu0YwFEkOdL6QiAW6AnVVOrXC0CmtFOhud2dITX1a58/SZ3DeuUeJl
	k1NV673DKCk2nfTf/oAwjicvDa1XlX5shU5wdPuZePr//66TZv1/07uBeYCK+falle3N4+BpKyr
	febNQ
X-Gm-Gg: ASbGncvCMp52xD6gXqOYFWeFJkEORdbC5ZtzntVtstJHmhFgeNpg2GaYuJQyylj3IGB
	ZE0OW0nqAz4P7fSn0R8LeZ4/iWX1P7m3FH103Jb90WJ7ihe43LdU/ZN9SobNiWxkyPiwPm9wmHT
	b74b1LkT/UC80/NVbZSMdsyWioO48jikk0YCMSP3vXx+IClj5uTpoVAF7yItkPbiggTVrGA2vso
	zGLsO1RHhixjWaWcSASusmu+VkcliN2dGZIsSv2voWHMMTZe9ZOIsaHzpBowTascrCyos3gu5B9
	HaxzaD6aKv/TTgQFeelLM4Gq0O3urIqER8DFMBQHHkp8n/yiW5vVswACRo5lM1y+PB7PIofYhIU
	uy8aMZXNQ/d2/M4GcmMcioVlg2RK4SkMZrAJ9sLekxBZStfzma2sOVJP63IiVD41lTzIkNIzf1s
	Bc
X-Google-Smtp-Source: AGHT+IF1tlMb6KZwDcyrJwRY0DLZ3X9YMOMVZzsA08b0rnKgAvFdrqoP72cSYcW9kqUAOHbX8Xfvpg==
X-Received: by 2002:a5d:5d0e:0:b0:3b7:9564:29be with SMTP id ffacd0b85a97d-3b8d94c1febmr8669986f8f.49.1754387599726;
        Tue, 05 Aug 2025 02:53:19 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 8/8] x86/mm: adjust loop in arch_init_memory() to iterate over the PDX space
Date: Tue,  5 Aug 2025 11:52:57 +0200
Message-ID: <20250805095257.74975-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805095257.74975-1-roger.pau@citrix.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's a loop in arch_init_memory() that iterates over holes and non-RAM
regions to possibly mark any page_info structures matching those addresses
as IO.  The looping there is done over the PFN space.

PFNs not covered by the PDX space will always fail the mfn_valid() check,
hence re-write the loop to iterate over the PDX space and avoid checking
any holes that are not covered by the PDX translation.

On a system with a ~6TiB hole this change together with using PDX
compression reduces boot time in approximately 20 seconds.  Xen boot time
without the change is ~50s, with the change it's ~30s.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Ensure parameter to pfn_to_pdx() is always RAM.

Changes since v2:
 - New in this version.
---
 xen/arch/x86/mm.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e7fd56c7ce90..e27dc28cfdd6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -275,7 +275,7 @@ static void __init assign_io_page(struct page_info *page)
 
 void __init arch_init_memory(void)
 {
-    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
+    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn, pdx;
 
     /*
      * Basic guest-accessible flags:
@@ -328,9 +328,20 @@ void __init arch_init_memory(void)
             destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
                                  (unsigned long)mfn_to_virt(ioend_pfn));
 
-        /* Mark as I/O up to next RAM region. */
-        for ( ; pfn < rstart_pfn; pfn++ )
+        /*
+         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
+         * skip holes which would always fail the mfn_valid() check.
+         *
+         * pfn_to_pdx() requires a valid (iow: RAM) PFN to convert to PDX,
+         * hence provide pfn - 1, which is the tailing PFN from the last RAM
+         * range, or pdx 0 if the input pfn is 0.
+         */
+        for ( pdx = pfn ? pfn_to_pdx(pfn - 1) + 1 : 0;
+              pdx < pfn_to_pdx(rstart_pfn);
+              pdx++ )
         {
+            pfn = pdx_to_pfn(pdx);
+
             if ( !mfn_valid(_mfn(pfn)) )
                 continue;
 
-- 
2.49.0


