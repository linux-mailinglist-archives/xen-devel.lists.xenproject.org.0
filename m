Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F4B216C3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077949.1438998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS1-0006zt-EY; Mon, 11 Aug 2025 20:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077949.1438998; Mon, 11 Aug 2025 20:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS1-0006xe-9n; Mon, 11 Aug 2025 20:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1077949;
 Mon, 11 Aug 2025 20:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZRz-00063z-Gn
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:48:59 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9976de08-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:48:56 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-615756b1e99so6565677a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:48:56 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:55 -0700 (PDT)
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
X-Inumbo-ID: 9976de08-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945336; x=1755550136; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwUl1czZ2m+Uelj6p4EfRluuF8y733PPdTpEjfbyiwk=;
        b=TchvzPdgOoqkdhKVvUH3VzjSmn/APp2a3PgqK8vBlUV8WPaGAAt2/CNXX3eqC5yVQT
         TWHezV1jD2Au4y+rtw8Ntb0fXIbCWMYGCnzXGVCxjL4bHxEa0X8pohQzhKzMyeZtSiUs
         7RL18jQOeJpfLZghAKHdi53hrQHEDMjg5fEhWfhy+MK5uvsHRcE1lgaVIzuaqgveLpre
         j7xeIF5s4S1dHd32rsefj9bzAR/VmldiMOzk7KZtTajoTYjXg2FDxDIO8ftvH1CKUtzO
         ZwVNxzJ7QVVt9IAf3w7OpCp4LMkmJDOU0DYg2oipg7BwZcSBkEaXVJ0RRORmrF0RD5dZ
         Tcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945336; x=1755550136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwUl1czZ2m+Uelj6p4EfRluuF8y733PPdTpEjfbyiwk=;
        b=smx45UGZjmmQGHegnYBN7CDPjL4D67Tm1e4hOQxxTbXTwOcv6ecPZdy6yknIikFv/v
         w5AM/fyOB2PMbx++Lc0sX+VpfxPzuIy+ig5LVdm74oagl60i7CleSGlppPxgIwGBz/Rr
         PYYGcjTHgYqyF8GRmlOWp0dgNJKIna2U8mF2/4H9ehi6dp+qZdxGch2UR3LUCHlLrzBZ
         +q7tEjdjJu3gg3KL4yi365jKubAYsLr0KNrdH4u0zrF2m6rfoFzGPDgOMhyFUNfqCWFD
         499QsNGV8QEZxeRoi/VLH67qPxkbHHNp7byNplfwOItLcWkc1/XPETkJRoayn3ELesuw
         8QMQ==
X-Gm-Message-State: AOJu0YzLPkbmRnLrJQ18h0FkZhIAwnliAZh//VNFsRhoGR1h7OpHT07w
	BNKb0niY3TavQsE/hhS+5nZJc7Muoy5wM/zgmEBpxrYqFxwiolTPWfsI9LW0/g==
X-Gm-Gg: ASbGncvjcTowBG92vD3LlO9u/w7K4XK2e7RnjmkbDkc8UhDtux9YjYIFLLW3keFFVwo
	td/Lz2om7ESb5mx20Y6FfDdRsxD5kWADCXo3sJMC1f1LQf1Xumuj0fU2uOJADtVQtjKHYTSgjpH
	iHiorIH/RBYw/CjLLBlE1HDYfQjiGRcRRetTXWcNW1Vy2g6HmD/L4n6JNgRr0ONNbhVwFJHSLha
	ATJNyMl6Lx++MlvEpGtLUHwkc8vtBA5pC20alE3KqPOxtKah6lHy8srm96tZfZWc7Q3MnAct4OF
	yVfWn0+Yc8/S1VX5fR6QrNCeCdhL88NssKfRAFxr6uPVLPjHanlPTH/eWVptF8QkMN1SRY/Oh9t
	YMMLhR6SRllUQe3/G72HhKQMd9ZMXTFNS3m/XFBuw9Kmj+cKnW5880L7bSLClYToZEDS6tv65jB
	/n8w==
X-Google-Smtp-Source: AGHT+IFO5hq4ySBJNwPMmfUKsL09AJOr0uCUIAwDZZTQIhw7zIqyOTdwwRDDjdCGC7eAi/wFj/9Hsg==
X-Received: by 2002:a17:907:c25:b0:ade:316e:bfc with SMTP id a640c23a62f3a-af9c6457eb7mr1272700166b.21.1754945335933;
        Mon, 11 Aug 2025 13:48:55 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 05/12] xen/arm: irq: avoid local IRQ descriptors reinit on system resume
Date: Mon, 11 Aug 2025 23:48:01 +0300
Message-ID: <7686bc019f0c0eff94720e4ca16e00f895819087.1754943874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

On ARM, during system resume, CPUs are brought online again. This normally
triggers init_local_irq_data, which reinitializes IRQ descriptors for
banked interrupts (SGIs and PPIs).

These descriptors are statically allocated per CPU and retain valid
state across suspend/resume cycles. Re-initializing them on resume is
unnecessary and may result in loss of interrupt configuration or
restored state.

This patch skips init_local_irq_data when system_state is set to
SYS_STATE_resume to preserve banked IRQ descs state during resume.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 4bbf0b0664..148f184f8b 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -122,6 +122,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
     switch ( action )
     {
     case CPU_UP_PREPARE:
+        /* Skip local IRQ cleanup on resume */
+        if ( system_state == SYS_STATE_resume )
+            break;
+
         rc = init_local_irq_data(cpu);
         if ( rc )
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
-- 
2.48.1


