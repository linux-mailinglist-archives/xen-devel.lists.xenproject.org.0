Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08883120F36
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 17:20:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igt2r-00009n-S8; Mon, 16 Dec 2019 16:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gmbk=2G=amazon.com=prvs=246aeae25=sjpark@srs-us1.protection.inumbo.net>)
 id 1igt2q-00009h-B0
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 16:16:28 +0000
X-Inumbo-ID: 64e25ff6-201f-11ea-a914-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64e25ff6-201f-11ea-a914-bc764e2007e4;
 Mon, 16 Dec 2019 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576512980; x=1608048980;
 h=from:to:cc:subject:date:message-id:in-reply-to: mime-version;
 bh=9z8t8XnsAnAXAf2gaDgzxItc1c1wK1sA8xuncflNNTQ=;
 b=q3BOpMZy94YncFZJenGg/yyH1K/6XfsWfcLcRMKmSwmC91Vx9Xrdb7Ie
 Jeqgpwx4e9iX0RIy+3V0H3PukN5gqDPWDnLgt8H3hMzjcHb2l/wxw7S0r
 V9ab/DjRMA+bNmPdeo+O7W6HExFqKZOw1EpO0Nngyd4evxJEh6FCVeLNT I=;
IronPort-SDR: E3egi9ueoOF6CWKE2d6HH3+whzv1+J303Ok2CC8E09WqnGH2siSeJ6rUbyhRFFZ0+JupCCbi4z
 FBQHv6I/V1FA==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; 
   d="scan'208";a="7840830"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Dec 2019 16:16:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id 78C7DA252F; Mon, 16 Dec 2019 16:16:17 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 16:16:16 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.74) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 16:16:08 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Mon, 16 Dec 2019 17:15:49 +0100
Message-ID: <20191216161549.26976-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216143720.23268-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.161.74]
X-ClientProxiedBy: EX13D15UWA004.ant.amazon.com (10.43.160.219) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v10 2/4] xen/blkback: Squeeze page pools if
 a memory pressure is detected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sj38.park@gmail.com, sjpark@amazon.com, pdurrant@amazon.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBEZWMgMjAxOSAxNTozNzoyMCArMDEwMCBTZW9uZ0phZSBQYXJrIDxzanBhcmtA
YW1hem9uLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwgMTYgRGVjIDIwMTkgMTM6NDU6MjUgKzAxMDAg
U2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5jb20+IHdyb3RlOgo+IAo+ID4gRnJvbTogU2Vv
bmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiA+IApbLi4uXQo+ID4gLS0tIGEvZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+ID4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4t
YmxrYmFjay94ZW5idXMuYwo+ID4gQEAgLTgyNCw2ICs4MjQsMjQgQEAgc3RhdGljIHZvaWQgZnJv
bnRlbmRfY2hhbmdlZChzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LAo+ID4gIH0KPiA+ICAKPiA+
ICAKPiA+ICsvKiBPbmNlIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVkLCBzcXVlZXplIGZy
ZWUgcGFnZSBwb29scyBmb3IgYSB3aGlsZS4gKi8KPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IGJ1
ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zID0gMTA7Cj4gPiArbW9kdWxlX3BhcmFtX25hbWVkKGJ1
ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAo+ID4gKwkJYnVmZmVyX3NxdWVlemVfZHVyYXRpb25f
bXMsIGludCwgMDY0NCk7Cj4gPiArTU9EVUxFX1BBUk1fREVTQyhidWZmZXJfc3F1ZWV6ZV9kdXJh
dGlvbl9tcywKPiA+ICsiRHVyYXRpb24gaW4gbXMgdG8gc3F1ZWV6ZSBwYWdlcyBidWZmZXIgd2hl
biBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZCIpOwo+ID4gKwo+ID4gKy8qCj4gPiArICog
Q2FsbGJhY2sgcmVjZWl2ZWQgd2hlbiB0aGUgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVkLgo+
ID4gKyAqLwo+ID4gK3N0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0cnVjdCB4ZW5idXNfZGV2
aWNlICpkZXYpCj4gPiArewo+ID4gKwlzdHJ1Y3QgYmFja2VuZF9pbmZvICpiZSA9IGRldl9nZXRf
ZHJ2ZGF0YSgmZGV2LT5kZXYpOwo+ID4gKwo+ID4gKwliZS0+YmxraWYtPmJ1ZmZlcl9zcXVlZXpl
X2VuZCA9IGppZmZpZXMgKwo+ID4gKwkJbXNlY3NfdG9famlmZmllcyhidWZmZXJfc3F1ZWV6ZV9k
dXJhdGlvbl9tcyk7Cj4gCj4gVGhpcyBjYWxsYmFjayBtaWdodCByYWNlIHdpdGggJ3hlbl9ibGti
a19wcm9iZSgpJy4gIFRoZSByYWNlIGNvdWxkIHJlc3VsdCBpbgo+IF9fTlVMTCBkZXJlZmVyZW5j
aW5nX18sIGFzICd4ZW5fYmxrYmtfcHJvYmUoKScgc2V0cyAnLT5ibGtpZicgYWZ0ZXIgaXQgbGlu
a3MKPiAnYmUnIHRvIHRoZSAnZGV2Jy4gIFBsZWFzZSBfZG9uJ3QgbWVyZ2VfIHRoaXMgcGF0Y2gg
bm93IQo+IAo+IEkgd2lsbCBkbyBtb3JlIHRlc3QgYW5kIHNoYXJlIHJlc3VsdHMuICBNZWFud2hp
bGUsIGlmIHlvdSBoYXZlIGFueSBvcGluaW9uLAo+IHBsZWFzZSBsZXQgbWUga25vdy4KCk5vdCBv
bmx5ICctPmJsa2lmJywgYnV0ICdiZScgaXRzZWxmIGFsc28gY291bGUgYmUgYSBOVUxMLiAgQXMg
c2ltaWxhcgpjb25jdXJyZW5jeSBpc3N1ZXMgY291bGQgYmUgaW4gb3RoZXIgZHJpdmVycyBpbiB0
aGVpciB3YXksIEkgc3VnZ2VzdCB0byBjaGFuZ2UKdGhlIHJlY2xhaW0gY2FsbGJhY2sgKCctPnJl
Y2xhaW1fbWVtb3J5JykgdG8gYmUgY2FsbGVkIGZvciBlYWNoIGRyaXZlciBpbnN0ZWFkCm9mIGVh
Y2ggZGV2aWNlLiAgVGhlbiwgZWFjaCBkcml2ZXIgY291bGQgYmUgYWJsZSB0byBkZWFsIHdpdGgg
aXRzIGNvbmN1cnJlbmN5Cmlzc3VlcyBieSBpdHNlbGYuCgpGb3IgYmxrYmFjaywgd2UgY291bGQg
cmV1c2UgdGhlIGdsb2JhbCB2YXJpYWJsZSBiYXNlZCBhcHByb2FjaCwgYXMgc2ltaWxhciB0bwp0
aGUgdjdbMV0gb2YgdGhpcyBwYXRjaHNldC4gIEFzIHRoZSBjYWxsYmFjayBpcyBjYWxsZWQgZm9y
IGVhY2ggZHJpdmVyIGluc3RlYWQKb2YgZWFjaCBkZXZpY2Ugbm93LCB0aGUgZHVwbGljYXRlZCBz
ZXQgb2YgdGhlIHRpbWVvdXQgd2lsbCBub3QgaGFwcGVuLgoKClRoYW5rcywKU2VvbmdKYWUgUGFy
awoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE5MTIxMTE4MTAxNi4x
NDM2Ni0xLXNqcGFya0BhbWF6b24uZGUvCgo+IAo+IAo+IFRoYW5rcywKPiBTZW9uZ0phZSBQYXJr
Cj4gCj4gPiArfQo+ID4gKwo+ID4gIC8qICoqIENvbm5lY3Rpb24gKiogKi8KPiA+ICAKPiA+ICAK
PiA+IEBAIC0xMTE1LDcgKzExMzMsOCBAQCBzdGF0aWMgc3RydWN0IHhlbmJ1c19kcml2ZXIgeGVu
X2Jsa2JrX2RyaXZlciA9IHsKPiA+ICAJLmlkcyAgPSB4ZW5fYmxrYmtfaWRzLAo+ID4gIAkucHJv
YmUgPSB4ZW5fYmxrYmtfcHJvYmUsCj4gPiAgCS5yZW1vdmUgPSB4ZW5fYmxrYmtfcmVtb3ZlLAo+
ID4gLQkub3RoZXJlbmRfY2hhbmdlZCA9IGZyb250ZW5kX2NoYW5nZWQKPiA+ICsJLm90aGVyZW5k
X2NoYW5nZWQgPSBmcm9udGVuZF9jaGFuZ2VkLAo+ID4gKwkucmVjbGFpbV9tZW1vcnkgPSByZWNs
YWltX21lbW9yeSwKPiA+ICB9Owo+ID4gIAo+ID4gIGludCB4ZW5fYmxraWZfeGVuYnVzX2luaXQo
dm9pZCkKPiA+IC0tIAo+ID4gMi4xNy4xCj4gPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
