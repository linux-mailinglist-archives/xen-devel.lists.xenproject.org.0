Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7795BF01F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:51:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRKw-0003LF-5n; Thu, 26 Sep 2019 10:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDRKv-0003LA-2l
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:49:25 +0000
X-Inumbo-ID: 4d057e86-e04b-11e9-964e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 4d057e86-e04b-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569494963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zU20ZFRUrX7FG8BL7PXjIQXNBcMbUSU+wRfgRJQ2vws=;
 b=b5to6LscFTGOwjBT+7kYFTDvhLSOvww8onUTgMp19ekimVAdFp+TF4cJ
 CVx/ZVs1ndr8el+uw75jn/H18E6eSrsl9BC2g+j2/RgSXVQsC+M2sHiO2
 do2xkAAu3goh35viu7IzplX/9tAPuoCqTw0cXQFosxe46iiYMTN5HlaC5 s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OOE9UI7WABusqPndaNa5pf5YiYLOT/IAiz0/5+3NaAVPGpp0LlOGEz6N3BbuSbE8tnlGAhxi48
 HRHwovIC5wSIbO9g3sNa6gtKnEesiZLiggVPyEnPqttjSQ7fB4+5wYETMF28ius9BFC+5JOce7
 8i3x0Jd2cbtbkptZOqjiexKoqsiaSDk79iexpZPZCGqaucAmhe92BMcxdmlTgSLZNpdt6iA022
 09RaYV9xwAF0oEE4HxdJI33/efBiMkg9/Ochx5CJ0xwnhhw3l8nPtZgBmzaD/AiRjfbHV2ZrUs
 QJA=
X-SBRS: 2.7
X-MesageID: 6108176
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6108176"
Date: Thu, 26 Sep 2019 12:49:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190926104916.7pho64cfjmfakjsu@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-6-roger.pau@citrix.com>
 <133e6d6e83f846638ebdd9f66cef279b@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <133e6d6e83f846638ebdd9f66cef279b@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 05/11] ioreq: add internal ioreq
 initialization support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDI6NTk6NTdQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAx
NzoxNAo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2Vy
IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXgu
Y29tPgo+ID4gU3ViamVjdDogW1BBVENIIHYyIDA1LzExXSBpb3JlcTogYWRkIGludGVybmFsIGlv
cmVxIGluaXRpYWxpemF0aW9uIHN1cHBvcnQKPiA+IEBAIC03MzYsMzMgKzc1NCwzOSBAQCBzdGF0
aWMgaW50IGh2bV9pb3JlcV9zZXJ2ZXJfaW5pdChzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywK
PiA+ICAgICAgaW50IHJjOwo+ID4gCj4gPiAgICAgIHMtPnRhcmdldCA9IGQ7Cj4gPiAtCj4gPiAt
ICAgIGdldF9rbm93bmFsaXZlX2RvbWFpbihjdXJyZCk7Cj4gPiAtICAgIHMtPmVtdWxhdG9yID0g
Y3VycmQ7Cj4gPiAtCj4gPiAgICAgIHNwaW5fbG9ja19pbml0KCZzLT5sb2NrKTsKPiA+IC0gICAg
SU5JVF9MSVNUX0hFQUQoJnMtPmlvcmVxX3ZjcHVfbGlzdCk7Cj4gPiAtICAgIHNwaW5fbG9ja19p
bml0KCZzLT5idWZpb3JlcV9sb2NrKTsKPiA+IC0KPiA+IC0gICAgcy0+aW9yZXEuZ2ZuID0gSU5W
QUxJRF9HRk47Cj4gPiAtICAgIHMtPmJ1ZmlvcmVxLmdmbiA9IElOVkFMSURfR0ZOOwo+ID4gCj4g
PiAgICAgIHJjID0gaHZtX2lvcmVxX3NlcnZlcl9hbGxvY19yYW5nZXNldHMocywgaWQpOwo+ID4g
ICAgICBpZiAoIHJjICkKPiA+ICAgICAgICAgIHJldHVybiByYzsKPiA+IAo+ID4gLSAgICBzLT5i
dWZpb3JlcV9oYW5kbGluZyA9IGJ1ZmlvcmVxX2hhbmRsaW5nOwo+ID4gLQo+ID4gLSAgICBmb3Jf
ZWFjaF92Y3B1ICggZCwgdiApCj4gPiArICAgIGlmICggIWh2bV9pb3JlcV9pc19pbnRlcm5hbChp
ZCkgKQo+ID4gICAgICB7Cj4gPiAtICAgICAgICByYyA9IGh2bV9pb3JlcV9zZXJ2ZXJfYWRkX3Zj
cHUocywgdik7Cj4gPiAtICAgICAgICBpZiAoIHJjICkKPiA+IC0gICAgICAgICAgICBnb3RvIGZh
aWxfYWRkOwo+ID4gKyAgICAgICAgZ2V0X2tub3duYWxpdmVfZG9tYWluKGN1cnJkKTsKPiA+ICsK
PiA+ICsgICAgICAgIHMtPmVtdWxhdG9yID0gY3VycmQ7Cj4gPiArICAgICAgICBJTklUX0xJU1Rf
SEVBRCgmcy0+aW9yZXFfdmNwdV9saXN0KTsKPiA+ICsgICAgICAgIHNwaW5fbG9ja19pbml0KCZz
LT5idWZpb3JlcV9sb2NrKTsKPiA+ICsKPiA+ICsgICAgICAgIHMtPmlvcmVxLmdmbiA9IElOVkFM
SURfR0ZOOwo+ID4gKyAgICAgICAgcy0+YnVmaW9yZXEuZ2ZuID0gSU5WQUxJRF9HRk47Cj4gPiAr
Cj4gPiArICAgICAgICBzLT5idWZpb3JlcV9oYW5kbGluZyA9IGJ1ZmlvcmVxX2hhbmRsaW5nOwo+
ID4gKwo+ID4gKyAgICAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQo+ID4gKyAgICAgICAgewo+
ID4gKyAgICAgICAgICAgIHJjID0gaHZtX2lvcmVxX3NlcnZlcl9hZGRfdmNwdShzLCB2KTsKPiA+
ICsgICAgICAgICAgICBpZiAoIHJjICkKPiA+ICsgICAgICAgICAgICAgICAgZ290byBmYWlsX2Fk
ZDsKPiA+ICsgICAgICAgIH0KPiA+ICAgICAgfQo+ID4gKyAgICBlbHNlCj4gPiArICAgICAgICBz
LT5oYW5kbGVyID0gTlVMTDsKPiAKPiBUaGUgc3RydWN0IGlzIHplcm9lZCBvdXQgc28gaW5pdGlh
bGl6aW5nIHRoZSBoYW5kbGVyIGlzIG5vdCBuZWNlc3NhcnkuCj4gCj4gPiAKPiA+ICAgICAgcmV0
dXJuIDA7Cj4gPiAKPiA+ICAgZmFpbF9hZGQ6Cj4gPiArICAgIEFTU0VSVCghaHZtX2lvcmVxX2lz
X2ludGVybmFsKGlkKSk7Cj4gPiAgICAgIGh2bV9pb3JlcV9zZXJ2ZXJfcmVtb3ZlX2FsbF92Y3B1
cyhzKTsKPiA+ICAgICAgaHZtX2lvcmVxX3NlcnZlcl91bm1hcF9wYWdlcyhzKTsKPiA+IAo+IAo+
IEkgdGhpbmsgaXQgd291bGQgYmUgd29ydGh3aGlsZSBoYXZpbmcgdGhhdCBBU1NFUlQgcmVwZWF0
ZWQgaW4gdGhlIGNhbGxlZCBmdW5jdGlvbnMsIGFuZCBvdGhlciBmdW5jdGlvbnMgdGhhdCBvbmx5
IG9wZXJhdGUgb24gZXh0ZXJuYWwgaW9yZXEgc2VydmVycyBlLmcuIGh2bV9pb3JlcV9zZXJ2ZXJf
YWRkX3ZjcHUoKSwgaHZtX2lvcmVxX3NlcnZlcl9tYXBfcGFnZXMoKSwgZXRjLiAKClRoYXQncyBm
aW5lLCBidXQgdGhlbiBJIHdvdWxkIGFsc28gbmVlZCB0byBwYXNzIHRoZSBpb3JlcSBzZXJ2ZXIg
aWQgdG8KdGhvc2UgZnVuY3Rpb25zIGp1c3QgdG8gcGVyZm9ybSB0aGUgQVNTRVJULiBJIHdpbGwg
bGVhdmUgdGhvc2UgYXMtaXMKYmVjYXVzZSBJIHRoaW5rIHBhc3NpbmcgdGhlIGlkIGp1c3QgZm9y
IHRoYXQgQVNTRVJUIGlzIGtpbmQgb2YKcG9pbnRsZXNzLgoKPiA+IEBAIC04NjQsMjAgKzg5Nywy
MSBAQCBpbnQgaHZtX2Rlc3Ryb3lfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2Vy
dmlkX3QgaWQpCj4gPiAgICAgICAgICBnb3RvIG91dDsKPiA+IAo+ID4gICAgICByYyA9IC1FUEVS
TTsKPiA+IC0gICAgaWYgKCBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21haW4gKQo+ID4gKyAg
ICAvKiBOQjogaW50ZXJuYWwgc2VydmVycyBjYW5ub3QgYmUgZGVzdHJveWVkLiAqLwo+ID4gKyAg
ICBpZiAoIGh2bV9pb3JlcV9pc19pbnRlcm5hbChpZCkgfHwgcy0+ZW11bGF0b3IgIT0gY3VycmVu
dC0+ZG9tYWluICkKPiAKPiBTaG91bGRuJ3QgdGhlIHRlc3Qgb2YgaHZtX2lvcmVxX2lzX2ludGVy
bmFsKGlkKSBzaW1wbHkgYmUgYW4gQVNTRVJUPyBUaGlzIGZ1bmN0aW9uIHNob3VsZCBvbmx5IGJl
IGNhbGxlZCBmcm9tIGEgZG1fb3AoKSwgcmlnaHQ/CgpSaWdodCwgSSB0aGluayBJJ3ZlIHdyb25n
bHkgYXNzdW1lZCB0aGlzIHdhcyBhbHNvIGNhbGxlZCB3aGVuCmRlc3Ryb3lpbmcgYSBkb21haW4s
IGJ1dCBkb21haW4gZGVzdHJ1Y3Rpb24gdXNlcwpodm1fZGVzdHJveV9hbGxfaW9yZXFfc2VydmVy
cyBpbnN0ZWFkLgoKPiA+ICAgICAgICAgIGdvdG8gb3V0Owo+ID4gCj4gPiAgICAgIGRvbWFpbl9w
YXVzZShkKTsKPiA+IAo+ID4gICAgICBwMm1fc2V0X2lvcmVxX3NlcnZlcihkLCAwLCBpZCk7Cj4g
PiAKPiA+IC0gICAgaHZtX2lvcmVxX3NlcnZlcl9kaXNhYmxlKHMpOwo+ID4gKyAgICBodm1faW9y
ZXFfc2VydmVyX2Rpc2FibGUocywgaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSk7Cj4gPiAKPiA+
ICAgICAgLyoKPiA+ICAgICAgICogSXQgaXMgc2FmZSB0byBjYWxsIGh2bV9pb3JlcV9zZXJ2ZXJf
ZGVpbml0KCkgcHJpb3IgdG8KPiA+ICAgICAgICogc2V0X2lvcmVxX3NlcnZlcigpIHNpbmNlIHRo
ZSB0YXJnZXQgZG9tYWluIGlzIHBhdXNlZC4KPiA+ICAgICAgICovCj4gPiAtICAgIGh2bV9pb3Jl
cV9zZXJ2ZXJfZGVpbml0KHMpOwo+ID4gKyAgICBodm1faW9yZXFfc2VydmVyX2RlaW5pdChzLCBo
dm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpKTsKPiA+ICAgICAgc2V0X2lvcmVxX3NlcnZlcihkLCBp
ZCwgTlVMTCk7Cj4gPiAKPiA+ICAgICAgZG9tYWluX3VucGF1c2UoZCk7Cj4gPiBAQCAtOTA5LDcg
Kzk0Myw4IEBAIGludCBodm1fZ2V0X2lvcmVxX3NlcnZlcl9pbmZvKHN0cnVjdCBkb21haW4gKmQs
IGlvc2VydmlkX3QgaWQsCj4gPiAgICAgICAgICBnb3RvIG91dDsKPiA+IAo+ID4gICAgICByYyA9
IC1FUEVSTTsKPiA+IC0gICAgaWYgKCBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21haW4gKQo+
ID4gKyAgICAvKiBOQjogZG9uJ3QgYWxsb3cgZmV0Y2hpbmcgaW5mb3JtYXRpb24gZnJvbSBpbnRl
cm5hbCBpb3JlcSBzZXJ2ZXJzLiAqLwo+ID4gKyAgICBpZiAoIGh2bV9pb3JlcV9pc19pbnRlcm5h
bChpZCkgfHwgcy0+ZW11bGF0b3IgIT0gY3VycmVudC0+ZG9tYWluICkKPiAKPiBBZ2FpbiBoZXJl
LCBhbmQgc2V2ZXJhbCBwbGFjZXMgYmVsb3cuCgpJJ3ZlIGZpeGVkIHRoZSBjYWxscyB0byBodm1f
Z2V0X2lvcmVxX3NlcnZlcl9pbmZvLApodm1fZ2V0X2lvcmVxX3NlcnZlcl9mcmFtZSBhbmQgaHZt
X21hcF9tZW1fdHlwZV90b19pb3JlcV9zZXJ2ZXIgdG8KaW5jbHVkZSBhbiBBU1NFUlQgdGhhdCB0
aGUgcGFzc2VkIGlvcmVxIGlzIG5vdCBpbnRlcm5hbC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
