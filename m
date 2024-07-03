Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A821926BFE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 00:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753345.1161583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8oP-0003jq-H7; Wed, 03 Jul 2024 22:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753345.1161583; Wed, 03 Jul 2024 22:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8oP-0003gy-Db; Wed, 03 Jul 2024 22:50:53 +0000
Received: by outflank-mailman (input) for mailman id 753345;
 Wed, 03 Jul 2024 22:50:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1e/=OD=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1sP8oO-0003gs-5h
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 22:50:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0fb5e8a-398e-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 00:50:50 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-tEDDPEE8Oqa6ndQ0GzYykg-1; Wed, 03 Jul 2024 18:50:47 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42566e8a995so82435e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 15:50:47 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd634sm17094726f8f.9.2024.07.03.15.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 15:50:45 -0700 (PDT)
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
X-Inumbo-ID: b0fb5e8a-398e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720047048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bN0cTm8m+n/A4V5Tgbpm0TUAfWebEt6LcyWQbTcpz4g=;
	b=BHTZpIauCueBBEpmH+PwftXR3iHliIEEkYmbrTNhSIYcViMg0Owskfkf/MORwMsvTw6Fi/
	jEnVg8NNLOVVOe9TvbCo193OEnGu2DW4xC62amaFAvkMJKQAXMrDHzVjmc3/caE3rTdLN/
	IorjhgrAqjpZ7uSost1RTwu3NAonMtI=
X-MC-Unique: tEDDPEE8Oqa6ndQ0GzYykg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720047046; x=1720651846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bN0cTm8m+n/A4V5Tgbpm0TUAfWebEt6LcyWQbTcpz4g=;
        b=uFkDmf9o/E/v5+uOr5MJ9bc23dIfhcuZLQfO8ajerLPY8FhnkKkYPB8uqjaxM8whm0
         X8ud8P4qo7AdeuopyLKBxfeIaZfsBdCjHPjsfg62ON97xSP+EdLKLZox6KUvZYY/nVKw
         gPhJ2HZIpw1XYLt5mukUOdljq+DVIkMmF+miR7ChmbzR6hcNsP8gijezo20Fm7wkraet
         iae+v/nfk2f+xq/iflxxBS4vjdt0sZ4qLFC8McslvtrZiOnhkIUgdHuXE+VL23InzCYG
         ULDxI431X4DayRsRyOuwkQLb9FNqQylWDFviV1K1HLM7o+5JdH93FCBYurhWwmVHl3vu
         KAyg==
X-Forwarded-Encrypted: i=1; AJvYcCUIL9nT6l2BVcOCesj+EO4B0d6QVhwDAp9bOp7C64xs3yw8NDhSSg6hyAvn1QV7kZHfuhdsYAkQe656eWxqr0YMAb0FviOUUeDOzP4OE1s=
X-Gm-Message-State: AOJu0YyRAN2+zO/L/zmsgOHhlNolhKOjF7dA4FnGaWVlNi59zTJFVY8d
	aRnXoK4k3FL90fPP6i0Ne795Fj9uWotuB9/bP6zrRKUw0bm56eN6tjZdhlLDDkvWVCyw1qQmC5e
	UUA/A5o9S8BBYoj/VZixmaDZM926PhelI+1KHnGJO8v2kLdENEp2fr8sclzTjY1+w
X-Received: by 2002:a7b:cd95:0:b0:425:6dce:8c54 with SMTP id 5b1f17b1804b1-4264a48c4e0mr219895e9.33.1720047046480;
        Wed, 03 Jul 2024 15:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOSRByIk9k3rv668VG4ZZgH3goxRYz4rLRrmCDty5VxwTtGnPAQNDI+3zjtturXDoaidQjDg==
X-Received: by 2002:a7b:cd95:0:b0:425:6dce:8c54 with SMTP id 5b1f17b1804b1-4264a48c4e0mr219825e9.33.1720047046024;
        Wed, 03 Jul 2024 15:50:46 -0700 (PDT)
Date: Wed, 3 Jul 2024 18:50:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: [PULL v3 85/85] hw/pci: Replace -1 with UINT32_MAX for romsize
Message-ID: <6a67577d8003428bdbeba61d32a9f8158f12624b.1720046570.git.mst@redhat.com>
References: <cover.1720046570.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1720046570.git.mst@redhat.com>
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


