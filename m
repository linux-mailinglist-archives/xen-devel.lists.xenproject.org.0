Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C308A00AA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 21:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703576.1099273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudhh-0005EI-K5; Wed, 10 Apr 2024 19:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703576.1099273; Wed, 10 Apr 2024 19:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudhh-0005Cg-HH; Wed, 10 Apr 2024 19:33:53 +0000
Received: by outflank-mailman (input) for mailman id 703576;
 Wed, 10 Apr 2024 19:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rudhg-0005Ca-8W
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 19:33:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4257748e-f771-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 21:33:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a51aac16b6eso307568166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 12:33:51 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y9-20020a056402440900b0056e3707323bsm5979403eda.97.2024.04.10.12.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 12:33:49 -0700 (PDT)
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
X-Inumbo-ID: 4257748e-f771-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712777630; x=1713382430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0irfrVrpqm+MWlSh3nT3HIX5ho9HQLtaPGTwOIu4/9w=;
        b=kyDAqonlRMHoREHLHZKv50hqiqGIt6miNcbrz8YIOD7Wi2WsAeTGeQGKgGp1EVs9ml
         fKgTZ/ELGrV3zWwS1IO7ObGoFKav9YHqkck/+xSRIjaIKXF794VJ5hNmdMZdoNENi4b1
         Zq6F8zcd7Km+0jDz884BqFsTTP44mS9VGYaOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712777630; x=1713382430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0irfrVrpqm+MWlSh3nT3HIX5ho9HQLtaPGTwOIu4/9w=;
        b=tdIC/aVIFxS7d60qGXCqi65meCplH/4sEJmk2tyjcRq040tq6shwft7ux5Uy+L4lzS
         exyV91z6qT+OrwOIAlKQfSqxaOkmVRtTciRBo8KlnnzlDxcnSaiNq+UuW37Lo1Cjvdii
         a5xNbfkQ9b8mC36TyIdH8xwvrR/gatiVUfuCQjpiPNQ27aThtUhbwFD2PfBPz3uvqTiY
         I4/FQWPBkAmZrKk+MWHcrDRN5P7EiBfZrK8xqSlX4PA/Ohrsc2fdois0zaB7IdSfjskk
         Z+aZZW6Roj6XgZcgRVTWVn2SoidpwKG55H0gvGM6Z/FIqNf+zXMyQ5nr7Eo/kQpkSXkt
         EADg==
X-Gm-Message-State: AOJu0YwoT6sxUW4uigKvnP6QejPCl0NjBszgDGqDXhOausduPGtPNk4i
	HvyEKH0i3YSlXIP/RM8FRCfQPZBUNk8o/2b4L7bwZku7RVKxmqhSxOpKcWzca38UV0gE/WOVkmM
	J2S8=
X-Google-Smtp-Source: AGHT+IG5shGsR74/T3oXRTSmFm28Z75nYIQWUbcHYhk5pPm60FLJp/zaT9XMbXKSX6n1YRFL4G4V/g==
X-Received: by 2002:a50:8d5e:0:b0:568:abe3:52b2 with SMTP id t30-20020a508d5e000000b00568abe352b2mr3122066edt.23.1712777630302;
        Wed, 10 Apr 2024 12:33:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/vPCI: Remove shadowed variable
Date: Wed, 10 Apr 2024 20:33:48 +0100
Message-Id: <20240410193348.1492018-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resolves a MISRA R5.3 violation.

Fixes: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/vpci/vpci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 260b72875ee1..97e115dc5798 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -62,8 +62,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
     spin_unlock(&pdev->vpci->lock);
     if ( pdev->vpci->msix )
     {
-        unsigned int i;
-
         list_del(&pdev->vpci->msix->next);
         for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
             if ( pdev->vpci->msix->table[i] )
-- 
2.30.2


