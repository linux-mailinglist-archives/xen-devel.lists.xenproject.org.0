Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F97013A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 15:40:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpYV3-0000Qf-SL; Mon, 22 Jul 2019 13:37:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pI0n=VT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpYV2-0000Qa-0V
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 13:37:08 +0000
X-Inumbo-ID: c9adda54-ac85-11e9-821b-1f6401d13bfe
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9adda54-ac85-11e9-821b-1f6401d13bfe;
 Mon, 22 Jul 2019 13:37:03 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KtJrCB80M7CQVbGS+v61cP3S5YKMYXoKHWZSIiwFTHgd4jOHJCs9e131inxJeTdZD5ecf4z0Xf
 4ulFTE7uf3MTn64E/7YNB+2xQtQnKrxgSEM64qmY1rE9mSr+szv5r+xhud4+TWluDrj4XZ6GJP
 DjUQrzowBd2nt8/IA4pekYNmMSNCvr/Mdz1bI6M8L7d5v3prSnMY/H4WnCTnqOlILWKQU2Inx3
 a15Gnj5Znspm9A7gLEDA5iuApeOkMFeybYKO5KpgM7gH1RSmoqHlSQYf0XLMmTG7vhR60glHBz
 MKA=
X-SBRS: 2.7
X-MesageID: 3360012
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3360012"
To: Jan Beulich <JBeulich@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
 <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
 <9c6a7b4b-af52-c93d-480f-f34334de868a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <aeb53abe-af9e-37ba-9f25-90b6b30192fc@citrix.com>
Date: Mon, 22 Jul 2019 14:36:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9c6a7b4b-af52-c93d-480f-f34334de868a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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

T24gMjIvMDcvMjAxOSAwOTozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDcuMjAxOSAx
OToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTYvMDcvMjAxOSAxNzozOCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBAQCAtMTQyLDcgKzE3OCwxNSBAQCBzdGF0aWMgdm9pZCBmcmVlX2lu
dHJlbWFwX2VudHJ5KGNvbnN0IHN0Cj4+PiAgICB7Cj4+PiAgICAgICAgdW5pb24gaXJ0ZV9wdHIg
ZW50cnkgPSBnZXRfaW50cmVtYXBfZW50cnkoaW9tbXUsIGJkZiwgaW5kZXgpOwo+Pj4gICAgCj4+
PiAtICAgIEFDQ0VTU19PTkNFKGVudHJ5LnB0cjMyLT5yYXdbMF0pID0gMDsKPj4+ICsgICAgaWYg
KCBpb21tdS0+Y3RybC5nYV9lbiApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIEFDQ0VTU19PTkNF
KGVudHJ5LnB0cjEyOC0+cmF3WzBdKSA9IDA7Cj4+PiArICAgICAgICAvKiBMb3cgaGFsZiAoY29u
dGFpbmluZyBSZW1hcEVuKSBuZWVkcyB0byBiZSBjbGVhcmVkIGZpcnN0LiAqLwo+Pj4gKyAgICAg
ICAgYmFycmllcigpOwo+PiBXaGlsZSB0aGlzIHdpbGwgZnVuY3Rpb24gb24geDg2LCBJIHN0aWxs
IGNvbnNpZGVyIHRoaXMgYnVnZ3kuwqAgRnJvbSBhCj4+IGNvbmNlcHR1YWwgcG9pbnQgb2Ygdmll
dywgYmFycmllcigpIGlzIG5vdCB0aGUgY29ycmVjdCBjb25zdHJ1Y3Rpb24gdG8KPj4gdXNlLCB3
aGVyZWFzIHNtcF93bWIoKSBpcy4KPiBJIHRoaW5rIGl0J3MgdGhlIDNyZCB0aW1lIG5vdyB0aGF0
IEkgcmVzcG9uZCBzYXlpbmcgdGhhdCBiYXJyaWVyKCkgaXMKPiBhcyBnb29kIG9yIGFzIGJhZCBh
cyBzbXBfd21iKCksIGp1c3QgZm9yIGRpZmZlcmVudCByZWFzb25zLgoKYmFycmllcigpIGFuZCBz
bXBfd21iKCkgYXJlIGRpZmZlcmVudCBjb25zdHJ1Y3RzLCB3aXRoIHNwZWNpZmljLAoqZGlmZmVy
ZW50KiBtZWFuaW5ncy7CoCBGcm9tIGEgcHJvZ3JhbW1lcnMgcG9pbnQgb2YgdmlldywgdGhleSBz
aG91bGQgYmUKY29uc2lkZXJlZCBibGFjayBib3hlcyBvZiBmdW5jdGlvbmFsaXR5LgoKYmFycmll
cigpIGlzIGZvciBmb3JjaW5nIHRoZSBjb21waWxlciB0byBub3QgcmVvcmRlciB0aGluZ3MuCgpz
bXBfd21iKCkgaXMgYWJvdXQgdGhlIGV4dGVybmFsIHZpc2liaWxpdHkgb2Ygd3JpdGVzLCBhcyBv
YnNlcnZlZCBieSBhCmRpZmZlcmVudCBlbnRpdHkgb24gYSBjb2hlcmVudCBmYWJyaWMuCgpUaGUg
ZmFjdCB0aGV5IGFsaWFzIG9uIHg4NiBpbiBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2YgeDg2
IGNhY2hlCmNvaGVyZW5jeSAtIGl0IGRvZXMgbm90IG1lYW4gdGhleSBjYW4gbGVnaXRpbWF0ZWx5
IGJlIGFsdGVybmF0ZWQgaW4gY29kZS4KClRoaXMgcGllY2Ugb2YgY29kZSBpcyBhIDItd2F5IGNv
bW11bmljYXRpb24gYmV0d2VlbiB0aGUgQ1BVIGNvcmUgYW5kIHRoZQpJT01NVSwgb3ZlciBhIGNv
aGVyZW50IGNhY2hlLsKgIFRoZSBJT01NVSBsb2dpY2FsbHkgaGFzIGFuIHNtcF9ybWIoKSBpbgpp
dHMgbWlycm9yIGZ1bmN0aW9uYWxpdHkgKGFsdGhvdWdoIHRoYXQgaXMgbGlrZWx5IG5vdCBob3cg
dGhlIHByb3BlcnR5CmlzIGV4cHJlc3NlZCkuCgo+IFdoaWxlIEkKPiBhZ3JlZSB3aXRoIHlvdSB0
aGF0IGJhcnJpZXIoKSBpcyBjb3JyZWN0IG9uIHg4NiBvbmx5LCBJJ20geWV0IHRvIGhlYXIKPiBi
YWNrIGZyb20geW91IG9uIG15IGFyZ3VtZW50IHRoYXQgc21wX3dtYigpIGlzIGluY29ycmVjdCB3
aGVuCj4gY29uc2lkZXJpbmcgaXRzIFVQIHNlbWFudGljcyAod2hpY2ggd2UgZG9uJ3QgY3VycmVu
dGx5IGltcGxlbWVudCwgYnV0Cj4gd2hpY2ggTGludXggYXMgdGhlIG9yaWdpbiBvZiB0aGUgY29u
c3RydWN0IGNhbiB3ZWxsIGJlIHVzZWQgZm9yCj4gcmVmZXJlbmNlKS4KClVQIHZzIFNNUCBkb2Vz
bid0IGFmZmVjdCB3aGljaCBpcyB0aGUgY29ycmVjdCBjb25zdHJ1Y3QgdG8gdXNlLgoKPiAgQW5k
IEkgdGhpbmsgd2UgYm90aCBkb24ndCByZWFsbHkgd2FudCB3bWIoKSBoZXJlLgoKTm8sIGJlY2F1
c2Ugd21iKCkgaXMgZGVmaW5pdGVseSBub3QgdGhlIHJpZ2h0IHRoaW5nIHRvIHVzZS4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
