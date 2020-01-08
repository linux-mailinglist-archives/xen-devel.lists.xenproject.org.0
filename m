Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB88134C15
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 20:51:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipHJa-0000Hs-8D; Wed, 08 Jan 2020 19:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnPU=25=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipHJZ-0000Hn-Bp
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 19:48:25 +0000
X-Inumbo-ID: cfab32f8-324f-11ea-b1f0-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfab32f8-324f-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 19:48:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578512896; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=pO3eDFAub92Q+vSnVUE9ftgAlvIKwwnf4Jvd1fWpUwk=;
 b=Oxt6BdQpamshGVw1hu3Kr7NbZeKOW/8XAfnH/vqhMSBN3Z1YpyqYyqfnhawf9VzPrQqW+Lqk
 9hn6v69x0VGItRPj1jaBtLlZWdt0YeggBR3GsTg1SgPxLY/NxRpkIjUCHBKk/E2lXTS36tgX
 NGLRQfBZEN+VGH40FqMIXj9AVIc=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5e1631fe.7f62304c70f0-smtp-out-n03;
 Wed, 08 Jan 2020 19:48:14 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z3so4742428wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 11:48:14 -0800 (PST)
X-Gm-Message-State: APjAAAUmSnsHfD44MfwUxYfGkGwG4MllVf8cDmfUWOL+sqXpG8fNsiYj
 jH31G9Q3DVV82kW3gDHqHUPF0ibE1zhgs1obHq4=
X-Google-Smtp-Source: APXvYqyMo3pH5nFAaqSfG/AHxIox6VcadBMb+95W7SQlZK/wRH0zcmsqcF9BlBzhuSgDX8dRSKHTxbwk95Nk9HRVxTg=
X-Received: by 2002:a5d:6692:: with SMTP id l18mr6922046wru.382.1578512893173; 
 Wed, 08 Jan 2020 11:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
 <20200108150841.GR11756@Air-de-Roger>
 <CABfawhnWYn_MwaQzdAQ4QezA0vgQ7ByK44eUEerGRP7AU9si+A@mail.gmail.com>
 <20200108180042.GT11756@Air-de-Roger>
 <CABfawhm==Gpca8+E=PihvW3x7Y79kAKD48rk5PHHbbhdATh4-w@mail.gmail.com>
 <CABfawh=StW-4_VF+OUywP+t2SVE_o=gX8H9UGZcFH+e8FFbEQw@mail.gmail.com>
 <20200108184422.GX11756@Air-de-Roger>
In-Reply-To: <20200108184422.GX11756@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 Jan 2020 12:47:36 -0700
X-Gmail-Original-Message-ID: <CABfawhn5_T0hmVeiGm7cN1z0nfS05Uw8vdf0qhz8MP-9E8KNhw@mail.gmail.com>
Message-ID: <CABfawhn5_T0hmVeiGm7cN1z0nfS05Uw8vdf0qhz8MP-9E8KNhw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCAxMTo0NCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAwOCwgMjAyMCBhdCAxMToyMzoy
OUFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4gPiA+IFdoeSBkbyB5b3Ug
bmVlZCBhIGNvbmZpZyBmaWxlIGZvciBsYXVuY2hpbmcgdGhlIFFlbXUgZGV2aWNlIG1vZGVsPwo+
ID4gPiA+ID4gPiBEb2Vzbid0IHRoZSBzYXZlLWZpbGUgY29udGFpbiBhbGwgdGhlIGluZm9ybWF0
aW9uPwo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBjb25maWcgaXMgdXNlZCB0byBwb3B1bGF0ZSB4
ZW5zdG9yZSwgbm90IGp1c3QgZm9yIFFFTVUuIFRoZSBRRU1VCj4gPiA+ID4gPiBzYXZlIGZpbGUg
ZG9lc24ndCBjb250YWluIHRoZSB4bCBjb25maWcuIFRoaXMgaXMgbm90IGEgZnVsbCBWTSBzYXZl
Cj4gPiA+ID4gPiBmaWxlLCBpdCBpcyBvbmx5IHRoZSBRRU1VIHN0YXRlIHRoYXQgZ2V0cyBkdW1w
ZWQgd2l0aAo+ID4gPiA+ID4geGVuLXNhdmUtZGV2aWNlcy1zdGF0ZS4KPiA+ID4gPgo+ID4gPiA+
IFRCSCBJIHRoaW5rIGl0IHdvdWxkIGJlIGVhc2llciB0byBoYXZlIHNvbWV0aGluZyBsaWtlIG15
IHByb3Bvc2FsCj4gPiA+ID4gYmVsb3csIHdoZXJlIHlvdSB0ZWxsIHhsIHRoZSBwYXJlbnQgYW5k
IHRoZSBmb3JrZWQgVk0gbmFtZXMgYW5kIHhsCj4gPiA+ID4gZG9lcyB0aGUgcmVzdC4gRXZlbiBi
ZXR0ZXIgd291bGQgYmUgdG8gbm90IGhhdmUgdG8gdGVsbCB4bCB0aGUgcGFyZW50Cj4gPiA+ID4g
Vk0gbmFtZSAoc2luY2UgSSBndWVzcyB0aGlzIGlzIGFscmVhZHkgdHJhY2tlZCBpbnRlcm5hbGx5
IHNvbWV3aGVyZT8pLgo+ID4gPgo+ID4gPiBUaGUgZm9ya2VkIFZNIGhhcyBubyAibmFtZSIgd2hl
biBpdCdzIGNyZWF0ZWQuIEZvciBwZXJmb3JtYW5jZSByZWFzb25zCj4gPiA+IHdoZW4gdGhlIFZN
IGZvcmsgaXMgY3JlYXRlZCB3aXRoICItLWxhdW5jaC1kbSBubyIgd2UgZXhwbGljaXRseSB3YW50
Cj4gPiA+IHRvIGF2b2lkIHRvdWNoaW5nIFhlbnN0b3JlLiBFdmVuIHBhcnNpbmcgdGhlIGNvbmZp
ZyBmaWxlIHdvdWxkIGJlCj4gPiA+IHVubmVlZGVkIG92ZXJoZWFkIGF0IHRoYXQgc3RhZ2UuCj4g
Pgo+ID4gQW5kIHRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uLCBubywgdGhlIHBhcmVudCBWTSdzIG5h
bWUgaXMgbm90IHJlY29yZGVkCj4gPiBhbnl3aGVyZSBmb3IgdGhlIGZvcmsuIFRlY2huaWNhbGx5
IG5vdCBldmVuIHRoZSBwYXJlbnQncyBkb21haW4gaWQgaXMKPiA+IGtlcHQgYnkgWGVuLiBUaGUg
Zm9yayBvbmx5IGtlZXBzIGEgcG9pbnRlciB0byB0aGUgcGFyZW50J3MgInN0cnVjdAo+ID4gZG9t
YWluIgo+Cj4gVGhlcmUncyB0aGUgZG9tYWluX2lkIGZpZWxkIGluc2lkZSBvZiBzdHJ1Y3QgZG9t
YWluLCBzbyBpdCBzZWVtcyBxdWl0ZQo+IGVhc3kgdG8gZ2V0IHRoZSBwYXJlbnQgZG9taWQgZnJv
bSB0aGUgZm9yayBpZiB0aGVyZSdzIGEgcG9pbnRlciB0byB0aGUKPiBwYXJlbnQncyBzdHJ1Y3Qg
ZG9tYWluLgo+Cj4gPiBTbyByaWdodCBub3cgdGhlcmUgaXMgbm8gaHlwZXJjYWxsIGludGVyZmFj
ZSB0byByZXRyaWV2ZSBhCj4gPiBmb3JrJ3MgcGFyZW50J3MgSUQgLSBpdCBpcyBhc3N1bWVkIHRo
ZSB0b29scyB1c2luZyB0aGUgaW50ZXJmYWNlIGFyZQo+ID4ga2VlcGluZyB0cmFjayBvZiB0aGF0
LiBDb3VsZCB0aGlzIGluZm9ybWF0aW9uIGJlIGR1bXBlZCBpbnRvIFhlbnN0b3JlCj4gPiBhcyB3
ZWxsPyBZZXMuIEJ1dCB3ZSBzcGVjaWZpY2FsbHkgd2FudCBiZSBhYmxlIHRvIGNyZWF0ZSB0aGUg
Zm9yayBhcwo+ID4gZmFzdCBwb3NzaWJsZSB3aXRob3V0IGFueSB1bm5lY2Vzc2FyeSBvdmVyaGVh
ZC4KPgo+IEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0byBpZGVudGlmeSBmb3JrZWQgZG9tYWlu
cyB1c2luZwo+IFhFTl9ET01DVExfZ2V0ZG9tYWluaW5mbzogeW91IGNvdWxkIGFkZCBhIHBhcmVu
dF9kb21pZCBmaWVsZCB0bwo+IHhlbl9kb21jdGxfZ2V0ZG9tYWluaW5mbyBhbmQgaWYgaXQncyBz
ZXQgdG8gc29tZXRoaW5nIGRpZmZlcmVudCB0aGFuCj4gRE9NSURfSU5WQUxJRCB0aGVuIHRoZSBk
b21haW4gaXMgYSBmb3JrIG9mIHRoZSBnaXZlbiBkb21pZC4KPgo+IE5vdCBzYXlpbmcgaXQgc2hv
dWxkIGJlIGRvbmUgbm93LCBidXQgQUZBSUNUIGdldHRpbmcgdGhlIHBhcmVudCdzCj4gZG9taWQg
aXMgZmVhc2libGUgYW5kIGRvZXNuJ3QgcmVxdWlyZSB4ZW5zdG9yZS4KPgoKT2YgY291cnNlIGl0
IGNvdWxkIGJlIGRvbmUuIEkgd2FzIGp1c3QgcG9pbnRpbmcgb3V0IHRoYXQgaXQncyBub3QKY3Vy
cmVudGx5IGtlcHQgc2VwYXJhdGVseSBhbmQgdGhlcmUgaXMgbm8gaW50ZXJmYWNlIHRvIHJldHJp
ZXZlIGl0LgpCdXQgVEJIIEkgaGF2ZSBsb3N0IHRoZSB0cmFpbiB0aGUgdGhvdWdoIHdoeSB3ZSB3
b3VsZCBuZWVkIHRoYXQgaW4gdGhlCmZpcnN0IHBsYWNlPyBXaGVuIFFFTVUgaXMgYmVpbmcgbGF1
bmNoZWQgdGhlIGZvcmsgaXMgYWxyZWFkeSBjcmVhdGVkCmFuZCBRRU1VIGRvZXNuJ3QgbmVlZCB0
byBrbm93IGFueXRoaW5nIGFib3V0IHRoZSBwYXJlbnQuCgpUYW1hcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
