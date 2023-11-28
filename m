Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3A7FB22B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 07:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642742.1002410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7rxh-0006OR-1k; Tue, 28 Nov 2023 06:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642742.1002410; Tue, 28 Nov 2023 06:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7rxg-0006Mm-UR; Tue, 28 Nov 2023 06:52:48 +0000
Received: by outflank-mailman (input) for mailman id 642742;
 Tue, 28 Nov 2023 06:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g76+=HJ=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1r7rxf-0006Mg-2h
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 06:52:47 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc4de7a7-8dba-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 07:52:46 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3330d64958aso228519f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 22:52:45 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f8-20020adff988000000b00332e75eae4asm12065652wrr.85.2023.11.27.22.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 22:52:44 -0800 (PST)
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
X-Inumbo-ID: bc4de7a7-8dba-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701154365; x=1701759165; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3sn2wORbFiaGyfRVS1oXmiOhLph+AqLJL4TzSBHvg4=;
        b=sGOETUYq5M3MbjbtRJ1Cpxd8rQBX0XHyF7/HIYkrh8PnNyZWgNGuKBVldU8rKFfYHR
         SpdVmqEG6kJrJ07xTK/+ADmKSl7jgtCQYek5/aj9RJdn+hskIornBMCrR67QPZpbckrI
         9hL28alf/wqImqob/bQu22DhkEPF7Y7zok4k6d63Ko/YzzdDc2cbWfzZ6ul5+LmD3ZqN
         1TrLhN7q4TyWuvYi4PkGaTS3PKxWr/rx2mje+yoaju66tuYp3NZ5fWyUUcgUSWWA0I3x
         nTtQqYYMCnzLEAoWPe/FEckwvetTiDYdJSXZfhkgLDt3UBErgD/J5y5w7HTFhtl+NDBW
         IMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701154365; x=1701759165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3sn2wORbFiaGyfRVS1oXmiOhLph+AqLJL4TzSBHvg4=;
        b=IiZGoHGWl4blJSMtYPShdZ+kMAaahMS+/C7G0uuvqiO+yZfK2rHpf1B52HhWh0Ow/O
         e6M+bQgeybHo9QHQnrSnSVa6kWZq78lgNnSa91pUKscgxycqrj+2Q+k3821D2petzIBd
         dLZ5LH+z85WJwFiN8zM7O6X77axjXzGU77fqC5FW2wMYHo2ZzSbmYb+h4VZR6LxuzwgA
         hbv6D8jQPd9h7HBIXxS5bbji78m8Yo493KYay8oLKIVOiB4IpC84WK/T3zBa8jd1EQ6l
         zmjySTTWXdGbb6KzFJiGOg8iU3g4HTPiBgWMZ/36Mj84pNca7jOwkUs7fr8pysmEMfhF
         3GSA==
X-Gm-Message-State: AOJu0YzIOqJctpPp/dUsB86EtUnH0lpMIvmCti+rbn7WpWAYWfFPbcb6
	7XMTdJKhDlAfsoFFqXH3WVhEsQ==
X-Google-Smtp-Source: AGHT+IGEUaFU4MSfpauTFFCq+x4ajOfRtDJqm1oTNru0X5DPLaYXn9F6bGF0vfjzYdULiiFEc3puDg==
X-Received: by 2002:adf:fd48:0:b0:332:e9f7:9a99 with SMTP id h8-20020adffd48000000b00332e9f79a99mr9121683wrs.43.1701154365307;
        Mon, 27 Nov 2023 22:52:45 -0800 (PST)
Date: Tue, 28 Nov 2023 09:52:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rahul Singh <rahul.singh@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] xen/events: fix error code in xen_bind_pirq_msi_to_irq()
Message-ID: <3b9ab040-a92e-4e35-b687-3a95890a9ace@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if xen_irq_init() fails.  currently the code returns an
uninitialized variable or zero.

Fixes: 5dd9ad32d775 ("xen/events: drop xen_allocate_irqs_dynamic()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Part of v1 was bogus.  Delete that bit.

 drivers/xen/events/events_base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index f5edb9e27e3c..b8cfea7812d6 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1110,8 +1110,10 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 
 	for (i = 0; i < nvec; i++) {
 		info = xen_irq_init(irq + i);
-		if (!info)
+		if (!info) {
+			ret = -ENOMEM;
 			goto error_irq;
+		}
 
 		irq_set_chip_and_handler_name(irq + i, &xen_pirq_chip, handle_edge_irq, name);
 
-- 
2.42.0


