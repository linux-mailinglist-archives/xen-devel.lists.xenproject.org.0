Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B89E98B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 15:36:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2bbA-0004PH-2P; Tue, 27 Aug 2019 13:33:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8wY6=WX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i2bb8-0004Ok-6z
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:33:22 +0000
X-Inumbo-ID: 3777dac0-c8cf-11e9-ac23-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3777dac0-c8cf-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566912792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5CoqJCQiLnVu+dsWN0Ou8DoSb81hsrlnHmMIXfN/N8w=;
 b=Z1dTidY3qNzn8Q3fBC81ThKeulJ9+7PeqeopqOBokRX5lW6hkNKdVDeC
 cOr6dPTajt7E2fulzrwpjVRZw7uiwJ0A4KIahNaTzRYI1m5xcLc1jIkwk
 UejCSqxA3dcN4Du32PvQAIToZ7Jz4VGfXC+BquNbxGS42gJZ/Dvm7a12q o=;
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
IronPort-SDR: GW8W5dlZtUCLO1Vzx2t4NsAYwjqY6hvEaixyskr+gUrAyyxApEOGhLt2RAvLY7lTiU3ZQ2ZK1U
 PzWSQGmayvN9+al2cizXAQiZhOvKvLOaSx+YeesjOCyRNFnP7kAaShNhuqDMhEFkl0Va1hYMwj
 6eHsNra41WDXZCmwUkvTe/EkkMiyqCCY6NkrYNQ2UJJwhpUrvVAF44rSOxifUwyHBeVmiEWDmx
 KAfcLAlTc2MyXw5fe1VdsnCtmSoXLjLpDhARvUAAYYDjGYS6kHuX5xLyBvc08GHm312dPB+Swn
 k4A=
X-SBRS: 2.7
X-MesageID: 4987743
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4987743"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 27 Aug 2019 14:32:58 +0100
Message-ID: <20190827133259.32084-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827133259.32084-1-anthony.perard@citrix.com>
References: <20190827133259.32084-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 3/4] xen-bus: Fix backend state transition on
 device reset
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhIGZyb250ZW5kIHdhbnRzIHRvIHJlc2V0IGl0cyBzdGF0ZSBhbmQgdGhlIGJhY2tlbmQg
b25lLCBpdApzdGFydHMgd2l0aCBzZXR0aW5nICJDbG9zaW5nIiwgdGhlbiB3YWl0cyBmb3IgdGhl
IGJhY2tlbmQgKFFFTVUpIHRvIGRvCnRoZSBzYW1lLgoKQnV0IHdoZW4gUUVNVSBpcyBzZXR0aW5n
ICJDbG9zaW5nIiB0byBpdHMgc3RhdGUsIGl0IHRyaWdnZXJzIGFuIGV2ZW50Cih4ZW5zdG9yZSB3
YXRjaCkgdGhhdCByZS1leGVjdXRlIHhlbl9kZXZpY2VfYmFja2VuZF9jaGFuZ2VkKCkgYW5kIHNl
dAp0aGUgYmFja2VuZCBzdGF0ZSB0byAiQ2xvc2VkIi4gUUVNVSBzaG91bGQgd2FpdCBmb3IgdGhl
IGZyb250ZW5kIHRvCnNldCAiQ2xvc2VkIiBiZWZvcmUgZG9pbmcgdGhlIHNhbWUuCgpCZWZvcmUg
c2V0dGluZyAiQ2xvc2VkIiB0byB0aGUgYmFja2VuZF9zdGF0ZSwgd2UgYXJlIGFsc28gZ29pbmcg
dG8KY2hlY2sgaWYgdGhlcmUgaXMgYSBmcm9udGVuZC4gSWYgdGhhdCB0aGUgY2FzZSwgd2hlbiB0
aGUgYmFja2VuZCBzdGF0ZQppcyBzZXQgdG8gIkNsb3NpbmciIHRoZSBmcm9udGVuZCBzaG91bGQg
cmVhY3QgYW5kIHNldHMgaXRzIHN0YXRlIHRvCiJDbG9zaW5nIiB0aGVuICJDbG9zZWQiLiBUaGUg
YmFja2VuZCBzaG91bGQgd2FpdCBmb3IgdGhhdCB0byBoYXBwZW4uCgpGaXhlczogYjZhZjg5MjZm
Yjg1OGM0ZjE0MjZlNWFjYjJjZmMxZjA1ODBlYzk4YQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDE5MDgyMzEwMTUzNC40
NjUtMi1hbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIGh3L3hlbi94ZW4tYnVzLmMgfCAy
MyArKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbi1idXMuYyBiL2h3L3hl
bi94ZW4tYnVzLmMKaW5kZXggZTQwNTAwMjQyZC4uNjJjMTI3YjkyNiAxMDA2NDQKLS0tIGEvaHcv
eGVuL3hlbi1idXMuYworKysgYi9ody94ZW4veGVuLWJ1cy5jCkBAIC01MTYsNiArNTE2LDIzIEBA
IHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfYmFja2VuZF9zZXRfb25saW5lKFhlbkRldmljZSAqeGVu
ZGV2LCBib29sIG9ubGluZSkKICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhlbmRldiwg
Im9ubGluZSIsICIldSIsIG9ubGluZSk7CiB9CiAKKy8qCisgKiBUZWxsIGZyb20gdGhlIHN0YXRl
IHdoZXRoZXIgdGhlIGZyb250ZW5kIGlzIGxpa2VseSBhbGl2ZSwKKyAqIGkuZS4gaXQgd2lsbCBy
ZWFjdCB0byBhIGNoYW5nZSBvZiBzdGF0ZSBvZiB0aGUgYmFja2VuZC4KKyAqLworc3RhdGljIGJv
b2wgeGVuX2RldmljZV9zdGF0ZV9pc19hY3RpdmUoZW51bSB4ZW5idXNfc3RhdGUgc3RhdGUpCit7
CisgICAgc3dpdGNoIChzdGF0ZSkgeworICAgIGNhc2UgWGVuYnVzU3RhdGVJbml0V2FpdDoKKyAg
ICBjYXNlIFhlbmJ1c1N0YXRlSW5pdGlhbGlzZWQ6CisgICAgY2FzZSBYZW5idXNTdGF0ZUNvbm5l
Y3RlZDoKKyAgICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKKyAgICAgICAgcmV0dXJuIHRydWU7
CisgICAgZGVmYXVsdDoKKyAgICAgICAgcmV0dXJuIGZhbHNlOworICAgIH0KK30KKwogc3RhdGlj
IHZvaWQgeGVuX2RldmljZV9iYWNrZW5kX2NoYW5nZWQodm9pZCAqb3BhcXVlKQogewogICAgIFhl
bkRldmljZSAqeGVuZGV2ID0gb3BhcXVlOwpAQCAtNTM5LDExICs1NTYsMTEgQEAgc3RhdGljIHZv
aWQgeGVuX2RldmljZV9iYWNrZW5kX2NoYW5nZWQodm9pZCAqb3BhcXVlKQogCiAgICAgLyoKICAg
ICAgKiBJZiB0aGUgdG9vbHN0YWNrIChvciB1bnBsdWcgcmVxdWVzdCBjYWxsYmFjaykgaGFzIHNl
dCB0aGUgYmFja2VuZAotICAgICAqIHN0YXRlIHRvIENsb3NpbmcsIGJ1dCB0aGVyZSBpcyBubyBh
Y3RpdmUgZnJvbnRlbmQgKGkuZS4gdGhlCi0gICAgICogc3RhdGUgaXMgbm90IENvbm5lY3RlZCkg
dGhlbiBzZXQgdGhlIGJhY2tlbmQgc3RhdGUgdG8gQ2xvc2VkLgorICAgICAqIHN0YXRlIHRvIENs
b3NpbmcsIGJ1dCB0aGVyZSBpcyBubyBhY3RpdmUgZnJvbnRlbmQgdGhlbiBzZXQgdGhlCisgICAg
ICogYmFja2VuZCBzdGF0ZSB0byBDbG9zZWQuCiAgICAgICovCiAgICAgaWYgKHhlbmRldi0+YmFj
a2VuZF9zdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NpbmcgJiYKLSAgICAgICAgeGVuZGV2LT5mcm9u
dGVuZF9zdGF0ZSAhPSBYZW5idXNTdGF0ZUNvbm5lY3RlZCkgeworICAgICAgICAheGVuX2Rldmlj
ZV9zdGF0ZV9pc19hY3RpdmUoc3RhdGUpKSB7CiAgICAgICAgIHhlbl9kZXZpY2VfYmFja2VuZF9z
ZXRfc3RhdGUoeGVuZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7CiAgICAgfQogCi0tIApBbnRob255
IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
