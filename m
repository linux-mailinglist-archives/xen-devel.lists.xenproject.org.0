Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21FBF321A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:09:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjMt-0005De-A3; Thu, 07 Nov 2019 15:06:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/O7A=Y7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iSjMr-0005DV-K4
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:06:37 +0000
X-Inumbo-ID: 314d1d0c-0170-11ea-a1c9-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 314d1d0c-0170-11ea-a1c9-12813bfff9fa;
 Thu, 07 Nov 2019 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573139197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lly6Buv47VmV0obIDsjROepiNBGqS5bN64QZgYKlCMU=;
 b=F2Qijc0HPnnIhhb6gI4ykJq7h5bu2fTAb0Lg7d2wG2QHYB+txwvMSN1x
 jeVutHNWKNRq1Ct/Tr1YO4zUdnqQ0NDxS8t7Wg2gePPemfJ1xI+IONbyV
 sJGW5n4X5YWUETkCUxMsNXS6Q8cxRfyz7AdlNb+DsrLE/sjsBmXpp+N5W 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4w/ZHlXWLG1xSRgFdBTIPqBYK3y+CIwftb5jJbzlN/6TJ0RNETBoBvwRkRJITBwszeLYM2LF/I
 JCd+/CjepjawX4ONiZvxYUGLR9uT+AWAJWcY+XzRW3zZFgxPziJUWfAKyKwD2U7b5kDm0pVg0t
 gM+nzsrX6NEJOLgmR4IAPfaw88umBpRf6OVD6jKDDxL3gfa9AdKs6T5dr0OG64FTAmUc+0ElBd
 KzNpgkWhT6WhnsEeejWoCSOkvj1usP2pIvl4AKU62d2m/w6CIjKxysJS4kQuIppxychO2ImuKL
 TAQ=
X-SBRS: 2.7
X-MesageID: 8000863
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8000863"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 7 Nov 2019 16:06:07 +0100
Message-ID: <20191107150609.93004-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] x86/ioapic: fix clear_IO_APIC_pin
 when using interrupt remapping
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
VUUgYW5kIEZBTFNFIGluIGNsZWFyX0lPX0FQSUNfcGluCiAgeDg2L2lvYXBpYzogZG9uJ3QgdXNl
IHJhdyBlbnRyeSByZWFkcy93cml0ZXMgaW4gY2xlYXJfSU9fQVBJQ19waW4KCiB4ZW4vYXJjaC94
ODYvaW9fYXBpYy5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
