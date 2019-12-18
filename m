Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8F124755
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:54:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYnO-0001UX-4G; Wed, 18 Dec 2019 12:51:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+WGn=2I=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1ihYnM-0001Tj-GR
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:51:16 +0000
X-Inumbo-ID: 0dc802c6-2195-11ea-88e7-bc764e2007e4
Received: from smtp14.mail.ru (unknown [94.100.181.95])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dc802c6-2195-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=jsLL1zPvjj1zABMzlKN1Pm6xXWkM+cNCrUAQS//OsYI=; 
 b=gLBXizsadpMvywp5Vm59B2V01JEsz6Owzcqs51L0zW+s3/cbDXK6g5d9bzBIJUeeFxEpAxEIubdFn+dD+UXyB582bQne5Plpk95udzzL5+80TARQd+We6Y1eDE8AfDT0aQPHPojlajEc9nvOxCzZDy7ctFB86P9vHwMxW9ZD0XM=;
Received: by smtp14.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1ihYnA-0000Ca-GS; Wed, 18 Dec 2019 15:51:05 +0300
To: Jan Beulich <jbeulich@suse.com>
References: <e6853b44-681a-7423-ede0-43b551b554af@list.ru>
 <2c0d1771-8c9e-d76e-30bb-5ba809568000@suse.com>
From: Sergey Kovalev <valor@list.ru>
Message-ID: <3021b167-a9cb-aae0-ad08-d6b46ec243aa@list.ru>
Date: Wed, 18 Dec 2019 15:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <2c0d1771-8c9e-d76e-30bb-5ba809568000@suse.com>
Content-Language: en-US
Authentication-Results: smtp14.mail.ru; auth=pass smtp.auth=valor@list.ru
 smtp.mailfrom=valor@list.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 0A44E481635329DB0E1AA8A03B3923177A2A728850F00CFA73C14FAFA54B165C2904AE1C84A81A4DF688BCB05C26794D8274BACA21B552384BF99D2629214AA09949519FF658C89AF0FEA5C0AD2628AB
X-7FA49CB5: 0D63561A33F958A5FACFD8417C6AB7FAC8C7085425E6261606ED5E4F160CAA058941B15DA834481FA18204E546F3947C062BEEFFB5F8EA3EF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B8C7ADC89C2F0B2A5A471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249D9CEF1C421DA94AF76E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8BA0BAE060704C561B3AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C3C74813BC7F81EC84812CECFF82555E692629B07FD02F83A6C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2AF38021CC9F462D574AF45C6390F7469DAA53EE0834AAEE
X-Mailru-Sender: 9422C5FC7C00AE6974C3817D9F8DFD62CD4CA554815BBB723E35B40C35505DC96FA35EADE8FD784D625E4CECE70E6D50FB559BB5D741EB968B87F919F3BCAAF1715EC054F9A9AD9C0DA7A0AF5A3A8387
X-Mras: OK
Subject: Re: [Xen-devel] [XEN PATCH v3] x86/vm_event: add short-circuit for
 breakpoints (aka, , "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxNTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMTIuMjAxOSAx
MzoxOSwgU2VyZ2V5IEtvdmFsZXYgd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni92bV9ldmVu
dC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4+IEBAIC02MSw3ICs2MSw4IEBA
IHZvaWQgdm1fZXZlbnRfY2xlYW51cF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCkKPj4gIHZvaWQg
dm1fZXZlbnRfdG9nZ2xlX3NpbmdsZXN0ZXAoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUg
KnYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtX2V2ZW50X3Jlc3BvbnNl
X3QgKnJzcCkKPj4gIHsKPj4gLSAgICBpZiAoICEocnNwLT5mbGFncyAmIFZNX0VWRU5UX0ZMQUdf
VE9HR0xFX1NJTkdMRVNURVApICkKPj4gKyAgICBpZiAoICEocnNwLT5mbGFncyAmIFZNX0VWRU5U
X0ZMQUdfVE9HR0xFX1NJTkdMRVNURVAgfHwKPj4gKyAgICAgICAgICAgcnNwLT5mbGFncyAmIFZN
X0VWRU5UX0ZMQUdfRkFTVF9TSU5HTEVTVEVQKSApCj4+ICAgICAgICAgIHJldHVybjsKPiAKPiBU
aGlzIGlzIHN0aWxsIHRoZSBzYW1lIGFzIGluIHYyIChjb3VsZCBiZSB0YWtlbiBjYXJlIG9mIHdo
aWxlCj4gY29tbWl0dGluZyBpZiBubyBvdGhlciBuZWVkIGZvciBhIHY0IGFyaXNlcykuClNvcnJ5
IGZvciB0aGF0LiBJIGRpZG4ndCBzdGFnZSBpdC4uLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
