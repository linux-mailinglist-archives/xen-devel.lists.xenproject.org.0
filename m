Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9A87738B
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690977.1076738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2I6-0003mu-87; Sat, 09 Mar 2024 19:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690977.1076738; Sat, 09 Mar 2024 19:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2I6-0003ik-3P; Sat, 09 Mar 2024 19:23:30 +0000
Received: by outflank-mailman (input) for mailman id 690977;
 Sat, 09 Mar 2024 19:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2I4-0001PG-PI
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81d4d069-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:23:28 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-568107a9ff2so3517022a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:28 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a50fb12000000b0056486eaa669sm1182154edq.50.2024.03.09.11.23.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:27 -0800 (PST)
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
X-Inumbo-ID: 81d4d069-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012208; x=1710617008; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLHD9GT6b5p3TJG9MYP2E7Mrw1kvuaLUPhHVHq70H4k=;
        b=In1Lyq191c8Z+vXQDtP8fdftoqvjPNGRcCJIjkBSmIh1karawBCO1YaYH3cO0bE2B2
         feHKgRTJbt+d4bVBgUuav2ejns+R6kxEQKr8M3nSDK+M9Msi+WOsuaD8DUSVsxfJk1rT
         8Crv/o0qWQ+3mqSPESCA47rAgypJD/kBjYtXoo41WLgpFl5oGb2BfA52ITJtX3ZqQ2Vp
         DU3AE3em/wcWjeWMiJTYaPxPphngQx7GrIyIEh2jAYtnna0Ntu+hr3pnien1oxbt7+JR
         fxvvXZx2he4b6i39A7e7d6AXHpEfCMI+IFxqoDLKZGbIau11GlMJG4DS4t3pqD5B1q6M
         aSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012208; x=1710617008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLHD9GT6b5p3TJG9MYP2E7Mrw1kvuaLUPhHVHq70H4k=;
        b=dPZ/RQTORjiLbWVLGSHdMKcWDmW1fsyCfz/5ipyytK8NCq2/+bbE0ZTpyPOyJHI9ix
         giSVHL0sAZMsXC1680GtlEKLS1fZL9i1WgQxKzmYT5EIBNheaJV/wxkGcAWumZIgSldg
         wVfwPDeCM41iQyNy5Jt0ziRo65T2X0TKPugPcKo/RjtPj41mPhMEV93AUJPXmtwZCnj1
         /1un8FkbEZZvqAU41lEr2uJfdzXHowZHjxl7w/zAiCd9/PIb52eYe4E6PV0IYJodIHzV
         j7soScsEFk7HRabqHoNPMEUGmgV0fpMOnykOrBlB1m+rp+1gWdlloHaperxDQBNGhbxz
         L02g==
X-Forwarded-Encrypted: i=1; AJvYcCWnJuU7vp6dmb1VXGpKyQBYKvdww2Fdq3pGSYpm0XjfZ+grgy/PSMHDn8lXpRz1dnUWNC9oLvQNxQZdJJtWVrDS3+BG8ThgssDFuOHBGR4=
X-Gm-Message-State: AOJu0YyGZdbqyd22DAcUBi3mosD5tkjOfMiKS9AfdOE3+w8GRY8tQILe
	CbyYNF5J6SPwZ9vn/iWPRU/vP91XCbdl1OZ6A/7GllpTNrIS6eM//4tjeDZFgn8=
X-Google-Smtp-Source: AGHT+IElag8KDyPQHd/yd7cCq1cSr3wdf4BCFyMPlhbecbflegKHRhCxKpfa2+2S5Xx9q4YSEt6pXw==
X-Received: by 2002:a50:9fc9:0:b0:568:1b94:fb88 with SMTP id c67-20020a509fc9000000b005681b94fb88mr1660926edf.23.1710012208009;
        Sat, 09 Mar 2024 11:23:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 12/43] hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
Date: Sat,  9 Mar 2024 20:21:39 +0100
Message-ID: <20240309192213.23420-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use TARGET_PAGE_SIZE to calculate TARGET_PAGE_ALIGN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Message-Id: <20231114163123.74888-2-philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 1ae943370b..8235782ef7 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -678,7 +678,7 @@ void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
     trace_xen_client_set_memory(start_addr, size, log_dirty);
 
     start_addr &= TARGET_PAGE_MASK;
-    size = TARGET_PAGE_ALIGN(size);
+    size = ROUND_UP(size, TARGET_PAGE_SIZE);
 
     if (add) {
         if (!memory_region_is_rom(section->mr)) {
-- 
2.41.0


