Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC89CDC41
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837033.1252944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtKF-0001iy-4j; Fri, 15 Nov 2024 10:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837033.1252944; Fri, 15 Nov 2024 10:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtKF-0001gd-2C; Fri, 15 Nov 2024 10:13:15 +0000
Received: by outflank-mailman (input) for mailman id 837033;
 Fri, 15 Nov 2024 10:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNXE=SK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBtKE-0001gS-B2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:13:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3754560d-a33a-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 11:13:10 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cb6ca2a776so2650595a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 02:13:10 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79ba0774sm1420028a12.36.2024.11.15.02.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 02:13:09 -0800 (PST)
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
X-Inumbo-ID: 3754560d-a33a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM3NTQ1NjBkLWEzM2EtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjY1NTkwLjUzMTc3Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731665590; x=1732270390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cosIWsB6OhzrFMvHBWxzUYafQjL8qHoH+ZKKxBA8zOc=;
        b=FoG5SbjuB9q/MZpi2tWM/sEaSU0Oi1tCERpmw4rHzwBUuQN6chU9A7cwIuJcaOkpa0
         kdDKfDNGuA8LwIAL0df5c65jGiKAVC/n7pNC+8H+Bh++98TaE/npwC+xKuV83JU9JUlm
         9a6XtRNkaTMT9IgSlxbCuUKwEFqHv/L2nmQa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731665590; x=1732270390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cosIWsB6OhzrFMvHBWxzUYafQjL8qHoH+ZKKxBA8zOc=;
        b=pW1DkNM+fbSJV2+S7NmDk85Wnsms9F4nibpF4BiYdp/kFqI8WaTUh1jC+LhGzRWk6C
         3PfsMfi/8+YVyCg2IzTs6KE+wysePP/3pJuN+/jrJpfi0KFBnMmShvf6lCx3Ddtrdofb
         Pej6L+/cHiaCreqYMWhcbitUmfhDmhiWy2sXF4i42wDe57K8eqKToycw0vvFNGCuQQrt
         D+pZEJeDHR0ZT+K1SgV93gvrF613oiqL/DtcwuMgDB8UF77OhuIVa01dQtc9W0c5JHTI
         849IYb9ujyVoMPh6BNjmuPp0cT+6sWtYdYZJZP2DtJgEbkvjbzMzf7P4mKFaqcr3lKJ1
         vZLg==
X-Gm-Message-State: AOJu0Yzy4gynlGlZpQEh3g4E8uNgNjp3PcreYTGw9Aa9ihfIgswPMqjX
	jh8aC+dhws6r7FwZizEbuRyI3ld5cjItG6kNvkaMxmUS296Jh4eJdrLxgXxlC+Rp+vTe5blPqcd
	8
X-Google-Smtp-Source: AGHT+IFgE+Q+PGFNwiVaXlVX/XFvhmO5oh2P0rZvFaGdjZadAIahSfxU5wqze7H4mg1kuLybA0U0EQ==
X-Received: by 2002:a05:6402:26cb:b0:5cf:9c4e:962f with SMTP id 4fb4d7f45d1cf-5cf9c4ea2f9mr205384a12.15.1731665589645;
        Fri, 15 Nov 2024 02:13:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/mm: fix alignment check for non-present entries
Date: Fri, 15 Nov 2024 11:12:25 +0100
Message-ID: <20241115101225.70556-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While the alignment of the mfn is not relevant for non-present entries, the
alignment of the linear address is.  Commit 5b52e1b0436f introduced a
regression by not checking the alignment of the linear address when the new
entry was a non-present one.

Fix by always checking the alignment of the linear address, non-present entries
must just skip the alignment check of the physical address.

Fixes: 5b52e1b0436f ('x86/mm: skip super-page alignment checks for non-present entries')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5d7e8d78718c..494c14e80ff9 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5525,7 +5525,7 @@ int map_pages_to_xen(
         ol3e = *pl3e;
 
         if ( cpu_has_page1gb &&
-             (!(flags & _PAGE_PRESENT) || IS_L3E_ALIGNED(virt, mfn)) &&
+             IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
         {
@@ -5644,7 +5644,7 @@ int map_pages_to_xen(
         if ( !pl2e )
             goto out;
 
-        if ( (!(flags & _PAGE_PRESENT) || IS_L2E_ALIGNED(virt, mfn)) &&
+        if ( IS_L2E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
              (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
              !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
         {
-- 
2.46.0


