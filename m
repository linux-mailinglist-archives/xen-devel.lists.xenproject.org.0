Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E932B439B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 13:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27872.56462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kedYh-0001Qt-8B; Mon, 16 Nov 2020 12:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27872.56462; Mon, 16 Nov 2020 12:24:35 +0000
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
	id 1kedYh-0001QA-4O; Mon, 16 Nov 2020 12:24:35 +0000
Received: by outflank-mailman (input) for mailman id 27872;
 Mon, 16 Nov 2020 12:24:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VFxT=EW=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kedYg-0001Nd-6Q
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:24:34 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6996d5b0-907b-4f02-84a4-68e287af2eeb;
 Mon, 16 Nov 2020 12:24:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s8so18457502wrw.10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 04:24:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w15sm23012424wrp.52.2020.11.16.04.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4553E1FF91;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VFxT=EW=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kedYg-0001Nd-6Q
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:24:34 +0000
X-Inumbo-ID: 6996d5b0-907b-4f02-84a4-68e287af2eeb
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6996d5b0-907b-4f02-84a4-68e287af2eeb;
	Mon, 16 Nov 2020 12:24:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s8so18457502wrw.10
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I5N/dAQ0srBictVseT2rP2fA4AanR0t+DIq+DoGQDUA=;
        b=kUv5YnOumF/Ptfw2eqBb3oW9vbtrXH2sp4GACYHhA96xfqkjYNrDu1E4hPFaiMhABN
         5r6Bp5+qFL+41JkZts4NLOMDU+BOZ7f+B3OxTSrsN4NMQ1sCmvnPaCAgK7AUxbRQBHMz
         2eie64PA2/H4D4HRatmXT07ZJAMsiUF2S2iEBlis90fJOUM3ifH+NgoBJ7NHRUe5GSxJ
         51rArOQXs0dhUX8EN7kitzVSfDEdlKri/ftf2l6VWkJuIkLMNx4oHB7NGAIgPePTFDsa
         KOcaFHJBgMjEndAwhqkKbtIf/jfW3DQ88lvtkMKy0vdV8Oahf+jklSClwHom/imIJJtL
         QtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I5N/dAQ0srBictVseT2rP2fA4AanR0t+DIq+DoGQDUA=;
        b=f2+qH64Qv46f34qMaTyttnwN3+MCBs8E2OfWuGrR1N1m+hTFqRfX7nXocvWvCLavby
         anhG9xcHhV9G/DkEyzVlutGdojLEiXYqsStlWNQxYwKI85goWZJfZvYbEOHjDjMAp4Hh
         rArCtTXBT8DPKa984O5s3xvyX79qWa3ZdRH7TaPg66DEHvDS9mEk2PJ8DDdF75OYdlzS
         3dR3ufQPAI0QF1wYI9nN7/CUiwJq7xWM3vSnvvNTt+oCF2VDEyinNDgPx0gA5gKWfh/3
         gt0iLBuzS+jQAsryql0iCf8L72yq+i+CtjGG3Mch0/RruFha6zqOZ5dsSCVuh5g8OBuJ
         KgoQ==
X-Gm-Message-State: AOAM530api3En5Oq9k53KMPoPcxqvXhklT0YZhLVTgVle8jQQdEqmGea
	R3o7dra3f4YWU7ZgWIi0jtLmzw==
X-Google-Smtp-Source: ABdhPJxEtcR4ZeY941H3WHkpWZMVMIuDrHc4wCNctDwDHmfdBIFTxqjPSisyc+pQG175SXdcSQDB4A==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr19836328wrn.277.1605529469173;
        Mon, 16 Nov 2020 04:24:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w15sm23012424wrp.52.2020.11.16.04.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 04:24:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4553E1FF91;
	Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PULL 5/9] stubs/xen-hw-stub: drop xenstore_store_pv_console_info stub
Date: Mon, 16 Nov 2020 12:24:13 +0000
Message-Id: <20201116122417.28346-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We should never build something that calls this without having it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110192316.26397-6-alex.bennee@linaro.org>

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 2ea8190921..15f3921a76 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -10,10 +10,6 @@
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-x86.h"
 
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-}
-
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return -1;
-- 
2.20.1


