Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FA8D42C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 15:04:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxsvE-0004Y3-03; Wed, 14 Aug 2019 13:02:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=99LO=WK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxsvC-0004Xx-UH
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 13:02:34 +0000
X-Inumbo-ID: c80b9d92-be93-11e9-a175-cb3b7dac70cf
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c80b9d92-be93-11e9-a175-cb3b7dac70cf;
 Wed, 14 Aug 2019 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565787754;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wQOhh5yB1ROqJ6TPFN1j/0jhzg/VLy5NxIX6tlkwAOY=;
 b=OIcJK0/swjs6fm7C7vTCYx0tahLyyEsWIQva9VHKJePjrK8URY8x7RXp
 YtJaoYpA0WFMQo2G2BbyhUV8S93dGa4WLAHOZOhP2qwDo3hdiEK6lzr1y
 zdjV0ayG/vAJ1Jcl+LlZfQOzPOSkVtrkTnB2jtZRowzZSeNjWrcEcPKx+ s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KdVlIJfcqjfOMS3Osz5ljmlD+r+JM0Z4wsQbwh26ADrPxJwdKM4J5W5qTjWnH6cS/75jvhmeNe
 RKoNX7tQ5j2ULkG6yLVemn0NnoIJRJcfKSmrHVOYZifjrUxACmSJSkvHLBveuRXMoHQhg2RwZ6
 Nwmlnx3RPHrvUAd4/PpxJr6YlLYeQVKXIaBbgL594mja4FNYAk0wjg9i9TxXfTHwDSgZB/aZDO
 U3maATBSQIWj6ce1+C5mLL5+dO3kilp9mjNHlCaqh7Sijspe3MTWgdnF29lNpq549HokcKnXrc
 tGE=
X-SBRS: 2.7
X-MesageID: 4252374
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,385,1559534400"; 
   d="scan'208";a="4252374"
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
 <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
 <83a583e2-f4f2-8519-ce58-b200987dcab5@citrix.com>
 <057d72ef-bbec-0e91-b79b-3ebe6da35ba9@suse.com>
 <d2ff9dcf-233b-ac02-1034-310f97e2c215@citrix.com>
 <9e248c4b-4c7d-6450-b5fe-f6d40379ebab@suse.com>
 <67f94dcf-98e8-cea0-b24d-8ca0ee76f0b3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fc77dd42-f8c6-a8f2-2389-3e7e4e75edeb@citrix.com>
Date: Wed, 14 Aug 2019 14:02:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <67f94dcf-98e8-cea0-b24d-8ca0ee76f0b3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 RzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDgvMjAxOSAxMzo1MSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA4LzcvMTkgNTow
MyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoYXRldmVyIHdlIGRvIGluIFhlbiwgaXQnbGwg
b25seSBhbGxvdyB0byB3b3JrIGFyb3VuZCB0aGF0IGlzc3VlLgo+PiBBbiBhY3R1YWwgZml4IGJl
bG9uZ3MgaW4gdGhlIGtlcm5lbChzKS4gRm9yIHRoaXMgcmVhc29uIEkgc3VwcG9zZQo+PiB3aGF0
IHdlJ3JlIHRhbGtpbmcgYWJvdXQgaGVyZSBpcyBhIGZlYXR1cmUgKGZyb20gWGVuJ3MgcG92KSwg
bm90IGEKPj4gYnVnIGZpeC4gQW5kIGl0IGJlaW5nIGEgZmVhdHVyZSwgaXQgc2hvdWxkIHByZWZl
cmFibHkgYmUgY29kZWQgaW4KPj4gYSB3YXkgdGhhdCdzIHVzYWJsZSBhbHNvIGdvaW5nIGZvcndh
cmQuCj4gRldJVywgSSBhZ3JlZSB3aXRoIHdoYXQgSSB1bmRlcnN0YW5kIEphbiB0byBiZSBzYXlp
bmc6Cj4KPiAxLiBJdCB3b3VsZCBiZSBnb29kIHRvIGJlIGFibGUgdG8gZGlzYWJsZSBGSUZPIGV2
ZW50IGNoYW5uZWxzLCBidXQKPgo+IDIuIERpc2FibGluZyB0aGVtIGluIFhlbiBpc24ndCByZWFs
bHkgdGhlIHJpZ2h0IHdheSB0byBmaXggQW1hem9uJ3MKPiBpc3N1ZS4gUmF0aGVyLCBwcm9iYWJs
eSB0aGUgc29mdCByZWJvb3Qgc2hvdWxkIHJlc2V0IHRoZSBldmVudCBjaGFubmVsCj4gc3RhdGUu
CgpEZXBlbmRzIHdoYXQgeW91IG1lYW4gYWJvdXQgImZpeCB0aGUgaXNzdWUiLgoKQW1hem9uIGhh
dmUgcmVhbCBjdXN0b21lciBWTXMgaW4gdGhpcyBzaXR1YXRpb24gd2hpY2ggd2lsbCBicmVhayBv
biBhClhlbiBvbGQgPT4gbmV3IHVwZ3JhZGUuwqAgTW9kaWZ5aW5nIFhlbiBpcyB0aGUgb25seSBy
YXRpb25hbCBvcHRpb24uCgpUaGV5IGFyZSBhbHNvIGRvaW5nIHRoaXMgaW4gYW4gdXBzdHJlYW0g
Y29tcGF0aWJsZSBtYW5uZXIgKHdoaWNoIGlzCmdyZWF0KS7CoCBPbmUgd2F5IG9yIGFub3RoZXIs
IFhlbiBuZWVkcyB0byBnYWluIHRoaXMgYWJpbGl0eSB0byB3b3JrCmFyb3VuZCBicm9rZW4tbGlu
dXggd2hpY2ggaXMgYWxyZWFkeSBpbiB0aGUgZmllbGQuCgpBcyBmb3IgdGhlIGlkZWFsIHdheSB0
byBmaXggdGhpcywgdGhpcyBidWcgaGFzIGV4aXN0ZWQgaW4gTGludXggbG9uZ2VyCnRoYW4gc29m
dC1yZXNldCBoYXMgYmVlbiBhIHRoaW5nLCBhbmQgZnJhbmtseSwgaXRzIHN0aWxsIGEgZ3J1ZXNv
bWUKaGFjay7CoCBXZSBuZWVkIHNvbWUgaW50ZXJmYWNlcyB3aGljaCBkb24ndCBzdWNrIHNvIHRl
cnJpYmx5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
