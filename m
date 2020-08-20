Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32E24C249
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:35:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mai-00073n-3k; Thu, 20 Aug 2020 15:35:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mag-00073R-O0
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:34:58 +0000
X-Inumbo-ID: 8c83216e-21ec-4ccb-b24e-b628c12e5959
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c83216e-21ec-4ccb-b24e-b628c12e5959;
 Thu, 20 Aug 2020 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597937698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WJLwJ4E/RqhURG/hBP5llvAxz6xHQJx0t50Z8hMyykA=;
 b=WCEDYnzEoTXZSOMuhn2HDqQuQdL5/Xwttmbc3oIOOU8DHJ7XModaNCE8
 utIG9Ee8qUZFHDVZ6e0eKfHWSObpl+gqZrdtgp7lxEMGyofw0vmKSn7vC
 wFnGI1P2bRXHkuHEOHTovjgN68BnWjkjUckiVFsRCLjl0p8zyZvr91m92 o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7/GqR1IFiEvPXxPVgQEfx28s2s+rKv/PM84EFp6gwRXTSYDOTzD4U7W80UxMd+G5frTQnob6i4
 W44SRlCmnaOY9Of8UdQa9S1pC6wmoAMd0sWhMQXIW/G4oanpFvwYyqzoJd1F4Bc1UMxqBO6VZc
 lwfgv2EBsv423RkCdCm7afcDA0sk6l9/gEtyhZKHFNz3G8bEe9JGWpDBOwYtMg7CcKXhheHEZq
 oTHx3YkW4WcVaeIM5RmCxQZC4EsTnI0jugYKhnPZouogsei07ixX17Z8zzgL9AY8IUAc2agRM4
 JQE=
X-SBRS: 2.7
X-MesageID: 25269809
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25269809"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86/vpic: minor fixes
Date: Thu, 20 Aug 2020 17:34:40 +0200
Message-ID: <20200820153442.28305-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

This series contains one non-functional change and one small fix for
pci-passthrough when using the 8259A PIC. I very much doubt anyone has
done pci-passthrough on guests using the legacy PIC, but nonetheless
let's aim for it to be correct.

Thanks, Roger.

Roger Pau Monne (2):
  x86/vpic: rename irq to pin in vpic_ioport_write
  x86/vpic: also execute dpci callback for non-specific EOI

 xen/arch/x86/hvm/vpic.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.28.0


