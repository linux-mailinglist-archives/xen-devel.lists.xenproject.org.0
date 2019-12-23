Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8351298DA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 17:45:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijQo5-0006J1-IB; Mon, 23 Dec 2019 16:43:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q5yK=2N=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijQo3-0006Id-VA
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 16:43:43 +0000
X-Inumbo-ID: 5bbafdb4-25a3-11ea-96fe-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bbafdb4-25a3-11ea-96fe-12813bfff9fa;
 Mon, 23 Dec 2019 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577119414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4LajtYjbMp6EySa6REpYUzL+FBkEHu6GtKsC0g+RZ1c=;
 b=VkLNS03auYBPUxa4z5ruzmcRWIi5To29A0hBDVoa4diQttgFcehaCh7d
 86wFrN6/j0wYdnpXpSepG4qq3Wra4GTssSjirMxOtoDU7lW0AJ/S1WtVX
 E9STo4BjQXjokrAzUzgfisnlVYBvn2a+Ou4r18vuNpotEDsw6E25CcWmj k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AxsFZfHdjC5LEZb4P+WEb/mOM+GeGKy4uTMsLWWzIUTaafKoQS8ilxHcMLF+7CpZtU+6BTPe61
 /vSJFaMh/xJdpaYiutyWAijRme/t+fq3S0XaE9DUs77KvFflBusgA/oDxIKtmKlh8doBfmYR31
 aDkTUbyAKgUpELHrwMsAAM3/wWhWQAencHg60V6NbgkK5llQudM/9kqE11NBIWwThXrHzZnsqV
 9X3TjNGIHtHmM11DJZdPd23AgG5zSsSY32GBFUbQ4KFdKLfqi+aL7gVxCm7hQXbrl1M38icCwn
 36A=
X-SBRS: 2.7
X-MesageID: 10229661
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,348,1571716800"; d="scan'208";a="10229661"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 23 Dec 2019 16:43:27 +0000
Message-ID: <20191223164329.3113378-3-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223164329.3113378-1-george.dunlap@citrix.com>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] xen: Add 'synthetic' preemption check
 parameter
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmV0dGVyIHRlc3QgaHlwZXJ2aXNvciBwcmVlbXB0aW9uIHBhdGhzLCBhZGQg
YW4gb3B0aW9uIHRvCmFydGlmaWNpYWxseSBpbmNyZWFzZSB0aGUgbnVtYmVyIG9mIHByZWVtcHRp
b25zLgoKV2hpbGUgbW9kaWZ5aW5nIHhlbi1jb21tYW5kLWxpbmUucGFuZG9jLCBlc2NhcGUgc29t
ZSB1bmRlcnNjb3JlcywgYW5kCnJlbW92ZSBzb21lIHRyYWlsaW5nIHdoaXRlc3BhY2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpD
QzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5w
YW5kb2MgfCAyMCArKysrKysrKysrKysrKysrKystLQogeGVuL2FyY2gveDg2L3RpbWUuYyAgICAg
ICAgICAgICAgIHwgMTEgKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAg
ICAgICB8IDEwICsrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5w
YW5kb2MgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKaW5kZXggOTgxYTVlMjM4
MS4uMWE5ZmRhODYyNyAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFu
ZG9jCisrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwpAQCAtNjM2LDEzICs2
MzYsMjkgQEAgQXZhaWxhYmxlIGFsdGVybmF0aXZlcywgd2l0aCB0aGVpciBtZWFuaW5nLCBhcmU6
CiBTcGVjaWZ5IHRoZSBVU0IgY29udHJvbGxlciB0byB1c2UsIGVpdGhlciBieSBpbnN0YW5jZSBu
dW1iZXIgKHdoZW4gZ29pbmcKIG92ZXIgdGhlIFBDSSBidXNzZXMgc2VxdWVudGlhbGx5KSBvciBi
eSBQQ0kgZGV2aWNlIChtdXN0IGJlIG9uIHNlZ21lbnQgMCkuCiAKLSMjIyBkZWJ1Z19zdGFja19s
aW5lcworIyMjIGRlYnVnXF9zdGFja1xfbGluZXMKID4gYD0gPGludGVnZXI+YAogCiA+IERlZmF1
bHQ6IGAyMGAKIAogTGltaXRzIHRoZSBudW1iZXIgbGluZXMgcHJpbnRlZCBpbiBYZW4gc3RhY2sg
dHJhY2VzLgogCisjIyMgZGVidWctc3ludGhldGljLXByZWVtcHRpb24KKz4gYD0gPGludGVnZXI+
YAorCis+IERlZmF1bHQ6IGAwYAorCitBcnRpZmljaWFsbHkgaW5jcmVhc2VzIHJhdGUgYXQgd2hp
Y2ggYGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKClgCityZXR1cm5zIGB0cnVlYCwgZm9yIGRlYnVn
Z2luZyBwdXJwb3NlcywgdG8gYSByYXRlIG9mIG9uZSBpbiBgTmAuIChUaGUKK2RlZmF1bHQsIGAw
YCwgZGlzYWJsZXMgdGhlIGZlYXR1cmUuKQorCitXaGVuIHByb21vdGluZyBwYWdldGFibGVzLCBm
b3IgaW5zdGFuY2UsIGBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpYAoraXMgY2FsbGVkIGJlZm9y
ZSBwcm9jZXNzaW5nIGVhY2ggUFRFLiAgU2luY2UgdGhlcmUgYXJlIDUxMiBQVEVzIHBlcgorcGFn
ZSwgYSB2YWx1ZSBvZiBgMTAyNGAgc2hvdWxkIHJlc3VsdCBpbiBwYWdldGFibGUgcHJvbW90aW9u
IGJlaW5nCitpbnRlcnJ1cHRlZCBldmVyeSBvdGhlciBwYWdlIG9uIGF2ZXJhZ2UuCisKK09ubHkg
YXZhaWxhYmxlIGluIERFQlVHIGJ1aWxkcy4KKwogIyMjIGRlYnVndHJhY2UKID4gYD0gW2NwdTpd
PHNpemU+YAogCkBAIC0xNjkwLDcgKzE3MDYsNyBAQCBUaGUgZm9sbG93aW5nIHJlc291cmNlcyBh
cmUgYXZhaWxhYmxlOgogICAgIENEUCwgb25lIENPUyB3aWxsIGNvcmVzcG9uZCB0d28gQ0JNcyBv
dGhlciB0aGFuIG9uZSB3aXRoIENBVCwgZHVlIHRvIHRoZQogICAgIHN1bSBvZiBDQk1zIGlzIGZp
eGVkLCB0aGF0IG1lYW5zIGFjdHVhbCBgY29zX21heGAgaW4gdXNlIHdpbGwgYXV0b21hdGljYWxs
eQogICAgIHJlZHVjZSB0byBoYWxmIHdoZW4gQ0RQIGlzIGVuYWJsZWQuCi0JCisKICMjIyBwdi1s
aW5lYXItcHQgKHg4NikKID4gYD0gPGJvb2xlYW4+YAogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUuYwppbmRleCA2NGU0NzFhMzliLi4zNDMwMmY4
MWU3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni90
aW1lLmMKQEAgLTQzLDYgKzQzLDE3IEBACiBzdGF0aWMgY2hhciBfX2luaXRkYXRhIG9wdF9jbG9j
a3NvdXJjZVsxMF07CiBzdHJpbmdfcGFyYW0oImNsb2Nrc291cmNlIiwgb3B0X2Nsb2Nrc291cmNl
KTsKIAorI2lmbmRlZiBOREVCVUcKK2ludCBkZWJ1Z19zeW50aGV0aWNfcHJlZW1wdGlvbiA9IDA7
CitpbnRlZ2VyX3BhcmFtKCJkZWJ1Zy1zeW50aGV0aWMtcHJlZW1wdGlvbiIsIGRlYnVnX3N5bnRo
ZXRpY19wcmVlbXB0aW9uKTsKKworYm9vbCBzeW50aGV0aWNfcHJlZW1wdGlvbl9jaGVjayh2b2lk
KSB7CisgICAgaWYgKCBkZWJ1Z19zeW50aGV0aWNfcHJlZW1wdGlvbiA9PSAwICkKKyAgICAgICAg
cmV0dXJuIGZhbHNlOworICAgIHJldHVybiAhKHJkdHNjKCkgJSBkZWJ1Z19zeW50aGV0aWNfcHJl
ZW1wdGlvbik7Cit9CisjZW5kaWYKKwogdW5zaWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IGNwdV9r
aHo7ICAvKiBDUFUgY2xvY2sgZnJlcXVlbmN5IGluIGtIei4gKi8KIERFRklORV9TUElOTE9DSyhy
dGNfbG9jayk7CiB1bnNpZ25lZCBsb25nIHBpdDBfdGlja3M7CmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDlmN2JjNjky
OTMuLmMwMDcxZWVlMDQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBi
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC03NDgsNiArNzQ4LDEzIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBoeXBlcmNhbGxfY2FuY2VsX2NvbnRpbnVhdGlvbihzdHJ1Y3QgdmNwdSAqdikKICAg
ICB2LT5oY2FsbF9wcmVlbXB0ZWQgPSBmYWxzZTsKIH0KIAorI2lmbmRlZiBOREVCVUcKK2Jvb2wg
c3ludGhldGljX3ByZWVtcHRpb25fY2hlY2sodm9pZCk7CisjZGVmaW5lIHN5bnRoZXRpY19wcmVl
bXB0aW9uX2NoZWNrIHN5bnRoZXRpY19wcmVlbXB0aW9uX2NoZWNrCisjZWxzZQorI2RlZmluZSBz
eW50aGV0aWNfcHJlZW1waXRvbl9jaGVjaygpIGZhbHNlCisjZW5kaWYKKwogLyoKICAqIEZvciBs
b25nLXJ1bm5pbmcgb3BlcmF0aW9ucyB0aGF0IG11c3QgYmUgaW4gaHlwZXJjYWxsIGNvbnRleHQs
IGNoZWNrCiAgKiBpZiB0aGVyZSBpcyBiYWNrZ3JvdW5kIHdvcmsgdG8gYmUgZG9uZSB0aGF0IHNo
b3VsZCBpbnRlcnJ1cHQgdGhpcwpAQCAtNzU1LDcgKzc2Miw4IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBoeXBlcmNhbGxfY2FuY2VsX2NvbnRpbnVhdGlvbihzdHJ1Y3QgdmNwdSAqdikKICAqLwogI2Rl
ZmluZSBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICh1bmxpa2VseSggICAgXAogICAgICAgICBz
b2Z0aXJxX3BlbmRpbmcoc21wX3Byb2Nlc3Nvcl9pZCgpKSB8ICAgXAotICAgICAgICBsb2NhbF9l
dmVudHNfbmVlZF9kZWxpdmVyeSgpICAgICAgICAgICAgXAorICAgICAgICBsb2NhbF9ldmVudHNf
bmVlZF9kZWxpdmVyeSgpIHwgICAgICAgICAgXAorICAgICAgICBzeW50aGV0aWNfcHJlZW1wdGlv
bl9jaGVjaygpICAgICAgICAgICAgXAogICAgICkpCiAKIC8qCi0tIAoyLjI0LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
