Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgqxL+6UIWpFJQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B646413AF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:08:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nyECiIZ4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328026.1592714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gC-0005UV-5Q; Thu, 04 Jun 2026 15:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328026.1592714; Thu, 04 Jun 2026 15:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9gB-0005Jr-QD; Thu, 04 Jun 2026 15:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1328026;
 Thu, 04 Jun 2026 15:02:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wV9aA-00046U-Ab
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:02:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9a9-006uM5-Mr
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:02:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21935e-e002-0a2a0a5209dd-0a2a45039cb0-40
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:05 +0200
Received: from [209.85.214.179] (helo=mail-pl1-f179.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a21936b-672d-0a2a45030019-d155d6b3b402-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:02:05 +0200
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2c0c1e0b0faso6076555ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:02:04 -0700 (PDT)
Received: from localhost ([2a03:2880:7ff:54::])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664ad138sm64224585ad.82.2026.06.04.08.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 08:02:02 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585323; x=1781190123; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZHMOC3ymQk/hCIs6rXv5bV3psfV3xxIvT+fp4eN0Hg=;
        b=nyECiIZ45IWCH0BLwdIqlmN6oi3dOD3IoKtqDWooalKi0uYdUpKNUIkFIzqjDeDt34
         Yjpmkys8y5N4NPBTMtFOY+4fdMj4ZDBrKaFlO12MN4dx8UuJFw6SaP982q1FUYvYa0ti
         GVMpARFGNFe2EaBe5p6vM9/n+sTvXwzc+8xTFvD1QQFGvFnHRxbpD687gcGIWaN1o6RV
         hmzmgOrk5VyGb4ViRsVBjnDtZ2rME+GcpCIsv4kjvBd6tRw3gxWeI6IZi4tWrfS5R8TQ
         hsR9O2by9T3MJ12bH5S+5b7VLhpRnGtClaV+0VvvYDhqKDWj8RU+DefmwzuxWLSknCh+
         fEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585323; x=1781190123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZHMOC3ymQk/hCIs6rXv5bV3psfV3xxIvT+fp4eN0Hg=;
        b=PEn1YlV311Ra47dwOR0byAykv6hIqoRVfL/GYF4lFM3yIxupMB5hNnB3VjB+tBCxde
         AmFHm+u09DpHcR0H2hyL+R9Afe/dPpysHWeij5iDNC+NpVzgEAGvkPZ7eu2sQPFyPYvF
         gTOOlu/6RPqbQtf0QwL1QqKCtChgO86LgO/SGkSi98Jy+BumEgO2iYcdNErmgYBQMbba
         ol8bwqcze/Wku/wCI5LECHqJbjg9xeC/dcf/6v8hG+GxRz/b4Hd3tkf9shyKKCVg93ZS
         eKV0PheQs7hMNOkUVZL8e7Wjt6sKGPODudUtlWAx+6f/R8FAFuEjKcR/9pAXl0u5SOmi
         //mQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qtcvhO3Iexg1tnlL4tOGmyMHq0P7UTYHGrPegH7lw42oIK8i8LMLlR8vgSKq545k9WVEFOudta6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEY/k3lJMUECZ13d/rDwGZV+O+tDU71uziVbIKla8vznGFBWXd
	EAtDaWE6gIIVqb/omwPlbt1OgFVXytKsJ1MyA5OhD4aHipjFeWHkESQE
X-Gm-Gg: Acq92OELgK1FNuvwOqpwirYZ2B8avQX3hjQFkd5zC+Z+bas4F43lgxxsBpAhl3bcmam
	jqot6LcOn9JDlheODzJ6wlBJb1Tloq7I15+DCNx6iomZkwXujklzZHDovabo8cpLm9ga1o8gy/d
	Ki5TAr3MCPp6Jkpv8XuhdBDmpUvRvh4SIMq8zv9TyjXsRfYSgfNVgCZVfFdnK8isccOEsAdITfI
	YV0DZF1exuMYZ9B12gVACQ6EZesHqJs1WOw0PIpgb8kv0KMvLEkpyK7Wm5/eabB81YnzETAVVHA
	sc5qcI2Rjczg/ZyGuXgRuVDJfMu193KyrsLKniik4Kbg+X0+UHwHfoUpU2VPrWu4p1HS37RG7CF
	znHz1hDco56KThS0qEPC0crnUZXk1B4vdeFE3+712ZAtjXkGxlHnrLjfMH0nlrXey6kXzji0O9p
	erUAqbhiXVBNmRrNFbHiJzvGX76Xi+kVqpke+nMbI=
X-Received: by 2002:a17:902:be03:b0:2bf:13b0:f8ed with SMTP id d9443c01a7336-2c163a28b4dmr55201165ad.3.1780585322733;
        Thu, 04 Jun 2026 08:02:02 -0700 (PDT)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Keith Busch <kbusch@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [RFC 05/12] PCI: Convert s390/pci/pci.c to pci_is_sriov_* helpers
Date: Thu,  4 Jun 2026 08:01:46 -0700
Message-ID: <20260604150153.3619662-6-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780585325-37141938-5AD061F5/0/0
X-purgate-type: clean
X-purgate-size: 681
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,shazbot.org,ziepe.ca,intel.com,nvidia.com,suse.com,epam.com,fb.com,meta.com,lists.ozlabs.org,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:schnelle@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:alex@shazbot.org,m:jgg@ziepe.ca,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:leon@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:kbusch@kernel.org,m:alexanderduyck@fb.com,m:kuba@kernel.org,m:daskald@meta.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dimitridaskalakis1@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dimitridaskalakis1@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57B646413AF

From: Dimitri Daskalakis <daskald@meta.com>

No functional changes.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 arch/s390/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
index 39bd2adfc240..5e6f600bf60b 100644
--- a/arch/s390/pci/pci.c
+++ b/arch/s390/pci/pci.c
@@ -611,7 +611,7 @@ int pcibios_device_add(struct pci_dev *pdev)
 
 	/* The pdev has a reference to the zdev via its bus */
 	zpci_zdev_get(zdev);
-	if (pdev->is_physfn)
+	if (pci_is_sriov_physfn(pdev))
 		pdev->no_vf_scan = 1;
 
 	zpci_map_resources(pdev);
-- 
2.52.0


