Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD7123263
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:27:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFeP-0000U9-EH; Tue, 17 Dec 2019 16:24:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mCDn=2H=amazon.com=prvs=2471a56b0=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihFeN-0000U3-Tz
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:24:43 +0000
X-Inumbo-ID: bb39ba5a-20e9-11ea-8f11-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb39ba5a-20e9-11ea-8f11-12813bfff9fa;
 Tue, 17 Dec 2019 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576599884; x=1608135884;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=6CjLT/jXM24rz/CtEsr3sfgvACZw7Z+OWO4pwc33DNA=;
 b=DF1XF4tpPFRfpi5PB+Nzc6esRN/lmuTrT630ln4dVUqiPWUNCGp020kL
 kq2DgD5HEM/4+VvPsCP2Hwki23CPZ+9V77gpzRgqqpNuB9FbAT8jih/d8
 9eflJ5kLxTPYHawNDofoH/SL8GBtyNjUSx1ZScF2wqnyBgjXxV4iTcmsa s=;
IronPort-SDR: l/5bBVqxQm+PGBhtTf/q0S//8Ztt3FG2SPwySz7BkUjYe4bKLQS0PyvVYKwTQiZO1BdfSZNFme
 t5zCG84erTug==
X-IronPort-AV: E=Sophos;i="5.69,326,1571702400"; 
   d="scan'208";a="9474974"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 17 Dec 2019 16:24:43 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3F287A221F; Tue, 17 Dec 2019 16:24:40 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Dec 2019 16:24:39 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.205) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 16:24:34 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Date: Tue, 17 Dec 2019 17:24:06 +0100
Message-ID: <20191217162406.4711-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <44327bf3-45ed-3e5a-3984-36ea40f53fc5@suse.com> (raw)
X-Originating-IP: [10.43.161.205]
X-ClientProxiedBy: EX13D02UWB004.ant.amazon.com (10.43.161.11) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v11 2/6] xenbus/backend: Protect xenbus
 callback with lock
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, sj38.park@gmail.com, SeongJae Park <sjpark@amazon.com>,
 konrad.wilk@oracle.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBEZWMgMjAxOSAxNzoxMzo0MiArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cgo+IE9uIDE3LjEyLjE5IDE3OjA3LCBTZW9uZ0phZSBQYXJrIHdy
b3RlOgo+ID4gRnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiA+IAo+ID4g
J3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFjayBjYW4gcmFjZSB3aXRoIGEgZHJpdmVyIGNvZGUgYXMg
dGhpcyBjYWxsYmFjawo+ID4gd2lsbCBiZSBjYWxsZWQgZnJvbSBhbnkgbWVtb3J5IHByZXNzdXJl
IGRldGVjdGVkIGNvbnRleHQuICBUbyBkZWFsIHdpdGgKPiA+IHRoZSBjYXNlLCB0aGlzIGNvbW1p
dCBhZGRzIGEgc3BpbmxvY2sgaW4gdGhlICd4ZW5idXNfZGV2aWNlJy4gIFdoZW5ldmVyCj4gPiAn
cmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGlzIGNhbGxlZCwgdGhlIGxvY2sgb2YgdGhlIGRldmlj
ZSB3aGljaCBwYXNzZWQKPiA+IHRvIHRoZSBjYWxsYmFjayBhcyBpdHMgYXJndW1lbnQgaXMgbG9j
a2VkLiAgVGh1cywgZHJpdmVycyByZWdpc3RlcmluZwo+ID4gdGhlaXIgJ3JlY2xhaW1fbWVtb3J5
JyBjYWxsYmFjayBzaG91bGQgcHJvdGVjdCB0aGUgZGF0YSB0aGF0IG1pZ2h0IHJhY2UKPiA+IHdp
dGggdGhlIGNhbGxiYWNrIHdpdGggdGhlIGxvY2sgYnkgdGhlbXNlbHZlcy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiA+IC0tLQo+ID4g
ICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgICAgICAgICB8ICAxICsKPiA+ICAg
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAxMCArKysrKysrKy0t
Cj4gPiAgIGluY2x1ZGUveGVuL3hlbmJ1cy5oICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysK
PiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIGIv
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCj4gPiBpbmRleCA1YjQ3MTg4OWQ3MjMu
LmI4NjM5M2YxNzJlNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmUuYwo+ID4gKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCj4gPiBA
QCAtNDcyLDYgKzQ3Miw3IEBAIGludCB4ZW5idXNfcHJvYmVfbm9kZShzdHJ1Y3QgeGVuX2J1c190
eXBlICpidXMsCj4gPiAgIAkJZ290byBmYWlsOwo+ID4gICAKPiA+ICAgCWRldl9zZXRfbmFtZSgm
eGVuZGV2LT5kZXYsICIlcyIsIGRldm5hbWUpOwo+ID4gKwlzcGluX2xvY2tfaW5pdCgmeGVuZGV2
LT5yZWNsYWltX2xvY2spOwo+ID4gICAKPiA+ICAgCS8qIFJlZ2lzdGVyIHdpdGggZ2VuZXJpYyBk
ZXZpY2UgZnJhbWV3b3JrLiAqLwo+ID4gICAJZXJyID0gZGV2aWNlX3JlZ2lzdGVyKCZ4ZW5kZXYt
PmRldik7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9i
YWNrZW5kLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwo+ID4g
aW5kZXggN2U3OGViZWY3YzU0Li41MTZhYTY0Yjk5NjcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwo+ID4gKysrIGIvZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKPiA+IEBAIC0yNTEsMTIgKzI1MSwxOCBAQCBz
dGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNoKHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bm90aWZpZXIsCj4gPiAgIHN0YXRpYyBpbnQgYmFja2VuZF9yZWNsYWltX21lbW9yeShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCj4gPiAgIHsKPiA+ICAgCWNvbnN0IHN0cnVjdCB4ZW5i
dXNfZHJpdmVyICpkcnY7Cj4gPiArCXN0cnVjdCB4ZW5idXNfZGV2aWNlICp4ZGV2Owo+ID4gKwl1
bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gICAKPiA+ICAgCWlmICghZGV2LT5kcml2ZXIpCj4gPiAg
IAkJcmV0dXJuIDA7Cj4gPiAgIAlkcnYgPSB0b194ZW5idXNfZHJpdmVyKGRldi0+ZHJpdmVyKTsK
PiA+IC0JaWYgKGRydiAmJiBkcnYtPnJlY2xhaW1fbWVtb3J5KQo+ID4gLQkJZHJ2LT5yZWNsYWlt
X21lbW9yeSh0b194ZW5idXNfZGV2aWNlKGRldikpOwo+ID4gKwlpZiAoZHJ2ICYmIGRydi0+cmVj
bGFpbV9tZW1vcnkpIHsKPiA+ICsJCXhkZXYgPSB0b194ZW5idXNfZGV2aWNlKGRldik7Cj4gPiAr
CQlzcGluX3RyeWxvY2tfaXJxc2F2ZSgmeGRldi0+cmVjbGFpbV9sb2NrLCBmbGFncyk7Cj4gCj4g
WW91IG5lZWQgc3Bpbl9sb2NrX2lycXNhdmUoKSBoZXJlLiBPciBtYXliZSBzcGluX2xvY2soKSB3
b3VsZCBiZSBmaW5lLAo+IHRvbz8gSSBjYW4ndCBzZWUgYSByZWFzb24gd2h5IHlvdSdkIHdhbnQg
dG8gZGlzYWJsZSBpcnFzIGhlcmUuCgpJIG5lZWRlZCB0byBkaWFibGUgaXJxIGhlcmUgYXMgdGhp
cyBpcyBjYWxsZWQgZnJvbSB0aGUgbWVtb3J5IHNocmlua2VyIGNvbnRleHQuCgpBbHNvLCB1c2Vk
ICd0cnlsb2NrJyBiZWNhdXNlIHRoZSAncHJvYmUoKScgYW5kICdyZW1vdmUoKScgY29kZSBvZiB0
aGUgZHJpdmVyCm1pZ2h0IGluY2x1ZGUgbWVtb3J5IGFsbG9jYXRpb24uICBBbmQgdGhlIHhlbi1i
bGtiYWNrIGFjdHVhbGx5IGRvZXMuICBJZiB0aGUKYWxsb2NhdGlvbiBzaG93cyBhIG1lbW9yeSBw
cmVzc3VyZSBkdXJpbmcgdGhlIGFsbG9jYXRpb24sIGl0IHdpbGwgdHJpZ2dlciB0aGlzCnNocmlu
a2VyIGNhbGxiYWNrIGFnYWluIGFuZCB0aGVuIGRlYWRsb2NrLgoKClRoYW5rcywKU2VvbmdKYWUg
UGFyawoKPiAKPiA+ICsJCWRydi0+cmVjbGFpbV9tZW1vcnkoeGRldik7Cj4gPiArCQlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZ4ZGV2LT5yZWNsYWltX2xvY2ssIGZsYWdzKTsKPiA+ICsJfQo+ID4g
ICAJcmV0dXJuIDA7Cj4gPiAgIH0KPiA+ICAgCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4v
eGVuYnVzLmggYi9pbmNsdWRlL3hlbi94ZW5idXMuaAo+ID4gaW5kZXggYzg2MWNmYjZmNzIwLi5k
OTQ2ODMxMzA2MWQgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3hlbi94ZW5idXMuaAo+ID4gKysr
IGIvaW5jbHVkZS94ZW4veGVuYnVzLmgKPiA+IEBAIC03Niw2ICs3Niw4IEBAIHN0cnVjdCB4ZW5i
dXNfZGV2aWNlIHsKPiA+ICAgCWVudW0geGVuYnVzX3N0YXRlIHN0YXRlOwo+ID4gICAJc3RydWN0
IGNvbXBsZXRpb24gZG93bjsKPiA+ICAgCXN0cnVjdCB3b3JrX3N0cnVjdCB3b3JrOwo+ID4gKwkv
KiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGlzIGNhbGxlZCB3aGlsZSB0aGlzIGxvY2sgaXMg
YWNxdWlyZWQgKi8KPiA+ICsJc3BpbmxvY2tfdCByZWNsYWltX2xvY2s7Cj4gPiAgIH07Cj4gPiAg
IAo+ID4gICBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZW5idXNfZGV2aWNlICp0b194ZW5idXNfZGV2
aWNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+IAo+IAo+IAo+IEp1ZXJnZW4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
