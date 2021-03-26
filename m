Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141AF34B491
	for <lists+xen-devel@lfdr.de>; Sat, 27 Mar 2021 06:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102012.195715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQ1vO-000308-G6; Sat, 27 Mar 2021 05:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102012.195715; Sat, 27 Mar 2021 05:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQ1vO-0002zl-Cc; Sat, 27 Mar 2021 05:55:54 +0000
Received: by outflank-mailman (input) for mailman id 102012;
 Fri, 26 Mar 2021 18:14:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xeO=IY=gmail.com=musamaanjum@srs-us1.protection.inumbo.net>)
 id 1lPqyz-0001PT-DB
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 18:14:53 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79f21421-deeb-4e81-8d58-2bdcee3a6bad;
 Fri, 26 Mar 2021 18:14:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z1so7334178edb.8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 11:14:52 -0700 (PDT)
Received: from LEGION ([111.119.187.49])
 by smtp.gmail.com with ESMTPSA id gj26sm4087570ejb.67.2021.03.26.11.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 11:14:50 -0700 (PDT)
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
X-Inumbo-ID: 79f21421-deeb-4e81-8d58-2bdcee3a6bad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7OwN9sCDoll1kfeOV96JvARjVXcCMVl5pE1420CYpOw=;
        b=grFMxIfnyiOWnB9RplEKcznwJgBk59Dlw9m/Qd10lgjvSNTNyzIknJNEsP1Iwd8yNr
         HRPlwIIiJtJjlO56hyU+aj25+jJzjSuEL6e8XvtMnonsZO+DF3p2//gSHa0AgfmAKhSK
         lUvmNgqIUyOGCWYRIocMdwhD4n8gQlW56XzgqdVjVKtK362IkPsTOi6dKFyDylOD1njO
         FWZFFFKwXsoV+F6LURvZ9bXSfQhbbFRI3ivclSqPkze8Gu3nrm0G29dikRKZoDblCDNH
         mmcPUn1iQxeZmfWhELA4i+As9kT/iYgE+Dlk3135pa+uE/d6S+bfjxf9Ej1F62aWDSBg
         Swlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7OwN9sCDoll1kfeOV96JvARjVXcCMVl5pE1420CYpOw=;
        b=MxaArpvejsu8wIYFNdEFWBFy0EWDzUrQBFbck1ojQpovy8vNTXLAg25gC6bhcbqo3D
         k+ITrmvwRuUqNEbWAfvg5p9a9uyUHL1WKzGtcu8j70XoKHTSuPJuCUlGw4fu9kvnpLnG
         t5dfqhae49iriMb6X6bLRi2z/Bu5tqcpJj0kc7r0LFCKrLoXGupeo2SQKcA00nTYKFx1
         x/nFmBnCZbu50tjpTdWgjHFeorru+e6M5q883BgYmYKA13jUkWJD6U5MFXXs5VDfO6pR
         /wBL4O9Kxd+QFTswDslk+vXEIp0nZaX7wY+GPywHMIiJyGcvdGwTIMhBqQCz4EipGhHV
         wnbw==
X-Gm-Message-State: AOAM5325Im8eZhjgKm8xvr3lX7QO+wKAtTNVmcJjMJIPS1+lccYrmzDB
	/467q7AFe/dKTLNIRu5M8xo=
X-Google-Smtp-Source: ABdhPJxuA8CArC7vp83Y/bQZyxiB/zWeAqtySapkwLOjb+muwylYkJwlFNtddIpQu548xwd6Df9rEw==
X-Received: by 2002:a05:6402:1545:: with SMTP id p5mr16503433edx.155.1616782491559;
        Fri, 26 Mar 2021 11:14:51 -0700 (PDT)
Date: Fri, 26 Mar 2021 23:14:42 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>,
	open list <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, colin.king@canonical.com,
	dan.carpenter@oracle.com
Cc: musamaanjum@gmail.com
Subject: [PATCH] xen/pciback: Fix incorrect type warnings
Message-ID: <20210326181442.GA1735905@LEGION>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct enum pci_channel_io_normal should be used instead of putting
integer value 1.

Fix following smatch warnings:
drivers/xen/xen-pciback/pci_stub.c:805:40: warning: incorrect type in argument 2 (different base types)
drivers/xen/xen-pciback/pci_stub.c:805:40:    expected restricted pci_channel_state_t [usertype] state
drivers/xen/xen-pciback/pci_stub.c:805:40:    got int
drivers/xen/xen-pciback/pci_stub.c:862:40: warning: incorrect type in argument 2 (different base types)
drivers/xen/xen-pciback/pci_stub.c:862:40:    expected restricted pci_channel_state_t [usertype] state
drivers/xen/xen-pciback/pci_stub.c:862:40:    got int
drivers/xen/xen-pciback/pci_stub.c:973:31: warning: incorrect type in argument 2 (different base types)
drivers/xen/xen-pciback/pci_stub.c:973:31:    expected restricted pci_channel_state_t [usertype] state
drivers/xen/xen-pciback/pci_stub.c:973:31:    got int

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 drivers/xen/xen-pciback/pci_stub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index cb904ac83006..f8e4faa96ad6 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -802,7 +802,7 @@ static pci_ers_result_t xen_pcibk_slot_reset(struct pci_dev *dev)
 			"guest with no AER driver should have been killed\n");
 		goto end;
 	}
-	result = common_process(psdev, 1, XEN_PCI_OP_aer_slotreset, result);
+	result = common_process(psdev, pci_channel_io_normal, XEN_PCI_OP_aer_slotreset, result);
 
 	if (result == PCI_ERS_RESULT_NONE ||
 		result == PCI_ERS_RESULT_DISCONNECT) {
@@ -859,7 +859,7 @@ static pci_ers_result_t xen_pcibk_mmio_enabled(struct pci_dev *dev)
 			"guest with no AER driver should have been killed\n");
 		goto end;
 	}
-	result = common_process(psdev, 1, XEN_PCI_OP_aer_mmio, result);
+	result = common_process(psdev, pci_channel_io_normal, XEN_PCI_OP_aer_mmio, result);
 
 	if (result == PCI_ERS_RESULT_NONE ||
 		result == PCI_ERS_RESULT_DISCONNECT) {
@@ -970,7 +970,7 @@ static void xen_pcibk_error_resume(struct pci_dev *dev)
 		kill_domain_by_device(psdev);
 		goto end;
 	}
-	common_process(psdev, 1, XEN_PCI_OP_aer_resume,
+	common_process(psdev, pci_channel_io_normal, XEN_PCI_OP_aer_resume,
 		       PCI_ERS_RESULT_RECOVERED);
 end:
 	if (psdev)
-- 
2.25.1


