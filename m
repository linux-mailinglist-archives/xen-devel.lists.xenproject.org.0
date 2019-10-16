Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27DFD8E3A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:44:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgiV-0000tn-2c; Wed, 16 Oct 2019 10:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kVf2=YJ=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iKgiT-0000th-Gn
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:39:41 +0000
X-Inumbo-ID: 421fc92a-f001-11e9-a531-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 421fc92a-f001-11e9-a531-bc764e2007e4;
 Wed, 16 Oct 2019 10:39:40 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id n197so53094269iod.9
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2019 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pUuL6c4ck+KRoWcnpdiSlgFv9m0vu0N3a7QIjzws8v8=;
 b=mE80o46oYeeQJP/HhEfmCUtLven3b2/cgz2aBqX2yzznGtmtfcF4SQ6Kg/1HPVDDne
 BhC3HzlgoHeVR2rJ0zEUkKCo3SFv55KyfsS52Jv/n7ZJw1NfIu6HnT4BMYz8JXCFkjlC
 o27/WC1ScTKBPglaU2Kq69a9J4KwVH1FVwYLxf86O+YhdBIqZeHbnQnUCf4of8cflUw5
 M/7Y8MN6xUIVYEsCWYWHu7DDRtgTo04Ic6Cs/cpTqEN5THEpXEm1RAmg+jRSAkg1pksh
 WUGYcJmu/+ngwAtY4wCSBwYJo9HUtxfZmtf93y/w/WThk3+grv1b5zcPLqpGDgkJk7dd
 uNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pUuL6c4ck+KRoWcnpdiSlgFv9m0vu0N3a7QIjzws8v8=;
 b=qHD6H6vB2BTZyTfodelCERtS3UUnyfv0P15awUu1duyFQ+6piFdK4sQ2dnqldR8YaC
 6xaFRe4PcFvoH/zTaKRBkOu1HALAnu/qyk8End1SQVaG91NlEFH8ThKgkMUMUiGG+cER
 IC4X6grMeiY9/kKwjoJdxkkncFhVWjBO8AOKlyNqKCxx3mTvevil+tl/mg7Y6UkNBa0P
 X7doDcEfEx+Ms5GlExceqFmrcrsBvqWChWt0kVVctaEV112mkFDLwu4h+S6GXUZyjmbt
 8tHga95Ao32deIb9R2+Up2X6g7PHHK3Q8RGPDws2PXGb3w9I0QotCw5YLEZcsk1BQX8R
 azrg==
X-Gm-Message-State: APjAAAVL65K+TGIIBiUuEtDjzUdkZNIfy7jBS82JgYmczeyuem2lmvwt
 U+1mJU7hBc5Wv/gTV8KSpkwiCWz6N0zSBbwjfuI=
X-Google-Smtp-Source: APXvYqxDEsCTvU6b3zbK2c6IflRfc1Jhnsx04jbb1dfAD/RHNFyLZ/r7y65AyPTQHPrPdET5Vi1VXyqJs0ElTWvWZ9E=
X-Received: by 2002:a02:698d:: with SMTP id
 e135mr47192373jac.128.1571222380172; 
 Wed, 16 Oct 2019 03:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-3-al1img@gmail.com>
 <23968.39583.655591.751635@mariner.uk.xensource.com>
 <20191011153214.GL1389@Air-de-Roger.citrite.net>
 <23968.42484.127483.711098@mariner.uk.xensource.com>
 <20191015153947.GA17494@Air-de-Roger>
In-Reply-To: <20191015153947.GA17494@Air-de-Roger>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Wed, 16 Oct 2019 13:39:28 +0300
Message-ID: <CACvf2oWcTQDJ-ZBVFXJM9055mDRfkD8KC2+3CkkhsuBr6a5+mQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v1 2/2] libxl: add removing XS backend path
 for PV devices on domain destroy
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgNjozOSBQTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwNDo1NToz
MlBNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IFJvZ2VyIFBhdSBNb25uZSB3cml0ZXMg
KCJSZTogW1BBVENIIHYxIDIvMl0gbGlieGw6IGFkZCByZW1vdmluZyBYUyBiYWNrZW5kIHBhdGgg
Zm9yIFBWIGRldmljZXMgb24gZG9tYWluIGRlc3Ryb3kiKToKPiA+ID4gV2hlbiB0aGlzIGNvZGUg
d2FzIGFkZGVkIChkZXZkKSB0aG9zZSB3aGVyZSB0aGUgb25seSBiYWNrZW5kcyBoYW5kbGVkCj4g
PiA+IGJ5IGxpYnhsLiBWRElTUEwsIFZTTkQsIFZJTlBVVCBkaWRuJ3QgZXhpc3QgYXQgdGhhdCBw
b2ludCwgc28gSSB0aGluawo+ID4gPiB0aGUgaXNzdWUgaXMgdGhhdCB3aGVuIHN1cHBvcnQgZm9y
IHRob3NlIHdhcyBhZGRlZCwgaXQgd2Fzbid0IHByb3Blcmx5Cj4gPiA+IHdpcmVkIGludG8gZGV2
ZC4KPiA+ID4KPiA+ID4gPiBJIHRoaW5rOgo+ID4gPiA+Cj4gPiA+ID4gPiAgICAgIHN3aXRjaChk
ZGV2LT5kZXYtPmJhY2tlbmRfa2luZCkgewo+ID4gPiA+ID4gKyAgICBjYXNlIExJQlhMX19ERVZJ
Q0VfS0lORF9WRElTUEw6Cj4gPiA+ID4gPiArICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZT
TkQ6Cj4gPiA+ID4gPiArICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZJTlBVVDoKPiA+ID4g
PiA+ICAgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVkJEOgo+ID4gPiA+ID4gICAgICBjYXNl
IExJQlhMX19ERVZJQ0VfS0lORF9WSUY6Cj4gPiA+ID4KPiA+ID4gPiBJZiB3ZSBkbyB3YW50IHRo
aXMgdG8gaGFuZGxlICphbGwqIGtpbmRzIG9mIGRldmljZSwgbWF5YmUgaXQgc2hvdWxkCj4gPiA+
ID4gaGF2ZSBhIGZhbGxiYWNrIHRoYXQgYWJvcnRzLCBvciBzb21ldGhpbmcgPyAgKEkgZG9uJ3Qg
dGhpbmsgaXQgaXMKPiA+ID4gPiBlYXN5IHRvIG1ha2UgaXQgYSBjb21waWxlIGVycm9yIHRvIGZv
cmdldCB0byBhZGQgYW4gZW50cnkgaGVyZSBidXQgaWYKPiA+ID4gPiB3ZSBjb3VsZCBkbyB0aGF0
IGl0IHdvdWxkIHByb2JhYmx5IGJlIGJlc3QuKQo+ID4gPgo+ID4gPiBNYXliZSB3ZSBjb3VsZCBo
YXZlIHNvbWUgZ2VuZXJpYyBoYW5kbGluZyBmb3IgZXZlcnl0aGluZyAhPSBxZGlzaz8KPiA+Cj4g
PiBTbyBtYWtlIHRoYXQgdGhlICJkZWZhdWx0OiIgPyAgVGhhdCB3b3VsZCBiZSBmaW5lIGJ5IG1l
Lgo+Cj4gSWYgcG9zc2libGUgeWVzLCB0aGF0IHdvdWxkIGJlIG15IHByZWZlcmVuY2UsIGFuZCB3
b3VsZCBwcmV2ZW50IGhhdmluZwo+IHRvIGFkZCBuZXcgZGV2aWNlIHR5cGVzIHRvIHRoaXMgc3dp
dGNoIHVubGVzcyBzcGVjaWFsIGhhbmRsaW5nIGlzCj4gcmVxdWlyZWQuCj4KPiA+Cj4gPiA+IElJ
UkMgcWRpc2sgbmVlZHMgc3BlY2lhbCBoYW5kbGluZyBzbyB0aGF0IGRldmQgY2FuIGxhdW5jaCBh
bmQgZGVzdHJveQo+ID4gPiBhIFFFTVUgaW5zdGFuY2Ugd2hlbiByZXF1aXJlZCwgYnV0IG90aGVy
IGJhY2tlbmRzIHRoYXQgcnVuIGluIHRoZQo+ID4gPiBrZXJuZWwgZG9uJ3QgbmVlZCBzdWNoIGhh
bmRsaW5nIGFuZCBjb3VsZCBtYXliZSBzaGFyZSB0aGUgc2FtZSBnZW5lcmljCj4gPiA+IGNvZGUg
cGF0aC4KPiA+Cj4gPiBSaWdodC4KPiA+Cj4gPiA+ID4gQWxsIG9mIHRoYXQgYXNzdW1pbmcgdGhh
dCB0aGUgYmFzaWMgaWRlYSBpcyByaWdodCwgd2hpY2ggSSB3b3VsZCBsaWtlCj4gPiA+ID4gUm9n
ZXIncyBvcGluaW9uIGFib3V0Lgo+ID4gPgo+ID4gPiBMb29raW5nIGF0IHRoZSBwYXRjaCBpdHNl
bGYsIHlvdSBhbHNvIHNlZW0gdG8gYmUgZG9pbmcgc29tZSBjaGFuZ2VzCj4gPiA+IHJlbGF0ZWQg
dG8gbnVtX3ZiZHMgYW5kIG51bV92aWZzLCBidXQgdGhvc2UgYXJlIG5vdCBtZW50aW9uZWQgaW4g
dGhlCj4gPiA+IGNvbW1pdCBtZXNzYWdlLCBpcyB0aGF0IGEgc3RyYXkgY2hhbmdlPwo+ID4KPiA+
IE5vLCBJIGRvbid0IHRoaW5rIHNvLiAgVGhvc2UgdmFyaWFibGVzIGp1c3QgdGVsbCB1cyB3aGVu
IHRoZSB0aGluZyBpcwo+ID4gdG9ybiBkb3duIGJ1dCBPbGVrc2FuZHIncyBjb2RlIGlzIGFibGUg
dG8gdXNlIHRoZSBkZXZpY2VzIHNsaXN0IGl0c2VsZgo+ID4gZm9yIHRoYXQuICBQbGVhc2UgZG8g
Y2hlY2sgdG8gc2VlIGlmIHlvdSBhZ3JlZS4KPgo+IFllcywgdGhhdCdzIGZpbmUuIEkgZG9uJ3Qg
dGhpbmsgdGhvc2UgY2hhbmdlcyBhcmUgd3JvbmcsIEkganVzdCB0aGluawo+IHRoYXQgYXQgbGVh
c3QgdGhleSBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4gSWU6Cj4g
IndoaWxlIHRoZXJlIHJlbW92ZSB0aGUgbnVtX3ZpZnMgYW5kIG51bV92YmRzIHNpbmNlIHRoZXkg
YXJlIG5vdAo+IG5lZWRlZCBhbmQgdGhlIHNhbWUgY2FuIGJlIGFjaGlldmVkIGJ5IGNoZWNraW5n
IHRoYXQgdGhlIGRldmljZSBsaXN0Cj4gaXMgZW1wdHkuIiBvciBzb21lIHN1Y2guCj4KPiBUaGFu
a3MsIFJvZ2VyLgoKSWFuLCBSb2dlciwKClRoYW5rcyBmb3IgcmV2aWV3aW5nIGFuZCBjb21tZW50
cy4gSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggd2l0aCB5b3VyCmNvbW1lbnRzIGFib3ZlLgoKLS0g
CkJlc3QgUmVnYXJkcywKT2xla3NhbmRyIEdyeXRzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
