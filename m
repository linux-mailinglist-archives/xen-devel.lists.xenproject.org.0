Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A75F9F1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:20:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2Xa-0000VC-Ur; Thu, 04 Jul 2019 14:16:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3Ia=VB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hj2XY-0000V7-KS
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:16:48 +0000
X-Inumbo-ID: 595e33e8-9e66-11e9-860a-f79a4ec15eac
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 595e33e8-9e66-11e9-860a-f79a4ec15eac;
 Thu, 04 Jul 2019 14:16:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: e7dC7opLncksbC3vHJSr/ncsXiXaPLWLcmuN+KmqVW+syMvbmZEEgAY2GtUo2Tt6SfNj3CMAuF
 eVHveHqPr+RZtHQpADqQRh6DYo1v2CipXUaiCjRjcYbItR5JIfrH+xWIH9cWM/YQheJbMn/q8v
 v6ICX+RRY6Y68rWvCJcChBnwSnwDSxpXD4ZszcOqx56OyWHbcTUs+9qbc9ktvP4/MJZa+iFSSp
 DsAeg9waBTTnSlZvmV/uLwVgRX6NibkjB9Q1TipDNxpVRJmrQrawSUsOv+yeYR6Z+15NaLVdQX
 sQE=
X-SBRS: 2.7
X-MesageID: 2622645
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2622645"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <95252da8-777b-9527-6f5b-1e1a5994f845@suse.com>
 <6f03fb10-6339-610f-0620-86675d76a4ee@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e28b72a5-8c3e-104d-027e-225d04cfc12f@citrix.com>
Date: Thu, 4 Jul 2019 15:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <6f03fb10-6339-610f-0620-86675d76a4ee@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 05/23] x86emul: support AVX512F gather
 insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDcvMjAxOSAxNToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8wNy8yMDE5
IDEyOjE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVs
YXRlL3g4Nl9lbXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9l
bXVsYXRlLmMKPj4gQEAgLTkxMDAsNiArOTEwMCwxMzMgQEAgeDg2X2VtdWxhdGUoCj4+ICAgICAg
ICAgICBwdXRfc3R1YihzdHViKTsKPj4gICAKPj4gICAgICAgICAgIGlmICggcmMgIT0gWDg2RU1V
TF9PS0FZICkKPj4gKyAgICAgICAgICAgIGdvdG8gZG9uZTsKPj4gKwo+PiArICAgICAgICBzdGF0
ZS0+c2ltZF9zaXplID0gc2ltZF9ub25lOwo+PiArICAgICAgICBicmVhazsKPj4gKyAgICB9Cj4+
ICsKPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDkwKTogLyogdnBn
YXRoZXJke2QscX0gbWVtLFt4eXpdbW17a30gKi8KPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VW
RVhfNjYoMHgwZjM4LCAweDkxKTogLyogdnBnYXRoZXJxe2QscX0gbWVtLFt4eXpdbW17a30gKi8K
Pj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDkyKTogLyogdmdhdGhl
cmRwe3MsZH0gbWVtLFt4eXpdbW17a30gKi8KPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhf
NjYoMHgwZjM4LCAweDkzKTogLyogdmdhdGhlcnFwe3MsZH0gbWVtLFt4eXpdbW17a30gKi8KPj4g
KyAgICB7Cj4+ICsgICAgICAgIHR5cGVvZihldmV4KSAqcGV2ZXg7Cj4+ICsgICAgICAgIHVuaW9u
IHsKPj4gKyAgICAgICAgICAgIGludDMyX3QgZHdbMTZdOwo+PiArICAgICAgICAgICAgaW50NjRf
dCBxd1s4XTsKPj4gKyAgICAgICAgfSBpbmRleDsKPj4gKyAgICAgICAgYm9vbCBkb25lID0gZmFs
c2U7Cj4+ICsKPj4gKyAgICAgICAgQVNTRVJUKGVhLnR5cGUgPT0gT1BfTUVNKTsKPj4gKyAgICAg
ICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCghZXZleC5vcG1zayB8fCBldmV4LmJycyB8fCBldmV4
LnogfHwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldmV4LnJlZyAhPSAweGYg
fHwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb2RybV9yZWcgPT0gc3RhdGUt
PnNpYl9pbmRleCksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFWENfVUQpOwo+
PiArICAgICAgICBhdng1MTJfdmxlbl9jaGVjayhmYWxzZSk7Cj4+ICsgICAgICAgIGhvc3RfYW5k
X3ZjcHVfbXVzdF9oYXZlKGF2eDUxMmYpOwo+PiArICAgICAgICBnZXRfZnB1KFg4NkVNVUxfRlBV
X3ptbSk7Cj4+ICsKPj4gKyAgICAgICAgLyogUmVhZCBkZXN0aW5hdGlvbiBhbmQgaW5kZXggcmVn
aXN0ZXJzLiAqLwo+PiArICAgICAgICBvcGMgPSBpbml0X2V2ZXgoc3R1Yik7Cj4+ICsgICAgICAg
IHBldmV4ID0gY29weV9FVkVYKG9wYywgZXZleCk7Cj4+ICsgICAgICAgIHBldmV4LT5vcGN4ID0g
dmV4XzBmOwo+PiArICAgICAgICBvcGNbMF0gPSAweDdmOyAvKiB2bW92ZHFhezMyLDY0fSAqLwo+
PiArICAgICAgICAvKgo+PiArICAgICAgICAgKiBUaGUgcmVnaXN0ZXIgd3JpdGViYWNrIGJlbG93
IGhhcyB0byByZXRhaW4gbWFza2VkLW9mZiBlbGVtZW50cywgYnV0Cj4+ICsgICAgICAgICAqIG5l
ZWRzIHRvIGNsZWFyIHVwcGVyIHBvcnRpb25zIGluIHRoZSBpbmRleC13aWRlci10aGFuLWRhdGEg
Y2FzZXMuCj4+ICsgICAgICAgICAqIFRoZXJlZm9yZSByZWFkIChhbmQgd3JpdGUgYmVsb3cpIHRo
ZSBmdWxsIHJlZ2lzdGVyLiBUaGUgYWx0ZXJuYXRpdmUKPj4gKyAgICAgICAgICogd291bGQgaGF2
ZSBiZWVuIHRvIGZpZGRsZSB3aXRoIHRoZSBtYXNrIHJlZ2lzdGVyIHVzZWQuCj4+ICsgICAgICAg
ICAqLwo+PiArICAgICAgICBwZXZleC0+b3Btc2sgPSAwOwo+PiArICAgICAgICAvKiBVc2UgKCVy
YXgpIGFzIGRlc3RpbmF0aW9uIGFuZCBtb2RybV9yZWcgYXMgc291cmNlLiAqLwo+PiArICAgICAg
ICBwZXZleC0+YiA9IDE7Cj4+ICsgICAgICAgIG9wY1sxXSA9IChtb2RybV9yZWcgJiA3KSA8PCAz
Owo+PiArICAgICAgICBwZXZleC0+UlggPSAxOwo+PiArICAgICAgICBvcGNbMl0gPSAweGMzOwo+
PiArCj4+ICsgICAgICAgIGludm9rZV9zdHViKCIiLCAiIiwgIj1tIiAoKm1tdmFscCkgOiAiYSIg
KG1tdmFscCkpOwo+PiArCj4+ICsgICAgICAgIHBldmV4LT5wZnggPSB2ZXhfZjM7IC8qIHZtb3Zk
cXV7MzIsNjR9ICovCj4+ICsgICAgICAgIHBldmV4LT53ID0gYiAmIDE7Cj4+ICsgICAgICAgIC8q
IFN3aXRjaCB0byBzaWJfaW5kZXggYXMgc291cmNlLiAqLwo+PiArICAgICAgICBwZXZleC0+ciA9
ICFtb2RlXzY0Yml0KCkgfHwgIShzdGF0ZS0+c2liX2luZGV4ICYgMHgwOCk7Cj4+ICsgICAgICAg
IHBldmV4LT5SID0gIW1vZGVfNjRiaXQoKSB8fCAhKHN0YXRlLT5zaWJfaW5kZXggJiAweDEwKTsK
Pj4gKyAgICAgICAgb3BjWzFdID0gKHN0YXRlLT5zaWJfaW5kZXggJiA3KSA8PCAzOwo+PiArCj4+
ICsgICAgICAgIGludm9rZV9zdHViKCIiLCAiIiwgIj1tIiAoaW5kZXgpIDogImEiICgmaW5kZXgp
KTsKPj4gKyAgICAgICAgcHV0X3N0dWIoc3R1Yik7Cj4+ICsKPj4gKyAgICAgICAgLyogQ2xlYXIg
dW50b3VjaGVkIHBhcnRzIG9mIHRoZSBkZXN0aW5hdGlvbiBhbmQgbWFzayB2YWx1ZXMuICovCj4+
ICsgICAgICAgIG4gPSAxIDw8ICgyICsgZXZleC5sciAtICgoYiAmIDEpIHwgZXZleC53KSk7Cj4+
ICsgICAgICAgIG9wX2J5dGVzID0gNCA8PCBldmV4Lnc7Cj4+ICsgICAgICAgIG1lbXNldCgodm9p
ZCAqKW1tdmFscCArIG4gKiBvcF9ieXRlcywgMCwgNjQgLSBuICogb3BfYnl0ZXMpOwo+PiArICAg
ICAgICBvcF9tYXNrICY9ICgxIDw8IG4pIC0gMTsKPj4gKwo+PiArICAgICAgICBmb3IgKCBpID0g
MDsgb3BfbWFzazsgKytpICkKPj4gKyAgICAgICAgewo+PiArICAgICAgICAgICAgc2lnbmVkIGxv
bmcgaWR4ID0gYiAmIDEgPyBpbmRleC5xd1tpXSA6IGluZGV4LmR3W2ldOwo+IE5vIHNpZ25lZC7C
oCBIb3dldmVyLCBzdXJlbHkgdGhpcyBuZWVkcyB0byBiZSBpbnQ2NF90IGFueXdheSwgdG8gZnVu
Y3Rpb24KPiBjb3JyZWN0bHkgaW4gYSAzMmJpdCBidWlsZCBvZiB0aGUgdGVzdCBoYXJuZXNzPwo+
Cj4gVGhlIFNETSBzYXlzIFZQR0FUSEVSUUQgaXMgZW5jb2RhYmxlIGluIDMyYml0IHdpdGggcXVh
ZHdvcmQgaW5kaWNlcy4KPgo+IH5BbmRyZXcKPgo+PiArCj4+ICsgICAgICAgICAgICBpZiAoICEo
b3BfbWFzayAmICgxIDw8IGkpKSApCj4+ICsgICAgICAgICAgICAgICAgY29udGludWU7Cj4+ICsK
Pj4gKyAgICAgICAgICAgIHJjID0gb3BzLT5yZWFkKGVhLm1lbS5zZWcsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICB0cnVuY2F0ZV9lYShlYS5tZW0ub2ZmICsgKGlkeCA8PCBzdGF0ZS0+
c2liX3NjYWxlKSksCgpBY3R1YWxseSwgd2hhdCBTRE0gc2F5cyBpczoKCiJUaGUgc2NhbGVkIGlu
ZGV4IG1heSByZXF1aXJlIG1vcmUgYml0cyB0byByZXByZXNlbnQgdGhhbiB0aGUgYWRkcmVzcwpi
aXRzIHVzZWQgYnkgdGhlIHByb2Nlc3NvciAoZS5nLiwgaW4gMzItYml0IG1vZGUsIGlmIHRoZSBz
Y2FsZSBpcwpncmVhdGVyIHRoYW4gb25lKS4gSW4gdGhpcyBjYXNlLCB0aGUgbW9zdCBzaWduaWZp
Y2FudCBiaXRzIGJleW9uZCB0aGUKbnVtYmVyIG9mIGFkZHJlc3MgYml0cyBhcmUgaWdub3JlZC4i
CgpUaGF0IHJlYWRzIGFzIGlmIGl0IGlzIGl0IG1lYW5zICJlYS5tZW0ub2ZmICsgKHUzMikoaWR4
IDw8CnN0YXRlLT5zaWJfc2NhbGUpIi4KCkhvd2V2ZXIsIGdpdmVuIHRoZSBvdmVyYWxsIHRydW5j
YXRpb24sIEknbSBub3Qgc3VyZSBob3cgdG8gY29uZmlybSB3aGF0CnRoZSByZWFsIGJlaGF2aW91
ciBpcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
