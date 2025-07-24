Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09497B1087E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055728.1424112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetlD-00035n-3N; Thu, 24 Jul 2025 11:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055728.1424112; Thu, 24 Jul 2025 11:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetlC-00032a-UP; Thu, 24 Jul 2025 11:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1055728;
 Thu, 24 Jul 2025 11:05:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetlB-00011w-FI
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:05:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 119074be-687e-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 13:05:12 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451d54214adso5372575e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:05:12 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45870532baesm16529805e9.1.2025.07.24.04.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:05:09 -0700 (PDT)
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
X-Inumbo-ID: 119074be-687e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355111; x=1753959911; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFlfWuMJOmhx5usqEIhEHfIIY5QCQp99txG+M8VywEQ=;
        b=C50+pDZME59I38jNbQylyYEPlBF/6puzwXmxzwlJk03tV4aNPgYMccx8BPTi72eul9
         pPd4yfHOLnB3GxfsRhjLLaOU41uPxm8Ioqt2luRclFw49LC2wfnq3/vhkzz88GwJIC+r
         DM9AF9Qd2hB0Wc0LerIfEVnSJKdSAgI0eS5uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355111; x=1753959911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFlfWuMJOmhx5usqEIhEHfIIY5QCQp99txG+M8VywEQ=;
        b=NfPRgaSgPslW+56VU5Ur5c+lm+Y7FSA+DIXE6DzaFdHCSkNl+SL7GDsMMBnhFswUSv
         FxL/Hnm2is8beLKPdgOqF+V0s9nMJHRtSuCpMySiKeOTxUIqyDzamdEriZa5EuoWG/2+
         q7NhTs6LcM2xK/tYaahTM/6vKizOXNw2AwIEIftoKgCaPfvlJ74oh0/Kdy3sMDWRbTBM
         Pw1Z6Nb0FNwjf1/hBfOOOQdlOOX1VNDRaSIuALluijwMz3tNq9Ru0ZjO2KNkOYQNI6Iw
         qeaqLqPToYHsJl+t7ifK1yAxZC1kYyuVkdfw9v0LEn/MwEEQaYpkneNLCsBNHO/IA5rV
         noHw==
X-Gm-Message-State: AOJu0Yz2eNQXKhY6mzmQ/gfnGEAsZUaEs6+1U7gX/oKgrSgDsbuCBYwv
	heErbqkS8LAfxzWr8q3Hlx1wsGjN/0VIAIciFnTbj4+jiICSdcn/BvZMITytDPbCqYRdWJTt41a
	alC1d
X-Gm-Gg: ASbGncuY7fi9mbHQPkXepsXYWVNsfoWZCrNkSyyhIsz58iiS5wWK/GiQurGE+4ROur7
	hIcXxw6WqGqCO/1JPjGtN/hSLLxmUVAAH3lqXESoZYUJXqvYZmOirlUkPZztk64ak/55jst0s0/
	cUCiEFDHdXgM1NssHFmDESEsvOLUPdc2e5MjDht2yRtx63fBWOOELiR8wXHiNV5jCs6NtS/iLzd
	q7DnCYLhQbE6mrqP/F253dS8b6Q1bfbfq5l5HwHBq2NerLoMQ2QF4BvKaPABsEYsNWxrnbdBb/v
	UbBdi0bTsVVnAINi9yhO5uqoyQdVFp/9yW1ASB1a2GgTV77LG7ZqZtE70lQeMzgT19O80LD7IAL
	qh/1JD1/SJ8PaqtDxAhjLbfUxm2oFLf8udElNmzF+W+gePZBsp80TGj6wybqfJQtb2A==
X-Google-Smtp-Source: AGHT+IEzCmI44FtmhD/GUunQws3PmEjOyLqKx9nZqyLxCLTipWpVA4pZ3wgU1qzKaxD36LAruVBfSg==
X-Received: by 2002:a05:600c:6209:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-45868c8ec7fmr54963695e9.12.1753355110979;
        Thu, 24 Jul 2025 04:05:10 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 8/8] x86/mm: adjust loop in arch_init_memory() to iterate over the PDX space
Date: Thu, 24 Jul 2025 13:04:16 +0200
Message-ID: <20250724110416.2081-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724110416.2081-1-roger.pau@citrix.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
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
Changes since v2:
 - New in this version.
---
 xen/arch/x86/mm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e7fd56c7ce90..647bf0b41db6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -275,7 +275,7 @@ static void __init assign_io_page(struct page_info *page)
 
 void __init arch_init_memory(void)
 {
-    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
+    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn, pdx;
 
     /*
      * Basic guest-accessible flags:
@@ -328,9 +328,14 @@ void __init arch_init_memory(void)
             destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
                                  (unsigned long)mfn_to_virt(ioend_pfn));
 
-        /* Mark as I/O up to next RAM region. */
-        for ( ; pfn < rstart_pfn; pfn++ )
+        /*
+         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
+         * skip holes which would always fail the mfn_valid() check.
+         */
+        for ( pdx = pfn_to_pdx(pfn); pdx < pfn_to_pdx(rstart_pfn); pdx++ )
         {
+            pfn = pdx_to_pfn(pdx);
+
             if ( !mfn_valid(_mfn(pfn)) )
                 continue;
 
-- 
2.49.0


