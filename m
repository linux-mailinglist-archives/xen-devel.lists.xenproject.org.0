Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C6CC9D2
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2019 14:09:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGioa-0004I2-LP; Sat, 05 Oct 2019 12:05:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RIU7=X6=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iGioY-0004Hx-Vi
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2019 12:05:35 +0000
X-Inumbo-ID: 6f1f7ebc-e768-11e9-9bee-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f1f7ebc-e768-11e9-9bee-bc764e2007e4;
 Sat, 05 Oct 2019 12:05:34 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c3so2962386plo.2
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2019 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0JztUFhrMqAgC6HiPOQFnqPQvqnZOOQNiJv9l/F214=;
 b=Y2isPOSMi74NIZkMOgccp2hW6e0BCcQzc4KEd7Up3PyLskzZ9Elqi/07vgyJMksrx1
 fog87sX9ter+IiLi6TpWb1jO2jWG5ZPVE/ILqrs/pa0RJhWx36RhnSSKSWpCqXarXsqR
 vpRk0ulfhB5BXvtNhvuOHEIXWUPR6il6xIsShT74zjkPC8X0aDQqqRlxWusMA/M3Ul7c
 AvZifgguXZRgN80ICb0AUSipmvvjM1NwIZss2Py+1rkMCEdpaU4rG+xEtfEi03Q1eIgY
 vNPoIZ2zQgULS2k1nEshofIn1psPdHeC6c9kYaTIfaSxEpgTiDHcOoS4fV28XOJDMMPo
 m/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0JztUFhrMqAgC6HiPOQFnqPQvqnZOOQNiJv9l/F214=;
 b=ZUQv1Bmi3g2OD9dYp/m6OEPy2q3LmEjbY880OT/vendDrZLZQ/7gCNa3Gl8IEfVC8W
 rs94so9zwmbFeHkcaDU5hBLlrydpQPwSkF5oTw03yZE4jiGMbrc5uxWd57kyP1U/xXPz
 Pm2n8XaQvRXuwU/b/FPx8Ry4FOc7eBkMVnebw/E6ubuFLvuYG+MTbKwHFwGz5v2hsZQg
 2y2+6cBz4OvpRIepn6aRIzjEg8Wi2zeqcRUdYYKweudMMj1+jRq6xoxWURE9dcm6X3MC
 WqBaBihM7OpTTl0sjXSIeeGbruMhcEpcegIz0GeqeBH8bU329cxaJDvdZP7eZxKfK7wh
 OCIg==
X-Gm-Message-State: APjAAAUOkZi/0Y39Lqj1x4azKWxTjsbUmmIBshTYmb0wLs3qu5xMF5aX
 6lnAzlI3/bPphdz4vOXqwIVa4a/LSxly6QaUS+c=
X-Google-Smtp-Source: APXvYqxDs5/eGxxBhu1kULZfpmmyGF0iE6b3jCvppp31utHzyVnTM8m/CIBV2yIJlIfvxEvPa4llRseDbr66xEYCMw8=
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr20458852plt.148.1570277133265; 
 Sat, 05 Oct 2019 05:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191004164243.30822-1-julien.grall@arm.com>
In-Reply-To: <20191004164243.30822-1-julien.grall@arm.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Sat, 5 Oct 2019 13:05:23 +0100
Message-ID: <CACCGGhAuD9vQnGLfQhC0RJykD-QVn4MK4vrCZm_A-VLGvCgFBA@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA0IE9jdCAyMDE5IGF0IDE3OjQyLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPiB3cm90ZToKPgo+IGZsYXNrX2Fzc2lnbl97LCBkdH1kZXZpY2UoKSBtYXkgYmUgdXNl
ZCB0byBjaGVjayB3aGV0aGVyIHlvdSBjYW4gdGVzdCBpZgo+IGEgZGV2aWNlIGlzIGFzc2lnbmVk
LiBJbiB0aGlzIGNhc2UsIHRoZSBkb21haW4gd2lsbCBiZSBOVUxMLgo+Cj4gSG93ZXZlciwgZmxh
c2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oKSB3aWxsIGJlIGNhbGxlZCBhbmQgbWF5IGVuZCB1
cAo+IHRvIGRlZmVyZW5jZSBhIE5VTEwgcG9pbnRlci4gVGhpcyBjYW4gYmUgcHJldmVudGVkIGJ5
IG1vdmluZyB0aGUgY2FsbAo+IGFmdGVyIHdlIGNoZWNrIHRoZSB2YWxpZGl0eSBmb3IgdGhlIGRv
bWFpbiBwb2ludGVyLgo+Cj4gQ292ZXJpdHktSUQ6IDE0ODY3NDEKPiBGaXhlczogNzFlNjE3YTZi
OCAoJ3VzZSBpc19pb21tdV9lbmFibGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4nKQo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1i
eTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cgo+IC0tLQo+ICB4ZW4veHNtL2ZsYXNrL2hv
b2tzLmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFzay9ob29rcy5jIGIveGVu
L3hzbS9mbGFzay9ob29rcy5jCj4gaW5kZXggM2IzMDgyNzc2NC4uY2Y3ZjI1Y2RhMiAxMDA2NDQK
PiAtLS0gYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMKPiArKysgYi94ZW4veHNtL2ZsYXNrL2hvb2tz
LmMKPiBAQCAtMTI5NiwxMSArMTI5NiwxMyBAQCBzdGF0aWMgaW50IGZsYXNrX2Fzc2lnbl9kZXZp
Y2Uoc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3QgbWFjaGluZV9iZGYpCj4gICAgICB1MzIgZHNp
ZCwgcnNpZDsKPiAgICAgIGludCByYyA9IC1FUEVSTTsKPiAgICAgIHN0cnVjdCBhdmNfYXVkaXRf
ZGF0YSBhZDsKPiAtICAgIHUzMiBkcGVybSA9IGZsYXNrX2lvbW11X3Jlc291cmNlX3VzZV9wZXJt
KGQpOwo+ICsgICAgdTMyIGRwZXJtOwo+Cj4gICAgICBpZiAoICFkICkKPiAgICAgICAgICByZXR1
cm4gZmxhc2tfdGVzdF9hc3NpZ25fZGV2aWNlKG1hY2hpbmVfYmRmKTsKPgo+ICsgICAgZHBlcm0g
PSBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybShkKTsKPiArCj4gICAgICByYyA9IGN1cnJl
bnRfaGFzX3Blcm0oZCwgU0VDQ0xBU1NfUkVTT1VSQ0UsIFJFU09VUkNFX19BREQpOwo+ICAgICAg
aWYgKCByYyApCj4gICAgICAgICAgcmV0dXJuIHJjOwo+IEBAIC0xMzU1LDExICsxMzU3LDEzIEBA
IHN0YXRpYyBpbnQgZmxhc2tfYXNzaWduX2R0ZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0
IGNoYXIgKmR0cGF0aCkKPiAgICAgIHUzMiBkc2lkLCByc2lkOwo+ICAgICAgaW50IHJjID0gLUVQ
RVJNOwo+ICAgICAgc3RydWN0IGF2Y19hdWRpdF9kYXRhIGFkOwo+IC0gICAgdTMyIGRwZXJtID0g
Zmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oZCk7Cj4gKyAgICB1MzIgZHBlcm07Cj4KPiAg
ICAgIGlmICggIWQgKQo+ICAgICAgICAgIHJldHVybiBmbGFza190ZXN0X2Fzc2lnbl9kdGRldmlj
ZShkdHBhdGgpOwo+Cj4gKyAgICBkcGVybSA9IGZsYXNrX2lvbW11X3Jlc291cmNlX3VzZV9wZXJt
KGQpOwo+ICsKPiAgICAgIHJjID0gY3VycmVudF9oYXNfcGVybShkLCBTRUNDTEFTU19SRVNPVVJD
RSwgUkVTT1VSQ0VfX0FERCk7Cj4gICAgICBpZiAoIHJjICkKPiAgICAgICAgICByZXR1cm4gcmM7
Cj4gLS0KPiAyLjExLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
