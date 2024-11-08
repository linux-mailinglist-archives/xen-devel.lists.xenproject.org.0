Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2903F9C1C32
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 12:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832465.1247796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE7-0006kg-7h; Fri, 08 Nov 2024 11:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832465.1247796; Fri, 08 Nov 2024 11:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE7-0006i1-4B; Fri, 08 Nov 2024 11:32:31 +0000
Received: by outflank-mailman (input) for mailman id 832465;
 Fri, 08 Nov 2024 11:32:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9NE5-00060f-NF
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 11:32:29 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2158ed38-9dc5-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 12:32:26 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso355449366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 03:32:26 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2f45fsm221932666b.204.2024.11.08.03.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 03:32:25 -0800 (PST)
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
X-Inumbo-ID: 2158ed38-9dc5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIxNThlZDM4LTlkYzUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDY1NTQ2LjcwMDIyOCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731065546; x=1731670346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0FsFkoIjQtR5Yklh+Ux7paSLeD4eOoP2CsT3Yg/Cq0=;
        b=J7PbuHBopXB4U33tV0+XXTD8hEMcaKPwBkKGW/dal1QO8kG8K8x4cH7kw1KjDMJv0a
         nDXBxb2vQphbM3kQW+rhEETYLTLAg77jC6mheYvbAPgV6T8Y7hnqbTGRkC4pIfPOKR8d
         IjPe4zPzWXxNcys4R9S4hlt8F6uMtwIght0L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065546; x=1731670346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0FsFkoIjQtR5Yklh+Ux7paSLeD4eOoP2CsT3Yg/Cq0=;
        b=MJr5JE27Y/fCMQb+GxisTlqa6Nm2eCWMd5L304vqb0MsXVzKOsefxgzb0Zp0U+Geu9
         oxXcSru52b3bSegKP2+Qi2edSPoSiSaq1Na1BEltGbrZnRi4I9s1HhNv2ubF7Cyqj2Km
         7akSgS1v1jv/HV0e/Jxb/deMDpSVAOa56mwCKCb++vvT/OaWHKzMTpPICicGuJqXlwS4
         RGqmzscI437R0tX37zxRndE6VWbIbONfD1S05wVnCIPhDHUvvX11DJoNeu5q3LhFDzeQ
         ctYKKHV1ytvrw4BKtO3OmBhha6DVWZpIG46XpqxH1ND1585Bqnt/5PvjhfL5q8tZWf84
         mWEg==
X-Gm-Message-State: AOJu0Yz9EEWHi1xMJxwpLPzFT4Ly8/iE8nGm5VkHgTIxn8JYjVfUsH1x
	PwTebNkg+XGY81Bt14N/TevrWg9GiIAGAELmdpwMxTVUbPUxE4YToDzhpq1DqZ7A33qGqxNH6tI
	h
X-Google-Smtp-Source: AGHT+IFy4fnRmgbWrct3CZB3rKXTHBYaRMNiebB/Puw9Ue9WYq850IfO2FJ0xODFGojsIO+hspGLsA==
X-Received: by 2002:a17:907:7243:b0:a9a:49a8:f1fa with SMTP id a640c23a62f3a-a9eefeed031mr220996966b.23.1731065545811;
        Fri, 08 Nov 2024 03:32:25 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@ctrix.com>
Subject: [PATCH v2 3/4] x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
Date: Fri,  8 Nov 2024 12:31:43 +0100
Message-ID: <20241108113144.83637-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108113144.83637-1-roger.pau@citrix.com>
References: <20241108113144.83637-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bootstrap_map_addr() needs to be careful to not remove existing page-table
structures when tearing down mappings, as such pagetable structures might be
needed to fulfill subsequent mappings requests.  The comment ahead of the
function already notes that pagetable memory shouldn't be allocated.

Fix this by using map_pages_to_xen(), which does zap the page-table entries,
but does not free page-table structures even when empty.

Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
Signed-off-by: Roger Pau Monné <roger.pau@ctrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Adjust commit message.
---
 xen/arch/x86/setup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eac8488c4ca5..be7ca26b3dd5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -461,7 +461,9 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
 
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


