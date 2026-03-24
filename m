Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFpKJmjowWnpXwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82E3007B4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259881.1553254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXP-0000bO-K5; Tue, 24 Mar 2026 01:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259881.1553254; Tue, 24 Mar 2026 01:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXP-0000PF-EA; Tue, 24 Mar 2026 01:26:31 +0000
Received: by outflank-mailman (input) for mailman id 1259881;
 Tue, 24 Mar 2026 01:01:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w4q8t-0006VL-8C
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 01:01:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4q8s-004t0e-KI
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 02:01:10 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69c1e229-e002-0a2a0a5209dd-0a2a45049692-46
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:01:10 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69c1e254-c823-0a2a45040019-aceafc1f8d64-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:01:10 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B1AFA404E5;
 Tue, 24 Mar 2026 01:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931DBC2BCB0;
 Tue, 24 Mar 2026 01:00:59 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774314068;
	bh=A7+ilLlUptt8NahoteAzf0RgIRgwKuFBHYBpfbQD/9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=erU7fvhzJv2tp5KrkKrqx+Erdif01ZeeUOpNA4f3SMGY5Zd3volrXG0e/GJE1PA+4
	 eGQrxZX3PAs12r5SMw5wVj3Dru900+u5sZlt2HAhjsWXohecP7okhBQJqUVMGYmK9x
	 t4JpMcZVTz48+PY+wk5zYrMxets8K+lB6YlpzvSaaUxQizoh9N8ogOZ6kZFkBtVUt/
	 +2U/I6kRnURbopqcXHThSae0+v5nsjA+MtxnO1+6Qp2DXSnViA+Sg/1CnS+DYaIbv9
	 MmwreYV6dk6ePxO92r/nW6iGASWXgbC1mouwugaLRXGpdUBgdYK22pwqvUSENOqNbX
	 RFBSTYbpYZsGA==
From: Danilo Krummrich <dakr@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-spi@vger.kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 10/12] s390/ap: use generic driver_override infrastructure
Date: Tue, 24 Mar 2026 01:59:14 +0100
Message-ID: <20260324005919.2408620-11-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774314070-B80B39D1-08BA4308/0/0
X-purgate-type: clean
X-purgate-size: 6288
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m
 :linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0A82E3007B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the AP masks are updated via apmask_store() or aqmask_store(),
ap_bus_revise_bindings() is called after ap_attr_mutex has been
released.

This calls __ap_revise_reserved(), which accesses the driver_override
field without holding any lock, racing against a concurrent
driver_override_store() that may free the old string, resulting in a
potential UAF.

Fix this by using the driver-core driver_override infrastructure, which
protects all accesses with an internal spinlock.

Note that unlike most other buses, the AP bus does not check
driver_override in its match() callback; the override is checked in
ap_device_probe() and __ap_revise_reserved() instead.

Also note that we do not enable the driver_override feature of struct
bus_type, as AP - in contrast to most other buses - passes "" to
sysfs_emit() when the driver_override pointer is NULL. Thus, printing
"\n" instead of "(null)\n".

Additionally, AP has a custom counter that is modified in the
corresponding custom driver_override_store().

Fixes: d38a87d7c064 ("s390/ap: Support driver_override for AP queue devices")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/s390/crypto/ap_bus.c   | 34 +++++++++++++++++-----------------
 drivers/s390/crypto/ap_bus.h   |  1 -
 drivers/s390/crypto/ap_queue.c | 24 ++++++------------------
 3 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/s390/crypto/ap_bus.c b/drivers/s390/crypto/ap_bus.c
index d652df96a507..f24e27add721 100644
--- a/drivers/s390/crypto/ap_bus.c
+++ b/drivers/s390/crypto/ap_bus.c
@@ -859,25 +859,24 @@ static int __ap_queue_devices_with_id_unregister(struct device *dev, void *data)
 
 static int __ap_revise_reserved(struct device *dev, void *dummy)
 {
-	int rc, card, queue, devres, drvres;
+	int rc, card, queue, devres, drvres, ovrd;
 
 	if (is_queue_dev(dev)) {
 		struct ap_driver *ap_drv = to_ap_drv(dev->driver);
 		struct ap_queue *aq = to_ap_queue(dev);
-		struct ap_device *ap_dev = &aq->ap_dev;
 
 		card = AP_QID_CARD(aq->qid);
 		queue = AP_QID_QUEUE(aq->qid);
 
-		if (ap_dev->driver_override) {
-			if (strcmp(ap_dev->driver_override,
-				   ap_drv->driver.name)) {
-				pr_debug("reprobing queue=%02x.%04x\n", card, queue);
-				rc = device_reprobe(dev);
-				if (rc) {
-					AP_DBF_WARN("%s reprobing queue=%02x.%04x failed\n",
-						    __func__, card, queue);
-				}
+		ovrd = device_match_driver_override(dev, &ap_drv->driver);
+		if (ovrd > 0) {
+			/* override set and matches, nothing to do */
+		} else if (ovrd == 0) {
+			pr_debug("reprobing queue=%02x.%04x\n", card, queue);
+			rc = device_reprobe(dev);
+			if (rc) {
+				AP_DBF_WARN("%s reprobing queue=%02x.%04x failed\n",
+					    __func__, card, queue);
 			}
 		} else {
 			mutex_lock(&ap_attr_mutex);
@@ -928,7 +927,7 @@ int ap_owned_by_def_drv(int card, int queue)
 	if (aq) {
 		const struct device_driver *drv = aq->ap_dev.device.driver;
 		const struct ap_driver *ap_drv = to_ap_drv(drv);
-		bool override = !!aq->ap_dev.driver_override;
+		bool override = device_has_driver_override(&aq->ap_dev.device);
 
 		if (override && drv && ap_drv->flags & AP_DRIVER_FLAG_DEFAULT)
 			rc = 1;
@@ -977,7 +976,7 @@ static int ap_device_probe(struct device *dev)
 {
 	struct ap_device *ap_dev = to_ap_dev(dev);
 	struct ap_driver *ap_drv = to_ap_drv(dev->driver);
-	int card, queue, devres, drvres, rc = -ENODEV;
+	int card, queue, devres, drvres, rc = -ENODEV, ovrd;
 
 	if (!get_device(dev))
 		return rc;
@@ -991,10 +990,11 @@ static int ap_device_probe(struct device *dev)
 		 */
 		card = AP_QID_CARD(to_ap_queue(dev)->qid);
 		queue = AP_QID_QUEUE(to_ap_queue(dev)->qid);
-		if (ap_dev->driver_override) {
-			if (strcmp(ap_dev->driver_override,
-				   ap_drv->driver.name))
-				goto out;
+		ovrd = device_match_driver_override(dev, &ap_drv->driver);
+		if (ovrd > 0) {
+			/* override set and matches, nothing to do */
+		} else if (ovrd == 0) {
+			goto out;
 		} else {
 			mutex_lock(&ap_attr_mutex);
 			devres = test_bit_inv(card, ap_perms.apm) &&
diff --git a/drivers/s390/crypto/ap_bus.h b/drivers/s390/crypto/ap_bus.h
index 51e08f27bd75..04ea256ecf91 100644
--- a/drivers/s390/crypto/ap_bus.h
+++ b/drivers/s390/crypto/ap_bus.h
@@ -166,7 +166,6 @@ void ap_driver_unregister(struct ap_driver *);
 struct ap_device {
 	struct device device;
 	int device_type;		/* AP device type. */
-	const char *driver_override;
 };
 
 #define to_ap_dev(x) container_of((x), struct ap_device, device)
diff --git a/drivers/s390/crypto/ap_queue.c b/drivers/s390/crypto/ap_queue.c
index 3fe2e41c5c6b..ca9819e6f7e7 100644
--- a/drivers/s390/crypto/ap_queue.c
+++ b/drivers/s390/crypto/ap_queue.c
@@ -734,26 +734,14 @@ static ssize_t driver_override_show(struct device *dev,
 				    struct device_attribute *attr,
 				    char *buf)
 {
-	struct ap_queue *aq = to_ap_queue(dev);
-	struct ap_device *ap_dev = &aq->ap_dev;
-	int rc;
-
-	device_lock(dev);
-	if (ap_dev->driver_override)
-		rc = sysfs_emit(buf, "%s\n", ap_dev->driver_override);
-	else
-		rc = sysfs_emit(buf, "\n");
-	device_unlock(dev);
-
-	return rc;
+	guard(spinlock)(&dev->driver_override.lock);
+	return sysfs_emit(buf, "%s\n", dev->driver_override.name ?: "");
 }
 
 static ssize_t driver_override_store(struct device *dev,
 				     struct device_attribute *attr,
 				     const char *buf, size_t count)
 {
-	struct ap_queue *aq = to_ap_queue(dev);
-	struct ap_device *ap_dev = &aq->ap_dev;
 	int rc = -EINVAL;
 	bool old_value;
 
@@ -764,13 +752,13 @@ static ssize_t driver_override_store(struct device *dev,
 	if (ap_apmask_aqmask_in_use)
 		goto out;
 
-	old_value = ap_dev->driver_override ? true : false;
-	rc = driver_set_override(dev, &ap_dev->driver_override, buf, count);
+	old_value = device_has_driver_override(dev);
+	rc = __device_set_driver_override(dev, buf, count);
 	if (rc)
 		goto out;
-	if (old_value && !ap_dev->driver_override)
+	if (old_value && !device_has_driver_override(dev))
 		--ap_driver_override_ctr;
-	else if (!old_value && ap_dev->driver_override)
+	else if (!old_value && device_has_driver_override(dev))
 		++ap_driver_override_ctr;
 
 	rc = count;
-- 
2.53.0


