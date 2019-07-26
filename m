Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B2764ED
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 13:54:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqykL-00055O-3L; Fri, 26 Jul 2019 11:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqykK-00055J-3G
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:50:48 +0000
X-Inumbo-ID: 98fcccf8-af9b-11e9-b5ba-ab3ecbb9d7db
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98fcccf8-af9b-11e9-b5ba-ab3ecbb9d7db;
 Fri, 26 Jul 2019 11:50:43 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kMSuuOWle3q+T8xoUCeapXgQW2qF8UlhRCGHiaoFfiuOXMCC+SrUDk5l35iwwpgsPSmYS+cNxl
 8uSlDwFc1Sd/he8SKc3/uy5vrv45mOsxNgM1dfyZSJb5g/4C+zTrsetzyNH1DBK2k3dwue7aiA
 EVM4cqCH/3hhsmXxukaRn/w8qiPwBLwoCN5Quv/dftad121hT+MVlLk2k+dgCWrfcrgcouP/WM
 2i1Sm+lsA+AWKsFiRgO6coWnTm1uDXK/sKY7DsQTwcCMnFDMM3XdYIjz5NptP5lCT37m1QyvvR
 K9o=
X-SBRS: 2.7
X-MesageID: 3468866
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3468866"
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-3-jgross@suse.com>
 <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
 <4e74ddbe-f6f1-02e9-82f3-5f07e060ba19@suse.com>
 <1f382b48-c3ba-f427-85d7-3c88403d8deb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0f067c18-b9c3-f5bf-de82-9feb9f9b6cba@citrix.com>
Date: Fri, 26 Jul 2019 12:50:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1f382b48-c3ba-f427-85d7-3c88403d8deb@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDcvMjAxOSAxMjo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNi4wNy4xOSAx
MzozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2LjA3LjIwMTkgMTE6NDYsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAyNC8wNy8yMDE5IDEyOjI2LCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+IEBAIC0xODIsMzAgKzE3OCwyNCBAQCBzdGF0aWMgdm9pZCBfX3ByZXBhcmVfdG9fd2Fp
dChzdHJ1Y3QKPj4+PiB3YWl0cXVldWVfdmNwdSAqd3F2KQo+Pj4+IMKgwqAgc3RhdGljIHZvaWQg
X19maW5pc2hfd2FpdChzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdikKPj4+PiDCoMKgIHsKPj4+
PiDCoMKgwqDCoMKgwqAgd3F2LT5lc3AgPSBOVUxMOwo+Pj4+IC3CoMKgwqAgKHZvaWQpdmNwdV9z
ZXRfaGFyZF9hZmZpbml0eShjdXJyZW50LCAmd3F2LT5zYXZlZF9hZmZpbml0eSk7Cj4+Pj4gK8Kg
wqDCoCB2Y3B1X3RlbXBvcmFyeV9hZmZpbml0eShjdXJyZW50LCBOUl9DUFVTLCBWQ1BVX0FGRklO
SVRZX1dBSVQpOwo+Pj4+IMKgwqAgfQo+Pj4+IMKgwqAgwqDCoCB2b2lkIGNoZWNrX3dha2V1cF9m
cm9tX3dhaXQodm9pZCkKPj4+PiDCoMKgIHsKPj4+PiAtwqDCoMKgIHN0cnVjdCB3YWl0cXVldWVf
dmNwdSAqd3F2ID0gY3VycmVudC0+d2FpdHF1ZXVlX3ZjcHU7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qg
dmNwdSAqY3VyciA9IGN1cnJlbnQ7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUg
KndxdiA9IGN1cnItPndhaXRxdWV1ZV92Y3B1Owo+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgIEFTU0VS
VChsaXN0X2VtcHR5KCZ3cXYtPmxpc3QpKTsKPj4+PiDCoMKgIMKgwqDCoMKgwqDCoCBpZiAoIGxp
a2VseSh3cXYtPmVzcCA9PSBOVUxMKSApCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+Pj4+IMKgwqAgLcKgwqDCoCAvKiBDaGVjayBpZiB3ZSB3b2tlIHVwIG9uIHRoZSB3cm9uZyBD
UFUuICovCj4+Pj4gLcKgwqDCoCBpZiAoIHVubGlrZWx5KHNtcF9wcm9jZXNzb3JfaWQoKSAhPSB3
cXYtPndha2V1cF9jcHUpICkKPj4+PiArwqDCoMKgIC8qIENoZWNrIGlmIHdlIGFyZSBzdGlsbCBw
aW5uZWQuICovCj4+Pj4gK8KgwqDCoCBpZiAoIHVubGlrZWx5KCEoY3Vyci0+YWZmaW5pdHlfYnJv
a2VuICYgVkNQVV9BRkZJTklUWV9XQUlUKSkgKQo+Pj4+IMKgwqDCoMKgwqDCoCB7Cj4+Pj4gLcKg
wqDCoMKgwqDCoMKgIC8qIFJlLXNldCBWQ1BVIGFmZmluaXR5IGFuZCByZS1lbnRlciB0aGUgc2No
ZWR1bGVyLiAqLwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJl
bnQ7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGNwdW1hc2tfY29weSgmd3F2LT5zYXZlZF9hZmZpbml0
eSwgY3Vyci0+Y3B1X2hhcmRfYWZmaW5pdHkpOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIHZj
cHVfc2V0X2hhcmRfYWZmaW5pdHkoY3VyciwKPj4+PiBjcHVtYXNrX29mKHdxdi0+d2FrZXVwX2Nw
dSkpICkKPj4+PiAtwqDCoMKgwqDCoMKgwqAgewo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdkcHJpbnRrKFhFTkxPR19FUlIsICJVbmFibGUgdG8gc2V0IHZjcHUgYWZmaW5pdHlcbiIpOwo+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbWFpbl9jcmFzaChjdXJyZW50LT5kb21haW4p
Owo+Pj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHdhaXQoKTsgLyog
dGFrZXMgdXMgYmFjayBpbnRvIHRoZSBzY2hlZHVsZXIgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqAg
Z2RwcmludGsoWEVOTE9HX0VSUiwgInZjcHUgYWZmaW5pdHkgbG9zdFxuIik7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGRvbWFpbl9jcmFzaChjdXJyLT5kb21haW4pOwo+Pj4+IMKgwqDCoMKgwqDCoCB9
Cj4+Pgo+Pj4gSSdtIHNvcnJ5IHRvIHJldHJhY3QgbXkgUi1ieSBhZnRlciB0aGUgZmFjdCwgYnV0
IEkndmUgb25seSBqdXN0IG5vdGljZWQKPj4+ICh3aGlsZSByZWJhc2luZyBzb21lIG9mIG15IHBl
bmRpbmcgd29yayBvdmVyIHRoaXMpIHRoYXQgaXQgaXMgYnVnZ3kuCj4+Pgo+Pj4gVGhlIHJlYXNv
biB3YWl0KCkgd2FzIGNhbGxlZCBpcyBiZWNhdXNlIGl0IGlzIG5vdCBzYWZlIHRvIGxlYXZlIHRo
YXQKPj4+IGlmKCkgY2xhdXNlLgo+Pj4KPj4+IFdpdGggdGhpcyBjaGFuZ2UgaW4gcGxhY2UsIHdl
J2xsIGFycmFuZ2UgZm9yIHRoZSBWTSB0byBiZSBjcmFzaGVkLCB0aGVuCj4+PiBsb25nanVtcCBi
YWNrIGludG8gdGhlIHN0YWNrIGZyb20gZnJvbSB0aGUgd2FpdGluZyB2Q1BVLCBvbiB0aGUgd3Jv
bmcKPj4+IENQVS7CoCBBbnkgY2FsbGVyIHdpdGggc21wX3Byb2Nlc3Nvcl9pZCgpIG9yIHRocmVh
ZC1sb2NhbCB2YXJpYWJsZXMKPj4+IGNhY2hlCj4+PiBieSBwb2ludGVyIG9uIHRoZSBzdGFjayB3
aWxsIHRoZW4gY2F1c2UgbWVtb3J5IGNvcnJ1cHRpb24uCj4+Pgo+Pj4gSXRzIG5vdCBpbW1lZGlh
dGVseSBvYnZpb3VzIGhvdyB0byBmaXggdGhpcywgYnV0IGJlYXIgaW4gbWluZCB0aGF0IGFzCj4+
PiBzb29uIGFzIHRoZSB2bS1ldmVudCBpbnRlcmZhY2UgaXMgZG9uZSwgSSBwbGFuIHRvIGRlbGV0
ZSB0aGlzIHdob2xlCj4+PiB3YWl0cXVldWUgaW5mcmFzdHJ1Y3R1cmUgYW55d2F5Lgo+Pgo+PiBJ
biB3aGljaCBjYXNlIC0gc2hvdWxkIHdlIHJldmVydCB0aGUgY29tbWl0IHVudGlsIHRoaXMgaXMg
cmVzb2x2ZWQ/Cj4KPiBJbiBteSBvcGluaW9uIGl0IGlzIG5vdCB0aGF0IHVyZ2VudC4gSSBkb24n
dCB0aGluayBhbnkgb2Ygb3VyIE9TU3Rlc3RzCj4gd2lsbCBldmVyIGJlIGFibGUgdG8gdHJpZ2dl
ciB0aGlzIGlzc3VlLCBhcyBBRkFJSyBubyB0ZXN0IGlzIHVzaW5nIHRoZQo+IHdhaXRfZXZlbnQo
KSBpbnRlcmZhY2Ugbm9yIGRvIHRoZXkgdGVzdCBzdXNwZW5kL3Jlc3VtZS4gQW5kIGJvdGggbmVl
ZAo+IHRvIGJlIHRydWUgKGF0IHRoZSBzYW1lIHRpbWUhKSBwbHVzIGEgY3B1IG5lZWRzIHRvIGZh
aWwgY29taW5nIHVwIHdoZW4KPiByZXN1bWluZyBhZ2Fpbi4KClllYWggLSBJIGRvbid0IHRoaW5r
IHJldmVydGluZyBpdCBpcyBuZWNlc3NhcnksIGJ1dCBJIHdpbGwgZmxhZwoicmVzb2x2aW5nIHRo
aXMgc29tZWhvdyIgYXMgYSA0LjEyIGJsb2NrZXIuCgpUaGUgSFZJIHNjYWxlIHRlc3RzIHRyaWdn
ZXIgdGhpcyBwYXRoLsKgIEd1ZXNzIGhvdyBJIGRpc2NvdmVyZWQgdGhhdApJbnRyb3NwZWN0aW9u
ICsgTGl2ZXBhdGNoaW5nID0gYm9vbS4KCkkgYW0gbGVhbmluZyBvbiB0aGUgc2lkZSBvZiBwYW5p
YygpLsKgIEkgYWdyZWUgdGhhdCBpZiB0aGUgQVBJcyBhcmUgdXNlZApjb3JyZWN0bHksIGl0IGNh
bid0IG9jY3VyLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
