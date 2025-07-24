Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CBB10964
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055814.1424121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuKC-0003IH-FH; Thu, 24 Jul 2025 11:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055814.1424121; Thu, 24 Jul 2025 11:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuKC-0003Gf-CZ; Thu, 24 Jul 2025 11:41:24 +0000
Received: by outflank-mailman (input) for mailman id 1055814;
 Thu, 24 Jul 2025 11:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1w5=2F=cloud.com=aidan.allen1@srs-se1.protection.inumbo.net>)
 id 1ueuKB-0003GZ-2Z
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:41:23 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12b6b1d7-6883-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 13:41:02 +0200 (CEST)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e8dd92e3eeeso668958276.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:41:02 -0700 (PDT)
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
X-Inumbo-ID: 12b6b1d7-6883-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753357261; x=1753962061; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rsiviYBnRoqDv9NKVBEgn1+FJYggdCimJe63aKcLXlU=;
        b=EPTUafrZWRxlIOH6Mv1H+OQwV4Ku7S6wJBNrNcxGB6T/No/es1LR+SsHYrMB+sm5QO
         eIcAzm4wl507g4f7uRgKC8VZ606chOJUexPbK5hzC6Clq/iXKciozZR3cU0cDbxJBsME
         aLisICxKQ2UZGR8dGP1BQLfH4x8SmSIdXCFSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753357261; x=1753962061;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsiviYBnRoqDv9NKVBEgn1+FJYggdCimJe63aKcLXlU=;
        b=aOjAjrpjBtxr9xCU/nXztzuJR+vvZTxb+MZ6AGEf5BGVzT9NtZCEREWNG00q3nospy
         2pEhfiBJjnZu7hUa0DErl5AQnNPU86LdhGInpyjN16jZbfnjdlEMm27HRTqUYnwUXFMC
         OlhZz1hROqXRSiKxr4NKq+rZPcmZscRc/+jIzB0LxdJ7gJ2Hj3uJQMVyvFQPlkL4lz3T
         BUz8UbxHSmaR0c2GmDKuA7qDgMuwrOm1abpEquryoteIoenx2lHgFKeQiEWfg4xREuEI
         aQsT1+ZVb6R1nc63UC8KpOjxg2xgjZ1Ja6WgzDmo1s+WXQay5a6LMkSjnjpraKTBHctz
         QTRQ==
X-Gm-Message-State: AOJu0YzVyY2g52YjSbYft8kF0dm03ciYrEZrQ/nWo/t+LAez8BaymyU0
	c/38OLsQaeonUSkEYyIhDFdWzRwKCwPVYVOEjCYyPtH6unK1rttQIYOgLGGmM4XLD+IN8I99pdI
	VvlAKt8tr5dPQin4YW9jYeFFr3CtBUA37E4wmrDFoYcEcUO3Eh/fy4VY3gA==
X-Gm-Gg: ASbGncvQUpAcUV+/Gr6AlB0/MCA4ywwHUNNkpb8bFKwcFUMkrzGfkmQcxZcR1Q4xe22
	aoxyMUwr8RAtR1K/j3XuIKWe+OScWCoS8r3QzWR0Md3ZSc1mIJinCU7VrJ7GQRH2rRnbVtWfilW
	lZWpr36kwi6yh8pXOgpho3uy3cD0nBSotPNHQqiNYJ9DVUXNEJP3EF+0ZTP+y/FFEM9JSVT0kb6
	2eYB734
X-Google-Smtp-Source: AGHT+IEVvVw2cY4QMsP4NK5vFDZo7fVfq5tru9xLcuGBEDU2Pmxe4SoLJAJ3V0Z+o5TSUcWZzKMJlXb1eW9UoRQtYc0=
X-Received: by 2002:a05:6902:15cd:b0:e8b:d0d5:27e5 with SMTP id
 3f1490d57ef6-e8dc5851e04mr7650581276.14.1753357260478; Thu, 24 Jul 2025
 04:41:00 -0700 (PDT)
MIME-Version: 1.0
From: Aidan Allen <aidan.allen1@cloud.com>
Date: Thu, 24 Jul 2025 12:40:49 +0100
X-Gm-Features: Ac12FXzeG_846OPaw2ul73ZIjhN56xM26npSSBZAVabz1OeM2rSZunE42dwsQr0
Message-ID: <CANgacT8YrH66iUEPr60AVytXYMivPzxC0SO4_RPohjk1Vo2w8Q@mail.gmail.com>
Subject: [PATCH] x86/domain: Dump domain paging pool sizes with the rest of
 the pageframe info
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bernhard Kaindl <Bernhard.Kaindl@cloud.com>
Content-Type: text/plain; charset="UTF-8"

Added the ability to view the paging pool size via the debug keys

Signed-off-by: Aidan Allen <aidan.allen1@cloud.com>
---
 xen/arch/x86/domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 503a55705b..b64d09a9c8 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -253,6 +253,10 @@ void dump_pageframe_info(struct domain *d)
                page->count_info, page->u.inuse.type_info);
     }

+    printk("    Domain paging pool: total: %d, free: %d, p2m: %d\n",
+           d->arch.paging.total_pages, d->arch.paging.free_pages,
+           d->arch.paging.p2m_pages);
+
     nrspin_unlock(&d->page_alloc_lock);
 }

--
2.47.1

