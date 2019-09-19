Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BFB771F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 12:06:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAtIC-0007sq-H2; Thu, 19 Sep 2019 10:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAtIA-0007sM-AE
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 10:04:02 +0000
X-Inumbo-ID: cd3a002c-dac4-11e9-9652-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd3a002c-dac4-11e9-9652-12813bfff9fa;
 Thu, 19 Sep 2019 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568887440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RFaNCsSNiuwizURXDMM7ff2qNezNkr/OhwAzlqhjsGA=;
 b=DEnlGeeo8Ywk6jR01WiDpjC0ot9LZXjJec4/Xcj2MI1Cw756QQbKm5Oc
 0f6mFlredh4wIrOEvkVLPLr41w1t9nxfqWfMj/1qEuDklpBVjZLYcQSt0
 fkFomorfgSgi1vusp66MIx8mrBrSvGfuyHLCw3vKEpOO1FG/7OoPEY/Vy s=;
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
IronPort-SDR: /s5GsSB1xbFaIAj8OAme0DSyTEHEpYdimBiKkUbtN4J41B0S4/rXbL22m2B2JIiL98B/E+i/I7
 bNtJ8eBnqJuCEiZO1PWNe5aPB5Y8TYknSluNoiDuetv0kz5wM9wh2RJZxcT7rJPxXz8bqbwk0f
 heRjTWW6LuGzJg19HZKwoWtnA+GLuQUEphEiiaxMeLr9HSTxvghb4Bf4PUPSSJrL+pjYCqcVMo
 y/zSsbqVob1ERpxkfOvQkrO8TeCOPZySoXCTCyAnsGI3uJbCgGCdttuPrOywqhE4IDxBgXKx6i
 4B4=
X-SBRS: 2.7
X-MesageID: 5981864
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5981864"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 11:03:34 +0100
Message-ID: <20190919100334.790782-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <23938.2413.911345.500080@mariner.uk.xensource.com>
References: <23938.2413.911345.500080@mariner.uk.xensource.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 11/15] libxl_usb: Fix wrong usage of asserts
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVwbGFjZSB0aGUgYXNzZXJ0KDApIGJ5IGFib3J0KCkgc2luY2UgdGhlIGludGVudGlvbiBpbiBs
aWJ4bCBpcyB0aGF0CmFzc2VydHMgYXJlIGFsd2F5cyBjb21waWxlZCBpbi4gVGhpcyBwYXRjaCBt
YWtlcyBpdHMgY2xlYXIgYW5kIHJlbW92ZXMKdGhlIG5lZWQgdG8gZGVhbCB3aXRoIGFzc2VydHMg
YmVlbiBjb21waWxlZCBvdXQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHYyOgogICAgLSByZXBsYWNlIGFz
c2VydHMgYnkgYWJvcnQoKS4KCiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyB8IDYgKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3VzYi5jIGIvdG9vbHMvbGlieGwvbGlieGxfdXNiLmMKaW5k
ZXggM2QzODljMDE5ODIyLi45ZjcyODU3ZDg3YWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3VzYi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3VzYi5jCkBAIC0xNDcsOCArMTQ3LDcg
QEAgc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX2Zyb21fdXNiY3RybChsaWJ4bF9fZ2MgKmdjLCB1
aW50MzJfdCBkb21pZCwKICAgICAgICAgZGV2aWNlLT5iYWNrZW5kX2tpbmQgPSBMSUJYTF9fREVW
SUNFX0tJTkRfTk9ORTsKICAgICAgICAgYnJlYWs7CiAgICAgZGVmYXVsdDoKLSAgICAgICAgYXNz
ZXJ0KDApOyAvKiBjYW4ndCByZWFsbHkgaGFwcGVuLiAqLwotICAgICAgICBicmVhazsKKyAgICAg
ICAgYWJvcnQoKTsgLyogY2FuJ3QgcmVhbGx5IGhhcHBlbi4gKi8KICAgICB9CiAgICAgZGV2aWNl
LT5kZXZpZCAgICAgICAgICAgPSB1c2JjdHJsLT5kZXZpZDsKICAgICBkZXZpY2UtPmRvbWlkICAg
ICAgICAgICA9IGRvbWlkOwpAQCAtMzcwLDggKzM2OSw3IEBAIHN0YXRpYyBpbnQgbGlieGxfX2Rl
dmljZV91c2JjdHJsX2FkZF9odm0obGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCiAgICAg
ICAgIGZsZXhhcnJheV9hcHBlbmRfcGFpcihxbXBfYXJncywgInAzIiwgR0NTUFJJTlRGKCIlZCIs
IHVzYmN0cmwtPnBvcnRzKSk7CiAgICAgICAgIGJyZWFrOwogICAgIGRlZmF1bHQ6Ci0gICAgICAg
IGFzc2VydCgwKTsgLyogU2hvdWxkIG5vdCBiZSBwb3NzaWJsZS4gKi8KLSAgICAgICAgYnJlYWs7
CisgICAgICAgIGFib3J0KCk7IC8qIFNob3VsZCBub3QgYmUgcG9zc2libGUuICovCiAgICAgfQog
CiAgICAgZmxleGFycmF5X2FwcGVuZF9wYWlyKHFtcF9hcmdzLCAiaWQiLAotLSAKQW50aG9ueSBQ
RVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
