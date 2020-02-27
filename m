Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0DC171584
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 11:58:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7GpO-00079H-Ui; Thu, 27 Feb 2020 10:55:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7GpN-00079C-39
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 10:55:37 +0000
X-Inumbo-ID: aeff97fc-594f-11ea-b7e8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aeff97fc-594f-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582800936;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=D0AIt6zniegba8UylSTyIgULGaY9lrRfhq0ta1g2Mag=;
 b=V6OS6TQrKlFA4eOgDHtvihG5l6dlSbxtbwChQq7jmDnYhZnGoJdzlrDj
 T2Z98xvb1BUsP7802hvuS+RBnM6hwFFL56v9Gjarhf4RY4+BvOcFIAUgs
 sBF1UssVNDw9EiwiQutmMf8QdV4OsTjzMwD+ujxDUs/qUe6fVwlwAUnld o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JQHU9ZdrvRFIbL7+sKRaOeDbt+TJ/TUwXlBihwssTO1oThCIjbVGuCPbT9BvSz7BS6YXmoiX/M
 bZQ+OG/rcXc0jUSEMHe4sh2WCZVoeIM/NHilkiHwbhYy9/eri2fYw4OW7UpJpA7tVfYfpfOZFt
 LEAEHERcJ69QLZJDWib1PzHXA1qUc8iXNV9vXhXiV5fomHh4VriCm1EDNvQVdztSADdCGRtUSX
 VrP+oVJn74d5VCCuf/rbf/iSoTi0u71sG+xIJnaK1ILjCtRaf4frPw271umRJUtlZUJoNXcrpk
 nV0=
X-SBRS: 2.7
X-MesageID: 13445439
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13445439"
To: Jan Beulich <jbeulich@suse.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-9-andrew.cooper3@citrix.com>
 <af3fe9fc-0d3c-4a9a-336c-b316f31fbfed@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <18c894ad-dbaa-2fd5-93e3-391cd3fee5c1@citrix.com>
Date: Thu, 27 Feb 2020 10:55:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <af3fe9fc-0d3c-4a9a-336c-b316f31fbfed@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 08/10] x86/cpuid: Introduce and use default
 CPUID policies
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNy8wMi8yMDIwIDA4OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNi4wMi4yMDIw
IDIxOjIyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBGb3Igbm93LCB0aGUgZGVmYXVsdCBhbmQg
bWF4IHBvbGljaWVzIHJlbWFpbiBpZGVudGljYWwsIGJ1dCB0aGlzIHdpbGwgY2hhbmdlCj4+IGlu
IHRoZSBmdXR1cmUuICBXcml0ZSBjYWxjdWxhdGVfe3B2LGh2bX1fZGVmX3BvbGljeSgpIGluIGEg
d2F5IHdoaWNoIHdpbGwgY29wZQo+PiB3aXRoIHNpbXBsZSBmZWF0dXJlIGRpZmZlcmVuY2VzIGZv
ciBub3cuCj4+Cj4+IFVwZGF0ZSBYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5IGFuZCBpbml0X2Rv
bWFpbl9jcHVpZF9wb2xpY3koKSB0byB1c2UgdGhlCj4+IGRlZmF1bHQgcG9saWNpZXMuCj4gRm9y
IHRoZSBzeXNjdGwgdGhlIHN0YXRlbWVudCBsb29rcyB0byBiZSBicm9hZGVyIHRoYW4gcmVhbGl0
eSwKPiBhcyAob2YgY291cnNlKSB5b3UgZG9uJ3QgdG91Y2ggWEVOX1NZU0NUTF9jcHVfcG9saWN5
XypfbWF4LgoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBoZXJl
LsKgIFdoYXQgd291bGQgSSBuZWVkIHRvCnRvdWNoIGluIFhFTl9TWVNDVExfY3B1X3BvbGljeV8q
X21heCBhdCBhbGw/Cgo+PiBAQCAtMzgxLDYgKzM4NiwyMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
Y2FsY3VsYXRlX3B2X21heF9wb2xpY3kodm9pZCkKPj4gICAgICBwLT5leHRkLnJhd1sweGFdID0g
RU1QVFlfTEVBRjsgLyogTm8gU1ZNIGZvciBQViBndWVzdHMuICovCj4+ICB9Cj4+ICAKPj4gK3N0
YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcHZfZGVmX3BvbGljeSh2b2lkKQo+PiArewo+PiAr
ICAgIHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSAmcHZfZGVmX2NwdWlkX3BvbGljeTsKPj4gKyAg
ICB1aW50MzJfdCBwdl9mZWF0dXJlc2V0W0ZTQ0FQSU5UU107Cj4+ICsgICAgdW5zaWduZWQgaW50
IGk7Cj4+ICsKPj4gKyAgICAqcCA9IHB2X21heF9jcHVpZF9wb2xpY3k7Cj4+ICsgICAgY3B1aWRf
cG9saWN5X3RvX2ZlYXR1cmVzZXQocCwgcHZfZmVhdHVyZXNldCk7Cj4+ICsKPj4gKyAgICBmb3Ig
KCBpID0gMDsgaSA8IEFSUkFZX1NJWkUocHZfZmVhdHVyZXNldCk7ICsraSApCj4+ICsgICAgICAg
IHB2X2ZlYXR1cmVzZXRbaV0gJj0gcHZfZGVmX2ZlYXR1cmVtYXNrW2ldOwo+PiArCj4+ICsgICAg
c2FuaXRpc2VfZmVhdHVyZXNldChwdl9mZWF0dXJlc2V0KTsKPj4gKyAgICBjcHVpZF9mZWF0dXJl
c2V0X3RvX3BvbGljeShwdl9mZWF0dXJlc2V0LCBwKTsKPj4gKyAgICByZWNhbGN1bGF0ZV94c3Rh
dGUocCk7Cj4+ICt9Cj4gSXMgdGhlcmUgYSByZWFzb24gdGhlIGNhbGwgdG8gZ3Vlc3RfY29tbW9u
X2ZlYXR1cmVfYWRqdXN0bWVudHMoKQo+IGlzIG1pc3NpbmcgaGVyZT8KClllcywgZm9yIHRoZSBz
YW1lIHJlYXNvbiB0aGF0IG90aGVyIGxvZ2ljIGlzIGRyb3BwZWQuwqAgSW5oZXJpdGluZyBmcm9t
CnB2X21heF9jcHVpZF9wb2xpY3kgbWVhbnMgdGhhdCBpdCBoYXMgYWxyZWFkeSBiZWVuIHJ1biBv
biB0aGlzIG9iamVjdC4KClRoZSBob3N0IHRvICpfbWF4IGRlcml2YXRpb24gaXMgbm9uLXRyaXZp
YWwuwqAgU29tZSBmZWF0dXJlcyBnZXQgYWRkZWQKaW4sIG90aGVycyBhcmUgY29uZGl0aW9uYWwg
b24gZXh0ZXJuYWwgZmFjdG9ycy7CoCBUaGUgKl9tYXggdG8gKl9kZWYKZGVyaXZhdGlvbiBpcyBt
dWNoIG1vcmUgc2ltcGxlIGluIGNvbXBhcmlzb24uCgpMb25nIHRlcm0sIEkgZXhwZWN0IHRoaXMg
bG9naWMgdG8gbW92ZSBpbnRvIGxpYng4NiBhbmQgZnVydGhlciBzaW1wbGlmeQpjcHVpZC5jCgpI
b3dldmVyLCBJJ20gbm90IHN1cmUgd2h5IGd1ZXN0X2NvbW1vbl9mZWF0dXJlX2FkanVzdG1lbnRz
KCkgaXMgc3BlY2lhbApjb21wYXJlZCB0byB0aGUgb3RoZXIgcmVtb3ZlZCBsb2dpYywgYW5kIHdo
eSBpdCBzaG91bGQgYmUgY2FsbGVkIG91dC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
