Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C9B7EB4D7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632934.987444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wK9-0002ka-SU; Tue, 14 Nov 2023 16:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632934.987444; Tue, 14 Nov 2023 16:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wK9-0002il-PF; Tue, 14 Nov 2023 16:31:37 +0000
Received: by outflank-mailman (input) for mailman id 632934;
 Tue, 14 Nov 2023 16:31:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wK7-0002h9-Q8
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:31:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46155b1f-830b-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 17:31:34 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so855639266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:31:34 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 dt10-20020a170906b78a00b009a5f1d15644sm5694182ejb.119.2023.11.14.08.31.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:31:33 -0800 (PST)
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
X-Inumbo-ID: 46155b1f-830b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979493; x=1700584293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6R5SODDqvfe3Gp9I1X7nXyO5kwGwphXiKxDLZtl7/E=;
        b=wva71bQqkzgC4iTeUR4DPuogn0twh9Lq8kki33rYFo5rOfZerJnotHI3O8Wu9nMh7R
         VeeEnl+s+zGmJrrsVZLZsLaxfhUBX6WJ3sLGiesQ5u1CF4KWMavfLWek1cWcvlyK2xzm
         7bJRpkWh7116PwykZqPjsu2Gq1e8UCjyC8QsOTxYTTKiYeOMqQtiOVSFEYMtfeJ1//rL
         Wlt1a8FsOuc7KgKQ7W5iuqGRBy42SW/WImV9f9ZHk3VmabS/Dn55bFqsvh6LWFEAsydO
         4Ndeh0cy6sVraRxN9zZ4dXXl73dKhDu7KoP7tjKws3F+0rNnWvi5mkBKSk4CYIJmxych
         nR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979493; x=1700584293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6R5SODDqvfe3Gp9I1X7nXyO5kwGwphXiKxDLZtl7/E=;
        b=lgDUgMxIKFE1rta4B5mMXG1Y0Aa3Gs7WwgidnuX3oxKEGICwFixmK4KKVD69tGAzDU
         3aLHovLvtb3QyNTzQ1TYpG5Y5TlxHsLWw7mRAGgljpQP2Optkmg4wurNuzON05Li4x4m
         bt3i8OZZfgAnlFzkmceGCSDBsPw0YY0QgU75rXnpy/vgdM8GNzqXtwlBgiBpk5updPnT
         ofh6JH+Ac8AF0ksIxE8hHiBpyVaA/SJxd4b92yi8+VTasFBFmDr623z8Ky20a0+Z2pZX
         /2Wussyf3UTkTTFePueBEUdAtb1IadP8kRVAMAy3szdkx5xoMRkUHY+KxaYadOJwEMgr
         wHCg==
X-Gm-Message-State: AOJu0YwIKmwuYBk/O/l5tgi4RbEJax8GuDzHWm3iKYDukBySoA4ZaJbD
	I4H/RkDB8NeFsNozrrS4VNPpOQ==
X-Google-Smtp-Source: AGHT+IGutQxHrTQ0PDT/rm4Hi1BwUJSaiBc/cWKJ03y/patFhv44C9aSztIA1kKfAa9MrKB6HwgJAQ==
X-Received: by 2002:a17:907:1c9b:b0:9e7:c9e3:d63d with SMTP id nb27-20020a1709071c9b00b009e7c9e3d63dmr8902204ejc.7.1699979493603;
        Tue, 14 Nov 2023 08:31:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 1/9] hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
Date: Tue, 14 Nov 2023 17:31:15 +0100
Message-ID: <20231114163123.74888-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use TARGET_PAGE_SIZE to calculate TARGET_PAGE_ALIGN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f1c30d1384..8aa6a1ec3b 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -678,7 +678,7 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
     trace_xen_client_set_memory(start_addr, size, log_dirty);
 
     start_addr &= TARGET_PAGE_MASK;
-    size = TARGET_PAGE_ALIGN(size);
+    size = ROUND_UP(size, TARGET_PAGE_SIZE);
 
     if (add) {
         if (!memory_region_is_rom(section->mr)) {
-- 
2.41.0


