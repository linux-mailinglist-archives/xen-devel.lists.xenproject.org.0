Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166D7CD1C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 21:49:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsuYg-0008Q4-F0; Wed, 31 Jul 2019 19:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWEJ=V4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsuYf-0008Pz-1g
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 19:46:45 +0000
X-Inumbo-ID: eaa48954-b3cb-11e9-bb3a-8bb25b721125
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaa48954-b3cb-11e9-bb3a-8bb25b721125;
 Wed, 31 Jul 2019 19:46:41 +0000 (UTC)
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
IronPort-SDR: iCyH1ogNnOKTDl+8kqKKVeeAijLqMTo7FnPYBpYQuhG/00JiOfELxISZllqupbzdkJ3uyAXKwZ
 7aWuAiYtWXm2xfW2JcDEveaEhryMa+9rhWtigpbz/cAMYvQYO9ZBIIWzEh9RDHISn4soo5ubhh
 +d7z3bNRtYT/L7XAWpwNEPA9bLSkqPrZq7N8f/xtroKE5r2ueEXq/G6qsl8k+8kvazRXJ31vW6
 RAdenvDjKgKxcH8vbqSHetIj4M9f4DXTc2XXfaMYbR+DeRWetik+UXqGPlF+rC2VH9A7W7nVoe
 6wI=
X-SBRS: 2.7
X-MesageID: 3806302
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,331,1559534400"; 
   d="scan'208";a="3806302"
To: Roman Shaposhnik <roman@zededa.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
Date: Wed, 31 Jul 2019 20:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
Content-Language: en-GB
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDcvMjAxOSAyMDozNSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBXZWQsIEp1
bCAzMSwgMjAxOSBhdCAxOjQzIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPiB3cm90ZToKPj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTA6MzY6MzFBTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDEwOjU1
OjI0QU0gLTA3MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4+Pj4gU29ycnkgLS0gZ290IGEg
Yml0IGRpc3RyYWN0ZWQgeWVzdGVyZGF5LiBBdHRhY2hlZCBpcyB0aGUgbG9nIHdpdGggb25seQo+
Pj4+IHlvdXIgbGF0ZXN0IHBhdGNoIGF0dGFjaGVkLiBJbnRlcmVzdGluZ2x5IGVub3VnaCB0aGUg
Ym94IGJvb3RlZCBmaW5lCj4+Pj4gd2l0aG91dCBzY3JlZW4gYXJ0aWZhY3RzLiBTbyBJIGd1ZXNz
IHdlJ3JlIGdldHRpbmcgY2xvc2VyLi4uCj4+Pj4KPj4+PiBUaGFua3MgZm9yIGFsbCB0aGUgaGVs
cCEKPj4+IFRoYXQncyBxdWl0ZSB3ZWlyZCwgdGhlcmUncyBubyBmdW5jdGlvbmFsIGNoYW5nZXMg
YmV0d2VlbiB0aGUKPj4+IHByZXZpb3VzIHBhdGNoZXMgYW5kIHRoaXMgb25lLCB0aGUgb25seSBk
aWZmZXJlbmNlIGlzIHRoYXQgdGhpcyBwYXRjaAo+Pj4gaGFzIG1vcmUgdmVyYm9zZSBvdXRwdXQu
Cj4+Pgo+Pj4gQXJlIHlvdSBzdXJlIHlvdSBkaWRuJ3QgaGF2ZSBhbnkgbG9jYWwgcGF0Y2hlcyBv
biB0b3Agb2YgWGVuIHRoYXQKPj4+IGNvdWxkIGV4cGxhaW4gdGhpcyBkaWZmZXJlbmNlIGluIGJl
aGF2aW91cj8KPj4gRldJVywgY2FuIHlvdSBwbGVhc2UgdHJ5IHRoZSBwbGFpbiBwYXRjaCBhZ2Fp
bjoKPj4KPj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE5LTA3L21zZzAxNTQ3Lmh0bWwKPj4KPj4gQW5kIHJlcG9ydCBiYWNrPwo+Pgo+PiBJ
IHdvdWxkIGxpa2UgdG8gZ2V0IHRoaXMgY29tbWl0dGVkIEFTQVAgaWYgaXQgZG9lcyBmaXggeW91
ciBpc3N1ZS4KPiBJJ2QgbGlrZSB0byBzYXkgdGhhdCBpdCBkaWQgLS0gYnV0IEkgdHJpZWQgaXQg
YWdhaW4ganVzdCBub3cgYW5kIGl0Cj4gc3RpbGwgZ2FyYmxlZCBzY3JlZW4gYW5kIHRvbnMgb2Y6
Cj4KPiAoWEVOKSBwcmludGs6IDI2NjY1IG1lc3NhZ2VzIHN1cHByZXNzZWQuCj4gKFhFTikgW1ZU
LURdRE1BUjpbRE1BIFJlYWRdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjAwOjAyLjBdIGZhdWx0IGFk
ZHIKPiA4ZTE0YzAwMCwgaW9tbXUgcmVnID0gZmZmZjgyYzAwMDhkZTAwMAo+Cj4gSSdtIHZlcnkg
bXVjaCBjb25mdXNlZCBieSB3aGF0J3MgZ29pbmcgb24sIGJ1dCBpdCBzZWVtcyB0aGF0J3MgdGhl
Cj4gY2FzZSAtLSBhZGRpbmcgdGhvc2UgZGVidWcgcHJpbnQgc3RhdGVtZW50cyBtYWtlIHRoZSBp
c3N1ZSBnbyBhd2F5Cj4KPiBIZXJlIGFyZSB0aGUgcGF0Y2hlcyB0aGF0IGFyZSBiZWluZyBhcHBs
aWVkOgo+ICAgIE5PVCBXT1JLSU5HOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ydnMvZXZlL2Jsb2Iv
eGVuLWJ1Zy9wa2cveGVuLzAxLWlvbW11LW1hcHBpbmdzLnBhdGNoCj4KPiAgICBXT1JLSU5HOiBo
dHRwczovL2dpdGh1Yi5jb20vcnZzL2V2ZS9ibG9iL2ExMjkxZmNkNGU2NjlkZjJhNjMyODVhZmI1
ZThiNDg0MWY0NWMxYzgvcGtnL3hlbi8wMS1pb21tdS1tYXBwaW5ncy5wYXRjaAo+Cj4gQXQgdGhp
cyBwb2ludCBJJ20gcmVhbGx5IG5vdCBzdXJlIHdoYXQncyBnb2luZyBvbi4KCk9rLsKgIHNlZWlu
ZyBhcyB5b3UndmUgZG91YmxlIGNoZWNrZWQgdGhpcywgdGhlIG15c3RlcnkgZGVlcGVucy4KCk15
IGJldCBpcyBvbiB0aGUgaW50ZWxfaW9tbXVfbG9va3VwX3BhZ2UoKSBjYWxsIGhhdmluZyBzaWRl
IGVmZmVjdHNbMV0uwqAKSWYgeW91IHRha2Ugb3V0IHRoZSBkZWJ1Z2dpbmcgaW4gdGhlIG1pZGRs
ZSBvZiB0aGUgbG9vcCBpbgpybXJyX2lkZW50aXR5X21hcHBpbmcoKSwgZG9lcyB0aGUgcHJvYmxl
bSByZXByb2R1Y2UgYWdhaW4/Cgp+QW5kcmV3CgpbMV0gTG9va2luZyBhdCB0aGUgaW50ZXJuYWxz
IG9mIGFkZHJfdG9fZG1hX3BhZ2VfbWFkZHIoKSwgaXQgZG9lcyAxMDAlCm1vcmUgbWVtb3J5IGFs
bG9jYXRpb24gYW5kIGhpZ2hlci1sZXZlbCBQVEUgY29uc3RydWN0aW9uIHRoYW4gbG9va3Mgd2lz
ZQpmb3Igd2hhdCBpcyBzdXBwb3NlZCB0byBiZSBhIGdldHRlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
