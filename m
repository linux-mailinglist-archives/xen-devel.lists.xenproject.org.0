Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761FC3148A6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83137.154088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQU-00034R-Fx; Tue, 09 Feb 2021 06:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83137.154088; Tue, 09 Feb 2021 06:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQU-00033m-8j; Tue, 09 Feb 2021 06:23:06 +0000
Received: by outflank-mailman (input) for mailman id 83137;
 Tue, 09 Feb 2021 06:23:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MQS-000330-R5
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:23:04 +0000
Received: from mail-pg1-x52f.google.com (unknown [2607:f8b0:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 527fcaab-956a-41ff-bffd-62b421d9a286;
 Tue, 09 Feb 2021 06:23:04 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id c132so11827524pga.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:23:04 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id gx22sm1155253pjb.49.2021.02.08.22.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:23:02 -0800 (PST)
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
X-Inumbo-ID: 527fcaab-956a-41ff-bffd-62b421d9a286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6zQVHgfobPuQEWulcSd+ytGSNGCX6uxs4mC7Gt2kf+c=;
        b=ert+XkxphAdsHWZRYOV0Cfn/2U+Hq+bg6asziCHHt/7u8Vvc0xyaeiuaRHcJi9Q1Vz
         h0k512lAFo9/rmCIttSQjdSndXS7KAKpm476xzbqDMAPDG5a7mdNYtdhfGaun9yWGWmH
         a9iyECq63v2VApjt+BbXpHPW6ZsiyzSxuIc1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6zQVHgfobPuQEWulcSd+ytGSNGCX6uxs4mC7Gt2kf+c=;
        b=OuCqFn9BlcvKsMQFvouVam6hB+0HcbOtV1qrm01SVeuO0VVBuUFRHHQV5J2sNRWq2c
         9ylqRfYp21liRkn7xRWPpYx6DYqknXNHfwY8aZBS2UJ2EJUjByW7LHuWplxks0zB8SWo
         nJnHOIvwRsvka59b0OFlDw28H8cafacGjElfdjUs4D3udFePB8lOCj13HDoJDJEipN+H
         isoFgfXkRxbgZgdDsYrRDB+L+XPvdC+6hVIXjxCJocHr2/TKJNKFAw19rTYo5nh0KqoW
         f5IA2fBjo/clzpuaopSc29Ts0/d7vFKEuS1ZP6x+IQzmPKekMR4FixzG7Qzx9i6AG2gC
         uZFQ==
X-Gm-Message-State: AOAM533L1w9+Pq0QxYjlBTRI/kxUtM2+a1vg0fNORLjuG1FJ8u6ztrRb
	x11M/0hoOd2BdP/lCI/XtSgwqA==
X-Google-Smtp-Source: ABdhPJzmV9YXPB6hCsXZ7URzXPDB7/qCe304q7KRCHJSQjtn7qxPBetED2jKI5U7yWvekiJpr6hFzw==
X-Received: by 2002:a62:4e10:0:b029:1c9:9015:dc5b with SMTP id c16-20020a624e100000b02901c99015dc5bmr21533363pfb.30.1612851783406;
        Mon, 08 Feb 2021 22:23:03 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Claire Chang <tientzu@chromium.org>
Subject: [PATCH v4 11/14] swiotlb: Add is_dev_swiotlb_force()
Date: Tue,  9 Feb 2021 14:21:28 +0800
Message-Id: <20210209062131.2300005-12-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add is_dev_swiotlb_force() which returns true if the device has
restricted DMA pool (e.g. dev->dev_swiotlb is set).

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 9 +++++++++
 kernel/dma/swiotlb.c    | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 76f86c684524..b9f2a250c8da 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -73,11 +73,16 @@ extern enum swiotlb_force swiotlb_force;
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
 bool is_swiotlb_force(struct device *dev);
+bool is_dev_swiotlb_force(struct device *dev);
 #else
 static inline bool is_swiotlb_force(struct device *dev)
 {
 	return unlikely(swiotlb_force == SWIOTLB_FORCE);
 }
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 #endif /* CONFIG_DMA_RESTRICTED_POOL */
 
 bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr);
@@ -93,6 +98,10 @@ static inline bool is_swiotlb_force(struct device *dev)
 {
 	return false;
 }
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f64cbe6e84cc..fd9c1bd183ac 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -841,6 +841,11 @@ bool is_swiotlb_force(struct device *dev)
 	return unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dev_swiotlb;
 }
 
+bool is_dev_swiotlb_force(struct device *dev)
+{
+	return dev->dev_swiotlb;
+}
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-- 
2.30.0.478.g8a0d178c01-goog


