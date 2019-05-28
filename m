Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241102D1B9
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 00:50:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVktH-0006Tt-Mo; Tue, 28 May 2019 22:48:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hVktG-0006Tn-Tr
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 22:48:18 +0000
X-Inumbo-ID: af88f228-819a-11e9-9e28-8f2f39c73b9c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af88f228-819a-11e9-9e28-8f2f39c73b9c;
 Tue, 28 May 2019 22:48:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D0BF20B1F;
 Tue, 28 May 2019 22:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559083697;
 bh=fQJaHxCNDtPFaEmZfs5hYKC6lazn3gicFloSop1Oemc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kvYgg/NeZkpUId8nav/XABCZ3t09PffcfMH20A5UHBC6hQui/zz37FrlzTMiVCjnF
 L0ofMZLu2wmJEIVhoc2IuF5ffnPaTTGQaVo2n2eWGKIB6girRzwVWXsK9nZ/gUltV5
 0zs1LAcsjUqT9B/SdEjb4irT6AE9d87n9ah3htU4=
Date: Tue, 28 May 2019 15:48:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <43201444-9e08-4343-1824-446b8de0a2aa@arm.com>
Message-ID: <alpine.DEB.2.21.1905241235540.12214@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1905221622190.20440@sstabellini-ThinkPad-T480s>
 <43201444-9e08-4343-1824-446b8de0a2aa@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/swiotlb: don't initialize swiotlb twice
 on arm64
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMyBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIzLzA1LzIwMTkg
MDA6MjYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IAo+ID4gT24gYXJtNjQgc3dpb3RsYiBpcyBh
bHJlYWR5IGluaXRpYWxpemVkIGJ5IG1lbV9pbml0LiBXZSBkb24ndCB3YW50IHRvCj4gCj4gQXJt
NjQgd2lsbCBub3QgYWx3YXlzIGluaXRpYWxpemUgdGhlIHN3aW90bGIuIEl0IHdpbGwgb25seSBi
ZSBkb25lIGlmIHRoZSB1c2VyCj4gZm9yY2UgaXQgb3IgdGhlcmUgYXJlIG1lbW9yeSBhYm92ZSB0
aGUgRE1BIGxpbWl0Lgo+IAo+ID4gaW5pdGlhbGl6ZSBpdCB0d2ljZSwgdGhlIG1lbW9yeSBpcyBh
bHJlYWR5IGFsbG9jYXRlZC4gRGV0ZWN0IHRoaXMKPiA+IGNvbmRpdGlvbiBpbiBzd2lvdGxiLXhl
biBhbmQgc2tpcCB0aGUgc2Vjb25kIGluaXRpYWxpemF0aW9uLgo+IAo+IEkgdW5kZXJzdGFuZCB0
aGF0IHRoZSBtZW1vcnkgYWxsb2NhdGVkIGJ5IHN3aW90bGIgd2lsbCBiZSByZXBsYWNlZCB3aXRo
Cj4gZnJlZWluZyBtZW1vcnkuIFNvIHlvdSBhdCBsZWFzdCBoYXZlIGEgbWVtb3J5IGxlYWsuCj4g
Cj4gSG93ZXZlciwgdGhlIGxvZ2ljIHRvIGFsbG9jYXRlIHRoZSBtZW1vcnkgaXMgcXVpdGUgZGlm
ZmVyZW50LiBGb3IgaW5zdGFuY2UsCj4gQUZBSUNULCBzd2lvdGxiIHdpbGwgYWxsb2NhdGUgbG93
IHBhZ2VzIHdoaWxlIHhlbiBzd2lvdGxiIHdpbGwgYWxsb2MgYW55Cj4gcGFnZXMuCgpUaGF0J3Mg
cmlnaHQuCgoKPiBTbyBJIHRoaW5rIHlvdXIgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGNvbnRhaW4g
YSBiaXQgbW9yZSBkZXRhaWxzIG9uIHRoZQo+IGltcGxpY2F0aW9uLiBJIHZhZ3VlbHkgcmVtZW1i
ZXIgdGhhdCBvbiBYaWxpbnggb24gbmVlZGVkIHRvIHVzZSBsb3cgbWVtb3J5IGFzCj4gbXVjaCBh
cyBwb3NzaWJsZS4gSXMgdGhpcyBwYXRjaCBhY3R1YWxseSB0cnlpbmcgdG8gZml4IHRoYXQ/CgpZ
ZXMsIGFzIGEgc2lkZS1lZmZlY3QuIEFzaWRlIGZyb20gdGhlIGZydWl0bGVzcyBlbmRlYXZvciBv
ZiBhbGxvY2F0aW5nCm1lbW9yeSB0d2ljZSwgd2UgYWxzbyBlbmQgdXAgdHJhZGluZyBnb29kIGxv
dy1tZW1vcnkgcGFnZXMgZm9yCmhpZ2gtbWVtb3J5IHBhZ2VzLiBTbywgYSBzaWRlIGVmZmVjdCBv
ZiB0aGlzIHBhdGNoIGlzIHRoYXQgbG93LW1lbW9yeQpwYWdlcyBiZWNvbWUgYXZhaWxhYmxlIHZp
YSBzd2lvdGxiLXhlbi4KCiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IAo+ID4gLS0tCj4gPiAKPiA+IFRoZXJlIGFyZSBvdGhl
ciBpc3N1ZXMgd2hpY2ggSSBmb3VuZCByZWNlbnRseSBhZmZlY3RpbmcgdGhlIHN3aW90bGIgb24K
PiA+IGFybTY0IC0tIEknbGwgc2VuZCB0aGUgb3RoZXIgcGF0Y2hlcyBzZXBhcmF0ZWx5Lgo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVu
L3N3aW90bGIteGVuLmMKPiA+IGluZGV4IDg3N2JhZjIuLjhmY2RhMmJmNCAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKPiA+ICsrKyBiL2RyaXZlcnMveGVuL3N3aW90
bGIteGVuLmMKPiA+IEBAIC0yMDYsNiArMjA2LDcgQEAgaW50IF9fcmVmIHhlbl9zd2lvdGxiX2lu
aXQoaW50IHZlcmJvc2UsIGJvb2wgZWFybHkpCj4gPiAgIAlpbnQgcmMgPSAtRU5PTUVNOwo+ID4g
ICAJZW51bSB4ZW5fc3dpb3RsYl9lcnIgbV9yZXQgPSBYRU5fU1dJT1RMQl9VTktOT1dOOwo+ID4g
ICAJdW5zaWduZWQgaW50IHJlcGVhdCA9IDM7Cj4gPiArCWJvb2wgcHJlX2luaXRpYWxpemVkID0g
ZmFsc2U7Cj4gPiAgICAgCXhlbl9pb190bGJfbnNsYWJzID0gc3dpb3RsYl9ucl90YmwoKTsKPiA+
ICAgcmV0cnk6Cj4gPiBAQCAtMjE0LDcgKzIxNSwxMCBAQCBpbnQgX19yZWYgeGVuX3N3aW90bGJf
aW5pdChpbnQgdmVyYm9zZSwgYm9vbCBlYXJseSkKPiA+ICAgCS8qCj4gPiAgIAkgKiBHZXQgSU8g
VExCIG1lbW9yeSBmcm9tIGFueSBsb2NhdGlvbi4KPiA+ICAgCSAqLwo+ID4gLQlpZiAoZWFybHkp
IHsKPiA+ICsJaWYgKGlvX3RsYl9zdGFydCAhPSAwKSB7Cj4gCj4gUmF0aGVyIHRoYW4gYWRkaW5n
IGFuIGV4dHJhIGlmIGluIGEgYWxyZWFkeSBkaWZmaWN1bHQgY29kZSB0byByZWFkLiBDYW4gd2UK
PiBtb3ZlIHRoZSBhbGxvY2F0aW9uIGluIGEgc2VwYXJhdGUgZnVuY3Rpb24gYW5kIG9ubHkgY2Fs
bCBpdCBpZiBuZWNlc3Nhcnk/CgpNYXliZSBJIGhhdmUgYSBiZXR0ZXIgaWRlYS4gSWYgaW9fdGxi
X3N0YXJ0ICE9IDAsIHdlIGNvdWxkIHNraXAKZXZlcnl0aGluZyBlbHNlIGluIHRoaXMgZnVuY3Rp
b24gYW5kIGJhc2ljYWxseSBqdXN0IHJldHVybi4KCgo+ID4gKwkJeGVuX2lvX3RsYl9zdGFydCA9
IHBoeXNfdG9fdmlydChpb190bGJfc3RhcnQpOwo+ID4gKwkJcHJlX2luaXRpYWxpemVkID0gdHJ1
ZTsKPiA+ICsJfSBlbHNlIGlmIChlYXJseSkgewo+ID4gICAJCXhlbl9pb190bGJfc3RhcnQgPSBt
ZW1ibG9ja19hbGxvYyhQQUdFX0FMSUdOKGJ5dGVzKSwKPiA+ICAgCQkJCQkJICBQQUdFX1NJWkUp
Owo+ID4gICAJCWlmICgheGVuX2lvX3RsYl9zdGFydCkKPiA+IEBAIC0yNjQsNyArMjY4LDcgQEAg
aW50IF9fcmVmIHhlbl9zd2lvdGxiX2luaXQoaW50IHZlcmJvc2UsIGJvb2wgZWFybHkpCj4gPiAg
IAkJCSB2ZXJib3NlKSkKPiA+ICAgCQkJcGFuaWMoIkNhbm5vdCBhbGxvY2F0ZSBTV0lPVExCIGJ1
ZmZlciIpOwo+ID4gICAJCXJjID0gMDsKPiA+IC0JfSBlbHNlCj4gPiArCX0gZWxzZSBpZiAoIXBy
ZV9pbml0aWFsaXplZCkKPiA+ICAgCQlyYyA9IHN3aW90bGJfbGF0ZV9pbml0X3dpdGhfdGJsKHhl
bl9pb190bGJfc3RhcnQsCj4gPiB4ZW5faW9fdGxiX25zbGFicyk7Cj4gPiAgICAgCWlmICghcmMp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
