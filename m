Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ8BKGvowWnzXwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF33007F6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 02:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259865.1553199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXM-0007sS-TQ; Tue, 24 Mar 2026 01:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259865.1553199; Tue, 24 Mar 2026 01:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4qXM-0007qs-Mi; Tue, 24 Mar 2026 01:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1259865;
 Tue, 24 Mar 2026 00:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t6JZ=BY=kernel.org=dakr@srs-se1.protection.inumbo.net>)
 id 1w4q7N-0004ff-Cq
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 00:59:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b88bb1c8-271c-11f1-b166-2bf370ae4941;
 Tue, 24 Mar 2026 01:59:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3151A406AE;
 Tue, 24 Mar 2026 00:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2ECC4CEF7;
 Tue, 24 Mar 2026 00:59:22 +0000 (UTC)
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
X-Inumbo-ID: b88bb1c8-271c-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774313972;
	bh=g9n6egUYTuF5ke2JJ6m74go1iA9dbs1LNBwQX9Kfxdo=;
	h=From:To:Cc:Subject:Date:From;
	b=r79tvbMTbzL0ftvYwrYFxtc47UR6uhBnmMbW/y7VVV1iRybB+2M4JpIoiYURI0KHc
	 xbQi6Hae6AoFoJmbmbDJaHU6H4twMWZBNd3LQspzN5XukCR8uOrEpuyEmdRt0aOb0U
	 mOwgSJ8cLDV9T8BHYl+ocS0L8OVgW58qmKn8ydBwrFxSGxlpZWrzAsZEqo1gSY7MVu
	 kkOnSl/PVHu6HAiahaLq+b8nbHuZsE8hCdipD5o7lr0426ClKDJ0QYolowXlhy4fkV
	 i8IvftFPJDTfcclR/4ZCSmDk8L1PXC7Ak76kNlhT/lIjYoVE7r0UGtOBo25YTrAjXS
	 EFJsJ4/WWZ6pw==
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
Subject: [PATCH 00/12] treewide: Convert buses to use generic driver_override
Date: Tue, 24 Mar 2026 01:59:04 +0100
Message-ID: <20260324005919.2408620-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m
 :linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3DBF33007F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is the follow-up of the driver_override generalization in [1], converting
the remaining 11 busses and removing the now-unused driver_set_override()
helper.

All of them (except AP, which has a different race condition) are prone to the
potential UAF described in [2], caused by accessing the driver_override field
from their corresponding match() callback.

In order to address this, the generalized driver_override field in struct device
is protected with a spinlock. The driver-core provides accessors, such as
device_match_driver_override(), device_has_driver_override() and
device_set_driver_override(), which all ensure proper locking internally.

Additionally, the driver-core provides a driver_override flag in struct
bus_type, which, once enabled, automatically registers generic sysfs callbacks,
allowing userspace to modify the driver_override field.

SPI and AP are a bit special; both print "\n" when driver_override is not set,
whereas all other buses (and thus the driver-core) produce "(null)\n" in this
case.

Hence, SPI and AP do not take advantage of the driver_override flag in struct
bus_type; AP additionally maintains a counter in its custom sysfs store().

Technically, we could support a custom fallback string when driver_override is
unset in struct bus_type, but only SPI would benefit from this, since AP has
additional custom logic in store() anyways.

(I'm not sure if there are userspace programs that strictly rely on this;
driverctl seems to check for both, but I rather not break some userspace tool
I'm not aware of. :)

This series is based on v7.0-rc5 with no additional dependencies, hence those
patches can be picked up by subsystems individually.

[1] https://lore.kernel.org/driver-core/20260303115720.48783-1-dakr@kernel.org/
[2] https://bugzilla.kernel.org/show_bug.cgi?id=220789
[3] https://gitlab.com/driverctl/driverctl/-/blob/0.121/driverctl?ref_type=tags#L99

Danilo Krummrich (12):
  amba: use generic driver_override infrastructure
  bus: fsl-mc: use generic driver_override infrastructure
  cdx: use generic driver_override infrastructure
  hv: vmbus: use generic driver_override infrastructure
  PCI: use generic driver_override infrastructure
  platform/wmi: use generic driver_override infrastructure
  rpmsg: use generic driver_override infrastructure
  vdpa: use generic driver_override infrastructure
  s390/cio: use generic driver_override infrastructure
  s390/ap: use generic driver_override infrastructure
  spi: use generic driver_override infrastructure
  driver core: remove driver_set_override()

 drivers/amba/bus.c                 | 37 +++------------
 drivers/base/driver.c              | 75 ------------------------------
 drivers/bus/fsl-mc/fsl-mc-bus.c    | 43 +++--------------
 drivers/cdx/cdx.c                  | 40 ++--------------
 drivers/hv/vmbus_drv.c             | 36 ++------------
 drivers/pci/pci-driver.c           | 11 +++--
 drivers/pci/pci-sysfs.c            | 28 -----------
 drivers/pci/probe.c                |  1 -
 drivers/platform/wmi/core.c        | 36 ++------------
 drivers/rpmsg/qcom_glink_native.c  |  2 -
 drivers/rpmsg/rpmsg_core.c         | 43 +++--------------
 drivers/rpmsg/virtio_rpmsg_bus.c   |  1 -
 drivers/s390/cio/cio.h             |  5 --
 drivers/s390/cio/css.c             | 34 ++------------
 drivers/s390/crypto/ap_bus.c       | 34 +++++++-------
 drivers/s390/crypto/ap_bus.h       |  1 -
 drivers/s390/crypto/ap_queue.c     | 24 +++-------
 drivers/spi/spi.c                  | 19 +++-----
 drivers/vdpa/vdpa.c                | 48 ++-----------------
 drivers/vfio/fsl-mc/vfio_fsl_mc.c  |  4 +-
 drivers/vfio/pci/vfio_pci_core.c   |  5 +-
 drivers/xen/xen-pciback/pci_stub.c |  6 ++-
 include/linux/amba/bus.h           |  5 --
 include/linux/cdx/cdx_bus.h        |  4 --
 include/linux/device/driver.h      |  2 -
 include/linux/fsl/mc.h             |  4 --
 include/linux/hyperv.h             |  5 --
 include/linux/pci.h                |  6 ---
 include/linux/rpmsg.h              |  4 --
 include/linux/spi/spi.h            |  5 --
 include/linux/vdpa.h               |  4 --
 include/linux/wmi.h                |  4 --
 32 files changed, 88 insertions(+), 488 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0


