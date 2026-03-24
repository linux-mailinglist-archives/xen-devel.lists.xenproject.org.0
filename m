Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Xf8SNWjowWntXwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7553007B7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259869.1553212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXN-00082c-FX; Tue, 24 Mar 2026 01:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259869.1553212; Tue, 24 Mar 2026 01:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXN-0007xw-6Q; Tue, 24 Mar 2026 01:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1259869;
 Tue, 24 Mar 2026 00:59:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w4q7e-0004gw-3f
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 00:59:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4q7d-004soF-FK
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 01:59:53 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69c1e1de-e002-0a2a0a5209dd-0a2a4502d854-26
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 01:59:53 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69c1e208-63bb-0a2a45020019-ac6904fea2b6-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 01:59:53 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 87C0F60120;
 Tue, 24 Mar 2026 00:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138D4C4CEF7;
 Tue, 24 Mar 2026 00:59:41 +0000 (UTC)
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
	s=k20201202; t=1774313991;
	bh=8SBWPlY0FpAPUZM3VGM6jk8MBe902KSJN4WiLZGAbHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fg9y82iadfDPF6nOAy0HmPYPAiOP6FG/VDHn1TkIcmsusWoR+G/nVZNnCuZY075br
	 gKlvWvjVdGmnI0JgptoDvayEdCUtkEYfsg2A7PluZUkmjkJczc4SoAIa2b+24cTLMO
	 ehoUBK1kyWeitGv4Js4jW16nmf/+SUVzGnTpP2KwCYTWTgtSAqvsLMsfsTs35ptcMx
	 Qhx+u6Ww/NKX1+DPPnLU1acTql1U6mNB+wnFZugPadRV0p5Gw0gHRTgVhOLxhxmRdq
	 AfBcD9mRlS2Zl/SNmQhvetfwNouTevadSCvwGk1WKIFaHCmyoKhqRcaFynIdgVlqMc
	 HA/jQLBEPF5WA==
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
	Danilo Krummrich <dakr@kernel.org>,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 02/12] bus: fsl-mc: use generic driver_override infrastructure
Date: Tue, 24 Mar 2026 01:59:06 +0100
Message-ID: <20260324005919.2408620-3-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774313993-40696DB8-A42AFC8A/0/0
X-purgate-type: clean
X-purgate-size: 5000
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,kernel.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m
 :linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vfio_fsl_mc_ops.name:url];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4C7553007B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a driver is probed through __driver_attach(), the bus' match()
callback is called without the device lock held, thus accessing the
driver_override field without a lock, which can cause a UAF.

Fix this by using the driver-core driver_override infrastructure taking
care of proper locking internally.

Note that calling match() from __driver_attach() without the device lock
held is intentional. [1]

Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Fixes: 1f86a00c1159 ("bus/fsl-mc: add support for 'driver_override' in the mc-bus")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c   | 43 +++++--------------------------
 drivers/vfio/fsl-mc/vfio_fsl_mc.c |  4 +--
 include/linux/fsl/mc.h            |  4 ---
 3 files changed, 8 insertions(+), 43 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index c117745cf206..221146e4860b 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -86,12 +86,16 @@ static int fsl_mc_bus_match(struct device *dev, const struct device_driver *drv)
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
 	const struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(drv);
 	bool found = false;
+	int ret;
 
 	/* When driver_override is set, only bind to the matching driver */
-	if (mc_dev->driver_override) {
-		found = !strcmp(mc_dev->driver_override, mc_drv->driver.name);
+	ret = device_match_driver_override(dev, drv);
+	if (ret > 0) {
+		found = true;
 		goto out;
 	}
+	if (ret == 0)
+		goto out;
 
 	if (!mc_drv->match_id_table)
 		goto out;
@@ -210,39 +214,8 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(modalias);
 
-static ssize_t driver_override_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	int ret;
-
-	if (WARN_ON(dev->bus != &fsl_mc_bus_type))
-		return -EINVAL;
-
-	ret = driver_set_override(dev, &mc_dev->driver_override, buf, count);
-	if (ret)
-		return ret;
-
-	return count;
-}
-
-static ssize_t driver_override_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	ssize_t len;
-
-	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", mc_dev->driver_override);
-	device_unlock(dev);
-	return len;
-}
-static DEVICE_ATTR_RW(driver_override);
-
 static struct attribute *fsl_mc_dev_attrs[] = {
 	&dev_attr_modalias.attr,
-	&dev_attr_driver_override.attr,
 	NULL,
 };
 
@@ -345,6 +318,7 @@ ATTRIBUTE_GROUPS(fsl_mc_bus);
 
 const struct bus_type fsl_mc_bus_type = {
 	.name = "fsl-mc",
+	.driver_override = true,
 	.match = fsl_mc_bus_match,
 	.uevent = fsl_mc_bus_uevent,
 	.probe = fsl_mc_probe,
@@ -910,9 +884,6 @@ static struct notifier_block fsl_mc_nb;
  */
 void fsl_mc_device_remove(struct fsl_mc_device *mc_dev)
 {
-	kfree(mc_dev->driver_override);
-	mc_dev->driver_override = NULL;
-
 	/*
 	 * The device-specific remove callback will get invoked by device_del()
 	 */
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 462fae1aa538..b4c3958201b2 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -424,9 +424,7 @@ static int vfio_fsl_mc_bus_notifier(struct notifier_block *nb,
 
 	if (action == BUS_NOTIFY_ADD_DEVICE &&
 	    vdev->mc_dev == mc_cont) {
-		mc_dev->driver_override = kasprintf(GFP_KERNEL, "%s",
-						    vfio_fsl_mc_ops.name);
-		if (!mc_dev->driver_override)
+		if (device_set_driver_override(dev, vfio_fsl_mc_ops.name))
 			dev_warn(dev, "VFIO_FSL_MC: Setting driver override for device in dprc %s failed\n",
 				 dev_name(&mc_cont->dev));
 		else
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 897d6211c163..1da63f2d7040 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -178,9 +178,6 @@ struct fsl_mc_obj_desc {
  * @regions: pointer to array of MMIO region entries
  * @irqs: pointer to array of pointers to interrupts allocated to this device
  * @resource: generic resource associated with this MC object device, if any.
- * @driver_override: driver name to force a match; do not set directly,
- *                   because core frees it; use driver_set_override() to
- *                   set or clear it.
  *
  * Generic device object for MC object devices that are "attached" to a
  * MC bus.
@@ -214,7 +211,6 @@ struct fsl_mc_device {
 	struct fsl_mc_device_irq **irqs;
 	struct fsl_mc_resource *resource;
 	struct device_link *consumer_link;
-	const char *driver_override;
 };
 
 #define to_fsl_mc_device(_dev) \
-- 
2.53.0


