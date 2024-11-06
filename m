Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D21F9BE90F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830879.1246011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAO-0005PM-QH; Wed, 06 Nov 2024 12:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830879.1246011; Wed, 06 Nov 2024 12:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAO-0005Lh-Mt; Wed, 06 Nov 2024 12:29:44 +0000
Received: by outflank-mailman (input) for mailman id 830879;
 Wed, 06 Nov 2024 12:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8fAM-0004JA-GE
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:29:42 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb314818-9c3a-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:29:40 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so5259529a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:29:40 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6ab10d4sm2682195a12.27.2024.11.06.04.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:29:39 -0800 (PST)
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
X-Inumbo-ID: cb314818-9c3a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNiMzE0ODE4LTljM2EtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk2MTgwLjQ0MjEzOSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730896179; x=1731500979; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qHELgAq1nN/UXJ9bkfqeoULYcH/rWuJ4SStRsxggRI=;
        b=og54/+ebibxUwSvlYnffQ0gEm3nLbtM5ufHn6FndVD2PjdnPRUaqGXIRmQAw5aikGX
         5k9PMoEvFsU3UBclrmivLopxdg/CxvYG+1rFMUABALBRMf5FbHC9BvkNxN98hfaBArV/
         zzWzUEc33OJ6JrZQAfbHM7Bm3NXG13Skajm0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896179; x=1731500979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qHELgAq1nN/UXJ9bkfqeoULYcH/rWuJ4SStRsxggRI=;
        b=Hlwn5x8i+D2VyQIXZ3yyxZvj7qNM8grCasm9E1iF4ytZU837pNXm2UGjGg3AXTKCw1
         KTGK/uL7CSvPbSevgDlNhdqyidthS8dzB9xedA6HadH0YpREYYLEeUX54oigSCxrr4Dk
         jYtsLZQQ37Sr9hZCPJoBYr8cfLQOoZDqCDA67BI2TpOr6qy6mEW///9UYL7pT0fer2mG
         un4I1n/vZw8OJBWfQglUwHNLcrzAeHROs3LMLO3CKD1u5dYcTwgI4dsOyvFBf09V9qs6
         NArvTq5zy/1KAhLUe0v6F0FoNEAqQNguyDnFkrLLGJfqP/3e0lnVyxWzSaUsP8MjrVJn
         UxrQ==
X-Gm-Message-State: AOJu0YzO17SKQdJ1QkX0WJrTVTCit0Y5fiZUyOUIsAmLOaS330ilMlKq
	K7RAHKzh9yiyZxZKyyoDLIH3MNvtLdHUCfXbh28SFu0EQh0FdGDbduDmmFvPLaVIjknpPg3uW7+
	S
X-Google-Smtp-Source: AGHT+IFQg/goUaMDwivI0dHrgfSpC+FBj2jDnE6V14jWVDhd0u+uAbDhiS+3oq9lLxJyn3ZMKEXu1Q==
X-Received: by 2002:a05:6402:5203:b0:5ca:14e5:b685 with SMTP id 4fb4d7f45d1cf-5cbbf888bcemr29831951a12.3.1730896179560;
        Wed, 06 Nov 2024 04:29:39 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 4/4] x86/mm: ensure L2 is always freed if empty
Date: Wed,  6 Nov 2024 13:29:27 +0100
Message-ID: <20241106122927.26461-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241106122927.26461-1-roger.pau@citrix.com>
References: <20241106122927.26461-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic in modify_xen_mappings() allows for fully empty L2 tables to
not be freed and unhooked from the parent L3 if the last L2 slot is not
populated.

Ensure that even when an L2 slot is empty the logic to check whether the whole
L2 can be removed is not skipped.

Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 8f7c397a82d4..05d3ba095627 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5712,7 +5712,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             v &= ~((1UL << L2_PAGETABLE_SHIFT) - 1);
-            continue;
+            goto check_l3;
         }
 
         if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
-- 
2.46.0


