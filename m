Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA9108F8A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:06:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZEyL-0007Sh-Ka; Mon, 25 Nov 2019 14:04:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nqy9=ZR=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZEyJ-0007SS-V0
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 14:04:12 +0000
X-Inumbo-ID: 73fb0f36-0f8c-11ea-b3bd-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73fb0f36-0f8c-11ea-b3bd-bc764e2007e4;
 Mon, 25 Nov 2019 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574690651;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hplWW1FT+/ScOpBswrLDjiiHJ4eRVQyu+XEv90C1f3U=;
 b=Q8/RjRnwiDQDwEKgt7IDrE5OWS/1Ck6W/E5boSOMUNk7hDmi9iIIUAsR
 nMtRKeRkXoeJ/mDTIcWg9ggtG3HEri5mTjzoamYF0fkKDh7OIv9SQCemq
 F14x/Y+GeWpvbgCZZy++3GeMbEuxHPa2bPtFXuBwDH6rYnygs4DhtIHwP Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wwsa9QjSyVLGzff4Y2ab6aDb17osa+9Vq3bSG83CFDP9gSPihpvHn0CzZFzK+4NmDuRiL0URhu
 azm68fLqqM/YwM27vef1QB+j+amBJ6KL5jWZG/d7iyRzQ2Gb5tJBK5CtgWDLORmdPeTRMpb9k1
 rBpzfkl98Ay2NGcDuCkFm+STRRl5bJNgc7+9vsJxXCyuFKkSxmwRzcYyaNVpdOajzVs1wfZJxa
 687TL38c9CZZR08tM6IB0FlP/hNMcLv4AGzDfyx4xVQiXlbT4WRS8aXk3MRPahvarOCA0tXb9o
 q+Q=
X-SBRS: 2.7
X-MesageID: 8797788
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="8797788"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916113056.16592-1-wipawel@amazon.de>
 <20190916113056.16592-2-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <3806267c-908b-8468-5d1d-9cc4dba2c4aa@citrix.com>
Date: Mon, 25 Nov 2019 14:04:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190916113056.16592-2-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/7] livepatch-build: Embed hypervisor
 build id into every hotpatch
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMjozMCBQTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhpcyBj
aGFuZ2UgaXMgcGFydCBvZiBhIGluZGVwZW5kYW50IHN0YWNrZWQgaG90cGF0Y2ggbW9kdWxlcwo+
IGZlYXR1cmUuIFRoaXMgZmVhdHVyZSBhbGxvd3MgdG8gYnlwYXNzIGRlcGVuZGVuY2llcyBiZXR3
ZWVuIG1vZHVsZXMKPiB1cG9uIGxvYWRpbmcsIGJ1dCBzdGlsbCB2ZXJpZmllcyBYZW4gYnVpbGQg
SUQgbWF0Y2hpbmcuCj4gCj4gV2l0aCBzdGFja2VkIGhvdHBhdGNoIG1vZHVsZXMgaXQgaXMgZXNz
ZW50aWFsIHRoYXQgZWFjaCBhbmQgZXZlcnkKPiBob3RwYXRjaCBpcyB2ZXJpZmllZCBhZ2FpbnN0
IHRoZSBoeXBlcnZpc29yIGJ1aWxkIGlkIHVwb24gdXBsb2FkLgo+IEl0IG11c3Qgbm90IGJlIHBv
c3NpYmxlIHRvIHN1Y2Nlc3NmdWxseSB1cGxvYWQgaG90cGF0Y2hlcyBidWlsdCBmb3IKPiBpbmNv
cnJlY3QgdmVyc2lvbiBvZiB0aGUgaHlwZXJ2aXNvci4KPiAKPiBUbyBhY2hpZXZlIHRoYXQgYWx3
YXlzIGVtYmVkIGFuIGFkZGl0aW9uYWwgRUxGIHNlY3Rpb246Cj4gJy5saXZwYXRjaC54ZW5fZGVw
ZW5kcycgY29udGFpbmluZyB0aGUgaHlwZXJ2aXNvciBidWlsZCBpZC4KPiAKPiBUaGUgaHlwZXJ2
aXNvciBidWlsZCBpZCBtdXN0IGJlIGFsd2F5cyBwcm92aWRlZCBhcyBhIGNvbW1hbmQgbGluZQo+
IHBhcmFtZXRlcjogLS14ZW4tZGVwZW5kcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVj
em9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5h
IFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogQmpvZXJuIERv
ZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxu
bWFudGhleUBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdl
cndhbGxAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
