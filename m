Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873B8419574
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 15:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196896.349794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUr5N-00068l-A3; Mon, 27 Sep 2021 13:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196896.349794; Mon, 27 Sep 2021 13:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUr5N-00066D-6q; Mon, 27 Sep 2021 13:54:25 +0000
Received: by outflank-mailman (input) for mailman id 196896;
 Mon, 27 Sep 2021 13:54:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWny=OR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mUr5L-000665-VM
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 13:54:24 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69e5ed81-a244-4f2b-9e75-00b2c35d305e;
 Mon, 27 Sep 2021 13:54:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i4so77797235lfv.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 06:54:23 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f25sm1610780lfk.11.2021.09.27.06.54.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Sep 2021 06:54:21 -0700 (PDT)
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
X-Inumbo-ID: 69e5ed81-a244-4f2b-9e75-00b2c35d305e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=jGIe6yzxklf8s+KZ6dGRr06t9LLIe4sCf3QMi2lTE0k=;
        b=FiQZdjgArW3TEJvJs13Q/5Sl2jXn+8PESRkxlICuIKXXHZXiKe14GuHC/d/YqXSvWr
         f4VQnIueGbx9Qxu9TjAK3JSte0F+LCo1xmmEN8+IckFNAziUxtdLvEZUnDbAWjqCmD8i
         rX/YYcN45hKNY5Fax8RvRaumEFWIABVNEanrmJV410575fPxsVYS91EFNJNVinBEIF/7
         /KSqWtwdzmK+WC4GQLstjrGu/nSWNx1ywR4mfdW244xu1ASZrgSl9/3JAlq66SM5WEMm
         6/chjAMK7Qc0ebEHE6kxGcUPOV4ApLxnSPnVPqk2tB+ixSkaYPpiaztCwUD05tZn1Odi
         nZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jGIe6yzxklf8s+KZ6dGRr06t9LLIe4sCf3QMi2lTE0k=;
        b=UJeVjPQ6303kJhIBHM8QD8iJbRJJEzjmLZHBtJER6fcJTNpP9ewiFAYZgVUaAmmx1q
         Wedroa7o5qHtf187c+zB9K3nDSWjDyGHnkeEvhxym0kL7EKTCxFEKYYmQAklAeMgGYgQ
         +sSOuU3Aav4g6hZC6tmrSCUNvA08LTmP0QTRfZO5GhuNQ2Ddtu4jNK2CrbVGOe4zDsc5
         K8z3KN1QCc7s8B7VwlUmXvv3GI4CLbaMmoNZpqrRGF8OVyN46cesCH1VfeA9fkEima4P
         Qwsi0jW18NssjDIhjK2NhT7UE0Tjc/CmMjGJfTgkIkuU7B0TMmaqBOeS+OAnROQ29pOa
         481Q==
X-Gm-Message-State: AOAM533EZeZNsx7HuPnjxxxtAWEozI31V6UR8TQvGxvvva5EgFyRHv5V
	DK91LkIDvmc+ya3HVm+UDa4M97NqZ6Y=
X-Google-Smtp-Source: ABdhPJzTwZ8eZoi+ltHQPL1GIa9m2GVyBhq96FjpW162MV4kBY6fPdKnFZlAD5PF92iAheKR0+Cn6A==
X-Received: by 2002:a05:6512:3052:: with SMTP id b18mr25269970lfb.561.1632750861833;
        Mon, 27 Sep 2021 06:54:21 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	tee-dev@lists.linaro.org
Subject: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for OPTEE_SMC_DISABLE_SHM_CACHE
Date: Mon, 27 Sep 2021 16:54:10 +0300
Message-Id: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Fix a possible copy-paste error in arm_smccc_smc's first argument (a0)
for OPTEE_SMC_DISABLE_SHM_CACHE case.

This error causes Linux > v5.14-rc5 (b5c10dd04b7418793517e3286cde5c04759a86de
optee: Clear stale cache entries during initialization) to stuck
repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
I wonder whether this patch wants backporting to the old versions
since OPTEE support went in.
---
 xen/arch/arm/tee/optee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 3453615..6df0d44 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -1692,7 +1692,7 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
         return true;
 
     case OPTEE_SMC_DISABLE_SHM_CACHE:
-        arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
+        arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
                       OPTEE_CLIENT_ID(current->domain), &resp);
         set_user_reg(regs, 0, resp.a0);
         if ( resp.a0 == OPTEE_SMC_RETURN_OK ) {
-- 
2.7.4


