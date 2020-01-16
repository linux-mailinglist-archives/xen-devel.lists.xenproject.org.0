Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2422813DA15
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 13:32:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is4HC-0005TD-Uq; Thu, 16 Jan 2020 12:29:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PZsJ=3F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1is4HB-0005T4-Gh
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 12:29:29 +0000
X-Inumbo-ID: d4691687-385b-11ea-8717-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4691687-385b-11ea-8717-12813bfff9fa;
 Thu, 16 Jan 2020 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579177765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v+Wct2t1pqaJ8Fb/EfqCgi4gFZ7zvg6rZTYkFLkcOmE=;
 b=bJRAQT2b0KBLrWGU2hvIPG+2O4uEDI68clTiu+EKlvIspwkb053Z7hDz
 UY02ha91VVXX2I4WqXowa0RzD9HqrDS2R+hpd6rDG64vEqmgYEfsTV8vW
 k8710av2rUH6pLSgc/XNEaE5CL5Q0wDSm78pmLtaDAt1W/RtXZ+iy3lbh k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hmfvqQPRgcotMWUcMKlOQ7SxY3Z/RzyxvOVDJTBEw3rTctfZBU3RR+Etyys/5RkvTMOWtrdmh1
 HGKvviQiuN24DkaYrD6D3UFn3xvl69cS8U4+anYtyb2KtxHSe78BSyaVjlCG2kO0O6pft4utjy
 m4xk19L51NujaAz8ADIc4Vx9Ye8TmdWtCw+kgRqhIbcQdK6OLJQmFQZdwDrRh8YOs/PFqTjkyy
 xcK1Q3sFNRue3QlXnZBi5Q7wkZ/BiUJi0DXJiw3ymgWmDO8MlJlQI43AfoEAB2FUIGBBmOn9va
 iUc=
X-SBRS: 2.7
X-MesageID: 11000567
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,326,1574139600"; d="scan'208";a="11000567"
Date: Thu, 16 Jan 2020 12:29:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200116122922.GA1288@perard.uk.xensource.com>
References: <20200115170015.249667-1-anthony.perard@citrix.com>
 <20200115170015.249667-3-anthony.perard@citrix.com>
 <1b0dcb84-425c-48a2-dba8-03385d3bf4e2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b0dcb84-425c-48a2-dba8-03385d3bf4e2@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 2/6] xen: Have Kconfig check $(CC)'s
 version
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMTI6MzA6NDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTUuMDEuMjAyMCAxODowMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vS2NvbmZpZwo+ID4gKysrIGIveGVuL0tjb25maWcKPiA+IEBAIC00LDkgKzQsMjUgQEAK
PiA+ICAjCj4gPiAgbWFpbm1lbnUgIlhlbi8kKFNSQ0FSQ0gpICQoWEVOX0ZVTExWRVJTSU9OKSBD
b25maWd1cmF0aW9uIgo+ID4gIAo+ID4gK3NvdXJjZSAic2NyaXB0cy9LY29uZmlnLmluY2x1ZGUi
Cj4gPiArCj4gPiAgY29uZmlnIEJST0tFTgo+ID4gIAlib29sCj4gPiAgCj4gPiArY29uZmlnIEND
X0lTX0dDQwo+ID4gKwlkZWZfYm9vbCAkKHN1Y2Nlc3MsJChDQykgLS12ZXJzaW9uIHwgaGVhZCAt
biAxIHwgZ3JlcCAtcSBnY2MpCj4gPiArCj4gPiArY29uZmlnIEdDQ19WRVJTSU9OCj4gPiArCWlu
dAo+ID4gKwlkZWZhdWx0ICQoc2hlbGwsJChCQVNFRElSKS9zY3JpcHRzL2djYy12ZXJzaW9uLnNo
ICQoQ0MpKQo+ID4gKwo+ID4gK2NvbmZpZyBDQ19JU19DTEFORwo+ID4gKwlkZWZfYm9vbCAkKHN1
Y2Nlc3MsJChDQykgLS12ZXJzaW9uIHwgaGVhZCAtbiAxIHwgZ3JlcCAtcSBjbGFuZykKPiA+ICsK
PiA+ICtjb25maWcgQ0xBTkdfVkVSU0lPTgo+ID4gKwlpbnQKPiA+ICsJZGVmYXVsdCAkKHNoZWxs
LCQoQkFTRURJUikvc2NyaXB0cy9jbGFuZy12ZXJzaW9uLnNoICQoQ0MpKQo+IAo+IEkgY29udGlu
dWUgdG8gYmUgdW5oYXBweSBhYm91dCB0aGUgcmVkdW5kYW5jeSwgYnV0IEkgd2lsbCBhY2NlcHQK
PiBpdCBpZiBvdGhlcnMgaW5kZWVkIHRoaW5rIHRoaXMgaXMgaGVscGZ1bC4gSG93ZXZlciwgSSBk
b24ndCBzZWUKPiB0aGVuIHdoeSB0aGUgc2V0dGluZyBvZiBDQ19JU18qIG5lZWQgYW5vdGhlciBz
aGVsbCBpbnZvY2F0aW9uCj4gZWFjaCAtIHRoaXMgY291bGQganVzdCBiZSAqX1ZFUlNJT04gPiAw
IHRoZW4sIHNlZWluZyB0aGF0IHRoZQo+IHNjcmlwdHMgYWxyZWFkeSB0byBhIHJlc3BlY3RpdmUg
Z3JlcCBvZiB0aGUgLS12ZXJzaW9uIG91dHB1dC4KCkZyb20gZnVuY3Rpb25hbGl0eSBwb2ludCBv
ZiB2aWV3LCByZXBsYWNpbmcgdGhlIG1hY3JvIGJ5CiJkZWZfYm9vbCAlX1ZFUlNJT04gPiAwIiBp
biAiY29uZmlnIENDX0lTXyUiIHdvdWxkIGJlIGZpbmUsIGV2ZW4gc28gaXQKd291bGQgYmUgd2Vp
cmQgdG8gcmVhZC4gSSB0aGluayB0aGF0IHdvdWxkIG5lZWQgYSBjb21tZW50IHNheWluZzoKICAj
ICUtdmVyc2lvbi5zaCBpcyBleHBlY3RlZCB0byByZXR1cm4gIjAiIHdoZW4gJChDQykgaXNuJ3Qg
JQoKVGhhdCBjb3VsZCBiZSBkb25lIG9uIGNvbW1pdC4KCgo+IEV2ZW4gYmV0dGVyIHdvdWxkIGlt
byBiZSwgYXMgc3VnZ2VzdGVkIGJlZm9yZSwgYSAiZGVwZW5kcyBvbgo+IENDX0lTXyoiIG9uIGVh
Y2ggKl9WRVJTSU9OLgoKSGF2ZW4ndCB3ZSBkaXNjdXNzZWQgdGhpcyBiZWZvcmU/Cgo+IEFzIGEg
bml0IC0gY29tbW9uIHN0eWxlIGVsc2V3aGVyZSB3b3VsZCBzdWdnZXN0IHRoYXQgdGhlcmUgb3Vn
aHQKPiB0byBiZSBhIGJsYW5rIGFmdGVyIHRoZSBjb21tYXMgaW4gJChtYWNybywgLi4uKSBpbnZv
Y2F0aW9ucy4KPiBUaGlzIHdvdWxkIHRoZW4gZXh0ZW5kIHRvIEtjb25maWcuaW5jbHVkZSBhcyB3
ZWxsLCB1bmxlc3MgdGhhdCdzCj4gYSBsYXJnZWx5IHZlcmJhdGltIGluaGVyaXRlZCBmaWxlLgoK
VGhhdCdzIG5vdCBhIGdvb2QgaWRlYSwgaXQgbWF5IG5vdCBtYXR0ZXIgaW4gdGhpcyBjYXNlIGJ1
dCBhZGRpbmcgYQpzcGFjZSBhZnRlciBjb21tYXMgaW4gc29tZSBvdGhlciBjYXNlcyB3aWxsIG5v
dCBkbyB3aGF0IG9uZSB3YW50cy4gbWFrZQphbmQgS2NvbmZpZyBrZWVwcyB0aGUgc3BhY2VzIHdo
ZW4gZXhwYW5kaW5nIHRoZSBtYWNyby4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
