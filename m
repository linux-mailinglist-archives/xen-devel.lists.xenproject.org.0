Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8365D479
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLnu-0001j6-J5; Tue, 02 Jul 2019 16:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiLnt-0001iR-51
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:38:49 +0000
X-Inumbo-ID: dd53dc5a-9ce7-11e9-8782-4f699680660f
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd53dc5a-9ce7-11e9-8782-4f699680660f;
 Tue, 02 Jul 2019 16:38:47 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P8DlWrgjUXbq7h/Aj4uxKaFCre30NiQS6MFXQte0CQZqPBpzhWoZlO0JVidhnti2AJ1dYmeBAO
 YgJp75ZLQL5bmOzY1A+Jd1XnD6PztcVEleS4EEdGNF0IgRP2gjx9pcy/U2fm6lpA7A81QRsRgw
 g4kH5vA3j4jJWjmkyX+fqJ+3tP54rxR5orEJZchqfJXhybqxpvFfNESmLSfniIRw7U4xZ+I2Gy
 ZX22nkQz5CLqmiAc0dBWlHzDp5pxNnvlQSES3FDw/758w1kpsXL5QgQXAHZtFtf/kQh6vEvL0R
 JZU=
X-SBRS: 2.7
X-MesageID: 2501602
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2501602"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 2 Jul 2019 17:38:40 +0100
Message-ID: <20190702163840.2107-4-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190702163840.2107-1-paul.durrant@citrix.com>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] xmalloc: add a Kconfig option to poison
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

VGhpcyBwYXRjaCBhZGRzIFBPT0xfUE9JU09OIHRvIHRoZSBLY29uZmlnIERFQlVHIG9wdGlvbnMu
IElmIHNldCwgZnJlZQpibG9ja3MgKGdyZWF0ZXIgdGhhbiBNSU5fQkxPQ0tfU0laRSkgd2lsbCBi
ZSBwb2lzb25lZCB3aXRoIDB4QUEgYnl0ZXMKd2hpY2ggd2lsbCB0aGVuIGJlIHZlcmlmaWVkIHdo
ZW4gbWVtb3J5IGlzIHN1YnNlcXVlbnRseSBhbGxvY2F0ZWQuIFRoaXMKY2FuIGhlbHAgaW4gc3Bv
dHRpbmcgaGVhcCBjb3JydXB0aW9uLCBwYXJ0aWN1bGFybHkgdXNlLWFmdGVyLWZyZWUuCgpTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Q2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL0tjb25maWcuZGVidWcgICAgICAgICB8ICA3
ICsrKysrKysKIHhlbi9jb21tb24veG1hbGxvY190bHNmLmMgfCAxMyArKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vS2NvbmZp
Zy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnCmluZGV4IGRhYWNmODUxNDEuLjRmMThhMTE0NGUg
MTAwNjQ0Ci0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCisrKyBiL3hlbi9LY29uZmlnLmRlYnVnCkBA
IC0xMDUsNiArMTA1LDEzIEBAIGNvbmZpZyBERUJVR19UUkFDRQogCSAgZWl0aGVyIGRpcmVjdGx5
IHRvIHRoZSBjb25zb2xlIG9yIGFyZSBwcmludGVkIHRvIGNvbnNvbGUgaW4gY2FzZSBvZgogCSAg
YSBzeXN0ZW0gY3Jhc2guCiAKK2NvbmZpZyBQT09MX1BPSVNPTgorICAgICAgIGJvb2wgIlBvaXNv
biBmcmVlIHhlbnBvb2wgYmxvY2tzIgorICAgICAgIGRlZmF1bHQgREVCVUcKKyAgICAgICAtLS1o
ZWxwLS0tCisgICAgICAgICBQb2lzb24gZnJlZSBibG9ja3Mgd2l0aCAweEFBIGJ5dGVzIGFuZCB2
ZXJpZnkgdGhlbSB3aGVuIGEgYmxvY2sgaXMKKwkgYWxsb2NhdGVkIGluIG9yZGVyIHRvIHNwb3Qg
dXNlLWFmdGVyLWZyZWUgaXNzdWVzLgorCiBlbmRpZiAjIERFQlVHIHx8IEVYUEVSVAogCiBlbmRt
ZW51CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jIGIveGVuL2NvbW1vbi94
bWFsbG9jX3Rsc2YuYwppbmRleCA3MTU5N2MzNTkwLi5hMTJkYmM4ZTExIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCisrKyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMK
QEAgLTIyMyw2ICsyMjMsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIEVYVFJBQ1RfQkxPQ0tfSERS
KHN0cnVjdCBiaGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpwLCBpbnQgZmwKIHN0YXRpYyBpbmxp
bmUgdm9pZCBFWFRSQUNUX0JMT0NLKHN0cnVjdCBiaGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpw
LCBpbnQgZmwsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgc2wpCiB7Cisj
aWZkZWYgQ09ORklHX1BPT0xfUE9JU09OCisgICAgdW5zaWduZWQgaW50IGk7CisjZW5kaWYgLyog
Q09ORklHX1BPT0xfUE9JU09OICovCisKICAgICBpZiAoIGItPnB0ci5mcmVlX3B0ci5uZXh0ICkK
ICAgICAgICAgYi0+cHRyLmZyZWVfcHRyLm5leHQtPnB0ci5mcmVlX3B0ci5wcmV2ID0KICAgICAg
ICAgICAgIGItPnB0ci5mcmVlX3B0ci5wcmV2OwpAQCAtMjQwLDYgKzI0NCwxMCBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgRVhUUkFDVF9CTE9DSyhzdHJ1Y3QgYmhkciAqYiwgc3RydWN0IHhtZW1fcG9v
bCAqcCwgaW50IGZsLAogICAgICAgICB9CiAgICAgfQogICAgIGItPnB0ci5mcmVlX3B0ciA9IChz
dHJ1Y3QgZnJlZV9wdHIpIHtOVUxMLCBOVUxMfTsKKyNpZmRlZiBDT05GSUdfUE9PTF9QT0lTT04K
KyAgICBmb3IgKCBpID0gTUlOX0JMT0NLX1NJWkU7IGkgPCAoYi0+c2l6ZSAmIEJMT0NLX1NJWkVf
TUFTSyk7IGkrKyApCisgICAgICAgIEFTU0VSVChiLT5wdHIuYnVmZmVyW2ldID09IDB4QUEpOwor
I2VuZGlmIC8qIENPTkZJR19QT09MX1BPSVNPTiAqLwogfQogCiAvKioKQEAgLTI0Nyw2ICsyNTUs
MTEgQEAgc3RhdGljIGlubGluZSB2b2lkIEVYVFJBQ1RfQkxPQ0soc3RydWN0IGJoZHIgKmIsIHN0
cnVjdCB4bWVtX3Bvb2wgKnAsIGludCBmbCwKICAqLwogc3RhdGljIGlubGluZSB2b2lkIElOU0VS
VF9CTE9DSyhzdHJ1Y3QgYmhkciAqYiwgc3RydWN0IHhtZW1fcG9vbCAqcCwgaW50IGZsLCBpbnQg
c2wpCiB7CisjaWZkZWYgQ09ORklHX1BPT0xfUE9JU09OCisgICAgaWYgKCAoYi0+c2l6ZSAmIEJM
T0NLX1NJWkVfTUFTSykgPiBNSU5fQkxPQ0tfU0laRSApCisgICAgICAgIG1lbXNldChiLT5wdHIu
YnVmZmVyICsgTUlOX0JMT0NLX1NJWkUsIDB4QUEsCisgICAgICAgICAgICAgICAoYi0+c2l6ZSAm
IEJMT0NLX1NJWkVfTUFTSykgLSBNSU5fQkxPQ0tfU0laRSk7CisjZW5kaWYgLyogQ09ORklHX1BP
T0xfUE9JU09OICovCiAgICAgYi0+cHRyLmZyZWVfcHRyID0gKHN0cnVjdCBmcmVlX3B0cikge05V
TEwsIHAtPm1hdHJpeFtmbF1bc2xdfTsKICAgICBpZiAoIHAtPm1hdHJpeFtmbF1bc2xdICkKICAg
ICAgICAgcC0+bWF0cml4W2ZsXVtzbF0tPnB0ci5mcmVlX3B0ci5wcmV2ID0gYjsKLS0gCjIuMjAu
MS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
