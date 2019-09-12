Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D8B10AD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:07:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Pih-0001Xp-0x; Thu, 12 Sep 2019 14:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8Pif-0001Xk-LE
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:05:09 +0000
X-Inumbo-ID: 53f0fb84-d566-11e9-a337-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53f0fb84-d566-11e9-a337-bc764e2007e4;
 Thu, 12 Sep 2019 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568297109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bxBrr/55ADRJAlA6Dtm59xtV89t4GvsDQ1fFvrVoMSI=;
 b=TJ68ZUniEzRpV3elamKY3gHnzPZ5ZVHCDjoSQYvYffxJmq+Wm0BdYCSE
 5d2/2PJZ6HJYQ5rzfRq8dARB+ct34NmsZOuIXVeGhnyLgioRw6IwgMihN
 6QG3n6xoPpUSeUCDCEsme3skiGmgNPNswaU3Qp95HxQhw4WiBGbNM9OJb Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ryZhcppRdJ/X1oPTB3BBnxyNpicYk4PcHKc0XB5Sktesi3btt9V4f56ZibTjXY7FkR+2k5KNYe
 /xzKCV4j8gDXRNtx3INWV+IQMrWeqQ48LQ2poFIxc3uy9tBlV6rOPzIbEOCkekNRgjZlffjEkE
 5K22Fakq746ldf2TW2gPq0xV78dV2xxctd3bxEE0Obg/X8YcxgmSEVv/UUM1BdY8XpfIAAjbqW
 y/64fyl5LpkN9ZlvvREmDhzuOyzlOMF+uk2Gg4tkLjK0w0PxfDLG0lcQkkGT6bmZyKC8vd6+6f
 5rQ=
X-SBRS: 2.7
X-MesageID: 5538842
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5538842"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 15:05:04 +0100
Message-ID: <20190912140504.40853-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] public/xen.h: update the comment explaining
 'Wallclock time'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgY29tbWl0IDA2MjlhZGZkODBlICJBY3R1YWxseSBzZXQgYSBIVk0gZG9tYWluJ3MgdGlt
ZSBvZmZzZXQgd2hlbiBpdApzZXRzIHRoZSBSVEMiLCB0aGUgY29tbWVudCBpbiB0aGUgcHVibGlj
IGhlYWRlciBoYXMgYmVlbiBtaXNsZWFkaW5nLCBzaW5jZQppdCBjbGFpbXMgdGhhdCB3YWxsY2xv
Y2sgdGltZSBpcyBvbmx5IHVwZGF0ZWQgYnkgY29udHJvbCBzb2Z0d2FyZS4KTW9yZW92ZXIsIHRo
ZSBjb21tZW50cyBzdGF0aW5nIHRoYXQgd2Nfc2VjIGFuZCB3Y19uc2VjIGFyZSBzZWNvbmRzIGFu
ZApuYW5vc2Vjb25kcyAocmVzcGVjdGl2ZWx5KSBpbiBVVEMgc2luY2UgdGhlIFVuaXggZXBvY2gg
YXJlIGJvZ3VzLiBUaGVpcgp2YWx1ZXMgYXJlIGFkanVzdGVkIGJ5IHRoZSBkb21haW4ncyB0aW1l
X29mZnNldF9zZWNvbmRzIHZhbHVlLCB3aGljaCBpcwp1cGRhdGVkIGJ5IGEgZ3Vlc3Qgd3JpdGUg
dG8gdGhlIGVtdWxhdGVkIFJUQyBhbmQgaGVuY2UgdGhlIHdhbGxjbG9jawp0aW1lem9uZSBpcyB1
bmRlciBndWVzdCBjb250cm9sLgoKVGhpcyBwYXRjaCBhdHRlbXB0cyB0byBicmluZyB0aGUgY29t
bWVudCBpbiBsaW5lIHdpdGggcmVhbGl0eSB3aGlsc3QKa2VlcGluZyBpdCByZWFzb25hYmx5IHNo
b3J0LgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzog
R2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhl
bi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy94
ZW4uaCB8IDEzICsrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oIGIv
eGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCmluZGV4IGNlZjY1YzM4ZTcuLjI3NTVjNWFkNTQgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAorKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMveGVuLmgKQEAgLTc3NSwxMiArNzc1LDE3IEBAIHN0cnVjdCBzaGFyZWRfaW5mbyB7CiAgICAg
eGVuX3Vsb25nX3QgZXZ0Y2huX21hc2tbc2l6ZW9mKHhlbl91bG9uZ190KSAqIDhdOwogCiAgICAg
LyoKLSAgICAgKiBXYWxsY2xvY2sgdGltZTogdXBkYXRlZCBvbmx5IGJ5IGNvbnRyb2wgc29mdHdh
cmUuIEd1ZXN0cyBzaG91bGQgYmFzZQotICAgICAqIHRoZWlyIGdldHRpbWVvZmRheSgpIHN5c2Nh
bGwgb24gdGhpcyB3YWxsY2xvY2stYmFzZSB2YWx1ZS4KKyAgICAgKiBXYWxsY2xvY2sgdGltZTog
dXBkYXRlZCBieSBjb250cm9sIHNvZnR3YXJlIG9yIFJUQyBlbXVsYXRpb24uCisgICAgICogR3Vl
c3RzIHNob3VsZCBiYXNlIHRoZWlyIGdldHRpbWVvZmRheSgpIHN5c2NhbGwgb24gdGhpcworICAg
ICAqIHdhbGxjbG9jay1iYXNlIHZhbHVlLgorICAgICAqIFRoZSB2YWx1cyBvZiB3Y19zZWMgYW5k
IHdjX25zZWMgYXJlIG9mZnNldHMgZnJvbSB0aGUgVW5peCBlcG9jaAorICAgICAqIGFkanVzdGVk
IGJ5IHRoZSBkb21haW4ncyAndGltZSBvZmZzZXQnIChpbiBzZWNvbmRzKSBhcyBzZXQgZWl0aGVy
CisgICAgICogYnkgWEVOX0RPTUNUTF9zZXR0aW1lb2Zmc2V0LCBvciBhZGp1c3RlZCB2aWEgYSBn
dWVzdCB3cml0ZSB0byB0aGUKKyAgICAgKiBlbXVsYXRlZCBSVEMuCiAgICAgICovCiAgICAgdWlu
dDMyX3Qgd2NfdmVyc2lvbjsgICAgICAvKiBWZXJzaW9uIGNvdW50ZXI6IHNlZSB2Y3B1X3RpbWVf
aW5mb190LiAqLwotICAgIHVpbnQzMl90IHdjX3NlYzsgICAgICAgICAgLyogU2VjcyAgMDA6MDA6
MDAgVVRDLCBKYW4gMSwgMTk3MC4gICovCi0gICAgdWludDMyX3Qgd2NfbnNlYzsgICAgICAgICAv
KiBOc2VjcyAwMDowMDowMCBVVEMsIEphbiAxLCAxOTcwLiAgKi8KKyAgICB1aW50MzJfdCB3Y19z
ZWM7CisgICAgdWludDMyX3Qgd2NfbnNlYzsKICNpZiAhZGVmaW5lZChfX2kzODZfXykKICAgICB1
aW50MzJfdCB3Y19zZWNfaGk7CiAjIGRlZmluZSB4ZW5fd2Nfc2VjX2hpIHdjX3NlY19oaQotLSAK
Mi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
