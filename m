Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F547260A2
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 11:43:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTNkX-0006LC-JD; Wed, 22 May 2019 09:41:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up1o=TW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hTNkW-0006L7-59
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:41:28 +0000
X-Inumbo-ID: c4131990-7c75-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c4131990-7c75-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 09:41:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: pBwSZwFamN651qCnD5NHl8yR5p5Hdf2ml6W/l8LUxB/vb+ulx1Nh1/ummVbdCT1ZbguVLzk2Xg
 80aNCd8f7zfeYcTdsEo6kKAgVKj/RfCpLz+zeTqK1azTNm59MKhhpS7Hz3xSeKKjou5ktIjFdq
 hWEKY+d16+0g9xe4PQFO0kVQfLl2ym9sI4M0D1KaW6b06AdYxM4Vcc6mgBg7r0XWEYcGL6vNTT
 uKu/BcK7bifRFQGRKwANrSVwAjopEZqOqdzUa2VGvXnBYFf/u3crJnBRWJ3Z5MH2m/MydMtlab
 aUg=
X-SBRS: 2.7
X-MesageID: 757040
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,498,1549947600"; 
   d="scan'208";a="757040"
Date: Wed, 22 May 2019 10:41:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190522094114.weyuo4qy6gpjt7qt@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE917502000078002300A8@prv1-mh.provo.novell.com>
 <20190520114006.jh3l4kg4abdaekb5@Air-de-Roger>
 <5CE2C4FF0200007800230ABF@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE2C4FF0200007800230ABF@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 07/15] x86/IRQ: target online CPUs when
 binding guest IRQ
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDk6MTc6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjA1LjE5IGF0IDEzOjQwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NDg6MjFBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gZml4dXBfaXJxcygpIHNraXBzIGludGVycnVwdHMgd2l0aG91dCBh
Y3Rpb24uIEhlbmNlIHN1Y2ggaW50ZXJydXB0cyBjYW4KPiA+PiByZXRhaW4gYWZmaW5pdHkgdG8g
anVzdCBvZmZsaW5lIENQVXMuIFdpdGggIm5vaXJxYmFsYW5jZSIgaW4gZWZmZWN0LAo+ID4+IHBp
cnFfZ3Vlc3RfYmluZCgpIHNvIGZhciB3b3VsZCBoYXZlIGxlZnQgdGhlbSBhbG9uZSwgcmVzdWx0
aW5nIGluIGEgbm9uLQo+ID4+IHdvcmtpbmcgaW50ZXJydXB0Lgo+ID4+IAo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiAtLS0KPiA+PiB2Mzog
TmV3Lgo+ID4+IC0tLQo+ID4+IEkndmUgbm90IG9ic2VydmVkIHRoaXMgcHJvYmxlbSBpbiBwcmFj
dGljZSAtIHRoZSBjaGFuZ2UgaXMganVzdCB0aGUKPiA+PiByZXN1bHQgb2YgY29kZSBpbnNwZWN0
aW9uIGFmdGVyIGhhdmluZyBub3RpY2VkIGFjdGlvbi1sZXNzIElSUXMgaW4gJ2knCj4gPj4gZGVi
dWcga2V5IG91dHB1dCBwb2ludGluZyBhdCBhbGwgcGFya2VkL29mZmxpbmUgQ1BVcy4KPiA+PiAK
PiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPiA+PiArKysgYi94ZW4vYXJjaC94ODYvaXJx
LmMKPiA+PiBAQCAtMTY4Myw5ICsxNjgzLDI3IEBAIGludCBwaXJxX2d1ZXN0X2JpbmQoc3RydWN0
IHZjcHUgKnYsIHN0cnUKPiA+PiAgCj4gPj4gICAgICAgICAgZGVzYy0+c3RhdHVzIHw9IElSUV9H
VUVTVDsKPiA+PiAgCj4gPj4gLSAgICAgICAgLyogQXR0ZW1wdCB0byBiaW5kIHRoZSBpbnRlcnJ1
cHQgdGFyZ2V0IHRvIHRoZSBjb3JyZWN0IENQVS4gKi8KPiA+PiAtICAgICAgICBpZiAoICFvcHRf
bm9pcnFiYWxhbmNlICYmIChkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkgIT0gTlVMTCkgKQo+
ID4+IC0gICAgICAgICAgICBkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkoZGVzYywgY3B1bWFz
a19vZih2LT5wcm9jZXNzb3IpKTsKPiA+PiArICAgICAgICAvKgo+ID4+ICsgICAgICAgICAqIEF0
dGVtcHQgdG8gYmluZCB0aGUgaW50ZXJydXB0IHRhcmdldCB0byB0aGUgY29ycmVjdCAob3IgYXQg
bGVhc3QKPiA+PiArICAgICAgICAgKiBzb21lIG9ubGluZSkgQ1BVLgo+ID4+ICsgICAgICAgICAq
Lwo+ID4+ICsgICAgICAgIGlmICggZGVzYy0+aGFuZGxlci0+c2V0X2FmZmluaXR5ICkKPiA+PiAr
ICAgICAgICB7Cj4gPj4gKyAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqYWZmaW5pdHkgPSBO
VUxMOwo+ID4+ICsKPiA+PiArICAgICAgICAgICAgaWYgKCAhb3B0X25vaXJxYmFsYW5jZSApCj4g
Pj4gKyAgICAgICAgICAgICAgICBhZmZpbml0eSA9IGNwdW1hc2tfb2Yodi0+cHJvY2Vzc29yKTsK
PiA+PiArICAgICAgICAgICAgZWxzZSBpZiAoICFjcHVtYXNrX2ludGVyc2VjdHMoZGVzYy0+YWZm
aW5pdHksICZjcHVfb25saW5lX21hcCkgKQo+ID4+ICsgICAgICAgICAgICB7Cj4gPj4gKyAgICAg
ICAgICAgICAgICBjcHVtYXNrX3NldGFsbChkZXNjLT5hZmZpbml0eSk7Cj4gPj4gKyAgICAgICAg
ICAgICAgICBhZmZpbml0eSA9ICZjcHVtYXNrX2FsbDsKPiA+PiArICAgICAgICAgICAgfQo+ID4+
ICsgICAgICAgICAgICBlbHNlIGlmICggIWNwdW1hc2tfaW50ZXJzZWN0cyhkZXNjLT5hcmNoLmNw
dV9tYXNrLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
Y3B1X29ubGluZV9tYXApICkKPiA+IAo+ID4gSSdtIG5vdCBzdXJlIEkgc2VlIHRoZSBwdXJwb3Nl
IG9mIHRoZSBkZXNjLT5hcmNoLmNwdV9tYXNrIGNoZWNrLAo+ID4gd291bGRuJ3QgaXQgYmUgYmV0
dGVyIHRvIGp1c3QgdXNlIGVsc2UgYW5kIHNldCB0aGUgYWZmaW5pdHkgdG8KPiA+IGRlc2MtPmFm
ZmluaXR5Pwo+IAo+IFdlIHNob3VsZCBhdm9pZCBjbG9iYmVyaW5nIGRlc2MtPmFmZmluaXR5IHdo
ZW5ldmVyIHBvc3NpYmxlOiBJdAo+IHJlZmxlY3RzIChzZWUgdGhlIHJlc3BlY3RpdmUgcGF0Y2gg
aW4gdGhpcyBzZXJpZXMpIHdoYXQgd2FzCj4gcmVxdWVzdGVkIGJ5IHdoYXRldmVyICJvdXRzaWRl
IiBwYXJ0eS4KPiAKPiA+IE9yIGl0J3MganVzdCBhbiBvcHRpbWl6YXRpb24gdG8gYXZvaWQgZG9p
bmcgdGhlIHNldF9hZmZpbml0eSBjYWxsIGlmCj4gPiB0aGUgaW50ZXJydXB0IGl0IGFscmVhZHkg
Ym91bmQgdG8gYW4gb25saW5lIENQVT8KPiAKPiBUaGlzIGlzIGEgc2Vjb25kIGFzcGVjdCBoZXJl
IGluZGVlZCAtIHdoeSBwbGF5IHdpdGggdGhlIElSUSBpZgo+IGl0IGhhcyBhIHZhbGlkIGRlc3Rp
bmF0aW9uPwoKVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiwgdGhhdCBMR1RNOgoKUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
