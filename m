Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0DBB35D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 14:09:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCN6U-0000xt-Uq; Mon, 23 Sep 2019 12:06:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCN6T-0000xm-5W
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 12:06:05 +0000
X-Inumbo-ID: 8305ab9e-ddfa-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8305ab9e-ddfa-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 12:06:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E018EB76A;
 Mon, 23 Sep 2019 12:06:00 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
 <20190920160250.GA8065@mail-itl>
 <7a954000-904d-57aa-2524-5d0c51a8d422@suse.com>
 <20190923104746.GD8065@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81326ccd-c27d-d97c-2a20-b39c1f42f5f0@suse.com>
Date: Mon, 23 Sep 2019 14:05:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923104746.GD8065@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxMjo0NywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAwOTo1ODoyN0FNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMjAuMDkuMjAxOSAxODowMiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IEFueXdheSwgaWYgeW91IGFsbCBhZ3JlZSB0aGF0IHBjaWJhY2sgc2hvdWxk
IGJlIHRoZSB3YXkgdG8gZ28sIEkgY2FuIGdvCj4+PiB0aGF0IHJvdXRlIHRvby4gSW4gcHJhY3Rp
Y2UsIGl0IHdvdWxkIGJlIGEgZmxhZyAoc2V0IGJ5IHRoZSB0b29sc3RhY2s/KQo+Pj4gYWxsb3dp
bmcgd3JpdGVzIHRvIGFwcHJvcHJpYXRlIGNvbmZpZyBzcGFjZSByZWdpc3RlcnMgZGlyZWN0bHkg
KHdpdGgKPj4+IGFwcHJvcHJpYXRlIGNoZWNrcywgYXMgaW4gdGhpcyBwYXRjaCkuCj4+Cj4+IEkn
bSBhZnJhaWQgSSBkb24ndCBhZ3JlZTogSG93IHdvdWxkIGFsbG93aW5nIHdyaXRlcyB0byBtb3Jl
IGNvbmZpZyBzcGFjZQo+PiByZWdpc3RlcnMgYnkgYSBzdHViZG9tIGJlIHNhZmU/Cj4gCj4gRXhh
Y3RseSB0aGUgc2FtZSBhcyBpbiB0aGlzIHBhdGNoOiBwY2liYWNrIHdvdWxkIHBlcmZvcm0gdGhl
IHNhbWUKPiB2YWxpZGF0aW9uIChwcm9oaWJpdCBlbmFibGluZyBNU0kgdG9nZXRoZXIgd2l0aCBJ
TlR4IGV0YykuCj4gCj4gQlRXIHdoYXQgYXJlIHRoZSByaXNrcyAoYmVzaWRlcyBEb1MpIG9mIGFs
bG93aW5nIGZ1bGwgY29uZmlnIHNwYWNlCj4gYWNjZXNzLCBhc3N1bWluZyBWVC1kIHdpdGggaW50
ZXJydXB0IHJlbWFwcGluZyBwcmVzZW50PyBUaGlzIHNvdW5kcwo+IHNpbWlsYXIgdG8gcmlza3Mg
b2YgbWFsaWNpb3VzIGRldmljZSBjb25uZWN0ZWQgdG8gc29tZSBkb21VLCByaWdodD8gQ2FuCj4g
c3VjaCBkZXZpY2UgKG9yIGEgZG9tYWluIGNvbnRyb2xsaW5nIHN1Y2ggZGV2aWNlKSBicmVhayBv
dXQgdG8gWGVuIG9yCj4gZG9tMD8gQ2FuIGl0IHN0ZWFsIGRhdGEgZnJvbSBvdGhlciBkb21haW5z
PwoKVGhlcmUgc2hvdWxkbid0IGJlLCBidXQgdGhpcyB3b3VsZCBuZWVkIHByb3ZpbmcuIFRoZSBk
aXJlY3Rpb24gb2YKcHJvb2YgdGhlbiBzaG91bGQgYmUgdGhlIG90aGVyIHdheSBhcm91bmQgKGFu
ZCBJIHJlYWxpemUgaXQgbWF5IGJlCltjbG9zZSB0b10gaW1wb3NzaWJsZSk6IFdpZGVuaW5nIHdo
YXQgZ3Vlc3RzIChpbmNsdWRpbmcgc3R1Ygpkb21haW5zKSBhcmUgYWxsb3dlZCB0byBkbyBzaG91
bGQgYmUgcHJvdmVuIHRvIGFkZCBubyBhZGRpdGlvbmFsCnJpc2tzLiBJdCBzaG91bGRuJ3QgYmUg
KGJ5IGV4YW1wbGUsIGFzIEkgaW1wbHkgZnJvbSB5b3VyIHF1ZXN0aW9uKQp0aGF0IGFuIGFjdHVh
bCBpc3N1ZSBuZWVkcyB0byBiZSBwb2ludGVkIG91dC4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
