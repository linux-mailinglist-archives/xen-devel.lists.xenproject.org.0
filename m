Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB3877389
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690970.1076677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2HW-00012g-HY; Sat, 09 Mar 2024 19:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690970.1076677; Sat, 09 Mar 2024 19:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2HW-00010b-Em; Sat, 09 Mar 2024 19:22:54 +0000
Received: by outflank-mailman (input) for mailman id 690970;
 Sat, 09 Mar 2024 19:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2HU-0000Lp-QP
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:22:52 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb07afb-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:22:51 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5683576ea18so1629602a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:22:51 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056402359200b005648d0eebdbsm1141497edc.96.2024.03.09.11.22.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:50 -0800 (PST)
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
X-Inumbo-ID: 6bb07afb-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012171; x=1710616971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFjMT6zDVz6FC8tPUCQ4kyyMrqKZ8chKsrslRHOyQyw=;
        b=hqWP6DRWgkzN45MOE2UT7rnZNTDaIdFeIGsBI7g0SFhcDByj9VNMn4tkv4RkII1SMW
         3et43EGjnaA6tmM/e49eWaloOqs0OeRtSmK7+27UnNt+1+vmhsyVezXIBVBSUePwhDnn
         YljL/icdZ9C6eIM2fRZWl9vWbP7F8bva/HIM/qnIFizRllMbpTE+/0Ez8ge/pQkRxM6V
         LIvd69B9wZaPNnCBlQyFv0FELtqvtzvrbRN/B3jHjqM6tSM5ci9A4+7Y+jJpwHmt9sxv
         SesTlMfqleuwZDPUXf1qIHRV/39FHXMAlqDI6wvu0Vntz2+SJGh4/f+ERpI2A7r89NwB
         9YRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012171; x=1710616971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFjMT6zDVz6FC8tPUCQ4kyyMrqKZ8chKsrslRHOyQyw=;
        b=ah1+w6EQNqYaIt4ubwFX5YbS0FOAXpCYkuCY1YuoeDv8DDYT0EnYeziSEHOCIez9lc
         5eEANgEvD/gQgRqBktDfwfq5/RVih/KAeg6SNZNqQMcEb2RnZniSfZmySWAzYUyawcAq
         LwrPcXbXktZ9CIrT3PDdSHLahjTPO5IrD03OtjtAv25bSPdeLi5DnJoCsTr01tH0uiAM
         mPNFniOVVWWxh5RQnbmXzGa5TAtljJMej4icu+W6rsHW6v46900LNTEgwSbkgUJYieHd
         iDOSXJ2syHdJ/jFh1RNXk0RNqCtGxs8GOFbAGCpNBUqDmpyoKhXoy0PRfNQ+x/Obh4IW
         pPOw==
X-Forwarded-Encrypted: i=1; AJvYcCVQCkqfxWCRSkkgpRcKFSYWX+cQS0YKgnFEVjCPXuhMkgw2/ngsIiY+GpX6d4DHuLa6kfeO9SWRCbXl+ge8Us8X0dmQ2sf3SuSFPBiFvmM=
X-Gm-Message-State: AOJu0Yz/B2TMgwHavTWwAnetKgB7Z2QIN+xWC8QgYIo/HZMHK+1YPtJo
	9QRxoIfdqTQ8KfwqT+PfU+ZUUHTO/z/+aCyJ5S6GmWZ3Qwlf4ZEDNtTyWr5TMc4=
X-Google-Smtp-Source: AGHT+IEOGwIBYdP/mzwuHWgPMjU0SlF6nHZcYJJa0Wt9irOScU0CVSd5Ssk82Pi/m/B9Cv/46kpyew==
X-Received: by 2002:a50:934a:0:b0:568:1882:651f with SMTP id n10-20020a50934a000000b005681882651fmr1774495eda.25.1710012170814;
        Sat, 09 Mar 2024 11:22:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 06/43] hw/xen: Remove unnecessary xen_hvm_inject_msi() stub
Date: Sat,  9 Mar 2024 20:21:33 +0100
Message-ID: <20240309192213.23420-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 04b0de0ee8 ("xen: factor out common functions")
xen_hvm_inject_msi() stub is not required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-8-philmd@linaro.org>
---
 stubs/xen-hw-stub.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 7d7ffe83a9..6cf0e9a4c1 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -24,10 +24,6 @@ int xen_set_pci_link_route(uint8_t link, uint8_t irq)
     return -1;
 }
 
-void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
-{
-}
-
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     return 0;
-- 
2.41.0


