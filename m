Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE59701AB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 15:49:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpYd1-00019S-MD; Mon, 22 Jul 2019 13:45:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pI0n=VT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpYcz-00019N-SX
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 13:45:21 +0000
X-Inumbo-ID: f0cfe130-ac86-11e9-9e7d-9be9f3678784
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0cfe130-ac86-11e9-9e7d-9be9f3678784;
 Mon, 22 Jul 2019 13:45:18 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: enaWqO1+W7IeqoA4C13DV2mCqxDjIB3sJaKZY8aLIqmi8efFA7iXnsBk8mdHLetTehw7nAOx1j
 D4mYEQXO/mG5NS1Zaga3eGt9UVOkL8ff2VxF235R9eImFjM8xLCtwKw5GQR1D31C0dbTxiRLFv
 bQ1vpsKe+TBkfya2A4/3xxi7+1DZdu6XGW5OmGDRZmTTGOKu+pE75pq15A22OLHyBuiuoxZTPj
 Wyc8hoVY94HcyyA7jaDmjpvdcMw1UQtCKpF5jBrSYmDxVsesST/1Fs/LFyji57zJAWZV2Y2ltM
 O3k=
X-SBRS: 2.7
X-MesageID: 3299172
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3299172"
To: Jan Beulich <JBeulich@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <f8421e6c-3553-7f98-ab20-a26f4dcf8ee1@suse.com>
 <19abc8e5-daae-d967-5c5e-03caccd03c96@citrix.com>
 <470e27a0-9a9e-7cd6-9d59-d0b4a4a5fc3a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5ead25e8-d55d-1b4d-73f6-6048054adb15@citrix.com>
Date: Mon, 22 Jul 2019 14:45:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <470e27a0-9a9e-7cd6-9d59-d0b4a4a5fc3a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 11/14] AMD/IOMMU: adjust setup of
 internal interrupt for x2APIC mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDcvMjAxOSAwOTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDcuMjAxOSAx
OTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTYvMDcvMjAxOSAxNzozOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlv
bW11LWRlZnMuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21t
dS1kZWZzLmgKPj4+IEBAIC00MTYsNiArNDE2LDI1IEBAIHVuaW9uIGFtZF9pb21tdV9leHRfZmVh
dHVyZXMgewo+Pj4gICAgICAgIH0gZmxkczsKPj4+ICAgIH07Cj4+PiAgICAKPj4+ICsvKiB4MkFQ
SUMgQ29udHJvbCBSZWdpc3RlcnMgKi8KPj4+ICsjZGVmaW5lIElPTU1VX1hUX0lOVF9DVFJMX01N
SU9fT0ZGU0VUCQkweDAxNzAKPj4+ICsjZGVmaW5lIElPTU1VX1hUX1BQUl9JTlRfQ1RSTF9NTUlP
X09GRlNFVAkweDAxNzgKPj4+ICsjZGVmaW5lIElPTU1VX1hUX0dBX0lOVF9DVFJMX01NSU9fT0ZG
U0VUCTB4MDE4MAo+Pj4gKwo+Pj4gK3VuaW9uIGFtZF9pb21tdV94MmFwaWNfY29udHJvbCB7Cj4+
PiArICAgIHVpbnQ2NF90IHJhdzsKPj4+ICsgICAgc3RydWN0IHsKPj4+ICsgICAgICAgIHVuc2ln
bmVkIGludCA6MjsKPj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBkZXN0X21vZGU6MTsKPj4+ICsg
ICAgICAgIHVuc2lnbmVkIGludCA6NTsKPj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBkZXN0X2xv
OjI0Owo+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IHZlY3Rvcjo4Owo+Pj4gKyAgICAgICAgdW5z
aWduZWQgaW50IGludF90eXBlOjE7IC8qIERNIGluIElPTU1VIHNwZWMgMy4wNCAqLwo+Pj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IDoxNTsKPj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBkZXN0X2hp
Ojg7Cj4+IEJvb2wgYml0ZmllbGRzIGxpa2UgeW91J3ZlIGRvbmUgZWxzZXdoZXJlIGluIHYzPwo+
IEknZCBiZWVuIGNvbnNpZGVyaW5nIHRoaXMsIGJ1dCBkZWNpZGVkIGFnYWluc3QgYmVjYXVzZSBv
ZiAuLi4KPgo+ICtzdGF0aWMgdm9pZCBzZXRfeDJhcGljX2FmZmluaXR5KHN0cnVjdCBpcnFfZGVz
YyAqZGVzYywgY29uc3QgY3B1bWFza190ICptYXNrKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgYW1kX2lv
bW11ICppb21tdSA9IGRlc2MtPmFjdGlvbi0+ZGV2X2lkOwo+ICsgICAgdW5zaWduZWQgaW50IGRl
c3QgPSBzZXRfZGVzY19hZmZpbml0eShkZXNjLCBtYXNrKTsKPiArICAgIHVuaW9uIGFtZF9pb21t
dV94MmFwaWNfY29udHJvbCBjdHJsID0ge307Cj4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+
ICsKPiArICAgIGlmICggZGVzdCA9PSBCQURfQVBJQ0lEICkKPiArICAgICAgICByZXR1cm47Cj4g
Kwo+ICsgICAgbXNpX2NvbXBvc2VfbXNnKGRlc2MtPmFyY2gudmVjdG9yLCBOVUxMLCAmaW9tbXUt
Pm1zaS5tc2cpOwo+ICsgICAgaW9tbXUtPm1zaS5tc2cuZGVzdDMyID0gZGVzdDsKPiArCj4gKyAg
ICBjdHJsLmRlc3RfbW9kZSA9IE1BU0tfRVhUUihpb21tdS0+bXNpLm1zZy5hZGRyZXNzX2xvLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVNJX0FERFJfREVTVE1PREVfTUFTSyk7
Cj4gKyAgICBjdHJsLmludF90eXBlID0gTUFTS19FWFRSKGlvbW11LT5tc2kubXNnLmRhdGEsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TSV9EQVRBX0RFTElWRVJZX01PREVfTUFT
Syk7Cj4KPiAuLi4gdGhpczogV2UgcmVhbGx5IG1lYW4gYSB2YWx1ZSBjb3B5IGhlcmUsIG5vdCBh
biAiaXMgemVybyIgb3IKPiAiaXMgbm9uLXplcm8iIG9uZS4gSSBhbHNvIHRoaW5rIHRoYXQgYm90
aCBmaWVsZHMgYXJlIG5vdCBzdWl0YWJseQo+IG5hbWVkIGZvciBiZWluZyBib29sZWFuLiBJbiB0
aGUgcmVjZW50IHJlLXdvcmsgb2Ygc3RydWN0Cj4gSU9fQVBJQ19yb3V0ZV9lbnRyeSAoY2E5MzEw
YjI0ZSkgc2ltaWxhciBmaWVsZHMgc2ltaWxhcmx5IHdlcmUKPiBsZWZ0IGFzICJ1bnNpZ25lZCBp
bnQiLiBNU0kncyBzdHJ1Y3QgbXNnX2RhdGEgYWxzbyBmYWxscyBpbnRvIHRoZQo+IHNhbWUgY2F0
ZWdvcnkuIEkgdGhpbmsgaWYgd2Ugd2FudGVkIHRvIHN3aXRjaCB0byBib29sIGhlcmUsIHdlCj4g
c2hvdWxkIGRvIHNvIGV2ZXJ5d2hlcmUgYXQgdGhlIHNhbWUgdGltZSAoYWxvbmcgd2l0aCBzdWl0
YWJseQo+IHJlbmFtaW5nIGZpZWxkcykuCgpBcmNoaXRlY3R1cmFsbHksIGJvdGggb2YgdGhlc2Ug
YXJlIHNpbmdsZS1iaXQgZmllbGRzLCBubz8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
