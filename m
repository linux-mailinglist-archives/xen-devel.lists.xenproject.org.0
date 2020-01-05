Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2D130A20
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 23:08:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioE2T-0007t3-Fh; Sun, 05 Jan 2020 22:06:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhB7=22=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioE2S-0007sy-9J
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 22:06:24 +0000
X-Inumbo-ID: 96c9d1aa-3007-11ea-b6f1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96c9d1aa-3007-11ea-b6f1-bc764e2007e4;
 Sun, 05 Jan 2020 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578261974;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zTUuYPuk7OECY70gEWR1LOaDA5mzeOcpm6RKJu/hK4I=;
 b=hZd2zzH8YZQiEFchfTgnOWq/B5+vopX7yD2yiRM2cgTCCQTYRWKEOvQp
 +xF7vBHVH4Saoy9aoAr000JONFx9VgnhZL5y0CcES7NIapOLWCL3ooEHx
 YAgHpZqlQccRUUa8When25B8JgVMG9dSe248aApOdag6vZwgtaRF1v/DD w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nIyJ0FHzN46IvYheIy2j5yNNwYmiZts00kT4ETTiTlOxdUjz/G/3VqYRytkaCX4yQzLxc4mBtf
 eGr3wZfsM85zFywEpIpN4Cp+T1IqYdsfmHVZ49h6B65bSy5/fvecC1M9xBkvVU1tBlqklSDjRf
 tdYa3RM1wQCyA/dQDYsDYJHIp9NERlrcT2MBw4YO3+bKGzLXFajPHLHw6s2Y07o606N/4ffZIz
 IVfKzJNOle3Alwy29aT4IdpewmGHLK9MPYSd186SPR30Ye2al3hNfYFReFKxeGnriODmFfGeR7
 ICA=
X-SBRS: 2.7
X-MesageID: 10490141
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,400,1571716800"; d="scan'208";a="10490141"
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-3-liuwe@microsoft.com>
 <0020c144-6233-58f7-2f71-c5af03b6b2f8@citrix.com>
 <20200105212231.ty7cjfdu5di5sf4j@debian>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ec16fcba-099d-1a73-d33c-3ee9f0f7c005@citrix.com>
Date: Sun, 5 Jan 2020 22:06:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200105212231.ty7cjfdu5di5sf4j@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDEvMjAyMCAyMToyMiwgV2VpIExpdSB3cm90ZToKPiBPbiBTdW4sIEphbiAwNSwgMjAy
MCBhdCAwNzowODoyOFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gK3N0YXRpYyBp
bmxpbmUgdWludDY0X3QgaHZfZG9faHlwZXJjYWxsKHVpbnQ2NF90IGNvbnRyb2wsIHBhZGRyX3Qg
aW5wdXQsIHBhZGRyX3Qgb3V0cHV0KQo+Pj4gK3sKPj4+ICsgICAgdWludDY0X3Qgc3RhdHVzOwo+
Pj4gKwo+Pj4gKyAgICBhc20gdm9sYXRpbGUgKCJtb3YgJVtvdXRwdXRdLCAlJXI4XG4iCj4+PiAr
ICAgICAgICAgICAgICAgICAgImNhbGwgaHZfaHlwZXJjYWxsX3BhZ2UiCj4+PiArICAgICAgICAg
ICAgICAgICAgOiAiPWEiIChzdGF0dXMpLCAiK2MiIChjb250cm9sKSwKPj4+ICsgICAgICAgICAg
ICAgICAgICAgICIrZCIgKGlucHV0KSBBU01fQ0FMTF9DT05TVFJBSU5UCj4+PiArICAgICAgICAg
ICAgICAgICAgOiBbb3V0cHV0XSAicm0iIChvdXRwdXQpCj4+PiArICAgICAgICAgICAgICAgICAg
OiAiY2MiLCAibWVtb3J5IiwgInI4IiwgInI5IiwgInIxMCIsICJyMTEiKTsKPj4gSSB0aGluayB5
b3Ugd2FudDoKPj4KPj4gcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyByOCBhc20oInI4IikgPSBvdXRw
dXQ7Cj4+Cj4+IGFuZCAiK3IiIChyOCkgYXMgYW4gb3V0cHV0IGNvbnN0cmFpbnQuCj4gQWx0aG91
Z2ggaXQgaXMgbmFtZWQgYG91dHB1dGAsIGl0IGlzIHJlYWxseSBqdXN0IGFuIGlucHV0IHBhcmFt
ZXRlciBmcm9tCj4gSHlwZXItVidzIFBvVi4KClllcywgYnV0IGl0IGlzIGFsc28gY2xvYmJlcmVk
LgoKVGhpcyBpcyBhbiBhd2t3YXJkIGNvcm5lciBjYXNlIG9mIGdudSBpbmxpbmUgYXNzZW1ibHku
CgpJdCBpcyBub3QgcGVybWl0dGVkIHRvIGhhdmUgYSBjbG9iYmVyIGxpc3Qgb3ZlcmxhcCB3aXRo
IGFueSBpbnB1dC9vdXRwdXQKb3BlcmF0aW9ucywgYW5kIGJlY2F1c2UgcjggZG9lc24ndCBoYXZl
IGEgdW5pcXVlIGxldHRlciwgeW91IGNhbid0IGRvCnRoZSB1c3VhbCB0cmljayBvZiAiPXI4IiAo
ZGlzY2FyZCkgOiAicjgiIChpbnB1dCkuCgpUaGUgb25seSBhdmFpbGFibGUgb3B0aW9uIGlzIHRv
IG1hcmsgaXQgYXMgcmVhZCBhbmQgd3JpdHRlbiAod2hpY2ggaXMKIityIiBpbiB0aGUgb3V0cHV0
IGxpc3QpLCBhbmQgbm90IHVzZSB0aGUgQyB2YXJpYWJsZSByOCBhdCBhbnkgcG9pbnQgbGF0ZXIu
CgoKSGF2aW5nIGxvb2tlZCB0aHJvdWdoIHRoZSBzcGVjIGEgYml0IG1vcmUsIGlzIHRoaXMgYSB3
aXNlIEFQSSB0byBoYXZlIGluCnRoZSBmaXJzdCBwbGFjZT/CoCBpbnB1dCBhbmQgb3V0cHV0IChw
ZXJoYXBzIGJldHRlciBuYW1lZCBpbnB1dF9hZGRyIGFuZApvdXRwdXRfYWRkcikgYXJlIGZpeGVk
IHBlciBDUFUsIGFuZCBjb250cm9sIGlzIHNlbWFudGljYWxseSBsaW5rZWQgdG8KdGhlIGh5cGVy
Y2FsbCBhbmQgaXRzIHBhcnRpY3VsYXIgQUJJLgoKSSBzdXBwb3NlIHRoZSBhbnN3ZXIgdWx0aW1h
dGVseSBkZXBlbmRzIG9uIHdoYXQgdGhlIGNhbGxlcnMgbG9vayBsaWtlLgoKPgo+PiBJbiBwYXJ0
aWN1bGFyLCB0aGF0IGRvZXNuJ3QgZm9yY2UgdGhlIGNvbXBpbGVyIHRvIHB1dCBvdXRwdXQgaW50
byBhCj4+IHJlZ2lzdGVyIG90aGVyIHRoYW4gcjggKG9yIHdvcnNlLCBzcGlsbCBpdCB0byB0aGUg
c3RhY2spIHRvIGhhdmUgdGhlCj4+IG9wYXF1ZSBibG9iIG9mIGFzbSBtb3ZlIGl0IGJhY2sgaW50
byByOC7CoCBXaGF0IGl0IHdpbGwgZG8gaW4gcHJhY3RpY2UgaXMKPj4gY2F1c2UgdGhlIGNvbXBp
bGVyIHRvIGNvbnN0cnVjdCBvdXRwdXQgZGlyZWN0bHkgaW4gcjguCj4+Cj4+IEFzIGZvciB0aGUg
b3RoZXIgY2xvYmJlcnMsIEkgY2FuJ3QgZmluZCBhbnl0aGluZyBhdCBhbGwgaW4gdGhlIHNwZWMK
Pj4gd2hpY2ggZXZlbiBtZW50aW9ucyB0aG9zZSByZWdpc3RlcnMuwqAgVGhlcmUgd2lsbCBiZSBh
IGRlY2VudCBpbXByb3ZlbWVudAo+PiB0byBjb2RlIGdlbmVyYXRpb24gaWYgd2UgZG9uJ3QgZm9y
Y2UgdGhlbSB0byBiZSBzcGlsbGVkIGFyb3VuZCBhIGh5cGVyY2FsbC4KPj4KPiBOZWl0aGVyIGNh
biBJLiBCdXQgTGludXgncyBjb21taXQgc2F5cyB0aGF0J3MgbmVlZGVkLCBzbyBJIGNob3NlIHRv
IGVycgo+IG9uIHRoZSBzYWZlIHNpZGUuCgpUaGF0J3MgZHVsbC7CoCBJcyB0aGVyZSBhbnkgcXVh
bGlmeWluZyBpbmZvcm1hdGlvbj8KCj4+IEhvd2V2ZXIsIEh5cGVyViB3aWxsKG1heT8pIG1vZGlm
eSAleG1tezAuLjV9IGluIHNvbWUgY2FzZXMsIGFuZCB0aGlzCj4+IHdpbGwgY29ycnVwdCB0aGUg
Y3VycmVudCB2Y3B1J3MgRlBVIGNvbnRleHQuwqAgQ2FyZSB3aWxsIG5lZWQgdG8gYmUgdGFrZW4K
Pj4gdG8gc3BpbGwgdGhlc2UgaWYgbmVjZXNzYXJ5Lgo+Pgo+IFRoZSBoeXBlcmNhbGxzIHdlIGNh
cmUgYWJvdXQgKFRMQiwgQVBJQyBldGMpIGRvbid0IHVzZSB0aGF0IEFCSSBhcyBmYXIKPiBhcyBJ
IGNhbiB0ZWxsLiBBdCB0aGUgdmVyeSBsZWFzdCBMaW51eCwgd2hpY2ggdXNlcyB0aGUgc2FtZSBz
ZXQgb2YKPiBoeXBlcmNhbGxzLCBkb2Vzbid0IG5lZWQgdG8gc2F2ZSAvIHJlc3RvcmUgWE1NIHJl
Z2lzdGVycyBhcm91bmQgdGhlCj4gY2FsbHMuCgpPayAtIGl0IGxvb2tzIHRvIGJlIGZpbmUgdW50
aWwgd2UgbmVlZCB0byB1c2UgYSBoeXBlcmNhbGwgd2hpY2ggdXNlcyB0aGUKZmFzdCBleHRlbmRl
ZCBBQkksIHdoaWNoIGlzIHRoZSBmaXJzdCB0byBpbnRyb2R1Y2UgdGhlIHVzZSBvZiB0aGUgJXht
bQpyZWdpc3RlcnMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
