Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0C5A031
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 18:04:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgtKJ-0001FS-Ta; Fri, 28 Jun 2019 16:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=84UU=U3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgtKI-0001FM-32
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 16:02:14 +0000
X-Inumbo-ID: 171b798e-99be-11e9-a50a-eb4d060c3b89
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 171b798e-99be-11e9-a50a-eb4d060c3b89;
 Fri, 28 Jun 2019 16:02:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 922B220828;
 Fri, 28 Jun 2019 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561737731;
 bh=5n6q91HKdmCN961wbwYLqcNGiF1i171PX6IIRR2CgVA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xrd4Par/8CbjuyGUb7oKuELwTHCW4LLg8mIVYhdS4CgS+A6PV5Cazp31iRUqq1toh
 lLg3IdU1dwGLy1+cDuamA7JsXBJ0dfDVEabzxi1xoPzHxy4mycNP2xqQLVorWg7N6Q
 EyHGOIcLpx+ftulLVmqq5MEw3LGOrGZollxbwwuw=
Date: Fri, 28 Jun 2019 09:02:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Iain Hunter <drhunter95@gmail.com>
In-Reply-To: <CALC81-szbJK1xx--gqt-fDUQYN+_-WNdLeXi-Cut-wXRfFsFsQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1906280901120.5851@sstabellini-ThinkPad-T480s>
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
 <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
 <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
 <CALC81-szbJK1xx--gqt-fDUQYN+_-WNdLeXi-Cut-wXRfFsFsQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] xen on beagleboard-x15: fails to access PRCM MPU
 register
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>, Denis Obrezkov <denisobrezkov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFpbiwKCldoZXJlIGlzIHRoZSBwYXRjaCB5b3UgbWVudGlvbmVkPyBNYXliZSB5b3UgZm9y
Z290IHRvIGF0dGFjaCBpdCB0byB0aGUKZW1haWw/CgpDaGVlcnMsCgpTdGVmYW5vCgpPbiBGcmks
IDI4IEp1biAyMDE5LCBJYWluIEh1bnRlciB3cm90ZToKPiBTdGVmYW5vLCBEZW5pcywKPiAKPiBJ
IGFjaGlldmVkIHRoYXQgd2l0aCBwYXRjaAo+IHBhdGNoZXMveGVuLzAwMDMtYWRkLVBSQ01fTVBV
LXRvLW1lbW9yeS10cmFuc2xhdGlvbi1mb3ItQU01NzJ4LnBhdGNoLgo+IFRoaXMganVzdCBhZGRz
Cj4gIC5zcGVjaWZpY19tYXBwaW5nPW9tYXA1X3NwZWNpZmljX21hcHBpbmcKPiB0byBEUkE3IHBs
YXRmb3JtLgo+IAo+IElhaW4KPiAKPiBPbiBGcmksIDI4IEp1biAyMDE5IGF0IDAxOjMzLCBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFdy
aXRpbmcgaGVyZSBhIHN1bW1hcnkgb2YgdGhlIGZvbGxvdy11cCBkaXNjdXNzaW9uIG9uIElSQy4K
PiA+Cj4gPiBUaGlzIGlzIGR1ZSB0byBhIG1hZ2ljIG1lbW9yeSByZWdpb24sIG5vdCBkZXNjcmli
ZWQgaW4gdGhlIGRldmljZSB0cmVlLAo+ID4gYmVpbmcgYWNjZXNzZWQgYnkgTGludXguIFRoZSBt
ZW1vcnkgcmVnaW9uIGlzIDB4NDgyNDM0MDAgLSAweDQ4MjQzNDAwKzUxMi4KPiA+Cj4gPiBUbyBm
aXggcHJvYmxlbXMgbGlrZSB0aGlzIG9uZSwgd2UgaGF2ZSB0aGUgcGxhdGZvcm0gc3BlY2lmaWMg
ZmlsZXMgaW4KPiA+IHhlbjogc2VlIHRoZSBmaWxlcyB1bmRlciB4ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zLy4gU3BlY2lmaWNhbGx5LCBvbWFwNS5jCj4gPiBtaWdodCBiZSBhIGdvb2QgbW9kZWwgZm9y
IHdoYXQgd2UgbmVlZC4gTG9vayBhdCB0aGUKPiA+IG9tYXA1X3NwZWNpZmljX21hcHBpbmcgZnVu
Y3Rpb24sIHdoaWNoIGRvZXMgZXhhY3RseSB3aGF0IHRoZSBuYW1lCj4gPiBzdWdnZXN0czogaXQg
bWFwcyBzcGVjaWFsIE1NSU8gcmVnaW9ucyBpbnRvIHRoZSBndWVzdC4KPiA+Cj4gPiAgLyogQWRk
aXRpb25hbCBtYXBwaW5ncyBmb3IgZG9tMCAobm90IGluIHRoZSBEVFMpICovCj4gPiAgc3RhdGlj
IGludCBvbWFwNV9zcGVjaWZpY19tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQpCj4gPiAgewo+ID4g
ICAgICAvKiBNYXAgdGhlIFBSTSBtb2R1bGUgKi8KPiA+ICAgICAgbWFwX21taW9fcmVnaW9ucyhk
LCBnYWRkcl90b19nZm4oT01BUDVfUFJNX0JBU0UpLCAyLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIG1hZGRyX3RvX21mbihPTUFQNV9QUk1fQkFTRSkpOwo+ID4KPiA+ICAgICAgLyogTWFwIHRo
ZSBQUk1fTVBVICovCj4gPiAgICAgIG1hcF9tbWlvX3JlZ2lvbnMoZCwgZ2FkZHJfdG9fZ2ZuKE9N
QVA1X1BSQ01fTVBVX0JBU0UpLCAxLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3Rv
X21mbihPTUFQNV9QUkNNX01QVV9CQVNFKSk7Cj4gPgo+ID4gICAgICAvKiBNYXAgdGhlIFdha2V1
cCBHZW4gKi8KPiA+ICAgICAgbWFwX21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19nZm4oT01BUDVf
V0tVUEdFTl9CQVNFKSwgMSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICBtYWRkcl90b19tZm4o
T01BUDVfV0tVUEdFTl9CQVNFKSk7Cj4gPgo+ID4gICAgICAvKiBNYXAgdGhlIG9uLWNoaXAgU1JB
TSAqLwo+ID4gICAgICBtYXBfbW1pb19yZWdpb25zKGQsIGdhZGRyX3RvX2dmbihPTUFQNV9TUkFN
X1BBKSwgMzIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKE9NQVA1X1NS
QU1fUEEpKTsKPiA+Cj4gPiAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiBXZSBuZWVkIHNv
bWV0aGluZyBzaW1pbGFyIGZvciAweDQ4MjQzNDAwIC0gMHg0ODI0MzQwMCs1MTIgb24KPiA+IEJl
YWdsZWJvYXJkLgo+ID4KPiA+Cj4gPiBPbiBUaHUsIDI3IEp1biAyMDE5LCBEZW5pcyBPYnJlemtv
diB3cm90ZToKPiA+ID4gQ0MnZWQgb3RoZXIgR1NvQyBtZW50b3JzCj4gPiA+Cj4gPiA+IE9uIDYv
MjcvMTkgOTo1MiBQTSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gPiA+ID4gSGVsbG8gYWxsLAo+
ID4gPiA+Cj4gPiA+ID4gSSBoYXZlIGEgZmFpbHVyZSB3aGVuIEkgYW0gdHJ5aW5nIHRvIGJvb3Qg
TGludXggd2l0aCBYZW4gb24gYmIteDE1LCBoZXJlCj4gPiA+ID4gaXMgdGhlIGxvZzoKPiA+ID4g
PiBodHRwczovL3Bhc3RlYmluLmNvbS9CQkFGUGtWVQo+ID4gPiA+Cj4gPiA+ID4gYW5kLCBhcyBK
dWxpZW4gKGNjJ2VkKSBzdWdnZXN0ZWQgaGVyZSBpcyB0aGUgRFQgZGVidWcgaW5mb3JtYXRpb24g
Zm9yIHhlbjoKPiA+ID4gPiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vb3Blbj9pZD0xNVlUc0NL
WVVUYkcyaS1zaVdlekpYS1d1RzBIMVZmUXoKPiA+ID4gPgo+ID4gPiA+IFNvLCB3aGF0IEkgd2Fz
IGFibGUgdG8gZmlndXJlIG91dDoKPiA+ID4gPiBJbiBvbWFwNF9wcm1pbnN0X3JlYWRfaW5zdF9y
ZWcgaXQgdHJpZXMgdG8gcmVhZCBmcm9tIF9wcm1fYmFzZXNbcGFydF0udmEKPiA+ID4gPiAoYXJj
aC9hcm0vbWFjaC1vbWFwMi9wcm1pbnN0NDR4eC5jKS4KPiA+ID4gPiBfcHJtX2Jhc2VzW3BhcnRd
LnZhIGhhcyBhIHZhbHVlIG9mIHBybV9iYXNlIG9yIHByY21fbXB1X2Jhc2UgZGVwZW5kaW5nCj4g
PiA+ID4gb24gcGFydCB2YWx1ZShhcmNoL2FybS9tYWNoLW9tYXAyL3BybWluc3Q0NHh4LmM6NDQp
Cj4gPiA+ID4gRmFpbHVyZSBoYXBwZW5zIHdoZW4gX3BybV9iYXNlc1tPTUFQNDQzMF9QUkNNX01Q
VV9QQVJUSVRJT05dIGlzIHJlYWQuCj4gPiA+ID4gSXQncyB2YWx1ZSBzZXQgdXAgaW4gYXJjaC9h
cm0vbWFjaC1vbWFwMi9wcmNtX21wdTQ0eHguYzo1NC4KPiA+ID4gPiBUaGUgaW5zdGFsbGVkIHZh
bHVlIGlzIG9idGFpbmVkIHdpdGggT01BUF9MNF9JT19BRERSRVNTIG1hY3JvCj4gPiA+ID4gKG1h
Y2hfb21hcDIvaW8uYzo2NjcpLiBIZXJlIGlzIGl0cyBkZWZpbml0aW9uIChhcmNoL2FybS9tYWNo
X29tYXAyL2lvbWFwLmgpOgo+ID4gPiA+ICNkZWZpbmUgT01BUDJfTDRfSU9fT0ZGU0VUICAweGIy
MDAwMDAwCj4gPiA+ID4gI2RlZmluZSBPTUFQMl9MNF9JT19BRERSRVNTKHBhKSBJT01FTSgocGEp
ICsgT01BUDJfTDRfSU9fT0ZGU0VUKSAvKiBMNCAqLwo+ID4gPiA+Cj4gPiA+ID4gYW5kIElPTUVN
IChhcmNoL2FybS9pbmNsdWRlL2FzbS9pby5oKToKPiA+ID4gPiAjZGVmaW5lIElPTUVNKHgpICAg
ICgodm9pZCBfX2ZvcmNlIF9faW9tZW0gKikoeCkpCj4gPiA+ID4KPiA+ID4gPiBJIGRvbid0IHVu
ZGVyc3RhbmQgd2hhdCBpcyBoYXBwZW5pbmcgYW5kIGhvdyB0byBvdmVyY29tZSBpdC4KPiA+ID4g
Pgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBSZWdhcmRzLCBEZW5pcyBPYnJlemtvdgo+ID4gPgo+ID4g
Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
