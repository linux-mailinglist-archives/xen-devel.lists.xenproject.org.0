Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EB22F61C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 19:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k06ZX-0006qE-4G; Mon, 27 Jul 2020 17:05:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k06ZV-0006q9-Ds
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 17:05:53 +0000
X-Inumbo-ID: 6c90f751-d02b-11ea-8ad9-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c90f751-d02b-11ea-8ad9-bc764e2007e4;
 Mon, 27 Jul 2020 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595869553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=30xkhWEAxIXXdhxrNAKv+7VMBsBG5McF1NECK0NyvdQ=;
 b=PUFv2B03vxYEnAuB5HYqrTCg0Rq2vXA5bm3VJhKvq4iCGVYfNiszPm47
 39HnB0LqmR/1zjbtGHbx0n4jGARqjdhAiJuuxL3PI8Ro4HTDIoYu7rObu
 mCeGhF+K6h+7+QIaV7XuqUbgJcFeKZRowKPgLyPcQ1asOkqcYiJQhVlgI k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AjIhgtY8/UzQItIxDwebzYaiSUJaVSigFKfePUwJZGszfyqhfbxcNPdxktb6jfqNOYBW0J+EoD
 Hi0ktSSME83+lDXkribw4iCEg4Jj/8lv2wjRQdtymV6D93lbaKhkoUKdM2MMG7Q7r6nic0sISJ
 Zih93AMcD/fam8/XzTaBe0YWD+Tgx2COsUFTZaCV6uVI9xNoll6r6CkFd6EU1w2sTdaqJmjkbi
 ItoY73Hv8npJlsyFNClIUPT86jDWkh5/tWMjhc7aSj47tQfSS3oIiEtOiYt2EZ5ET7PjQMIG2j
 Txw=
X-SBRS: 2.7
X-MesageID: 23292967
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23292967"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/5] x86_ virtual timer related fixes
Date: Mon, 27 Jul 2020 19:05:34 +0200
Message-ID: <20200727170539.55798-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

This is the first part of the vPT fixes that in the past I've posted as
a single series. I don't think it has any controversial patches, and
most have already been Acked or RB. I've split them from the series
because those can likely go in now, while I work on properly finishing the remaining
ones.

Thanks, Roger.

Roger Pau Monne (5):
  x86/hvm: fix vIO-APIC build without IRQ0_SPECIAL_ROUTING
  x86/hvm: don't force vCPU 0 for IRQ 0 when using fixed destination
    mode
  x86/hvm: fix ISA IRQ 0 handling when set as lowest priority mode in IO
    APIC
  x86/vpt: only try to resume timers belonging to enabled devices
  x86/hvm: only translate ISA interrupts to GSIs in virtual timers

 xen/arch/x86/hvm/vioapic.c | 42 +++++++++++---------------------------
 xen/arch/x86/hvm/vpt.c     | 19 ++++++++++-------
 2 files changed, 24 insertions(+), 37 deletions(-)

-- 
2.27.0


