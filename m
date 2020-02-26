Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7D17098C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:26:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73CU-0003jL-Bq; Wed, 26 Feb 2020 20:22:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73CS-0003j3-Vz
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:22:33 +0000
X-Inumbo-ID: b42031f8-58d5-11ea-94dc-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b42031f8-58d5-11ea-94dc-12813bfff9fa;
 Wed, 26 Feb 2020 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u/+RKLhbDk17CKseuXcfqx9TwE1p61mY4ldohohPJuk=;
 b=MfXV3cRWTTdkA/ZyJ1eOKMBPGnnaTurjFWC6I8yrL0VDmYZwsvXI7Z+b
 pQrPIHXfJMk7Pi9YPk1LdE1VyzwZyiOeKrXdxkvFmZ4O2szoc7oorSmqb
 srmFw68vsckgDxo6DmEWA0/DPs8H8KDQutGVP2MtGs0loAvEZL1oFojY8 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6upkhATuuOwR3xc4+/iry+v3K+MkoJm04izMYWmVr/fyM9xXX69aiyioQSWXlZak1QIYWG3LLw
 k7b/kO+j+bzcgq5LOxM4yc56XYWWV2uHCsC0uMdUZfzhXV4SQdlMlzSQMLKtUyk5cYNmS+KqBd
 2TccL46QR5s8corlm0iUsMZAIQEjIeGe9QKNY8SXqUGkkpbUaA3Eb4NCbObdZLX0jS901EnlxP
 bIzxpfvFOEdg2asw7VgDweid3hrSQROweVj3DVzlipylAn8a5olCPKtQmiIYWTJ4rQIJg5CWz4
 0hM=
X-SBRS: 2.7
X-MesageID: 13071942
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13071942"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:12 +0000
Message-ID: <20200226202221.6555-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 01/10] x86/sysctl: Don't return cpu policy data
 for compiled-out support (2)
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCBhcyB3aXRoIGMvcyA5NmRjNzdiNGIxIGZvciBYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5
LApYRU5fU1lTQ1RMX2dldF9jcHVfZmVhdHVyZXNldCBuZWVkcyB0byBiZWNvbWUgY29uZGl0aW9u
YWwuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCiB0b29scy9taXNjL3hlbi1jcHVpZC5jICAgICAgfCAxNyArKysrKysrKysrKysrLS0tLQog
eGVuL2FyY2gveDg2L3N5c2N0bC5jICAgICAgIHwgMTcgKysrKysrKysrKysrKy0tLS0KIHhlbi9p
bmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW4tY3B1
aWQuYyBiL3Rvb2xzL21pc2MveGVuLWNwdWlkLmMKaW5kZXggZjU1YjY3NjQwYS4uMzZjMTdiZjc3
NyAxMDA2NDQKLS0tIGEvdG9vbHMvbWlzYy94ZW4tY3B1aWQuYworKysgYi90b29scy9taXNjL3hl
bi1jcHVpZC5jCkBAIC0yNTEsNyArMjUxLDcgQEAgc3RhdGljIHZvaWQgZGVjb2RlX2ZlYXR1cmVz
ZXQoY29uc3QgdWludDMyX3QgKmZlYXR1cmVzLAogICAgIH0KIH0KIAotc3RhdGljIHZvaWQgZ2V0
X2ZlYXR1cmVzZXQoeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkIGludCBpZHgpCitzdGF0aWMg
aW50IGdldF9mZWF0dXJlc2V0KHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25lZCBpbnQgaWR4KQog
ewogICAgIHN0cnVjdCBmc2luZm8gKmYgPSAmZmVhdHVyZXNldHNbaWR4XTsKIApAQCAtMjYxLDgg
KzI2MSw3IEBAIHN0YXRpYyB2b2lkIGdldF9mZWF0dXJlc2V0KHhjX2ludGVyZmFjZSAqeGNoLCB1
bnNpZ25lZCBpbnQgaWR4KQogICAgIGlmICggIWYtPmZzICkKICAgICAgICAgZXJyKDEsICJjYWxs
b2MoLCBmZWF0dXJlc2V0KSIpOwogCi0gICAgaWYgKCB4Y19nZXRfY3B1X2ZlYXR1cmVzZXQoeGNo
LCBpZHgsICZmLT5sZW4sIGYtPmZzKSApCi0gICAgICAgIGVycigxLCAieGNfZ2V0X2ZlYXR1cmVz
ZXQoKSIpOworICAgIHJldHVybiB4Y19nZXRfY3B1X2ZlYXR1cmVzZXQoeGNoLCBpZHgsICZmLT5s
ZW4sIGYtPmZzKTsKIH0KIAogc3RhdGljIHZvaWQgZHVtcF9pbmZvKHhjX2ludGVyZmFjZSAqeGNo
LCBib29sIGRldGFpbCkKQEAgLTI5NCw3ICsyOTMsMTcgQEAgc3RhdGljIHZvaWQgZHVtcF9pbmZv
KHhjX2ludGVyZmFjZSAqeGNoLCBib29sIGRldGFpbCkKICAgICBwcmludGYoIlxuRHluYW1pYyBz
ZXRzOlxuIik7CiAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGZlYXR1cmVzZXRzKTsg
KytpICkKICAgICB7Ci0gICAgICAgIGdldF9mZWF0dXJlc2V0KHhjaCwgaSk7CisgICAgICAgIGlm
ICggZ2V0X2ZlYXR1cmVzZXQoeGNoLCBpKSApCisgICAgICAgIHsKKyAgICAgICAgICAgIGlmICgg
ZXJybm8gPT0gRU9QTk9UU1VQUCApCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgcHJp
bnRmKCIlcyBmZWF0dXJlc2V0IG5vdCBzdXBwb3J0ZWQgYnkgWGVuXG4iLAorICAgICAgICAgICAg
ICAgICAgICAgICBmZWF0dXJlc2V0c1tpXS5uYW1lKTsKKyAgICAgICAgICAgICAgICBjb250aW51
ZTsKKyAgICAgICAgICAgIH0KKworICAgICAgICAgICAgZXJyKDEsICJ4Y19nZXRfZmVhdHVyZXNl
dCgpIik7CisgICAgICAgIH0KIAogICAgICAgICBkZWNvZGVfZmVhdHVyZXNldChmZWF0dXJlc2V0
c1tpXS5mcywgZmVhdHVyZXNldHNbaV0ubGVuLAogICAgICAgICAgICAgICAgICAgICAgICAgICBm
ZWF0dXJlc2V0c1tpXS5uYW1lLCBkZXRhaWwpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3N5
c2N0bC5jIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCmluZGV4IDU5YTM4NDAyM2IuLjdlYThjMzg3
OTcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYworKysgYi94ZW4vYXJjaC94ODYv
c3lzY3RsLmMKQEAgLTM2MywxMSArMzYzLDE1IEBAIGxvbmcgYXJjaF9kb19zeXNjdGwoCiAKICAg
ICBjYXNlIFhFTl9TWVNDVExfZ2V0X2NwdV9mZWF0dXJlc2V0OgogICAgIHsKLSAgICAgICAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBjcHVpZF9wb2xpY3kgKmNvbnN0IHBvbGljeV90YWJsZVtdID0gewor
ICAgICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqY29uc3QgcG9saWN5X3Rh
YmxlWzRdID0gewogICAgICAgICAgICAgW1hFTl9TWVNDVExfY3B1X2ZlYXR1cmVzZXRfcmF3XSAg
PSAmcmF3X2NwdWlkX3BvbGljeSwKICAgICAgICAgICAgIFtYRU5fU1lTQ1RMX2NwdV9mZWF0dXJl
c2V0X2hvc3RdID0gJmhvc3RfY3B1aWRfcG9saWN5LAorI2lmZGVmIENPTkZJR19QVgogICAgICAg
ICAgICAgW1hFTl9TWVNDVExfY3B1X2ZlYXR1cmVzZXRfcHZdICAgPSAmcHZfbWF4X2NwdWlkX3Bv
bGljeSwKKyNlbmRpZgorI2lmZGVmIENPTkZJR19IVk0KICAgICAgICAgICAgIFtYRU5fU1lTQ1RM
X2NwdV9mZWF0dXJlc2V0X2h2bV0gID0gJmh2bV9tYXhfY3B1aWRfcG9saWN5LAorI2VuZGlmCiAg
ICAgICAgIH07CiAgICAgICAgIGNvbnN0IHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSBOVUxMOwog
ICAgICAgICB1aW50MzJfdCBmZWF0dXJlc2V0W0ZTQ0FQSU5UU107CkBAIC0zODksMTIgKzM5Mywx
NyBAQCBsb25nIGFyY2hfZG9fc3lzY3RsKAogCiAgICAgICAgIC8qIExvb2sgdXAgcmVxdWVzdGVk
IGZlYXR1cmVzZXQuICovCiAgICAgICAgIGlmICggc3lzY3RsLT51LmNwdV9mZWF0dXJlc2V0Lmlu
ZGV4IDwgQVJSQVlfU0laRShwb2xpY3lfdGFibGUpICkKKyAgICAgICAgewogICAgICAgICAgICAg
cCA9IHBvbGljeV90YWJsZVtzeXNjdGwtPnUuY3B1X2ZlYXR1cmVzZXQuaW5kZXhdOwogCi0gICAg
ICAgIC8qIEJhZCBmZWF0dXJlc2V0IGluZGV4PyAqLwotICAgICAgICBpZiAoICFwICkKLSAgICAg
ICAgICAgIHJldCA9IC1FSU5WQUw7CisgICAgICAgICAgICBpZiAoICFwICkKKyAgICAgICAgICAg
ICAgICByZXQgPSAtRU9QTk9UU1VQUDsKKyAgICAgICAgfQogICAgICAgICBlbHNlCisgICAgICAg
ICAgICAvKiBCYWQgZmVhdHVyZXNldCBpbmRleD8gKi8KKyAgICAgICAgICAgIHJldCA9IC1FSU5W
QUw7CisKKyAgICAgICAgaWYgKCAhcmV0ICkKICAgICAgICAgICAgIGNwdWlkX3BvbGljeV90b19m
ZWF0dXJlc2V0KHAsIGZlYXR1cmVzZXQpOwogCiAgICAgICAgIC8qIENvcHkgdGhlIHJlcXVlc3Rl
ZCBmZWF0dXJlc2V0IGludG8gcGxhY2UuICovCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvc3lzY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKaW5kZXggNGRmYmEzOWVk
OC4uM2Q3MmZhYjQ5ZiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCisr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaApAQCAtNzk2LDYgKzc5Niw4IEBAIHN0cnVj
dCB4ZW5fc3lzY3RsX2NwdV9sZXZlbGxpbmdfY2FwcyB7CiAgKiAgLSBIb3N0OiBUaGUgdmFsdWVz
IFhlbiBpcyB1c2luZywgKGFmdGVyIGNvbW1hbmQgbGluZSBvdmVycmlkZXMsIGV0YykuCiAgKiAg
LSAgIFBWOiBNYXhpbXVtIHNldCBvZiBmZWF0dXJlcyB3aGljaCBjYW4gYmUgZ2l2ZW4gdG8gYSBQ
ViBndWVzdC4KICAqICAtICBIVk06IE1heGltdW0gc2V0IG9mIGZlYXR1cmVzIHdoaWNoIGNhbiBi
ZSBnaXZlbiB0byBhIEhWTSBndWVzdC4KKyAqIE1heSBmYWlsIHdpdGggLUVPUE5PVFNVUFAgaWYg
cXVlcnlpbmcgZm9yIFBWIG9yIEhWTSBkYXRhIHdoZW4gc3VwcG9ydCBpcworICogY29tcGlsZWQg
b3V0IG9mIFhlbi4KICAqLwogc3RydWN0IHhlbl9zeXNjdGxfY3B1X2ZlYXR1cmVzZXQgewogI2Rl
ZmluZSBYRU5fU1lTQ1RMX2NwdV9mZWF0dXJlc2V0X3JhdyAgICAgIDAKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
