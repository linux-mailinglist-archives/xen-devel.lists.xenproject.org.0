Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD162026B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 11:21:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRCX9-0006eN-1u; Thu, 16 May 2019 09:18:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRCX6-0006eI-Tp
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:18:36 +0000
X-Inumbo-ID: 92fd034e-77bb-11e9-9544-d3bbfb1820df
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92fd034e-77bb-11e9-9544-d3bbfb1820df;
 Thu, 16 May 2019 09:18:32 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: PB3vPstMVXQiYusZQ7wsiXAOvZKVRSbEYFL8hNFa5mDSXN2YxFZvZv//lDvReCmWpHB39HWKf9
 wrTn2GvJOhJHDq94ONPnyHghr4rMU3Ryy10bTOV0Dd9x8J3rq9RmfOUzvRYn8lbKRIvKunBh4u
 9KYJX3nzkpUFsINgDecMC8DbcY156yOk29ZsqET5fBvSdZRjhn466dS16OPBd1+wraD2CySBaO
 58I0NOVG5v3SXmzRs7LYNWz+RC2t790Hh/0GrPYQaZOnb8gWLPN7Acub9xw8beZlUapeuaOper
 FPY=
X-SBRS: 2.7
X-MesageID: 493739
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="493739"
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
References: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
 <85205f11-1d5c-1f6d-e987-c238a025658e@citrix.com>
 <5CDD182B020000780022F768@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <93260863-5972-6b27-11f5-8147901ab6e9@citrix.com>
Date: Thu, 16 May 2019 10:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD182B020000780022F768@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] struct vcpu_guest_core_reg stable ABI?
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAwODo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMDUuMTkg
YXQgMjI6MTIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDUv
MjAxOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IEl0IGxv
b2tzIGxpa2UgdGhlIHN0cnVjdHVyZXMgdmNwdV9ndWVzdF9jb3JlX3JlZ3MgYW5kCj4+PiB2Y3B1
X2d1ZXN0X2NvbnRleHQgZG9lcyBub3QgY29ycmVjdGx5IHJlZmxlY3QgdGhlIEFBcmNoNjQgc3Rh
dGUuIEZvcgo+Pj4gaW5zdGFuY2UsIGFsbCBBcm02NCBzeXN0ZW0gcmVnaXN0ZXJzIChlLmcgc2N0
bHIsIGNwc3IsIHNwc3JfZWwxKQo+Pj4gc2hvdWxkIGJlIDY0LWJpdCB3aWRlIG5vdCAzMi1iaXQg
d2lkZS4KPj4+Cj4+PiBPbiBBUk12OC4wLCBzb21lIG9mIHRoZSByZWdpc3RlcnMgaGF2ZSBvbmx5
IHRoZSBsb3cgMzItYml0IGRlZmluZWQsCj4+PiB0aGUgcmVzdCBpcyBSRVMwLiBSRVMwIG9ubHkg
bWVhbnMgdGhleSBhcmUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UsIGl0Cj4+PiBkb2VzIG5vdCBt
ZWFuIHRoZXkgY2FuIGJlIGlnbm9yZWQuIE5ld2VyIHJldmlzaW9uIChzdWNoIGFzCj4+PiBBUk12
OC4wLVNTQlMpIGFjdHVhbGx5IGJlZ2FuIHRvIGRlZmluZSBiaXQgaW4gdGhlIHRvcCAzMi1iaXQu
Cj4+Pgo+Pj4gVGhpcyBtZWFucyB0aGF0IHRoZSBzdHJ1Y3R1cmVzIHZjcHVfZ3Vlc3RfY29yZV9y
ZWdzIGFuZAo+Pj4gdmNwdV9ndWVzdF9jb250ZXh0IHdvdWxkIG5vdCBiZSBhYmxlIHRvIHN0b3Jl
IHRoZSB0b3AgMzItYml0IGFuZAo+Pj4gdGhlcmVmb3JlIG1pc3JlcHJlc2VudGluZyB0aGUgaGFy
ZHdhcmUuCj4+Pgo+Pj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB2Y3B1X2d1ZXN0X2NvbnRleHQg
aXMgZGVmaW5lZCBiZXR3ZWVuIHRoZSB0b29scwo+Pj4gYW5kIFhlbi4gU28gaXQgd291bGQgYmUg
cG9zc2libGUgdG8gbW9kaWZ5IGl0IHdpdGhvdXQgY2FyaW5nIG9uCj4+PiBiYWNrd2FyZCBjb21w
YXRpYmx5Lgo+Pj4KPj4+IEhvd2VydmVyLCBzdHJ1Y3QgdmNwdV9ndWVzdF9jb3JlX3JlZyBzZWVt
cyB0byBiZSBvdXRzaWRlIG9mIHRoZQo+Pj4gI2lmZGVmLiBTbyBJIGFzc3VtZSBpdCBpcyBwYXJ0
IG9mIHRoZSBzdGFibGUgQUJJLiBBbSBJIGNvcnJlY3Q/Cj4+Pgo+Pj4gRG8geW91IGhhdmUgYW55
IHN1Z2dlc3Rpb24gaG93IHRoaXMgY291bGQgc2FmZWx5IGJlIGV4dGVuZGVkPwo+PiBTdHVmZiBs
aWtlIHRoaXMgc2hvdWxkIG5ldmVyIGhhdmUgYmVlbiBpbiB0aGUgcHVibGljIEFQSSB0byBiZWdp
biB3aXRoLiAKPj4geDg2IGhhcyBzb21lIG5hc3R5IGlzc3VlcyB3aGljaCBJIGhhdmUgeWV0IHRv
IGZpbmQgYSBnb29kLWVub3VnaCB3YXkgdG8gZml4Lgo+Pgo+PiBGb3IgQVJNLCBhbmQgZnV0dXJl
IGFyY2hpdGVjdHVyZXMsIEknZCB1c2UgdGhlIGZhY3QgdGhhdCB0aGVyZSBhcmUgbm8KPj4gbm9u
LXRvb2xzIGludGVyZmFjZXMgd2hpY2ggdXNlIHRoaXMgc3RydWN0dXJlIHRvIGFsbG93IHlvdXJz
ZWxmIHRoZQo+PiB3aWdnbGVyb29tIHRvIGRlY2xhcmUgaGlzdG9yeSBhIG1pc3Rha2UsIGFuZCBm
aXggaXQgYnkgbWFraW5nIGl0IHRvb2xzLW9ubHkuCj4gSSdtIHVuY29udmluY2VkIG9mIHRoZSAi
ZGVjbGFyZSBoaXN0b3J5IGEgbWlzdGFrZSIgcGFydCwgYnV0IEkgYWdyZWUKPiB3aXRoIHRoZSBz
dWdnZXN0aW9uIG9mIHNpbXBseSBtb3ZpbmcgdGhlIHN0cnVjdHVyZSBkZWNsYXJhdGlvbiBkb3du
Cj4gaW50byB0aGUgZ3VhcmRlZCBhcmVhLiBJdCBzaW1wbHkgd2FzIGEgbWlzdGFrZSB0byBub3Qg
cHV0IGl0IHRoZXJlIGluCj4gdGhlIGZpcnN0IHBsYWNlLgo+Cj4gRm9yIHg4NiBQViBhdCBsZWFz
dCBJIGRvbid0IHJlYWxseSBzZWUgaG93IHdlIGNvdWxkIGhhdmUgZ29uZQo+IHdpdGhvdXQgZXhw
b3NpbmcgdGhpcyAtIHdlIGhhdmUgdG8gYWxsb3cgZ3Vlc3RzIHRvIHNwZWNpZnkgYXQgbGVhc3QK
PiBzb21lIG9mIGEgdG8tYmUtYnJvdWdodC11cC12Q1BVJ3MgcmVnaXN0ZXJzLiAgQW55dGhpbmcg
ZWxzZQo+IHdvdWxkbid0IHJlYWxseSBoYXZlIGJlZW4gUFYgYW55bW9yZS4KCkFsbCB0aGF0IGlz
IG5lY2Vzc2FyeSBmb3IgUFYgaXMgJXJpcC7CoCAlcnNwIHdvdWxkIGFsc28gYmUgY29udmVuaWVu
dCwKYnV0IGxpdGVyYWxseSBub3RoaW5nIGVsc2UgaXMgbmVlZGVkIGZyb20gdGhlIGd1ZXN0cyBw
b2ludCBvZiB2aWV3LsKgIFRoZQpBQkkgYWxyZWFkeSBoYXMgZ3Vlc3RzIHN0YXJ0aW5nIHdpdGgg
YSBmbGF0IG1lbW9yeSBsYXlvdXQgdXNpbmcgdGhlClhlbi1wcm92aWRlZCBzZWxlY3RvcnMuwqAg
RXZlcnl0aGluZyBlbHNlIGNhbiBiZSBzZXQgdXDCoCBieSB0aGUgZW50cnkgY29kZS4KClRoZSBy
ZWFsIHByb2JsZW0geDg2IGhhcyBpcyBndWVzdF91c2VyX3JlZ3MgYmVpbmcgaW4gdGhlIHB1Ymxp
YyBBUEkuwqAKVGhpcyBhYnNvbHV0ZWx5IHNob3VsZG4ndCBoYXZlIGhhcHBlbmVkLCBiZWNhdXNl
IGl0IGZpeGVzIHRoZSBsYXJnZXIKY2h1bmsgb2YgdGhlIHRvcC1vZi1zdGFjayBjcHVfaW5mbyBi
bG9jayBpbiB0aGUgcHVibGljIEFQSS4KCj4gRm9yIFBWSCB0aGlzIG1heSBoYXZlIGJlZW4gYXZv
aWRhYmxlLgoKUFZIIChmb3IgYmV0dGVyIG9yIHdvcnNlKSBmb2xsb3dlZCBzdWl0IHdpdGggUFYs
IGJlY2F1c2UgUFYgYWxyZWFkeQpleGlzdGVkLsKgIFRoaXMgd2FzIGR1ZSB0byB0aGUgZXhwZWN0
ZWQgbGFjayBvZiBhbiBMQVBJQyBpbiBndWVzdApjb250ZXh0LCBhbmQgc2VlIHdoZXJlIHRoYXQg
ZW5kZWQgdXAuCgpEbyAqYW55KiBPU2VzIGFjdHVhbGx5IHVzZSBWQ1BVT1BfaW5pdGlhbGlzZSBm
b3IgUFZIIGd1ZXN0cz/CoCBJIGNhbid0CnRoaW5rIG9mIGFueSBvZmZoYW5kLgoKRnVydGhlcm1v
cmUsIHdlIG5vdyBoYXZlIGFuIGV2ZW4gbW9yZSB0YW5nbGVkIG1lc3Mgb2YgaHlwZXJjYWxscyB3
aGVyZQpET01DVExfe2dldCxzZXR9dmNwdWNvbnRleHQgYW5kIFZDUFVPUF9pbml0aWFsaXNlIGhh
dmUgYW4gYXN5bW1ldHJpYyBBUEkKd2hlbiBpc3N1ZXMgZnJvbSB0aGUgdG9vbHN0YWNrLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
