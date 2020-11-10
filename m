Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCD2ADF33
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 20:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23886.50856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcZEn-0007GZ-CU; Tue, 10 Nov 2020 19:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23886.50856; Tue, 10 Nov 2020 19:23:29 +0000
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
	id 1kcZEn-0007GA-8t; Tue, 10 Nov 2020 19:23:29 +0000
Received: by outflank-mailman (input) for mailman id 23886;
 Tue, 10 Nov 2020 19:23:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdNS=EQ=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kcZEm-0007Fc-6C
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:23:28 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c8ec26c-d7cf-4a93-beb5-ec25070f65b1;
 Tue, 10 Nov 2020 19:23:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b8so13989111wrn.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 11:23:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c62sm3929964wme.22.2020.11.10.11.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A08201FF90;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bdNS=EQ=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kcZEm-0007Fc-6C
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 19:23:28 +0000
X-Inumbo-ID: 5c8ec26c-d7cf-4a93-beb5-ec25070f65b1
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c8ec26c-d7cf-4a93-beb5-ec25070f65b1;
	Tue, 10 Nov 2020 19:23:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b8so13989111wrn.0
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 11:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gBkEgjV7awvtEg/RUlUyLYVtc42f18uJSH1j4TZVeBA=;
        b=eiSuFCpkFUCvuaKxPzO1vnOi1gud/W7G7GTv6WfIN6CALMklhYzvmAaHZGhY9HIZf5
         WqKRHudZ8IL+U8FIve9wdULV/KdmA1+R64lV9664NK5ozYDA3vYtGs8eBmpJm0u6D1Zr
         E841WUtTp0iCQNT0qvBF+bVffGVzntKBWuWdM05af4wouBq0nvSPL7rR76rYmsVQU8Rk
         KqrZGfdDQcegSk4rz/jnXjh+dcwIYVznj0IKuKwYwDgLN1dhNVZTiTCKFNeFnByFGfec
         ESHxG7w8B1UAdhKgGRN56Dh4C61M3dcDUFBuWsiDvOK6+AeCdnlxAVOwaBuPrGl99mvW
         SxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gBkEgjV7awvtEg/RUlUyLYVtc42f18uJSH1j4TZVeBA=;
        b=qh4CveKIHfrHJfCXBQWeg+HmDsKHnxdBXBb4kw66P5WwJd1zvRtEC8cYHLXfjFDbW9
         U2G50ixLjlx6QSDCDgWX6OJf4pBo5DDtYsUgqneUqkCgsF71Yk9H9IHpSo23U4Goyi++
         Cvohh+QCdTCRk0jOvWL72ijLT7L0hOo7Ud+EsWD/18efCNfa6dM+aweMezB1C/QexTt1
         vulWyqFMBt2AyBGxDk56IaR3as81gEn9dgaPFkC3oFLfyrvjlsWusSLOMu0m5mYymJw0
         rKo7c4Y99ayv05hd2oFUcb3W9tD3qpBXy0B6ae2LqVTrSO/wQXjQJOD0ZgTcRSKxtG29
         JKUg==
X-Gm-Message-State: AOAM5339mDZ3a3lnIe7s7CdP5IlJzJLDjKdE04+DMO76l8BT6oDD2jr8
	ch5+mFxFX0C2eJy/FGAskSYJRw==
X-Google-Smtp-Source: ABdhPJxa3cy975GPrMS66E+XZOpqdG7rl0e9DLYbMS13M4jWqT5KLVU3E0q/DBVsCPGl9Li+10Sakw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr24752225wrs.377.1605036206523;
        Tue, 10 Nov 2020 11:23:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c62sm3929964wme.22.2020.11.10.11.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:23:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A08201FF90;
	Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH  v1 04/10] include/hw/xen.h: drop superfluous struct
Date: Tue, 10 Nov 2020 19:23:10 +0000
Message-Id: <20201110192316.26397-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chardev is already a typedef'ed struct.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201105175153.30489-12-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/xen/xen.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 1406648ca5..0f9962b1c1 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -28,7 +28,7 @@ int xen_is_pirq_msi(uint32_t msi_data);
 
 qemu_irq *xen_interrupt_controller_init(void);
 
-void xenstore_store_pv_console_info(int i, struct Chardev *chr);
+void xenstore_store_pv_console_info(int i, Chardev *chr);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
-- 
2.20.1


