Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C346085C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:51:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPWL-00049w-Rh; Fri, 05 Jul 2019 14:49:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjPWJ-000495-W4
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:49:04 +0000
X-Inumbo-ID: 0629f80a-9f34-11e9-a3b6-ef9406ccf374
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0629f80a-9f34-11e9-a3b6-ef9406ccf374;
 Fri, 05 Jul 2019 14:49:00 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NC4It89LaybdiREW1N3XzylIZKOsMm/mT0QgHrHxGgx/dWs4GW2zyv9FQmBogakTt9f+QvelMU
 B0UGJy0GuzEYMO8nFXazKsqh4vrorWen3jOQrULuY6PocqE7wB6BDlowzWJJGjcrWJRjSeukpU
 +6EtiJ/lhRawR3mlB1VEK5j+GM/mSToyBv40z6nHnHdvFVuplGjlBlAEUjXKkftgcVTvFDlV2w
 5kjjSjfQw7u7nKShUlRcZl9qubgdenCd3xhDxH+oDA306jCINtCl/4Vyi857tUnU2Z1cFtNQzZ
 E0k=
X-SBRS: 2.7
X-MesageID: 2648989
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2648989"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Jul 2019 15:48:55 +0100
Message-ID: <20190705144855.15259-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190705144855.15259-1-paul.durrant@citrix.com>
References: <20190705144855.15259-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/2] xmalloc: add a Kconfig option to poison
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
PgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCnYzOgogLSAjZGVmaW5lIHRoZSBQT0lTT05fQllU
RQogLSBGaXggd2hpdGVzcGFjZSBpbiBLY29uZmlnLmRlYnVnCgp2MjoKIC0gQ2hhbmdlIEtjb25m
aWcgb3B0aW9uIG5hbWUgdG8gWE1FTV9QT09MX1BPSVNPTgogLSBBZGQgYW4gaW1wbGVtZW50YXRp
b24gb2YgbWVtY2hyX2ludigpIGFuZCB1c2UgdGhhdAotLS0KIHhlbi9LY29uZmlnLmRlYnVnICAg
ICAgICAgfCAgNyArKysrKysrCiB4ZW4vY29tbW9uL3N0cmluZy5jICAgICAgIHwgMjAgKysrKysr
KysrKysrKysrKysrKysKIHhlbi9jb21tb24veG1hbGxvY190bHNmLmMgfCAxMiArKysrKysrKysr
KysKIHhlbi9pbmNsdWRlL3hlbi9zdHJpbmcuaCAgfCAgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCA0
MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcuZGVidWcgYi94ZW4vS2Nv
bmZpZy5kZWJ1ZwppbmRleCBkYWFjZjg1MTQxLi5lMTBlMzE0ZTI1IDEwMDY0NAotLS0gYS94ZW4v
S2NvbmZpZy5kZWJ1ZworKysgYi94ZW4vS2NvbmZpZy5kZWJ1ZwpAQCAtMTA1LDYgKzEwNSwxMyBA
QCBjb25maWcgREVCVUdfVFJBQ0UKIAkgIGVpdGhlciBkaXJlY3RseSB0byB0aGUgY29uc29sZSBv
ciBhcmUgcHJpbnRlZCB0byBjb25zb2xlIGluIGNhc2Ugb2YKIAkgIGEgc3lzdGVtIGNyYXNoLgog
Citjb25maWcgWE1FTV9QT09MX1BPSVNPTgorCWJvb2wgIlBvaXNvbiBmcmVlIHhlbnBvb2wgYmxv
Y2tzIgorCWRlZmF1bHQgREVCVUcKKwktLS1oZWxwLS0tCisJICBQb2lzb24gZnJlZSBibG9ja3Mg
d2l0aCAweEFBIGJ5dGVzIGFuZCB2ZXJpZnkgdGhlbSB3aGVuIGEgYmxvY2sgaXMKKwkgIGFsbG9j
YXRlZCBpbiBvcmRlciB0byBzcG90IHVzZS1hZnRlci1mcmVlIGlzc3Vlcy4KKwogZW5kaWYgIyBE
RUJVRyB8fCBFWFBFUlQKIAogZW5kbWVudQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zdHJpbmcu
YyBiL3hlbi9jb21tb24vc3RyaW5nLmMKaW5kZXggYTJiYmU3ZGM5Ny4uYWYzZDk2YWQwZiAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9zdHJpbmcuYworKysgYi94ZW4vY29tbW9uL3N0cmluZy5jCkBA
IC00MjMsNiArNDIzLDI2IEBAIHZvaWQgKihtZW1jaHIpKGNvbnN0IHZvaWQgKnMsIGludCBjLCBz
aXplX3QgbikKIH0KICNlbmRpZgogCisvKioKKyAqIG1lbWNocl9pbnYgLSBGaW5kIGFuIHVubWF0
Y2hpbmcgY2hhcmFjdGVyIGluIGFuIGFyZWEgb2YgbWVtb3J5LgorICogQHM6IFRoZSBtZW1vcnkg
YXJlYQorICogQGM6IFRoZSBieXRlIHRoYXQgaXMgZXhwZWN0ZWQKKyAqIEBuOiBUaGUgc2l6ZSBv
ZiB0aGUgYXJlYS4KKyAqCisgKiByZXR1cm5zIHRoZSBhZGRyZXNzIG9mIHRoZSBmaXJzdCBvY2N1
cnJlbmNlIG9mIGEgY2hhcmFjdGVyIG90aGVyIHRoYW4gQGMsCisgKiBvciAlTlVMTCBpZiB0aGUg
d2hvbGUgYnVmZmVyIGNvbnRhaW5zIGp1c3QgQGMuCisgKi8KK3ZvaWQgKm1lbWNocl9pbnYoY29u
c3Qgdm9pZCAqcywgaW50IGMsIHNpemVfdCBuKQoreworCWNvbnN0IHVuc2lnbmVkIGNoYXIgKnAg
PSBzOworCisJd2hpbGUgKG4tLSkKKwkJaWYgKCh1bnNpZ25lZCBjaGFyKWMgIT0gKnArKykKKwkJ
CXJldHVybiAodm9pZCAqKShwIC0gMSk7CisKKwlyZXR1cm4gTlVMTDsKK30KKwogLyoKICAqIExv
Y2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24veG1hbGxv
Y190bHNmLmMgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCmluZGV4IGU0ZTQ3NmEyN2MuLmEx
YWNmY2VhZjYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKKysrIGIveGVu
L2NvbW1vbi94bWFsbG9jX3Rsc2YuYwpAQCAtMjE1LDYgKzIxNSw4IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBFWFRSQUNUX0JMT0NLX0hEUihzdHJ1Y3QgYmhkciAqYiwgc3RydWN0IHhtZW1fcG9vbCAq
cCwgaW50IGZsCiAgICAgYi0+cHRyLmZyZWVfcHRyID0gKHN0cnVjdCBmcmVlX3B0cikge05VTEws
IE5VTEx9OwogfQogCisjZGVmaW5lIFBPSVNPTl9CWVRFIDB4QUEKKwogLyoqCiAgKiBSZW1vdmVz
IGJsb2NrKGIpIGZyb20gZnJlZSBsaXN0IHdpdGggaW5kZXhlcyAoZmwsIHNsKQogICovCkBAIC0y
MzgsNiArMjQwLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBFWFRSQUNUX0JMT0NLKHN0cnVjdCBi
aGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpwLCBpbnQgZmwsCiAgICAgICAgIH0KICAgICB9CiAg
ICAgYi0+cHRyLmZyZWVfcHRyID0gKHN0cnVjdCBmcmVlX3B0cikge05VTEwsIE5VTEx9OworI2lm
ZGVmIENPTkZJR19YTUVNX1BPT0xfUE9JU09OCisgICAgaWYgKCAoYi0+c2l6ZSAmIEJMT0NLX1NJ
WkVfTUFTSykgPiBNSU5fQkxPQ0tfU0laRSApCisgICAgICAgIEFTU0VSVCghbWVtY2hyX2ludihi
LT5wdHIuYnVmZmVyICsgTUlOX0JMT0NLX1NJWkUsIFBPSVNPTl9CWVRFLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKGItPnNpemUgJiBCTE9DS19TSVpFX01BU0spIC0gTUlOX0JMT0NLX1NJ
WkUpKTsKKyNlbmRpZiAvKiBDT05GSUdfWE1FTV9QT09MX1BPSVNPTiAqLwogfQogCiAvKioKQEAg
LTI0NSw2ICsyNTIsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIEVYVFJBQ1RfQkxPQ0soc3RydWN0
IGJoZHIgKmIsIHN0cnVjdCB4bWVtX3Bvb2wgKnAsIGludCBmbCwKICAqLwogc3RhdGljIGlubGlu
ZSB2b2lkIElOU0VSVF9CTE9DSyhzdHJ1Y3QgYmhkciAqYiwgc3RydWN0IHhtZW1fcG9vbCAqcCwg
aW50IGZsLCBpbnQgc2wpCiB7CisjaWZkZWYgQ09ORklHX1hNRU1fUE9PTF9QT0lTT04KKyAgICBp
ZiAoIChiLT5zaXplICYgQkxPQ0tfU0laRV9NQVNLKSA+IE1JTl9CTE9DS19TSVpFICkKKyAgICAg
ICAgbWVtc2V0KGItPnB0ci5idWZmZXIgKyBNSU5fQkxPQ0tfU0laRSwgUE9JU09OX0JZVEUsCisg
ICAgICAgICAgICAgICAoYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSykgLSBNSU5fQkxPQ0tfU0la
RSk7CisjZW5kaWYgLyogQ09ORklHX1hNRU1fUE9PTF9QT0lTT04gKi8KICAgICBiLT5wdHIuZnJl
ZV9wdHIgPSAoc3RydWN0IGZyZWVfcHRyKSB7TlVMTCwgcC0+bWF0cml4W2ZsXVtzbF19OwogICAg
IGlmICggcC0+bWF0cml4W2ZsXVtzbF0gKQogICAgICAgICBwLT5tYXRyaXhbZmxdW3NsXS0+cHRy
LmZyZWVfcHRyLnByZXYgPSBiOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3N0cmluZy5o
IGIveGVuL2luY2x1ZGUveGVuL3N0cmluZy5oCmluZGV4IDcxMWNiNjBhN2QuLjRiM2I1N2U3NGYg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zdHJpbmcuaAorKysgYi94ZW4vaW5jbHVkZS94
ZW4vc3RyaW5nLmgKQEAgLTEwNiw2ICsxMDYsOCBAQCB2b2lkICptZW1jaHIoY29uc3Qgdm9pZCAq
LCBpbnQsIHNpemVfdCk7CiAjZGVmaW5lIG1lbWNocihzLCBjLCBuKSBfX2J1aWx0aW5fbWVtY2hy
KHMsIGMsIG4pCiAjZW5kaWYKIAordm9pZCAqbWVtY2hyX2ludihjb25zdCB2b2lkICosIGludCwg
c2l6ZV90KTsKKwogI2RlZmluZSBpc19jaGFyX2FycmF5KHgpIF9fYnVpbHRpbl90eXBlc19jb21w
YXRpYmxlX3AodHlwZW9mKHgpLCBjaGFyW10pCiAKIC8qIHNhZmVfeHh4IGFsd2F5cyBOVUwtdGVy
bWluYXRlcyBhbmQgcmV0dXJucyAhPTAgaWYgcmVzdWx0IGlzIHRydW5jYXRlZC4gKi8KLS0gCjIu
MjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
