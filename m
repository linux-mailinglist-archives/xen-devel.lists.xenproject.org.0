Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B453211297E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 11:46:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icS9M-0001q5-AL; Wed, 04 Dec 2019 10:44:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icS9K-0001pu-Uv
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:44:50 +0000
X-Inumbo-ID: 187926ae-1683-11ea-a0d2-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 187926ae-1683-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575456289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xv4s6xp4c54ioRBMxc59+ltO1VVHkuPuvM/98/apfxc=;
 b=LCPmC8BONl+CJcBx5qULWHKyL7EOvq1ihcfCDzrr5Psh4Yu1dREQUrBG
 nqVh4hGO88kQEOzAh8WZo/sNMUjjMEy1Fe6hcBvkYSj5/KaXmhczs3Bpb
 ysknu8mde3AyGN79AmL1bhrdjfHZqI9uoLSm22pjA4R4LbjbvKSDkiCF5 Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sZzdRLFP8RM5uV3caTO2m84C+LxxLC+W4Vh0X2Ao9hLuGBj9CXvfj29+gVyinmyS1BTQBSivC2
 fdXKghggHg4T1p+1n1oHaZ5TZbFq5VBvbd4T0Pgs2SCniD8wtUTkEsaCEkWuTzjfRJT8CUqEH4
 kMVXl8PiDzaQkJtNtq4eLE1wb92+F3jhkGPXbkX545ssYx9nhbKylSGyDzbl/6VtP87+9/PhNe
 jGF1boex3IlO+QRZVWbY4m6myUbAOHvkvN4fxJMkcpQ/XlmRIA7p1vgE6c0/0ZlZFDLGdYyvUQ
 Us8=
X-SBRS: 2.7
X-MesageID: 9532434
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9532434"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 11:44:20 +0100
Message-ID: <20191204104420.34418-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86: do not enable global pages when
 virtualized on AMD hardware
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB1c2luZyBnbG9iYWwgcGFnZXMgYSBmdWxsIHRsYiBmbHVzaCBjYW4gb25seSBiZSBwZXJm
b3JtZWQgYnkKdG9nZ2xpbmcgdGhlIFBHRSBiaXQgaW4gQ1I0LCB3aGljaCBpcyB1c3VhbGx5IHF1
aXRlIGV4cGVuc2l2ZSBpbiB0ZXJtcwpvZiBwZXJmb3JtYW5jZSB3aGVuIHJ1bm5pbmcgdmlydHVh
bGl6ZWQuIFRoaXMgaXMgc3BlY2lhbGx5IHJlbGV2YW50IG9uCkFNRCBoYXJkd2FyZSwgd2hpY2gg
ZG9lc24ndCBoYXZlIHRoZSBhYmlsaXR5IHRvIGRvIHNlbGVjdGl2ZSBDUjQKdHJhcHBpbmcsIGJ1
dCBjYW4gYWxzbyBiZSByZWxldmFudCBvbiBJbnRlbCBpZiB0aGUgdW5kZXJseWluZwpoeXBlcnZp
c29yIGFsc28gdHJhcHMgYWNjZXNzZXMgdG8gdGhlIFBHRSBDUjQgYml0LgoKSW4gb3JkZXIgdG8g
YXZvaWQgdGhpcyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBkbyBub3QgdXNlIGdsb2JhbCBwYWdlcwp3
aGVuIHJ1bm5pbmcgdmlydHVhbGl6ZWQgb24gQU1EIGhhcmR3YXJlLiBBIGNvbW1hbmQgbGluZSBv
cHRpb24KJ2dsb2JhbC1wYWdlcycgaXMgcHJvdmlkZWQgaW4gb3JkZXIgdG8gYWxsb3cgdGhlIHVz
ZXIgdG8gc2VsZWN0CndoZXRoZXIgZ2xvYmFsIHBhZ2VzIHdpbGwgYmUgZW5hYmxlZCBmb3IgUFYg
Z3Vlc3RzLgoKVGhlIGFib3ZlIGZpZ3VyZXMgYXJlIGZyb20gYSBQViBzaGltIHJ1bm5pbmcgb24g
QU1EIGhhcmR3YXJlIHdpdGgKMzIgdkNQVXM6CgpQR0UgZW5hYmxlZCwgeDJBUElDIG1vZGU6Cgoo
WEVOKSBHbG9iYWwgbG9jayBmbHVzaF9sb2NrOiBhZGRyPWZmZmY4MmQwODA0YjAxYzAsIGxvY2t2
YWw9MWFkYjFhZGIsIG5vdCBsb2NrZWQKKFhFTikgICBsb2NrOjE4NDE4ODMoMTM3NTEyODk5ODU0
MyksIGJsb2NrOjE2NTg3MTYoMTAxOTMwNTQ4OTA3ODEpCgpBdmVyYWdlIGxvY2sgdGltZTogICA3
NDY1ODhucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDYxNDUxNDducwoKUEdFIGRpc2FibGVkLCB4MkFQ
SUMgbW9kZToKCihYRU4pIEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRh
ZjFjMCwgbG9ja3ZhbD1hOGJmYThiZiwgbm90IGxvY2tlZAooWEVOKSAgIGxvY2s6MjczMDE3NSg2
NTc1MDUzODk4ODYpLCBibG9jazoyMDM5NzE2KDI5NjM3NjgyNDc3MzgpCgpBdmVyYWdlIGxvY2sg
dGltZTogICAyNDA4MjlucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDE0NTMwMjlucwoKQXMgc2VlbiBm
cm9tIHRoZSBhYm92ZSBmaWd1cmVzIHRoZSBsb2NrIGFuZCBibG9jayB0aW1lIG9mIHRoZSBmbHVz
aApsb2NrIGlzIHJlZHVjZWQgdG8gYXBwcm94aW1hdGVseSAxLzMgb2YgdGhlIG9yaWdpbmFsIHZh
bHVlLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBQcm92aWRlIGNvbW1hbmQgbGluZSBvcHRpb24g
dG8gZW5hYmxlL2Rpc2FibGUgUEdFLgogLSBPbmx5IGRpc2FibGUgUEdFIG9uIEFNRCBoYXJkd2Fy
ZSB3aGVuIHZpcnR1YWxpemVkLgogLSBEb2N1bWVudCB0aGUgZ2xvYmFsLXBhZ2VzIG9wdGlvbi4K
LS0tCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAxMyArKysrKysrKysrKysr
CiB4ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMgICAgICAgICAgfCAgOSArKysrKysrKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLnBhbmRvYwppbmRleCBkOTQ5NWVmNmI5Li43YmUzMGYyNzY2IDEwMDY0NAotLS0gYS9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKKysrIGIvZG9jcy9taXNjL3hlbi1jb21t
YW5kLWxpbmUucGFuZG9jCkBAIC0xMDg3LDYgKzEwODcsMTkgQEAgdmFsdWUgc2V0dGFibGUgdmlh
IFhlbiB0b29scy4KIAogRG9tMCBpcyB1c2luZyB0aGlzIHZhbHVlIGZvciBzaXppbmcgaXRzIG1h
cHRyYWNrIHRhYmxlLgogCisjIyMgZ2xvYmFsLXBhZ2VzICh4ODYpCis+IGA9IDxib29sZWFuPmAK
KworPiBEZWZhdWx0OiBgdHJ1ZWAgdW5sZXNzIHJ1bm5pbmcgdmlydHVhbGl6ZWQgb24gQU1EIGhh
cmR3YXJlCisKK1NldCB3aGV0aGVyIHRoZSBQR0UgYml0IGluIENSNCB3aWxsIGJlIGVuYWJsZWQg
Zm9yIFBWIGd1ZXN0cy4gVGhpcyBjb250cm9scyB0aGUKK3VzYWdlIG9mIGdsb2JhbCBwYWdlcywg
YW5kIHRodXMgdGhlIG5lZWQgdG8gcGVyZm9ybSB0bGIgZmx1c2hlcyBieSB3cml0aW5nIHRvCitD
UjQuCisKK05vdGUgaXQncyBkaXNhYmxlZCBieSBkZWZhdWx0IHdoZW4gcnVubmluZyB2aXJ0dWFs
aXplZCBvbiBBTUQgaGFyZHdhcmUgc2luY2UKK0FNRCBTVk0gZG9lc24ndCBzdXBwb3J0IHNlbGVj
dGl2ZSB0cmFwcGluZyBvZiBDUjQsIHNvIGdsb2JhbCBwYWdlcyBhcmUgbm90CitlbmFibGVkIGlu
IG9yZGVyIHRvIHJlZHVjZSB0aGUgb3ZlcmhlYWQgb2YgdGxiIGZsdXNoZXMuCisKICMjIyBndWVz
dF9sb2dsdmwKID4gYD0gPGxldmVsPlsvPHJhdGUtbGltaXRlZCBsZXZlbD5dYCB3aGVyZSBsZXZl
bCBpcyBgbm9uZSB8IGVycm9yIHwgd2FybmluZyB8IGluZm8gfCBkZWJ1ZyB8IGFsbGAKIApkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L3B2L2RvbWFp
bi5jCmluZGV4IDRiNmY0OGRlYTIuLjkzZmI4MjNkNjMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9wdi9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKQEAgLTExOCwxMSAr
MTE4LDE4IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vlc3RfY3I0KGNvbnN0IHN0cnVjdCB2
Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKICAgICAgICAgICAgIChtbXVfY3I0X2ZlYXR1cmVz
ICYgUFZfQ1I0X0dVRVNUX1ZJU0lCTEVfTUFTSykpOwogfQogCitzdGF0aWMgaW50IG9wdF9nbG9i
YWxfcGFnZXMgPSAtMTsKK2Jvb2xlYW5fcnVudGltZV9wYXJhbSgiZ2xvYmFsLXBhZ2VzIiwgb3B0
X2dsb2JhbF9wYWdlcyk7CisKIHVuc2lnbmVkIGxvbmcgcHZfbWFrZV9jcjQoY29uc3Qgc3RydWN0
IHZjcHUgKnYpCiB7CiAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKICAg
ICB1bnNpZ25lZCBsb25nIGNyNCA9IG1tdV9jcjRfZmVhdHVyZXMgJgogICAgICAgICB+KFg4Nl9D
UjRfUENJREUgfCBYODZfQ1I0X1BHRSB8IFg4Nl9DUjRfVFNEKTsKKyAgICBib29sIHBnZSA9IG9w
dF9nbG9iYWxfcGFnZXMgPT0gLTEgPyAoIWNwdV9oYXNfaHlwZXJ2aXNvciB8fAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3Ig
IT0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X1ZFTkRPUl9B
TUQpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogISFvcHRfZ2xvYmFs
X3BhZ2VzOwogCiAgICAgLyoKICAgICAgKiBQQ0lERSBvciBQR0UgZGVwZW5kcyBvbiB0aGUgUENJ
RC9YUFRJIHNldHRpbmdzLCBidXQgbXVzdCBub3QgYm90aCBiZQpAQCAtMTMwLDcgKzEzNyw3IEBA
IHVuc2lnbmVkIGxvbmcgcHZfbWFrZV9jcjQoY29uc3Qgc3RydWN0IHZjcHUgKnYpCiAgICAgICov
CiAgICAgaWYgKCBkLT5hcmNoLnB2LnBjaWQgKQogICAgICAgICBjcjQgfD0gWDg2X0NSNF9QQ0lE
RTsKLSAgICBlbHNlIGlmICggIWQtPmFyY2gucHYueHB0aSApCisgICAgZWxzZSBpZiAoICFkLT5h
cmNoLnB2LnhwdGkgJiYgcGdlICkKICAgICAgICAgY3I0IHw9IFg4Nl9DUjRfUEdFOwogCiAgICAg
LyoKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
