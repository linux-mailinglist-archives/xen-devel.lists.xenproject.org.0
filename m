Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2510D6A1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:07:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagt9-0007a7-Md; Fri, 29 Nov 2019 14:04:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iagt7-0007a2-Ua
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:04:50 +0000
X-Inumbo-ID: 34fdce90-12b1-11ea-a3e7-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34fdce90-12b1-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575036290; x=1606572290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hnR3M7E+909JGrfQVXwj1FnHhUt/JW3tsrH+A8SjwCM=;
 b=kR627sFL2dpLx932VCdkvfu71WpemRby9biky4BnELi6mpUK2s2bK47C
 Sdsg7htU/qOc8nmxN0QBzkQchCXEI+RSeZ00sEKep/QL8CeLtZeygQ63t
 pcsDWhKoftApDdaSx0bY6t9eGfDmbxo7zLFNMEGFafhXPEpXWotjyRy3E s=;
IronPort-SDR: CVAgDCayQBqzClLnnJ5WuExRFi9Gtwvd4AD5Y3KbT/z350P/1V680IAynbr0Y3OeT/T8vbgwSq
 6TCSpTJz81mA==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="6299142"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 29 Nov 2019 14:04:47 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3627AA29D5; Fri, 29 Nov 2019 14:04:46 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 14:04:45 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 14:04:45 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 14:04:44 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [PATCH-for-4.13 v5] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpgw4W1UbyWJxu02lwfLbqnwkDKeiGdeAgAAAcrCAABH7AIAAArVQ
Date: Fri, 29 Nov 2019 14:04:44 +0000
Message-ID: <208c4cb51f724cfaaf5f3fa05a4c8743@EX13D32EUC003.ant.amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124607.GD1155@perard.uk.xensource.com>
 <b6aa51e207aa44eca1acb027e5765d24@EX13D32EUC003.ant.amazon.com>
 <20191129135204.GE1155@perard.uk.xensource.com>
In-Reply-To: <20191129135204.GE1155@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTM6NTIKPiBU
bzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBHZW9yZ2UgRHVubGFwCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT47IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgV2VpCj4gTGl1
IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47
IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuCj4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsKPiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kKPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT47IFZvbG9keW15ciBC
YWJjaHVrCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSC1mb3ItNC4xMyB2NV0g
UmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQKPiBtYXhfbWFwdHJhY2tfZnJhbWVzIGhh
bmRsaW5nCj4gCj4gT24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTI6NTE6NDdQTSArMDAwMCwgRHVy
cmFudCwgUGF1bCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4g
RnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiA+IFNl
bnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTI6NDYKPiA+ID4gSSdtIG5vdCBzdXJlIHdoYXQgd2FzIHRo
ZSBpbnRlbnRpb24gd2l0aCB0aGUgbmV3IGZ1bmN0aW9uCj4gPiA+IHhsdV9jZmdfZ2V0X2JvdW5k
ZWRfbG9uZygpLCBidXQgSSBkb24ndCB0aGluayBsaWJ4bHUgaXMgdGhlIHJpZ2h0Cj4gcGxhY2UK
PiA+ID4gZm9yIGl0LiBUaGF0IGZ1bmN0aW9uIGlzIG9ubHkgZ29pbmcgdG8gbWFrZSBpdCBoYXJk
ZXIgZm9yIHVzZXJzIHRvCj4gZmluZAo+ID4gPiBtaXN0YWtlcyBpbiB0aGUgY29uZmlnIGZpbGUu
IElmIGBuJyB2YWx1ZSBpcyBvdXQgb2YgYm91bmQsIGl0IHdpbGwKPiBvbmx5Cj4gPiA+IGdldCBp
Z25vcmVkLCBhbmQgeGwgd2lsbCBrZWVwIGdvaW5nLiBJIHRoaW5rIHhsdV9jZmcgc2hvdWxkIG9u
bHkgYmUgYQo+ID4gPiBwYXJzZXIgKGFuZCBjYW4gY2hlY2sgZm9yIHN5bnRheCBlcnJvcikuCj4g
PiA+Cj4gPiA+IENhbiB5b3UgbW92ZSB0aGF0IGZ1bmN0aW9uIHRvIHhsPwo+ID4gPgo+ID4KPiA+
IEkgY2FuLCBidXQgd2h5IGlzIHRoaXMgbm90IGNvbnNpZGVyZWQgdXNlZnVsIGluIGxpYnhsPyBU
aGUgY2FsbCByZXR1cm5zCj4gZmFpbHVyZSBmb3IgYW4gb3V0LW9mLWJvdW5kcyBjaGVjay4KPiAK
PiBTb3JyeSB0aGF0IHRoZSByZXBvIGxheW91dCBpcyBjb25mdXNpbmcsIGJ1dCBsaWJ4bCAhPSBs
aWJ4bHUuIGxpYnhsCj4gZG9lc24ndCBldmVuIHVzZSBsaWJ4bHUhCgpPaCwgdGhhdCBpcyBjb25m
dXNpbmcuLi4gdGhlcmUgaXMgY29kZSB1bmRlciB0b29scy9saWJ4bCB0aGF0IGlzIG5vdCB1c2Ug
YnkgbGlieGw7IHRvdGFsbHkgc2FuZSwgb2YgY291cnNlLgoKPiAKPiA+IElmIHhsIGN1cnJlbnRs
eSBjaG9vc2VzIHRvIHRyZWF0IEVJTlZBTCBhcyBFTk9FTlQgdGhlbiB0aGF0J3MgeGwncyBidWcK
PiB0byBkZWFsIHdpdGguCj4gCj4gVGhlIGdlbmVyYWwgdXNlIG9mIHhsdV9jZmdfZ2V0XyooKSB0
aGF0IHRyZWF0cyBhbGwgZXJyb3JzIGFzIEVOT0VOVCBpbgo+IHhsIGlzIGFuIGlzc3VlLCBJIHRo
aW5rLCBidXQgdGhpcyBwYXRjaCBkb2VzIHRoZSBzYW1lIHRoaW5nIGFuZCB0cmVhdAo+IEVJTlZB
TCBhcyBFTk9FTlQgd2hlbiB1c2luZyB0aGUgbmV3bHkgaW50cm9kdWNlZAo+IHhsdV9jZmdfZ2V0
X2JvdW5kZWRfbG9uZygpIGZ1bmN0aW9uLiBJIGRvbid0IHRoaW5rIHRoYXQgYW4geGwgYnVnIHRv
Cj4gZGVhbCB3aXRoLCBidXQgYW4gaXNzdWUgd2l0aCB0aGUgcGF0Y2guCj4gCgpUcnVlLCBidXQg
SSBkb24ndCB0aGluayB0aGF0IG1ha2VzIHRoaW5ncyBzdHJpY3RseSB3b3JzZS4gSSdsbCBzZW5k
IHY2IHdpdGggZXh0cmEgY2hlY2tzIHRob3VnaC4KCiAgUGF1bAoKPiBDaGVlcnMsCj4gCj4gLS0K
PiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
