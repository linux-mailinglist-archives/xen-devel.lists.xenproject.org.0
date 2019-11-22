Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA510744C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 15:53:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYAHk-0005EL-R1; Fri, 22 Nov 2019 14:51:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cGBV=ZO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iYAHk-0005EG-7Y
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 14:51:48 +0000
X-Inumbo-ID: 9b570c6c-0d37-11ea-9631-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b570c6c-0d37-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574434307;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=osTIc4ogmkfy59IPpxN67OWjWuQWfjSaaU4dLzpx/Pw=;
 b=RPu/p2lHZgoWhdR3BRAA42Bpszon7zm3TtLRR3CxiOUdSfiAqg1j+cxa
 ZfTjFjIN5PD7I0EnumaT34VpjqTpUlT1V6Dcu5//pkgkfb5Ywsnj3wXvw
 9mhMDjnGMHgQJI0S6h6QSXWVUdAOdfig/PyY/sg+jpryvoDMrk40/sf30 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: d/RBVyIc4wGIxoy4V9nWckiUiSOP5RhORJAKq52AOxgYSHnrji2hKj8UkAigBOxb+1b4bn+EEh
 oMyyYw+qbctckJ6X/s+kCqoNdLHMPqkDQpZaC2ugeWY7E6sEUAFEJSRyOT4OWbPKVqX1shloII
 tB+Y+nk6lITQh5B/8JqpstAQOPrh2adznRLD/1mO3p0U0NiXVEpnzKdIDF//sVtzAX86TMmywQ
 0gJLuItHumpQ7+D3Gg3UHD6ZD68GHwV3WD9X8HVAPiE2SHhw6Dg4dtE3ndghjbiTkE94qyUH5x
 ZSs=
X-SBRS: 2.7
X-MesageID: 9259230
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,230,1571716800"; 
   d="scan'208";a="9259230"
To: Jan Beulich <jbeulich@suse.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-2-andrew.cooper3@citrix.com>
 <20191122123716.GX72134@Air-de-Roger>
 <581b0f48-cd25-7a80-1b13-2bbe51fc2904@suse.com>
 <629651d1-0dea-4f03-edbe-397d2f4f54f2@citrix.com>
 <3ab517bf-8023-3894-c6a9-ddd49d2c5ef5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ad14469e-0a94-2d2f-05b6-8fc9b6df8d20@citrix.com>
Date: Fri, 22 Nov 2019 14:51:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3ab517bf-8023-3894-c6a9-ddd49d2c5ef5@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Fix fault semantics for early
 task switch failures
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTEvMjAxOSAxMzozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjIuMTEuMjAxOSAx
NDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjIvMTEvMjAxOSAxMzowOCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMi4xMS4yMDE5IDEzOjM3LCBSb2dlciBQYXUgTW9ubsOpICB3
cm90ZToKPj4+PiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAxMDoxNTo1MFBNICswMDAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiBUaGUgVlQteCB0YXNrIHN3aXRjaCBoYW5kbGVyIGFkZHMg
aW5zdF9sZW4gdG8gcmlwIGJlZm9yZSBjYWxsaW5nCj4+Pj4+IGh2bV90YXNrX3N3aXRjaCgpLiAg
VGhpcyBjYXVzZXMgZWFybHkgZmF1bHRzIHRvIGJlIGRlbGl2ZXJlZCB0byB0aGUgZ3Vlc3Qgd2l0
aAo+Pj4+PiB0cmFwIHNlbWFudGljcywgYW5kIGJyZWFrIHJlc3RhcnRpYmlsaXR5Lgo+Pj4+Pgo+
Pj4+PiBJbnN0ZWFkLCBwYXNzIHRoZSBpbnN0cnVjdGlvbiBsZW5ndGggaW50byBodm1fdGFza19z
d2l0Y2goKSBhbmQgd3JpdGUgaXQgaW50bwo+Pj4+PiB0aGUgb3V0Z29pbmcgdHNzIG9ubHksIGxl
YXZpbmcgcmlwIGluIGl0cyBvcmlnaW5hbCBsb2NhdGlvbi4KPj4+Pj4KPj4+Pj4gRm9yIG5vdywg
cGFzcyAwIG9uIHRoZSBTVk0gc2lkZS4gIFRoaXMgaGlnaGxpZ2h0cyBhIHNlcGFyYXRlIHByZWV4
aXN0aW5nIGJ1Zwo+Pj4+PiB3aGljaCB3aWxsIGJlIGFkZHJlc3NlZCBpbiB0aGUgZm9sbG93aW5n
IHBhdGNoLgo+Pj4+Pgo+Pj4+PiBXaGlsZSBhZGp1c3RpbmcgY2FsbCBzaXRlcywgZHJvcCB0aGUg
dW5uZWNlc3NhcnkgdWludDE2X3QgY2FzdC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+PiBDb2RlIExHVE06Cj4+
Pj4KPj4+PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBJdCBv
Y2N1cnMgdG8gbWUgdGhhdCB0aGlzIGFsc28gZml4ZXMgYSB2bWVudHJ5IGZhaWx1cmUgaW4gdGhl
IGNvcm5lcgo+PiBjYXNlIHRoYXQgYW4gaW5zdHJ1Y3Rpb24sIHdoaWNoIGNyb3NzZXMgdGhlIDRH
PT4wIGJvdW5kYXJ5IHRha2VzIGEKPj4gZmF1bHQuwqAgJXJpcCB3aWxsIGJlIGFkanVzdGVkIHdp
dGhvdXQgYmVpbmcgdHJ1bmNhdGVkLgo+IEkgd2FzIGFib3V0IHRvIHNheSBzbyBpbiBteSBlYXJs
aWVyIHJlcGx5LCB1bnRpbCBJIHBhaWQgYXR0ZW50aW9uCj4gdG8gdGhpcwo+Cj4gQEAgLTI5ODcs
NyArMjk4Nyw3IEBAIHZvaWQgaHZtX3Rhc2tfc3dpdGNoKAo+ICAgICAgaWYgKCB0YXNrc3dpdGNo
X3JlYXNvbiA9PSBUU1dfaXJldCApCj4gICAgICAgICAgZWZsYWdzICY9IH5YODZfRUZMQUdTX05U
Owo+ICAKPiAtICAgIHRzcy5laXAgICAgPSByZWdzLT5laXA7Cj4gKyAgICB0c3MuZWlwICAgID0g
cmVncy0+ZWlwICsgaW5zbl9sZW47Cj4KPiB0b2dldGhlciB3aXRoIHRoZSBzdWJzZXF1ZW50Cj4K
PiAgICAgcmVncy0+cmlwICAgID0gdHNzLmVpcDsKPgo+IGFscmVhZHkgaGF2aW5nIHRha2VuIGNh
cmUgb2YgdGhpcyBhc3BlY3QgYmVmb3JlLCBhZmFpY3QuCgpUaGlzIHRha2VzIGNhcmUgb2YgdGhp
bmdzIGZvciBhIHRhc2sgc3dpdGNoIHdoaWNoIGNvbXBsZXRlcwpzdWNjZXNzZnVsbHksIGJ1dCBu
b3QgZm9yIG9uZSB3aGljaCBmYXVsdGVkIChhbmQgZW5kZWQgdXAgZGVsaXZlcmluZwp3aXRoIHRy
YXAgc2VtYW50aWNzKS7CoCBJbiB0aGF0IGNhc2UsIHRoZSAobm93IGRlbGV0ZWQpIHJlZ3MtPnJp
cCArPQppbnN0X2xlbjsgd291bGQgZW5kIHVwIHVuLXRydW5jYXRlZC4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
