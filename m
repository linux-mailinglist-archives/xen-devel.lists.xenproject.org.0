Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C443C554
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 10:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216721.376446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeRC-0005Ns-TE; Wed, 27 Oct 2021 08:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216721.376446; Wed, 27 Oct 2021 08:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeRC-0005Lc-P7; Wed, 27 Oct 2021 08:37:34 +0000
Received: by outflank-mailman (input) for mailman id 216721;
 Wed, 27 Oct 2021 08:37:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8pr=PP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mfeRB-0005LU-Lw
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 08:37:33 +0000
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8376256a-e93e-43d8-92a3-a152ccc425bf;
 Wed, 27 Oct 2021 08:37:32 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id h7so7427422ede.8
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 01:37:32 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm10384213ejb.27.2021.10.27.01.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:37:31 -0700 (PDT)
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
X-Inumbo-ID: 8376256a-e93e-43d8-92a3-a152ccc425bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nKdpva6p5fpUHBXlhpaAq3a17KOb7MYX4+nJD3bMK0k=;
        b=SZsQKvfK4kBNrvX2rvB1GEFu1s8yx1LwCm2WSl6VGCwSkI3QpELhP1PqED5KqmN9qD
         +Eqz+u4wF0mL3vcLupen01QticrTkajV/1YFrVL1QMoQW84v+/6SvKnAfza2wliJK+BU
         vC0gAytBbOEn/V06hMfFFfZLeHlMsIqeq8T0BuCmtzj9xqkIFlZT6CaWiuGRssk8IJEd
         XSS7P/ZStXtLo+iCPXvdYAxi1TTyx1mOR/lFVhTqT8FA2x1rxgaiL7tzO+1HW/aaysSC
         /rP8Hvmb/yXlzyzf3Pjh9W8h59nFGBTuIWDzu/uIiBmPNZytbpl3I0DKr/LRG1JWWUbf
         pONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nKdpva6p5fpUHBXlhpaAq3a17KOb7MYX4+nJD3bMK0k=;
        b=ScTETFe1VXvVlulSuHjokuIdZjWPWjvxhk3alIpS1CzDyHehFtUGN8diC7r0e2lHZU
         MWjUukkpnpsY7J6aOEgnPISSEhEuOXm9xdEU5EltNuxD4CQbVO+eDdtJRs1SwgCbEnoq
         +1e+DkKyZhpW22XsqFFXBcuyskw20oNwk9rMF59unOExThKAL+Bv3ZomZkevWeUpfYIc
         VPAlERfZFHEnEWlP454SxQiz02HQK71gBPEF4Uz+yd4THqKYa5dEX2M8SrmeNK0e/xVX
         EYx7mptiGoovgIDsmworDuFjn0tXYAEm3W+dv6eGcxKKPJDe4SPd7FUIG+PB/Ub6dGUy
         vlgw==
X-Gm-Message-State: AOAM5300/4Zo/7fS1XTeN2JI/HG3JY1HB2PRUax6hC5y9UHStMPsG8SX
	NSOAe1hVEaVUIiq7f8hmP98ASWFpSXYWiA==
X-Google-Smtp-Source: ABdhPJxIbRnfGTC7i7uLo6/WI1E3MYCAD/qD0/azXuAkcJrdj4QMZ/YwmRywiWIegl40UkZWWvomVA==
X-Received: by 2002:a05:6402:1e95:: with SMTP id f21mr18468968edf.160.1635323851935;
        Wed, 27 Oct 2021 01:37:31 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	iwj@xenproject.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH] xen/arm: do not try to add pci-domain for disabled devices
Date: Wed, 27 Oct 2021 11:37:30 +0300
Message-Id: <20211027083730.1406947-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

If a PCI host bridge device is present in the device tree, but is
disabled, then its PCI host bridge driver was not instantiated.
This results in the following panic during Xen start:

(XEN) Device tree generation failed (-22).
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not set up DOM0 guest OS
(XEN) ****************************************

Fix this by not adding linux,pci-domain property for hwdom if it is
neither available nor device enabled.

Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/domain_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 124ade09123a..beeecf84a209 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -747,7 +747,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
             return res;
     }
 
-    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") )
+    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") &&
+         dt_device_is_available(node) )
     {
         if ( !dt_find_property(node, "linux,pci-domain", NULL) )
         {
-- 
2.25.1


