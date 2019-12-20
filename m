Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4350512815E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:27:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiM1y-0007Ys-4c; Fri, 20 Dec 2019 17:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+gY=2K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iiM1x-0007Yl-Ao
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:25:37 +0000
X-Inumbo-ID: b704dee0-234d-11ea-b6f1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b704dee0-234d-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576862729;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=zS2Q98Gy7j6eOS6aHbF3CxRbnNIEjMw/s+gqWVzfiGc=;
 b=dA3ui6+YiO5l+pn0qvcZuErpv/1LbYMMQm81vEMS4D0M40TJKd5buf94
 RNeK2PV1v1cRwMaNwObA3EZITzu5+oRgzvDY9mKuK0Qmfq79y4TMTgM4C
 /kpjay5SQf6ItWYu/9u+X1rjoiWSAzv+EYhrX4Eo34WLp1z0ohlM7+yRw g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mNDtrFx8zT7uMm4oC1Qp16DR2t8V8gsdVrnSjidqNK8wzNNp0JMgW/7Yjfmiz8jLhg4ALesz8/
 20Eq+Y0QJNNHdeOsMjemwCbXmXoxHHY8blTOc8acGMam2qc1IZpdB1j0YquNgiakhoDDWfDWjW
 dbyciQpgDMNR7WtygHZMmNPeFw41v0HUc5ldMUX4KbwI8u2MaW/fH1Gh6weJaFBeh34o33ohYo
 t4Zk4carD7ytPjAnS1F7/bjK4olHdj8VATZncJRqvOMf0nZelzP4CJ4OqruzwP/NMobypATQDX
 oVY=
X-SBRS: 2.7
X-MesageID: 9991238
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; 
   d="scan'208";a="9991238"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 17:25:23 +0000
Message-ID: <20191220172523.1359-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] docs/migration: Remove numbering for typical
 records
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG51bWJlcnMgYXJlbid0IHJlZmVyZW5jZWQgZGlyZWN0bHksIGFuZCBleHBsaWNpdCBudW1i
ZXJpbmcgbWFrZXMgYW4KdW5uZWNlc3NlcmlseSBsYXJnZSBkaWZmIHdoZW4gaW5zZXJ0aW5nIHNv
bWV0aGluZyBuZXcgaW4gdGhlIG1pZGRsZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJp
eC5jb20+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KLS0tCiBkb2NzL3NwZWNzL2xpYnhjLW1pZ3Jh
dGlvbi1zdHJlYW0ucGFuZG9jIHwgNDYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kb2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jIGIvZG9jcy9z
cGVjcy9saWJ4Yy1taWdyYXRpb24tc3RyZWFtLnBhbmRvYwppbmRleCA5N2RhY2I2ZTMwLi5hMzY1
ZGJhMGM4IDEwMDY0NAotLS0gYS9kb2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFu
ZG9jCisrKyBiL2RvY3Mvc3BlY3MvbGlieGMtbWlncmF0aW9uLXN0cmVhbS5wYW5kb2MKQEAgLTY0
MSw0MCArNjQxLDQwIEBAIHg4NiBQViBHdWVzdAogCiBBIHR5cGljYWwgc2F2ZSByZWNvcmQgZm9y
IGFuIHg4NiBQViBndWVzdCBpbWFnZSB3b3VsZCBsb29rIGxpa2U6CiAKLTEuIEltYWdlIGhlYWRl
cgotMi4gRG9tYWluIGhlYWRlcgotMy4gWDg2X1BWX0lORk8gcmVjb3JkCi00LiBYODZfUFZfUDJN
X0ZSQU1FUyByZWNvcmQKLTUuIE1hbnkgUEFHRV9EQVRBIHJlY29yZHMKLTYuIFRTQ19JTkZPCi03
LiBTSEFSRURfSU5GTyByZWNvcmQKLTguIFZDUFUgY29udGV4dCByZWNvcmRzIGZvciBlYWNoIG9u
bGluZSBWQ1BVCi0gICAgYS4gWDg2X1BWX1ZDUFVfQkFTSUMgcmVjb3JkCi0gICAgYi4gWDg2X1BW
X1ZDUFVfRVhURU5ERUQgcmVjb3JkCi0gICAgYy4gWDg2X1BWX1ZDUFVfWFNBVkUgcmVjb3JkCi0g
ICAgZC4gWDg2X1BWX1ZDUFVfTVNSUyByZWNvcmQKLTkuIEVORCByZWNvcmQKKyogSW1hZ2UgaGVh
ZGVyCisqIERvbWFpbiBoZWFkZXIKKyogWDg2X1BWX0lORk8gcmVjb3JkCisqIFg4Nl9QVl9QMk1f
RlJBTUVTIHJlY29yZAorKiBNYW55IFBBR0VfREFUQSByZWNvcmRzCisqIFRTQ19JTkZPCisqIFNI
QVJFRF9JTkZPIHJlY29yZAorKiBWQ1BVIGNvbnRleHQgcmVjb3JkcyBmb3IgZWFjaCBvbmxpbmUg
VkNQVQorICAgICogWDg2X1BWX1ZDUFVfQkFTSUMgcmVjb3JkCisgICAgKiBYODZfUFZfVkNQVV9F
WFRFTkRFRCByZWNvcmQKKyAgICAqIFg4Nl9QVl9WQ1BVX1hTQVZFIHJlY29yZAorICAgICogWDg2
X1BWX1ZDUFVfTVNSUyByZWNvcmQKKyogRU5EIHJlY29yZAogCiBUaGVyZSBhcmUgc29tZSBzdHJp
Y3Qgb3JkZXJpbmcgcmVxdWlyZW1lbnRzLiAgVGhlIGZvbGxvd2luZyByZWNvcmRzIG11c3QKIGJl
IHByZXNlbnQgaW4gdGhlIGZvbGxvd2luZyBvcmRlciBhcyBlYWNoIG9mIHRoZW0gZGVwZW5kcyBv
biBpbmZvcm1hdGlvbgogcHJlc2VudCBpbiB0aGUgcHJlY2VkaW5nIG9uZXMuCiAKLTEuIFg4Nl9Q
Vl9JTkZPIHJlY29yZAotMi4gWDg2X1BWX1AyTV9GUkFNRVMgcmVjb3JkCi0zLiBQQUdFX0RBVEEg
cmVjb3JkcwotNC4gVkNQVSByZWNvcmRzCisqIFg4Nl9QVl9JTkZPIHJlY29yZAorKiBYODZfUFZf
UDJNX0ZSQU1FUyByZWNvcmQKKyogUEFHRV9EQVRBIHJlY29yZHMKKyogVkNQVSByZWNvcmRzCiAK
IHg4NiBIVk0gR3Vlc3QKIC0tLS0tLS0tLS0tLS0KIAogQSB0eXBpY2FsIHNhdmUgcmVjb3JkIGZv
ciBhbiB4ODYgSFZNIGd1ZXN0IGltYWdlIHdvdWxkIGxvb2sgbGlrZToKIAotMS4gSW1hZ2UgaGVh
ZGVyCi0yLiBEb21haW4gaGVhZGVyCi0zLiBNYW55IFBBR0VfREFUQSByZWNvcmRzCi00LiBUU0Nf
SU5GTwotNS4gSFZNX1BBUkFNUwotNi4gSFZNX0NPTlRFWFQKKyogSW1hZ2UgaGVhZGVyCisqIERv
bWFpbiBoZWFkZXIKKyogTWFueSBQQUdFX0RBVEEgcmVjb3JkcworKiBUU0NfSU5GTworKiBIVk1f
UEFSQU1TCisqIEhWTV9DT05URVhUCiAKIEhWTV9QQVJBTVMgbXVzdCBwcmVjZWRlIEhWTV9DT05U
RVhULCBhcyBjZXJ0YWluIHBhcmFtZXRlcnMgY2FuIGFmZmVjdAogdGhlIHZhbGlkaXR5IG9mIGFy
Y2hpdGVjdHVyYWwgc3RhdGUgaW4gdGhlIGNvbnRleHQuCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
