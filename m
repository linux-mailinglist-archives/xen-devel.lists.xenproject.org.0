Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5A12D029
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 14:06:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iluj1-0003Qi-QP; Mon, 30 Dec 2019 13:04:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NUW5=2U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iluj1-0003Qd-7u
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 13:04:47 +0000
X-Inumbo-ID: eee29cc6-2b04-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eee29cc6-2b04-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577711079;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bX0hZD1eEQoT0D0fkyg8BE15XuyMsQgpPxcjjpCSOwY=;
 b=cMJgYCjtZLrV15LHlPD3l/4cRTvnWs+BcbZ694v6HiMsU+xrlIwD6y8N
 Bimpw3O/EF9hzyF2htW+1fJmgCTEMDfMPt48Hj+VKOJXkfddesBZC/2vp
 S+xx+1qVpzYzfgx6fGk9j6f8VaA7qFw4gFRFqSx8SQTxev5z6bsUAcfKd o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h5wGNpfUWUBfJRFTO8PQzaCstSbX0N7Ke13qnEaDcT1EvRVsdaneocD8h0rW7Td1iMLK2iMVYG
 FdG35fOB8hjhGPu3/TlHFW4Pk9abcCNrIPdZh+it1FbWgEn9SjRy1PDORfQGGJIxMwgG9GdeE7
 0tNhemOhj3aLqK1n6XxF78EFyIFMF7wwEamOBWBhfgHDGfq91GxNygchZHJQAK45dIJrbuAByo
 dlcHvapyc3OLwazdS0Eg/Nhg3cZYnymFdnSJf8UKxM3Kw56aWU3H9um2ap5ZAKyZEIxauJe5fv
 NUw=
X-SBRS: 2.7
X-MesageID: 10264000
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,375,1571716800"; d="scan'208";a="10264000"
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-6-liuwe@microsoft.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <cd41600f-6e83-572e-2083-29aa1317d78a@citrix.com>
Date: Mon, 30 Dec 2019 13:04:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191229183341.14877-6-liuwe@microsoft.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/8] x86/hyperv: provide Hyper-V hypercall
 functions
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <liuwe@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTIvMjAxOSAxODozMywgV2VpIExpdSB3cm90ZToKPiBUaGVzZSBmdW5jdGlvbnMgd2ls
bCBiZSB1c2VkIGxhdGVyIHRvIG1ha2UgaHlwZXJjYWxscyB0byBIeXBlci1WLgo+Cj4gSSBjb3Vs
ZG4ndCBmaW5kIHJlZmVyZW5jZSBpbiBUTEZTIHRoYXQgSHlwZXItViBjbG9iYmVycyBmbGFncyBh
bmQKPiByOS1yMTEsIGJ1dCBMaW51eCdzIGNvbW1pdCBtZXNzYWdlIHNheXMgaXQgZG9lcy4gRXJy
IG9uIHRoZSBzYWZlIHNpZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNy
b3NvZnQuY29tPgo+IC0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oeXBl
cmNhbGwuaCB8IDEwNSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMDUg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC9oeXBlcnYtaHlwZXJjYWxsLmgKPgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi1oeXBlcmNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
aHlwZXJ2LWh5cGVyY2FsbC5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi42MDE3MTIzYmU1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LWh5cGVyY2FsbC5oCj4gQEAgLTAsMCArMSwxMDUgQEAKPiArLyoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgo+ICsgKiBhc20teDg2L2d1ZXN0L2h5cGVydi1oeXBlcmNhbGwuaAo+
ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yCj4gKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRp
dGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYwo+ICsgKiBMaWNlbnNlLCB2ZXJzaW9uIDIs
IGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgo+ICsgKgo+ICsg
KiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhl
IGltcGxpZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKPiArICogR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+ICsgKgo+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPiArICogTGljZW5zZSBhbG9u
ZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy8+Lgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0Lgo+ICsgKi8K
PiArCj4gKyNpZm5kZWYgX19YODZfSFlQRVJWX0hZUEVSQ0FMTF9IX18KPiArI2RlZmluZSBfX1g4
Nl9IWVBFUlZfSFlQRVJDQUxMX0hfXwo+ICsKPiArI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ICsK
PiArI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KPiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBl
cnYtdGxmcy5oPgo+ICsjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KPiArCj4gK2V4dGVybiB2b2lkICpo
dl9oeXBlcmNhbGw7Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2Fs
bCh1aW50NjRfdCBjb250cm9sLCBwYWRkcl90IGlucHV0LCBwYWRkcl90IG91dHB1dCkKPiArewo+
ICsgICAgdWludDY0X3Qgc3RhdHVzOwo+ICsKPiArICAgIGlmICggIWh2X2h5cGVyY2FsbCApCj4g
KyAgICAgICAgcmV0dXJuIH4wVUxMOwo+ICsKPiArICAgIGFzbSB2b2xhdGlsZSAoIm1vdiAlW291
dHB1dF0sICUlcjhcbiIKPiArICAgICAgICAgICAgICAgICAgImNhbGwgKiVbaHlwZXJjYWxsX3Bh
Z2VdIgo+ICsgICAgICAgICAgICAgICAgICA6ICI9YSIgKHN0YXR1cyksICIrYyIgKGNvbnRyb2wp
LAo+ICsgICAgICAgICAgICAgICAgICAgICIrZCIgKGlucHV0KSBBU01fQ0FMTF9DT05TVFJBSU5U
Cj4gKyAgICAgICAgICAgICAgICAgIDogW291dHB1dF0gInJtIiAob3V0cHV0KSwKPiArICAgICAg
ICAgICAgICAgICAgICBbaHlwZXJjYWxsX3BhZ2VdICJtIiAoaHZfaHlwZXJjYWxsKQo+ICsgICAg
ICAgICAgICAgICAgICA6ICJjYyIsICJtZW1vcnkiLCAicjgiLCAicjkiLCAicjEwIiwgInIxMSIp
Owo+ICsKPiArICAgIHJldHVybiBzdGF0dXM7Cj4gK30KCkluZGlyZWN0IGNhbGxzIGFyZSBleHBl
bnNpdmUgdGhlc2UgZGF5cyBkdWUgdG8gcmV0cG9saW5lL0lCUlMsIGFuZCBpbgp0aGlzIGNhc2Us
IHVubmVjZXNzYXJ5LgoKWW91IHdhbnQgc29tZXRoaW5nIGxpa2U6Cgphc20gKCAiLnB1c2hzZWN0
aW9uIFwiLnRleHQucGFnZV9hbGlnbmVkXCIsIFwiYXhcIiwgQHByb2diaXRzXG5cdCIKwqDCoMKg
wqDCoCAiLmFsaWduIDQwOTZcblx0IgrCoMKgwqDCoMKgICIuZ2xvYmwgaHlwZXJ2X2h5cGVyY2Fs
bFxuXHQiCsKgwqDCoMKgwqAgImh5cGVydl9oeXBlcmNhbGw6XG5cdCIKwqDCoMKgwqDCoCAibW92
IC0xLCAlcmF4XG5cdCIKwqDCoMKgwqDCoCAicmV0XG5cdCIKwqDCoMKgwqDCoCAiLmFsaWduIDQw
OTY7XG5cdCIgKTsKCldoaWNoIHdpbGwgcHV0IG9uZSBwYWdlIHdvcnRoIG9mIHNwYWNlIGluIC50
ZXh0LnBhZ2VfYWxpZ25lZCAoc28gaXQgZ2V0cwptYXBwZWQgZXhlY3V0YWJsZSksIGF0IGEgbG9j
YXRpb24gdGhlIGxpbmtlciBjYW4gZXZhbHVhdGUgKHNvIHlvdSBjYW4KdXNlIGEgZGlyZWN0IGNh
bGwsIGFuZCB0aGUgZGlzYXNzZW1ibHkgd2lsbCBiZSBlYXNpZXIgdG8gZm9sbG93KSwgd2hpY2gK
aXMgaW5pdGlhbGlzZWQgdG8gdGhlICJub3QgcmVhZHkgeWV0IiBjb2RlIHNvIHlvdSBkb24ndCBu
ZWVkIGEgcnVudGltZQpjaGVjayBpbiBldmVyeSBoeXBlcmNhbGwgdGhhdCB5b3UgZGlkbid0IGdl
dCB0aGUgb3JkZXIgb2YgaW5pdGlhbGlzYXRpb24Kd3JvbmcgYXQgYm9vdC4KCkFsdGVybmF0aXZl
bHksIGluaXRpYWxpc2UgdG8gdWQyIGlmIHNvbWUgZm9ybSBvZiBjb25zb2xlIGNhbiBiZSByZWxp
YWJseQpiZSBhcnJhbmdlZCB0byB3b3JrIGZyb20gdGhlIHZlcnkgc3RhcnQuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
