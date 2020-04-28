Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75571BBE6E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 15:00:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPq0-0005z3-W0; Tue, 28 Apr 2020 12:59:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTPpz-0005yy-Uk
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:59:47 +0000
X-Inumbo-ID: 22f8b85c-8950-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22f8b85c-8950-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 12:59:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 74E15AE8A;
 Tue, 28 Apr 2020 12:59:45 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] PCI: drop a redundant variable from pci_add_device()
Message-ID: <75d1c852-e6ea-d3f3-3624-c77fb678412a@suse.com>
Date: Tue, 28 Apr 2020 14:59:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Surrounding code already uses the available alternative, after all.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -760,7 +760,6 @@ int pci_add_device(u16 seg, u8 bus, u8 d
             {
                 unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
                 uint32_t bar = pci_conf_read32(pdev->sbdf, idx);
-                pci_sbdf_t sbdf = PCI_SBDF3(seg, bus, devfn);
 
                 if ( (bar & PCI_BASE_ADDRESS_SPACE) ==
                      PCI_BASE_ADDRESS_SPACE_IO )
@@ -771,7 +770,8 @@ int pci_add_device(u16 seg, u8 bus, u8 d
                            seg, bus, slot, func, i);
                     continue;
                 }
-                ret = pci_size_mem_bar(sbdf, idx, NULL, &pdev->vf_rlen[i],
+                ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
+                                       &pdev->vf_rlen[i],
                                        PCI_BAR_VF |
                                        ((i == PCI_SRIOV_NUM_BARS - 1) ?
                                         PCI_BAR_LAST : 0));

