Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E592159565
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 09:53:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hglfI-0004zl-Lq; Fri, 28 Jun 2019 07:51:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GzO1=U3=gmail.com=drhunter95@srs-us1.protection.inumbo.net>)
 id 1hglX4-0004Ey-DI
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 07:42:54 +0000
X-Inumbo-ID: 5592a9c8-9978-11e9-8980-bc764e045a96
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5592a9c8-9978-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 07:42:52 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so9798768edq.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2019 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cldJ4wltNDqYf5ImcWAMHd0sWn7q3F3GHN7bQ3qJURQ=;
 b=BzupfgLZ2meW8sr3NqwBzE0nMOw2vuGjh5HEU1SC0dXZumvdWRkCf1/vNT+HUCQUbB
 GuAgK5tlyEzeXI8BC/OIaKWfmD8bgm+ohErKGZSf59qNoE9O1K/VEEYWXtx1VmCxtZbC
 hfE2xnaRzIOj01p+hJOkBNJsch52WrZND+ZEorX9jabNH5XeiQf64W7ez4Cze07sGsGV
 DeXRoQ9ZrSzyP5G4BpNYfwVxnUY5ssqisMWeEmqNhA+MSVKxLH63qmRVDR80rEV/f1aO
 bwXVNgKwPRovk+uMZl2KfZC0+d/5alAWe6UYCTLTy2whvba1ek56RSlF3odIkmdO5FyF
 vEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cldJ4wltNDqYf5ImcWAMHd0sWn7q3F3GHN7bQ3qJURQ=;
 b=CkWC2gzEKmI/Q+QfdU7G2rhEsQq7WweYy4dS+4r96Zf0F0vVdG5kiykgl+ZeKWZF4/
 Yq1mza0GPp/E84aeQTlc3qzAFAxq8rupGhrTO1cSzp0oqyAdnEKDWhoKK+PxRMvjDGN1
 FhvudyYcw8yb8ehkvCCKuoDwZ/ZKlcnEusWQoHhK3sgGWCcIPOj1xkY8VlYjUUnyqTIa
 mvlCdYJglcdLA4Chl4COlyjq6grRMvwLDaTLIbHEk90KM8eQz18juqxygEKfKlg+N2Mt
 bQH5cNeSv/DnjfMirjBPcUWYg666Pax50Gl0nNf1Wogc6lwqfykxNTqoPDXmGvEycQ1R
 sb4g==
X-Gm-Message-State: APjAAAW9oxiLkrByzdd+J3LJULwjwZbmVb2YnA3IHOucc0p+G+RHyL8d
 oyvdWL8f5oLAeYfrayWUU+lSY/bj7PDUQFpFqyY=
X-Google-Smtp-Source: APXvYqyKFhrjqB04JbLRLBMA8Ln0G1l254j8bZTtgqNG4CS01uId7JTLSMJMeBujyP3QCzgV6PCjN8HcwrPqrKsRI3c=
X-Received: by 2002:a17:906:3612:: with SMTP id
 q18mr7449831ejb.278.1561707771640; 
 Fri, 28 Jun 2019 00:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
 <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
 <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
From: Iain Hunter <drhunter95@gmail.com>
Date: Fri, 28 Jun 2019 08:42:42 +0100
Message-ID: <CALC81-szbJK1xx--gqt-fDUQYN+_-WNdLeXi-Cut-wXRfFsFsQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailman-Approved-At: Fri, 28 Jun 2019 07:51:23 +0000
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
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubywgRGVuaXMsCgpJIGFjaGlldmVkIHRoYXQgd2l0aCBwYXRjaApwYXRjaGVzL3hlbi8w
MDAzLWFkZC1QUkNNX01QVS10by1tZW1vcnktdHJhbnNsYXRpb24tZm9yLUFNNTcyeC5wYXRjaC4K
VGhpcyBqdXN0IGFkZHMKIC5zcGVjaWZpY19tYXBwaW5nPW9tYXA1X3NwZWNpZmljX21hcHBpbmcK
dG8gRFJBNyBwbGF0Zm9ybS4KCklhaW4KCk9uIEZyaSwgMjggSnVuIDIwMTkgYXQgMDE6MzMsIFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBXcml0
aW5nIGhlcmUgYSBzdW1tYXJ5IG9mIHRoZSBmb2xsb3ctdXAgZGlzY3Vzc2lvbiBvbiBJUkMuCj4K
PiBUaGlzIGlzIGR1ZSB0byBhIG1hZ2ljIG1lbW9yeSByZWdpb24sIG5vdCBkZXNjcmliZWQgaW4g
dGhlIGRldmljZSB0cmVlLAo+IGJlaW5nIGFjY2Vzc2VkIGJ5IExpbnV4LiBUaGUgbWVtb3J5IHJl
Z2lvbiBpcyAweDQ4MjQzNDAwIC0gMHg0ODI0MzQwMCs1MTIuCj4KPiBUbyBmaXggcHJvYmxlbXMg
bGlrZSB0aGlzIG9uZSwgd2UgaGF2ZSB0aGUgcGxhdGZvcm0gc3BlY2lmaWMgZmlsZXMgaW4KPiB4
ZW46IHNlZSB0aGUgZmlsZXMgdW5kZXIgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy8uIFNwZWNpZmlj
YWxseSwgb21hcDUuYwo+IG1pZ2h0IGJlIGEgZ29vZCBtb2RlbCBmb3Igd2hhdCB3ZSBuZWVkLiBM
b29rIGF0IHRoZQo+IG9tYXA1X3NwZWNpZmljX21hcHBpbmcgZnVuY3Rpb24sIHdoaWNoIGRvZXMg
ZXhhY3RseSB3aGF0IHRoZSBuYW1lCj4gc3VnZ2VzdHM6IGl0IG1hcHMgc3BlY2lhbCBNTUlPIHJl
Z2lvbnMgaW50byB0aGUgZ3Vlc3QuCj4KPiAgLyogQWRkaXRpb25hbCBtYXBwaW5ncyBmb3IgZG9t
MCAobm90IGluIHRoZSBEVFMpICovCj4gIHN0YXRpYyBpbnQgb21hcDVfc3BlY2lmaWNfbWFwcGlu
ZyhzdHJ1Y3QgZG9tYWluICpkKQo+ICB7Cj4gICAgICAvKiBNYXAgdGhlIFBSTSBtb2R1bGUgKi8K
PiAgICAgIG1hcF9tbWlvX3JlZ2lvbnMoZCwgZ2FkZHJfdG9fZ2ZuKE9NQVA1X1BSTV9CQVNFKSwg
MiwKPiAgICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKE9NQVA1X1BSTV9CQVNFKSk7
Cj4KPiAgICAgIC8qIE1hcCB0aGUgUFJNX01QVSAqLwo+ICAgICAgbWFwX21taW9fcmVnaW9ucyhk
LCBnYWRkcl90b19nZm4oT01BUDVfUFJDTV9NUFVfQkFTRSksIDEsCj4gICAgICAgICAgICAgICAg
ICAgICAgIG1hZGRyX3RvX21mbihPTUFQNV9QUkNNX01QVV9CQVNFKSk7Cj4KPiAgICAgIC8qIE1h
cCB0aGUgV2FrZXVwIEdlbiAqLwo+ICAgICAgbWFwX21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19n
Zm4oT01BUDVfV0tVUEdFTl9CQVNFKSwgMSwKPiAgICAgICAgICAgICAgICAgICAgICAgbWFkZHJf
dG9fbWZuKE9NQVA1X1dLVVBHRU5fQkFTRSkpOwo+Cj4gICAgICAvKiBNYXAgdGhlIG9uLWNoaXAg
U1JBTSAqLwo+ICAgICAgbWFwX21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19nZm4oT01BUDVfU1JB
TV9QQSksIDMyLAo+ICAgICAgICAgICAgICAgICAgICAgICBtYWRkcl90b19tZm4oT01BUDVfU1JB
TV9QQSkpOwo+Cj4gICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gV2UgbmVlZCBzb21ldGhpbmcgc2lt
aWxhciBmb3IgMHg0ODI0MzQwMCAtIDB4NDgyNDM0MDArNTEyIG9uCj4gQmVhZ2xlYm9hcmQuCj4K
Pgo+IE9uIFRodSwgMjcgSnVuIDIwMTksIERlbmlzIE9icmV6a292IHdyb3RlOgo+ID4gQ0MnZWQg
b3RoZXIgR1NvQyBtZW50b3JzCj4gPgo+ID4gT24gNi8yNy8xOSA5OjUyIFBNLCBEZW5pcyBPYnJl
emtvdiB3cm90ZToKPiA+ID4gSGVsbG8gYWxsLAo+ID4gPgo+ID4gPiBJIGhhdmUgYSBmYWlsdXJl
IHdoZW4gSSBhbSB0cnlpbmcgdG8gYm9vdCBMaW51eCB3aXRoIFhlbiBvbiBiYi14MTUsIGhlcmUK
PiA+ID4gaXMgdGhlIGxvZzoKPiA+ID4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vQkJBRlBrVlUKPiA+
ID4KPiA+ID4gYW5kLCBhcyBKdWxpZW4gKGNjJ2VkKSBzdWdnZXN0ZWQgaGVyZSBpcyB0aGUgRFQg
ZGVidWcgaW5mb3JtYXRpb24gZm9yIHhlbjoKPiA+ID4gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29t
L29wZW4/aWQ9MTVZVHNDS1lVVGJHMmktc2lXZXpKWEtXdUcwSDFWZlF6Cj4gPiA+Cj4gPiA+IFNv
LCB3aGF0IEkgd2FzIGFibGUgdG8gZmlndXJlIG91dDoKPiA+ID4gSW4gb21hcDRfcHJtaW5zdF9y
ZWFkX2luc3RfcmVnIGl0IHRyaWVzIHRvIHJlYWQgZnJvbSBfcHJtX2Jhc2VzW3BhcnRdLnZhCj4g
PiA+IChhcmNoL2FybS9tYWNoLW9tYXAyL3BybWluc3Q0NHh4LmMpLgo+ID4gPiBfcHJtX2Jhc2Vz
W3BhcnRdLnZhIGhhcyBhIHZhbHVlIG9mIHBybV9iYXNlIG9yIHByY21fbXB1X2Jhc2UgZGVwZW5k
aW5nCj4gPiA+IG9uIHBhcnQgdmFsdWUoYXJjaC9hcm0vbWFjaC1vbWFwMi9wcm1pbnN0NDR4eC5j
OjQ0KQo+ID4gPiBGYWlsdXJlIGhhcHBlbnMgd2hlbiBfcHJtX2Jhc2VzW09NQVA0NDMwX1BSQ01f
TVBVX1BBUlRJVElPTl0gaXMgcmVhZC4KPiA+ID4gSXQncyB2YWx1ZSBzZXQgdXAgaW4gYXJjaC9h
cm0vbWFjaC1vbWFwMi9wcmNtX21wdTQ0eHguYzo1NC4KPiA+ID4gVGhlIGluc3RhbGxlZCB2YWx1
ZSBpcyBvYnRhaW5lZCB3aXRoIE9NQVBfTDRfSU9fQUREUkVTUyBtYWNybwo+ID4gPiAobWFjaF9v
bWFwMi9pby5jOjY2NykuIEhlcmUgaXMgaXRzIGRlZmluaXRpb24gKGFyY2gvYXJtL21hY2hfb21h
cDIvaW9tYXAuaCk6Cj4gPiA+ICNkZWZpbmUgT01BUDJfTDRfSU9fT0ZGU0VUICAweGIyMDAwMDAw
Cj4gPiA+ICNkZWZpbmUgT01BUDJfTDRfSU9fQUREUkVTUyhwYSkgSU9NRU0oKHBhKSArIE9NQVAy
X0w0X0lPX09GRlNFVCkgLyogTDQgKi8KPiA+ID4KPiA+ID4gYW5kIElPTUVNIChhcmNoL2FybS9p
bmNsdWRlL2FzbS9pby5oKToKPiA+ID4gI2RlZmluZSBJT01FTSh4KSAgICAoKHZvaWQgX19mb3Jj
ZSBfX2lvbWVtICopKHgpKQo+ID4gPgo+ID4gPiBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyBo
YXBwZW5pbmcgYW5kIGhvdyB0byBvdmVyY29tZSBpdC4KPiA+ID4KPiA+Cj4gPiAtLQo+ID4gUmVn
YXJkcywgRGVuaXMgT2JyZXprb3YKPiA+Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
