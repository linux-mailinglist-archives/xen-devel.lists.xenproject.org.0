Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB31554EE2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354124.581174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o425T-0000XA-KJ; Wed, 22 Jun 2022 15:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354124.581174; Wed, 22 Jun 2022 15:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o425T-0000UG-Fg; Wed, 22 Jun 2022 15:16:11 +0000
Received: by outflank-mailman (input) for mailman id 354124;
 Wed, 22 Jun 2022 15:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1Wy=W5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o425S-0007QM-A0
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:16:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e20e090-f23e-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 17:16:08 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id j24so3170909wrb.11
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 08:16:08 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a05600c35d100b0039c8d181ac6sm28227360wmq.26.2022.06.22.08.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 08:16:07 -0700 (PDT)
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
X-Inumbo-ID: 3e20e090-f23e-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Glmdpk5hXbczqNv+ac/nkmkigm6yLxJMUpuRVh2TjsI=;
        b=oS26zn8SKFQT+EdvV/SiugpAYS4v+7adUzfaWx5rWDjqg1e6SHtKaIcg2D6N1iJaqT
         B/NJhKYEYRffgo0msSSv9zMe3Estxd2p3pd1+7HXv/YDLjVHLEduhG7Z8fsv5vJcQOCP
         kcZ3JmnNHq6zItj/QIQ62Ls+gU2oWOC2FD2gIgm1KfTzq1mT+CaRmd8xA94X4fBGIXHv
         vlKtUB//cHBu8Nd22WGVUSJ9iBgr1DuCHSDRBN2BXCxk31UHw5P1acKd3ooqQP6uHESC
         Qf44atBQysoreFHzm09j6siYaN4St2jWG9bx/w8Fei6K8J0sjmeFH5DpeygaDHmuemU7
         AruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Glmdpk5hXbczqNv+ac/nkmkigm6yLxJMUpuRVh2TjsI=;
        b=JhDeFkZ9fNyibDxzUYzRjUxMb/O6B03SVj+xWuXm4GYCyC6CiYfwry/39azYS1p0JR
         RZ0/LzLExK9ndReqDiqSTcaoKO0loNr/R+8E0X1OHOoF4datUtUHtD7vdh1yO/DQY248
         Uy79IDs2iaD8nvlZwQWwtB4hBxxEIkY4NROOAjJMcDUNeAne3N5dE/c0Nkb0Yq/u3/da
         RIR9+RszM6vJfoz7JOWrI1jy7EnwXiWlq17OdASAtF8uOe7S2lb3SJBU4iOpjmG2/gKu
         hh/5vbacCzswOlZoOgx3Hv07S0VtUIwK0a8pQuoQ1Bz+uFbK4wDrZrCY5gGtw9uy1zUO
         3OWw==
X-Gm-Message-State: AJIora8Og4iXrZVL3auikJNT13VBviJyU7BZd0Qa5fEaPP+eMej3OwXa
	8ws0NB3aQYgntdEUp87XuZ17e+KHWmw=
X-Google-Smtp-Source: AGRyM1v6gsmmUBYmBcgDGD86yHRTJRC88HCtNFamITn6v2arofRI4+Z95XLvLyRko8Ail9P7TlAI8g==
X-Received: by 2002:a5d:47a1:0:b0:218:423a:de8f with SMTP id 1-20020a5d47a1000000b00218423ade8fmr4008747wrb.420.1655910968031;
        Wed, 22 Jun 2022 08:16:08 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/common: device_tree: Fix MISRA C 2012 Rule 8.7 violation
Date: Wed, 22 Jun 2022 18:15:57 +0300
Message-Id: <20220622151557.545880-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function __dt_n_size_cells() is referenced only in device_tree.c.
Change the linkage of the function from external to internal by adding
the storage-class specifier static to the function definition.

This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/common/device_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0e8798bd24..6c9712ab7b 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -496,7 +496,7 @@ static int __dt_n_addr_cells(const struct dt_device_node *np, bool_t parent)
     return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
 }
 
-int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
+static int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
 {
     const __be32 *ip;
 
-- 
2.34.1


