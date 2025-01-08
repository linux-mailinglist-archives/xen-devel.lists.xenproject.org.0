Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38880A05E9D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867318.1278812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4l-0006Lf-Ha; Wed, 08 Jan 2025 14:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867318.1278812; Wed, 08 Jan 2025 14:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4l-0006JN-Bi; Wed, 08 Jan 2025 14:30:27 +0000
Received: by outflank-mailman (input) for mailman id 867318;
 Wed, 08 Jan 2025 14:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4j-0005q4-4f
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:25 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188548c9-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:23 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso2802169566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:23 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f616sm2491596166b.41.2025.01.08.06.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:20 -0800 (PST)
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
X-Inumbo-ID: 188548c9-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346622; x=1736951422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIPMScFRi+9eS7pQY1QinUJZuVfM6Y6c4f6yI4NQszg=;
        b=cwUmBYMMH2KdOgmADw6l1twje8VUwkxrJekztKuVk74M0XBrUhq0kuaXIU3IG6mGGF
         g/oaS+4SC6E+de2i+sONEyJiHqI8QPLcsTIgcLMsCPa3xpg4bzX5nLi+1tr/luwTYLxA
         GKStlzPD/1SaB+OZlNasKIGkhEvQvQTM0o3E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346622; x=1736951422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIPMScFRi+9eS7pQY1QinUJZuVfM6Y6c4f6yI4NQszg=;
        b=aoSjabnSWEND0SUMYQbrguGol1xlyPTjsXnQQ9ro7PpXxmRZy81PJJDO+gelnrvjPC
         b9FnLV3ZoR8OBVkvwgT+q1PTPZmvaquRLTBf/cTZxiaqV2+Ke57/YwzSkUYJN4IgdVL8
         V5rErUYzmns1iRLds16gRTGXgJMeDGoOkcZcxQXTz98Ul55R+weqP4iykorxsFA1Ox3G
         ydeTqrBvBq86aO45u5K+Hei1axocg3qu6yRXyazWpadzkwAigomfALDeujAJX8BAOsIB
         fk00XtpqHLGKdFASmiLbG718INpIY2XWzndcPdApEyZVKnzYTUZHGKlYRUiAF8L44wuF
         J4fA==
X-Gm-Message-State: AOJu0Yx8vDtbr8eqVvcUVLgfLivKmd9QcG4sg6Grq9Grh6ZnTe00F1Tg
	WPQC6Y0Zk34ebyDDe7c2rMkiYR4wgeBWHlO9HggoOkQOo8fsLz46vElWUdSybbA8VhXWspPve9r
	G
X-Gm-Gg: ASbGncudtOzLIGnv2FGaJOLiZuAvrG5RXpxrovIWoYA5GReJPg9xpJ1LMs/KASEfTrC
	fORvJbusFxTqscv8Uu9u3oKYtdTGggKCyZL0R1Lu30k/hmYvVfhrJKtMIsM2pkcRJWJ0/dArMdH
	AI48lI2AQMIzW54EJE+OgYxJ6fflohQg+HAjTo+3ToH7qoe1p5mgVOz4slHf/UmBEsjYcKS7Ro6
	1n15fR65PZfGEU9NEkXILDcIqOwJIklPJmacnglrMBPiGi7hCYigTf4YT7InG6g3w4=
X-Google-Smtp-Source: AGHT+IFHptL442A0fMrP5bxV31r2PKY0Z2nBrnnSNstGJc8woCK9m2xHZd644PLKPTI8mqyRHn3vWA==
X-Received: by 2002:a17:907:368c:b0:aa6:9624:78fd with SMTP id a640c23a62f3a-ab2abc78a71mr296403766b.48.1736346620715;
        Wed, 08 Jan 2025 06:30:20 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 01/18] x86/mm: purge unneeded destroy_perdomain_mapping()
Date: Wed,  8 Jan 2025 15:26:41 +0100
Message-ID: <20250108142659.99490-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The destroy_perdomain_mapping() call in the hvm_domain_initialise() fail path
is useless.  destroy_perdomain_mapping() called with nr == 0 is effectively a
no op, as there are not entries torn down.  Remove the call, as
arch_domain_create() already calls free_perdomain_mappings() on failure.

There's also a call to destroy_perdomain_mapping() in pv_domain_destroy() which
is also not needed.  arch_domain_destroy() will already unconditionally call
free_perdomain_mappings(), which does the same as destroy_perdomain_mapping(),
plus additionally frees the page table structures.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hvm.c   | 1 -
 xen/arch/x86/pv/domain.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 922c9b3af64d..70fdddae583d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -708,7 +708,6 @@ int hvm_domain_initialise(struct domain *d,
     XFREE(d->arch.hvm.irq);
  fail0:
     hvm_destroy_cacheattr_region_list(d);
-    destroy_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0);
  fail:
     hvm_domain_relinquish_resources(d);
     XFREE(d->arch.hvm.io_handler);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 7aef628f55be..bc7cd0c62f0e 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -345,9 +345,6 @@ void pv_domain_destroy(struct domain *d)
 {
     pv_l1tf_domain_destroy(d);
 
-    destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
-                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
-
     XFREE(d->arch.pv.cpuidmasks);
 
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
-- 
2.46.0


