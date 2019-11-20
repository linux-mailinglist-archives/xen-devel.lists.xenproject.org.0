Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF8104251
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 18:43:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXTxL-000859-1v; Wed, 20 Nov 2019 17:39:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TZAz=ZM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXTxJ-000853-GM
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 17:39:53 +0000
X-Inumbo-ID: be635f5c-0bbc-11ea-a31b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be635f5c-0bbc-11ea-a31b-12813bfff9fa;
 Wed, 20 Nov 2019 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574271586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EZicUdc1riiwjFfJjA0c61FqFWHPYbqQso68mUQeak8=;
 b=Cs87x09FGJ1Ll/DJvl/10TCe879V+MCL0iyxKnPlb1caW7llki+5U8Mf
 EW0a6gab5poMsQF8txfAgbpFkWnQK5H1a+9lOz2PUU1b5eXfwKJFy8sE0
 SSpn+urDnG39j4s0o3P038+Lqb7MD3A4uDRCqF84P3aTL8XylM7zfGdzh A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lW7yr/9SzEmoWtwj5atuK2cuTzZ17Idmh/MjzYbuvSppSvpgN6K3dxCnbysrEbNEwTQMmLoQjQ
 8DdcGB7LB0HdUkOxW/ELRfTfcgSrl5yCosWK2g8qgsIi693yzNr0DCODouZ1RXsZtHRvG7YNQp
 eijopjEA41iWYskWyc5QkEDyrqVHB04IJPeANyyOI6wr4Ft9ACItCTYTGsAcJv8v5nqURWOEqa
 3w3gxUdi0HR4fFeZxLoxMw2r83hPFJWQ1KDMWxomsYXzyWPbpsy8kN+Jc+qIugGc2wv+HJ9tRR
 LC8=
X-SBRS: 2.7
X-MesageID: 9024069
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,222,1571716800"; 
   d="scan'208";a="9024069"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 20 Nov 2019 18:39:20 +0100
Message-ID: <20191120173920.8705-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/vlapic: allow setting
 APIC_SPIV_FOCUS_DISABLED in x2APIC mode
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

Q3VycmVudCBjb2RlIHVuY29uZGl0aW9uYWxseSBwcmV2ZW50cyBzZXR0aW5nIEFQSUNfU1BJVl9G
T0NVU19ESVNBQkxFRApyZWdhcmRsZXNzIG9mIHRoZSBwcm9jZXNzb3IgbW9kZWwsIHdoaWNoIGlz
IG5vdCBjb3JyZWN0IGFjY29yZGluZyB0bwp0aGUgc3BlY2lmaWNhdGlvbi4KCkZpeCBpdCBieSBh
bGxvd2luZyBzZXR0aW5nIEFQSUNfU1BJVl9GT0NVU19ESVNBQkxFRCBiYXNlZCBvbiB0aGUKZG9t
YWluIGNwdWlkIHBvbGljeS4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
LS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZsYXBp
Yy5jIGIveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYwppbmRleCA5NDY2MjU4ZDZmLi5iMzE4YjRl
ZDVjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vdmxhcGljLmMKQEAgLTk3Nyw2ICs5NzcsNyBAQCBpbnQgZ3Vlc3Rfd3Jtc3JfeDJh
cGljKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90IG1zcl9jb250ZW50KQog
ewogICAgIHN0cnVjdCB2bGFwaWMgKnZsYXBpYyA9IHZjcHVfdmxhcGljKHYpOwogICAgIHVpbnQz
Ml90IG9mZnNldCA9IChtc3IgLSBNU1JfWDJBUElDX0ZJUlNUKSA8PCA0OworICAgIGNvbnN0IHN0
cnVjdCBjcHVpZF9wb2xpY3kgKmNwdWlkID0gdi0+ZG9tYWluLT5hcmNoLmNwdWlkOwogCiAgICAg
LyogVGhlIHRpbWVyIGhhbmRsaW5nIGF0IGxlYXN0IGlzIHVuc2FmZSBvdXRzaWRlIG9mIGN1cnJl
bnQgY29udGV4dC4gKi8KICAgICBBU1NFUlQodiA9PSBjdXJyZW50KTsKQEAgLTk5Myw2ICs5OTQs
MTQgQEAgaW50IGd1ZXN0X3dybXNyX3gyYXBpYyhzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNy
LCB1aW50NjRfdCBtc3JfY29udGVudCkKIAogICAgIGNhc2UgQVBJQ19TUElWOgogICAgICAgICBp
ZiAoIG1zcl9jb250ZW50ICYgfihBUElDX1ZFQ1RPUl9NQVNLIHwgQVBJQ19TUElWX0FQSUNfRU5B
QkxFRCB8CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqIEFQSUNfU1BJVl9GT0NVU19ESVNBQkxFRCBpcyBub3Qgc3VwcG9ydGVk
IG9uCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIEludGVsIFBlbnRpdW0gNCBhbmQg
WGVvbiBwcm9jZXNzb3JzLgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKChjcHVpZC0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9S
X0lOVEVMIHx8CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X2NwdV9mYW1pbHko
Y3B1aWQtPmJhc2ljLnJhd19mbXMsIE5VTEwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCkgIT0gMTUpID8KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBBUElDX1NQSVZfRk9DVVNfRElTQUJMRUQgOiAwKSB8CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChWTEFQSUNfVkVSU0lPTiAmIEFQSUNfTFZSX0RJUkVDVEVEX0VPSQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPyBBUElDX1NQSVZfRElSRUNURURfRU9JIDogMCkp
ICkKICAgICAgICAgICAgIHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsKLS0gCjIuMjQuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
