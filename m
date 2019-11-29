Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456110D7A6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:08:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahpD-0006f7-22; Fri, 29 Nov 2019 15:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahpB-0006eN-Ne
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:49 +0000
X-Inumbo-ID: 86c5bcf8-12b9-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86c5bcf8-12b9-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=AqibMLB8W7yBY5wy7k4Oqwibj8S4d5q4ndsvG/gcMUQ=;
 b=cIqOvnnPJhrTJmdIfnV05i2IcfLVK5DgzDfSzLqz1h8AAiCIAnf8GrON
 q+Cr8eWglMy2aRe9JcbmSrBJ4OyvVYTB/s5SVHgw8JryjQK4ZrWBeJf5/
 IcNDZXsSnfYCKY17goUzJU2Z+9UBG46VAZFJLYf7+n8jcbGlLfE5h4Fkl U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VPEfSyy7bgUZDB3E/EUkzyfhMa+wsLypnPxjVd/vjWKbPwXXN5SU6k7Ax+fl1ABy0e+NjsL72P
 dwcxgFan5jzFF0HlZFdeJ7951KI3JLZHAIOJoHtfwriCBunvsQhOCrqVFiRxaVSzBNJNUWKtg+
 9O+T6CalxXK3KXSyf2/WLGZRnPAag6ANfQtBzj4KBvbSc37oZg2XrmQ67ek1bVpYDi9JqEl/VZ
 KzEmeX8eJ4jluBK0pCYuQZGmdxq76M6ARi0IsnhfhYZlB1lwZKwnOIKwi4vJ1BQM9FSAnlIbtc
 Slc=
X-SBRS: 2.7
X-MesageID: 8994773
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8994773"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:16 +0000
Message-ID: <20191129150416.4944-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 9/9] docs/process: Move MAINTAINERS update for
 stable to .0 release
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzaG91bGQgYmUgZG9uZSBub3Qgd2hpbGUgYnJhbmNoaW5nLCBidXQgcmlnaHQgYWZ0ZXIg
LjAgaXMKcmVsZWFzZWQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiBkb2NzL3Byb2Nlc3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50eHQg
ICAgICAgICAgfCA3IC0tLS0tLS0KIGRvY3MvcHJvY2Vzcy9yZWxlYXNlLXRlY2huaWNpYW4tY2hl
Y2tsaXN0LnR4dCB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvcHJvY2Vzcy9icmFuY2hpbmctY2hl
Y2tsaXN0LnR4dCBiL2RvY3MvcHJvY2Vzcy9icmFuY2hpbmctY2hlY2tsaXN0LnR4dAppbmRleCA5
ZTc5ZjY0MTU3Li4xMGMyMDM4MzE5IDEwMDY0NAotLS0gYS9kb2NzL3Byb2Nlc3MvYnJhbmNoaW5n
LWNoZWNrbGlzdC50eHQKKysrIGIvZG9jcy9wcm9jZXNzL2JyYW5jaGluZy1jaGVja2xpc3QudHh0
CkBAIC04NCwxMyArODQsNiBAQCBVcGRhdGUgbmV3bHkgZGl2ZXJnaW5nIHN0YWdpbmctJHYgYWNj
b3JkaW5nIHRvCiByZWxlYXNlLXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dCBzZWN0aW9uIHJlIFJF
QURNRSBldGMuLAogaW5jbHVkaW5nIHR1cm5pbmcgb2ZmIGRlYnVnLgogCi1VcGRhdGUgbmV3IHN0
YWJsZSB0cmVlJ3MgTUFJTlRBSU5FUlMgdG8gY29udGFpbiBjb3JyZWN0IGluZm8gZm9yIHRoaXMK
LXN0YWJsZSBicmFuY2g6IHVzdWFsbHksIGNvcHkgdGV4dCBmcm9tIHByZXZpb3VzCi1zdGFnaW5n
LSRvdjpNQUlOVEFJTkVSUyBzZWN0aW9uICJTdGFibGUgUmVsZWFzZSBNYWludGVuYW5jZSIKLWlu
dG8gbmV3IHN0YWdpbmctJHYsIGRlbGV0aW5nIHdoYXQncyB0aGVyZS4KLSAgZ2l0IGNhdC1maWxl
IGJsb2Igb3JpZ2luL3N0YWdpbmctJG92Ok1BSU5UQUlORVJTID5NQUlOVEFJTkVSUwotYW5kIHJl
dmlldyB0aGUgY2hhbmdlcywgY29tbWl0aW5nIE9OTFkgVEhFIFJFTEVWQU5UIE9ORVMKLQogU2V0
IG9mZiBhIG1hbnVhbCBvc3N0ZXN0IHJ1biwgc2luY2UgdGhlIG9zc3Rlc3QgY3ItZm9yLWJyYW5j
aGVzIGNoYW5nZQogd2lsbCB0YWtlIGEgd2hpbGUgdG8gdGFrZSBlZmZlY3Q6CiAgIHNzaCBvc3N0
ZXN0LnRlc3QtbGFiCmRpZmYgLS1naXQgYS9kb2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFu
LWNoZWNrbGlzdC50eHQgYi9kb2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlz
dC50eHQKaW5kZXggNTllZThiZDNkMi4uN2VkMjYzNmExMiAxMDA2NDQKLS0tIGEvZG9jcy9wcm9j
ZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0CisrKyBiL2RvY3MvcHJvY2Vzcy9y
ZWxlYXNlLXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dApAQCAtMTQ4LDUgKzE0OCwxMyBAQCBSRUxF
QVNFIFRBUkJBTEwKIAogQWZ0ZXIgYSAuMCByZWxlYXNlLCB1cGRhdGUgWEVOX0VYVFJBVkVSU0lP
TiBhZ2FpbiAodG8gLjEtcHJlLCBzZWUgYWJvdmUpLgogCitBZnRlciBhIC4wIHJlbGVhc2UsCitV
cGRhdGUgbmV3IHN0YWJsZSB0cmVlJ3MgTUFJTlRBSU5FUlMgdG8gY29udGFpbiBjb3JyZWN0IGlu
Zm8gZm9yIHRoaXMKK3N0YWJsZSBicmFuY2g6IHVzdWFsbHksIGNvcHkgdGV4dCBmcm9tIHByZXZp
b3VzCitzdGFnaW5nLSRvdjpNQUlOVEFJTkVSUyBzZWN0aW9uICJTdGFibGUgUmVsZWFzZSBNYWlu
dGVuYW5jZSIKK2ludG8gbmV3IHN0YWdpbmctJHYsIGRlbGV0aW5nIHdoYXQncyB0aGVyZS4KKyAg
Z2l0IGNhdC1maWxlIGJsb2Igb3JpZ2luL3N0YWdpbmctJG92Ok1BSU5UQUlORVJTID5NQUlOVEFJ
TkVSUworYW5kIHJldmlldyB0aGUgY2hhbmdlcywgY29tbWl0aW5nIE9OTFkgVEhFIFJFTEVWQU5U
IE9ORVMKKwogTm90aWZ5IHJlbGVhc2UgbWFuYWdlciBvZiBjb21wbGV0aW9uCiAKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
