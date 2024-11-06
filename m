Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81979BE90D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:30:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830878.1246001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAM-00054u-Gl; Wed, 06 Nov 2024 12:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830878.1246001; Wed, 06 Nov 2024 12:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAM-00050G-DB; Wed, 06 Nov 2024 12:29:42 +0000
Received: by outflank-mailman (input) for mailman id 830878;
 Wed, 06 Nov 2024 12:29:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8fAK-0004JA-OJ
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:29:40 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca10e52a-9c3a-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:29:38 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so56949101fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:29:38 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a42asm2651723a12.18.2024.11.06.04.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:29:37 -0800 (PST)
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
X-Inumbo-ID: ca10e52a-9c3a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmMiLCJoZWxvIjoibWFpbC1sajEteDIyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNhMTBlNTJhLTljM2EtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk2MTc4LjYyNjQ1Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730896178; x=1731500978; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcaVEltxEnxyr1CO9t1j4OvKSjNdZa22JUuN+LyK/nw=;
        b=D5rVW28cromVCQheO1PJKkr+WQJB0Ttj4DGC5vwzQgETSzpsCxfvDupu6YfP6pYPbd
         eJLR41CNCx9JALx2lfGmINXOhObPvVh2yc+2fQFtMWOXs2Uh3z9PFYseUunD/p2oC51W
         CL1NTMLVoWbkETzOtHSOmLR/mle7lXGr/DJ10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896178; x=1731500978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcaVEltxEnxyr1CO9t1j4OvKSjNdZa22JUuN+LyK/nw=;
        b=DJubesFFo49bt/XtDJz5WtYv4VWIZAw2VO1a9Em+QvOh3szMBY4olpRGQ4Nf07D8Af
         y1J+IaCG3+21p+GorZOQALxaquZd+OxzbqqNNDwvhYRPJgz/MlbP53YZcI3ruzrqWDiH
         6qyVJ0LdIyFUAZtpIjyXmwLMgvwiOUFwah3Nbd0vi6kGWdza/v2xiWtC4eCgEaLxh+rj
         /a2BTXjiPUpRROOJn+FUKK92ZCTQ7ibqmdQ0fTavEP0pBvwUSJMK9UyOH3PUuxL0rB3V
         CrXpAUVgtMopar+73IY1owWAaug4m/3xehukRe0Xf4Qu2+4XLDqFQQXksl+kz5Z3SIAh
         kC7w==
X-Gm-Message-State: AOJu0Yw+TGLjyvyWjZftnmiRgQ2Dvo0IzXs2FLUcXPiRlsrRWljfiVQP
	Qo+3DRm0ptRUxZWBOsMKjoOag2fFhw5gVFjfxe0thlhO/NIr6tozfFk3mCDFffaPb5viON/dIXZ
	3
X-Google-Smtp-Source: AGHT+IEFjGTqghs/TdsB9cSFSKBeL7oEkX8qGPdc5XOODpnBxogvgGl8TtwpM6RgS/hg+ei7Ok/TfA==
X-Received: by 2002:a05:651c:553:b0:2fb:6169:c431 with SMTP id 38308e7fff4ca-2fcbdf69596mr202631541fa.9.1730896177689;
        Wed, 06 Nov 2024 04:29:37 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@ctrix.com>
Subject: [PATCH v2 3/4] x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
Date: Wed,  6 Nov 2024 13:29:26 +0100
Message-ID: <20241106122927.26461-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241106122927.26461-1-roger.pau@citrix.com>
References: <20241106122927.26461-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bootstrap_map_addr() top level comment states that it doesn't indented to
remove the L2 tables, as the same L2 will be re-used to create further 2MB
mappings.  It's incorrect for the function to use destroy_xen_mappings() which
will free empty L2 tables.

Fix this by using map_pages_to_xen(), which does zap the page-table entries,
but does not free page-table structures even when empty.

Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
Signed-off-by: Roger Pau Monné <roger.pau@ctrix.com>
---
The fixes tag reflects the fact that if 4376c05c3113 freed the L2 correctly
when empty, it would have become obvious that bootstrap_map_addr() shouldn't be
using it if it wants to keep the L2.  4376c05c3113 should have switched
bootstrap_map_addr() to not use destroy_xen_mappings().
---
 xen/arch/x86/setup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 177f4024abca..815b8651ba79 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -456,7 +456,9 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
 
     if ( !end )
     {
-        destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
+        map_pages_to_xen(BOOTSTRAP_MAP_BASE, INVALID_MFN,
+                         PFN_DOWN(map_cur - BOOTSTRAP_MAP_BASE),
+                         _PAGE_NONE);
         map_cur = BOOTSTRAP_MAP_BASE;
         return NULL;
     }
-- 
2.46.0


