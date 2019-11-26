Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E40410A0F2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:06:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcLD-0004eR-V8; Tue, 26 Nov 2019 15:01:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZcLC-0004dt-EV
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:01:22 +0000
X-Inumbo-ID: 99f68856-105d-11ea-b155-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99f68856-105d-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574780479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XTpne13jZyXChoxke6JgMqInbZkzpylkc23MV2INAss=;
 b=KdwGcSfJ/wKb6lHUTrPlJZ0621D4au3b5AgnnZQPIi6+sm6sk5mlrkz/
 Cj+k6JCRo0iGeUTW3qaV7+G/jA13JFfMuZz26xqE8mvsUSN3lZ27Sme7i
 TPD9XQJLb9St9IWjlMRDWx3/k/l+nfHBqBDyZZ6iEuAmauDNv//fqQUaj E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5H1qi8+vzRiB0AjznJwlApghEBYmPG75kJlGZ17I/wJBLgx1sI3GFWtAsYr5q+4bmlmSMLWHzK
 al1I/bMedh952yYX49qCpS+mEhJNBKbdx6VNqbFX6A5MJwlaF97j52u/yFGjIofjm45vAcgWfk
 t7ZqqxSpDrnoz440sP3DGxoALW6vDwj5sYoowGSP2hEBYl7DGACrfs1H+b0nIW6MqUMGPkfVkI
 /NtiuIYMUas/NJOJ0quvhExIz5tQfM2ZwHSF59mUQajlYXf+AIgwKPhzUg3pPqSAJn5jvpRgem
 3jg=
X-SBRS: 2.7
X-MesageID: 9263889
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9263889"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 15:01:11 +0000
Message-ID: <20191126150112.12704-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191126150112.12704-1-andrew.cooper3@citrix.com>
References: <20191126150112.12704-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] AMD/IOMMU: Always print IOMMU errors
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VW5oYW5kbGVkIElPTU1VIGVycm9ycyAoaS5lLiBub3QgSU9fUEFHRV9GQVVMVCkgc2hvdWxkIHN0
aWxsIGJlIHByaW50ZWQsIGFuZApub3QgaGlkZGVuIGJlaGluZCBpb21tdT1kZWJ1Zy4KCldoaWxl
IGFkanVzdGluZyB0aGlzLCBmYWN0b3Igb3V0IHRoZSBzeW1ib2xpYyBuYW1lIGhhbmRsaW5nIHRv
IGp1c3Qgb25lCmxvY2F0aW9uIGV4cG9zaW5nIGl0cyBvZmYtYnktb25lIG5hdHVyZS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0
LmMgfCAxNSArKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11X2luaXQuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMK
aW5kZXggMTZlODRkNDNkNC4uOGFhODc4ODc5NyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfaW5pdC5jCkBAIC01MzAsNiArNTMwLDcgQEAgc3RhdGljIHZvaWQgcGFyc2VfZXZl
bnRfbG9nX2VudHJ5KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCB1MzIgZW50cnlbXSkKICAgICAg
ICAgRVZFTlRfU1RSKElOVkFMSURfREVWX1JFUVVFU1QpCiAjdW5kZWYgRVZFTlRfU1RSCiAgICAg
fTsKKyAgICBjb25zdCBjaGFyICpjb2RlX3N0ciA9ICJldmVudCI7CiAKICAgICBjb2RlID0gZ2V0
X2ZpZWxkX2Zyb21fcmVnX3UzMihlbnRyeVsxXSwgSU9NTVVfRVZFTlRfQ09ERV9NQVNLLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9FVkVOVF9DT0RF
X1NISUZUKTsKQEAgLTU1Myw2ICs1NTQsMTAgQEAgc3RhdGljIHZvaWQgcGFyc2VfZXZlbnRfbG9n
X2VudHJ5KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCB1MzIgZW50cnlbXSkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfRVZFTlRfQ09ERV9TSElGVCk7CiAgICAg
fQogCisgICAgLyogTG9vayB1cCB0aGUgc3ltYm9saWMgbmFtZSBmb3IgY29kZS4gKi8KKyAgICBp
ZiAoIGNvZGUgPD0gQVJSQVlfU0laRShldmVudF9zdHIpICkKKyAgICAgICAgY29kZV9zdHIgPSBl
dmVudF9zdHJbY29kZSAtIDFdOworCiAgICAgaWYgKCBjb2RlID09IElPTU1VX0VWRU5UX0lPX1BB
R0VfRkFVTFQgKQogICAgIHsKICAgICAgICAgZGV2aWNlX2lkID0gaW9tbXVfZ2V0X2RldmlkX2Zy
b21fZXZlbnQoZW50cnlbMF0pOwpAQCAtNTY2LDcgKzU3MSw3IEBAIHN0YXRpYyB2b2lkIHBhcnNl
X2V2ZW50X2xvZ19lbnRyeShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgdTMyIGVudHJ5W10pCiAg
ICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJBTUQtVmk6ICIKICAgICAgICAgICAgICAgICIlczog
ZG9tYWluID0gJWQsIGRldmljZSBpZCA9ICUjeCwgIgogICAgICAgICAgICAgICAgImZhdWx0IGFk
ZHJlc3MgPSAlIyJQUkl4NjQiLCBmbGFncyA9ICUjeFxuIiwKLSAgICAgICAgICAgICAgIGV2ZW50
X3N0cltjb2RlLTFdLCBkb21haW5faWQsIGRldmljZV9pZCwgKmFkZHIsIGZsYWdzKTsKKyAgICAg
ICAgICAgICAgIGNvZGVfc3RyLCBkb21haW5faWQsIGRldmljZV9pZCwgKmFkZHIsIGZsYWdzKTsK
IAogICAgICAgICBmb3IgKCBiZGYgPSAwOyBiZGYgPCBpdnJzX2JkZl9lbnRyaWVzOyBiZGYrKyAp
CiAgICAgICAgICAgICBpZiAoIGdldF9kbWFfcmVxdWVzdG9yX2lkKGlvbW11LT5zZWcsIGJkZikg
PT0gZGV2aWNlX2lkICkKQEAgLTU3NCwxMiArNTc5LDggQEAgc3RhdGljIHZvaWQgcGFyc2VfZXZl
bnRfbG9nX2VudHJ5KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCB1MzIgZW50cnlbXSkKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0RFVkZOMihiZGYpKTsKICAg
ICB9CiAgICAgZWxzZQotICAgIHsKLSAgICAgICAgQU1EX0lPTU1VX0RFQlVHKCIlcyAlMDh4ICUw
OHggJTA4eCAlMDh4XG4iLAotICAgICAgICAgICAgICAgICAgICAgICAgY29kZSA8PSBBUlJBWV9T
SVpFKGV2ZW50X3N0cikgPyBldmVudF9zdHJbY29kZSAtIDFdCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICJldmVudCIsCi0gICAgICAgICAg
ICAgICAgICAgICAgICBlbnRyeVswXSwgZW50cnlbMV0sIGVudHJ5WzJdLCBlbnRyeVszXSk7Ci0g
ICAgfQorICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXMgJTA4eCAlMDh4ICUwOHggJTA4eFxu
IiwKKyAgICAgICAgICAgICAgIGNvZGVfc3RyLCBlbnRyeVswXSwgZW50cnlbMV0sIGVudHJ5WzJd
LCBlbnRyeVszXSk7CiAKICAgICBtZW1zZXQoZW50cnksIDAsIElPTU1VX0VWRU5UX0xPR19FTlRS
WV9TSVpFKTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
