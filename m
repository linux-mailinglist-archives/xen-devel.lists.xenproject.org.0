Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7710AE92
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:17:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvGV-0001c9-2Q; Wed, 27 Nov 2019 11:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZvGS-0001c2-Sq
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:13:44 +0000
X-Inumbo-ID: f999f55a-1106-11ea-83b8-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f999f55a-1106-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574853225; x=1606389225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ErqIHUoUUYMi1NsOy5ccf/mCikXP3/AFdE/ZOFWTeVE=;
 b=VrrAmBRU5aM1vTg7X6lqgfS643+ZD5s8rl7kjMqFl9oVpRi+BSdAwZhY
 eWu/ckXBnHB48G8ZTYMqAvxkiiC/QlWsvm9mUEWdg3GSfx4HDEchFnUyb
 Oeg/pSJypLaa5VpIbJs2vshhpadAXEhRuR2JeWr2Tggzdhy/CZGwyLf1/ 4=;
IronPort-SDR: ahTL7S5o+ooxOJ/Pw06DyXzw6ROHLPbX1zsXvGJhbV0dgqdAFI3KFry5rYHVKsDo6GPzzgG2oO
 XAezz36hlU3g==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; 
   d="scan'208";a="6571632"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Nov 2019 11:13:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 52B30A2304; Wed, 27 Nov 2019 11:13:39 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 11:13:38 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 11:13:37 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 11:13:37 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
Thread-Index: AQHVpH29Wt0+ySss8US4fj89FHkMnqedtvYAgAD8w4CAACm7AIAAALPw
Date: Wed, 27 Nov 2019 11:13:37 +0000
Message-ID: <19cdd60b0df341d38f94fa6433ef568c@EX13D32EUC003.ant.amazon.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <24029.25218.75565.126333@mariner.uk.xensource.com>
 <c95b8096d1054d88bce16310aafe978a@EX13D32EUC003.ant.amazon.com>
 <24030.22924.67150.575753@mariner.uk.xensource.com>
In-Reply-To: <24030.22924.67150.575753@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Hans van Kranenburg <hans@knorrie.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMTkgMTE6MTAKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogSWFuIEphY2tzb24gPElhbi5K
YWNrc29uQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4
LmNvbT47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8KPiBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz47IFdlaQo+IExpdSA8d2xAeGVuLm9yZz47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsg
QW5kcmV3IENvb3Blcgo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgS29ucmFkIFJ6ZXN6
dXRlayBXaWxrCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kKPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT47IEhhbnMgdmFuIEty
YW5lbmJ1cmcgPGhhbnNAa25vcnJpZS5vcmc+Owo+IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IFN1YmplY3Q6IFJFOiBbWGVu
LWRldmVsXSBbUEFUQ0ggZm9yLTQuMTMgMi8yXSBSYXRpb25hbGl6ZSBtYXhfZ3JhbnRfZnJhbWVz
Cj4gYW5kIG1heF9tYXB0cmFja19mcmFtZXMgaGFuZGxpbmcKPiAKPiBEdXJyYW50LCBQYXVsIHdy
aXRlcyAoIlJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLTQuMTMgMi8yXSBSYXRpb25hbGl6ZQo+
IG1heF9ncmFudF9mcmFtZXMgYW5kIG1heF9tYXB0cmFja19mcmFtZXMgaGFuZGxpbmciKToKPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mCj4gSWFuCj4g
PiA+IEphY2tzb24KPiA+ID4gSSBoYXZlIHNlZW4gcmVwb3J0cyBvZiB1c2VycyB3aG8gcmFuIG91
dCBvZiBncmFudC9tYXB0cmFjayBmcmFtZXMKPiA+ID4gYmVjYXVzZSBvZiB1cGRhdGVzIHRvIHVz
ZSBtdWx0aXJpbmcgcHJvdG9jb2xzIGV0Yy4gIFRoZSBlcnJvciBtZXNzYWdlcwo+ID4gPiBhcmUg
bm90IHZlcnkgZ29vZCBhbmQgdGhlIHJlY29tbWVuZGVkIHdvcmthcm91bmQgaGFzIGJlZW4gdG8g
aW5jcmVhc2UKPiA+ID4gdGhlIGRlZmF1bHQgbGltaXQgb24gdGhlIGh5cGVydmlzb3IgY29tbWFu
ZCBsaW5lLgo+ID4gPgo+ID4gPiBJdCBpcyBpbXBvcnRhbnQgdGhhdCB3ZSBkb24ndCBicmVhayB0
aGF0IHdvcmthcm91bmQhCj4gPgo+ID4gQWxhcyBpdCBoYXMgYXBwYXJlbnRseSBiZWVuIGJyb2tl
biBmb3Igc2V2ZXJhbCByZWxlYXNlcyBub3cgOi0oCj4gCj4gSSBndWVzcyBhdCBsZWFzdCBpbiBE
ZWJpYW4gKHdoZXJlIEkgaGF2ZSBzZWVuIHRoaXMpIHdlIGhhdmVuJ3QKPiByZWxlYXNlZCB3aXRo
IGFueSBhZmZlY3RlZCB2ZXJzaW9ucyB5ZXQuLi4KCkkgYmVsaWV2ZSB0aGUgcHJvYmxlbSB3YXMg
aW50cm9kdWNlIGluIDQuMTAsIHNvIEkgdGhpbmsgaXQgd291bGQgYmUgcHJ1ZGVudCB0byBhbHNv
IGJhY2stcG9ydCB0aGUgZmluYWwgZml4IHRvIHN0YWJsZSB0cmVlcyBmcm9tIHRoZW4gb24uCgog
IFBhdWwKCj4gCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
