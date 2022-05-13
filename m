Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0775B5268FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 20:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328678.551779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZjw-0006Hz-DJ; Fri, 13 May 2022 18:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328678.551779; Fri, 13 May 2022 18:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npZjw-0006FN-95; Fri, 13 May 2022 18:10:12 +0000
Received: by outflank-mailman (input) for mailman id 328678;
 Fri, 13 May 2022 18:10:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eu56=VV=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1npZju-0005kx-Ga
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 18:10:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecdeada5-d2e7-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 20:10:09 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id bv19so17737346ejb.6
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 11:10:09 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:09 -0700 (PDT)
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
X-Inumbo-ID: ecdeada5-d2e7-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hp6j9E0komHwkQmjVaaJwGXlUmBw15qUD+2uycCxKRo=;
        b=F6ECj1KowlkuN7ndNLG4RXVONt3ugmk+q9Hi/xtsP3eiZ8ZL0nuSrxMOKrM5piAaMn
         oZVcacYQpx5jhTeQ451SnkGgZgcC+2FArUYvOOba7IXnLkpiLCmSjrJfH4140JrGfdaA
         DDKaBGot+x4QfZLJkUdcSRyMZy0355YA3JjyVQvKWKDVe9Oc+c0902kRxqJK47A9Owbz
         Wo23wbWOu/V3dS/MJkCO1+CxAj1a90WzQguDmjmui18vahU9ZuOVJyd1wrOW8CmmC5TW
         z1SN7HYd8RGG1I4E7qL0Om7lIq4IW5FH2ooK04osvFfWLUC7kJYdyWSiUU5whYG7aJw1
         CYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hp6j9E0komHwkQmjVaaJwGXlUmBw15qUD+2uycCxKRo=;
        b=lWmjbLbtcbbxGsdl9GhC27MTosBekpPrlKM2Wsujhej/Dw2vWgz1EziYR7t8zMwKNN
         mG9VRupgkFl64VdqHYk4ma9PDmG6SmCntzAXOvQwU/UTHT5DoATPvcj50Vllft7zBDyp
         Jn7y3ifVZFpxN3YmbX9eyYxRTzHgVqN5mpT9vWS1X+6B0KwZEKZcXlA01atNO4+TCNbZ
         QX/tlIQm0uPxQKQWmEowHRCtTUtqA1VPJh7DzLxClQMrHXj5unjHzNz0EQrulw38Cv87
         d4DF84Fw5s1pADpC6cdElFvrwwZAz7DPebbXJyx3kAr5TT/cdJd8YYJfahglH6XmLkPJ
         /s0g==
X-Gm-Message-State: AOAM530JZ5pE9FyDPKd0PHQ9Dnx6V6VsQiTGhp5+avfKk7VoSok5EziA
	bCfdukTidbKnFsy/K2jPDzc=
X-Google-Smtp-Source: ABdhPJwgEkBcZJqTIki5Kg8REFF/cfX7eSZw1juY5Lx09Lc2VuiwHYjI+5INyzSwkKmlGUFfLJt8Rw==
X-Received: by 2002:a17:906:4fd5:b0:6f8:5784:fddb with SMTP id i21-20020a1709064fd500b006f85784fddbmr5572529ejw.161.1652465409259;
        Fri, 13 May 2022 11:10:09 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH v2 2/3] hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
Date: Fri, 13 May 2022 20:09:56 +0200
Message-Id: <20220513180957.90514-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment is based on commit message
ae4d2eb273b167dad748ea4249720319240b1ac2 'xen-platform: add missing disk
unplug option'. Since it seems to describe design decisions and
limitations that still apply it seems worth having.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2345fe9e1d..bc1b37512a 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -173,6 +173,17 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+/*
+ * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
+ * request unplug of 'aux' disks (which is stated to mean all IDE disks,
+ * except the primary master).
+ *
+ * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
+ *       is simultaneously requested is not clear. The implementation assumes
+ *       that an 'all' request overrides an 'aux' request.
+ *
+ * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
+ */
 int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
 {
     PCIIDEState *pci_ide;
-- 
2.36.1


