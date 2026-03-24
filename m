Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 85rcJmjowWnrXwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654D3007B5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259879.1553249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXP-0000QE-9n; Tue, 24 Mar 2026 01:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259879.1553249; Tue, 24 Mar 2026 01:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXO-0000BI-VK; Tue, 24 Mar 2026 01:26:30 +0000
Received: by outflank-mailman (input) for mailman id 1259879;
 Tue, 24 Mar 2026 01:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t6JZ=BY=kernel.org=dakr@srs-se1.protection.inumbo.net>)
 id 1w4q8k-0005Au-6W
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 01:01:02 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec01ef05-271c-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 02:01:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F07260121;
 Tue, 24 Mar 2026 01:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37F1C4CEF7;
 Tue, 24 Mar 2026 01:00:49 +0000 (UTC)
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
X-Inumbo-ID: ec01ef05-271c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774314059;
	bh=ByobimVvZngWYiBS4MISNoCZaILbn7MyP0EmUHxONX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M5cmM+6DyqmK+EAGRvLHS/yaDqvmCvw5jU4r7SCyXiBwcQBFFqbb4X/i4pXN2bi2S
	 gHkRbl+Xo3RELYoiG4jfGiG71cPBeRkIjOhdvO7LyCtTJjVMWWsggEZfDrMHEQh/LT
	 sJPml12ZLm2ZXWcUV7+rSBuPDv4wlXIGpfa5Mp3UMgF0NSXsREGrGnuvEljzT3nxKU
	 rRCqRHzFA+L/AZEsNVivSFaFs9zyzzt9OOmEyPjs+2mnPiQ4PBAEg9i9nAYF6+ohUT
	 5vkv2XGga3nnGd1hHPKmfzckD1wY8wwkbKkdLTe4mZgsX9KBZZceAs6EiZe7MaJYyF
	 N2W+3BMlOYL3w==
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
Subject: [PATCH 09/12] s390/cio: use generic driver_override infrastructure
Date: Tue, 24 Mar 2026 01:59:13 +0100
Message-ID: <20260324005919.2408620-10-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m
 :linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3654D3007B5
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
Fixes: ebc3d1791503 ("s390/cio: introduce driver_override on the css bus")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/s390/cio/cio.h |  5 -----
 drivers/s390/cio/css.c | 34 ++++------------------------------
 2 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 08a5e9380e75..bad142c536e1 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -103,11 +103,6 @@ struct subchannel {
 	struct work_struct todo_work;
 	struct schib_config config;
 	u64 dma_mask;
-	/*
-	 * Driver name to force a match.  Do not set directly, because core
-	 * frees it.  Use driver_set_override() to set or clear it.
-	 */
-	const char *driver_override;
 } __attribute__ ((aligned(8)));
 
 DECLARE_PER_CPU_ALIGNED(struct irb, cio_irb);
diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index 5ab239f38588..e5a0ec6b4e3e 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -159,7 +159,6 @@ static void css_subchannel_release(struct device *dev)
 
 	sch->config.intparm = 0;
 	cio_commit_config(sch);
-	kfree(sch->driver_override);
 	kfree(sch);
 }
 
@@ -323,37 +322,9 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(modalias);
 
-static ssize_t driver_override_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct subchannel *sch = to_subchannel(dev);
-	int ret;
-
-	ret = driver_set_override(dev, &sch->driver_override, buf, count);
-	if (ret)
-		return ret;
-
-	return count;
-}
-
-static ssize_t driver_override_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct subchannel *sch = to_subchannel(dev);
-	ssize_t len;
-
-	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", sch->driver_override);
-	device_unlock(dev);
-	return len;
-}
-static DEVICE_ATTR_RW(driver_override);
-
 static struct attribute *subch_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_modalias.attr,
-	&dev_attr_driver_override.attr,
 	NULL,
 };
 
@@ -1356,9 +1327,11 @@ static int css_bus_match(struct device *dev, const struct device_driver *drv)
 	struct subchannel *sch = to_subchannel(dev);
 	const struct css_driver *driver = to_cssdriver(drv);
 	struct css_device_id *id;
+	int ret;
 
 	/* When driver_override is set, only bind to the matching driver */
-	if (sch->driver_override && strcmp(sch->driver_override, drv->name))
+	ret = device_match_driver_override(dev, drv);
+	if (ret == 0)
 		return 0;
 
 	for (id = driver->subchannel_type; id->match_flags; id++) {
@@ -1415,6 +1388,7 @@ static int css_uevent(const struct device *dev, struct kobj_uevent_env *env)
 
 static const struct bus_type css_bus_type = {
 	.name     = "css",
+	.driver_override = true,
 	.match    = css_bus_match,
 	.probe    = css_probe,
 	.remove   = css_remove,
-- 
2.53.0


