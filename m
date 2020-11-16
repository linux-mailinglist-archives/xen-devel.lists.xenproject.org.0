Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DD2B439A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 13:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27871.56450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kedYb-0001O8-Qq; Mon, 16 Nov 2020 12:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27871.56450; Mon, 16 Nov 2020 12:24:29 +0000
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
	id 1kedYb-0001Nj-NP; Mon, 16 Nov 2020 12:24:29 +0000
Received: by outflank-mailman (input) for mailman id 27871;
 Mon, 16 Nov 2020 12:24:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VFxT=EW=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kedYb-0001Nd-7U
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:24:29 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57e0c7ed-5be5-49e0-8a38-19966425d512;
 Mon, 16 Nov 2020 12:24:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p8so18490266wrx.5
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 04:24:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t5sm19671024wmg.19.2020.11.16.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DD991FF90;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VFxT=EW=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kedYb-0001Nd-7U
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:24:29 +0000
X-Inumbo-ID: 57e0c7ed-5be5-49e0-8a38-19966425d512
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 57e0c7ed-5be5-49e0-8a38-19966425d512;
	Mon, 16 Nov 2020 12:24:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p8so18490266wrx.5
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=25kCBizsj7x/H9MBq/7Zh8HdKyedfrYbs0Sj7nFGxRg=;
        b=d5pz22vLeXK1wHTPtF+ZsxVIjXGA8gl6Tp/KPuXBtayrc3ZztGUFqO9NqNNtYCD6S9
         GIqQTWfi7rk11d3aNpYM5Sovu1nZQUg4k78J8N0ovb1RP8rhqjz2ziat2y93gTIR19az
         oIzdPJAEHeOZ+1ho5ixYDxsdnnSTsvLBGvo0C1S/ZpaCfzu60H/ZhbVXIE/Fz6X2rnuz
         bGp+15bJpLSMupv0X7HDh/jbzWyiTXsvLQDjR/xUxuiuAC0BgRnrEMAv7S86N9y/PO/J
         YZ30NYDyOCbsIzdK53/YmkNgrvXL1/EPIj5xyUtm8/JL1r8SstFTI9HT3CYaUmH7ZgB5
         9gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=25kCBizsj7x/H9MBq/7Zh8HdKyedfrYbs0Sj7nFGxRg=;
        b=hjM8EAHhvikVpXKRBjxijdWu/BQ9fy+Mktfq2nlQlLlSVQiw0xVGzjokS9ysqJ2pUQ
         JWSQfGLcqV/I3TOR+2FFvASkzdkTQTQC27Tkib4lEIIzNfH1qjzssiRey/4a563sQpEr
         EbDpOLDt3E4c3Nraph1lPlq64f269pWgXReI8WkuFdW/YXbq7SQMts08QiRtfg/ONJ3m
         RpdRkCGlEb8kwzMnaZYrm/CLUfky3qco/J46vxtp2wilrUlis0Klm+J2SRW9pXErr4Sq
         axPQiN6yfs7zakhgmVPimV6G+JebnClq2ut+eUo1su8LpOcfd6YhwXGfQyTNzFoT2/4x
         pP5Q==
X-Gm-Message-State: AOAM530pZISXlPBI3HBaY+G4prUzaV+ykNvn6Pk8zWd0udiNSe3KGGTr
	CBBaRanLIkyMPq636SQWoK71QQ==
X-Google-Smtp-Source: ABdhPJwEtjSnLzfG0Ucc13bL7SYSntZMRHeMdUmK/XWx+GdI3vGIWCG0T5avbmxz2LXh+UgnrJ3RnQ==
X-Received: by 2002:adf:d84b:: with SMTP id k11mr18703530wrl.305.1605529467569;
        Mon, 16 Nov 2020 04:24:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t5sm19671024wmg.19.2020.11.16.04.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 04:24:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2DD991FF90;
	Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PULL 4/9] include/hw/xen.h: drop superfluous struct
Date: Mon, 16 Nov 2020 12:24:12 +0000
Message-Id: <20201116122417.28346-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chardev is already a typedef'ed struct.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110192316.26397-5-alex.bennee@linaro.org>

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


