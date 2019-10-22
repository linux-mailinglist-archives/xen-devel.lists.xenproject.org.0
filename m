Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27471E0288
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 13:10:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMs0q-0000f3-BE; Tue, 22 Oct 2019 11:07:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rSGF=YP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iMs0o-0000ex-G9
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 11:07:38 +0000
X-Inumbo-ID: 2172a175-f4bc-11e9-9465-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2172a175-f4bc-11e9-9465-12813bfff9fa;
 Tue, 22 Oct 2019 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571742447;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=i9hccyXjZh9q+sOeTrIodOe+/AJsqQcunfvXJM4RgOo=;
 b=KYz74u3VzykkMfm1egGSErTLzhCGdkGVR6R+oPAIDDnPPlgPdbHurvm8
 BvUoH9F4/VARQcxq0jHGRstbd56gX2APD9vjGbTaearoDJeayrEsfQjnx
 zU4iJEhthkHtPMzqSgB9ENNRC71CvK/C1kRK4Yw6c/HpIZmEmLrBsuICc A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HRkKrAB9glIs4nryY3W/8Qoiv5zY71cAHl5auTT32/gWtfnevBWuzXeO5iJFynxUPaIJfG0qWk
 EVDtskGstYWixSra7dzpUJJp5xaoVANGUNGKp4NVU4XAxKC7FnTjnfZgmvwYI28acodTSs6qj/
 8q6xkw+QFptnY9CyQRqoDVch2CrLur+gw2JcPZIAdfPltPtReUVJtxyVR4tU0ig1YdcXBZTVBk
 J/NxgNCXB8KPS59UGKLe/glF8Y3dgaB0rmvPUv7eXxmp16X7wdN6WWi2QRvSRDmwcuLGsCX/to
 5uU=
X-SBRS: 2.7
X-MesageID: 7592208
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,326,1566878400"; 
   d="scan'208";a="7592208"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
 <20191022105240.GN17494@Air-de-Roger>
 <d0d12857-1062-abbf-1151-66b9c060bf60@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <22e824f6-961f-4be7-47ee-984c282bf17e@citrix.com>
Date: Tue, 22 Oct 2019 12:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d0d12857-1062-abbf-1151-66b9c060bf60@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTAvMjAxOSAxMjowMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMi4xMC4xOSAx
Mjo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gVHVlLCBPY3QgMjIsIDIwMTkgYXQg
MTE6Mjc6NDFBTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+IE9uIDIxLjEwLjE5IDEx
OjUxLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+IEhlbGxvLAo+Pj4+Cj4+Pj4gV2hpbGUgdGVz
dGluZyBwdi1zaGltIGZyb20gYSBzbmFwc2hvdCBvZiBzdGFnaW5nIDQuMTMgYnJhbmNoICh3aXRo
Cj4+Pj4gY29yZS0KPj4+PiBzY2hlZHVsaW5nIHBhdGNoZXMgYXBwbGllZCksIHNvbWUgc29ydCBv
ZiBzY2hlZHVsaW5nIGlzc3VlcyB3ZXJlCj4+Pj4gdW5jb3ZlcmVkCj4+Pj4gd2hpY2ggdXN1YWxs
eSBsZWFkcyB0byBhIGd1ZXN0IGxvY2t1cCAoc29tZXRpbWVzIHdpdGggc29mdCBsb2NrdXAKPj4+
PiBtZXNzYWdlcwo+Pj4+IGZyb20gTGludXgga2VybmVsKS4KPj4+Pgo+Pj4+IFRoaXMgaGFwcGVu
cyBtb3JlIGZyZXF1ZW50bHkgb24gU2FuZHlCcmlkZ2UgQ1BVcy4gQWZ0ZXIgZW5hYmxpbmcKPj4+
PiBDT05GSUdfREVCVUcgaW4gcHYtc2hpbSwgdGhlIGZvbGxvd2luZyBhc3NlcnRpb25zIGZhaWxl
ZDoKPj4+Pgo+Pj4+IE51bGwgc2NoZWR1bGVyOgo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoCBBc3NlcnRp
b24gJ2xvY2sgPT0KPj4+PiBnZXRfc2NoZWRfcmVzKGktPnJlcy0+bWFzdGVyX2NwdSktPnNjaGVk
dWxlX2xvY2snIGZhaWxlZCBhdAo+Pj4+IC4uLmFyZS94ZW4tZGlyL3hlbi1yb290L3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC1pZi5oOjI3OAo+Pj4+IMKgwqDCoMKgwqAgKGZ1bGwgY3Jhc2ggbG9nOiBo
dHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTEwODg2MS8gKQo+Pj4+Cj4+Pj4gQ3JlZGl0MSBzY2hl
ZHVsZXI6Cj4+Pj4KPj4+PiDCoMKgwqDCoMKgIEFzc2VydGlvbiAnY3B1bWFza19jeWNsZShjcHUs
IHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5KSA9PQo+Pj4+IGNwdScgZmFpbGVkIGF0IHNjaGVkX2Ny
ZWRpdC5jOjM4Mwo+Pj4+IMKgwqDCoMKgwqAgKGZ1bGwgY3Jhc2ggbG9nOiBodHRwczovL3Bhc3Rl
LmRlYmlhbi5uZXQvMTEwODg2Mi8gKQo+Pj4+Cj4+Pj4gSSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0
aW9uIHRob3NlLCBidXQgd291bGQgYXBwcmVjaWF0ZSBhbnkgaGVscCBvcgo+Pj4+IHN1Z2dlc3Rp
b25zLgo+Pj4KPj4+IEFuZCBub3cgYSBtb3JlIHNhbmUgcGF0Y2ggdG8gdHJ5Lgo+Pj4KPj4+Cj4+
PiBKdWVyZ2VuCj4+Pgo+Pgo+Pj4gwqBGcm9tIDIwNWI3NjIyYjg0YmM2NzhmOGEwZDZhYzEyMWRm
ZjE0NDM5ZmUzMzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+PiBGcm9tOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCj4+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+PiBDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KPj4+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+Pj4gRGF0ZTogVHVlLCAyMiBPY3QgMjAxOSAxMToxNDowOCArMDIwMAo+Pj4gU3ViamVjdDog
W1BBVENIXSB4ZW4vcHZoc2ltOiBmaXggY3B1IG9ubGluaW5nCj4+Pgo+Pj4gU2luY2UgY29tbWl0
IDhkM2MzMjZmNjc1NmQxICgieGVuOiBsZXQgdmNwdV9jcmVhdGUoKSBzZWxlY3QgcHJvY2Vzc29y
IikKPj4+IHRoZSBpbml0aWFsIHByb2Nlc3NvciBmb3IgYWxsIHB2LXNoaW0gdmNwdXMgd2lsbCBi
ZSAwLCBhcyBubyBvdGhlciBjcHVzCj4+PiBhcmUgb25saW5lIHdoZW4gdGhlIHZjcHVzIGFyZSBj
cmVhdGVkLiBCZWZvcmUgdGhhdCBjb21taXQgdGhlIHZjcHVzCj4+PiB3b3VsZCBoYXZlIHByb2Nl
c3NvcnMgc2V0IG5vdCBiZWluZyBvbmxpbmUgeWV0LCB3aGljaCB3b3JrZWQganVzdCBieQo+Pj4g
Y2hhbmNlLgo+Pj4KPj4+IFdoZW4gdGhlIHB2LXNoaW0gdmNwdSBiZWNvbWVzIGFjdGl2ZSBpdCB3
aWxsIGhhdmUgYSBoYXJkIGFmZmluaXR5Cj4+PiBub3QgbWF0Y2hpbmcgaXRzIGluaXRpYWwgcHJv
Y2Vzc29yIGFzc2lnbm1lbnQgbGVhZGluZyB0byBmYWlsaW5nCj4+PiBBU1NFUlQoKXMgb3Igb3Ro
ZXIgcHJvYmxlbXMgZGVwZW5kaW5nIG9uIHRoZSBzZWxlY3RlZCBzY2hlZHVsZXIuCj4+Cj4+IEkn
bSBzbGlnaHRseSBsb3N0IGhlcmUsIHdobyBoYXMgc2V0IHRoaXMgaGFyZCBhZmZpbml0eSBvbiB0
aGUgcHZzaGltCj4+IHZDUFVzPwo+Cj4gVGhhdCBpcyBkb25lIGluIHNjaGVkX3NldHVwX2RvbTBf
dmNwdXMoKS4KPgo+Pgo+Pj4gRml4IHRoYXQgYnkgcmVkb2luZyB0aGUgYWZmaW5pdHkgc2V0dGlu
ZyBhZnRlciBvbmxpbmluZyB0aGUgY3B1IGJ1dAo+Pj4gYmVmb3JlIHRha2luZyB0aGUgdmNwdSB1
cC4KPj4KPj4gVGhlIGNoYW5nZSBzZWVtcyBmaW5lIHRvIG1lLCBidXQgSSBkb24ndCB1bmRlcnN0
YW5kIHdoeSB0aGUgbGFjayBvZgo+PiB0aGlzIGNhbiBjYXVzZSBhc3NlcnRzIHRvIHRyaWdnZXIs
IGFzIHJlcG9ydGVkIGJ5IFNlcmdleS4gSSBhbHNvCj4+IHdvbmRlciB3aHkgYSBjaGFuZ2UgdG8g
cGluIHZDUFUjMCB0byBwQ1BVIzAgaXMgbm90IHJlcXVpcmVkLCBiZWNhdXNlCj4+IHB2X3NoaW1f
Y3B1X3VwIGlzIG9ubHkgdXNlZCBmb3IgQVBzLgo+Cj4gV2hlbiB2Y3B1IDAgaXMgYmVpbmcgY3Jl
YXRlZCBwY3B1IDAgaXMgb25saW5lIGFscmVhZHkuIFNvIHRoZSBhZmZpbml0eQo+IHNldCBpbiBz
Y2hlZF9zZXR1cF9kb20wX3ZjcHVzKCkgaXMgZmluZSBpbiB0aGF0IGNhc2UuCj4KPj4gSSB3b3Vs
ZCBleHBlY3QgdGhhdCBwdnNoaW0gZ3Vlc3QgdkNQVXMgaGF2ZSBubyBoYXJkIGFmZmluaXR5IEFU
TSwgYW5kCj4+IHRoYXQgd2hlbiBhIHBDUFUgKGZyb20gdGhlIHNoaW0gUG9WKSBpcyBicm91Z2h0
IG9ubGluZSBpdCB3aWxsIGJlCj4+IGFkZGVkIHRvIHRoZSBwb29sIG9mIGF2YWlsYWJsZSBwQ1BV
IGZvciB0aGUgc2hpbSB0byBzY2hlZHVsZSB2Q1BVcwo+PiBvbi4KPgo+IFRoYXQgZXhwZWN0YXRp
b24gaXMgd3JvbmcuIEFsbCB2Y3B1cyBhcmUgcGlubmVkIHRvIHRoZWlyIHJlc3BlY3RpdmUKPiBw
Y3B1cy4KClRoZSBnb2FsIGZvciBTaGltIHdhcyBhbHdheXMgdG8gdXNlIHRoZSBOVUxMIHNjaGVk
dWxlciBhbmQgYWx3YXlzIGhhdmUKdmNwdSA9PSBwY3B1LsKgIFRoZSBvbmx5IHJlYXNvbiB3ZSB1
c2UgY3JlZGl0IGlzIGJlY2F1c2UgTlVMTCAoc3RpbGwhKQpkb2Vzbid0IHdvcmssIGFuZCBib2Rn
ZSB0aGUgc2NoZWR1bGluZyB1c2luZyBoYXJkIGFmZmluaXR5LgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
