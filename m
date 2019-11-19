Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66D1029AD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 17:47:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6cr-0004Qf-Jv; Tue, 19 Nov 2019 16:45:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tiwe=ZL=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iX6cp-0004QW-MG
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:45:11 +0000
X-Inumbo-ID: f2b468b0-0aeb-11ea-a2ff-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2b468b0-0aeb-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574181910;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fhv1yhegdzSaMeG3OSnx1SmuXFPzSGyp9312xEk8qLA=;
 b=ETcOuT8JUGQqVkELtOI1tQfKJWk5v7qjvNTrkYmmYUrjNcGHHelkAKOs
 50SZqYmu3GolCA2CEQ7UeYZEAtn8XcTA9hHJO+mlK7yZ9TW1pTwztSDRg
 FUIyqU8RNjKn360pmrGQwbZxHdGIQY4QMWGEhW9L5aaizAn/aXrbnGRiq 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yrzdKhXaR90Itnb67WsjdAnU7dIdh6DbtcMuhlAHOCkN7ed55KDMPs+pGkG3Q5hBWUMB7mbkZW
 AoweAdIrzLfhXNPitw/Ct73nF2BdW0W1JVTYAjm8btNw9FetN043grV62GyEDtSC40xriKbKux
 u4TWfiqaxPqHH9OIGyTLtFxoAlt+g1fwMZ9gaZI24xgiAdhU4P4QYo0wip+gmlK+rK01PxeSpS
 onWFc2tF2DX/bPocrpT3tA+tMu7PD5VGTZaJ/6gHz4fZER6PQVXIkMeDeNWDWNDwFZ6Z83pXct
 FRw=
X-SBRS: 2.7
X-MesageID: 9082659
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,218,1571716800"; 
   d="scan'208";a="9082659"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191114130653.51185-1-wipawel@amazon.de>
 <20191114130653.51185-11-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <4d65f5ff-ed99-73f7-f5e1-57cc42673bb6@citrix.com>
Date: Tue, 19 Nov 2019 16:45:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191114130653.51185-11-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 10/12] livepatch: Handle arbitrary size
 names with the list operation
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTQvMTkgMTowNiBQTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhlIHBh
eWxvYWRzJyBuYW1lIHN0cmluZ3MgY2FuIGJlIG9mIGFyYml0cmFyeSBzaXplICh0eXBpY2FsbHkg
c21hbGwKPiB3aXRoIGFuIHVwcGVyIGJvdW5kIG9mIFhFTl9MSVZFUEFUQ0hfTkFNRV9TSVpFKS4K
PiBDdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHRoZSBsaXN0IG9wZXJhdGlvbiBpbnRlcmZhY2Ug
YWxsb3dzIHRvIGNvcHkKPiBuYW1lcyBpbiB0aGUgWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkUgY2h1
bmtzIHJlZ2FyZGxlc3Mgb2YgaXRzIGFjdHVhbAo+IHNpemUgYW5kIGVuZm9yY2VzIHNwYWNlIGFs
bG9jYXRpb24gcmVxdWlyZW1lbnRzIG9uIHVzZXJsYW5kIHRvb2xzLgo+IAo+IFRvIHVuaWZ5IGFu
ZCBzaW1wbGlmeSB0aGUgaW50ZXJmYWNlLCBoYW5kbGUgdGhlIG5hbWUgc3RyaW5ncyBvZgo+IGFy
Yml0cmFyeSBzaXplIGJ5IGNvcHlpbmcgdGhlbSBpbiBhZGhlcmluZyBjaHVua3MgdG8gdGhlIHVz
ZXJsYW5kLgo+IEluIG9yZGVyIHRvIGxldCB0aGUgdXNlcmxhbmQgYWxsb2NhdGUgZW5vdWdoIHNw
YWNlIGZvciB0aGUgaW5jb21pbmcKPiBkYXRhIGFkZCBhbiBhdXhpbGlhcnkgaW50ZXJmYWNlIHhj
X2xpdmVwYXRjaF9saXN0X2dldF9zaXplcygpIHRoYXQKPiBwcm92aWRlcyB0aGUgY3VycmVudCBu
dW1iZXIgb2YgcGF5bG9hZCBlbnRyaWVzIGFuZCB0aGUgdG90YWwgc2l6ZSBvZgo+IGFsbCBuYW1l
IHN0cmluZ3MuIFRoaXMgaXMgYWNoaWV2ZWQgYnkgZXh0ZW5kaW5nIHRoZSBzeXNjdGwgbGlzdAo+
IGludGVyZmFjZSB3aXRoIGFuIGV4dHJhIGZpZWxkczogbmFtZV90b3RhbF9zaXplLgo+IAo+IFRo
ZSB4Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMoKSBpc3N1ZXMgdGhlIGxpdmVwYXRjaCBzeXNj
dGwgbGlzdAo+IG9wZXJhdGlvbiB3aXRoIHRoZSBuciBmaWVsZCBzZXQgdG8gMC4gSW4gdGhpcyBt
b2RlIHRoZSBvcGVyYXRpb24KPiByZXR1cm5zIHRoZSBudW1iZXIgb2YgcGF5bG9hZCBlbnRyaWVz
IGFuZCBjYWxjdWxhdGVzIHRoZSB0b3RhbCBzaXplcwo+IGZvciBhbGwgcGF5bG9hZHMnIG5hbWVz
Lgo+IFdoZW4gdGhlIHN5c2N0bCBvcGVyYXRpb24gaXMgaXNzdWVkIHdpdGggYSBub24temVybyBu
ciBmaWVsZCAoZm9yCj4gaW5zdGFuY2Ugd2l0aCBhIHZhbHVlIG9idGFpbmVkIGVhcmxpZXIgd2l0
aCB0aGUgcHJpb3IgY2FsbCB0byB0aGUKPiB4Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMoKSkg
dGhlIG5ldyBmaWVsZCBuYW1lX3RvdGFsX3NpemUgcHJvdmlkZXMKPiB0aGUgdG90YWwgc2l6ZSBv
ZiBhY3R1YWxseSBjb3BpZWQgZGF0YS4KPiAKPiBFeHRlbmQgdGhlIGxpYnhjIHRvIGhhbmRsZSB0
aGUgbmFtZSBiYWNrLXRvLWJhY2sgZGF0YSB0cmFuc2ZlcnMuCj4gCj4gVGhlIHhlbi1saXZlcGF0
Y2ggdG9vbCBpcyBtb2RpZmllZCB0byBzdGFydCB0aGUgbGlzdCBvcGVyYXRpb24gd2l0aCBhCj4g
Y2FsbCB0byB0aGUgeGNfbGl2ZXBhdGNoX2xpc3RfZ2V0X3NpemVzKCkgdG8gb2J0YWluIHRoZSBh
Y3R1YWwgbnVtYmVyCj4gb2YgcGF5bG9hZHMgYXMgd2VsbCBhcyB0aGUgbmVjZXNzYXJ5IHNwYWNl
IGZvciBuYW1lcy4KPiBUaGUgdG9vbCBub3cgYWx3YXlzIHJlcXVlc3RzIHRoZSBhY3R1YWwgbnVt
YmVyIG9mIGVudHJpZXMgYW5kIGxlYXZlcwo+IHRoZSBwcmVlbXB0aW9uIGhhbmRsaW5nIHRvIHRo
ZSBsaWJ4YyByb3V0aW5lLiBUaGUgbGlieGMgc3RpbGwgcmV0dXJucwo+ICdkb25lJyBhbmQgJ2xl
ZnQnIHBhcmFtZXRlcnMgd2l0aCB0aGUgc2FtZSBzZW1hbnRpYyBhbGxvd2luZyB0aGUgdG9vbAo+
IHRvIGRldGVjdCBhbm9tYWxpZXMgYW5kIHJlYWN0IHRvIHRoZW0uIEF0IHRoZSBtb21lbnQgaXQg
aXMgZXhwZWN0ZWQKPiB0aGF0IHRoZSB0b29sIHJlY2VpdmVzIHRoZSBleGFjdCBudW1iZXIgb2Yg
ZW50cmllcyBhcyByZXF1ZXN0ZWQuCj4gVGhlIHhlbi1saXZlcGF0Y2ggdG9vbCBoYXMgYmVlbiBh
bHNvIG1vZGlmaWVkIHRvIGhhbmRsZSB0aGUgbmFtZQo+IGJhY2stdG8tYmFjayB0cmFuc2ZlcnMg
Y29ycmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBh
d2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRy
YXByc0BhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1h
em9uLmRlPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRl
Pgo+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPiAtLS0KUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
