Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A5B7FEB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:22:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB03M-0000uw-JM; Thu, 19 Sep 2019 17:17:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB03L-0000ua-8W
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:17:11 +0000
X-Inumbo-ID: 4cc3c9f4-db01-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cc3c9f4-db01-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 17:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568913424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5lXH6LoQMSLoUqlZd8iS2EJBv9405IMHRGZeH3BV5dI=;
 b=eHxTjhDoDIS4wY37/rcBH0ioSYaNWyVKI2d6ZFfvBtg+osQvcRkHZL7l
 5BHWBlObQKHHHYg32yBmV3cxzUaZJQwfhVTfnszO6bF9zqolGASp4KAS5
 2P5qLX61mXfbhwPemOwPTiKW+H0BjBdInI79i/RJdV77TPhrfWy5/o2uH I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Cwu3crThgW2bcZGD4ePVaDfxsBOXl1n5/hNwPoX71Nwig6MXm0zhTkQcC3PStojCOSHvwEPhV+
 N1xUXc67Qqz7w+oM1HKbP6+XuQ+g2beOklt6ZEowiswtQjexgKK1/Za0KvrES2x4SQMT8ZjmY2
 Q1CEN+JNQG2hiJEf9lTyts59q5I3A9KFCnQIh98vZ0QHTeulPai3SthIHg3YqiU3iJFF5Xl8lE
 9DKe3sVXm+TDBQ4NeB3t/+g9XvVmsP6qeLGyt+7BBLFQ5ilmEqw7Pg3G6fVfBG3uRI2q2YGOx6
 IQI=
X-SBRS: 2.7
X-MesageID: 6009422
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6009422"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:25 +0100
Message-ID: <20190919171656.899649-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 05/35] libxl: Make libxl_qemu_monitor_command
 async
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYmVjYXVzZSBpdCBtYWtlcyBRTVAgY2FsbHMgd2hpY2ggYXJlIGdvaW5nIHRvIGJlIGFzeW5j
LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CiB0b29scy9saWJ4bC9saWJ4bC5oICAgICB8IDE0ICsrKysrKysrKysrKystCiB0b29scy9saWJ4
bC9saWJ4bF9xbXAuYyB8ICA5ICsrKysrLS0tLQogdG9vbHMveGwveGxfbWlzYy5jICAgICAgfCAg
MiArLQogMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4bC5oCmlu
ZGV4IGZkMWUxMzQ5YmY2YS4uYmE0OGU3ZTkwMGQzIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKQEAgLTEyMjIsNiArMTIyMiw3IEBAIHZv
aWQgbGlieGxfbWFjX2NvcHkobGlieGxfY3R4ICpjdHgsIGxpYnhsX21hYyAqZHN0LCBjb25zdCBs
aWJ4bF9tYWMgKnNyYyk7CiAgKiAgIGxpYnhsX3NlbmRfdHJpZ2dlcigpCiAgKiAgIGxpYnhsX3Nl
dF92Y3B1b25saW5lKCkKICAqICAgbGlieGxfcmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb24o
KQorICogICBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZCgpCiAgKi8KICNkZWZpbmUgTElCWExf
SEFWRV9GTl9VU0lOR19RTVBfQVNZTkMgMQogCkBAIC0yNTcxLDcgKzI1NzIsMTggQEAgaW50IGxp
YnhsX2ZkX3NldF9ub25ibG9jayhsaWJ4bF9jdHggKmN0eCwgaW50IGZkLCBpbnQgbm9uYmxvY2sp
OwogICogdmlhIG91dHB1dC4KICAqLwogaW50IGxpYnhsX3FlbXVfbW9uaXRvcl9jb21tYW5kKGxp
YnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICpjb21tYW5kX2xpbmUsIGNoYXIgKipvdXRwdXQpOworICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmNvbW1hbmRfbGluZSwgY2hhciAqKm91
dHB1dCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9hc3luY29w
X2hvdyAqYW9faG93KQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIExJQlhMX0VYVEVS
TkFMX0NBTExFUlNfT05MWTsKKyNpZiBkZWZpbmVkKExJQlhMX0FQSV9WRVJTSU9OKSAmJiBMSUJY
TF9BUElfVkVSU0lPTiA8IDB4MDQxMzAwCitzdGF0aWMgaW5saW5lIGludCBsaWJ4bF9xZW11X21v
bml0b3JfY29tbWFuZF8weDA0MTIwMChsaWJ4bF9jdHggKmN0eCwKKyAgICB1aW50MzJfdCBkb21p
ZCwgY29uc3QgY2hhciAqY29tbWFuZF9saW5lLCBjaGFyICoqb3V0cHV0KQoreworICAgIHJldHVy
biBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZChjdHgsIGRvbWlkLCBjb21tYW5kX2xpbmUsIG91
dHB1dCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7Cit9Cisj
ZGVmaW5lIGxpYnhsX3FlbXVfbW9uaXRvcl9jb21tYW5kIGxpYnhsX3FlbXVfbW9uaXRvcl9jb21t
YW5kXzB4MDQxMjAwCisjZW5kaWYKIAogI2luY2x1ZGUgPGxpYnhsX2V2ZW50Lmg+CiAKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMK
aW5kZXggMjBkOWVlZDhkZGM4Li41MDVlMGU1NDY5YTkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX3FtcC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCkBAIC0xMjkxLDE1ICsx
MjkxLDE2IEBAIGludCBsaWJ4bF9fcW1wX2htcChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsIGNv
bnN0IGNoYXIgKmNvbW1hbmRfbGluZSwKIH0KIAogaW50IGxpYnhsX3FlbXVfbW9uaXRvcl9jb21t
YW5kKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICpjb21tYW5kX2xpbmUsIGNoYXIgKipvdXRwdXQpCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqY29tbWFuZF9saW5lLCBjaGFy
ICoqb3V0cHV0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2Fz
eW5jb3BfaG93ICphb19ob3cpCiB7Ci0gICAgR0NfSU5JVChjdHgpOworICAgIEFPX0NSRUFURShj
dHgsIGRvbWlkLCBhb19ob3cpOwogICAgIGludCByYzsKIAogICAgIHJjID0gbGlieGxfX3FtcF9o
bXAoZ2MsIGRvbWlkLCBjb21tYW5kX2xpbmUsIG91dHB1dCk7CiAKLSAgICBHQ19GUkVFOwotICAg
IHJldHVybiByYzsKKyAgICBsaWJ4bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOworICAgIHJl
dHVybiBBT19JTlBST0dSRVNTOwogfQogCiBpbnQgbGlieGxfX3FtcF9pbml0aWFsaXphdGlvbnMo
bGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCmRpZmYgLS1naXQgYS90b29scy94bC94bF9t
aXNjLmMgYi90b29scy94bC94bF9taXNjLmMKaW5kZXggNTBjODQzNjMzN2M5Li4yMGVkNjA1ZjRm
NDQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX21pc2MuYworKysgYi90b29scy94bC94bF9taXNj
LmMKQEAgLTIyOCw3ICsyMjgsNyBAQCBpbnQgbWFpbl9xZW11X21vbml0b3JfY29tbWFuZChpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCiAgICAgICAgIHJldHVybiBFWElUX0ZBSUxVUkU7CiAgICAgfQog
Ci0gICAgcmV0ID0gbGlieGxfcWVtdV9tb25pdG9yX2NvbW1hbmQoY3R4LCBkb21pZCwgY21kLCAm
b3V0cHV0KTsKKyAgICByZXQgPSBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZChjdHgsIGRvbWlk
LCBjbWQsICZvdXRwdXQsIE5VTEwpOwogICAgIGlmICghcmV0ICYmIG91dHB1dCkgewogICAgICAg
ICBwcmludGYoIiVzXG4iLCBvdXRwdXQpOwogICAgICAgICBmcmVlKG91dHB1dCk7Ci0tIApBbnRo
b255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
