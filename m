Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5982305
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 18:48:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hug6F-0004e7-0v; Mon, 05 Aug 2019 16:44:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hug6D-0004e2-RC
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 16:44:41 +0000
X-Inumbo-ID: 51397714-b7a0-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51397714-b7a0-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 16:44:40 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gikyRYW7lW0AVxVVPe/eGDlwoSVgTew8iV/rcJYKEVD19lYSVDH9ucivGYtpED3WRYJJKqcEKX
 biCGYxnuRTMqE7ptNJNGMB27TAqQIoeyKW11CcWxz+rdtaRBKhVLNLC29HpMltMWpd4MouocRU
 nxioJzr71AdG1Um6Ua2a5OVRvA8pwmDjWEVkBOe5HAU/SCUYSjJaFE1xMNPk0t+R92p0mhRLzw
 zG0aHXL0aKJcifTucNfXhg70modqyJSvX25ZvKGdcIc8fZyuPDZRa+XF6g4F9biaog3nM9SxtX
 AG0=
X-SBRS: 2.7
X-MesageID: 4044141
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="4044141"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 5 Aug 2019 17:44:30 +0100
Message-ID: <20190805164430.27121-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] passthrough/amd: Drop "IOMMU not found" message
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgYy9zIDlmYTk0ZTEwNTg1ICJ4ODYvQUNQSTogYWxzbyBwYXJzZSBBTUQgSU9NTVUgdGFi
bGVzIGVhcmx5IiwgdGhpcwpmdW5jdGlvbiBpcyB1bmNvbmRpdGlvbmFsbHkgY2FsbGVkIGluIGFs
bCBjYXNlcyB3aGVyZSBhIERNQVIgQUNQSSB0YWJsZQpkb2Vzbid0IGV4aXN0LgoKQXMgYSBjb25z
ZXF1bmNlLCAiQU1ELVZpOiBJT01NVSBub3QgZm91bmQhIiBpcyBwcmludGVkIGluIGFsbCBjYXNl
cyB3aGVyZSBhbgpJT01NVSBpc24ndCBwcmVzZW50LCBldmVuIG9uIG5vbi1BTUQgc3lzdGVtcy4g
IERyb3AgdGhlIG1lc3NhZ2UgLSBpdCBpc24ndAp0ZXJyaWJseSBpbnRlcmVzdGluZyBhbnl3YXks
IGFuZCBpcyBub3cgbWlzbGVhZGluZyBpcyBhIG51bWJlciBvZiBjb21tb24KY2FzZXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0K
Q0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEJvcmlz
IE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNDOiBTdXJhdmVlIFN1dGhp
a3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpDQzogQnJpYW4gV29vZHMg
PGJyaWFuLndvb2RzQGFtZC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3Bj
aV9hbWRfaW9tbXUuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwppbmRleCBiM2UxOTMzYjUz
Li4zYmNmY2M4NDA0IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNp
X2FtZF9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lv
bW11LmMKQEAgLTE1NSw3ICsxNTUsNiBAQCBpbnQgX19pbml0IGFjcGlfaXZyc19pbml0KHZvaWQp
CiAKICAgICBpZiAoIChhbWRfaW9tbXVfZGV0ZWN0X2FjcGkoKSAhPTApIHx8IChpb21tdV9mb3Vu
ZCgpID09IDApICkKICAgICB7Ci0gICAgICAgIHByaW50aygiQU1ELVZpOiBJT01NVSBub3QgZm91
bmQhXG4iKTsKICAgICAgICAgaW9tbXVfaW50cmVtYXAgPSAwOwogICAgICAgICByZXR1cm4gLUVO
T0RFVjsKICAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
