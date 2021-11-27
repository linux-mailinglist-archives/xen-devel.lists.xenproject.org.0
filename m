Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C273C45F7DE
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233588.405349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMb-0003nd-HB; Sat, 27 Nov 2021 01:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233588.405349; Sat, 27 Nov 2021 01:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMb-0003iZ-6F; Sat, 27 Nov 2021 01:18:49 +0000
Received: by outflank-mailman (input) for mailman id 233588;
 Sat, 27 Nov 2021 01:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMZ-00020H-13
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:18:47 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6a0c8d7-4f1f-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:18:45 +0100 (CET)
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
X-Inumbo-ID: f6a0c8d7-4f1f-11ec-9787-a32c541c8605
Message-ID: <20211126223824.382273262@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=w7GncdwHZHkuO6107A0BMJdTfScXy8O2W/1Ze2L1KBI=;
	b=hRvcWzJWtpS9cJpn6ec5XsiwdSt3GIjNt8ayewjD/eh9hwlgb1/xvVV4/GfDBq35j1JSY6
	gNTVVLRFiWOl7Q6g2U0XspYHK1Xz1zZq1uR0LfL+QCvBgAeGrkjmRzOPsB9pZC5q8eBLWi
	Miu93VAKW6OCnVvlthatKyfHJOAczWW28Jui0oK0HjaKvI8jyb2hTX5R3UwIS9y70AJTKu
	ksrfsAxNB2Jfxd1CcyojtkmzQjXjSymAoG5tn8yNmv84aIU9DMLljzKenOliB09zgVb8U6
	D7jbg1L0Rx8OI4T4ciQzpXUtVYdwdBkots+z+IuOV1rReP32BLWXVPUxWjzJiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=w7GncdwHZHkuO6107A0BMJdTfScXy8O2W/1Ze2L1KBI=;
	b=g1chgF1PPE1Vu9aoCMCQV96amhB0EJgwXDPy4IycnPsMua9xAiLx9zn0a6p/WZmfDz106b
	yo4Vc3VfVsFX/VCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 05/22] genirq/msi: Fixup includes
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:42 +0100 (CET)

Remove the kobject.h include from msi.h as it's not required and add a
sysfs.h include to the core code instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    1 -
 kernel/irq/msi.c    |    1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -2,7 +2,6 @@
 #ifndef LINUX_MSI_H
 #define LINUX_MSI_H
 
-#include <linux/kobject.h>
 #include <linux/list.h>
 #include <asm/msi.h>
 
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -14,6 +14,7 @@
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/pci.h>
 
 #include "internals.h"


