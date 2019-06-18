Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FED4A09E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 14:18:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdD2W-000767-84; Tue, 18 Jun 2019 12:16:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Le+r=UR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdD2T-00075w-WC
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 12:16:38 +0000
X-Inumbo-ID: e90b47e8-91c2-11e9-aea6-b368a355f8bf
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e90b47e8-91c2-11e9-aea6-b368a355f8bf;
 Tue, 18 Jun 2019 12:16:33 +0000 (UTC)
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
IronPort-SDR: dOosxyfFZhMDpmpNsH8e85yiwmq20LffxHidV8wRs1aBn89oHBa7C4Jduh+qxjQM9cNGx1jkV+
 JKBKTxouLF+q/U/RU/RSL851SoOp1ibaL//vOLCMiNq+aLfIhq/PDswS0qMfYRbCYHlwSCJsf0
 88cPRR2xKSguhUA4JYoXl44O59J0F3YorA231o2R9kp6y+f02pI+yIS+RdmEBHj/nCsUPoRyHu
 917Wtho6/wPhZbApkJixqSX1gGXM9Q5qAmX6PkaDTM2L54rknwigNBIoiU168mTnpoyfON/GWG
 b84=
X-SBRS: 2.7
X-MesageID: 1873933
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1873933"
To: Jan Beulich <JBeulich@suse.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024E3E0200007800237E03@prv1-mh.provo.novell.com>
 <7a2cfbe7-32d3-4349-66a3-84b4d1ecf6f6@citrix.com>
 <5D08D0D302000078002393C5@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bdecb55a-7381-5537-2786-db7bbf2b3eee@citrix.com>
Date: Tue, 18 Jun 2019 13:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D08D0D302000078002393C5@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/9] AMD/IOMMU: use bit field for IRTE
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDYvMjAxOSAxMjo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTguMDYuMTkg
YXQgMTI6MzcsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTMvMDYv
MjAxOSAxNDoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBBdCB0aGUgc2FtZSB0aW1lIHJlc3Ry
aWN0IGl0cyBzY29wZSB0byBqdXN0IHRoZSBzaW5nbGUgc291cmNlIGZpbGUKPj4+IGFjdHVhbGx5
IHVzaW5nIGl0LCBhbmQgYWJzdHJhY3QgYWNjZXNzZXMgYnkgaW50cm9kdWNpbmcgYSB1bmlvbiBv
Zgo+Pj4gcG9pbnRlcnMuIChBIHVuaW9uIG9mIHRoZSBhY3R1YWwgdGFibGUgZW50cmllcyBpcyBu
b3QgdXNlZCB0byBtYWtlIGl0Cj4+PiBpbXBvc3NpYmxlIHRvIFt3cm9uZ2x5LCBvbmNlIHRoZSAx
MjgtYml0IGZvcm0gZ2V0cyBhZGRlZF0gcGVyZm9ybQo+Pj4gcG9pbnRlciBhcml0aG1ldGljIC8g
YXJyYXkgYWNjZXNzZXMgb24gZGVyaXZlZCB0eXBlcy4pCj4+Pgo+Pj4gQWxzbyBtb3ZlIGF3YXkg
ZnJvbSB1cGRhdGluZyB0aGUgZW50cmllcyBwaWVjZW1lYWw6IENvbnN0cnVjdCBhIGZ1bGwgbmV3
Cj4+PiBlbnRyeSwgYW5kIHdyaXRlIGl0IG91dC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IEl0IHdvdWxkIGhhdmUgYmVl
biBuaWNlIHRvIHVzZSB3cml0ZV9hdG9taWMoKSBvciBBQ0NFU1NfT05DRSgpIGZvciB0aGUKPj4+
IGFjdHVhbCB3cml0ZXMsIGJ1dCBib3RoIGNhc3QgdGhlIHZhbHVlIHRvIGEgc2NhbGFyIG9uZSwg
d2hpY2ggZG9lc24ndAo+Pj4gc3VpdCB1cyBoZXJlIChhbmQgSSBhbHNvIGRpZG4ndCB3YW50IHRv
IG1ha2UgdGhlIGNvbXBvdW5kIHR5cGUgYSB1bmlvbgo+Pj4gd2l0aCBhIHJhdyBtZW1iZXIganVz
dCBmb3IgdGhpcykuCj4+Pgo+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2ludHIuYwo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2lu
dHIuYwo+Pj4gQEAgLTIzLDYgKzIzLDIzIEBACj4+PiAgI2luY2x1ZGUgPGFzbS9pb19hcGljLmg+
Cj4+PiAgI2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+Cj4+PiAgCj4+PiArc3RydWN0IGlydGVf
YmFzaWMgewo+PiBJJ2Qgc3VnZ2VzdCBpcnRlXzMyLCB0byBnbyB3aXRoIGlydGVfMTI4IGluIHRo
ZSBmb2xsb3dpbmcgcGF0Y2guIAo+Pgo+PiBUaGUgMTI4Yml0IGZvcm1hdCBpcyBhbHNvIHVzZWQg
Zm9yIHBvc3RlZCBpbnRlcnJ1cHRzLCBhbmQgaXNuJ3Qgc3BlY2lmaWMKPj4gdG8geDJhcGljIHN1
cHBvcnQuCj4gVGhlcmUgYXJlIHN0aWxsIHR3byBmb3JtcyBvZiAxMjgtYml0IGVudHJpZXMsIGFu
ZCB0aGUgaW50ZW50aW9uIHdpdGgKPiB0aGUgY2hvc2VuIG5hbWVzIHdhcyBmb3IgdGhlIG90aGVy
IG9uZSB0byBiZWNvbWUgaXJ0ZV9ndWVzdC4KClRoZXkgYXJlIG5vdCBmb3JtcyBvZiB3aGljaCBj
YW4gYmUgZGVsaW5lYXRlZCBieSBpcnRlX21vZGUsIGJlY2F1c2UgdGhlCmd1ZXN0X21vZGUgc2V0
dGluZyBpcyAoL3dpbGwgYmUpIHBlci1kb21haW4sIG5vdCBnbG9iYWwgKHdoaWNoIGlzCm5lY2Vz
c2FyeSBmb3Igc2FuZSB0ZXN0YWJpbGl0eSwgYW5kIGZvciBuZXN0ZWQtdmlydCBzdXBwb3J0IHdo
ZXJlIHRoZQpndWVzdCBWTUNCIGNvbnRyb2xzIGFyZW4ndCBzZXQgdXAgYnkgWGVuKS4KCj4KPj4g
RnVydGhlcm1vcmUsIGNhbGxpbmcgaXQgaXJ0ZV9mdWxsIGlzbid0IGEgdGVybSBJIGNhbiBzZWUg
aW4gdGhlIG1hbnVhbCwKPj4gYW5kIGlzIGZhbGxpbmcgaW50byB0aGUgbmFtaW5nIHRyYXAgdGhh
dCBVU0IgY3VycmVudGx5IGxpdmVzIGluLgo+IEV4Y2VwdCB0aGF0IG90aGVyIHRoYW4gZm9yIFVT
QidzIHRyYW5zZmVyIHNwZWVkcyBJIGNhbid0IHJlYWxseSBzZWUKPiB0aGlzIGdldHRpbmcgd2lk
ZXIgYW5kIHdpZGVyLgoKSXQgZG9lc24ndCBtYWtlIHRoZSBuYW1lcyAiYmFzaWMiIGFuZCAiZnVs
bCIgYW55IG1vcmUgZGVzY3JpcHRpdmUuCgo+Cj4+PiBAQCAtMTAxLDQ3ICsxMTgsNDQgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBhbGxvY19pbnRyZW1hcF9lbnRyeQo+Pj4gICAgICByZXR1cm4gc2xv
dDsKPj4+ICB9Cj4+PiAgCj4+PiAtc3RhdGljIHUzMiAqZ2V0X2ludHJlbWFwX2VudHJ5KGludCBz
ZWcsIGludCBiZGYsIGludCBvZmZzZXQpCj4+PiArc3RhdGljIHVuaW9uIGlydGVfcHRyIGdldF9p
bnRyZW1hcF9lbnRyeSh1bnNpZ25lZCBpbnQgc2VnLCB1bnNpZ25lZCBpbnQgYmRmLAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mZnNl
dCkKPj4gQXMgdGhpcyBpcyBjaGFuZ2luZywgcy9vZmZzZXQvZW50cnkvIHRvIGF2b2lkIGFueSBj
b25mdXNpb24gd2hlcmUgb2Zmc2V0Cj4+IG1pZ2h0IGJlIGluIHVuaXRzIG9mIGJ5dGVzLgo+IEkg
ZG9uJ3QgcmVhbGx5IG1pbmQgLSBJIHRoaW5rIGJvdGggbmFtZXMgYXJlIHN1ZmZpY2llbnRseSBj
bGVhciwgYnV0Cj4gSSdsbCBzd2l0Y2ggc2luY2UgeW91IHRoaW5rIHRoZSBvdGhlciBuYW1lIGlz
IGJldHRlci4KCkxvb2tpbmcgdGhyb3VnaCB0aGUgb3RoZXIgY29kZSwgaWR4IG9yIGluZGV4IHdv
dWxkIGFsc28gZG8gZmluZSwgYnV0IEkKdGhpbmsgYWxsIG9mIHRoZXNlIGFyZSBjbGVhcmVyIHRo
YW4gdXNpbmcgb2Zmc2V0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
