Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D693D620
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765512.1176150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMux-0000hJ-9K; Fri, 26 Jul 2024 15:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765512.1176150; Fri, 26 Jul 2024 15:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMux-0000f4-6A; Fri, 26 Jul 2024 15:31:39 +0000
Received: by outflank-mailman (input) for mailman id 765512;
 Fri, 26 Jul 2024 15:31:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMuv-00084Z-Uf
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:37 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 255233ec-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:31:37 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-708adad61f8so726198a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:37 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fab9ba9sm17151416d6.104.2024.07.26.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:35 -0700 (PDT)
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
X-Inumbo-ID: 255233ec-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007896; x=1722612696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D+8OpNgSxikEbAcjcwMvwV6ssnWzWasPU4PrnTdBEE=;
        b=dPbGo67K6EHMyH5XkjAL+SxkZOBlja+6K/vMPo+pLiHgVrNa+G3Eztrs/9oADFcDt9
         O0NSnM3/sXXCBxZsP8hdhC3hvsvnaUXB96nW3o6yTBkjfBeZWMhNENTbQDkGfSxi4DCl
         xDClQ8PQ1bwDGfAMbT8bzSY2Onx/fkNQAyb3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007896; x=1722612696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1D+8OpNgSxikEbAcjcwMvwV6ssnWzWasPU4PrnTdBEE=;
        b=QYob78A8z1kjBMTTun1EjXofIms9B/jMSEkIHdj6VYiLLb4iG1kDYLfDy77kSDrQc7
         +rqdYighj+2vWykFD1EFnWeikLA1sRlqRPFjA/9DcqTgqdzPvAZTo6CoFrBObDUgv/n1
         hs7IQ5RygM4bBQpv2XECFoRwdb9555MTDWTQFZndnPtcTKJl22EdVJl59YQLFafr0hjj
         IFuoOd8dp2Ccln/xDNOVfES4h4BgpEy86IrKS4LbghgsR8P+TkZdiXm9YHeUUwTd/Q5j
         AkT3ScGiHt2gy/zLdpFqF3XKkBYwmCSebo2dV/qH898ZTZsMb38BV3C6Xpyy/Oo1Ea4V
         UNaQ==
X-Gm-Message-State: AOJu0YygVTaB+kEGCk7lhIIYGx6C34eT/8Gzie/HYhmCMTG5RI/7xne2
	H0oIIUpvdjx8MvjdEzBqoo92ckFcmpDdEhR73JAJqkG8Dx/1OmybxXGFNIjn9UFGDIq8DxySU+r
	J
X-Google-Smtp-Source: AGHT+IGW6Jn234GYX3zr224VkCf1lMsflVoxkzb2acZ/LDiAqdHCiEKnBIOIZJqcFAakpcNykPeUFw==
X-Received: by 2002:a05:6830:6386:b0:703:5db8:805 with SMTP id 46e09a7af769-7093210b60dmr7311216a34.4.1722007895551;
        Fri, 26 Jul 2024 08:31:35 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 04/22] x86/mm: ensure L4 idle_pg_table is not modified past boot
Date: Fri, 26 Jul 2024 17:21:48 +0200
Message-ID: <20240726152206.28411-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The idle_pg_table L4 is cloned to create all the other L4 Xen uses, and hence
it shouldn't be modified once further L4 are created.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 6ffacab341ad..01380fd82c9d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5023,6 +5023,12 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
         mfn_t l3mfn;
         l3_pgentry_t *l3t = alloc_mapped_pagetable(&l3mfn);
 
+        /*
+         * dom0 is build at smp_boot, at which point we already create new L4s
+         * based on idle_pg_table.
+         */
+        BUG_ON(system_state >= SYS_STATE_smp_boot);
+
         if ( !l3t )
             return NULL;
         UNMAP_DOMAIN_PAGE(l3t);
-- 
2.45.2


