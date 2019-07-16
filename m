Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D867D6A6B9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 12:45:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnKuL-0001A3-Nz; Tue, 16 Jul 2019 10:42:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WCCO=VN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnKuJ-00019y-Sv
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 10:42:03 +0000
X-Inumbo-ID: 56e52014-a7b6-11e9-b879-7730fa39c1bf
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56e52014-a7b6-11e9-b879-7730fa39c1bf;
 Tue, 16 Jul 2019 10:42:00 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U2oARzWSx6ifqBdppWyjs3tudWN9rPoMwe+Fvmm9M0lmxGWR095rTJ4amdfE9LQjJtmbwvqJNm
 pFmzS99aaOQdkm0sHETurwgZ2ouMkKgfJY72JkN271eKikGSmEYj++A5MknALYd9t+h8dEsyJc
 nbFoPUqquQ0LEU4g4cBqR5gZR6fFj7ynS7ssvGvTYM+CiSKjSiXc2UP84cdufMo164ORYP01G+
 LPpplebSeYUig3JX+Mjo4Y8X+KK9dTaFNLJ6XVxNWYK42F1SgBZ7x6XAcQoCgdzXVr+zWQ+CMT
 Wos=
X-SBRS: 2.7
X-MesageID: 3028968
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3028968"
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-4-paul.durrant@citrix.com>
 <ebd58c3e-d973-3c59-c37b-4cae15165025@citrix.com>
 <2063f979-633e-b214-b3f9-8380e7666950@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a664569d-f8a5-0603-2c86-2302b7293a5c@citrix.com>
Date: Tue, 16 Jul 2019 11:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2063f979-633e-b214-b3f9-8380e7666950@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 3/4] iommu: introduce iommu_groups
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDcvMjAxOSAxMTozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTYuMDcuMjAxOSAx
MjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTYvMDcvMjAxOSAxMToxNiwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+Pj4gK2ludCBpb21tdV9ncm91cF9hc3NpZ24oc3RydWN0IHBjaV9kZXYg
KnBkZXYsIHZvaWQgKmFyZykKPj4+ICt7Cj4+PiArICAgIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMg
Km9wcyA9IGlvbW11X2dldF9vcHMoKTsKPj4+ICsgICAgaW50IGlkOwo+Pj4gKyAgICBzdHJ1Y3Qg
aW9tbXVfZ3JvdXAgKmdycDsKPj4+ICsKPj4+ICsgICAgaWYgKCAhb3BzLT5nZXRfZGV2aWNlX2dy
b3VwX2lkICkKPj4+ICsgICAgICAgIHJldHVybiAwOwo+Pj4gKwo+Pj4gKyAgICBpZCA9IG9wcy0+
Z2V0X2RldmljZV9ncm91cF9pZChwZGV2LT5zZWcsIHBkZXYtPmJ1cywgcGRldi0+ZGV2Zm4pOwo+
Pj4gKyAgICBpZiAoIGlkIDwgMCApCj4+PiArICAgICAgICByZXR1cm4gLUVOT0RBVEE7Cj4+PiAr
Cj4+PiArICAgIGdycCA9IGdldF9pb21tdV9ncm91cChpZCk7Cj4+PiArICAgIGlmICggIWdycCAp
Cj4+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsKPj4+ICsKPj4+ICsgICAgaWYgKCBpb21tdV92
ZXJib3NlICkKPj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiQXNzaWduICUwNHg6JTAy
eDolMDJ4LiV1IC0+IElPTU1VIGdyb3VwICV4XG4iLAo+PiBObyB1bmFkb3JuZWQgaGV4IG51bWJl
cnMgcGxlYXNlLsKgIFRoaXMgaXMgYSByZWNpcGUgZm9yIGNvbmZ1c2lvbiBkdXJpbmcKPj4gZGVi
dWdnaW5nLgo+Pgo+PiBFaXRoZXIgJSN4LCBvciAldSwgYW5kIG5lZWRzIHRvIGJlIGZpeGVkIG9u
IGNvbW1pdCBpZiB3ZSBnbyB3aXRoIHRoYXQgcm91dGUuCj4gSSBhc3N1bWUgKGhvcGUpIHRoYXQg
eW91IG1lYW4gdGhpcyBmb3IgdGhlIHJpZ2h0IG1vc3QgbnVtYmVyIG9ubHk7IGl0J3Mgbm90Cj4g
ZW50aXJlbHkgdW5hbWJpZ3VvdXMgZnJvbSB5b3VyIHJlcGx5LgoKT29wcyB5ZXMgLSBJIG9ubHkg
bWVhbnQgdGhlIElPTU1VIGdyb3VwIGZvcm1hdHRlci4KClRoZSBQQ0kgY29vcmRpbmF0ZXMgc2hv
dWxkIGdldCBzdWJzdW1lZCBieSAlcHAgaW4gZmFpcmx5IHNob3J0IG9yZGVyLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
