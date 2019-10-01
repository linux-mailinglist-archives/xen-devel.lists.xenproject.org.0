Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5EC3FCA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 20:25:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFMoK-0007Lv-Im; Tue, 01 Oct 2019 18:23:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFMoJ-0007Lq-4I
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 18:23:43 +0000
X-Inumbo-ID: 98c93de0-e478-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 98c93de0-e478-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 18:23:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17FC820815;
 Tue,  1 Oct 2019 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569954221;
 bh=30tHIqsDuyS4f8J3OK28SndY+e+8UaTT56u/QQWRHho=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=odQoLLf6OCmnd+DWoF7HNvP7+n/w0zmHVkSI99DuU6myj5pv1WWcCBm02zyGc19Ql
 RqhAf1pvzE9QSnQhfdbwVrNyySAi8t7B6csVibpVIxtSEsZdmCyN3l7qyHCr1caS14
 uvWycia7O0XMDdyBU6ueyO+7Nfv74WN1/PWZBNzA=
Date: Tue, 1 Oct 2019 11:23:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rob Herring <robh@kernel.org>
In-Reply-To: <CAL_JsqKJP3itMOueZD7fGH2b6VNFrTuozW5tWyKN3uBg4gYMzA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1910011112020.20899@sstabellini-ThinkPad-T480s>
References: <20190925215006.12056-1-robh@kernel.org>
 <e898c025-32a7-1d2c-3501-c99556f7cdd4@arm.com>
 <1ae7f42e-bf93-b335-b543-653fae5cf49f@epam.com>
 <28440326-ed76-b014-c1b8-02125c3214b9@arm.com>
 <f63f55eb-969e-6364-5781-a227d0c04e4c@epam.com>
 <CAL_JsqKJP3itMOueZD7fGH2b6VNFrTuozW5tWyKN3uBg4gYMzA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC PATCH] xen/gntdev: Stop abusing DT
 of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNiBTZXAgMjAxOSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBTZXAgMjYs
IDIwMTkgYXQgNjoxNiBBTSBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbwo+IDxPbGVrc2FuZHJfQW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gOS8yNi8xOSAxOjQ2IFBNLCBS
b2JpbiBNdXJwaHkgd3JvdGU6Cj4gPiA+IE9uIDIwMTktMDktMjYgMTE6MTcgYW0sIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+ID4gPj4KPiA+ID4+IE9uIDkvMjYvMTkgMTI6NDkgUE0s
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4+PiBIaSBSb2IsCj4gPiA+Pj4KPiA+ID4+Pgo+ID4g
Pj4+IE9uIDkvMjUvMTkgMTA6NTAgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gPj4+PiBBcyB0
aGUgY29tbWVudCBzYXlzLCB0aGlzIGlzbid0IGEgRFQgYmFzZWQgZGV2aWNlLiBvZl9kbWFfY29u
ZmlndXJlKCkKPiA+ID4+Pj4gaXMgZ29pbmcgdG8gc3RvcCBhbGxvd2luZyBhIE5VTEwgRFQgbm9k
ZSwgc28gdGhpcyBuZWVkcyB0byBiZSBmaXhlZC4KPiA+ID4+Pgo+ID4gPj4+IEFuZCB0aGlzIGNh
bid0IHdvcmsgb24gYXJjaCBub3Qgc2VsZWN0aW5nIENPTkZJR19PRiBhbmQgY2FuIHNlbGVjdAo+
ID4gPj4+IENPTkZJR19YRU5fR1JBTlRfRE1BX0FMTE9DLgo+ID4gPj4+Cj4gPiA+Pj4gV2UgYXJl
IGx1Y2t5IGVub3VnaCBvbiB4ODYgYmVjYXVzZSwgQUZBSUNULCBhcmNoX3NldHVwX2RtYV9vcHMg
aXMganVzdAo+ID4gPj4+IGEgbm9wLgo+ID4gPj4+Cj4gPiA+PiBObyBsdWNrIGlzIG5lZWRlZCBh
cyBbMV0gZG9lcyBub3RoaW5nIGZvciB0aG9zZSBwbGF0Zm9ybXMgbm90IHVzaW5nCj4gPiA+PiBD
T05GSUdfT0YKPiA+ID4+Pj4KPiA+ID4+Pj4gTm90IHN1cmUgZXhhY3RseSB3aGF0IHNldHVwIGJl
c2lkZXMgYXJjaF9zZXR1cF9kbWFfb3BzIGlzIG5lZWRlZC4uLgo+ID4gPj4+Cj4gPiA+Pj4gV2Ug
cHJvYmFibHkgd2FudCB0byB1cGRhdGUgZG1hX21hc2ssIGNvaGVyZW50X2RtYV9tYXNrIGFuZAo+
ID4gPj4+IGRtYV9wZm5fb2Zmc2V0Lgo+ID4gPj4+Cj4gPiA+Pj4gQWxzbywgd2hpbGUgbG9vayBh
dCBvZl9jb25maWd1cmVfZG1hLCBJIG5vdGljZWQgdGhhdCB3ZSBjb25zaWRlciB0aGUKPiA+ID4+
PiBETUEgd2lsbCBub3QgYmUgY29oZXJlbnQgZm9yIHRoZSBncmFudC10YWJsZS4gT2xla3NhbmRy
LCBkbyB5b3Uga25vdwo+ID4gPj4+IHdoeSB0aGV5IGNhbid0IGJlIGNvaGVyZW50Pwo+ID4gPj4g
VGhlIG1haW4gYW5kIHRoZSBvbmx5IHJlYXNvbiB0byB1c2Ugb2ZfY29uZmlndXJlX2RtYSBpcyB0
aGF0IGlmIHdlIGRvbid0Cj4gPiA+PiB0aGVuIHdlCj4gPiA+PiBhcmUgYWJvdXQgdG8gc3RheSB3
aXRoIGRtYV9kdW1teV9vcHMgWzJdLiBJdCBlZmZlY3RpdmVseSBtZWFucyB0aGF0Cj4gPiA+PiBv
cGVyYXRpb25zIG9uIGRtYS1idWZzCj4gPiA+PiB3aWxsIGVuZCB1cCByZXR1cm5pbmcgZXJyb3Jz
LCBsaWtlIFszXSwgWzRdLCB0aHVzIG5vdCBtYWtpbmcgaXQgcG9zc2libGUKPiA+ID4+IGZvciBY
ZW4gUFYgRFJNIGFuZCBETUEKPiA+ID4+IHBhcnQgb2YgZ250ZGV2IGRyaXZlciB0byBkbyB3aGF0
IHdlIG5lZWQgKGRtYS1idWZzIGluIG91ciB1c2UtY2FzZXMKPiA+ID4+IGFsbG93IHplcm8tY29w
eWluZwo+ID4gPj4gd2hpbGUgdXNpbmcgZ3JhcGhpY3MgYnVmZmVycyBhbmQgbWFueSBtb3JlKS4K
PiA+ID4+Cj4gPiA+PiBJIGRpZG4ndCBmaW5kIGFueSBiZXR0ZXIgd2F5IG9mIGFjaGlldmluZyB0
aGF0LCBidXQgb2ZfY29uZmlndXJlX2RtYS4uLgo+ID4gPj4gSWYgdGhlcmUgaXMgYW55IGJldHRl
ciBzb2x1dGlvbiB3aGljaCB3aWxsIG5vdCBicmVhayB0aGUgZXhpc3RpbmcKPiA+ID4+IGZ1bmN0
aW9uYWxpdHkgdGhlbgo+ID4gPj4gSSB3aWxsIGRlZmluaXRlbHkgY2hhbmdlIHRoZSBkcml2ZXJz
IHNvIHdlIGRvIG5vdCBhYnVzZSBEVCApCj4gPiA+PiBCZWZvcmUgdGhhdCwgcGxlYXNlIGtlZXAg
aW4gbWluZCB0aGF0IG1lcmdpbmcgdGhpcyBSRkMgd2lsbCBicmVhayBYZW4gUFYKPiA+ID4+IERS
TSArCj4gPiA+PiBETUEgYnVmIHN1cHBvcnQgaW4gZ250ZGV2Li4uCj4gPiA+PiBIb3BlIHdlIGNh
biB3b3JrIG91dCBzb21lIGFjY2VwdGFibGUgc29sdXRpb24sIHNvIGV2ZXJ5b25lIGlzIGhhcHB5
Cj4gPiA+Cj4gPiA+IEFzIEkgbWVudGlvbmVkIGVsc2V3aGVyZSwgdGhlIHJlY2VudCBkbWEtZGly
ZWN0IHJld29yayBtZWFucyB0aGF0Cj4gPiA+IGRtYV9kdW1teV9vcHMgYXJlIG5vdyBvbmx5IGV4
cGxpY2l0bHkgaW5zdGFsbGVkIGZvciB0aGUgQUNQSSBlcnJvcgo+ID4gPiBjYXNlLCBzbyAtIG11
Y2ggYXMgSSBtYXkgZGlzbGlrZSBpdCAtIHlvdSBzaG91bGQgZ2V0IHJlZ3VsYXIKPiA+ID4gKGRp
cmVjdC9TV0lPVExCKSBvcHMgYnkgZGVmYXVsdCBhZ2Fpbi4KPiA+IEFoLCBteSBiYWQsIEkgbWlz
c2VkIHRoYXQgY2hhbmdlLiBTbywgaWYgbm8gZHVtbXkgZG1hIG9wcyBhcmUgdG8gYmUgdXNlZAo+
ID4gdGhlbgo+ID4gSSBiZWxpZXZlIHdlIGNhbiBhcHBseSBib3RoIGNoYW5nZXMsIGUuZy4gcmVt
b3ZlIG9mX2RtYV9jb25maWd1cmUgZnJvbQo+ID4gYm90aCBvZiB0aGUgZHJpdmVycy4KPiAKPiBX
aGF0IGFib3V0IHRoZSBkbWEgbWFza3M/IEkgdGhpbmsgdGhlcmUncyBhIGRlZmF1bHQgc2V0dXAs
IGJ1dCBpdCBpcwo+IGNvbnNpZGVyZWQgYSBkcml2ZXIgYnVnIHRvIG5vdCBzZXQgaXRzIG1hc2su
IHhlbl9kcm1fZnJvbnQgc2V0cyB0aGUKPiBjb2hlcmVudF9kbWFfbWFzayAod2h5IG9ubHkgMzIt
Yml0cyB0aG91Z2g/KSwgYnV0IG5vdCB0aGUgZG1hX21hc2suCj4gZ250ZGV2IGlzIGRvaW5nIG5l
aXRoZXIuIEkgY291bGQgY29weSBvdXQgd2hhdCBvZl9kbWFfY29uZmlndXJlIGRvZXMKPiBidXQg
YmV0dGVyIGZvciB0aGUgWGVuIGZvbGtzIHRvIGRlY2lkZSB3aGF0IGlzIG5lZWRlZCBvciBub3Qg
YW5kIHRlc3QKPiB0aGUgY2hhbmdlLiBJJ20gbm90IHNldHVwIHRvIHRlc3QgYW55IG9mIHRoaXMu
CgpGWUkgSSBoYXZlIHNlZW4gdGhlIGlzc3VlIE9sZWtzYW5kciBpcyB0YWxraW5nIGFib3V0IHRv
by4gSSBjb25maXJtIHRoYXQKdGhlIG9ubHkgcmVhc29uIGZvciB0aGUgb2ZfY29uZmlndXJlX2Rt
YSBjYWxsIGlzIHRvIGdldCBhd2F5IGZyb20gdGhlCmR1bW15X2RtYV9vcHMgYW5kIHVzZSB0aGUg
ZGVmYXVsdCBkbWFfb3BzIGluc3RlYWQuIEkgdGhpbmsgdGhpcyBzaG91bGQKYmUgbWVudGlvbmVk
IGluIHRoZSBjb21taXQgbWVzc2FnZSBzbyB0aGF0IGlmIG9uZSBkYXkgdGhlIGJlaGF2aW9yCnJl
Z2FyZGluZyBkdW1teV9kbWFfb3BzIGNoYW5nZXMgb25lIG1vcmUgdGltZSwgaG9wZWZ1bGx5IHdl
J2xsIGJlIGFibGUKdG8gZmlndXJlIG91dCB0aGUgaXNzdWUgbW9yZSBlYXNpbHkgd2l0aCBiaXNl
Y3Rpb24uCgpJbiByZWdhcmRzIHRvIHRoZSBjb2hlcmVudF9kbWFfbWFzayBhbmQgZG1hX21hc2ss
IEkgY2FuJ3Qgc2VlIHdoeSBnbnRkZXYKd291bGQgaGF2ZSBhbnkgZG1hIGFkZHJlc3NpbmcgbGlt
aXRhdGlvbnMsIHNvIHdlIHNob3VsZCBiZSBhYmxlIHRvIHNldApib3RoIHRvIDY0IGJpdHMuICBJ
IGFsc28gY2FuJ3Qgc2VlIHdoeSB4ZW5fZHJtX2Zyb250IHdvdWxkIGxpbWl0IGl0IHRvCjMyIGJp
dHMsIGFmdGVyIGFsbCB0aGlzIGlzIGp1c3QgdGhlIGZyb250ZW5kLCBpZiBhbnl0aGluZyBpdCB3
b3VsZCBiZQp0aGUgYmFja2VuZCB0aGF0IGhhcyBhIGxpbWl0YXRpb24uIFNvLCB3ZSBzaG91bGQg
YmUgYWJsZSB0byBzZXQgYm90aApkbWFfbWFzayBhbmQgY29oZXJlbnRfZG1hX21hc2sgaW4geGVu
X2RybV9mcm9udCB0byA2NCBiaXRzLiBPbGVrc2FuZHIsCmNhbiB5b3UgY29uZmlybT8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
