Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD91453A9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 12:22:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuE38-0006PU-Hm; Wed, 22 Jan 2020 11:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vprz=3L=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iuE36-0006PP-Qx
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 11:19:52 +0000
X-Inumbo-ID: 1b8e8b16-3d09-11ea-bc20-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b8e8b16-3d09-11ea-bc20-12813bfff9fa;
 Wed, 22 Jan 2020 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579691991;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uUw/BoRovMlX3+q34NGcyS97vyfu3Jbj4fNNR0spmkQ=;
 b=Gw9TJlWC+xq5YTLYXa0Qr4p1PlMR6ChXMaUc7esy0MBtaX+okMqK3QLH
 cJq0O/WPc+FvNLgrZB+USb+7EQCIxpX0JBk5mcoS++wx2+dBdEgRABmi1
 V95eiMGrnVVpCmu5/HZM/fp9mL7LgBlpj9K0TIz5nB5F0PzeDj56la50E U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P2yuOTvvI+F/hT0VbcvyXDwBU+ZfPEINbKyYyeRqDRzec0vrlNT408KG0jF3V1YVXga2cbkgRw
 oVskpWJB7BRj52jWNAwNKBO8rUbWtpOx6zE31MuypM1G5hHEEaH562UF4jPRiNf7PQrZ6z/jl0
 rlWKxZ1cb9O+CtARKOrwNL47xYn1Z2DObDv1/B1X+6YkDEYe0KLl8H0ut5v1zrH0ljAhsf2Kav
 /4sJ4+wv1rZC34v2m7x42cZHzhe4UiqbjI3QuZucnSLW10CwiMuRV/jTtM8gt2KDmpODa++seq
 t34=
X-SBRS: 2.7
X-MesageID: 11857161
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,349,1574139600"; d="scan'208";a="11857161"
To: Julien Grall <julien@xen.org>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
Date: Wed, 22 Jan 2020 11:19:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDEvMjAyMCAxMDoxNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Cj4KPiBPbiAyMi8wMS8y
MDIwIDEwOjAxLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBPbiAyMC8wMS8yMDIwIDEwOjAxLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDE3LjAxLjIwMjAgMTc6NDQsIFNlcmdleSBEeWFzbGkg
d3JvdGU6Cj4+Pj4gdjIgLS0+IHYzOgo+Pj4+IC0gUmVtb3ZlIGh2bWxvYWRlciBmaWx0ZXJpbmcK
Pj4+Cj4+PiBXaHk/IFNlZWluZyB0aGUgcHJpb3IgZGlzY3Vzc2lvbiwgaG93IGFib3V0IGFkZGlu
ZyBYRU5WRVJfZGVuaWVkIHRvCj4+PiByZXR1cm4gdGhlICJkZW5pZWQiIHN0cmluZywgYWxsb3dp
bmcgY29tcG9uZW50cyB3aGljaCB3YW50IHRvIGZpbHRlcgo+Pj4gdG8ga25vdyBleGFjdGx5IHdo
YXQgdG8gbG9vayBmb3I/IEFuZCB0aGVuIHJlLWFkZCB0aGUgZmlsdGVyaW5nIHlvdQo+Pj4gaGFk
PyAoVGhlIGhlbHAgdGV4dCBvZiB0aGUgY29uZmlnIG9wdGlvbiBzaG91bGQgdGhlbiBwZXJoYXBz
IGJlCj4+PiBleHRlbmRlZCB0byBtYWtlIHZlcnkgY2xlYXIgdGhhdCB0aGUgY2hvc2VuIHN0cmlu
ZyBzaG91bGQgbm90IG1hdGNoCj4+PiBhbnl0aGluZyB0aGF0IGNvdWxkIHBvdGVudGlhbGx5IGJl
IHJldHVybmVkIGJ5IGFueSBvZiB0aGUgWEVOVkVSXwo+Pj4gc3ViLW9wcy4pCj4+Cj4+IEkgaGFk
IHRoZSBmb2xsb3dpbmcgcmVhc29uaW5nOgo+Pgo+PiAxLiBNb3N0IHJlYWwtd29ybGQgdXNlcnMg
d291bGQgc2V0IENPTkZJR19YU01fREVOSUVEX1NUUklORz0iIiBhbnl3YXkuCj4+Cj4+IDIuIEZp
bHRlcmluZyBpbiBETUkgdGFibGVzIGlzIG5vdCBhIGNvbXBsZXRlIHNvbHV0aW9uLCBzaW5jZSBk
ZW5pZWQKPj4gc3RyaW5nIGxlYWtzIGVsc2V3aGVyZSB0aHJvdWdoIHRoZSBoeXBlcmNhbGwgKFBW
IGd1ZXN0cywgc3lzZnMsIGRyaXZlcgo+PiBsb2dzKSBhcyBBbmRyZXcgaGFzIHBvaW50ZWQgb3V0
IGluIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLgo+Pgo+PiBPbiB0aGUgb3RoZXIgaGFuZCwgU01C
aW9zIGZpbHRlcmluZyBzbGlnaHRseSBpbXByb3ZlcyB0aGUgc2l0dWF0aW9uIGZvcgo+PiBIVk0g
ZG9tYWlucywgc28gSSBjYW4gcmV0dXJuIGl0IGlmIG1haW50YWluZXJzIGZpbmQgaXQgd29ydGh5
Lgo+Cj4gV2hpbGUgSSBhbSBub3QgYSBtYWludGFpbmVyIG9mIHRoaXMgY29kZSwgbXkgY29uY2Vy
biBpcyB5b3UgaW1wb3NlIHRoZSBjb252ZXJzaW9uIGZyb20gImRlbmllZCIgdG8gIiIgdG8gYWxs
IHRoZSB1c2VycyAoaW5jbHVkZSB0aG9zZSB3aG8gd2FudHMgdG8ga2VlcCAiZGVuaWVkIikuCgpU
aGlzIGlzIG5vdCB3aGF0J3MgaGFwcGVuaW5nIGhlcmU6IHRoZSBkZWZhdWx0IGlzIHN0aWxsICI8
ZGVuaWVkPiIgKGFzCnBlciBwYXRjaCAxKTsgYnV0IHBhdGNoIDIgbWFrZXMgWEVOVkVSX2V4dHJh
dmVyc2lvbiwgWEVOVkVSX2NvbXBpbGVfaW5mbwphbmQgWEVOVkVSX2NoYW5nZXNldCB0byByZXR1
cm4gIjxkZW5pZWQ+IiBpbnN0ZWFkIG9mIHRoZSByZWFsIHZhbHVlcwp3aGljaCBjYXVzZXMgdGhl
IFVJIC8gbG9ncyBpc3N1ZXMuCgo+Cj4gSWYgeW91IHdlcmUgZG9pbmcgYW55IGZpbHRlcmluZyBp
biBodm1sb2FkZXIsIHRoZW4gaXQgd291bGQgYmUgYmVzdCBpZiB0aGlzIGlzIGNvbmZpZ3VyYWJs
ZS4gQnV0IHRoaXMgaXMgYSBiaXQgcG9pbnRsZXNzIGlmIHlvdSBhbHJlYWR5IGFsbG93IHRoZSB1
c2VyIHRvIGNvbmZpZ3VyZSB0aGUgc3RyaW5nIGF0IHRoZSBoeXBlcnZpc29yIGxldmVsIDopLgoK
LS0KVGhhbmtzLApTZXJnZXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
