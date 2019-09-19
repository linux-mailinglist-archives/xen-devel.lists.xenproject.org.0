Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F1B803C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0QY-0004Qj-H4; Thu, 19 Sep 2019 17:41:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0QW-0004Os-5x
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:08 +0000
X-Inumbo-ID: a4c8820e-db04-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4c8820e-db04-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yMkoyQJsVoTpLNhCoQP/lLHBUZYMQj1kOvYaINRWLG4=;
 b=Aws0ABcfhi6+BIkFoJ+EiNadq3cCSOsIF0Bf0hXf8/+C9UwXY6KOi5jg
 4deSHYS6W4qVqqy/6hklqCxvmXlEHHKnTtfEUQBt5MEY4yy0zQyRxMz8O
 J4ETDoDzC3tvcJ3jgtfmtu7URJoPEeUVD7TEQTJ5W16uOsUkhyQTKkmyG s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IFlyovukdGqWVInKeV5wKnNXWuROLj/O6XJd7RNRFBAenOhtsaPfBLaV47XCI68q2aLNWWIe29
 sgpfnctBtY3fUapGvvlSD4UOy8Ph6HFX5+R06xEuVX8U6YjqNj7vaVjO8FrZPcqxZYDxO7phBw
 lY2UqrAQj30j6WLC4kSBEAnaUYX5L6aOAGT/fb44UQ6jfG/rSFMhQ57B+WeO25OAfqR7Dm/lmB
 47J5mLFAFf76oNpI5dkOwZNquKLrfGh9Vsti68WaXmGD+zSKTEnNOi94HyTmDW3nsIhsj2ACqU
 S0g=
X-SBRS: 2.7
X-MesageID: 5864905
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5864905"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:54 +0100
Message-ID: <20190919171656.899649-35-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 34/35] libxl: libxl_qemu_monitor_command now
 uses ev_qmp
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

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX3FtcC5jCmluZGV4IDk2MzlkNDkxZDk5MS4uOWFhYmFkNzRmYWJkIDEwMDY0NAotLS0g
YS90b29scy9saWJ4bC9saWJ4bF9xbXAuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwpA
QCAtODkyLDE5ICs4OTIsNjcgQEAgaW50IGxpYnhsX19xbXBfaG1wKGxpYnhsX19nYyAqZ2MsIGlu
dCBkb21pZCwgY29uc3QgY2hhciAqY29tbWFuZF9saW5lLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaG1wX2NhbGxiYWNrLCBvdXRwdXQpOwogfQogCisKK3R5cGVkZWYgc3RydWN0IHsKKyAg
ICBsaWJ4bF9fZXZfcW1wIHFtcDsKKyAgICBjaGFyICoqb3V0cHV0OyAvKiB1c2VyIHBvaW50ZXIg
Ki8KK30gcWVtdV9tb25pdG9yX2NvbW1hbmRfc3RhdGU7CisKK3N0YXRpYyB2b2lkIHFlbXVfbW9u
aXRvcl9jb21tYW5kX2RvbmUobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfcW1wICosCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAq
cmVzcG9uc2UsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYyk7
CisKIGludCBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZChsaWJ4bF9jdHggKmN0eCwgdWludDMy
X3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqY29t
bWFuZF9saW5lLCBjaGFyICoqb3V0cHV0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IGxpYnhsX2FzeW5jb3BfaG93ICphb19ob3cpCiB7CiAgICAgQU9fQ1JFQVRFKGN0eCwg
ZG9taWQsIGFvX2hvdyk7CisgICAgcWVtdV9tb25pdG9yX2NvbW1hbmRfc3RhdGUgKnFtY3M7Cisg
ICAgbGlieGxfX2pzb25fb2JqZWN0ICphcmdzID0gTlVMTDsKICAgICBpbnQgcmM7CiAKLSAgICBy
YyA9IGxpYnhsX19xbXBfaG1wKGdjLCBkb21pZCwgY29tbWFuZF9saW5lLCBvdXRwdXQpOworICAg
IGlmICghb3V0cHV0KSB7CisgICAgICAgIHJjID0gRVJST1JfSU5WQUw7CisgICAgICAgIGdvdG8g
b3V0OworICAgIH0KIAotICAgIGxpYnhsX19hb19jb21wbGV0ZShlZ2MsIGFvLCByYyk7CisgICAg
R0NORVcocW1jcyk7CisgICAgbGlieGxfX2V2X3FtcF9pbml0KCZxbWNzLT5xbXApOworICAgIHFt
Y3MtPnFtcC5hbyA9IGFvOworICAgIHFtY3MtPnFtcC5kb21pZCA9IGRvbWlkOworICAgIHFtY3Mt
PnFtcC5wYXlsb2FkX2ZkID0gLTE7CisgICAgcW1jcy0+cW1wLmNhbGxiYWNrID0gcWVtdV9tb25p
dG9yX2NvbW1hbmRfZG9uZTsKKyAgICBxbWNzLT5vdXRwdXQgPSBvdXRwdXQ7CisgICAgbGlieGxf
X3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgImNvbW1hbmQtbGluZSIsIGNvbW1hbmRf
bGluZSk7CisgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsICZxbWNzLT5xbXAsICJodW1h
bi1tb25pdG9yLWNvbW1hbmQiLCBhcmdzKTsKK291dDoKKyAgICBpZiAocmMpIHJldHVybiBBT19D
UkVBVEVfRkFJTChyYyk7CiAgICAgcmV0dXJuIEFPX0lOUFJPR1JFU1M7CiB9CiAKK3N0YXRpYyB2
b2lkIHFlbXVfbW9uaXRvcl9jb21tYW5kX2RvbmUobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZf
cW1wICpxbXAsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxp
YnhsX19qc29uX29iamVjdCAqcmVzcG9uc2UsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCByYykKK3sKKyAgICBTVEFURV9BT19HQyhxbXAtPmFvKTsKKyAgICBxZW11
X21vbml0b3JfY29tbWFuZF9zdGF0ZSAqcW1jcyA9IENPTlRBSU5FUl9PRihxbXAsICpxbWNzLCBx
bXApOworCisgICAgaWYgKHJjKSBnb3RvIG91dDsKKworICAgIGlmICghbGlieGxfX2pzb25fb2Jq
ZWN0X2lzX3N0cmluZyhyZXNwb25zZSkpIHsKKyAgICAgICAgcmMgPSBFUlJPUl9RRU1VX0FQSTsK
KyAgICAgICAgTE9HRChFUlJPUiwgcW1wLT5kb21pZCwgIlJlc3BvbnNlIGhhcyB1bmV4cGVjdGVk
IGZvcm1hdCIpOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICAqKHFtY3MtPm91dHB1
dCkgPQorICAgICAgICBsaWJ4bF9fc3RyZHVwKE5PR0MsIGxpYnhsX19qc29uX29iamVjdF9nZXRf
c3RyaW5nKHJlc3BvbnNlKSk7CisgICAgcmMgPSAwOworCitvdXQ6CisgICAgbGlieGxfX2V2X3Ft
cF9kaXNwb3NlKGdjLCBxbXApOworICAgIGxpYnhsX19hb19jb21wbGV0ZShlZ2MsIGFvLCByYyk7
Cit9CiAKIC8qCiAgKiBGdW5jdGlvbnMgdXNpbmcgbGlieGxfX2V2X3FtcAotLSAKQW50aG9ueSBQ
RVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
