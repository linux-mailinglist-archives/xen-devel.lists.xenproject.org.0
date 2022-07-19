Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5557A59A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370806.602759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFj-0008IV-2d; Tue, 19 Jul 2022 17:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370806.602759; Tue, 19 Jul 2022 17:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFi-00089A-L2; Tue, 19 Jul 2022 17:43:22 +0000
Received: by outflank-mailman (input) for mailman id 370806;
 Tue, 19 Jul 2022 17:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFg-00065R-DZ
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:20 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46a6d59e-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:19 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id j22so28609572ejs.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:19 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:17 -0700 (PDT)
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
X-Inumbo-ID: 46a6d59e-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QdkNpMhNG/rH2hDrjEqNlnDvarGoZ2Hnwipc//T8xoA=;
        b=kCtcd6y9IjewbRIotgLC7v/cJIoXJ/MN4xbaTvTJxILlca8FQtjx948FxXUmHlH9Nz
         u7PCFpRxM0iUCn/e7JteV+V+nQVNBckd9beuv9H/J1pMA1MyWT1jLP9rliJuApMopxEt
         E3Bc/5rvdaKAIsFW9B3ucUUa+3PPeuChPaBvKj3LzlB+cMDTrf9vfoFIJzE1bd4yAWt3
         7BsZG9BYr5VjPQFcUblpnLgZE91KDhSkilg1V4smxIBkAgOp4gRWVzKJZM86l+J3vebi
         8ve5+kyCH7QB0JDzVJyCdhqepz1TuVEuVkTJjOTw9zlA4zPbwG0Rzt7Rgxct++30Bmd5
         3FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdkNpMhNG/rH2hDrjEqNlnDvarGoZ2Hnwipc//T8xoA=;
        b=vT3/jQIt44NR9n1nXzMupEyK0KVzhTuG5ytbiOxxyEfhjDI95GR4GRB+iYkp3ZkDXQ
         6rKPTcLVCniIGbJx8PJCf+Quhpzvn1G7W4LkODX35KvTBmoTiIbjUXm9nTDmjmd38LMj
         jSkLup7ZbSyPpnM1QQUblifIct2Z3WLU2PzVkVEER8UTPnckaiMZPGyBqkSrwIGApv75
         Rxcfg7/wUOnfaaRpmg4ldwRDqF5VdsFsH0DzXaCx81O8UnUqM5KVogd83grOPPyzobq/
         MU/W6u1u/tw/GOWJISg8dgkbgwCe4yC+2otcLkx1FvCpUT3jYpJrKawoa6ZqHssV6+Kc
         p7Xg==
X-Gm-Message-State: AJIora83D9rLmzAoRu33D4QxzEPjAJ3EKAAlOYu+JYZAclxRj/uhDLAc
	ODhI3mWbAPn+0OZX98yu5PQpiC6G+o0yCA==
X-Google-Smtp-Source: AGRyM1vWyMAQazg5NUObXpt91XDu9miFPFNRbJJ25XFfOGHsIqfJSP8H9L3QnEklIiBZJi3ckOePmw==
X-Received: by 2002:a17:907:94cb:b0:72f:1d8e:7305 with SMTP id dn11-20020a17090794cb00b0072f1d8e7305mr14904155ejc.625.1658252598420;
        Tue, 19 Jul 2022 10:43:18 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V7 08/11] vpci/header: reset the command register when adding devices
Date: Tue, 19 Jul 2022 20:42:50 +0300
Message-Id: <20220719174253.541965-9-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when assigning a PCI device to a guest:
according to the PCI spec the PCI_COMMAND register is typically all 0's
after reset, but this might not be true for the guest as it needs
to respect host's settings.
For that reason, do not write 0 to the PCI_COMMAND register directly,
but go through the corresponding emulation layer (cmd_write), which
will take care about the actual bits written.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- use cmd_write directly without introducing emulate_cmd_reg
- update commit message with more description on all 0's in PCI_COMMAND
Since v5:
- updated commit message
Since v1:
 - do not write 0 to the command register, but respect host settings.
---
 xen/drivers/vpci/header.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 2ce69a63a2..1be9775dda 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -701,6 +701,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
      */
     ASSERT(header->guest_cmd == 0);
 
+    /* Reset the command register for guests. */
+    if ( !is_hwdom )
+        cmd_write(pdev, PCI_COMMAND, 0, header);
+
     /* Setup a handler for the command register. */
     rc = vpci_add_register(pdev->vpci, cmd_read, cmd_write, PCI_COMMAND,
                            2, header);
-- 
2.25.1


