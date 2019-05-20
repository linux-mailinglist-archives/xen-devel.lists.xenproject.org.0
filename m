Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374F232DE
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 13:43:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSgeP-0008NY-UQ; Mon, 20 May 2019 11:40:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x+15=TU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hSgeP-0008NT-5I
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:40:17 +0000
X-Inumbo-ID: 0943bd23-7af4-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0943bd23-7af4-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 11:40:16 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: uCDREWGFWhaH3IukLKL1jMMeqKHF9oipANsNwjapXrsTaqzqwk8o2QQjjeDHCFAkLlwzbGu8vc
 XcNY5L37gC8hotl2f/JHz0plZK+CUUwYBB7tNTwinOGM1N/6HEhD4eZxOOSh5vNKgXl+YIoRcY
 lb0FPbhZjTUyFjZPT6VklVf5EOV+QY/+n/WrcsyJ4U6VIekmRmkczht9qP8KWGkiQJ2fmWJixk
 OG8eWeGBFhOOzw4e2jdmx1NMH+n7HzV3cRqw7DIzJF56XvdOZj29VSJ/FASUz1BYE4I9ZjVk89
 EC0=
X-SBRS: 2.7
X-MesageID: 653927
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="653927"
Date: Mon, 20 May 2019 13:40:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190520114006.jh3l4kg4abdaekb5@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE917502000078002300A8@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDE917502000078002300A8@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NDg6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gZml4dXBfaXJxcygpIHNraXBzIGludGVycnVwdHMgd2l0aG91dCBhY3Rpb24uIEhlbmNl
IHN1Y2ggaW50ZXJydXB0cyBjYW4KPiByZXRhaW4gYWZmaW5pdHkgdG8ganVzdCBvZmZsaW5lIENQ
VXMuIFdpdGggIm5vaXJxYmFsYW5jZSIgaW4gZWZmZWN0LAo+IHBpcnFfZ3Vlc3RfYmluZCgpIHNv
IGZhciB3b3VsZCBoYXZlIGxlZnQgdGhlbSBhbG9uZSwgcmVzdWx0aW5nIGluIGEgbm9uLQo+IHdv
cmtpbmcgaW50ZXJydXB0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiAtLS0KPiB2MzogTmV3Lgo+IC0tLQo+IEkndmUgbm90IG9ic2VydmVkIHRo
aXMgcHJvYmxlbSBpbiBwcmFjdGljZSAtIHRoZSBjaGFuZ2UgaXMganVzdCB0aGUKPiByZXN1bHQg
b2YgY29kZSBpbnNwZWN0aW9uIGFmdGVyIGhhdmluZyBub3RpY2VkIGFjdGlvbi1sZXNzIElSUXMg
aW4gJ2knCj4gZGVidWcga2V5IG91dHB1dCBwb2ludGluZyBhdCBhbGwgcGFya2VkL29mZmxpbmUg
Q1BVcy4KPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
aXJxLmMKPiBAQCAtMTY4Myw5ICsxNjgzLDI3IEBAIGludCBwaXJxX2d1ZXN0X2JpbmQoc3RydWN0
IHZjcHUgKnYsIHN0cnUKPiAgCj4gICAgICAgICAgZGVzYy0+c3RhdHVzIHw9IElSUV9HVUVTVDsK
PiAgCj4gLSAgICAgICAgLyogQXR0ZW1wdCB0byBiaW5kIHRoZSBpbnRlcnJ1cHQgdGFyZ2V0IHRv
IHRoZSBjb3JyZWN0IENQVS4gKi8KPiAtICAgICAgICBpZiAoICFvcHRfbm9pcnFiYWxhbmNlICYm
IChkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkgIT0gTlVMTCkgKQo+IC0gICAgICAgICAgICBk
ZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkoZGVzYywgY3B1bWFza19vZih2LT5wcm9jZXNzb3Ip
KTsKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIEF0dGVtcHQgdG8gYmluZCB0aGUgaW50ZXJy
dXB0IHRhcmdldCB0byB0aGUgY29ycmVjdCAob3IgYXQgbGVhc3QKPiArICAgICAgICAgKiBzb21l
IG9ubGluZSkgQ1BVLgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGlmICggZGVzYy0+aGFuZGxl
ci0+c2V0X2FmZmluaXR5ICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGNvbnN0IGNwdW1h
c2tfdCAqYWZmaW5pdHkgPSBOVUxMOwo+ICsKPiArICAgICAgICAgICAgaWYgKCAhb3B0X25vaXJx
YmFsYW5jZSApCj4gKyAgICAgICAgICAgICAgICBhZmZpbml0eSA9IGNwdW1hc2tfb2Yodi0+cHJv
Y2Vzc29yKTsKPiArICAgICAgICAgICAgZWxzZSBpZiAoICFjcHVtYXNrX2ludGVyc2VjdHMoZGVz
Yy0+YWZmaW5pdHksICZjcHVfb25saW5lX21hcCkgKQo+ICsgICAgICAgICAgICB7Cj4gKyAgICAg
ICAgICAgICAgICBjcHVtYXNrX3NldGFsbChkZXNjLT5hZmZpbml0eSk7Cj4gKyAgICAgICAgICAg
ICAgICBhZmZpbml0eSA9ICZjcHVtYXNrX2FsbDsKPiArICAgICAgICAgICAgfQo+ICsgICAgICAg
ICAgICBlbHNlIGlmICggIWNwdW1hc2tfaW50ZXJzZWN0cyhkZXNjLT5hcmNoLmNwdV9tYXNrLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1X29ubGluZV9t
YXApICkKCkknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcHVycG9zZSBvZiB0aGUgZGVzYy0+YXJjaC5j
cHVfbWFzayBjaGVjaywKd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGp1c3QgdXNlIGVsc2UgYW5k
IHNldCB0aGUgYWZmaW5pdHkgdG8KZGVzYy0+YWZmaW5pdHk/CgpPciBpdCdzIGp1c3QgYW4gb3B0
aW1pemF0aW9uIHRvIGF2b2lkIGRvaW5nIHRoZSBzZXRfYWZmaW5pdHkgY2FsbCBpZgp0aGUgaW50
ZXJydXB0IGl0IGFscmVhZHkgYm91bmQgdG8gYW4gb25saW5lIENQVT8KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
