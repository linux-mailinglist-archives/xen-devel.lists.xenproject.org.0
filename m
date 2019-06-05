Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CDC35EC9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:12:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWcP-00052i-FI; Wed, 05 Jun 2019 14:10:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONy6=UE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hYWcO-00052c-Ea
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:10:20 +0000
X-Inumbo-ID: a5b56b31-879b-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5b56b31-879b-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 14:10:18 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JcJHj+7JE90ffllYt2yInJmc4aT9K35luPMLDXOjgJHife3wAJrxZVvtcEdHcWSfCXDF2VLz/B
 +xEO3NGUZ/McFu99IxEsjQwjGjz7IaUAT2uwcrJHXodYH5h/vMFOxia+fgbnU5MaZu+PuapOdP
 BRKlCIFkJu2B+sqCMrDIvO+PAPJ9/4apxBcSH1ilBrXPI7W7HMMYhD0aJU6rGzI48HdDEr3dP9
 ZLd9FGQzwoOFXHnJK49EUD2bKBFRhMNavUUJf0beTtfp5Er9Tj3CtvexuvFokesgIy2g8rzgg0
 OFw=
X-SBRS: 2.7
X-MesageID: 1325592
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1325592"
Date: Wed, 5 Jun 2019 15:10:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190605141015.GJ2126@perard.uk.xensource.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-5-anthony.perard@citrix.com>
 <23798.42555.428964.824573@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23798.42555.428964.824573@mariner.uk.xensource.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 4/9] libxl_internal: Create new lock for
 devices hotplug via QMP
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDY6MTE6MjNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDQvOV0gbGlieGxfaW50ZXJuYWw6
IENyZWF0ZSBuZXcgbG9jayBmb3IgZGV2aWNlcyBob3RwbHVnIHZpYSBRTVAiKToKPiA+IFRoZSBj
dXJyZW50IGxvY2sgYGRvbWFpbl91c2VyZGF0YV9sb2NrJyBjYW4ndCBiZSB1c2VkIHdoZW4gbW9k
aWZpY2F0aW9uCj4gPiB0byBhIGd1ZXN0IGlzIGRvbmUgYnkgc2VuZGluZyBjb21tYW5kIHRvIFFF
TVUsIHRoaXMgaXMgYSBzbG93IHByb2Nlc3MKPiA+IGFuZCByZXF1aXJlcyB0byBjYWxsIENUWF9V
TkxPQ0ssIHdoaWNoIGlzIG5vdCBwb3NzaWJsZSB3aGlsZSBob2xkaW5nCj4gPiB0aGUgYGRvbWFp
bl91c2VyZGF0YV9sb2NrJy4KPiAuLi4KPiA+ICtzdHJ1Y3QgbGlieGxfX2RvbWFpbl9xbXBfbG9j
ayB7Cj4gPiArICAgIGxpYnhsX19nZW5lcmljX2xvY2sgbG9jazsKPiA+ICt9Owo+ID4gKwo+ID4g
K2xpYnhsX19kb21haW5fcW1wX2xvY2sgKmxpYnhsX19sb2NrX2RvbWFpbl9xbXAobGlieGxfX2dj
ICpnYywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX2RvbWlkIGRvbWlkKQo+ID4gK3sKPiA+ICsgICAgbGlieGxfX2RvbWFpbl9xbXBfbG9j
ayAqbG9jayA9IE5VTEw7Cj4gPiArICAgIGludCByYzsKPiA+ICsKPiA+ICsgICAgbG9jayA9IGxp
YnhsX196YWxsb2MoTk9HQywgc2l6ZW9mKCpsb2NrKSk7Cj4gPiArICAgIHJjID0gbGlieGxfX2xv
Y2tfZ2VuZXJpYyhnYywgZG9taWQsICZsb2NrLT5sb2NrLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImxpYnhsLWRldmljZS1jaGFuZ2VzLWxvY2siKTsKPiA+ICsgICAgaWYgKHJj
KSB7Cj4gPiArICAgICAgICBsaWJ4bF9fdW5sb2NrX2RvbWFpbl9xbXAobG9jayk7Cj4gPiArICAg
ICAgICByZXR1cm4gTlVMTDsKPiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICByZXR1cm4gbG9jazsK
PiAKPiBUaGlzIGlzIGFsbW9zdCBpZGVudGljYWwgdG8gdGhlIGxpYnhsX19sb2NrX2RvbWFpbl91
c2VyZGF0YSB3aGljaAo+IGFwcGVhcmVkIGluIHRoZSBwcmV2aW91cyBwYXRjaC4gIFRoYXQgc3Vn
Z2VzdHMgdGhhdCB0aGUgZmFjdG9yaXNhdGlvbgo+IGhlcmUgaXMgYXQgdGhlIHdyb25nIGxheWVy
Lgo+IAo+ID4gK3ZvaWQgbGlieGxfX3VubG9ja19kb21haW5fcW1wKGxpYnhsX19kb21haW5fcW1w
X2xvY2sgKmxvY2spCj4gPiArewo+ID4gKyAgICBsaWJ4bF9fdW5sb2NrX2dlbmVyaWMoJmxvY2st
PmxvY2spOwo+ID4gKyAgICBmcmVlKGxvY2spOwo+ID4gK30KPiAKPiBUaGlzIGlzIGNvbXBsZXRl
bHkgaWRlbnRpY2FsIHRvIGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRhLiAgVGhlCj4gb25s
eSByZWFzb24gd2UgaGF2ZSB0byB0d28gb2YgdGhlc2UgaXMgc28gdGhhdCB0aGUgdHdvIGxvY2tz
IGFyZQo+IGRpc3Rpbmd1aXNoZWQgYnkgdGhlIHR5cGUgb2YgdGhlIGxvY2sgc3RydWN0LiAgVGhh
dCBtZWFucyB0aGF0IHlvdQo+IGhhdmUgdG8gY2FsbAo+ICAgIGxpYnhsX191bmxvY2tfZG9tYWlu
X3FtcChmb28tPnFtcF9sb2NrKQo+IGJ1dAo+ICAgIGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJk
YXRlKGZvby0+dXNlcmRhdGFfbG9jaykKPiBvciBzb21lIHN1Y2gsIGFuZCB0aGUgY29tcGlsZXIg
d2lsbCBzcG90IGlmIHlvdSB3cml0ZQo+ICAgIGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRh
KGZvby0+cW1wX2xvY2spCj4gb3Igc29tZXRoaW5nLiAgQnV0IGlzIGl0IHJlYWxseSB1c2VmdWwg
dG8gaGF2ZSB0byB3cml0ZSB0aGUgYHFtcCcgdnMKPiBgdXNlcmRhdGEnIHRoaW5nIHR3aWNlID8K
ClNvLCBpbnN0ZWFkIG9mIHRoYXQgaW50ZXJmYWNlLCBob3cgYWJvdXQgYSBkaWZmZXJlbnQgb25l
IHRoYXQgdXNlcyB0aGUKc2FtZSBDIHR5cGUgZm9yIGJvdGgga2luZCBvZiBsb2NrPwoKICAgIGxp
YnhsX19sb2NrICpsaWJ4bF9fbG9ja19kb21haW5fdXNlcmRhdGEobGlieGxfX2djICosIGxpYnhs
X2RvbWlkKTsKICAgIGxpYnhsX19sb2NrICpsaWJ4bF9fbG9ja19kb21haW5fcW1wKGxpYnhsX19n
YyAqLCBsaWJ4bF9kb21pZCk7CiAgICB2b2lkIGxpYnhsX191bmxvY2sobGlieGxfX2xvY2sgKik7
CgpPciBtYXliZSBhdm9pZCBoYXZpbmcgdHdvIGZ1bmN0aW9ucyBmb3IgbG9ja2luZyBhbmQgdXNl
IGEgI2RlZmluZS9lbnVtCmluc3RlYWQ6CiAgICBsaWJ4bF9fbG9ja19kb21haW4oZ2MsIGRvbWlk
LCBMT0NLX1VTRVJEQVRBKTsKICAgIGxpYnhsX19sb2NrX2RvbWFpbihnYywgZG9taWQsIExPQ0tf
UU1QKTsKCkknbSBub3Qgc3VyIHdoYXQgc2hvdWxkIHRoZSBsYXN0IHBhcmFtZXRlciBiZS4gRWl0
aGVyIGEgc3RyaW5nIG9yIGEKZW51bS4gQW4gZW51bSB3b3VsZCBiZSBiZXR0ZXIgYmVjYXVzZSB0
aGUgbG9jayBmaWxlbmFtZSB3b3VsZCBiZSBhbGwgaW4KYSBzaW5nbGUgbG9jYXRpb24gaW4gdGhl
IHNvdXJjZSBjb2RlLgoKV2hhdCBkbyB5b3UgdGhpbms/IFdvdWxkIHRoZSBmaXJzdCBwcm9wb3Nh
bCBiZSBlbm91Z2ggdG8gYXZvaWQgaGF2aW5nIHRvCndyaXRlIGB1c2VyZGF0YScgb3IgYHFtcCcg
dHdpY2Ugb24gdW5sb2NrPwoKPiA+ICsgKiBJdCBpcyB0byBiZSBhY3F1aXJlZCBieSBhbiBhbyBl
dmVudCBjYWxsYmFjay4KPiAKPiBJIHRoaW5rIHRoZXJlIGlzIGEgd29yc2UgcHJvYmxlbSBoZXJl
LCB0aG91Z2guICBUaGlzIGxvY2sgaXMgcHJvYmFibHkKPiAqaW5zaWRlKiBzb21lIGxvY2sgZnJv
bSB0aGUgY2FsbGVyLiAgU28gdXN1YWwgbGlieGwgcnVsZXMgYXBwbHkgYW5kCj4geW91IG1heSBu
b3QgYmxvY2sgdG8gYWNxdWFpcmUgaXQuCj4gCj4gSWUgbGlieGxfX2xvY2tfZG9tYWluX3FtcCBt
dXN0IGJlIG9uZSBvZiB0aGVzZSB0aGluZ3MgdGhhdCB0YWtlcyBhCj4gbGl0dGxlIGV2IHN0YXRl
IHN0cnVjdCBhbmQgbWFrZXMgYSBjYWxsYmFjay4KPiAKPiBBdCB0aGUgc3lzY2FsbCBsZXZlbCwg
YWNxdWlyaW5nIGFuIGZjbnRsIGxvY2sgY2Fubm90IGJlIHNlbGVjdGVkIG9uLgo+IFRoZSBvcHRp
b25zIGFyZSB0byBwb2xsLCBvciB0byBzcGF3biBhIHRocmVhZCwgb3IgdG8gZm9yay4KPiAKPiBD
dXJyZW50bHkgbGlieGwgZG9lcyBub3QgY2FsbCBwdGhyZWFkX2NyZWF0ZSwgYWx0aG91Z2ggbWF5
YmUgaXQgY291bGQKPiBkby4gIFRvIHNhZmVseSBjcmVhdGUgYSB0aHJlYWQgeW91IGhhdmUgdG8g
ZG8gYSBkYW5jZSB3aXRoCj4gc2lncHJvY21hc2ssIHRvIGF2b2lkIHNpZ25hbCBkZWxpdmVyeSBv
bnRvIHlvdXIgdGhyZWFkLgo+IAo+IE1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byB0cnkgb25j
ZSB3aXRoIExPQ0tfTkIsIGFuZCB0byBmb3JrIGlmIHRoaXMKPiBpcyBub3Qgc3VjY2Vzc2Z1bC4g
IEJ1dCBpdCB3b3VsZCBiZSBzaW1wbGVyIHRvIGFsd2F5cyBmb3JrLi4uCgpBZnRlciBvdXIgdGFs
ayBJUkwsIEknbGwgZ28gdGhlIGZvcmsgcm91dGUuCkFsc28sIEknbSB0aGlua2luZyB0byBhbHdh
eXMgZm9yayB3aGVuIGxpYnhsIGlzIGJ1aWx0IHdpdGggImRlYnVnPXkiLAphbmQgYWxsb3cgdGhl
IG9wdGltaXNhdGlvbiBvZiB0cnlpbmcgZmlyc3Qgd2l0aCBMT0NLX05CIHdoZW4gYnVpbHQgd2l0
aAoiZGVidWc9biIsIHNvIHRoZSBmb3JrZWQgY29kZSB3aWxsIGFjdHVhbGx5IGJlIHRlc3RlZCBy
ZWd1bGFyeS4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
