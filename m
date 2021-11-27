Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E7B45FA0E
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233652.405662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUd-0004om-U2; Sat, 27 Nov 2021 01:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233652.405662; Sat, 27 Nov 2021 01:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmUd-0004fD-KX; Sat, 27 Nov 2021 01:27:07 +0000
Received: by outflank-mailman (input) for mailman id 233652;
 Sat, 27 Nov 2021 01:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSm-0003uw-8J
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:25:12 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da2e3de3-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:25:06 +0100 (CET)
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
X-Inumbo-ID: da2e3de3-4f20-11ec-9787-a32c541c8605
Message-ID: <20211127000918.779751933@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CFmm+AWRwXcJQSLL7VY9/FlDxYE98PyZd7GrvqHxiD8=;
	b=jPDSHQYSdxJlKUo1m9F9w8gw8R2TMDWPPxDRazvUWAKO2OAqttDQmAKiiB0cHxtncw0LoP
	I0nGS3ipmEFxCJjXQCspGZYqDLzYgAoHAzN8IALfV/R/UU8HnLONKw15r9QLBWIOy2tuBo
	v9UWh+uBu1gxtuVFZyC/oeYLLr7fsy2iBobG7WdjyJrjG53L08Qf0qS3j4Lea61UvUlvc7
	FlpqePyPni277I+e5Ve/tq90mOGCGQlu+ToYDaGLhxtuIL86QQHHHN2/nYRSDe2FLpzekY
	c4FjwvUSwWt/aSE1XxP6zVLeTmHWkEXcbwea6utFdTTv8Pecmzc4qo2LW6T26Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CFmm+AWRwXcJQSLL7VY9/FlDxYE98PyZd7GrvqHxiD8=;
	b=YpvVGHpsYjY8WLBK+/d3v25qrNDG94vLX8P5K9v/o3GbLxhwTttsJXuyACy8VlvKBn+N9c
	5C2HM/JCLaf7F2Cw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>,
 Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [patch 05/10] genirq/msi: Add domain info flag MSI_FLAG_CAN_EXPAND
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:25:05 +0100 (CET)

Not all MSI domains support runtime expansions of PCI/MSI-X vectors. Add a
domain flag so implementations can opt in.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -494,6 +494,8 @@ enum {
 	MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS	= (1 << 9),
 	/* Free MSI descriptors */
 	MSI_FLAG_FREE_MSI_DESCS		= (1 << 10),
+	/* MSI vectors can be expanded after initial setup */
+	MSI_FLAG_CAN_EXPAND		= (1 << 11),
 };
 
 int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,


