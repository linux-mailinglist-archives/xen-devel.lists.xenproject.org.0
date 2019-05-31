Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE49315EA
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 22:12:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWnpc-0002Th-Pc; Fri, 31 May 2019 20:08:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u5H8=T7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hWnpa-0002Tc-S2
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 20:08:50 +0000
X-Inumbo-ID: e695911f-83df-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e695911f-83df-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 20:08:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8823524F6A;
 Fri, 31 May 2019 20:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559333327;
 bh=MdcSaMEXmtsZ0f9YzeDP8Eu2/8h0nrjT7kQ2Oa6/XRE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=B/UdJ9M7vNJHBJwiVLhGllsWiYEhIiKFrVieYpIXj25tVljEYQOHQRHQ9j+sqrQFf
 Gk0Hu1AoBIejOOVmZXyHRDLUJFRhpmqzodYKOvmE4is1U0Os3kEu47lAnnDV91n1ur
 ZPhKxQ8vOg+kdymseCdeNVROKj+x4uAjX5A46x7I=
Date: Fri, 31 May 2019 13:08:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <4d27c123-826d-ad07-ed0a-e7a7517fca62@arm.com>
Message-ID: <alpine.DEB.2.21.1905311308130.20498@sstabellini-ThinkPad-T480s>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
 <4d27c123-826d-ad07-ed0a-e7a7517fca62@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAzMSBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJpaSwKPiAK
PiBPbiAzMC8wNS8yMDE5IDE3OjEyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+ID4gT24gMjkuMDUu
MTkgMTg6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSXQgd291bGQgaGF2ZSBiZWVuIG5p
Y2UgdG8gYXQgbGVhc3QgZml4IHVwIHRoZSBjb21taXQgbWVzc2FnZSB3aXRoIHRoZQo+ID4gPiB0
eXBvZXMgKGFuZCByZXdvcmRpbmcpIEkgbWVudGlvbmVkIGluIG15IHByZXZpb3VzIGUtbWFpbC4K
PiA+ID4gWW91ciBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBleHBsYWluZWQgd2h5IHRoaXMgaXMg
ZmluZSB0byBrZWVwIHRoZQo+ID4gPiBpbnRlcnJ1cHQgbWFza2VkIGEgYml0IGxvbmdlci4gSSB3
cm90ZSB0aGUgZXhwbGFuYXRpb24gaW4gbXkgcHJldmlvdXMKPiA+ID4gZS1tYWlsIHNvIHlvdSBj
YW4gYm9ycm93IHRoZSByYXRpb25hbGUgZnJvbSB0aGVyZS4KPiA+IHhlbi9hcm06IGdpYzogRGVm
ZXIgdGhlIGRlY2lzaW9uIHRvIHVubWFzayBpbnRlcnJ1cHRzIHRvIGRvX3tMUEksIElSUX0oKQo+
ID4gCj4gPiBIYXZpbmcgaXJxcyBlbmFibGVkIGhlcmUgbGVhdmVzIGEgcm9vbSBmb3IgdHJhcHBp
bmcgYW5kIGdvaW5nIHRocm91Z2ggdGhlCj4gPiB0cmFwCj4gCj4gUGxlYXNlIGF2b2lkICJoZXJl
IiBpbiBjb21taXQgbWVzc2FnZSBpZiB5b3UgaGF2ZW4ndCBkZWZpbmVkIHdoZXJlIGlzIHRoZQo+
IGlzc3VlLgo+IAo+ID4gcGF0aCBhZ2FpbiBpZiB3ZSBoYXZlIGEgbmV3IGd1ZXN0IGludGVycnVw
dCBhcnJpdmVkIChldmVuIHdpdGggdGhlIHNhbWUgb3IKPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQg
dGhlICJuZXcgZ3Vlc3QgaW50ZXJydXB0IGFycml2ZWQiLgo+IAo+ID4gbG93ZXIgcHJpb3JpdHks
IGFmdGVyIGBkZXNjLT5oYW5kbGVyLT5lbmQoZGVzYylgIGluIGBkb19JUlEoKWApLgo+ID4gS2Vl
cGluZyBpbnRlcnJ1cHRzIGRpc2FibGVkIGR1cmluZyBndWVzdCBpbnRlcnJ1cHRzIHByb2Nlc3Np
bmcgYWxsb3dzIGFzCj4gCj4gTWlzc2luZyB3b3JkIGJlY2F1c2UgImFsbG93cyIgYW5kICJhcyI/
Cj4gCj4gPiBhdm9pZGluZyBleGNlc3NpdmUgdHJhcHMgKGFuZCB3YXN0aW5nIGNwdSBjeWNsZXMg
Zm9yIHRyYXAgcGF0aCkgd2hpbGUgdGhlCj4gPiBuZXcKPiA+IGludGVycnVwdHMgd291bGQgYmUg
cHJvY2Vzc2VkIGluIHRoZSBsb29wIGFueXdheS4gUHJvY2Vzc2luZyBndWVzdAo+ID4gaW50ZXJy
dXB0cyBieQo+ID4gdGhlIGxvb3Agc2hvdWxkIG5vdCBpbnRyb2R1Y2Ugc2lnbmlmaWNhbnQgYWRk
aXRpb25hbCBsYXRlbmN5IGJlY2F1c2UKPiAKPiBJIGFtIGFsd2F5cyB3b3JyeSB3aGVuIEkgc2Vl
IHRoZSB3b3JkICJzaG91bGQgbm90IiBhc3NvY2lhdGVkIHdpdGggImxhdGVuY3kiCj4gYmVjYXVz
ZSBvZnRlbiBpdCBpcyBhY3R1YWxseSB0aGUgY29udHJhcnkgKHNlZSB0aGUgcmVjZW50IGF0dGVt
cHQgdG8gb3B0aW1pemUKPiB0aGUgb2xkIHZHSUMpLiBJZiB5b3UgZG9uJ3QgaGF2ZSBudW1iZXIs
IHRoZW4geW91IHNob3VsZCBkZXRhaWwgdGhlIHJhdGlvbmFsZQo+IGhlcmUuCj4gCj4gVGhlIG1v
cmUgSSB0aGluayBhYm91dCBpdCwgdGhlIG1vcmUgSSBmZWVsIGl0IHdvdWxkIGp1c3QgYmUgYmVz
dCB0byBtYXNrIHRoZQo+IGludGVycnVwdCBqdXN0IGJlZm9yZSBkcm9wcGluZyB0aGUgcHJpb3Jp
dHkuIEJ1dCBJIGFtIGhhcHB5IHRvIGNvbnNpZGVyIHRoaXMKPiBpZiB5b3UgaGF2ZSBzb21lIGdy
b3VuZCB0byBiYWNrIHRoZSBhcHByb2FjaCAodGhleSBzaG91bGQgYmUgcGFydCBvZiB0aGUKPiBj
b21taXQgbWVzc2FnZSkuCj4gCj4gPiB2Z2ljX2luamVjdF9pcnEoLi4uKSBhbHJlYWR5IG1hc2tp
bmcgdGhlIGludGVycnVwdHMgaW4gbW9zdCBvZiB0aGUgY2FzZXMuCj4gCj4gSGVyZSBteSB0YWtl
IG9uIHRoZSBjb21taXQgbWVzc2FnZToKPiAKPiBnaWNfaW50ZXJydXB0KCkgd2FzIGltcGxlbWVu
dGVkIHVzaW5nIGEgbG9vcCB0byBsaW1pdCB0aGUgY29zdCBvZiB0aGUgdHJhcCBpZgo+IHRoZXJl
IGFyZSBtdWx0aXBsZSBpbnRlcnJ1cHRzIHBlbmRpbmcuCj4gCj4gQXQgdGhlIG1vbWVudCwgaW50
ZXJydXB0cyBhcmUgdW5tYXNrZWQgYnkgZ2ljX2ludGVycnVwdCgpIGJlZm9yZSBjYWxsaW5nCj4g
ZG9fe0lSUSwgTFBJfSgpLiBJbiB0aGUgY2FzZSBvZiBoYW5kbGluZyBhbiBpbnRlcnJ1cHQgcm91
dGVkIHRvIGd1ZXN0cywgaXRzCj4gcHJpb3JpdHkgd2lsbCBiZSBkcm9wcGVkLCB2aWEgZGVzYy0+
aGFuZGxlci0+ZW5kKCkgY2FsbGVkIGZyb20gZG9faXJxKCksIHdpdGgKPiBpbnRlcnJ1cHQgdW5t
YXNrZWQuCj4gCj4gSW4gb3RoZXIgd29yZHM6Cj4gICAgIC0gVW50aWwgdGhlIHByaW9yaXR5IGlz
IGRyb3BwZWQsIG9ubHkgaGlnaGVyIHByaW9yaXR5IGludGVycnVwdCBjYW4gYmUKPiByZWNlaXZl
ZC4gVG9kYXksIG9ubHkgWGVuIGludGVycnVwdHMgaGF2ZSBoaWdoZXIgcHJpb3JpdHkuCj4gICAg
IC0gQXMgc29vbiBhcyBwcmlvcml0eSBpcyBkcm9wcGVkLCBhbnkgaW50ZXJydXB0IGNhbiBiZSBy
ZWNlaXZlZC4KPiAKPiBUaGlzIG1lYW5zIHRoZSBwdXJwb3NlIG9mIHRoZSBsb29wIGluIGdpY19p
bnRlcnJ1cHQoKSBpcyBkZWZlYXRlZCBhcyBhbGwKPiBpbnRlcnJ1cHRzIG1heSBnZXQgdHJhcHBl
ZCBlYXJsaWVyLiBUbyByZWluc3RhdGUgdGhlIHB1cnBvc2Ugb2YgdGhlIGxvb3AgKGFuZAo+IHBy
ZXZlbnQgdGhlIHRyYXApLCBpbnRlcnJ1cHRzIHNob3VsZCBiZSBtYXNrZWQgd2hlbiBkcm9wcGlu
ZyB0aGUgcHJpb3JpdHkuCj4gCj4gRm9yIGludGVycnVwdHMgcm91dGVkIHRvIFhlbiwgcHJpb3Jp
dHkgd2lsbCBhbHdheXMgYmUgZHJvcHBlZCB3aXRoIGludGVycnVwdHMKPiBtYXNrZWQuIFNvIHRo
ZSBpc3N1ZSBpcyBub3QgcHJlc2VudC4gSG93ZXZlciwgaXQgbWVhbnMgdGhhdCB3ZSBhcmUgcG9p
bnRsZXNzCj4gdHJ5IHRvIG1hc2sgdGhlIGludGVycnVwdHMuCj4gCj4gVG8gYXZvaWQgY29uZmxp
Y3RpbmcgYmVoYXZpb3IgYmV0d2VlbiBpbnRlcnJ1cHQgaGFuZGxpbmcsIGdpY19pbnRlcnJ1cHQo
KSBpcwo+IG5vdyBrZWVwaW5nIGludGVycnVwdHMgbWFza2VkIGFuZCBkZWZlciB0aGUgZGVjaXNp
b24gdG8gZG9fe0xQSSwgSVJRfS4KClRoaXMgaXMgYSByZWFsbHkgd2VsbCB3cml0dGVuIGNvbW1p
dCBtZXNzYWdlLCBhbmQgdG9nZXRoZXIgd2l0aCB0aGUKcGF0Y2ggaXQgbG9va3MgZmluZSB0byBt
ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
