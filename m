Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C7D168A57
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 00:21:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5HYn-0008Lc-JF; Fri, 21 Feb 2020 23:18:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j5HYm-0008LX-0M
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 23:18:16 +0000
X-Inumbo-ID: 6f757d02-5500-11ea-b0fd-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f757d02-5500-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 23:18:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b15so2685994lfc.4
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 15:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zMs4hZpmDDJoAvUQW1ufuKSDvdgBVX3kB75ZjVVp+mQ=;
 b=K4dCxTEvkr/53wPOhgwTRE+yNauIlR25nC4PA282DeNxiTnu7IaqVFmUCxwXwNj9eb
 WMsPajcBwPvybmiNb6bvMsqXQr/tOjpOsuTrQ+oqExPL0p3lRrs0qRQBEKk6k51In/uT
 zi55f65t9rQzfP3YwR8LKyR4xDpU8C+v4Nvs+5PxIpdEoyiDiJ4FSWiw+bZN1R0bthJm
 evlS/VWwjsrOf3vYTqr4lPWiZcO7ct1jG3+tYtMs2Xbw7SiM4hJMAjiWcxjuXNLWYDwJ
 R0MM11LnkzHfIcVjx5tRc3YbZnSmGJpM+O/rVnTH+gLF4Qg6KMOCXS/NQb6AsUV4jNDN
 k5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMs4hZpmDDJoAvUQW1ufuKSDvdgBVX3kB75ZjVVp+mQ=;
 b=VoKxydej9h1myol9nr3iar+77uI6s+P2m7NpWcKFPdzltm5lrzpkcaC3kVm/hU5v9x
 fs1pK6kPuSyvvwAhQVxq5b1EkdTx21hgJVlMhrUvkqKHj4Cpnm3R6xVbacvhIlg+VrYt
 3OwGu5eDLxXRG8+I/+QItemSVQ5ueSpkuv90bLISg2D/v/X0w+Cybg0qZo0mt2L2IHdz
 8DvFZfnJP/nVUAhrVmBa1SLJc95GwulZ26NZ/1iVmq5VNzktq+ajZQoWaT3Kd4ul3F8T
 p7zaTZxbUv2UtQn+AOVD3FjTmuoX+Ppy7XCDBaSDrSenWvo6zRP+NceZRyNnIGGxZ7Yy
 xtcQ==
X-Gm-Message-State: APjAAAUyu8/0+0r8sE45KcLsXR0R4cYGYcWyo+GY3CYOaLLTL8jJ2mgU
 oEZlWfqmxQe1uhYx0CDvFHUu1sKDon8kNIT7SRs=
X-Google-Smtp-Source: APXvYqyfnjXcdWw30iiIoei913j1jkkH9CUGChDtd2rRb4lyiFdLviCkmUikY7tdV1VkI0E3Brps+LIVsrvTci3ndu0=
X-Received: by 2002:a19:3f4f:: with SMTP id m76mr2538608lfa.63.1582327094172; 
 Fri, 21 Feb 2020 15:18:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <08d22ed5ffef1d947b819606aafa6414a16bed0b.1582310142.git.tamas.lengyel@intel.com>
 <4b27cc09-8578-8fa1-2a7e-858d1767353a@xen.org>
 <CABfawhmN=93bF3-qz-b7r7U6xuq9=OOFFzJ88PcM4dwXJpkL=g@mail.gmail.com>
 <00efc255-1941-2dd2-2ddd-2f2e25af7d32@xen.org>
 <CABfawhn4N=nFVj1koV-0pt2m0=Fh6tX5Zswepen69-=zFm0dgA@mail.gmail.com>
In-Reply-To: <CABfawhn4N=nFVj1koV-0pt2m0=Fh6tX5Zswepen69-=zFm0dgA@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 21 Feb 2020 23:18:02 +0000
Message-ID: <CAJ=z9a05pqEhwfsXL=P9U6Ge_7JXtv=Qt0dpF4X3abViWDjzhg@mail.gmail.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [Xen-devel] [PATCH v9 2/5] xen: add parent_domid field to
 createdomain domctl
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMSBGZWIgMjAyMCBhdCAyMjo1MywgVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5rLmxl
bmd5ZWxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDM6MzQg
UE0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgVGFtYXMs
Cj4gPgo+ID4gT24gMjEvMDIvMjAyMCAyMTozNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4g
PiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAyOjAzIFBNIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IEhpIFRhbWFzLAo+ID4gPj4KPiA+ID4+IE9uIDIx
LzAyLzIwMjAgMTg6NDksIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4+PiBXaGVuIGNyZWF0
aW5nIGEgZG9tYWluIHRoYXQgd2lsbCBiZSB1c2VkIGFzIGEgVk0gZm9yayBzb21lIGluZm9ybWF0
aW9uIGlzCj4gPiA+Pj4gcmVxdWlyZWQgdG8gc2V0IHRoaW5ncyB1cCBwcm9wZXJseSwgbGlrZSB0
aGUgbWF4X3ZjcHVzIGNvdW50LiBJbnN0ZWFkIG9mIHRoZQo+ID4gPj4+IHRvb2xzdGFjayBoYXZp
bmcgdG8gZ2F0aGVyIHRoaXMgaW5mb3JtYXRpb24gZm9yIGVhY2ggZm9yayBpbiBhIHNlcGFyYXRl
Cj4gPiA+Pj4gaHlwZXJjYWxsIHdlIGNhbiBqdXN0IGluY2x1ZGUgdGhlIHBhcmVudCBkb21haW4n
cyBpZCBpbiB0aGUgY3JlYXRlZG9tYWluIGRvbWN0bAo+ID4gPj4+IHNvIHRoYXQgWGVuIGNhbiBj
b3B5IHRoZSBzZXR0aW5nIHdpdGhvdXQgdGhlIGV4dHJhIHRvb2xzdGFjayBxdWVyaWVzLgo+ID4g
Pj4KPiA+ID4+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aHkgeW91IG9ubHkgd2FudCB0byBj
b3B5IG1heF92Y3B1cy4gRnJvbSBteQo+ID4gPj4gdW5kZXJzdGFuZGluZywgIHdoZW4geW91IGFy
ZSBnb2luZyB0byBmb3JrIGEgZG9tYWluIHlvdSB3aWxsIHdhbnQgdGhlCj4gPiA+PiBkb21haW4g
dG8gYmUgbmVhcmx5IGlkZW50aWNhbC4gU28gaG93IGRvIHlvdSBkZWNpZGUgd2hhdCB0byBjb3B5
Pwo+ID4gPgo+ID4gPiBBbGwgcGFyYW1ldGVycyBvZiB0aGUgcGFyZW50IGRvbWFpbiBuZWVkIHRv
IGJlIGNvcGllZCwgYnV0IGR1cmluZwo+ID4gPiBjcmVhdGVkb21haW4gZG9tY3RsIG9ubHkgbWF4
X3ZjcHVzIGlzIHJlcXVpcmVkLiBUaGUgcmVzdCBhcmUgY29waWVkCj4gPiA+IGR1cmluZyBYRU5N
RU1fc2hhcmluZ19vcF9mb3JrLgo+ID4KPiA+IEkgZG9uJ3QgYmVsaWV2ZSBtYXhfdmNwdXMgaXMg
dGhlIG9ubHkgZmllbGQgcmVxdWlyZWQgaGVyZS4gTW9zdCBvZiB0aGUKPiA+IGluZm9ybWF0aW9u
IGhvbGQgaW4gdGhlIHN0cnVjdHVyZSBhcmUgcmVxdWlyZWQgYXQgY3JlYXRpb24gdGltZSBzbyB0
aGUKPiA+IGRvbWFpbiBpcyBjb25maWd1cmVkIGNvcnJlY3RseS4gRm9yIGluc3RhbmNlLCBvbiBB
cm0sIHRoZSB2ZXJzaW9uIG9mCj4gPiBpbnRlcnJ1cHQgY29udHJvbGxlciBjYW4gb25seSBiZSBj
b25maWd1cmVkIGF0IGNyZWF0aW9uIHRpbWUuIEZvciB4ODYsIEkKPiA+IGFtIHByZXR0eSBzdXJl
IHRoZSBlbXVmbGFncyBoYXZlIHRvIGJlIGNvcnJlY3QgYXQgY3JlYXRpb24gdGltZSBhcyB3ZWxs
Lgo+ID4KPiA+IFNvIGl0IGZlZWxzIHdlaXJkIHRvIG1lIHRoYXQgeW91IG9ubHkgbmVlZCB0byBj
b3B5IG1heF92Y3B1cyBoZXJlLgo+ID4gQmVjYXVzZSBpZiB5b3UgYXJlIGFibGUgdG8gZmlsbCB1
cCB0aGUgb3RoZXIgZmllbGRzIG9mIHRoZSBzdHJ1Y3R1cmUsCj4gPiB0aGVuIG1vc3QgbGlrZWx5
IHlvdSBoYXZlIHRoZSBtYXhfdmNwdXMgaW4gaGFuZCBhcyB3ZWxsLgo+Cj4gTG9vayBhdCBwYXRj
aCA1IGFuZCBzZWUgaG93IGxpYnhsIHN0YXRpY2FsbHkgZGVmaW5lIG1vc3Qgb2YgdGhlc2UKPiB2
YWx1ZXMgYW5kIHdoeSB3ZSBkb24ndCBuZWVkIHRvIGNvcHkgdGhlbS4KCkkgbG9va2VkIGF0IHBh
dGNoIDUsIHRoaXMgaXMgYW4gZXhhbXBsZSBvZiB0aGUgaW1wbGVtZW50YXRpb24uCllvdSBsaW1p
dCB5b3Vyc2VsZiBxdWl0ZSBhIGJpdCBhbmQgdGhhdCdzIHlvdXIgY2hvaWNlLiBCdXQgSSBhbSBh
ZnJhaWQKdGhpcyBkb2VzIG5vdCBtZWFuIHRoZSBpbnRlcmZhY2Ugd2l0aCB0aGUgaHlwZXJ2aXNv
ciBzaG91bGQgZG8gdGhlCnNhbWUuCgpbLi4uXQoKPiBKdWxpZW4sCj4geW91IGhhdmUgdmFsaWQg
cG9pbnRzIGJ1dCBhdCB0aGlzIHRpbWUgSSB3b24ndCBiZSBhYmxlIHRvIHJlZmFjdG9yCj4gdGhp
cyBzZXJpZXMgYW55IG1vcmUuIFRoaXMgcGF0Y2ggc2VyaWVzIHdhcyBmaXJzdCBwb3N0ZWQgaW4g
U2VwdGVtYmVyLAo+IGl0J3Mgbm93IGFsbW9zdCBNYXJjaC4gU28gYXQgdGhpcyBwb2ludCBJJ20g
anVzdCBnb2luZyB0byBzYXkgZHJvcAo+IHRoaXMgcGF0Y2ggYW5kIHdlJ2xsIGxpdmUgd2l0aCB0
aGUgbGltaXRhdGlvbiB0aGF0IFZNIGZvcmtpbmcgb25seQo+IHdvcmtzIHdpdGggc2luZ2xlIHZD
UFUgZG9tYWlucyB1bnRpbCBhdCBzb21lIGxhdGVyIHRpbWUgc29tZW9uZSBuZWVkcwo+IGl0IHRv
IHdvcmsgd2l0aCBndWVzdHMgdGhhdCBoYXZlIG1vcmUgdGhlbiAxIHZDUFVzLgoKVG8gYmUgaG9u
ZXN0LCBJIGRvbid0IGhhdmUgYSB2ZXN0ZWQgaW50ZXJlc3QgZm9yIHRoZSBWTSBmb3JraW5nLiBT
bwp0aGUgbGltaXRhdGlvbgpvZiAxIHZDUFUgaXMgZmluZSB3aXRoIG1lLgoKQW55b25lIHdobyB3
aWxsIHdhbnQgdG8gc3VwcG9ydCBtb3JlIHRoYW4gMSB2Q1BVIHdpdGggZm9ya2luZyB3aWxsIGhh
dmUgdG8KY29tZSB1cCB3aXRoIGEgcHJvcGVyIGludGVyZmFjZS4gSWYgeW91IGRvbid0IHdhbnQg
dG8gaW52ZXN0IHRpbWUgb24gaXQgdGhhdCdzCmZpbmUsIHRoZSByZXN0IG9mIHRoZSBjb2RlIGlz
IHN0aWxsIHVzZWZ1bCB0byBoYXZlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
