Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL4DI2jowWnDXwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D913007B3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259883.1553265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXQ-0000pU-6R; Tue, 24 Mar 2026 01:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259883.1553265; Tue, 24 Mar 2026 01:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXP-0000cf-W1; Tue, 24 Mar 2026 01:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1259883;
 Tue, 24 Mar 2026 01:01:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w4q9C-0005wi-63
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 01:01:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4q9B-004t4m-GW
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 02:01:29 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69c1e257-e002-0a2a0a5209dd-0a2a4503b5ea-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:01:29 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69c1e268-1947-0a2a45030019-ac6904fe8d24-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:01:29 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E26DB6012B;
 Tue, 24 Mar 2026 01:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0E8C4CEF7;
 Tue, 24 Mar 2026 01:01:18 +0000 (UTC)
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
	s=k20201202; t=1774314087;
	bh=KpxTlQdpK2jKnd62P5I8EEqT3CEkSotjkNoM+lvw6Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLAmVR6groUQSZRplygjMn68KJDDiLrGR9Vctd6Afc3mLDKzHEaYGbMFZ3KXs4fK4
	 MUoXCr/h6SfvTEE4yAlc7KGjraQ8CFJXtGn8f5BkmJWMm1J/pjXgfy9qXciydDWGLj
	 XNYlWwVjufJG5KD0z7v9ARc0FuEyAjjiYRe15HPbrYCuuNFi4/b/eyHrklVGEVsCSm
	 lE5k5muPCMjo/9hKdfl5T5LohS8mNpZoGcTFibqf76OQzdeH43NHUrx9bEVbSisncq
	 g/N4LXJNuBtUlzaGXa8b6D8KnPgXir5STaz/+AS+2urYkPCvbB6vpDfKREYcWyPp9d
	 47Lib8DntPlsA==
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
Subject: [PATCH 12/12] driver core: remove driver_set_override()
Date: Tue, 24 Mar 2026 01:59:16 +0100
Message-ID: <20260324005919.2408620-13-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774314089-4846E72C-6B87008D/0/0
X-purgate-type: clean
X-purgate-size: 3736
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: E3D913007B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All buses have been converted from driver_set_override() to the generic
driver_override infrastructure introduced in commit cb3d1049f4ea
("driver core: generalize driver_override in struct device").

Buses now either opt into the generic sysfs callbacks via the
bus_type::driver_override flag, or use device_set_driver_override() /
__device_set_driver_override() directly.

Thus, remove the now-unused driver_set_override() helper.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/driver.c         | 75 -----------------------------------
 include/linux/device/driver.h |  2 -
 2 files changed, 77 deletions(-)

diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 8ab010ddf709..7ed834f7199c 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -30,81 +30,6 @@ static struct device *next_device(struct klist_iter *i)
 	return dev;
 }
 
-/**
- * driver_set_override() - Helper to set or clear driver override.
- * @dev: Device to change
- * @override: Address of string to change (e.g. &device->driver_override);
- *            The contents will be freed and hold newly allocated override.
- * @s: NUL-terminated string, new driver name to force a match, pass empty
- *     string to clear it ("" or "\n", where the latter is only for sysfs
- *     interface).
- * @len: length of @s
- *
- * Helper to set or clear driver override in a device, intended for the cases
- * when the driver_override field is allocated by driver/bus code.
- *
- * Returns: 0 on success or a negative error code on failure.
- */
-int driver_set_override(struct device *dev, const char **override,
-			const char *s, size_t len)
-{
-	const char *new, *old;
-	char *cp;
-
-	if (!override || !s)
-		return -EINVAL;
-
-	/*
-	 * The stored value will be used in sysfs show callback (sysfs_emit()),
-	 * which has a length limit of PAGE_SIZE and adds a trailing newline.
-	 * Thus we can store one character less to avoid truncation during sysfs
-	 * show.
-	 */
-	if (len >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	/*
-	 * Compute the real length of the string in case userspace sends us a
-	 * bunch of \0 characters like python likes to do.
-	 */
-	len = strlen(s);
-
-	if (!len) {
-		/* Empty string passed - clear override */
-		device_lock(dev);
-		old = *override;
-		*override = NULL;
-		device_unlock(dev);
-		kfree(old);
-
-		return 0;
-	}
-
-	cp = strnchr(s, len, '\n');
-	if (cp)
-		len = cp - s;
-
-	new = kstrndup(s, len, GFP_KERNEL);
-	if (!new)
-		return -ENOMEM;
-
-	device_lock(dev);
-	old = *override;
-	if (cp != s) {
-		*override = new;
-	} else {
-		/* "\n" passed - clear override */
-		kfree(new);
-		*override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(driver_set_override);
-
 /**
  * driver_for_each_device - Iterator for devices bound to a driver.
  * @drv: Driver we're iterating.
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index bbc67ec513ed..aa3465a369f0 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -160,8 +160,6 @@ int __must_check driver_create_file(const struct device_driver *driver,
 void driver_remove_file(const struct device_driver *driver,
 			const struct driver_attribute *attr);
 
-int driver_set_override(struct device *dev, const char **override,
-			const char *s, size_t len);
 int __must_check driver_for_each_device(struct device_driver *drv, struct device *start,
 					void *data, device_iter_t fn);
 struct device *driver_find_device(const struct device_driver *drv,
-- 
2.53.0


