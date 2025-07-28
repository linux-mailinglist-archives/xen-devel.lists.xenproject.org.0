Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF942B14183
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 19:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061811.1427412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4v-00034r-57; Mon, 28 Jul 2025 17:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061811.1427412; Mon, 28 Jul 2025 17:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4v-000335-1U; Mon, 28 Jul 2025 17:56:01 +0000
Received: by outflank-mailman (input) for mailman id 1061811;
 Mon, 28 Jul 2025 17:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugS4t-0002bc-G5
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 17:55:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dc79a2c-6bdc-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 19:55:58 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45617887276so27601235e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 10:55:58 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705bcb96sm169306385e9.21.2025.07.28.10.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 10:55:57 -0700 (PDT)
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
X-Inumbo-ID: 1dc79a2c-6bdc-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753725358; x=1754330158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gz1TvXq1kq8bB0MflQ77AJAntpl897s6sr2Ax3LETXE=;
        b=v/nwv42VEMpv79tavDT1c5tv4mSShs+YgNsiUlGXzGZ9jr9ZnYLcE/hiNxuJMu0+py
         5r2TlqpdQcBsJKukqmh86pTDEUleBDU5WN0tj34tHm+DJO0ZdDUECkoNsgacH0ay0OV4
         omWbhIFDOhadQprm0wj0q/6vv8iffI7b8SJ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725358; x=1754330158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz1TvXq1kq8bB0MflQ77AJAntpl897s6sr2Ax3LETXE=;
        b=JUPSOyqjvpxXb5VvMWXZHkPwWHXQsrpkBpBBobHb0c3lrRydmCNt4esk1XRbySIC9J
         EELKd9wbMZ3Gno8MRHHS0FvLS6O3AobRNbWfX8RUoD8GJK8vvdL0LJgeS4rNTxhF0aZV
         /0M5g2c1sbKp9A117MY5UtkRCg8p5u25qTpkfuPTuZbWXBsEDgXJ3/yxdH7Ob0enff//
         YdjTC/IGGPoIVqt4UG4woerZhvGJxqNgA//iiI4dt/Dn6ybcZ+owdGmN/xiATPedmLay
         YGGXXz6lx6iJYsK/J9sDbZzIqjLTKuQXDtkMO770ZKdMILEKhtQ4rJ2dNNLx/GaHiv+Y
         h/Rw==
X-Gm-Message-State: AOJu0YzrAFjKGQUfXR/yeeGUvp7pu4d8vvVH/N1yXE6aV2gfLJJ1j6ze
	nRao5NOrzpTLa7quCkB/7RJ6Sb58nB32VrcVW22Xc0Mlh2ESOqKhYTkYmEJ79M8mFKrw1YfTmMK
	v7oaRIe8=
X-Gm-Gg: ASbGnctEi6MWjRv6Dm9iNZmzJYxnHptwiW7LmYcDSyF7bghbK2xYT5qWyIPwwiRbmDd
	+NvJmtTf/XI6j7ITNLVQniEVH62+MLFr3zBdYcciNC2xC63c1TMxfQlWNy4HBbbffr032wftDXG
	YIUzFykucL5H2EgWg2b8uw2OS2sG9NQam5g1CO72I3o/A3fQJDiuVAy4vxZrEqJDKOAzwJktsP3
	UuySrhJlCqpCeP93etjldLvxq3t+lB092OCQizjL90IqgyRJZy6cWweM7WU1Y5TvZ++iFiHhlBH
	I3FwN69/rSNJG2y6VuhE0J6b3IH13MNfUzbsGIIqK640Y9ZYy89Mpj8iCkxjrZOqJh3cMWNDzcZ
	809nrQsVTF4C1Vanu8AwiGA1+nPkAxlBE7Xvhz+qqzr0CLdwd+iSKc7WLruIK+U7Yu1F4ymnmXp
	Bs
X-Google-Smtp-Source: AGHT+IFgr5ZtLzyP9+5c9Il15sALQIotEeuH3N/hau1/J0QVtdWY+5Vgfvvnqc0aipiAZemZsuysVA==
X-Received: by 2002:a05:600c:8b8c:b0:456:2d06:618a with SMTP id 5b1f17b1804b1-4587911e684mr100549615e9.18.1753725357739;
        Mon, 28 Jul 2025 10:55:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/3] tools/flask: Use tabs uniformly
Date: Mon, 28 Jul 2025 18:55:47 +0100
Message-Id: <20250728175548.3199177-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250728175548.3199177-1-andrew.cooper3@citrix.com>
References: <20250728175548.3199177-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most indentation is with tabs, but a few spaces have slipped in.  Switch them
back to tabs.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 tools/flask/policy/modules/xen.if | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index cff51febbfdf..cfa11b27b786 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -95,7 +95,7 @@ define(`manage_domain', `
 			getaddrsize pause unpause trigger shutdown destroy
 			setaffinity setdomainmaxmem getscheduler resume
 			setpodtarget getpodtarget getpagingmempool setpagingmempool };
-    allow $1 $2:domain2 { set_vnumainfo dt_overlay get_domain_state };
+	allow $1 $2:domain2 { set_vnumainfo dt_overlay get_domain_state };
 ')
 
 # migrate_domain_out(priv, target)
@@ -182,9 +182,9 @@ define(`make_device_model', `
 #   Allow a device to be used by a domain
 #   only if an IOMMU provides isolation.
 define(`use_device_iommu', `
-    allow $1 $1_self:mmu exchange;
-    allow $1 $2:resource use_iommu;
-    allow $1 domio_t:mmu { map_read map_write };
+	allow $1 $1_self:mmu exchange;
+	allow $1 $2:resource use_iommu;
+	allow $1 domio_t:mmu { map_read map_write };
 ')
 
 # use_device_iommu_nointremap(domain, device)
@@ -193,30 +193,30 @@ define(`use_device_iommu', `
 #   interrupt remapping.
 #   Allows acceptance of (typically older) less isolating hardware.
 define(`use_device_iommu_nointremap', `
-    allow $1 $1_self:mmu exchange;
-    allow $1 $2:resource { use_iommu use_iommu_nointremap };
-    allow $1 domio_t:mmu { map_read map_write };
+	allow $1 $1_self:mmu exchange;
+	allow $1 $2:resource { use_iommu use_iommu_nointremap };
+	allow $1 domio_t:mmu { map_read map_write };
 ')
 
 # use_device_noiommu(domain, device)
 #   Allow a device to be used by a domain
 #   even without an IOMMU available.
 define(`use_device_noiommu', `
-    allow $1 $1_self:mmu exchange;
-    allow $1 $2:resource { use_iommu use_iommu_nointremap use_noiommu };
-    allow $1 domio_t:mmu { map_read map_write };
+	allow $1 $1_self:mmu exchange;
+	allow $1 $2:resource { use_iommu use_iommu_nointremap use_noiommu };
+	allow $1 domio_t:mmu { map_read map_write };
 ')
 
 # admin_device(domain, device)
 #   Allow a device to be used and delegated by a domain
 define(`admin_device', `
-    allow $1 $2:resource { setup stat_device add_device add_irq add_iomem add_ioport remove_device remove_irq remove_iomem remove_ioport plug unplug };
-    allow $1 $2:hvm bind_irq;
-    use_device_noiommu($1, $2)
+	allow $1 $2:resource { setup stat_device add_device add_irq add_iomem add_ioport remove_device remove_irq remove_iomem remove_ioport plug unplug };
+	allow $1 $2:hvm bind_irq;
+	use_device_noiommu($1, $2)
 ')
 
 # delegate_devices(priv-domain, target-domain)
 #   Allow devices to be delegated
 define(`delegate_devices', `
-    allow $1 $2:resource { add remove };
+	allow $1 $2:resource { add remove };
 ')
-- 
2.39.5


