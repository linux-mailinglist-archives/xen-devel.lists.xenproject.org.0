Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C00AA581
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:11:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5sRZ-0001GU-Vh; Thu, 05 Sep 2019 14:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5sRX-0001GN-V1
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:08:59 +0000
X-Inumbo-ID: b35ed346-cfe6-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b35ed346-cfe6-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 14:08:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB7FEACA5;
 Thu,  5 Sep 2019 14:08:56 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68db6d1a-6498-30a6-6604-a568056dd1e0@suse.com>
Date: Thu, 5 Sep 2019 16:09:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3] x86emul: fix test harness and fuzzer build
 dependencies
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGZkMzVmMzJiNGIgKCJ0b29scy94ODZlbXVsOiBVc2Ugc3RydWN0IGNwdWlkX3BvbGlj
eSBpbiB0aGUKdXNlcnNwYWNlIHRlc3QgaGFybmVzc2VzIikgZGlkbid0IGFjY291bnQgZm9yIHRo
ZSBkZXBlbmRlbmNpZXMgb2YKY3B1aWQtYXV0b2dlbi5oIHRvIHBvdGVudGlhbGx5IGNoYW5nZSBi
ZXR3ZWVuIGluY3JlbWVudGFsIGJ1aWxkcy4gSW4KcGFydGljdWxhciB0aGUgaGFybmVzcyBoYXMg
YSAicnVuIiBnb2FsIHdoaWNoIGlzIHN1cHBvc2VkIHRvIGJlIHVzYWJsZQppbmRlcGVuZGVudGx5
IG9mIHRoZSByZXN0IG9mIHRoZSB0b29scyBzdWItdHJlZSBidWlsZGluZywgYW5kIGJvdGggdGhl
Cmhhcm5lc3MgYW5kIHRoZSBmdXp6ZXIgY29kZSBhcmUgYWxzbyBzdXBwb3NlZCB0byBiZSBidWls
ZGFibGUKaW5kZXBlbmRlbnRseS4gVGhlcmVmb3JlIGEgcmUtYnVpbGQgb2YgdGhlIGdlbmVyYXRl
ZCBoZWFkZXIgbmVlZHMgdG8gYmUKdHJpZ2dlcmVkIGZpcnN0LCB3aGljaCBpcyBhY2hpZXZlZCBi
eSBpbnRyb2R1Y2luZyBhIG5ldyB0b3AtbGV2ZWwgdGFyZ2V0CnBhdHRlcm4gKGZvciBqdXN0IHRo
ZSAicnVuIiBwYXJ0IGZvciBub3cpLgoKRnVydGhlciBjcHVpZC5vIGRpZCBub3QgaGF2ZSBhbnkg
ZGVwZW5kZW5jaWVzIGFkZGVkIGZvciBpdC4KCkZpbmFsbHksIHdoaWxlIGF0IGl0LCBhZGQgYSAi
cnVuIiB0YXJnZXQgdG8gdGhlIGNwdS1wb2xpY3kgdGVzdCBoYXJuZXNzLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KVEJEOiBTb21ldGhpbmcgc2lt
aWxhciB3b3VsZCBiZSBuaWNlIGZvciBidWlsZGluZyBib3RoIHRvb2xzL3Rlc3RzLyovCiAgICAg
YW5kIHRvb2xzL2Z1enovKi8sIGJ1dCBJJ20gdW5jZXJ0YWluIHdoZXRoZXIgcmVzcGVjdGl2ZSB0
b3AgbGV2ZWwKICAgICB0YXJnZXRzIGJ1aWxkLXRlc3RzLSUgYW5kIGJ1aWxkLWZ1enotJSB3b3Vs
ZCBiZSB3ZWxjb21lLgotLS0KdjM6IEludHJvZHVjZSB0b3AgbGV2ZWwgcnVuLXRlc3RzLSUgdGFy
Z2V0Lgp2Mi4xOiBTcGxpdCBjb250cm92ZXJzaWFsIHBhcnRzIGZyb20gKGhvcGVmdWxseSkgbm9u
LWNvbnRyb3ZlcnNpYWwgb25lcy4KdjI6IEd1YXJkICQoTUFLRSkgaW52b2NhdGlvbnMgYnkgJChN
QUtFTEVWRUwpIGNoZWNrcy4KCi0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC04MCw2
ICs4MCw5IEBAIGJ1aWxkLWRvY3M6CiB0ZXN0OgogCSQoTUFLRSkgLUMgdG9vbHMvcHl0aG9uIHRl
c3QKIAorcnVuLXRlc3RzLSU6IGJ1aWxkLXRvb2xzLXB1YmxpYy1oZWFkZXJzIHRvb2xzL3Rlc3Rz
LyUvCisJJChNQUtFKSAtQyB0b29scy90ZXN0cy8kKiBydW4KKwogIyBGb3IgbW9zdCB0YXJnZXRz
IGhlcmUsCiAjICAgbWFrZSBDT01QT05FTlQtVEFSR0VUCiAjIGlzIGltcGxlbWVudGVkLCBtb3Jl
IG9yIGxlc3MsIGJ5Ci0tLSBhL3Rvb2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL01h
a2VmaWxlCisrKyBiL3Rvb2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL01ha2VmaWxl
CkBAIC0yNiwxMyArMjYsMTUgQEAgR0NPVl9GTEFHUyA6PSAtLWNvdmVyYWdlCiAJJChDQykgLWMg
JChDRkxBR1MpICQoR0NPVl9GTEFHUykgJDwgLW8gJEAKIAogeDg2LmggOj0gJChhZGRwcmVmaXgg
JChYRU5fUk9PVCkvdG9vbHMvaW5jbHVkZS94ZW4vYXNtLyxcCi0gICAgICAgICAgICAgICAgICAg
ICB4ODYtdmVuZG9ycy5oIHg4Ni1kZWZucy5oIG1zci1pbmRleC5oKQorICAgICAgICAgICAgICAg
ICAgICAgeDg2LXZlbmRvcnMuaCB4ODYtZGVmbnMuaCBtc3ItaW5kZXguaCkgXAorICAgICAgICAg
JChhZGRwcmVmaXggJChYRU5fUk9PVCkvdG9vbHMvaW5jbHVkZS94ZW4vbGliL3g4Ni8sIFwKKyAg
ICAgICAgICAgICAgICAgICAgIGNwdWlkLmggY3B1aWQtYXV0b2dlbi5oKQogeDg2X2VtdWxhdGUu
aCA6PSB4ODYtZW11bGF0ZS5oIHg4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmggJCh4ODYuaCkKIAog
IyB4ODYtZW11bGF0ZS5jIHdpbGwgYmUgaW1wbGljaXQgZm9yIGJvdGgKIHg4Ni1lbXVsYXRlLm8g
eDg2LWVtdWxhdGUtY292Lm86IHg4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMgJCh4ODZfZW11bGF0
ZS5oKQogCi1mdXp6LWVtdWwubyBmdXp6LWVtdWxhdGUtY292Lm8gd3JhcHBlcnMubzogJCh4ODZf
ZW11bGF0ZS5oKQorZnV6ei1lbXVsLm8gZnV6ei1lbXVsYXRlLWNvdi5vIGNwdWlkLm8gd3JhcHBl
cnMubzogJCh4ODZfZW11bGF0ZS5oKQogCiB4ODYtaW5zbi1mdXp6ZXIuYTogZnV6ei1lbXVsLm8g
eDg2LWVtdWxhdGUubyBjcHVpZC5vCiAJJChBUikgcmMgJEAgJF4KLS0tIGEvdG9vbHMvdGVzdHMv
Y3B1LXBvbGljeS9NYWtlZmlsZQorKysgYi90b29scy90ZXN0cy9jcHUtcG9saWN5L01ha2VmaWxl
CkBAIC0xNyw2ICsxNywxMCBAQCBlbmRpZgogLlBIT05ZOiBhbGwKIGFsbDogJChUQVJHRVQteSkK
IAorLlBIT05ZOiBydW4KK3J1bjogJChUQVJHRVQteSkKKwkuLyQoVEFSR0VULXkpCisKIC5QSE9O
WTogY2xlYW4KIGNsZWFuOgogCSQoUk0pIC1mIC0tICoubyAuKi5kIC4qLmQyIHRlc3QtY3B1LXBv
bGljeQotLS0gYS90b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFrZWZpbGUKKysrIGIvdG9vbHMv
dGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCkBAIC0yODAsMTAgKzI4MCwxMiBAQCAkKGNhbGwg
Y2Mtb3B0aW9uLWFkZCxIT1NUQ0ZMQUdTLXg4Nl82NCxICiBIT1NUQ0ZMQUdTICs9ICQoQ0ZMQUdT
X3hlbmluY2x1ZGUpIC1JLiAkKEhPU1RDRkxBR1MtJChYRU5fQ09NUElMRV9BUkNIKSkKIAogeDg2
LmggOj0gJChhZGRwcmVmaXggJChYRU5fUk9PVCkvdG9vbHMvaW5jbHVkZS94ZW4vYXNtLyxcCi0g
ICAgICAgICAgICAgICAgICAgICB4ODYtdmVuZG9ycy5oIHg4Ni1kZWZucy5oIG1zci1pbmRleC5o
KQorICAgICAgICAgICAgICAgICAgICAgeDg2LXZlbmRvcnMuaCB4ODYtZGVmbnMuaCBtc3ItaW5k
ZXguaCkgXAorICAgICAgICAgJChhZGRwcmVmaXggJChYRU5fUk9PVCkvdG9vbHMvaW5jbHVkZS94
ZW4vbGliL3g4Ni8sIFwKKyAgICAgICAgICAgICAgICAgICAgIGNwdWlkLmggY3B1aWQtYXV0b2dl
bi5oKQogeDg2X2VtdWxhdGUuaCA6PSB4ODYtZW11bGF0ZS5oIHg4Nl9lbXVsYXRlL3g4Nl9lbXVs
YXRlLmggJCh4ODYuaCkKIAoteDg2LWVtdWxhdGUubyB0ZXN0X3g4Nl9lbXVsYXRvci5vIGV2ZXgt
ZGlzcDgubyB3cmFwcGVycy5vOiAlLm86ICUuYyAkKHg4Nl9lbXVsYXRlLmgpCit4ODYtZW11bGF0
ZS5vIGNwdWlkLm8gdGVzdF94ODZfZW11bGF0b3IubyBldmV4LWRpc3A4Lm8gd3JhcHBlcnMubzog
JS5vOiAlLmMgJCh4ODZfZW11bGF0ZS5oKQogCSQoSE9TVENDKSAkKEhPU1RDRkxBR1MpIC1jIC1n
IC1vICRAICQ8CiAKIHg4Ni1lbXVsYXRlLm86IHg4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
