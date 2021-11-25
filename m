Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBEE45D8B7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230892.399258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX9-0006Gj-Sm; Thu, 25 Nov 2021 11:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230892.399258; Thu, 25 Nov 2021 11:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX9-0005uS-4d; Thu, 25 Nov 2021 11:03:19 +0000
Received: by outflank-mailman (input) for mailman id 230892;
 Thu, 25 Nov 2021 11:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCX5-0001Km-12
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:15 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 488f0cd3-4ddf-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:03:13 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id l22so15334070lfg.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:13 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:12 -0800 (PST)
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
X-Inumbo-ID: 488f0cd3-4ddf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4HaiT/SE5PB8xSapqdBhw3R3QW3El4s7e5lKw8ZTREI=;
        b=bfnw8BzGMv/ai6lLmKkEDQIRsRtot4KIqLNG5xgb4M7L96xuEszQVAbb6jR453kFvb
         nNGmlVvyf3pR6Xav47zlgkrwQg2ZyVmdYoeGNl0PNkYBiGldZn3CRAevXvMBKJyhVCZo
         T90GjY0T2MiSabXU+jnCwN640V8uz5DjPme1+Op4TZvuglH9++DON0craD3VqeY5w9a8
         B+OGZ0BuuFIF21AfjeB/pxAbrr0LmXvU888Wa3Cwyd85kswt2+qWRSynb1snzGTI16L6
         KFVfDqKYHKgVtcwBf1nsKP15lCEmQOoexcbOVBbxR4+KlkS9kfqvFS0U02qHes7Cq9se
         mQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4HaiT/SE5PB8xSapqdBhw3R3QW3El4s7e5lKw8ZTREI=;
        b=EF2C7smyVYXsxhsrrYtNtxJZf3+a47SF9KdFa/Gueam25XpqHlLayhHNABqIWcnEsh
         e+qyt954YSmXkSnLWEfdBejEV3kjE0pnUIk2WCkQtUnGym2i/eI3YO0IIpfcVgAPG3JZ
         f7alvZUzY6VsISCwlvjfyHs/1QE+aFLB8DDMz+sdUY/iC4KX1Anl/yp+X6baneyxOE/v
         v3qX77vobhzb1e6dy6BK86d4xs4tv72lYqefMjQd96kmTPTqDj/5t+hr9Aih18nXiBeV
         8JOfyiOfwQrSHjF0z6JL4kp1+0CEM9A2iWag8CTLGENUIm0nIcG8f9zE5L0Px2dXwCv/
         GnDg==
X-Gm-Message-State: AOAM533VE9mfeXYxbJ6aWzbHaI+MItIS4E+/h2+9rQJge8mG2+HVPt3F
	ZkviSXw6lWqLAXlZml0r04AibfFlYYbQjA==
X-Google-Smtp-Source: ABdhPJxHJg03JdEEks4CztqRyth39Hkg5mIrysSqR/7r+OomeU2Fdzj0/2zlZtidUcwKwYWgE2T33Q==
X-Received: by 2002:ac2:58c3:: with SMTP id u3mr22100069lfo.103.1637838192718;
        Thu, 25 Nov 2021 03:03:12 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly handled
Date: Thu, 25 Nov 2021 13:02:51 +0200
Message-Id: <20211125110251.2877218-15-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

For unprivileged guests vpci_{read|write} need to be re-worked
to not passthrough accesses to the registers not explicitly handled
by the corresponding vPCI handlers: without fixing that passthrough
to guests is completely unsafe as Xen allows them full access to
the registers.

Xen needs to be sure that every register a guest accesses is not
going to cause the system to malfunction, so Xen needs to keep a
list of the registers it is safe for a guest to access.

For example, we should only expose the PCI capabilities that we know
are safe for a guest to use, i.e.: MSI and MSI-X initially.
The rest of the capabilities should be blocked from guest access,
unless we audit them and declare safe for a guest to access.

As a reference we might want to look at the approach currently used
by QEMU in order to do PCI passthrough. A very limited set of PCI
capabilities known to be safe for untrusted access are exposed to the
guest and registers need to be explicitly handled or else access is
rejected. Xen needs a fairly similar model in vPCI or else none of
this will be safe for unprivileged access.

Add the corresponding TODO comment to highlight there is a problem that
needs to be fixed.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v5
---
 xen/drivers/vpci/vpci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index bdc8c63f73fa..4fb77d08825a 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -493,6 +493,29 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     if ( !pdev->vpci )
     {
         spin_unlock(&pdev->vpci_lock);
+        /*
+         * TODO: for unprivileged guests vpci_{read|write} need to be re-worked
+         * to not passthrough accesses to the registers not explicitly handled
+         * by the corresponding vPCI handlers: without fixing that passthrough
+         * to guests is completely unsafe as Xen allows them full access to
+         * the registers.
+         *
+         * Xen needs to be sure that every register a guest accesses is not
+         * going to cause the system to malfunction, so Xen needs to keep a
+         * list of the registers it is safe for a guest to access.
+         *
+         * For example, we should only expose the PCI capabilities that we know
+         * are safe for a guest to use, i.e.: MSI and MSI-X initially.
+         * The rest of the capabilities should be blocked from guest access,
+         * unless we audit them and declare safe for a guest to access.
+         *
+         * As a reference we might want to look at the approach currently used
+         * by QEMU in order to do PCI passthrough. A very limited set of PCI
+         * capabilities known to be safe for untrusted access are exposed to the
+         * guest and registers need to be explicitly handled or else access is
+         * rejected. Xen needs a fairly similar model in vPCI or else none of
+         * this will be safe for unprivileged access.
+         */
         return vpci_read_hw(sbdf, reg, size);
     }
 
-- 
2.25.1


