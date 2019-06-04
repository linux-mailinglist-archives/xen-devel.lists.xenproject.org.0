Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68434F4E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:48:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDWB-0002Qd-5X; Tue, 04 Jun 2019 17:46:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYDW9-0002QY-VA
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:46:37 +0000
X-Inumbo-ID: b2cdd27a-86f0-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b2cdd27a-86f0-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 17:46:36 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kc2zCKoQ6f95YJbpzOd0/zrQFprlyMTDV9hULOSboPnJnACW70p4KPUQjTPsjAwRKIoCHbpNlJ
 LfNqo8nCbtYiDh/HZ+Rh1HboJUYTKSH3GUXNIGR3J9QaD/xOPNTk5ZQ3bC1zaAMglwCbnb4xOw
 FAjxU3kVcYwTxZYh1XEGs46AUVFnO02tw9Kk+zgEWrvDEcdYluqGxyZzam97kD9WhL9WkZK9gB
 CoEFJ/Wh34FZwC+k4TOuFMO9NOiT/0mRvJ7WTkSmaJ6YQmQuSicASBoVxeTvlNfd0naUzbPXQt
 NY0=
X-SBRS: 2.7
X-MesageID: 1286591
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1286591"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.44629.791366.426701@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 18:45:57 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-9-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-9-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 8/9] libxl_disk: Use ev_qmp in
 libxl_cdrom_insert
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDgvOV0gbGlieGxfZGlzazogVXNlIGV2X3Ft
cCBpbiBsaWJ4bF9jZHJvbV9pbnNlcnQiKToKPiBsaWJ4bF9jZHJvbV9pbnNlcnQgaXMgbm93IGFz
eW5jaHJvbm91cyB3aGVuIFFFTVUgaXMgaW52b2x2ZS4gQW5kIHRoZQo+IGNkcm9tIGlzIG5vdyBv
cGVubmVkIGJ5IGxpYnhsIGJlZm9yZSBzZW5kaW5nIGEgZmlsZSBkZXNjcmlwdG9yIHRvIFFFTVUu
CgpUaGlzIHBhdGNoIGhhcyBtdWNoIG9mIHRoZSBtZWF0LiAgSXQgc2VlbXMgdG8gY29udGFpbiB0
aGUgYXBwcm9wcmlhdGUKcGllY2VzIGFuZCBJIGdlbmVyYWxseSBsaWtlIGl0LgoKSSBoYXZlIG9u
bHkgbWlub3Igc3R5bGUgcXVpYmJsZXMuCgoKSSB0aGluayBjb252ZW50aW9uYWwgRW5nbGlzaCBn
cmFtbWFyIGluIGNvbW1pdCBtZXNzYWdlcyBpcyB0byB1c2UgdGhlCnByZXNlbnQgdGVuc2UgZm9y
IHRoZSBzaXR1YXRpb24gd2hpY2ggZXhpc3RzICpiZWZvcmUqIHRoZSBjb21taXQgaW4KcXVlc3Rp
b24uICBJIHRoaW5rIHlvdSBtZWFuOgoKICBNYWtlIGxpYnhsX2Nkcm9tX2luc2VydCBhc3luY2hy
b25vdXMgd2hlbiBRRU1VIGlzIGludm9sdmVkLiAgQW5kCiAgaGF2ZSB0aGUgY2Ryb20gb3BlbmVk
IGJ5IGxpYnhsLCBzZW5kaW5nIGEgZmlsZSBkZXNjcmlwdG9yIHRvIFFFTVUuCgo+ICAgICAgICAg
IGlmIChyYykgZ290byBvdXQ7Cj4gKyAgICAgICAgYXN5bmNocm9ub3VzX2NhbGxiYWNrID0gdHJ1
ZTsKPiArICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgYXN5bmNocm9ub3VzX2NhbGxiYWNrID0gZmFs
c2U7Ci4uLgo+IC0gICAgfSBlbHNlIHsKPiAtICAgICAgICBjZHJvbV9pbnNlcnRfZWplY3RlZChl
Z2MsIGNpcyk7IC8qIG11c3QgYmUgbGFzdCAqLwo+ICsgICAgfSBlbHNlIGlmICghYXN5bmNocm9u
b3VzX2NhbGxiYWNrKSB7Cj4gKyAgICAgICAgLyogT25seSBjYWxsZWQgaWYgbm8gYXN5bmNocm9u
b3VzIGNhbGxiYWNrIGFyZSBzZXQuICovCj4gKyAgICAgICAgY2Ryb21faW5zZXJ0X2VqZWN0ZWQo
ZWdjLCAmY2lzLT5xbXAsIE5VTEwsIDApOyAvKiBtdXN0IGJlIGxhc3QgKi8KClRoaXMgZmxhZyB2
YXJpYWJsZSBpcyBwcmV0dHkgdWdseS4gIEluZGVlZCB0aGUgZXhpdCBwYXRoIGZyb20gdGhpcwpm
dW5jdGlvbiBpcyBxdWl0ZSBmaWRkbHkgbm93LiAgQnV0IEkgY2FuJ3QgdGhpbmsgb2YgYSBtdWNo
IHByZXR0aWVyCndheSwgYW5kIGl0IGxvb2tzIGxpa2UgaXQgaXMgY29ycmVjdCB0byBtZS4KCkFu
b3RoZXIgcG9zc2liaWxpdHkgd291bGQgYmUgdG8gbW92ZSBhbGwgdGhlIHZhcmlhYmxlcyBsaWtl
IHQgYW5kCmRfY29uZmlnIGludG8gdGhlIGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGUsIGFuZCB0
aGVuIHRoZSBjbGVhbnVwCndvdWxkIGJlIGNlbnRyYWxpc2VkLiAgQnV0IHRoZSBsb2NrIGxpZmV0
aW1lIG9mIHRoZSB1c2VyZGF0YSBsb2NrCm1pZ2h0IGJlIHdyb25nLgoKU28sIGVyciwgSSBndWVz
cywgbGVhdmUgaXQgbGlrZSB0aGlzIHVubGVzcyB5b3UgaGF2ZSBhbnkgYmV0dGVyIGlkZWFzLgoK
PiAtICAgIGlmIChjaXMtPmRtX3ZlciA9PSBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1V
X1hFTikgewo+IC0gICAgICAgIHJjID0gbGlieGxfX3FtcF9pbnNlcnRfY2Ryb20oZ2MsIGRvbWlk
LCBkaXNrKTsKPiArICAgIGlmIChjaXMtPmRtX3ZlciA9PSBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVS
U0lPTl9RRU1VX1hFTiAmJgo+ICsgICAgICAgIGRpc2stPmZvcm1hdCAhPSBMSUJYTF9ESVNLX0ZP
Uk1BVF9FTVBUWSkgewo+ICsgICAgICAgIGxpYnhsX19qc29uX29iamVjdCAqYXJncyA9IE5VTEw7
Cj4gKwoKVGhhdCB0aGlzIGRvZXNuJ3QgZXZlciBsZWFrIHBheWxvYWRfZmQgaXMgbm90IGVudGly
ZWx5IGNsZWFyLiAgSG93CmFib3V0IGFkZGluZywgaGVyZQoKICArICAgICAgICBhc3NlcnQocW1w
LT5wYXlsb2FkX2ZkID09IC0xKTsKCj8gIFNpbmNlIHRoZSBydWxlIHNlZW1zIHRvIGJlIHRoYXQg
dGhlIGV4aXQgcGF0aCB3aWxsIGNsZWFuIGl0IHVwLCBidXQKdGhhdCBpbXBsaWVzIHRoYXQgb3Zl
cndyaXRpbmcgaXQgbWlnaHQgbGVhayBhIHByZXZpb3VzIGZkIChvZiB3aGljaAp0aGVyZSBpc24n
dCBvbmUgcmlnaHQgbm93Li4uKQoKPiArICAgICAgICBxbXAtPnBheWxvYWRfZmQgPSBvcGVuKGRp
c2stPnBkZXZfcGF0aCwgT19SRE9OTFkpOwo+ICsgICAgICAgIGlmIChxbXAtPnBheWxvYWRfZmQg
PCAwKSB7Cj4gKyAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21pZCwgIkZhaWxlZCB0byBvcGVu
IGNkcm9tIGZpbGUgJXMiLAo+ICsgICAgICAgICAgICAgICAgICBkaXNrLT5wZGV2X3BhdGgpOwo+
ICsgICAgICAgICAgICByYyA9IEVSUk9SX0ZBSUw7Cj4gKyAgICAgICAgICAgIGdvdG8gb3V0Owo+
ICsgICAgICAgIH0KPiArCj4gKyAgICAgICAgLyogVGhpcyBmcmVlIGZvcm0gcGFyYW1ldGVyIGlz
IG5vdCB1c2UgYnkgUUVNVSBvciBsaWJ4bC4gKi8KPiArICAgICAgICBRTVBfUEFSQU1FVEVSU19T
UFJJTlRGKCZhcmdzLCAib3BhcXVlIiwgIiVzOiVzIiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpYnhsX2Rpc2tfZm9ybWF0X3RvX3N0cmluZyhkaXNrLT5mb3JtYXQpLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGlzay0+cGRldl9wYXRoKTsKPiArICAgICAg
ICBxbXAtPmNhbGxiYWNrID0gY2Ryb21faW5zZXJ0X2FkZGZkX2NiOwo+ICsgICAgICAgIHJjID0g
bGlieGxfX2V2X3FtcF9zZW5kKGdjLCBxbXAsICJhZGQtZmQiLCBhcmdzKTsKCgpBc3N1bWluZyB5
b3UgYXQgbGVhc3QgY2hhbmdlIHRoZSBjb21taXQgbWVzc2FnZSwgYW5kIHJlZ2FyZGxlc3Mgb2YK
eW91ciBvcGluaW9uIGFib3V0IHRoZSBhc3NlcnQ6CgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
