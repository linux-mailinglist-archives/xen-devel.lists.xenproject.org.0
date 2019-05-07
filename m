Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B471162A8
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 13:17:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNy3j-00012e-9c; Tue, 07 May 2019 11:14:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFk4=TH=amazon.com=prvs=023fb95da=elnikety@srs-us1.protection.inumbo.net>)
 id 1hNy3h-00012Z-5a
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 11:14:53 +0000
X-Inumbo-ID: 554f3c94-70b9-11e9-843c-bc764e045a96
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 554f3c94-70b9-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557227691; x=1588763691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jXXop0PiAapm01vCgdRYWrjI9gJfZGVYQOSKODuoMYk=;
 b=rmW/q/QwMcYcfN2eEeNFyZYvuOlAxY16zOjzRYOZMjjnuorVUf2UWiBA
 kAKmBH5En0+/5V8RREX9OjmetR2QuP61PW/9BlGIDw1arXxsEvROMY4fs
 HgbGWE2SvPJxkEo9DxnKORatYTiSThitwzErhHsk2Lag7psuM81l/YO8c Y=;
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="401125896"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 11:14:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x47BEijO122794
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 May 2019 11:14:48 GMT
Received: from EX13D03EUA001.ant.amazon.com (10.43.165.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 11:14:47 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D03EUA001.ant.amazon.com (10.43.165.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 11:14:47 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Tue, 7 May 2019 11:14:47 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH] mm: option to _always_ scrub freed domheap
 pages
Thread-Index: AQHVBAm5eudGNL+MTEaorwDeI6p5G6ZfbgeAgAACRQCAAACfAIAAEyYA
Date: Tue, 7 May 2019 11:14:46 +0000
Message-ID: <5EDA6565-E2D9-4DA1-8504-B6A962733CE5@amazon.com>
References: <20190506124624.54454-1-elnikety@amazon.com>
 <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
 <5CD1580E020000780022C6D8@prv1-mh.provo.novell.com>
 <5CD15894020000780022C6EE@prv1-mh.provo.novell.com>
In-Reply-To: <5CD15894020000780022C6EE@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.155]
Content-ID: <E26165323B4AE24AB45896F839C26F65@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] mm: option to _always_ scrub freed domheap
 pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gNy4gTWF5IDIwMTksIGF0IDEyOjA2LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+IAo+Pj4+IE9uIDA3LjA1LjE5IGF0IDEyOjAzLCA8SkJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Pj4+PiBPbiAwNy4wNS4xOSBhdCAxMTo1NSwgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiA1LzYvMTkgMTo0NiBQTSwgRXNsYW0gRWxuaWtldHkgd3Jv
dGU6Cj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+PiArKysgYi94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYwo+Pj4+IEBAIC0yMTQsNiArMjE0LDEyIEBAIGN1c3RvbV9wYXJhbSgi
Ym9vdHNjcnViIiwgcGFyc2VfYm9vdHNjcnViX3BhcmFtKTsKPj4+PiBzdGF0aWMgdW5zaWduZWQg
bG9uZyBfX2luaXRkYXRhIG9wdF9ib290c2NydWJfY2h1bmsgPSBNQigxMjgpOwo+Pj4+IHNpemVf
cGFyYW0oImJvb3RzY3J1Yl9jaHVuayIsIG9wdF9ib290c2NydWJfY2h1bmspOwo+Pj4+IAo+Pj4+
ICsvKgo+Pj4+ICsgKiBzY3J1Yl9kb21oZWFwIC0+IERvbWhlYXAgcGFnZXMgYXJlIHNjcnViYmVk
IHdoZW4gZnJlZWQKPj4+PiArICovCj4+Pj4gK3N0YXRpYyBib29sX3Qgb3B0X3NjcnViX2RvbWhl
YXAgPSAwOwo+Pj4+ICtib29sZWFuX3BhcmFtKCJzY3J1Yl9kb21oZWFwIiwgb3B0X3NjcnViX2Rv
bWhlYXApOwo+Pj4gCj4+PiBJJ20gc3VyZSBKYW4gd2lsbCByZXF1ZXN0IHRoaXMgdG8gYmUgJ3Nj
cnViLWRvbWhlYXAnIGluc3RlYWQgKG5vdCB1c2luZwo+Pj4gJ18nIHdoZW4geW91IGNhbiB1c2Ug
Jy0nKS4KPj4gCj4+IEluZGVlZCwgcGx1cyB1c2UgImJvb2wiLCBkcm9wIHRoZSBwb2ludGxlc3Mg
aW5pdGlhbGl6ZXIsIGFuZCBjb3JyZWN0Cj4+IHRoZSBzdHlsZSBvZiB0aGUgKHNpbmdsZSBsaW5l
KSBjb21tZW50Lgo+IAo+IEFuZCB1c2UgX19yZWFkX21vc3RseS4KPiAKPiBKYW4KPiAKPiAKClRo
YW5rcyBmb3IgYWxsIHRoZSBjb21tZW50cyBvbiB0aGlzIHRocmVhZC4gdjIgc2hvdWxkIHRha2Ug
Y2FyZSBvZiBhbGwgdGhvc2UgY29tbWVudHMuCgpDaGVlcnMsCkVzbGFtCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
