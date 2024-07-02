Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0AC924913
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 22:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752660.1160869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOk08-0006TX-1P; Tue, 02 Jul 2024 20:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752660.1160869; Tue, 02 Jul 2024 20:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOk07-0006Qx-UQ; Tue, 02 Jul 2024 20:21:19 +0000
Received: by outflank-mailman (input) for mailman id 752660;
 Tue, 02 Jul 2024 20:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a6qz=OC=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1sOk06-0006QX-1Z
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 20:21:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a197e419-38b0-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 22:21:15 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-zpPOJ6xQMhOE5Nc8ILKk8Q-1; Tue, 02 Jul 2024 16:21:13 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4256809ae27so30274595e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 13:21:13 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f5:eadd:8c31:db01:9d01:7604])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257fb4fabdsm118041955e9.46.2024.07.02.13.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 13:21:11 -0700 (PDT)
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
X-Inumbo-ID: a197e419-38b0-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719951674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bN0cTm8m+n/A4V5Tgbpm0TUAfWebEt6LcyWQbTcpz4g=;
	b=cSr/w1GatYXhJFSXjqzY4SkxA7sI3RlElXs0bjID/oN4/5UoAbljBwnA+9BjromK6M8+90
	8y7jeGQfp9CxfP48Fj+NJx4aIg6vjnmoOqshcun8BgI92RXcywVYzBeIzHsOjr33yMLhkG
	EQPGv5dOAaXPwk4ef01rTotuBJnSWhc=
X-MC-Unique: zpPOJ6xQMhOE5Nc8ILKk8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719951672; x=1720556472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bN0cTm8m+n/A4V5Tgbpm0TUAfWebEt6LcyWQbTcpz4g=;
        b=nN4D3ya9+/qETmDSqsKDbX2UdYFzko95nQYmR7dt7KpxsLMqjdMs1EA19moDh4MVKt
         BW6g+/CD/GJlDVL6K3PS0CeLajt2wFQ7itDcNchJldCCXaD/tdWHy2XBEL0y4fqzC8Lq
         v1ERsfAM9yhKLnIeSEgkeYV6HpKm43SLdPniYB5ukj5T4KhLfj0WHkWWdAOlISerbiXM
         1FrPmCaRAksAN6PsleBTGeA/0SdMnf34ac5QrZdm52jrCYeR4eLmEloz3YoQv1T1VIlI
         w2j/X0UGipSxuSOOYE4E+JT24XN/XQalUYI3J3XUHi63Tm4igNKQLQhme/OoWS9tbVZp
         S7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp72C4HP9UCCxmIgwlfH58mgL6uKprudGgC4NTsq1vduFVOcIxN5C2dZcgBpjmhbNq8kqZ9/VxUKHsnedhxQXPm7ox9Q1E4mECbU6Yt/c=
X-Gm-Message-State: AOJu0YzqLJ+97aCSiu4hF5k7V9OT5ZuBjwsQFGw1dFMdq4R0D4OYE8lZ
	uAhrMKV0bGSQtdbtIRuOmlRPSxpz48T5070SytRPatUqFZ64DqR+fmtJ++FP9zZgaxAFrrs2LE+
	Rr0o9MW5MOjX5ZpPXi/U+xERRBwcDHNeFkgj4AJ+L9FMpgbsvQvY86keuPT9dC5vn
X-Received: by 2002:a7b:c458:0:b0:424:a2d9:67c5 with SMTP id 5b1f17b1804b1-4257a02b78emr66004435e9.16.1719951672116;
        Tue, 02 Jul 2024 13:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnSmGzWNyqHAWJCiaHjOD7gy47xRmHiiMjxtp0t7enIiEWnVy98KL0ZlXTqzKa+H5HjHidjQ==
X-Received: by 2002:a7b:c458:0:b0:424:a2d9:67c5 with SMTP id 5b1f17b1804b1-4257a02b78emr66004285e9.16.1719951671589;
        Tue, 02 Jul 2024 13:21:11 -0700 (PDT)
Date: Tue, 2 Jul 2024 16:21:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: [PULL v2 88/88] hw/pci: Replace -1 with UINT32_MAX for romsize
Message-ID: <29e45afd8d6abf7a67dab5db0ab1cfbc388daefe.1719951168.git.mst@redhat.com>
References: <cover.1719951168.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1719951168.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Akihiko Odaki <akihiko.odaki@daynix.com>

romsize is an uint32_t variable. Specifying -1 as an uint32_t value is
obscure way to denote UINT32_MAX.

Worse, if int is wider than 32-bit, it will change the behavior of a
construct like the following:
romsize = -1;
if (romsize != -1) {
    ...
}

When -1 is assigned to romsize, -1 will be implicitly casted into
uint32_t, resulting in UINT32_MAX. On contrary, when evaluating
romsize != -1, romsize will be casted into int, and it will be a
comparison of UINT32_MAX and -1, and result in false.

Replace -1 with UINT32_MAX for statements involving the variable to
clarify the intent and prevent potential breakage.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20240627-reuse-v10-10-7ca0b8ed3d9f@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c             | 8 ++++----
 hw/xen/xen_pt_load_rom.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index fa85f87b1c..4c7be52951 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -70,7 +70,7 @@ static bool pcie_has_upstream_port(PCIDevice *dev);
 static Property pci_props[] = {
     DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
     DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
-    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
+    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, UINT32_MAX),
     DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
     DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
@@ -2073,7 +2073,7 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
                                  g_cmp_uint32, NULL);
     }
 
-    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
+    if (pci_dev->romsize != UINT32_MAX && !is_power_of_2(pci_dev->romsize)) {
         error_setg(errp, "ROM size %u is not a power of two", pci_dev->romsize);
         return;
     }
@@ -2359,7 +2359,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         return;
     }
 
-    if (load_file || pdev->romsize == -1) {
+    if (load_file || pdev->romsize == UINT32_MAX) {
         path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
         if (path == NULL) {
             path = g_strdup(pdev->romfile);
@@ -2378,7 +2378,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
                        pdev->romfile);
             return;
         }
-        if (pdev->romsize != -1) {
+        if (pdev->romsize != UINT_MAX) {
             if (size > pdev->romsize) {
                 error_setg(errp, "romfile \"%s\" (%u bytes) "
                            "is too large for ROM size %u",
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index 03422a8a71..6bc64acd33 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -53,7 +53,7 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     }
     fseek(fp, 0, SEEK_SET);
 
-    if (dev->romsize != -1) {
+    if (dev->romsize != UINT_MAX) {
         if (st.st_size > dev->romsize) {
             error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %u",
                          rom_file, (long) st.st_size, dev->romsize);
-- 
MST


