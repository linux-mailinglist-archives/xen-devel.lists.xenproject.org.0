Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639BE912F0B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 22:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745567.1152705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlKh-0005zW-SN; Fri, 21 Jun 2024 20:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745567.1152705; Fri, 21 Jun 2024 20:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlKh-0005xg-P2; Fri, 21 Jun 2024 20:58:07 +0000
Received: by outflank-mailman (input) for mailman id 745567;
 Fri, 21 Jun 2024 20:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKlKg-0005j1-Kg
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 20:58:06 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f465af9f-3010-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 22:58:05 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so881006a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 13:58:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042d509sm1440011a12.43.2024.06.21.13.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:58:03 -0700 (PDT)
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
X-Inumbo-ID: f465af9f-3010-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719003484; x=1719608284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdyjt3BIACM8vTSuTSumyihaZrwR5nCq3lnnqbQTCh8=;
        b=vCXU0+Aj8Gi0FtsVdCZBEFM9KaYOmZ3INS1y/xw1aL+TbhhbRn+HpQ6padg6BnOzRa
         ECgw3J9/iWjCUTptnIo36x+uSpVEGXtnEXGWqXfEoXdln0YrBNd8N5Nb4ynNzVBev2ay
         8IDBeC4jl7/Ce9OWEe6wmoCQbWq/TSEfhlaZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719003484; x=1719608284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdyjt3BIACM8vTSuTSumyihaZrwR5nCq3lnnqbQTCh8=;
        b=JZrSblH1OC+Sn6Xq7U53rTpY2x3ckALwQ0UmvzmDI1jLYZVnf7zKo/DIcWikC4uSoz
         dIFCIrEZPcF7LeMAGlGBamHcgMano3jaGi/FoFisyaYB60/6v0vuwVwMwRbvwERaBa6i
         jpwajJZQxM9HVoMJrV9BMrg+d/CHrfTpJ03dUp1rlolnf8AFlriwJP4jzsPDiwlknNUV
         Xfg9viubNxydMc/yqBSr3kbUjdCrai2OQQzHAm0AXIm44T5EU77QhiBEdTHUetqDiVas
         QibqleVDMYRs6IFV0qYbL9VT1zXLlnChcXusOgoLCKY+2YNPyOwA8IBn75Q0S2J/vfGs
         wDag==
X-Gm-Message-State: AOJu0Yy7aNJZ1SShm8oABvEroOCp4blksKfOgXgRs2cSHWTjQwDnCfz7
	xX2eQxtvjxhMLUuM1srIIDNCMhithtXMXyPRXo/XrKlM+vuwI5wrry/IlzgiW9Px/gQ3iYJN7SV
	oTwU=
X-Google-Smtp-Source: AGHT+IGsGEoeFtjCEZAmgNF0aYxzTDgFROuk8KFeQVBo+qKImCPjmGqgL9fBnC3cLsT564i1CILIVw==
X-Received: by 2002:aa7:db51:0:b0:57d:3df:ba2d with SMTP id 4fb4d7f45d1cf-57d3dff2a40mr540834a12.2.1719003483976;
        Fri, 21 Jun 2024 13:58:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] x86/pagewalk: Address MISRA R8.3 violation in guest_walk_tables()
Date: Fri, 21 Jun 2024 21:57:59 +0100
Message-Id: <20240621205800.329230-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621205800.329230-1-andrew.cooper3@citrix.com>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 4c5d78a10dc8 ("x86/pagewalk: Re-implement the pagetable walker")
intentionally renamed guest_walk_tables()'s 'pfec' parameter to 'walk' because
it's not a PageFault Error Code, despite the name of some of the constants
passed in.  Sadly the constants-cleanup I've been meaning to do since then
still hasn't come to pass.

Update the declaration to match, to placate MISRA.

Fixes: 4c5d78a10dc8 ("x86/pagewalk: Re-implement the pagetable walker")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/x86/include/asm/guest_pt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index bc312343cdf1..7b0c9b005c1f 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
 
 bool
 guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
-                  unsigned long va, walk_t *gw, uint32_t pfec,
+                  unsigned long va, walk_t *gw, uint32_t walk,
                   gfn_t top_gfn, mfn_t top_mfn, void *top_map);
 
 /* Pretty-print the contents of a guest-walk */
-- 
2.39.2


