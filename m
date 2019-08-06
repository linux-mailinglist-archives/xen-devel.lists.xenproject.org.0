Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D983697
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 18:21:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv2A3-0002nd-BT; Tue, 06 Aug 2019 16:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qF5n=WC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hv2A1-0002nW-7O
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 16:18:05 +0000
X-Inumbo-ID: c3668376-b865-11e9-90e1-c7557400fff5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3668376-b865-11e9-90e1-c7557400fff5;
 Tue, 06 Aug 2019 16:18:02 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /ILflmBGaJ7ADwGnN8aiVZ3IGngC2m+w+vCLXjHepxywjzV/SeKGo98fllsDw5Ol1j45zgIKbd
 TWj3pnzAcVLc5rZWkVe2gy6zHYBqs963jaIHEnEqkr9vJddwhQHF7DHXZ/4K5Efmd9csq3QdUq
 Mfko2egKgpAXjH15PA3NaSatyp1dqzWVIosI3qi9yOKit5RXviigKpNzjuHruThraXCdBbmECi
 1JUC+rPeJ8yl7Jb36TqdrOOZdH3Rwnemasri1XY3IDSWVecpgGTTse2gHR3XOt9CpTXuk/KD9w
 J68=
X-SBRS: 2.7
X-MesageID: 3929040
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="3929040"
Date: Tue, 6 Aug 2019 18:17:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
References: <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMTA6MDU6NDBBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAxMToyNTowNEFNIC0wNzAwLCBSb21h
biBTaGFwb3NobmlrIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBjb21wbGV0ZWx5IGZpeGVzIHRoZSBw
cm9ibGVtIGZvciBtZSEKPiA+IAo+ID4gVGhhbmtzIFJvZ2VyISBJJ2QgbG92ZSB0byBzZWUgdGhp
cyBpbiBYZW4gNC4xMwo+IAo+IFRoYW5rcyBmb3IgdGVzdGluZyEKPiAKPiBJdCdzIHN0aWxsIG5v
dCBjbGVhciB0byBtZSB3aHkgdGhlIHByZXZpb3VzIGFwcHJvYWNoIGRpZG4ndCB3b3JrLCBidXQK
PiBJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgYmV0dGVyIGJlY2F1c2UgaXQgcmVtb3ZlcyB0aGUgdXNh
Z2Ugb2YKPiB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkgZnJvbSBQViBkb21haW5zLiBJ
IHdpbGwgc3VibWl0IHRoaXMKPiBmb3JtYWxseSBub3cuCgpTb3JyeSB0byBib3RoZXIgYWdhaW4s
IGJ1dCBzaW5jZSB3ZSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGUKcHJldmlvdXMgZml4
IGRpZG4ndCB3b3JrIGZvciB5b3UsIGFuZCBJIGNhbid0IHJlcHJvZHVjZSB0aGlzIHdpdGggbXkK
aGFyZHdhcmUsIGNvdWxkIHlvdSBnaXZlIHRoZSBhdHRhY2hlZCBwYXRjaCBhIHRyeT8KCkFGQUlD
VCB0aGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG5vbi13b3JraW5nIHZlcnNpb24gYW5k
IHRoZQp3b3JraW5nIHZlcnNpb24gaXMgdGhlIGZsdXNoLCBzbyBJJ3ZlIGFkZGVkIGl0IGhlcmUu
CgpUaGFua3MsIFJvZ2VyLgotLS04PC0tLQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3Ay
bS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCmluZGV4IGZlZjk3YzgyZjYuLjM2MDU2MTRhYWYg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYworKysgYi94ZW4vYXJjaC94ODYvbW0v
cDJtLmMKQEAgLTEzNDEsNyArMTM0MSw3IEBAIGludCBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCiAKICAgICBpZiAoICFwYWdpbmdf
bW9kZV90cmFuc2xhdGUocDJtLT5kb21haW4pICkKICAgICB7Ci0gICAgICAgIGlmICggIW5lZWRf
aW9tbXVfcHRfc3luYyhkKSApCisgICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSApCiAgICAg
ICAgICAgICByZXR1cm4gMDsKICAgICAgICAgcmV0dXJuIGlvbW11X2xlZ2FjeV9tYXAoZCwgX2Rm
bihnZm5fbCksIF9tZm4oZ2ZuX2wpLCBQQUdFX09SREVSXzRLLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUpOwpAQCAtMTQz
Miw3ICsxNDMyLDcgQEAgaW50IGNsZWFyX2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sKQogCiAgICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNs
YXRlKGQpICkKICAgICB7Ci0gICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCisg
ICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSApCiAgICAgICAgICAgICByZXR1cm4gMDsKICAg
ICAgICAgcmV0dXJuIGlvbW11X2xlZ2FjeV91bm1hcChkLCBfZGZuKGdmbl9sKSwgUEFHRV9PUkRF
Ul80Syk7CiAgICAgfQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwppbmRleCA1ZDcyMjcw
YzViLi45ZmQ1Yzk3YmUyIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
aW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtMjAy
Niw3ICsyMDI2LDcgQEAgc3RhdGljIGludCBybXJyX2lkZW50aXR5X21hcHBpbmcoc3RydWN0IGRv
bWFpbiAqZCwgYm9vbF90IG1hcCwKICAgICBtcm1yci0+Y291bnQgPSAxOwogICAgIGxpc3RfYWRk
X3RhaWwoJm1ybXJyLT5saXN0LCAmaGQtPmFyY2gubWFwcGVkX3JtcnJzKTsKIAotICAgIHJldHVy
biAwOworICAgIHJldHVybiBpb21tdV9pb3RsYl9mbHVzaF9hbGwoZCwgSU9NTVVfRkxVU0hGX2Fk
ZGVkIHzCoElPTU1VX0ZMVVNIRl9tb2RpZmllZCk7CiB9CiAKIHN0YXRpYyBpbnQgaW50ZWxfaW9t
bXVfYWRkX2RldmljZSh1OCBkZXZmbiwgc3RydWN0IHBjaV9kZXYgKnBkZXYpCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
