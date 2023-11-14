Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8987EB27C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632630.986932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZI-0006vC-NC; Tue, 14 Nov 2023 14:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632630.986932; Tue, 14 Nov 2023 14:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZI-0006sg-J5; Tue, 14 Nov 2023 14:39:08 +0000
Received: by outflank-mailman (input) for mailman id 632630;
 Tue, 14 Nov 2023 14:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uZH-0003vI-Tx
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:39:07 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90c855e0-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:39:07 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9be02fcf268so853298966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:39:07 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 m13-20020a170906234d00b00997e00e78e6sm5591697eja.112.2023.11.14.06.39.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:39:06 -0800 (PST)
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
X-Inumbo-ID: 90c855e0-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972747; x=1700577547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo2mmHUNt8cswMDm2G2tk7NYG50Leech1RMDbe0XTgw=;
        b=Td4zfwmkadSPU7BSZTFwxsCCl7P0/YW8ohw9JWZuMq4t7an6bV8TMFuKu97GS3GAEj
         A0xpc0IkkUkdQCrAta9Ataq5aB+EKlN34S+M5gFzGuuUiFa8Q0fOLExZ26qVh7cQ5OVZ
         eiXGtu8iXnAaPZp64vH1gy9w9IEytb7MOLcrCYfre6IOaIlcOU0cJM5egtfHukHe7DJB
         1zXW4IrR8QpgkKlUQuA+vsF7d2i4QP89sOFvm0PpTNOYB671d03vX+xZotuFeSE0Oy/J
         sIQrqX8oMJ/163e52mrgQRPeEm/FUcZrLfS6ddkv6zfdEdftRnEHwoFJciezLKVlMYp/
         MVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972747; x=1700577547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo2mmHUNt8cswMDm2G2tk7NYG50Leech1RMDbe0XTgw=;
        b=E4/xyKHl5lRfrsv0L1ZFbGG+7OPHgXlyktIl7/jIO2R/B/SgqT7ai3s2SXMSZlGu7+
         z+xHVI/1TdWzio075uq4h6rp0AtePmjlVMm5cA6GtMd8lOVz0hCpWRAC7DJh7damMhmC
         h9yYMAJdygoQyIN2kMjixw5/aBDsf/Eryq2UDKeVJ3+EK1nswUGH5u6ntC8rvwAZZPBu
         fYD0O8Zjo9GXoHR2KFfxnK3VY8u1DIxwsI9d6LpHWGQ9M7Uu6TZhoiwtSIKPMtGqgpEN
         nbqHHG7aToy1W6Bzncn2yQl2iiLaT2q7bAsAhs7x7T7OEX5VynTBW9s0xuoSKvIb3gWs
         DkTA==
X-Gm-Message-State: AOJu0YxNmOrTPSWGM1VAfCPxCs8df/+hDPEc3kyUOpz7JAgxfzEFd1qB
	UkX6suONe1+S7D82AFCURB3nfw56sl1EdFwg90o=
X-Google-Smtp-Source: AGHT+IFJHEre72B5jboKAaroDeSDmy2A+msHyepV3IUCtazYitevtMIyD1yfonucyI3qP3HjOGn0kg==
X-Received: by 2002:a17:906:45a:b0:9c7:56ee:b6e5 with SMTP id e26-20020a170906045a00b009c756eeb6e5mr6778901eja.40.1699972747032;
        Tue, 14 Nov 2023 06:39:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 07/19] hw/xen: Remove unnecessary xen_hvm_inject_msi() stub
Date: Tue, 14 Nov 2023 15:38:03 +0100
Message-ID: <20231114143816.71079-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 04b0de0ee8 ("xen: factor out common functions")
xen_hvm_inject_msi() stub is not required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


