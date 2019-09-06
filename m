Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5FAB50C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 11:40:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6AgB-0006q3-IQ; Fri, 06 Sep 2019 09:37:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6AgA-0006py-4r
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 09:37:18 +0000
X-Inumbo-ID: e9d00dca-d089-11e9-abed-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9d00dca-d089-11e9-abed-12813bfff9fa;
 Fri, 06 Sep 2019 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567762636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hsM9TyIc86JRYfLgFfw+N40UL2yBa1//gfQFu1QflE0=;
 b=LNXsvVegKTe+XVQuCXIoWrK2Hl5Q0qId/7KV4OrlpBQr+jnEBi0JjFdo
 zoVLxrAmhWiT/jNlWRFJ2bOKVxdqpQrYErrgNrT+TKaqbRZtmnarYmlZk
 jeHyKNF3O88asjTNd+7L6p0+YBsBdiQ6yVt5FkCN6iXprOTP1RJ+aQ6bM I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ll4vA/3RS15k90nVB4dpPEDjRgJ8IVjTXfTq043NdVlXq5DNPRszyWfR4amsoLjSr3PxsOHOda
 vkkBZSoAZyw79NUObGm97YQYOTV9C/4uAZ9pDtq+/8eWTElURE+d/dtEhx6yQSrAN6Pu3b8l9A
 DBr1vOgl53GocBopxMscwIqkiEshNc8tv4aRDngWmzuB6JW7rJFbGeJK4Oe21+yAqacd2GUOmk
 KwF17L8JTslT/G97dDspAPNUEBY9vvZZRzTT0jGjMYFrfXb7j1JvEGq2WsBtahmriCBxGI74P4
 UhY=
X-SBRS: 2.7
X-MesageID: 5411173
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5411173"
Date: Fri, 6 Sep 2019 11:37:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190906093707.wn5zn4nzqxrffwo3@Air-de-Roger>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTI6MTg6NDVQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUgYXJlIGN1cnJlbnRseSB0aHJlZSBtb3JlIG9yIGxlc3MgZGlmZmVyZW50IGNo
ZWNrczoKPiAtIF9nZXRfcGFnZV90eXBlKCkgYWRqdXN0cyB0aGUgSU9NTVUgbWFwcGluZ3MgYWNj
b3JkaW5nIHRvIHRoZSBuZXcgdHlwZQo+ICAgIGFsb25lLAo+IC0gYXJjaF9pb21tdV9wb3B1bGF0
ZV9wYWdlX3RhYmxlKCkgd2FudHMganVzdCB0aGUgdHlwZSB0byBiZQo+ICAgIFBHVF93cml0YWJs
ZV9wYWdlLAo+IC0gaW9tbXVfaHdkb21faW5pdCgpIGFkZGl0aW9uYWxseSBwZXJtaXRzIGFsbCBv
dGhlciB0eXBlcyB3aXRoIGEgdHlwZQo+ICAgIHJlZmNvdW50IG9mIHplcm8uCj4gVGhlIGNhbm9u
aWNhbCBvbmUgaXMgaW4gX2dldF9wYWdlX3R5cGUoKSwgYW5kIGFzIG9mIFhTQS0yODgKPiBhcmNo
X2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoKSBhbHNvIGhhcyBubyBuZWVkIGFueW1vcmUgdG8g
ZGVhbCB3aXRoCj4gUEdUX25vbmUgcGFnZXMuIEluIHRoZSBQViBEb20wIGNhc2UsIGhvd2V2ZXIs
IFBHVF9ub25lIHBhZ2VzIGFyZSBzdGlsbAo+IG5lY2Vzc2FyeSB0byBjb25zaWRlciwgc2luY2Ug
aW4gdGhhdCBjYXNlIHBhZ2VzIGRvbid0IGdldCBoYW5kZWQgdG8KPiBndWVzdF9waHlzbWFwX2Fk
ZF9lbnRyeSgpLiBGdXJ0aGVybW9yZSwgdGhlIGZ1bmN0aW9uIHNvIGZhciBhbHNvCj4gZXN0YWJs
aXNoZWQgci9vIG1hcHBpbmdzLCB3aGljaCBpcyBub3QgaW4gbGluZSB3aXRoIHRoZSBydWxlcyBz
ZXQgZm9ydGgKPiBieSB0aGUgWFNBLTI4OCBjaGFuZ2UuCj4gCj4gRm9yIGFyY2hfaW9tbXVfcG9w
dWxhdGVfcGFnZV90YWJsZSgpIHRvIG5vdCBlbmNvdW50ZXIgUEdUX25vbmUgcGFnZXMKPiBhbnlt
b3JlIGV2ZW4gaW4gY2FzZXMgd2hlcmUgdGhlIElPTU1VIGdldHMgZW5hYmxlZCBmb3IgYSBkb21h
aW4gb25seQo+IHdoZW4gaXQgaXMgYWxyZWFkeSBydW5uaW5nLCByZXBsYWNlIHRoZSBJT01NVSBk
ZXBlbmRlbmN5IGluCj4gZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSdzIGhhbmRsaW5nIG9mIFBW
IGd1ZXN0cyB0byBjaGVjayBqdXN0IHRoZQo+IHN5c3RlbSB3aWRlIHN0YXRlIGluc3RlYWQgb2Yg
dGhlIGRvbWFpbiBwcm9wZXJ0eS4KPiAKPiBVbmZvcnR1bmF0ZWx5IChwYXJ0aWFsbHkpIHJlcGxh
Y2luZyB0aGUgaW9tbXVfbWFwKCkgY2FsbCBpbgo+IGlvbW11X2h3ZG9tX2luaXQoKSBpbXBsaWVz
IHJlc3VycmVjdGluZyB0aGUgZmx1c2ggc3VwcHJlc3Npb24gdGhhdCBnb3QKPiBwcmV2aW91c2x5
IGVsaW1pbmF0ZWQuIE5vdGUgdGhhdCB0aGUgY2FsbCB0byBpb21tdV9tYXAoKSBjYW4ndCBiZQo+
IHJlbW92ZWQgYXQgdGhpcyBwb2ludCBpbiB0aW1lIC0gRG9tMCdzIGluaXRpYWwgYWxsb2NhdGlv
biBnZXRzIGl0cyBwYWdlCj4gdHlwZXMgc2V0IGJlZm9yZSBpb21tdV9od2RvbV9pbml0KCkgcnVu
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
LS0tCj4gdjM6IFJlLWJhc2UuCj4gdjI6IEZpeCBJT1RMQiBmbHVzaGluZy4gRXhjbHVkZSBQVkgu
IFVzZSB0eXBlIHNhZmUgbG9jYWwgdmFyaWFibGVzLgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC04MjksMTMgKzgyOSwx
MyBAQCBndWVzdF9waHlzbWFwX2FkZF9wYWdlKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICAgICAg
ICAqCj4gICAgICAgICAgICAqIFJldGFpbiB0aGlzIHByb3BlcnR5IGJ5IGdyYWJiaW5nIGEgd3Jp
dGFibGUgdHlwZSByZWYgYW5kIHRoZW4KPiAgICAgICAgICAgICogZHJvcHBpbmcgaXQgaW1tZWRp
YXRlbHkuICBUaGUgcmVzdWx0IHdpbGwgYmUgcGFnZXMgdGhhdCBoYXZlIGEKPiAtICAgICAgICAg
KiB3cml0YWJsZSB0eXBlIChhbmQgYW4gSU9NTVUgZW50cnkpLCBidXQgYSBjb3VudCBvZiAwIChz
dWNoIHRoYXQKPiAtICAgICAgICAgKiBhbnkgZ3Vlc3QtcmVxdWVzdGVkIHR5cGUgY2hhbmdlcyBz
dWNjZWVkIGFuZCByZW1vdmUgdGhlIElPTU1VCj4gLSAgICAgICAgICogZW50cnkpLgo+ICsgICAg
ICAgICAqIHdyaXRhYmxlIHR5cGUgKGFuZCBhbiBJT01NVSBlbnRyeSBpZiBuZWNlc3NhcnkpLCBi
dXQgYSBjb3VudCBvZiAwCj4gKyAgICAgICAgICogKHN1Y2ggdGhhdCBhbnkgZ3Vlc3QtcmVxdWVz
dGVkIHR5cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCByZW1vdmUgdGhlCj4gKyAgICAgICAgICogSU9N
TVUgZW50cnkpLgo+ICAgICAgICAgICAgKi8KPiAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAo
MVVMIDw8IHBhZ2Vfb3JkZXIpOyArK2ksICsrcGFnZSApCj4gICAgICAgICAgIHsKPiAtICAgICAg
ICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPiArICAgICAgICAgICAgaWYgKCAh
aW9tbXVfZW5hYmxlZCApCgpUaGF0J3Mga2luZCBvZiBhIHN0cm9uZyBjaGVjayBmb3IgYSBkb21h
aW4gdGhhdCBtaWdodCBuZXZlciB1c2UgdGhlCmlvbW11IGF0IGFsbC4gSXNuJ3QgaXQgZmluZSB0
byBqdXN0IHJlbHkgb24KYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlIGZpbmRpbmcgbm9u
LXdyaXRhYmxlIHBhZ2VzIGFuZCB0aHVzIG5vdAphZGRpbmcgdGhlbSB0byB0aGUgaW9tbXUgcGFn
ZS10YWJsZXM/Cgo+ICAgICAgICAgICAgICAgICAgIC8qIG5vdGhpbmcgKi87Cj4gICAgICAgICAg
ICAgICBlbHNlIGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3dyaXRhYmxlX3Bh
Z2UpICkKPiAgICAgICAgICAgICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYwo+IEBAIC0xOTIsMjggKzE5Miw0NiBAQCB2b2lkIF9faHdkb21faW5p
dCBpb21tdV9od2RvbV9pbml0KHN0cnVjCj4gICAgICAgICAgIHVuc2lnbmVkIGludCBpID0gMCwg
Zmx1c2hfZmxhZ3MgPSAwOwo+ICAgICAgICAgICBpbnQgcmMgPSAwOwo+ICAgCj4gKyAgICAgICAg
dGhpc19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3RsYikgPSB0cnVlOwo+ICsKPiAgICAgICAgICAg
cGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQtPnBhZ2VfbGlzdCApCj4gICAgICAgICAgIHsK
PiAtICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdl
KSk7Cj4gLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZGZuID0gbWZuX3RvX2dtZm4oZCwgbWZu
KTsKPiAtICAgICAgICAgICAgdW5zaWduZWQgaW50IG1hcHBpbmcgPSBJT01NVUZfcmVhZGFibGU7
Cj4gLSAgICAgICAgICAgIGludCByZXQ7Cj4gLQo+IC0gICAgICAgICAgICBpZiAoICgocGFnZS0+
dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfY291bnRfbWFzaykgPT0gMCkgfHwKPiAtICAgICAgICAg
ICAgICAgICAoKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX3R5cGVfbWFzaykKPiAtICAg
ICAgICAgICAgICAgICAgPT0gUEdUX3dyaXRhYmxlX3BhZ2UpICkKPiAtICAgICAgICAgICAgICAg
IG1hcHBpbmcgfD0gSU9NTVVGX3dyaXRhYmxlOwo+IC0KPiAtICAgICAgICAgICAgcmV0ID0gaW9t
bXVfbWFwKGQsIF9kZm4oZGZuKSwgX21mbihtZm4pLCAwLCBtYXBwaW5nLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJmZsdXNoX2ZsYWdzKTsKPiAtCj4gLSAgICAgICAgICAgIGlmICgg
IXJjICkKPiAtICAgICAgICAgICAgICAgIHJjID0gcmV0Owo+ICsgICAgICAgICAgICBzd2l0Y2gg
KCBwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF90eXBlX21hc2sgKQo+ICsgICAgICAgICAg
ICB7Cj4gKyAgICAgICAgICAgIGNhc2UgUEdUX25vbmU6Cj4gKyAgICAgICAgICAgICAgICBpZiAo
IGlzX3B2X2RvbWFpbihkKSApCj4gKyAgICAgICAgICAgICAgICB7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgQVNTRVJUKCEocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfY291bnRfbWFzaykp
Owo+ICsgICAgICAgICAgICAgICAgICAgIGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwg
UEdUX3dyaXRhYmxlX3BhZ2UpICkKCkNvdWxkIHlvdSBhZGQgYSBjb21tZW50IHRoYXQgZ2V0X3Bh
Z2VfYW5kX3R5cGUgd2lsbCBhZGQgYW4gaW9tbXUKZW50cnkgaWYgc3VjY2VlZGluZz8KCj4gKyAg
ICAgICAgICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICBwdXRfcGFnZV9h
bmRfdHlwZShwYWdlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hfZmxhZ3MgfD0g
SU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlOwo+ICsgICAgICAgICAgICAgICAgICAg
IH0KPiArICAgICAgICAgICAgICAgICAgICBlbHNlIGlmICggIXJjICkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgcmMgPSAtRUJVU1k7CgpJcyBpdCBmaW5lIHRvIHJldHVybiBhbiBlcnJvciBo
ZXJlPyBBRkFJQ1QgeW91IGNvdWxkIGhhdmUgYSBSTyBwYWdlCnNoYXJlZCB3aXRoIFhlbiB3aXRo
IFBHVF9ub25lLCBhbmQgbm90IGhhdmluZyBhbiBpb21tdSBtYXBwaW5nIGZvciBpdAp3b3VsZCBi
ZSBleHBlY3RlZCwgaGVuY2UgcmV0dXJuaW5nIGFuIGVycm9yIHNlZW1zIHdyb25nPwoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
