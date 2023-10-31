Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97037DD173
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625957.975788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrVN-0002LS-Lj; Tue, 31 Oct 2023 16:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625957.975788; Tue, 31 Oct 2023 16:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrVN-0002Jf-Hp; Tue, 31 Oct 2023 16:22:13 +0000
Received: by outflank-mailman (input) for mailman id 625957;
 Tue, 31 Oct 2023 16:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L368=GN=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1qxrVM-0002B8-Ms
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:22:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4616237-7809-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 17:22:10 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso44267945e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 09:22:10 -0700 (PDT)
Received: from z0rr0-Latitude-7490 ([2a01:e0a:257:8c60:c550:f26a:2ce9:e5df])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b0040839fcb217sm2247089wms.8.2023.10.31.09.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 09:22:08 -0700 (PDT)
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
X-Inumbo-ID: a4616237-7809-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698769329; x=1699374129; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FyehYb6JwXAsjruZeGnWm5F+IXqKAV6rVUPq42rsfQc=;
        b=VCLb3mwr+jivaJB0fsJmDTWWVmZS60L8flR31kuEcyU7jLaiOeokJ+xQN3ZX/E2LiU
         FzFbWAX2zJ4AqerqK7UsRpqYhU9um1/pp9Uom14gRSOemcDuVmvOEL2nrk0aVzsztwVg
         0iNWGa6I3UlGyELkOqb8/I4Dzl9k1JVdr569sYuYnkC79czSEQTnY+utOoTWSJEMvaQZ
         JW6YFBjupSGVRLCcAFEFXd/IhluYUESQK5DVBhN8kv2wrFhkMyl6wjSwyLcselaYRqum
         H2wbYldVa7Gat70x/ZTKVWZGmipYfyAuIqhKtd2HFK0aC/Bsp6iKYNK6opJ6CYqqfR9g
         N2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698769329; x=1699374129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyehYb6JwXAsjruZeGnWm5F+IXqKAV6rVUPq42rsfQc=;
        b=XBqRsLfnxAMXOdFCrDIhZTOHi3eetAAFgoQZmyJL3XHYKqyvkI+Dfvi3pEShZfaZT/
         E2rFILeMGILf2whFUklaL7QTl7S7jxuY0QKlpHix9rCiVJ3zWK6E16qIivrqAoOS84XV
         ip32w6Y8P4F9b8OoEpaWOT8j+V8W9NJWOpuKTLj+aqYGY1ez6F2eiQJmBKW7J2m5O+dn
         5ZWRyt7DAc3exmKWkcrKwmchYxAHwzU/brq/l7E6Dkjy3HYTs0fwkdJjZFCwedQcgZUM
         sU1YHq41oRDfsNCFgwKX1px2w5SbMDVvRerb/jPENVe+tiC4duSkoGofl3ZNG9gP6hTJ
         bdaw==
X-Gm-Message-State: AOJu0YzwYo3lEmNQFDlSsMbS0xqbToy0yF2TpGZ4Ipr6bww3fetEqUlU
	xLwRe6KiCtcXpta282jD7i9w8nUWEdgEwT1q
X-Google-Smtp-Source: AGHT+IG7y2GphMr+Jbfw6j5oLBAP6/4jBIUEDqE/A2be+Wy/4Wxm/Ss5nSCTY2/0fiB5zlOiXk+/ew==
X-Received: by 2002:a05:600c:4f53:b0:3fa:934c:8356 with SMTP id m19-20020a05600c4f5300b003fa934c8356mr10726723wmq.10.1698769328843;
        Tue, 31 Oct 2023 09:22:08 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
Date: Tue, 31 Oct 2023 17:22:06 +0100
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matias Vara <matiasevara@gmail.com>
Subject: [RFC PATCH v3 2/3] x86/mm: Do not validate/devalidate PGT_none type
Message-ID: <dc05dc908f0a39e26e589099a4dd79404d5f32b2.1698589351.git.matias.vara@vates.fr>
References: <cover.1698589351.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698589351.git.matias.vara@vates.fr>

This commit prevents PGT_none type pages to be validated/devalidated.
This is required for the use-case in which a guest-agnostic resource is
allocated. In this case, these pages may be accessible by an "owning" PV
domain. To lock the page from guest pov, pages are required to be marked
with PGT_none with a single type ref. In particular, this commit makes
the stats_table resource type to use this flag during
get_page_and_type(). 

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
 xen/arch/x86/mm.c   | 3 ++-
 xen/common/memory.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5812321cae..d2f311abe4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2787,6 +2787,7 @@ static int _put_page_type(struct page_info *page, unsigned int flags,
         {
         case 0:
             if ( unlikely((nx & PGT_type_mask) <= PGT_l4_page_table) &&
+                 unlikely((nx & PGT_type_mask) >= PGT_l1_page_table) &&
                  likely(nx & (PGT_validated|PGT_partial)) )
             {
                 int rc;
@@ -3072,7 +3073,7 @@ static int _get_page_type(struct page_info *page, unsigned long type,
          *
          * per validate_page(), non-atomic updates are fine here.
          */
-        if ( type == PGT_writable_page || type == PGT_shared_page )
+        if ( type == PGT_writable_page || type == PGT_shared_page || type == PGT_none )
             page->u.inuse.type_info |= PGT_validated;
         else
         {
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 2acac40c63..e26ba21d75 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1254,7 +1254,7 @@ static int stats_vcpu_alloc_mfn(struct domain *d)
 
     for ( i = 0; i < nr_frames; i++ )
     {
-        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
+        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_none)) )
             /*
              * The domain can't possibly know about this page yet, so failure
              * here is a clear indication of something fishy going on.
-- 
2.34.1


