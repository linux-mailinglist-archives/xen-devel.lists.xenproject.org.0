Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD421D755
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 15:37:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juyd6-0008M8-RE; Mon, 13 Jul 2020 13:36:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ndB=AY=gmail.com=refactormyself@srs-us1.protection.inumbo.net>)
 id 1juyPr-0007TO-0o
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 13:22:43 +0000
X-Inumbo-ID: ebbe1f92-c50b-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebbe1f92-c50b-11ea-bb8b-bc764e2007e4;
 Mon, 13 Jul 2020 13:22:38 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id dp18so17116023ejc.8
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2020 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z4DbCQASJpB18XYS7ktJTNc93Wbe31Dke4XqE2e1oq0=;
 b=DOSHDGVmk30fZFiz3WKd7zMCSK69f3jEL1u8AsUJjxB2mBuvUr1qBHCx969bF8n9Q2
 KtbdMAJyAt3EFUnpKPSIMJbXHWkN6pnl/9Tnrb3Gl0n+kYXCTO2h5BNyruT2BHFjgl+g
 wH9iQCx1EI7m7ZrVqhRyZdNkYPv0uZXHNRXI4H3ZgM4nssEF6Z4+vhCyAINKoOna9COA
 2vQ/UXMl3YhqVXxT1k4grDXlx/GMqUZZFWedx8icvuVMGE/cnpL+73qZzJoFpLnQEXqM
 kKNEdCxwfmXyA7RuYT4PGHN4OQXUHW+RCFO60LXxoSfPzZmiOAwLoId6GJoDAnwMnMXf
 6VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z4DbCQASJpB18XYS7ktJTNc93Wbe31Dke4XqE2e1oq0=;
 b=rHJC60PW/osm74ZIXIb0RGp+mIAg54R/B5b5ZsXVSU7oOmEfsyeAdYD0HQGugH/fzH
 7xUtV9uPi2Y5VzFr5VSHkAzDpx7aUEiSFOIAiavWMoks+2ml2eO0rwlFIh+RrkGypghB
 l0Onkxod/3P8xrnZVDsFu/ObOMc7CpUpnYjRtuwxpBNZ10v4jyfHLyZsVjCs0XkfTUht
 +aIoaCEKOScWIgSAxAgMuGaNcc2/0pFoCNECYO4H9MnUzq+eyw++GdLKKHR5a8/NQ/Ln
 mQgpKOT0RTFnWUA+KyoSONg09Qc9hXmhYlNL/L3op1d6KetQlJTH7KA4VSRCLCtAr+lG
 2OJA==
X-Gm-Message-State: AOAM530bBvRk8NJeZ98VFI5a4zDy6n3uv4wh+jiUZT4vPHJb2wPcvfsW
 518eeN1+/uIIsQx0AxsWy9g=
X-Google-Smtp-Source: ABdhPJyNJ+2A+7vhlimkJ5sh3qnTf4AmYHcIfFpOxzTngMqwIMgJRuRgZYpxdl6ypR4zISe0e31EHw==
X-Received: by 2002:a17:906:4dd4:: with SMTP id
 f20mr77154689ejw.170.1594646557469; 
 Mon, 13 Jul 2020 06:22:37 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:37 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 01/35] xen-pciback: Change PCIBIOS_SUCCESSFUL to 0
Date: Mon, 13 Jul 2020 14:22:13 +0200
Message-Id: <20200713122247.10985-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
X-Mailman-Approved-At: Mon, 13 Jul 2020 13:36:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, bjorn@helgaas.com,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/xen/xen-pciback/conf_space.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/conf_space.c b/drivers/xen/xen-pciback/conf_space.c
index 059de92aea7d..0e7577f16f78 100644
--- a/drivers/xen/xen-pciback/conf_space.c
+++ b/drivers/xen/xen-pciback/conf_space.c
@@ -130,7 +130,7 @@ static inline u32 merge_value(u32 val, u32 new_val, u32 new_val_mask,
 static int xen_pcibios_err_to_errno(int err)
 {
 	switch (err) {
-	case PCIBIOS_SUCCESSFUL:
+	case 0:
 		return XEN_PCI_ERR_success;
 	case PCIBIOS_DEVICE_NOT_FOUND:
 		return XEN_PCI_ERR_dev_not_found;
-- 
2.18.2


