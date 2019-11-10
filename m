Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D679DF682B
	for <lists+xen-devel@lfdr.de>; Sun, 10 Nov 2019 10:28:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTjTL-0004SL-2K; Sun, 10 Nov 2019 09:25:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nPAK=ZC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iTjTJ-0004SG-WB
 for xen-devel@lists.xenproject.org; Sun, 10 Nov 2019 09:25:26 +0000
X-Inumbo-ID: 066777da-039c-11ea-9631-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 066777da-039c-11ea-9631-bc764e2007e4;
 Sun, 10 Nov 2019 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573377925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nMzd4oYiHb88lok+9gVt+Kuvfh2cog5dCwHN5a2EwgY=;
 b=Wliy0E1NoFLSGYnL4BAE76Wu0aoW6znyTAucSWl3TwAMLL8p0uMG3b9Q
 4AfE+eD7eM/SEQgV3pAsrsD2qHYRDZHEQsvrKrgibDi4BON9ltxZEqGLR
 gnnkUAFXwMiZAdBKEH3klOMfJ2SfDODGQsu2+8elJDHAtWWnzZdxVAf34 o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4duLlRx545tU8MNU2UkeSfaDCwGouAAgzMJFN2STyQmHwM476XKrKrGALV+MhcYrPBTVX3DPTi
 FQHDL7cr8qWy95ny0JtgwUdTKcWYptMGUXoQLFQbtJkhEkEaIJAoZRcU2v+GTnhCKD9VKyJd95
 dm5b/ZBnNHljkL90OalQqqsEykBTaVD13xO+r60WhNR9xc3wHl1FnBpb4L0eIt4eWlI9Hnab8w
 FVFHwu/JlATI2A88B+XSHcnM1MM5943B838/9Jb3MG9jhvMZZLlDIcaG/UhYOQ63zPxWeVApBW
 pyk=
X-SBRS: 2.7
X-MesageID: 8624965
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,288,1569297600"; 
   d="scan'208";a="8624965"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Sun, 10 Nov 2019 10:25:04 +0100
Message-ID: <20191110092506.98925-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 0/2] x86/ioapic: fix
 clear_IO_APIC_pin when using interrupt remapping
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDdXJyZW50IGNvZGUgaW4gY2xlYXJfSU9fQVBJQ19waW4gZG9lc24ndCBwcm9wZXJs
eSBkZWFsIHdpdGggSU8tQVBJQwplbnRyaWVzIGFscmVhZHkgY29uZmlndXJlZCB0byBwb2ludCB0
byBlbnRyaWVzIGluIHRoZSBpb21tdSBpbnRlcnJ1cHQKcmVtYXBwaW5nIHRhYmxlLCBmaXggdGhp
cy4KClJvZ2VyIFBhdSBNb25uZSAoMik6CiAgeDg2L2lvYXBpYzogcmVtb3ZlIHVzYWdlIG9mIFRS
VUUgYW5kIEZBTFNFIGluIGNsZWFyX0lPX0FQSUNfcGluCiAgeDg2L2lvYXBpYzogZml4IGNsZWFy
X0lPX0FQSUNfcGluIHdyaXRlIG9mIHJhdyBlbnRyaWVzCgogeGVuL2FyY2gveDg2L2lvX2FwaWMu
YyB8IDEzICsrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
