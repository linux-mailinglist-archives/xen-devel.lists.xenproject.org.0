Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CE18D822
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 20:10:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFN03-0000R3-Oj; Fri, 20 Mar 2020 19:08:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFN01-0000Qy-G2
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 19:08:05 +0000
X-Inumbo-ID: 1ff57342-6ade-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ff57342-6ade-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584731284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BBPt/an72DVxucDIBKLq9jJOejKqA4dTEQcWtnD+Slk=;
 b=X6GJv8aicxqaUe+SwlmsFz9graVLBHvWcNJzlK6n7rTRkOkkTbO2YK5Q
 QJAtLRmxYsJZHO2PmiOyR2YKz8bpNvaKb8a9AJDq57NfEBfIS1/gLsn2u
 N67uBslIxH7aHC0HdDYGAMSzYnKNXUhx3U8wwy3bsm+ue6AZ5aPPnRey7 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qf08MHDmCVaVveXznPznitV2IUvlzq3NCbJe97O9JOFZSjM5Yn4G3KZ9CPcfiUG7BonaKMD4RY
 NTxM3FMSanbudEPZstVPAxzRNa2U2x+jvFg7eOv1I6d2TLYpJtsKKUTp7LFk0waNv0Nhq74wXm
 BMUcagWpR1RpFCaEh29/tGxeAefTGM3G/N3jobXvSZs3bF6qGKKqs450g6WgvuEeQyxQR0kd6n
 7jWJETKmTtWcrruhVWNhYmGLhEKoCaX/t+s1KDA8mRvKZAoG85BgjLDGo3eIEZO9sCnnnZCPGI
 bN4=
X-SBRS: 2.7
X-MesageID: 14576027
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,285,1580792400"; d="scan'208";a="14576027"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 20:07:34 +0100
Message-ID: <20200320190737.42110-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] x86/nvmx: attempt to fix interrupt injection
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGlzIGlzIGEgZml4dXAgb2YgYSB3cm9uZyBwcmV2aW91cyBidWdmaXguIEl0IGhh
cyBiZWVuIHRlc3RlZCBvbiB0aGUKZGViaW5hMCBvc3N0ZXN0IGhvc3QgYW5kIGl0IGZpeGVzIHRo
ZSBpbnRlcnJ1cHQgaW5qZWN0aW9uIGlzc3VlcyBzZWVuCnRoZXJlIHdoZW4gcnVubmluZyB0aGUg
bmVzdGVkIEhWTSB0ZXN0cy4gSSBtZW50aW9uIHRoaXMgZXhwbGljaXRseQpiZWNhdXNlIGFsYmVp
dCBJIGRvbid0IGV4cGVjdCBpdCBJIGRvbid0IGRpc2NhcmQgaXQgbWlnaHQgY2F1c2UgaXNzdWVz
Cm9uIG90aGVyIGJveGVzIHdpdGggYSBkaWZmZXJlbnQgc2V0IG9mIFZNWCBmZWF0dXJlcy4KCkkn
dmUgdHJpZWQgdG8gbWFrZSB0aGUgcGF0Y2hlcyBhcyBzbWFsbCBhbmQgY29udGFpbmVkIGFzIHBv
c3NpYmxlIGluCm9yZGVyIHRvIGF2b2lkIGJyZWFraW5nIG90aGVyIHN0dWZmLgoKUm9nZXIgUGF1
IE1vbm5lICgzKToKICBSZXZlcnQgIng4Ni92dm14OiBmaXggdmlydHVhbCBpbnRlcnJ1cHQgaW5q
ZWN0aW9uIHdoZW4gQWNrIG9uIGV4aXQKICAgIGNvbnRyb2wgaXMgdXNlZCIKICB4ODYvbnZteDog
Y2xhcmlmeSBhbmQgZml4IHVzYWdlIG9mIG52bXhfdXBkYXRlX2FwaWN2CiAgeDg2L252bXg6IHVw
ZGF0ZSBleGl0IGJpdG1hcCBvbiB2bWV4aXQKCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMg
ICAgICAgfCAyMSArKysrKysrKysrKysrLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2
bXguYyAgICAgICB8IDE5ICsrKysrKysrKysrKy0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL3ZteC92bXguaCB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyks
IDE1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
