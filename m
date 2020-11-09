Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F892AB8DE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22530.48894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6lq-0005Ho-V5; Mon, 09 Nov 2020 12:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22530.48894; Mon, 09 Nov 2020 12:59:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6lq-0005HP-Rg; Mon, 09 Nov 2020 12:59:42 +0000
Received: by outflank-mailman (input) for mailman id 22530;
 Mon, 09 Nov 2020 12:59:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dq-0003tf-HT
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:26 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82cd251f-0a00-4bda-afad-5c275205e25e;
 Mon, 09 Nov 2020 12:50:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s9so8391861ljo.11
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:46 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:44 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dq-0003tf-HT
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:26 +0000
X-Inumbo-ID: 82cd251f-0a00-4bda-afad-5c275205e25e
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 82cd251f-0a00-4bda-afad-5c275205e25e;
	Mon, 09 Nov 2020 12:50:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s9so8391861ljo.11
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LgLl6GM036W1KRVdmwK/U4Ej5BMvrSeEvhXdIuom+ac=;
        b=iVAQBM0OfQj5dQiwPcEeoDLByL/4ourFSArcjdgeei6AGbR9xIJ9A6b1V7HKm4Sa1G
         6CFmgvdfXlktq0S1j7o3FB+nxuUnNv13LHnW7nWGaD7A37gu5gowSHhDfeP6x5TwXooG
         h8DGnR36m1NMJUxH74sENUrm9yHZenghpc8Sbe87gsrDe0s984czdwWuN3wxA7/nRtMU
         eMYusiu0i0FP63MKqiNSFKmnZdTZWL465Ie/ggj2VLUR28u0HXtd+LFWQmX8Aqr32yJH
         svYFxvWVec3cKbaOJI46lOvsWbfsZkaC+8LWH9DEYGsOGHjkGXH2W7E3XZe/B4EsRbmS
         cwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LgLl6GM036W1KRVdmwK/U4Ej5BMvrSeEvhXdIuom+ac=;
        b=g8f2/DTfwYzBF6jXtYvfbksz3V9YKuMmDvfPphjeXHG6lD8xHNVy0kxhIbbTLrOMUh
         K1jqBQHYEpmo0jlyyaEe9BQuxxGBwK9teGRyudV7zx+WZFCPuBYuXHspO+kaYWq5BwHy
         EPvC3BmCc+huB5Kz7aEcXtGx89zyHgXGDXCiqnCLQgePOY2iyJ40j5Q/cwjTgIbbpPMm
         vNDcjtYqanp9+biC3RpsnTZjhbJ1PIDJLeJUZ9ZGpl5NdMOwKo0WJGZu4KdT8qvqAYyz
         LM9D+GykJOk9AYvwvaPdAj2OaTzW+l7Vao8+9mF0NiYq6lUamzWmwmGn5/32OfW3HBgU
         rgtw==
X-Gm-Message-State: AOAM530GcDFmANHKeM8zbGaOsOcyzLYaqUnwf0fu2u/hW/FMxHUtC1mj
	o5Q/lNhaE5LzqBACtCtT4y4=
X-Google-Smtp-Source: ABdhPJy6R+2G+Qrko7GXDmhFwZ5TybTy9d9/cnVEZZCiAFf7wsNOj+yFYPCBcswfB0YeugnM8l8ntg==
X-Received: by 2002:a2e:9ad0:: with SMTP id p16mr1347028ljj.424.1604926245382;
        Mon, 09 Nov 2020 04:50:45 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:44 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 10/10] [HACK] vpci/rcar: Make vPCI know DomD is hardware domain
Date: Mon,  9 Nov 2020 14:50:31 +0200
Message-Id: <20201109125031.26409-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1f326c894d16..d5738ecca93d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -34,13 +34,19 @@ struct map_data {
     struct pci_dev *pdev;
 };
 
+static bool is_hardware_domain_DomD(const struct domain *d)
+{
+    return d->domain_id == 1;
+}
+
 static struct vpci_header *get_vpci_header(struct domain *d,
                                            const struct pci_dev *pdev);
 
 static struct vpci_header *get_hwdom_vpci_header(const struct pci_dev *pdev)
 {
+    /* TODO: this should be for the hardware_domain, not current->domain. */
     if ( unlikely(list_empty(&pdev->vpci->headers)) )
-        return get_vpci_header(hardware_domain, pdev);
+        return get_vpci_header(current->domain, pdev);
 
     /* hwdom's header is always the very first entry. */
     return list_first_entry(&pdev->vpci->headers, struct vpci_header, node);
@@ -74,7 +80,7 @@ static struct vpci_header *get_vpci_header(struct domain *d,
         return NULL;
     }
 
-    if ( !is_hardware_domain(d) )
+    if ( !is_hardware_domain_DomD(d) )
     {
         struct vpci_header *hwdom_header = get_hwdom_vpci_header(pdev);
 #ifdef CONFIG_ARM
@@ -304,7 +310,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     if ( !mem )
         return -ENOMEM;
 
-    if ( is_hardware_domain(current->domain) )
+    if ( is_hardware_domain_DomD(current->domain) )
         header = get_hwdom_vpci_header(pdev);
     else
         header = get_vpci_header(current->domain, pdev);
@@ -641,7 +647,7 @@ static uint32_t bar_read_dispatch(const struct pci_dev *pdev, unsigned int reg,
 {
     struct vpci_bar *vbar, *bar = data;
 
-    if ( is_hardware_domain(current->domain) )
+    if ( is_hardware_domain_DomD(current->domain) )
         return bar_read_hwdom(pdev, reg, data);
 
     vbar = get_vpci_bar(current->domain, pdev, bar->index);
@@ -656,7 +662,7 @@ static void bar_write_dispatch(const struct pci_dev *pdev, unsigned int reg,
 {
     struct vpci_bar *bar = data;
 
-    if ( is_hardware_domain(current->domain) )
+    if ( is_hardware_domain_DomD(current->domain) )
         bar_write_hwdom(pdev, reg, val, data);
     else
     {
-- 
2.17.1


