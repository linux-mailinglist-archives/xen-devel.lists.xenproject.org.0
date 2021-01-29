Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE87308D93
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 20:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78450.142719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zh2-0005dV-QM; Fri, 29 Jan 2021 19:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78450.142719; Fri, 29 Jan 2021 19:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zh2-0005cm-LQ; Fri, 29 Jan 2021 19:44:32 +0000
Received: by outflank-mailman (input) for mailman id 78450;
 Fri, 29 Jan 2021 19:44:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fGyx=HA=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l5Zh1-0005cE-4B
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 19:44:31 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c62c3667-8c21-455b-9bed-2b65370580bb;
 Fri, 29 Jan 2021 19:44:30 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v15so10013848wrx.4
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 11:44:30 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v126sm11603122wma.22.2021.01.29.11.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:29 -0800 (PST)
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
X-Inumbo-ID: c62c3667-8c21-455b-9bed-2b65370580bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d1B6pvGk/tscGDXzqPDvBbdkbEz+7Rk/Sr0TvkmFW9w=;
        b=IlDRHRLthgIz2LSgZF44OyZgYRNHUPR50cA2NFmXs2bn7EDGr3NpCnXwNbaXdaCbY6
         RvXCZE73Z0RKOcanVypi5RWTlOdUcaT2wnSBbOt6StqEyD2THxt2+hPKNOyIcMv4RGlU
         hPFfi5+kzI+qMNpHxZZLCgogZoMSLXFBRbLeXfzmUWIrd7QQ0SSapCplEFtRXNZlaTs3
         QWny6IB9EHvedQj/e0ZYLpkAc2YA1cGW5F9Gxm1PNmNaheuGCWCZsZidvxyDhzoLPvyj
         akBlJJPf3RLQdrD1BGdgyGEDunb83hgBTo3NbSu0vzRlhzxblKEfkQeU2nIuOsPqPw+w
         yVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=d1B6pvGk/tscGDXzqPDvBbdkbEz+7Rk/Sr0TvkmFW9w=;
        b=iIP59Z6MRbP2FA83WCNOP8/AUJ0tc/7B7n0lcc7YCEvABlpSBKDVXt5P2wA/LcZFY5
         vlxO9rvDL+rOY3hT7uOU/kEoAgk/AD03OTe0KZB1ydkEYICoWYEqPH7F6SVx72FqhAav
         sA3ijeH8j/66h41Os2wMWKayQjepwTocmIQhKmlKSWl9FShnPOUvVDW3zcgOpPQ2OFFv
         m4fX3Kr7+TOECb9pNaNPmhs7Nph+dJLafUqDyLj8h4DdRrE87aMPBePnJ6vn3nb1nd7h
         ocr/R9Ij0hveDUDOGCkgAK/m6haA4T99zdywDxmWU2cHYUuuIChbKqnSuMayOBUUKsVN
         5csA==
X-Gm-Message-State: AOAM5302iKDc51C/V4UgGpEwBommaqtgYGXMabqtLh1Dg95tTsyRvkrd
	MqcDWzK46z6xdvbeVfHxMmI=
X-Google-Smtp-Source: ABdhPJzEYjckP0B97VTypoBS6r/O87F47Z9tKjRdyvjMDKeyrVqB+pvBLfr/6bFmd8GqNGxoU6eUXA==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr6296371wrw.150.1611949469707;
        Fri, 29 Jan 2021 11:44:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 2/4] hw/ide/Kconfig: IDE_PIIX requires IDE_ISA
Date: Fri, 29 Jan 2021 20:44:13 +0100
Message-Id: <20210129194415.3925153-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hw/ide/piix.c has a strong dependency on hw/isa/isa-bus.c:

  /usr/bin/ld: libcommon.fa.p/hw_ide_piix.c.o: in function `pci_piix_init_ports':
  /usr/bin/ld: hw/ide/piix.c:141: undefined reference to `isa_get_irq'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 41cdd9cbe03..0f5d316558b 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -17,6 +17,7 @@ config IDE_ISA
 
 config IDE_PIIX
     bool
+    select IDE_ISA
     select IDE_PCI
     select IDE_QDEV
 
-- 
2.26.2


