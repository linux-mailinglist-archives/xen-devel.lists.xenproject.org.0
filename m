Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190473DEA47
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 12:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163364.299278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArGu-0002V8-JP; Tue, 03 Aug 2021 10:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163364.299278; Tue, 03 Aug 2021 10:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mArGu-0002SB-Fr; Tue, 03 Aug 2021 10:03:40 +0000
Received: by outflank-mailman (input) for mailman id 163364;
 Tue, 03 Aug 2021 10:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E5WV=M2=pengutronix.de=ukl@srs-us1.protection.inumbo.net>)
 id 1mArGt-0002S5-1w
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 10:03:39 +0000
Received: from metis.ext.pengutronix.de (unknown
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 817d2afe-a59d-40a8-af49-37c0bfb70126;
 Tue, 03 Aug 2021 10:03:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFM-0002yL-C1; Tue, 03 Aug 2021 12:02:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFC-0006FF-3O; Tue, 03 Aug 2021 12:01:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mArFC-0002nA-04; Tue, 03 Aug 2021 12:01:54 +0200
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
X-Inumbo-ID: 817d2afe-a59d-40a8-af49-37c0bfb70126
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
Subject: [PATCH v2 4/6] PCI: Provide wrapper to access a pci_dev's bound driver
Date: Tue,  3 Aug 2021 12:01:48 +0200
Message-Id: <20210803100150.1543597-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
References: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=7QyPcwdZ4NY+Kamu1yuALIDREdHsFlSri/yk8rxG5RU=; m=efVkvKukHsBB4PwEUkp1fcCPAc6GyqodQBQ/wT0SBJU=; p=/gl5i/UU1Dx09yWOtLon+pQ4jNTmCE0Y+RzjPzQvvpA=; g=9669558ff758fb0bb7e9379b94e233c729d3a4b8
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEJFAEACgkQwfwUeK3K7AkEDAf9FkM yYEH0uPWXjAlXFjWJg/qs1OjQZAytoASxLwmE7IwWg35kI/m1h/u2a2AVZWn+jaVHX3HODjoadxTn URZHNuJTI8vyJ54sQhdWu1XQAhM6hQXMH+VT5+sGSr6ef22DBYjejzITU3/dQmbXd5bgxHmE4qZs9 AmMZlyF3h+R4zSeZ0XiQH4ZgZZbxWVvcTc+1Nrp5kiounCsd0W2hQGCJeeLjt6mxggPqplrDkaEyC 1q0Gc6KhA26FWFEJQk/kKyDRSWF9Wgopqjwre5M4S6Stwz1lcOE74RvqFEPXeM/WWzw2fp7bt95sa h9z/Mj0ADvJRNNvlyk8x8kpwN0o6vdw==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org

Which driver a device is bound to is available twice: In struct
pci_dev::dev->driver and in struct pci_dev::driver. To get rid of the
duplication introduce a wrapper to access struct pci_dev's driver
member. Once all users are converted the wrapper can be changed to
calculate the driver using pci_dev::dev->driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 540b377ca8f6..778f3b5e6f23 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -887,6 +887,7 @@ struct pci_driver {
 };
 
 #define	to_pci_driver(drv) container_of(drv, struct pci_driver, driver)
+#define pci_driver_of_dev(pdev) ((pdev)->driver)
 
 /**
  * PCI_DEVICE - macro used to describe a specific PCI device
-- 
2.30.2


