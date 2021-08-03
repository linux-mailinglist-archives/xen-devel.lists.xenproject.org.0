Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B583DEA4D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 12:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163371.299314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArHE-0003kl-Ki; Tue, 03 Aug 2021 10:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163371.299314; Tue, 03 Aug 2021 10:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArHE-0003gm-GE; Tue, 03 Aug 2021 10:04:00 +0000
Received: by outflank-mailman (input) for mailman id 163371;
 Tue, 03 Aug 2021 10:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E5WV=M2=pengutronix.de=ukl@srs-us1.protection.inumbo.net>)
 id 1mArHC-0002S5-TN
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 10:03:58 +0000
Received: from metis.ext.pengutronix.de (unknown
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0688bca-a9f8-4e7d-ae18-746ea99d4725;
 Tue, 03 Aug 2021 10:03:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFM-0002yN-C1; Tue, 03 Aug 2021 12:02:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFD-0006FL-MW; Tue, 03 Aug 2021 12:01:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFC-0002oK-Il; Tue, 03 Aug 2021 12:01:54 +0200
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
X-Inumbo-ID: f0688bca-a9f8-4e7d-ae18-746ea99d4725
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pci@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Russell Currey <ruscur@russell.cc>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Vadym Kochan <vkochan@marvell.com>,
	Taras Chornyi <tchornyi@marvell.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <simon.horman@corigine.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michael Buesch <m@bues.ch>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Fiona Trahe <fiona.trahe@intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	qat-linux@intel.com,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	oss-drivers@corigine.com,
	xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 6/6] PCI: Drop duplicated tracking of a pci_dev's bound driver
Date: Tue,  3 Aug 2021 12:01:50 +0200
Message-Id: <20210803100150.1543597-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
References: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=yGEodBYjARp1eJPqP9/n/KpfKo6ALJzXr+t0LDtBUZM=; m=JRVTmu6nPliiiBslnXnYAnMTr94GnCwSSGQey1Vdrcw=; p=VXwrm6IwhM33tInq/RiiFiTf7eEJSweS+vvs0hZjA4Y=; g=dfdf1d247df87fe752d1cd93dee47b352d54b9dc
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEJFAcACgkQwfwUeK3K7AlY4QgAoQ1 tszu0I41Zf6v0DKUasmGS98o7Yfn0OAkexq7Ntd7+GO5Lwc/dR4OcqooMePO5FWdYTzhGFWsTXAAD LGujFGBNIwdOZY7PsRSHFlhr8DoTUgXyHh0WvMo6wsFShQYS62Ay8MgAU36nYDzrGR94CrNoCANwS h+SL7+g+mtMAbQlS/p+3RSIYxyZ7XVHTUqkYWvnbsQpiqJVjtySAaBAdOsmo1ks0PezNBWORDnTZx oiJmCi1ZKOwWmWW0oqRhmNELiPQJzEh2XFGYcJCfDILAltZ8JK14Akc3BKVCwfr8+rcyFeI1PC7hB WPmvafaXTQnzw47uX9Cc5oG6/RB92PA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org

Currently it's tracked twice which driver is bound to a given pci
device. Now that all users of the pci specific one (struct
pci_dev::driver) are updated to use an access macro
(pci_driver_of_dev()), change the macro to use the information from the
driver core and remove the driver member from struct pci_dev.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pci/pci-driver.c | 4 ----
 include/linux/pci.h      | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 740d5bf5d411..5d950eb476e2 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -305,12 +305,10 @@ static long local_pci_probe(void *_ddi)
 	 * its remove routine.
 	 */
 	pm_runtime_get_sync(dev);
-	pci_dev->driver = pci_drv;
 	rc = pci_drv->probe(pci_dev, ddi->id);
 	if (!rc)
 		return rc;
 	if (rc < 0) {
-		pci_dev->driver = NULL;
 		pm_runtime_put_sync(dev);
 		return rc;
 	}
@@ -376,7 +374,6 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
  * @pci_dev: PCI device being probed
  *
  * returns 0 on success, else error.
- * side-effect: pci_dev->driver is set to drv when drv claims pci_dev.
  */
 static int __pci_device_probe(struct pci_driver *drv, struct pci_dev *pci_dev)
 {
@@ -451,7 +448,6 @@ static int pci_device_remove(struct device *dev)
 		pm_runtime_put_noidle(dev);
 	}
 	pcibios_free_irq(pci_dev);
-	pci_dev->driver = NULL;
 	pci_iov_remove(pci_dev);
 
 	/* Undo the runtime PM settings in local_pci_probe() */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 778f3b5e6f23..f44ab76e216f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -342,7 +342,6 @@ struct pci_dev {
 	u16		pcie_flags_reg;	/* Cached PCIe Capabilities Register */
 	unsigned long	*dma_alias_mask;/* Mask of enabled devfn aliases */
 
-	struct pci_driver *driver;	/* Driver bound to this device */
 	u64		dma_mask;	/* Mask of the bits of bus address this
 					   device implements.  Normally this is
 					   0xffffffff.  You only need to change
@@ -887,7 +886,7 @@ struct pci_driver {
 };
 
 #define	to_pci_driver(drv) container_of(drv, struct pci_driver, driver)
-#define pci_driver_of_dev(pdev) ((pdev)->driver)
+#define pci_driver_of_dev(pdev) ((pdev)->dev.driver ? to_pci_driver((pdev)->dev.driver) : NULL)
 
 /**
  * PCI_DEVICE - macro used to describe a specific PCI device
-- 
2.30.2


