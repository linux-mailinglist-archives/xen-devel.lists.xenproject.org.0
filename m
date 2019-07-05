Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4D602DD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 11:06:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjK7M-0005o0-Sx; Fri, 05 Jul 2019 09:02:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjK7L-0005nk-Ei
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 09:02:55 +0000
X-Inumbo-ID: ac9e7baf-9f03-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac9e7baf-9f03-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 09:02:54 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PPkg2qEo+oBDbDLZePM4RnGFumM/8+5lbkulJ20V/GfhOItnDEPdFQ5DbyjiqDRff+IROxvHJX
 XDtsMfNFbliZHN76ZG4mGwMCrUo9Rxau2kIqnmC1hVqKSbw1c4WcqYm+lDVmMfVoDCVkGLsVPR
 3jwIt9cICUr8UG2nR74BQY58JiAePKRFw/l4TNYUt3cbqSOqsE5JCqAsNEWjBzcdCOYQkbE8GS
 vK053CVNGMthzvyue0l6iN3QUJhNAHfU+WKVvreVK9F4svE6NWVgLRC6tXVbNzFHEe/mhtB/V4
 IRU=
X-SBRS: 2.7
X-MesageID: 2623113
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,454,1557201600"; 
   d="scan'208";a="2623113"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Jul 2019 10:02:49 +0100
Message-ID: <20190705090249.1935-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190705090249.1935-1-paul.durrant@citrix.com>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/2] xmalloc: add a Kconfig option to poison
 free pool memory
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIFhNRU1fUE9PTF9QT0lTT04gdG8gdGhlIEtjb25maWcgREVCVUcgb3B0
aW9ucy4gSWYgc2V0LApmcmVlIGJsb2NrcyAoZ3JlYXRlciB0aGFuIE1JTl9CTE9DS19TSVpFKSB3
aWxsIGJlIHBvaXNvbmVkIHdpdGggMHhBQQpieXRlcyB3aGljaCB3aWxsIHRoZW4gYmUgdmVyaWZp
ZWQgd2hlbiBtZW1vcnkgaXMgc3Vic2VxdWVudGx5IGFsbG9jYXRlZC4KVGhpcyBjYW4gaGVscCBp
biBzcG90dGluZyBoZWFwIGNvcnJ1cHRpb24sIHBhcnRpY3VsYXJseSB1c2UtYWZ0ZXItZnJlZS4K
ClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0t
LQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3Jn
PgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCnYyOgogLSBDaGFuZ2UgS2NvbmZpZyBvcHRpb24g
bmFtZSB0byBYTUVNX1BPT0xfUE9JU09OCiAtIEFkZCBhbiBpbXBsZW1lbnRhdGlvbiBvZiBtZW1j
aHJfaW52KCkgYW5kIHVzZSB0aGF0Ci0tLQogeGVuL0tjb25maWcuZGVidWcgICAgICAgICB8ICA3
ICsrKysrKysKIHhlbi9jb21tb24vc3RyaW5nLmMgICAgICAgfCAyMCArKysrKysrKysrKysrKysr
KysrKwogeGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyB8IDEwICsrKysrKysrKysKIHhlbi9pbmNs
dWRlL3hlbi9zdHJpbmcuaCAgfCAgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcuZGVidWcgYi94ZW4vS2NvbmZpZy5kZWJ1Zwpp
bmRleCBkYWFjZjg1MTQxLi5mZTU3OTJhM2QwIDEwMDY0NAotLS0gYS94ZW4vS2NvbmZpZy5kZWJ1
ZworKysgYi94ZW4vS2NvbmZpZy5kZWJ1ZwpAQCAtMTA1LDYgKzEwNSwxMyBAQCBjb25maWcgREVC
VUdfVFJBQ0UKIAkgIGVpdGhlciBkaXJlY3RseSB0byB0aGUgY29uc29sZSBvciBhcmUgcHJpbnRl
ZCB0byBjb25zb2xlIGluIGNhc2Ugb2YKIAkgIGEgc3lzdGVtIGNyYXNoLgogCitjb25maWcgWE1F
TV9QT09MX1BPSVNPTgorICAgICAgIGJvb2wgIlBvaXNvbiBmcmVlIHhlbnBvb2wgYmxvY2tzIgor
ICAgICAgIGRlZmF1bHQgREVCVUcKKyAgICAgICAtLS1oZWxwLS0tCisJIFBvaXNvbiBmcmVlIGJs
b2NrcyB3aXRoIDB4QUEgYnl0ZXMgYW5kIHZlcmlmeSB0aGVtIHdoZW4gYSBibG9jayBpcworCSBh
bGxvY2F0ZWQgaW4gb3JkZXIgdG8gc3BvdCB1c2UtYWZ0ZXItZnJlZSBpc3N1ZXMuCisKIGVuZGlm
ICMgREVCVUcgfHwgRVhQRVJUCiAKIGVuZG1lbnUKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc3Ry
aW5nLmMgYi94ZW4vY29tbW9uL3N0cmluZy5jCmluZGV4IGEyYmJlN2RjOTcuLmFmM2Q5NmFkMGYg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc3RyaW5nLmMKKysrIGIveGVuL2NvbW1vbi9zdHJpbmcu
YwpAQCAtNDIzLDYgKzQyMywyNiBAQCB2b2lkICoobWVtY2hyKShjb25zdCB2b2lkICpzLCBpbnQg
Yywgc2l6ZV90IG4pCiB9CiAjZW5kaWYKIAorLyoqCisgKiBtZW1jaHJfaW52IC0gRmluZCBhbiB1
bm1hdGNoaW5nIGNoYXJhY3RlciBpbiBhbiBhcmVhIG9mIG1lbW9yeS4KKyAqIEBzOiBUaGUgbWVt
b3J5IGFyZWEKKyAqIEBjOiBUaGUgYnl0ZSB0aGF0IGlzIGV4cGVjdGVkCisgKiBAbjogVGhlIHNp
emUgb2YgdGhlIGFyZWEuCisgKgorICogcmV0dXJucyB0aGUgYWRkcmVzcyBvZiB0aGUgZmlyc3Qg
b2NjdXJyZW5jZSBvZiBhIGNoYXJhY3RlciBvdGhlciB0aGFuIEBjLAorICogb3IgJU5VTEwgaWYg
dGhlIHdob2xlIGJ1ZmZlciBjb250YWlucyBqdXN0IEBjLgorICovCit2b2lkICptZW1jaHJfaW52
KGNvbnN0IHZvaWQgKnMsIGludCBjLCBzaXplX3QgbikKK3sKKwljb25zdCB1bnNpZ25lZCBjaGFy
ICpwID0gczsKKworCXdoaWxlIChuLS0pCisJCWlmICgodW5zaWduZWQgY2hhciljICE9ICpwKysp
CisJCQlyZXR1cm4gKHZvaWQgKikocCAtIDEpOworCisJcmV0dXJuIE5VTEw7Cit9CisKIC8qCiAg
KiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3ht
YWxsb2NfdGxzZi5jIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwppbmRleCBlNGU0NzZhMjdj
Li5jNWY1NjExYzYzIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCisrKyBi
L3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKQEAgLTIzOCw2ICsyMzgsMTEgQEAgc3RhdGljIGlu
bGluZSB2b2lkIEVYVFJBQ1RfQkxPQ0soc3RydWN0IGJoZHIgKmIsIHN0cnVjdCB4bWVtX3Bvb2wg
KnAsIGludCBmbCwKICAgICAgICAgfQogICAgIH0KICAgICBiLT5wdHIuZnJlZV9wdHIgPSAoc3Ry
dWN0IGZyZWVfcHRyKSB7TlVMTCwgTlVMTH07CisjaWZkZWYgQ09ORklHX1hNRU1fUE9PTF9QT0lT
T04KKyAgICBpZiAoIChiLT5zaXplICYgQkxPQ0tfU0laRV9NQVNLKSA+IE1JTl9CTE9DS19TSVpF
ICkKKyAgICAgICAgQVNTRVJUKCFtZW1jaHJfaW52KGItPnB0ci5idWZmZXIgKyBNSU5fQkxPQ0tf
U0laRSwgMHhBQSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIChiLT5zaXplICYgQkxPQ0tf
U0laRV9NQVNLKSAtIE1JTl9CTE9DS19TSVpFKSk7CisjZW5kaWYgLyogQ09ORklHX1hNRU1fUE9P
TF9QT0lTT04gKi8KIH0KIAogLyoqCkBAIC0yNDUsNiArMjUwLDExIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBFWFRSQUNUX0JMT0NLKHN0cnVjdCBiaGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpwLCBp
bnQgZmwsCiAgKi8KIHN0YXRpYyBpbmxpbmUgdm9pZCBJTlNFUlRfQkxPQ0soc3RydWN0IGJoZHIg
KmIsIHN0cnVjdCB4bWVtX3Bvb2wgKnAsIGludCBmbCwgaW50IHNsKQogeworI2lmZGVmIENPTkZJ
R19YTUVNX1BPT0xfUE9JU09OCisgICAgaWYgKCAoYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSykg
PiBNSU5fQkxPQ0tfU0laRSApCisgICAgICAgIG1lbXNldChiLT5wdHIuYnVmZmVyICsgTUlOX0JM
T0NLX1NJWkUsIDB4QUEsCisgICAgICAgICAgICAgICAoYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFT
SykgLSBNSU5fQkxPQ0tfU0laRSk7CisjZW5kaWYgLyogQ09ORklHX1hNRU1fUE9PTF9QT0lTT04g
Ki8KICAgICBiLT5wdHIuZnJlZV9wdHIgPSAoc3RydWN0IGZyZWVfcHRyKSB7TlVMTCwgcC0+bWF0
cml4W2ZsXVtzbF19OwogICAgIGlmICggcC0+bWF0cml4W2ZsXVtzbF0gKQogICAgICAgICBwLT5t
YXRyaXhbZmxdW3NsXS0+cHRyLmZyZWVfcHRyLnByZXYgPSBiOwpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3N0cmluZy5oIGIveGVuL2luY2x1ZGUveGVuL3N0cmluZy5oCmluZGV4IDcxMWNi
NjBhN2QuLjRiM2I1N2U3NGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zdHJpbmcuaAor
KysgYi94ZW4vaW5jbHVkZS94ZW4vc3RyaW5nLmgKQEAgLTEwNiw2ICsxMDYsOCBAQCB2b2lkICpt
ZW1jaHIoY29uc3Qgdm9pZCAqLCBpbnQsIHNpemVfdCk7CiAjZGVmaW5lIG1lbWNocihzLCBjLCBu
KSBfX2J1aWx0aW5fbWVtY2hyKHMsIGMsIG4pCiAjZW5kaWYKIAordm9pZCAqbWVtY2hyX2ludihj
b25zdCB2b2lkICosIGludCwgc2l6ZV90KTsKKwogI2RlZmluZSBpc19jaGFyX2FycmF5KHgpIF9f
YnVpbHRpbl90eXBlc19jb21wYXRpYmxlX3AodHlwZW9mKHgpLCBjaGFyW10pCiAKIC8qIHNhZmVf
eHh4IGFsd2F5cyBOVUwtdGVybWluYXRlcyBhbmQgcmV0dXJucyAhPTAgaWYgcmVzdWx0IGlzIHRy
dW5jYXRlZC4gKi8KLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
