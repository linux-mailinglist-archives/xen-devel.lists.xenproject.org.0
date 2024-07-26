Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26093D621
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765514.1176169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv1-0001I3-Sg; Fri, 26 Jul 2024 15:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765514.1176169; Fri, 26 Jul 2024 15:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv1-0001Ef-Op; Fri, 26 Jul 2024 15:31:43 +0000
Received: by outflank-mailman (input) for mailman id 765514;
 Fri, 26 Jul 2024 15:31:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMv1-00084T-1n
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:43 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27d047fb-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:41 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7a1d42da3baso57124785a.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:41 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe820158esm14064471cf.73.2024.07.26.08.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:39 -0700 (PDT)
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
X-Inumbo-ID: 27d047fb-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007900; x=1722612700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xB8CrUuvcSfc2nlcH8MxzDzMULu8CCxjZFQajnmXd4=;
        b=rAG0gPfdWsyWmy1P9g3gvzV5bNgiGgG98k5YOBlVlCfxdLKMKGkm3+cMRO3YkcURst
         mi5ztb0CV9VtSY4meOYnYLls0nxS40q0iENp4IHp26J5vqBEBQFVW6T7uAV8OM0eEjIP
         29Mp2g+pauVBnbFwsz9Am4Ri2qTNWdE1rJVbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007900; x=1722612700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xB8CrUuvcSfc2nlcH8MxzDzMULu8CCxjZFQajnmXd4=;
        b=Bm/8QvXjX8DZZQNWBvqqvHaK2lGvbOZJ08LiuyrV9U29jnsrDFtf5UGTuLLIRAx6vL
         wHOcVV32b4wBo0GEv2XQy2A6OoWTF3sTpI0PQYBS5gjSnMh7lnYqqv7XPSMMdlrMWyYU
         5NYwoo134A9lHKJzK1KK2t4Z5U+ouPihQgN6ZM9f0MyM8frh/TAN7aw+5TfckGvVPTYM
         gaRst43bB8WdeqwFAqqo3blk+b7cEXXjs7iEQNhSizatEK+OAw0sj9EZcCKUwj4NcBLN
         2HJKTLuwoWwujlrerNdfWFsrcCkI1uLguSPQAouxKWYF4QaSVlaPg9nIv/LIH/7Xiko9
         MOBA==
X-Gm-Message-State: AOJu0YwHBrJPcQbqY4o0+6adH15gbooEzE8DiGNrzzeSqKSuIl8MW1gR
	9zBHZNrYlYscTfCPabXWK2807d6bHbY4q+0jS30AHTZYjiDhKto0RPGWlNqk8MxOGCjpPP0jsJB
	/
X-Google-Smtp-Source: AGHT+IG5blLKfHhCf2QVQb7PvatlQw/jrtr6nl9TiOaAlzbLO5OiY1VzEjatQoI/IW6I/wUCr86o/w==
X-Received: by 2002:a05:620a:17a4:b0:79f:62a:808 with SMTP id af79cd13be357-7a1e52fbc86mr6582685a.61.1722007899832;
        Fri, 26 Jul 2024 08:31:39 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 06/22] x86/mm: introduce a local domain variable to write_ptbase()
Date: Fri, 26 Jul 2024 17:21:50 +0200
Message-ID: <20240726152206.28411-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reduces the repeated accessing of v->domain.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index ca3d116b0e05..a792a300a866 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -517,13 +517,14 @@ void make_cr3(struct vcpu *v, mfn_t mfn)
 
 void write_ptbase(struct vcpu *v)
 {
+    const struct domain *d = v->domain;
     struct cpu_info *cpu_info = get_cpu_info();
     unsigned long new_cr4;
 
-    new_cr4 = (is_pv_vcpu(v) && !is_idle_vcpu(v))
+    new_cr4 = (is_pv_domain(d) && !is_idle_domain(d))
               ? pv_make_cr4(v) : mmu_cr4_features;
 
-    if ( is_pv_vcpu(v) && v->domain->arch.pv.xpti )
+    if ( is_pv_domain(d) && d->arch.pv.xpti )
     {
         cpu_info->root_pgt_changed = true;
         cpu_info->pv_cr3 = __pa(this_cpu(root_pgt));
-- 
2.45.2


