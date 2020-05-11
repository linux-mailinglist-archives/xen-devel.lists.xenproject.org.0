Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28A1CDDB0
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 16:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY9ld-0003qc-39; Mon, 11 May 2020 14:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY9lb-0003qX-Td
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 14:50:51 +0000
X-Inumbo-ID: ce780ed0-9396-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce780ed0-9396-11ea-b07b-bc764e2007e4;
 Mon, 11 May 2020 14:50:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 781EAAC77;
 Mon, 11 May 2020 14:50:52 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <5df03dc2-6bbd-6f5f-e2f8-18ed2062eb0f@suse.com>
Date: Mon, 11 May 2020 16:50:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The op has a "is reserved" flag, and hence registration shouldn't
happen unilaterally.

Fixes: eb3dd90e4089 ("x86/physdev: enable PHYSDEVOP_pci_mmcfg_reserved for PVH Dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Don't treat XEN_PCI_MMCFG_RESERVED clear as an unregistration
    request.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -557,7 +557,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
 
         ret = pci_mmcfg_reserved(info.address, info.segment,
                                  info.start_bus, info.end_bus, info.flags);
-        if ( !ret && has_vpci(currd) )
+        if ( !ret && has_vpci(currd) && (info.flags & XEN_PCI_MMCFG_RESERVED) )
         {
             /*
              * For HVM (PVH) domains try to add the newly found MMCFG to the

