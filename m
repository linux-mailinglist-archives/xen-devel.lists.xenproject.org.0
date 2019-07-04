Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A65FA69
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Bk-0006DD-Kt; Thu, 04 Jul 2019 14:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Bi-0006BK-Fb
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:18 +0000
X-Inumbo-ID: 26a309d2-9e6c-11e9-a2e2-3f9453bbc94b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26a309d2-9e6c-11e9-a2e2-3f9453bbc94b;
 Thu, 04 Jul 2019 14:58:15 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8mx8ozuIJMQI/wlv4Ud0vpLKaFr9r267d1IJ43XJoxoGC84KkG8gKcPMOOgcvWK9aVXnGe7X4a
 48In/9K61OnMFuROEKlR8vWxDM4UY9iShvfx31V8nBA2dT82d34M4LfNdyRz0VkoS01768wie/
 Z/KNrvAizqeZScFfXJc2gAHiL41Y56v8vYZbySyBJ4nKgP0B2sXtR8hYIjWiFXFLW867QVX9Um
 OLTdRiuS7EdioUK0DSL+0cDwSz1sv5SkB3Ihx7kShoNiFT0q5XTgS2yZousLwlpQ/dRNn7I9HU
 WYE=
X-SBRS: 2.7
X-MesageID: 2626064
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2626064"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:14 +0100
Message-ID: <20190704144233.27968-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 16/35] OvmfPkg/XenHypercallLib: Enable it in
 PEIM
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsb3cgdG8gdXNlIFhlbiBoeXBlcmNhbGxzIGVhcmxpZXIsIGR1cmluZyB0aGUgUEVJTSBzdGFn
ZSwgYnV0Clhlbkh5cGVyY2FsbExpYkluaXQoKSBtdXN0IGJlIGNhbGxlZCBvbmNlIHRoZSBYZW5J
bmZvIEhPQiBpcyBjcmVhdGVkCndpdGggdGhlIEh5cGVyUGFnZSBzZXR1cC4KCkNoYW5nZSB0aGUg
cmV0dXJuIHZhbHVlIG9mIFhlbkh5cGVyY2FsbExpYkluaXQgc28gZmFpbHVyZSBjYW4gYmUKZGV0
ZWN0ZWQgd2hlbiB0aGUgY2FsbCBzaG91bGRuJ3QgZmFpbCwgYnV0IHN0aWxsIGhhdmUgdGhlIGNv
bnN0cnVjdG9yCmFsd2F5cyBzdWNjZWVkLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29y
ZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoKICAgIC0gb25s
eSBtb2RpZnkgWGVuSHlwZXJjYWxsTGliLCBhbmQgdG8gdGhlIG1vZGlmaWNhdGlvbiBvZiBYZW5Q
bGF0Zm9ybVBlaQogICAgICBpbiBhIHNlcGFyYXRlZCBwYXRjaC4KICAgIC0gQWxsb3cgWGVuSHlw
ZXJjYWxsTGliSW5pdCB0byBiZSBjYWxsZWQgb3V0c2lkZSB0aGUgbGlicmFyeSBpbnN0ZWFkIG9m
CiAgICAgIGNyZWF0aW5nIGEgbmV3IGZ1bmN0aW9uLCBidXQgYWxzbyByZXR1cm4gZmFpbHVyZSBv
biBmYWlsdXJlLAogICAgICBhbmQgaGF2ZSBhIG5ldyBjb25zdHJ1Y3RvciB0aGF0IG5ldmVyIGZh
aWwuCgogLi4uL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1hlbkh5cGVyY2FsbExpYi5pbmYgIHwg
IDQgKystLQogT3ZtZlBrZy9JbmNsdWRlL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliLmggICAgICAg
IHwgMTIgKysrKysrKysrKysrCiAuLi4vTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWDg2WGVuSHlw
ZXJjYWxsLmMgICAgfCAgOCArLS0tLS0tLQogT3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExp
Yi9YZW5IeXBlcmNhbGwuYyAgIHwgMTYgKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2Vk
LCAzMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cv
TGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWGVuSHlwZXJjYWxsTGliLmluZiBiL092bWZQa2cvTGli
cmFyeS9YZW5IeXBlcmNhbGxMaWIvWGVuSHlwZXJjYWxsTGliLmluZgppbmRleCAxMjA4ZjAwNTdh
Li4yMWNlNWI0NDM0IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGli
L1hlbkh5cGVyY2FsbExpYi5pbmYKKysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExp
Yi9YZW5IeXBlcmNhbGxMaWIuaW5mCkBAIC0xMiwxMCArMTIsMTAgQEAgW0RlZmluZXNdCiAgIEZJ
TEVfR1VJRCAgICAgICAgICAgICAgICAgICAgICA9IEI1RUU5QTMyLUNBNUEtNDlBOC04MkUzLUFE
QTRDQ0I3N0M3Qw0KICAgTU9EVUxFX1RZUEUgICAgICAgICAgICAgICAgICAgID0gQkFTRQ0KICAg
VkVSU0lPTl9TVFJJTkcgICAgICAgICAgICAgICAgID0gMS4wDQotICBDT05TVFJVQ1RPUiAgICAg
ICAgICAgICAgICAgICAgPSBYZW5IeXBlcmNhbGxMaWJJbml0DQorICBDT05TVFJVQ1RPUiAgICAg
ICAgICAgICAgICAgICAgPSBYZW5IeXBlcmNhbGxMaWJDb25zdHJ1Y3QNCiANCiBbRGVmaW5lcy5J
QTMyLCBEZWZpbmVzLlg2NF0NCi0gIExJQlJBUllfQ0xBU1MgICAgICAgICAgICAgICAgICA9IFhl
bkh5cGVyY2FsbExpYnxEWEVfRFJJVkVSIFVFRklfRFJJVkVSDQorICBMSUJSQVJZX0NMQVNTICAg
ICAgICAgICAgICAgICAgPSBYZW5IeXBlcmNhbGxMaWJ8UEVJTSBEWEVfRFJJVkVSIFVFRklfRFJJ
VkVSDQogDQogW0RlZmluZXMuQVJNLCBEZWZpbmVzLkFBUkNINjRdDQogICBMSUJSQVJZX0NMQVNT
ICAgICAgICAgICAgICAgICAgPSBYZW5IeXBlcmNhbGxMaWINCmRpZmYgLS1naXQgYS9Pdm1mUGtn
L0luY2x1ZGUvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIuaCBiL092bWZQa2cvSW5jbHVkZS9MaWJy
YXJ5L1hlbkh5cGVyY2FsbExpYi5oCmluZGV4IGM0MzgyMjc4MmIuLmMxNDkxZGQ2NTIgMTAwNjQ0
Ci0tLSBhL092bWZQa2cvSW5jbHVkZS9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi5oCisrKyBiL092
bWZQa2cvSW5jbHVkZS9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi5oCkBAIC0xMCw2ICsxMCwxOCBA
QAogI2lmbmRlZiBfX1hFTl9IWVBFUkNBTExfTElCX0hfXw0KICNkZWZpbmUgX19YRU5fSFlQRVJD
QUxMX0xJQl9IX18NCiANCisvKioNCisgIFRvIGNhbGwgd2hlbiB0aGUgZ0VmaVhlbkluZm9HdWlk
IEhPQiBiZWNhbWUgYXZhaWxhYmxlIGFmdGVyIHRoZSBsaWJyYXJ5IGluaXQNCisgIGZ1bmN0aW9u
IGhhcyBhbHJlYWR5IGJlZW4gZXhlY3V0ZWQuDQorDQorICBUaGlzIGFsbG93IHRvIG1ha2UgaHlw
ZXJjYWxsIGluIHRoZSBQRUlNIHN0YWdlLg0KKyoqLw0KK1JFVFVSTl9TVEFUVVMNCitFRklBUEkN
CitYZW5IeXBlcmNhbGxMaWJJbml0ICgNCisgIFZPSUQNCisgICk7DQorDQogLyoqDQogICBDaGVj
ayBpZiB0aGUgWGVuIEh5cGVyY2FsbCBsaWJyYXJ5IGlzIGFibGUgdG8gbWFrZSBjYWxscyB0byB0
aGUgWGVuDQogICBoeXBlcnZpc29yLg0KZGlmZiAtLWdpdCBhL092bWZQa2cvTGlicmFyeS9YZW5I
eXBlcmNhbGxMaWIvWDg2WGVuSHlwZXJjYWxsLmMgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJj
YWxsTGliL1g4Nlhlbkh5cGVyY2FsbC5jCmluZGV4IDI3MDgzZjkyNGYuLmY3NzllNDY0NzAgMTAw
NjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWDg2WGVuSHlwZXJjYWxs
LmMKKysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YODZYZW5IeXBlcmNhbGwu
YwpAQCAtNTksMTMgKzU5LDcgQEAgWGVuSHlwZXJjYWxsTGliSW5pdCAoCiANCiAgIEd1aWRIb2Ig
PSBHZXRGaXJzdEd1aWRIb2IgKCZnRWZpWGVuSW5mb0d1aWQpOw0KICAgaWYgKEd1aWRIb2IgPT0g
TlVMTCkgew0KLSAgICAvLw0KLSAgICAvLyBXZSBkb24ndCBmYWlsIGxpYnJhcnkgY29uc3RydWN0
aW9uLCBzaW5jZSB0aGF0IGhhcyBjYXRhc3Ryb3BoaWMNCi0gICAgLy8gY29uc2VxdWVuY2VzIGZv
ciBjbGllbnQgbW9kdWxlcyAod2hlcmVhcyB0aG9zZSBtb2R1bGVzIG1heSBlYXNpbHkgYmUNCi0g
ICAgLy8gcnVubmluZyBvbiBhIG5vbi1YZW4gcGxhdGZvcm0pLiBJbnN0ZWFkLCBYZW5IeXBlcmNh
bGxJc0F2YWlsYWJsZSgpIGFib3ZlDQotICAgIC8vIHdpbGwgcmV0dXJuIEZBTFNFLg0KLSAgICAv
Lw0KLSAgICByZXR1cm4gUkVUVVJOX1NVQ0NFU1M7DQorICAgIHJldHVybiBSRVRVUk5fTk9UX0ZP
VU5EOw0KICAgfQ0KICAgWGVuSW5mbyA9IChFRklfWEVOX0lORk8gKikgR0VUX0dVSURfSE9CX0RB
VEEgKEd1aWRIb2IpOw0KICAgSHlwZXJQYWdlID0gWGVuSW5mby0+SHlwZXJQYWdlczsNCmRpZmYg
LS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1hlbkh5cGVyY2FsbC5jIGIv
T3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YZW5IeXBlcmNhbGwuYwppbmRleCBhMmM0
MWEyYTY5Li5kNGZhODAyNzQzIDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJj
YWxsTGliL1hlbkh5cGVyY2FsbC5jCisrKyBiL092bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxM
aWIvWGVuSHlwZXJjYWxsLmMKQEAgLTE1LDYgKzE1LDIyIEBACiAjaW5jbHVkZSA8TGlicmFyeS9E
ZWJ1Z0xpYi5oPg0KICNpbmNsdWRlIDxMaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi5oPg0KIA0KK1JF
VFVSTl9TVEFUVVMNCitFRklBUEkNCitYZW5IeXBlcmNhbGxMaWJDb25zdHJ1Y3QgKA0KKyAgVk9J
RA0KKyAgKQ0KK3sNCisgIFhlbkh5cGVyY2FsbExpYkluaXQgKCk7DQorICAvLw0KKyAgLy8gV2Ug
ZG9uJ3QgZmFpbCBsaWJyYXJ5IGNvbnN0cnVjdGlvbiwgc2luY2UgdGhhdCBoYXMgY2F0YXN0cm9w
aGljDQorICAvLyBjb25zZXF1ZW5jZXMgZm9yIGNsaWVudCBtb2R1bGVzICh3aGVyZWFzIHRob3Nl
IG1vZHVsZXMgbWF5IGVhc2lseSBiZQ0KKyAgLy8gcnVubmluZyBvbiBhIG5vbi1YZW4gcGxhdGZv
cm0pLiBJbnN0ZWFkLCBYZW5IeXBlcmNhbGxJc0F2YWlsYWJsZSgpDQorICAvLyB3aWxsIHJldHVy
biBGQUxTRS4NCisgIC8vDQorICByZXR1cm4gUkVUVVJOX1NVQ0NFU1M7DQorfQ0KKw0KIFVJTlQ2
NA0KIEVGSUFQSQ0KIFhlbkh5cGVyY2FsbEh2bUdldFBhcmFtICgNCi0tIApBbnRob255IFBFUkFS
RAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
