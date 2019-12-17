Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266B122970
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 12:03:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihAZc-0008Dh-83; Tue, 17 Dec 2019 10:59:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9l2e=2H=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihAZb-0008DN-Bk
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 10:59:27 +0000
X-Inumbo-ID: 3ef8eb5c-20bc-11ea-8e9d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ef8eb5c-20bc-11ea-8e9d-12813bfff9fa;
 Tue, 17 Dec 2019 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576580349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jpatUXK7f8bEn0Z7hPW7toHzZ3qGUNcaCE7FiD3GcQc=;
 b=ScgbLz0t6hntqe5PhEJYuhZfBLp3EGN3YD7Ohod6iGtTpQqFnpICq+CR
 7uKPx9DGokJ11OIXlIqRYQrUXfnAgsuc8wstRhBvIFGw5tdVKx5CINkAJ
 ThffKkKZzipU3rOXUEJg+zeCPY2vMaGifSbz3nUdZ9mTlABLsmOHkwRMP Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AbDgBrSp/pc+jcSz9CH52kO6znGGYPIz7Ie4Jcmx0jkuLnhsdEZg1477HCsf58lDOSewTiI9f+
 vJLfWzSdMOvQcdaU5mpZegYBJ2LFr/tpFm2Bo9e1k3GI1MPncb5j9rg3mApzyQq3MZrCcYwRm6
 AuuIoqX/NnvlOdAPLEVUtsGsHXk/evhocz58z2bNf2LwVeLy0q1C+xAL8AKFUXF7p4mIHBeCFk
 B9YgRA4afiUtrX/eHVblT8F/vjjIGZfzZCws2+oCVmJ8XQgV0GNz7n4zeME15OQ7AtQAcfy79+
 ebM=
X-SBRS: 2.7
X-MesageID: 10211659
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10211659"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 10:59:01 +0000
Message-ID: <20191217105901.68158-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191217105901.68158-1-anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 6/6] xen: Move
 GCC_HAS_VISIBILITY_ATTRIBUTE to Kconfig and common
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNoZWNrIGZvciAkKENDKSAtZnZpc2liaWxpdHk9aGlkZGVuIGlzIGRvbmUgYnkgYm90aCBh
cm0gYW5kIHg4NiwKc28gdGhlIHBhdGNoIGFsc28gbW92ZSB0aGUgY2hlY2sgdG8gdGhlIGNvbW1v
biBhcmVhLgoKVGhlIGNoZWNrIGRvZXNuJ3QgY2hlY2sgaWYgJChDQykgaXMgZ2NjLCBhbmQgY2xh
bmcgY2FuIGFjY2VwdCB0aGF0Cm9wdGlvbiBhcyB3ZWxsLCBzbyBzL0dDQy9DQy8gaXMgZG9uZSB0
byB0aGUgZGVmaW5lIG5hbWUuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL0tjb25maWcgICAgICAgICAgICAgICAgfCA0ICsrKysK
IHhlbi9hcmNoL2FybS9SdWxlcy5tayAgICAgIHwgNCAtLS0tCiB4ZW4vYXJjaC94ODYvUnVsZXMu
bWsgICAgICB8IDUgLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9jb21waWxlci5oIHwgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9LY29uZmlnIGIveGVuL0tjb25maWcKaW5kZXggOWY2NTEyZDY1YjA4Li5mYzQ5ZjRj
MzBhMjkgMTAwNjQ0Ci0tLSBhL3hlbi9LY29uZmlnCisrKyBiL3hlbi9LY29uZmlnCkBAIC0yNCw2
ICsyNCwxMCBAQCBjb25maWcgQ0xBTkdfVkVSU0lPTgogCWludAogCWRlZmF1bHQgJChzaGVsbCwk
KEJBU0VESVIpL3NjcmlwdHMvY2xhbmctdmVyc2lvbi5zaCAkKENDKSkKIAorIyAtZnZpc2liaWxp
dHk9aGlkZGVuIHJlZHVjZXMgLWZwaWMgY29zdCwgaWYgaXQncyBhdmFpbGFibGUKK2NvbmZpZyBD
Q19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEUKKwlkZWZfYm9vbCAkKGNjLW9wdGlvbiwtZnZpc2li
aWxpdHk9aGlkZGVuKQorCiBzb3VyY2UgImFyY2gvJChTUkNBUkNIKS9LY29uZmlnIgogCiBjb25m
aWcgREVGQ09ORklHX0xJU1QKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9SdWxlcy5tayBiL3hl
bi9hcmNoL2FybS9SdWxlcy5tawppbmRleCAzZDlhMGVkMzU3YmMuLjAyMmEzYTZmODJiYSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gvYXJtL1J1bGVzLm1rCisrKyBiL3hlbi9hcmNoL2FybS9SdWxlcy5t
awpAQCAtMTgsMTAgKzE4LDYgQEAgQ0ZMQUdTLSQoQ09ORklHX0FSTV8zMikgKz0gLW1jcHU9Y29y
dGV4LWExNQogQ0ZMQUdTLSQoQ09ORklHX0FSTV82NCkgKz0gLW1jcHU9Z2VuZXJpYwogQ0ZMQUdT
LSQoQ09ORklHX0FSTV82NCkgKz0gLW1nZW5lcmFsLXJlZ3Mtb25seSAjIE5vIGZwIHJlZ2lzdGVy
cyBldGMKIAotaWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sJChDQyksLWZ2aXNpYmlsaXR5PWhpZGRl
bixuKSxuKQotQ0ZMQUdTICs9IC1ER0NDX0hBU19WSVNJQklMSVRZX0FUVFJJQlVURQotZW5kaWYK
LQogRUFSTFlfUFJJTlRLIDo9IG4KIAogaWZlcSAoJChDT05GSUdfREVCVUcpLHkpCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvUnVsZXMubWsgYi94ZW4vYXJjaC94ODYvUnVsZXMubWsKaW5kZXgg
Yjk4ZTE0ZTI4YzVhLi5lNjliOGU2OTdjYzAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxl
cy5taworKysgYi94ZW4vYXJjaC94ODYvUnVsZXMubWsKQEAgLTY1LDExICs2NSw2IEBAIENGTEFH
UyArPSAtbW5vLXJlZC16b25lIC1mcGljIC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMK
ICMgU1NFIHNldHVwIGZvciB2YXJpYWRpYyBmdW5jdGlvbiBjYWxscy4KIENGTEFHUyArPSAtbW5v
LXNzZSAkKGNhbGwgY2Mtb3B0aW9uLCQoQ0MpLC1tc2tpcC1yYXgtc2V0dXApCiAKLSMgLWZ2aXNp
YmlsaXR5PWhpZGRlbiByZWR1Y2VzIC1mcGljIGNvc3QsIGlmIGl0J3MgYXZhaWxhYmxlCi1pZm5l
cSAoJChjYWxsIGNjLW9wdGlvbiwkKENDKSwtZnZpc2liaWxpdHk9aGlkZGVuLG4pLG4pCi1DRkxB
R1MgKz0gLURHQ0NfSEFTX1ZJU0lCSUxJVFlfQVRUUklCVVRFCi1lbmRpZgotCiAjIENvbXBpbGUg
d2l0aCB0aHVuay1leHRlcm4sIGluZGlyZWN0LWJyYW5jaC1yZWdpc3RlciBpZiBhdmFpYWJsZS4K
IGlmZXEgKCQoQ09ORklHX0lORElSRUNUX1RIVU5LKSx5KQogQ0ZMQUdTICs9IC1taW5kaXJlY3Qt
YnJhbmNoPXRodW5rLWV4dGVybiAtbWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlcgpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmggYi94ZW4vaW5jbHVkZS94ZW4vY29tcGlsZXIu
aAppbmRleCBmZjZjMGY1Y2RkMTguLjhjODQ2MjYxZDI0MSAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUveGVuL2NvbXBpbGVyLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmgKQEAgLTc4
LDcgKzc4LDcgQEAKICNkZWZpbmUgX19tdXN0X2JlX2FycmF5KGEpIFwKICAgQlVJTERfQlVHX09O
X1pFUk8oX19idWlsdGluX3R5cGVzX2NvbXBhdGlibGVfcCh0eXBlb2YoYSksIHR5cGVvZigmYVsw
XSkpKQogCi0jaWZkZWYgR0NDX0hBU19WSVNJQklMSVRZX0FUVFJJQlVURQorI2lmZGVmIENPTkZJ
R19DQ19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEUKIC8qIFJlc3VsdHMgaW4gbW9yZSBlZmZpY2ll
bnQgUElDIGNvZGUgKG5vIGluZGlyZWN0aW9ucyB0aHJvdWdoIEdPVCBvciBQTFQpLiAqLwogI3By
YWdtYSBHQ0MgdmlzaWJpbGl0eSBwdXNoKGhpZGRlbikKICNlbmRpZgotLSAKQW50aG9ueSBQRVJB
UkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
