Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C05FBE1A0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Vw-0000d7-6x; Wed, 25 Sep 2019 15:47:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMb9=XU=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iD9Vu-0000d2-M7
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:47:34 +0000
X-Inumbo-ID: c997862e-dfab-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id c997862e-dfab-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569426453;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7OKWpa6W6SyZlcF5ZJ+18acfCnugDySc3JGJkQPu3H8=;
 b=Etjf/s7FQr0O6Gv+6fhZf7+S9WXJSQeXrt76acB7C1kfksuaKbV80wJP
 Ba4sHMUokXRj1UUqC4gVEpVCh5SH+nZ+gDeWMziAPii10YBN8ATD0TUCl
 TfAHHYNU7XKl5VXWLonBsj4Osg7pR/uQ2XtqCxN8tgvPQw0Jg+s4ARSnN M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g2hsYmJ9x4miRRfkuw/J46PjiLAzN1Ul2BZh0YfSxfJ7u6qWpLeT6bqn5I68hkOav5Ook47bYR
 GAejFs/rrt2YJQ+sAdkDp1QmzMC7F+P7kFOGbz6pQxmjWHs/r0eHv0s/pKOitCbfrGyLwiFqQf
 RmMTVPPx7KYHMKUwLFfD+H+SikkllPWEUBVQphts9gSHtSSKi3+94LsN2sMngoXWHJ5R4mJR2K
 bAS0rpzOpxLyWPGxWQqn9BrzGVDm0GuCBV1y2nfaQdHxc8yseoNGkmoF7BEmjw+aGm1wqtu1sy
 +W4=
X-SBRS: 2.7
X-MesageID: 6124706
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6124706"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-12-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <46157bf7-42ae-20be-e3c3-f1c09629d4e7@citrix.com>
Date: Wed, 25 Sep 2019 16:47:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-12-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 11/12] livepatch: Add metadata runtime
 retrieval mechanism
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gRXh0ZW5k
IHRoZSBsaXZlcGF0Y2ggbGlzdCBvcGVyYXRpb24gdG8gZmV0Y2ggYWxzbyBwYXlsb2FkcycgbWV0
YWRhdGEuCj4gVGhpcyBpcyBhY2hpZXZlZCBieSBleHRlbmRpbmcgdGhlIHN5c2N0bCBsaXN0IGlu
dGVyZmFjZSB3aXRoIDIgZXh0cmEKPiBndWVzdCBoYW5kbGVzOgo+ICogbWV0YWRhdGEgICAgIC0g
YW4gYXJyYXkgb2YgYXJiaXRyYXJ5IHNpemUgc3RyaW5ncwo+ICogbWV0YWRhdGFfbGVuIC0gYW4g
YXJyYXkgb2YgbWV0YWRhdGEgc3RyaW5ncycgbGVuZ3RocyAodWluMzJfdCBlYWNoKQoKdWludDMy
X3QKCj4gCj4gUGF5bG9hZHMnIG1ldGFkYXRhIGlzIGEgc3RyaW5nIG9mIGFyYml0cmFyeSBzaXpl
IGFuZCBkb2VzIG5vdCBoYXZlIGFuCj4gdXBwZXIgYm91bmQgbGltaXQuIEl0IG1heSBhbHNvIHZh
cnkgaW4gc2l6ZSBiZXR3ZWVuIHBheWxvYWRzLgo+IAo+IEluIG9yZGVyIHRvIGxldCB0aGUgdXNl
cmxhbmQgYWxsb2NhdGUgZW5vdWdoIHNwYWNlIGZvciB0aGUgaW5jb21pbmcKPiBkYXRhIGFkZCBh
IG1ldGFkYXRhIHRvdGFsIHNpemUgZmllbGQgdG8gdGhlIGxpc3Qgc3lzY3RsIG9wZXJhdGlvbiBh
bmQKPiBmaWxsIGl0IHdpdGggdG90YWwgc2l6ZSBvZiBhbGwgcGF5bG9hZHMnIG1ldGFkYXRhLgo+
IApzbmlwPiArICogYG1ldGFkYXRhYCAtIFZpcnR1YWwgYWRkcmVzcyBvZiB3aGVyZSB0byB3cml0
ZSB0aGUgbWV0YWRhdGEgb2YgCnRoZSBwYXlsb2Fkcy4KPiArICAgQ2FsbGVyICpNVVNUKiBhbGxv
Y2F0ZSBlbm91Z2ggc3BhY2UgdG8gYmUgYWJsZSB0byBzdG9yZSBhbGwgcmVjZWl2ZWQgZGF0YQo+
ICsgICAoaS5lLiB0b3RhbCBhbGxvY2F0ZWQgc3BhY2UgKk1VU1QqIG1hdGNoIHRoZSBgbWV0YWRh
dGFfdG90YWxfc2l6ZWAgdmFsdWUKPiArICAgcHJvdmlkZWQgYnkgdGhlIGh5cGVydmlzb3IpLiBJ
bmRpdmlkdWFsIHBheWxvYWQgbWV0YWRhdGEgc3RyaW5nIGNhbiBiZSBvZgo+ICsgICBhcmJpdHJh
cnkgbGVuZ3RoLiBUaGUgbWV0YWRhdGEgc3RyaW5nIGZvcm1hdCBpczoga2V5PXZhbHVlXDAuLi5r
ZXk9dmFsdWVcMC4KPiArICogYG1ldGFkYXRhX2xlbmAgLSBWaXJ0dWFsIGFkZHJlc3Mgb2Ygd2hl
cmUgdG8gd3JpdGUgdGhlIGxlbmd0aCBvZiBlYWNoIG1ldGFkYXRhCj4gKyAgIHN0cmluZyBvZiB0
aGUgcGF5bG9hZC4gQ2FsbGVyICpNVVNUKiBhbGxvY2F0ZSB1cCB0byBgbnJgIG9mIHRoZW0uIEVh
Y2ggKk1VU1QqCj4gKyAgIGJlIG9mIHNpemVvZih1aW50MzJfdCkgKDQgYnl0ZXMpLgo+ICAgCj4g
ICBJZiB0aGUgaHlwZXJjYWxsIHJldHVybnMgYW4gcG9zaXRpdmUgbnVtYmVyLCBpdCBpcyB0aGUg
bnVtYmVyICh1cHRvIGBucmAKPiAgIHByb3ZpZGVkIHRvIHRoZSBoeXBlcmNhbGwpIG9mIHRoZSBw
YXlsb2FkcyByZXR1cm5lZCwgYWxvbmcgd2l0aCBgbnJgIHVwZGF0ZWQKPiAgIHdpdGggdGhlIG51
bWJlciBvZiByZW1haW5pbmcgcGF5bG9hZHMsIGB2ZXJzaW9uYCB1cGRhdGVkIChpdCBtYXkgYmUg
dGhlIHNhbWUKPiAgIGFjcm9zcyBoeXBlcmNhbGxzIC0gaWYgaXQgdmFyaWVzIHRoZSBkYXRhIGlz
IHN0YWxlIGFuZCBmdXJ0aGVyIGNhbGxzIGNvdWxkCj4gLWZhaWwpIGFuZCB0aGUgYG5hbWVfdG90
YWxfc2l6ZWAgY29udGFpbmluZyB0b3RhbCBzaXplIG9mIHRyYW5zZmVyZWQgZGF0YSBmb3IKPiAt
dGhlIGFycmF5LiBUaGUgYHN0YXR1c2AsIGBuYW1lYCwgYW5kIGBsZW5gIGFyZSB1cGRhdGVkIGF0
IHRoZWlyIGRlc2lnbmVkIGluZGV4Cj4gLXZhbHVlIChgaWR4YCkgd2l0aCB0aGUgcmV0dXJuZWQg
dmFsdWUgb2YgZGF0YS4KPiArZmFpbCksIGBuYW1lX3RvdGFsX3NpemVgIGFuZCBgbWV0YWRhdGFf
dG90YWxfc2l6ZWAgY29udGFpbmluZyB0b3RhbCBzaXplcyBvZgo+ICt0cmFuc2ZlcmVkIGRhdGEg
Zm9yIGJvdGggdGhlIGFycmF5cy4KCnRyYW5zZmVycmVkCgo+ICtUaGUgYHN0YXR1c2AsIGBuYW1l
YCwgYGxlbmAsIGBtZXRhZGF0YWAgYW5kIGBtZXRhZGF0YV9sZW5gIGFyZSB1cGRhdGVkIGF0IHRo
ZWlyCj4gK2Rlc2lnbmVkIGluZGV4IHZhbHVlIChgaWR4YCkgd2l0aCB0aGUgcmV0dXJuZWQgdmFs
dWUgb2YgZGF0YS4KPiAgIAo+ICAgSWYgdGhlIGh5cGVyY2FsbCByZXR1cm5zIC1YRU5fRTJCSUcg
dGhlIGBucmAgaXMgdG9vIGJpZyBhbmQgc2hvdWxkIGJlCj4gICBsb3dlcmVkLgo+IEBAIC03ODAs
NiArNzkwLDcgQEAgVGhlIHN0cnVjdHVyZSBpcyBhcyBmb2xsb3c6Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVVQ6IEhvdyBtYW55IHBheWxv
YWRzIGxlZnQuICovCj4gICAgICAgICAgIHVpbnQzMl90IHBhZDsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBJTjogTXVzdCBiZSB6ZXJvLiAqLwo+ICAgICAgICAgICB1aW50NjRfdCBuYW1l
X3RvdGFsX3NpemU7ICAgICAgICAgICAgICAgLyogT1VUOiBUb3RhbCBzaXplIG9mIGFsbCB0cmFu
c2ZlciBuYW1lcyAqLwo+ICsgICAgICAgIHVpbnQ2NF90IG1ldGFkYXRhX3RvdGFsX3NpemU7ICAg
ICAgICAgICAvKiBPVVQ6IFRvdGFsIHNpemUgb2YgYWxsIHRyYW5zZmVyIG1ldGFkYXRhICovCj4g
ICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoeGVuX2xpdmVwYXRjaF9zdGF0dXNfdCkgc3Rh
dHVzOyAgLyogT1VULiBNdXN0IGhhdmUgZW5vdWdoCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGFjZSBhbGxvY2F0ZSBmb3IgbnIgb2YgdGhl
bS4gKi8KPiAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV82NChjaGFyKSBuYW1lOyAgICAgICAg
IC8qIE9VVDogQXJyYXkgb2YgbmFtZXMuIEVhY2ggbWVtYmVyCj4gQEAgLTc4OCw2ICs3OTksMTIg
QEAgVGhlIHN0cnVjdHVyZSBpcyBhcyBmb2xsb3c6Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuciBvZiB0aGVtLiAqLwo+ICAgICAgICAgICBY
RU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgbGVuOyAgICAgICAgLyogT1VUOiBBcnJheSBvZiBs
ZW5ndGhzIG9mIG5hbWUncy4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE11c3QgaGF2ZSBuciBvZiB0aGVtLiAqLwo+ICsgICAgICAgIFhFTl9H
VUVTVF9IQU5ETEVfNjQoY2hhcikgbWV0YWRhdGE7ICAgICAvKiBPVVQ6IEFycmF5IG9mIG1ldGFk
YXRhIHN0cmluZ3MuIEVhY2gKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbWVtYmVyIG1heSBoYXZlIGFuIGFyYml0cmFyeSBsZW5ndGguCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE11c3QgaGF2
ZSBuciBvZiB0aGVtLiAqLwo+ICsgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQodWludDMyKSBt
ZXRhZGF0YV9sZW47ICAvKiBPVVQ6IEFycmF5IG9mIGxlbmd0aHMgb2YgbWV0YWRhdGEncy4KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTXVz
dCBoYXZlIG5yIG9mIHRoZW0uICovCj4gKwo+ICAgICAgIH07Cj4gICAKc25pcAo+IEBAIC03NDQs
NiArNzUzLDggQEAgaW50IHhjX2xpdmVwYXRjaF9saXN0KHhjX2ludGVyZmFjZSAqeGNoLCBjb25z
dCB1bnNpZ25lZCBpbnQgbWF4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5f
bGl2ZXBhdGNoX3N0YXR1cyAqaW5mbywKPiAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpu
YW1lLCB1aW50MzJfdCAqbGVuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQ2
NF90IG5hbWVfdG90YWxfc2l6ZSwKPiArICAgICAgICAgICAgICAgICAgICAgIGNoYXIgKm1ldGFk
YXRhLCB1aW50MzJfdCAqbWV0YWRhdGFfbGVuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgdWludDY0X3QgbWV0YWRhdGFfdG90YWxfc2l6ZSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgKmRvbmUsIHVuc2lnbmVkIGludCAqbGVmdCkKPiAgIHsKPiAgICAgICBp
bnQgcmM7Cj4gQEAgLTc1MiwxMyArNzYzLDE2IEBAIGludCB4Y19saXZlcGF0Y2hfbGlzdCh4Y19p
bnRlcmZhY2UgKnhjaCwgY29uc3QgdW5zaWduZWQgaW50IG1heCwKPiAgICAgICBERUNMQVJFX0hZ
UEVSQ0FMTF9CT1VOQ0UoaW5mbywgMCwgWENfSFlQRVJDQUxMX0JVRkZFUl9CT1VOQ0VfT1VUKTsK
PiAgICAgICBERUNMQVJFX0hZUEVSQ0FMTF9CT1VOQ0UobmFtZSwgMCwgWENfSFlQRVJDQUxMX0JV
RkZFUl9CT1VOQ0VfT1VUKTsKPiAgICAgICBERUNMQVJFX0hZUEVSQ0FMTF9CT1VOQ0UobGVuLCAw
LCBYQ19IWVBFUkNBTExfQlVGRkVSX0JPVU5DRV9PVVQpOwo+ICsgICAgREVDTEFSRV9IWVBFUkNB
TExfQk9VTkNFKG1ldGFkYXRhLCAwLCBYQ19IWVBFUkNBTExfQlVGRkVSX0JPVU5DRV9PVVQpOwo+
ICsgICAgREVDTEFSRV9IWVBFUkNBTExfQk9VTkNFKG1ldGFkYXRhX2xlbiwgMCwgWENfSFlQRVJD
QUxMX0JVRkZFUl9CT1VOQ0VfT1VUKTsKPiAgICAgICB1aW50MzJfdCBtYXhfYmF0Y2hfc3osIG5y
Owo+ICAgICAgIHVpbnQzMl90IHZlcnNpb24gPSAwLCByZXRyaWVzID0gMDsKPiAgICAgICB1aW50
MzJfdCBhZGp1c3QgPSAwOwo+IC0gICAgb2ZmX3QgbmFtZV9vZmYgPSAwOwo+IC0gICAgdWludDY0
X3QgbmFtZV9zejsKPiArICAgIG9mZl90IG5hbWVfb2ZmID0gMCwgbWV0YWRhdGFfb2ZmID0gMDsK
PiArICAgIHVpbnQ2NF90IG5hbWVfc3osIG1ldGFkYXRhX3N6OwoKQXMgd2l0aCB0aGUgcHJldmlv
dXMgcGF0Y2gsIEkgdGhpbmsgdWludDMyX3Qgd291bGQgYmUgbW9yZSBhcHByb3ByaWF0ZSAKaGVy
ZSBhcyBJIGNhbid0IGltYWdpbmUgYSByZWFzb24gd2h5IHRoZSBtZXRhZGF0YSB3b3VsZCBleGNl
ZWQgNCBHaUI/CgpBbmQgdGhlIHNhbWUgc3VnZ2VzdGlvbiBhcyB3aXRoIHRoZSBwcmV2aW91cyBw
YXRjaCB0byB0aGVuIGNoYW5nZSBvZmZfdCAKKHByb2JhYmx5IHRvIHVpbnQzMl90KS4KCj4gICAK
PiAtICAgIGlmICggIW1heCB8fCAhaW5mbyB8fCAhbmFtZSB8fCAhbGVuIHx8ICFkb25lIHx8ICFs
ZWZ0ICkKPiArICAgIGlmICggIW1heCB8fCAhaW5mbyB8fCAhbmFtZSB8fCAhbGVuIHx8Cj4gKyAg
ICAgICAgICFtZXRhZGF0YSB8fCAhbWV0YWRhdGFfbGVuIHx8ICFkb25lIHx8ICFsZWZ0ICkKPiAg
ICAgICB7Cj4gICAgICAgICAgIGVycm5vID0gRUlOVkFMOwo+ICAgICAgICAgICByZXR1cm4gLTE7
CnNuaXAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIGIveGVuL2lu
Y2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gaW5kZXggNTAzYmU2ODA1OS4uNzc4Njg2NDkyNiAxMDA2
NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvc3lzY3RsLmgKPiBAQCAtOTIwLDE2ICs5MjAsMTcgQEAgc3RydWN0IHhlbl9zeXNj
dGxfbGl2ZXBhdGNoX2dldCB7Cj4gICB9Owo+ICAgCj4gICAvKgo+IC0gKiBSZXRyaWV2ZSBhbiBh
cnJheSBvZiBhYmJyZXZpYXRlZCBzdGF0dXMgYW5kIG5hbWVzIG9mIHBheWxvYWRzIHRoYXQgYXJl
Cj4gLSAqIGxvYWRlZCBpbiB0aGUgaHlwZXJ2aXNvci4KPiArICogUmV0cmlldmUgYW4gYXJyYXkg
b2YgYWJicmV2aWF0ZWQgc3RhdHVzLCBuYW1lcyBhbmQgbWV0YWRhdGEgb2YgcGF5bG9hZHMgdGhh
dAo+ICsgKiBhcmUgbG9hZGVkIGluIHRoZSBoeXBlcnZpc29yLgo+ICAgICoKPiAgICAqIElmIHRo
ZSBoeXBlcmNhbGwgcmV0dXJucyBhbiBwb3NpdGl2ZSBudW1iZXIsIGl0IGlzIHRoZSBudW1iZXIg
KHVwIHRvIGBucmApCj4gICAgKiBvZiB0aGUgcGF5bG9hZHMgcmV0dXJuZWQsIGFsb25nIHdpdGgg
YG5yYCB1cGRhdGVkIHdpdGggdGhlIG51bWJlciBvZiByZW1haW5pbmcKPiAgICAqIHBheWxvYWRz
LCBgdmVyc2lvbmAgdXBkYXRlZCAoaXQgbWF5IGJlIHRoZSBzYW1lIGFjcm9zcyBoeXBlcmNhbGxz
LiBJZiBpdCB2YXJpZXMKPiAtICogdGhlIGRhdGEgaXMgc3RhbGUgYW5kIGZ1cnRoZXIgY2FsbHMg
Y291bGQgZmFpbCkgYW5kIHRoZSBuYW1lX3RvdGFsX3NpemUKPiAtICogY29udGFpbmluZyB0b3Rh
bCBzaXplIG9mIHRyYW5zZmVyZWQgZGF0YSBmb3IgdGhlIGFycmF5Lgo+IC0gKiBUaGUgYHN0YXR1
c2AsIGBuYW1lYCwgYGxlbmAgYXJlIHVwZGF0ZWQgYXQgdGhlaXIgZGVzaWduZWQgaW5kZXggdmFs
dWUgKGBpZHhgKQo+IC0gKiB3aXRoIHRoZSByZXR1cm5lZCB2YWx1ZSBvZiBkYXRhLgo+ICsgKiB0
aGUgZGF0YSBpcyBzdGFsZSBhbmQgZnVydGhlciBjYWxscyBjb3VsZCBmYWlsKSwgYG5hbWVfdG90
YWxfc2l6ZWAgYW5kCj4gKyAqIGBtZXRhZGF0YV90b3RhbF9zaXplYCBjb250YWluaW5nIHRvdGFs
IHNpemVzIG9mIHRyYW5zZmVyZWQgZGF0YSBmb3IgYm90aCB0aGUKCnRyYW5zZmVycmVkCgo+ICsg
KiBhcnJheXMuCj4gKyAqIFRoZSBgc3RhdHVzYCwgYG5hbWVgLCBgbGVuYCwgYG1ldGFkYXRhYCBh
bmQgYG1ldGFkYXRhX2xlbmAgYXJlIHVwZGF0ZWQgYXQgdGhlaXIKPiArICogZGVzaWduZWQgaW5k
ZXggdmFsdWUgKGBpZHhgKSB3aXRoIHRoZSByZXR1cm5lZCB2YWx1ZSBvZiBkYXRhLgo+ICAgICoK
PiAgICAqIElmIHRoZSBoeXBlcmNhbGwgcmV0dXJucyBFMkJJRyB0aGUgYG5yYCBpcyB0b28gYmln
IGFuZCBzaG91bGQgYmUKPiAgICAqIGxvd2VyZWQuIFRoZSB1cHBlciBsaW1pdCBvZiBgbnJgIGlz
IGxlZnQgdG8gdGhlIGltcGxlbWVudGlvbi4KPiBAQCAtOTUzLDYgKzk1NCw3IEBAIHN0cnVjdCB4
ZW5fc3lzY3RsX2xpdmVwYXRjaF9saXN0IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgT1VUOiBIb3cgbWFueSBwYXlsb2FkcyBsZWZ0LiAqLwo+ICAg
ICAgIHVpbnQzMl90IHBhZDsgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBJTjogTXVzdCBi
ZSB6ZXJvLiAqLwo+ICAgICAgIHVpbnQ2NF90IG5hbWVfdG90YWxfc2l6ZTsgICAgICAgICAgICAg
ICAvKiBPVVQ6IFRvdGFsIHNpemUgb2YgYWxsIHRyYW5zZmVyIG5hbWVzICovCj4gKyAgICB1aW50
NjRfdCBtZXRhZGF0YV90b3RhbF9zaXplOyAgICAgICAgICAgLyogT1VUOiBUb3RhbCBzaXplIG9m
IGFsbCB0cmFuc2ZlciBtZXRhZGF0YSAqLwo+ICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoeGVu
X2xpdmVwYXRjaF9zdGF0dXNfdCkgc3RhdHVzOyAgLyogT1VULiBNdXN0IGhhdmUgZW5vdWdoCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwYWNlIGFs
bG9jYXRlIGZvciBuciBvZiB0aGVtLiAqLwo+ICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoY2hh
cikgbmFtZTsgICAgICAgICAvKiBPVVQ6IEFycmF5IG9mIG5hbWVzLiBFYWNoIG1lbWJlcgo+IEBA
IC05NjEsNiArOTYzLDExIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9saXN0IHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnIgb2YgdGhl
bS4gKi8KPiAgICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgbGVuOyAgICAgICAgLyog
T1VUOiBBcnJheSBvZiBsZW5ndGhzIG9mIG5hbWUncy4KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgTXVzdCBoYXZlIG5yIG9mIHRoZW0uICovCj4gKyAg
ICBYRU5fR1VFU1RfSEFORExFXzY0KGNoYXIpIG1ldGFkYXRhOyAgICAgLyogT1VUOiBBcnJheSBv
ZiBtZXRhZGF0YSBzdHJpbmdzLiBFYWNoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbWVtYmVyIG1heSBoYXZlIGFuIGFyYml0cmFyeSBsZW5ndGguCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTXVzdCBoYXZl
IG5yIG9mIHRoZW0uICovCj4gKyAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgbWV0YWRh
dGFfbGVuOyAgLyogT1VUOiBBcnJheSBvZiBsZW5ndGhzIG9mIG1ldGFkYXRhJ3MuCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTXVzdCBoYXZlIG5y
IG9mIHRoZW0uICovCj4gICB9Owo+ICAgCj4gICAvKgo+IAoKRG8geW91IHRoaW5rIGl0IHdvdWxk
IGJlIHVzZWZ1bCBmb3IgdGhlIG1ldGFkYXRhIHRvIGJlIGFuIG9wdGlvbmFsIE9VVCAKcGFyYW1l
dGVyPyBJIGNvdWxkIGltYWdpbmUgYSBjYWxsZXIgd2FudGluZyB0byBnZXQgYSBsaXN0IG9mIGxp
dmUgCnBhdGNoZXMgd2l0aG91dCBuZWVkaW5nL3dhbnRpbmcgdG8gZ2V0IGFsbCB0aGUgbWV0YWRh
dGEgYXMgd2VsbC4KClNlY29uZGx5LCB0aGVyZSBzaG91bGQgYWxzbyBiZSAob3B0aW9uYWwpIG1l
dGFkYXRhIHJldHJpZXZhbCB0byB0aGUgClhFTl9TWVNDVExfTElWRVBBVENIX0dFVCBjYWxsIHNp
bmNlIGEgY2FsbGVyIG1heSB3YW50IHRvIGdldCBzdGF0dXMgJiAKbWV0YWRhdGEgZm9yIGEgcGFy
dGljdWxhciBsaXZlIHBhdGNoIHdpdGhvdXQgaGF2aW5nIHRvIGxpc3QgYWxsIG9mIHRoZW0uIApU
aGF0IHNob3VsZCBiZSBkb25lIGFzIGEgc2VwYXJhdGUgcGF0Y2ggZnJvbSB0aGlzIG9uZSwgSSB0
aGluay4KClRoYW5rcywKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
