Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14758102AC4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 18:27:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX7EM-0000D2-3d; Tue, 19 Nov 2019 17:23:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tiwe=ZL=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iX7EK-0000Cw-JA
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 17:23:56 +0000
X-Inumbo-ID: 4c41913b-0af1-11ea-a2ff-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c41913b-0af1-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 17:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574184209;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QCBrmSR1en4ZKlH9c9w+LQkh39AjRj2LuORlxQymL7s=;
 b=cFb71VwfnYqIpdEAMFfDvTIoz6owZ3GYqkQ79Lgoch13JfB7tlEOytzL
 DCI6SZxcsqGhXpUAW/VWPbgI8kSvek4gz+2VSTdva4bBWSCy0LVKwv+It
 A/lcoi2VDQ5c8z60AIrgwEu04j7qV7t64toR95asRpLK+IFR63Lz7XhKu c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qxMkUFpidoJEYl/3++V06oiGTkz5BrAO+k6eVAxN6ZxPMTBanY1GTXNvy71GVv8JIQ0ov8ylU3
 IiBfOLHg7mNlIY2eaDeve++RPFPxmQHJaw1CHVWjex/q7dd6sfsU+GmrWRrg9GuSx5e0UykPIR
 N047+CcEG2xSHRx4z0b13KpwYQ4LFytg/VIB1ezwRRzVCU2UKNYDTs//LSQujiKzqjcM0vV0NP
 /zjRy0nRJ8gIyrvEDPO8vuzpEaVRzVvRQF+Y/mKREDcpccBjieRL8CGidtf4iFJwNVcAXRtLGn
 j6k=
X-SBRS: 2.7
X-MesageID: 8961759
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,218,1571716800"; 
   d="scan'208";a="8961759"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191114130653.51185-1-wipawel@amazon.de>
 <20191114130653.51185-13-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <15774787-b5a3-0817-6547-1c56290ccf5b@citrix.com>
Date: Tue, 19 Nov 2019 17:23:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191114130653.51185-13-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 12/12] livepatch: Add python bindings for
 livepatch operations
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTQvMTkgMTowNiBQTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gRXh0ZW5k
IHRoZSBYQyBweXRob24gYmluZGluZ3MgbGlicmFyeSB0byBzdXBwb3J0IGFsc28gYWxsIGNvbW1v
bgo+IGxpdmVwYXRjaCBvcGVyYXRpb25zIGFuZCBhY3Rpb25zLgo+IAo+IEFkZCB0aGUgcHl0aG9u
IGJpbmRpbmdzIGZvciB0aGUgZm9sbG93aW5nIG9wZXJhdGlvbnM6Cj4gLSBzdGF0dXMgKHB5eGNf
bGl2ZXBhdGNoX3N0YXR1cyk6Cj4gICBSZXF1aXJlcyBhIHBheWxvYWQgbmFtZSBhcyBhbiBpbnB1
dC4KPiAgIFJldHVybnMgYSBzdGF0dXMgZGljdCBjb250YWluaW5nIGEgc3RhdGUgc3RyaW5nIGFu
ZCBhIHJldHVybiBjb2RlCj4gICBpbnRlZ2VyLgo+IC0gYWN0aW9uIChweXhjX2xpdmVwYXRjaF9h
Y3Rpb24pOgo+ICAgUmVxdWlyZXMgYSBwYXlsb2FkIG5hbWUgYW5kIGFuIGFjdGlvbiBpZCBhcyBh
biBpbnB1dC4gVGltZW91dCBhbmQKPiAgIGZsYWdzIGFyZSBvcHRpb25hbCBwYXJhbWV0ZXJzLgo+
ICAgUmV0dXJucyBOb25lIG9yIHRocm93cyBhbiBleGNlcHRpb24uCj4gLSB1cGxvYWQgKHB5eGNf
bGl2ZXBhdGNoX3VwbG9hZCk6Cj4gICBSZXF1aXJlcyBhIHBheWxvYWQgbmFtZSBhbmQgYSBtb2R1
bGUncyBmaWxlbmFtZSBhcyBhbiBpbnB1dC4KPiAgIFJldHVybnMgTm9uZSBvciB0aHJvd3MgYW4g
ZXhjZXB0aW9uLgo+IC0gbGlzdCAocHl4Y19saXZlcGF0Y2hfbGlzdCk6Cj4gICBUYWtlcyBubyBw
YXJhbWV0ZXJzLgo+ICAgUmV0dXJucyBhIGxpc3Qgb2YgZGljdHMgY29udGFpbmluZyBlYWNoIHBh
eWxvYWQnczoKPiAgICogbmFtZSBhcyBhIHN0cmluZwo+ICAgKiBzdGF0ZSBhcyBhIHN0cmluZwo+
ICAgKiByZXR1cm4gY29kZSBhcyBhbiBpbnRlZ2VyCj4gICAqIGxpc3Qgb2YgbWV0YWRhdGEga2V5
PXZhbHVlIHN0cmluZ3MKPiAKPiBFYWNoIGZ1bmN0aW9ucyB0aHJvd3MgYW4gZXhjZXB0aW9uIGVy
cm9yIGJhc2VkIG9uIHRoZSBlcnJubyB2YWx1ZQo+IHJlY2VpdmVkIGZyb20gaXRzIGNvcnJlc3Bv
bmRpbmcgbGlieGMgZnVuY3Rpb24gY2FsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVj
em9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBNYXpl
aW4gPGFtYXplaW5AYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2No
aXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IExlb25hcmQgRm9lcnN0ZXIg
PGZvZXJzbGVvQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFu
dGhleUBhbWF6b24uZGU+Cj4gQWNrZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8
bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiAtLS0Kc25pcAo+ICtzdGF0aWMgUHlP
YmplY3QgKnB5eGNfbGl2ZXBhdGNoX3VwbG9hZChYY09iamVjdCAqc2VsZiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUHlPYmplY3QgKmFyZ3MsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFB5T2JqZWN0ICprd2RzKQo+ICt7Cj4gKyAg
ICB1bnNpZ25lZCBjaGFyICpmYnVmID0gTUFQX0ZBSUxFRDsKPiArICAgIGNoYXIgKm5hbWUsICpm
aWxlbmFtZTsKPiArICAgIHN0cnVjdCBzdGF0IGJ1ZjsKPiArICAgIGludCBmZCA9IDAsIHJjID0g
LTEsIHNhdmVkX2Vycm5vOwoKRG9lcyBmZCBhY3R1YWxseSBuZWVkIHRvIGJlIGluaXRpYWxpemVk
IGhlcmU/CgpBbHNvLCBpbml0aWFsaXppbmcgaXQgdG8gMCBzZWVtcyBvZGQgYmVjYXVzZSAwIGlz
IGEgdmFsaWQgZmQuCgo+ICsgICAgc3NpemVfdCBsZW47Cj4gKwo+ICsgICAgc3RhdGljIGNoYXIg
Kmt3ZF9saXN0W10gPSB7ICJuYW1lIiwgImZpbGVuYW1lIiwgTlVMTCB9Owo+ICsKPiArICAgIGlm
ICggIVB5QXJnX1BhcnNlVHVwbGVBbmRLZXl3b3JkcyhhcmdzLCBrd2RzLCAic3MiLCBrd2RfbGlz
dCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbmFtZSwgJmZpbGVu
YW1lKSkKPiArICAgICAgICBnb3RvIGVycm9yOwo+ICsKPiArICAgIGZkID0gb3BlbihmaWxlbmFt
ZSwgT19SRE9OTFkpOwo+ICsgICAgaWYgKCBmZCA8IDAgKQo+ICsgICAgICAgIGdvdG8gZXJyb3I7
Cj4gKwo+ICsgICAgaWYgKCBmc3RhdChmZCwgJmJ1ZikgIT0gMCApCj4gKyAgICAgICAgZ290byBl
cnJvcl9mZDsKPiArCj4gKyAgICBsZW4gPSBidWYuc3Rfc2l6ZTsKPiArICAgIGZidWYgPSBtbWFw
KDAsIGxlbiwgUFJPVF9SRUFELCBNQVBfUFJJVkFURSwgZmQsIDApOwo+ICsgICAgaWYgKCBmYnVm
ID09IE1BUF9GQUlMRUQgKQo+ICsgICAgICAgIGdvdG8gZXJyb3JfZmQ7Cj4gKwo+ICsgICAgcmMg
PSB4Y19saXZlcGF0Y2hfdXBsb2FkKHNlbGYtPnhjX2hhbmRsZSwgbmFtZSwgZmJ1ZiwgbGVuKTsK
PiArCj4gKyAgICBzYXZlZF9lcnJubyA9IGVycm5vOwo+ICsgICAgbXVubWFwKGZidWYsIGxlbik7
Cj4gKyAgICBlcnJubyA9IHNhdmVkX2Vycm5vOwo+ICsKPiArZXJyb3JfZmQ6Cj4gKyAgICBjbG9z
ZShmZCk7Cj4gK2Vycm9yOgo+ICsgICAgcmV0dXJuIHJjID8gcHl4Y19lcnJvcl90b19leGNlcHRp
b24oc2VsZi0+eGNfaGFuZGxlKSA6IFB5X05vbmU7Cj4gK30Kc25pcD4gIHN0YXRpYyBQeU1ldGhv
ZERlZiBweXhjX21ldGhvZHNbXSA9IHsKPiAgICAgIHsgImRvbWFpbl9jcmVhdGUiLCAKPiAgICAg
ICAgKFB5Q0Z1bmN0aW9uKXB5eGNfZG9tYWluX2NyZWF0ZSwgCj4gQEAgLTI1NDIsNiArMjc2MSw0
NCBAQCBzdGF0aWMgUHlNZXRob2REZWYgcHl4Y19tZXRob2RzW10gPSB7Cj4gICAgICAgICJSZXR1
cm5zOiBbaW50XTogMCBvbiBhbGwgcGVybWlzc2lvbiBncmFudGVkOyAtMSBpZiBhbnkgcGVybWlz
c2lvbnMgYXJlIFwKPiAgICAgICAgIGRlbmllZFxuIiB9LCAKPiAgCj4gKyAgICB7ICJsaXZlcGF0
Y2hfc3RhdHVzIiwKPiArICAgICAgKFB5Q0Z1bmN0aW9uKXB5eGNfbGl2ZXBhdGNoX3N0YXR1cywK
PiArICAgICAgTUVUSF9LRVlXT1JEUywgIlxuIgo+ICsgICAgICAiR2V0cyBjdXJyZW50IHN0YXRl
IGFuZCByZXR1cm4gY29kZSBmb3IgYSBzcGVjaWZpZWQgbW9kdWxlLlxuIgo+ICsgICAgICAiIG5h
bWUgICAgIFtzdHJdOiBNb2R1bGUgbmFtZSB0byBiZSB1c2VkXG4iCj4gKyAgICAgICJSZXR1cm5z
OiBbZGljdF0gb24gc3VjY2VzczsgdGhyb3dpbmcgYW4gZXhjZXB0aW9uIG9uIGVycm9yXG4iCj4g
KyAgICAgICIgc3RhdGUgICAgW2ludF06IE1vZHVsZSBjdXJyZW50IHN0YXRlOiBDSEVDS0VEIG9y
IEFQUExJRURcbiIKPiArICAgICAgIiByYyAgICAgICBbaW50XTogUmV0dXJuIGNvZGUgb2YgbGFz
dCBtb2R1bGUncyBvcGVyYXRpb25cbiIgfSwKPiArCj4gKyAgICB7ICJsaXZlcGF0Y2hfdXBsb2Fk
IiwKPiArICAgICAgKFB5Q0Z1bmN0aW9uKXB5eGNfbGl2ZXBhdGNoX3VwbG9hZCwKPiArICAgICAg
TUVUSF9LRVlXT1JEUywgIlxuIgo+ICsgICAgICAiVXBsb2FkcyBhIG1vZHVsZSB3aXRoIHNwZWNp
ZmllZCBuYW1lIGZyb20gZmlsZW5hbWUuXG4iCj4gKyAgICAgICIgbmFtZSAgICAgW3N0cl06IE1v
ZHVsZSBuYW1lIHRvIGJlIHVzZWRcbiIKPiArICAgICAgIiBmaWxlbmFtZSBbc3RyXTogRmlsZW5h
bWUgb2YgYSBtb2R1bGUgdG8gYmUgdXBsb2FkZWRcbiIKPiArICAgICAgIlJldHVybnM6IE5vbmUg
b24gc3VjY2VzczsgdGhyb3dpbmcgYW4gZXhjZXB0aW9uIG9uIGVycm9yXG4iIH0sCj4gKwo+ICsg
ICAgeyAibGl2ZXBhdGNoX2FjdGlvbiIsCj4gKyAgICAgIChQeUNGdW5jdGlvbilweXhjX2xpdmVw
YXRjaF9hY3Rpb24sCj4gKyAgICAgIE1FVEhfS0VZV09SRFMsICJcbiIKPiArICAgICAgIlBlcmZv
cm1zIGFuIGFjdGlvbiAodW5sb2FkLCByZXZlcnQsIGFwcGx5IG9yIHJlcGxhY2UpIG9uIGEgc3Bl
Y2lmaWVkIFwKPiArICAgICAgIG1vZHVsZS5cbiIKPiArICAgICAgIiBuYW1lICAgICAgW3N0cl06
IE1vZHVsZSBuYW1lIHRvIGJlIHVzZWRcbiIKPiArICAgICAgIiBhY3Rpb24gICBbdWludF06IEFj
dGlvbiBlbnVtIGlkXG4iCj4gKyAgICAgICIgdGltZW91dCAgW3VpbnRdOiBBY3Rpb24gc2NoZWR1
bGVkIGV4ZWN1dGlvbiB0aW1lb3V0XG4iCj4gKyAgICAgICIgZmxhZ3MgICBbdWxvbmddOiBGbGFn
cyBzcGVjaWZ5aW5nIGFjdGlvbidzIGV4dHJhIHBhcmFtZXRlcnNcbiIKClNob3VsZCB0aGlzIGJl
IHVpbnQgYW5kIG5vdCB1bG9uZz8KCkkgZXhwZWN0IHRoZXNlIHRoaW5ncyBjb3VsZCBiZSBmaXhl
ZCB1cCBvbiBjb21taXQuCgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
