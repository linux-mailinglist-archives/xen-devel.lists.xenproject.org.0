Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126FFC8E28
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 18:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFhKM-00025v-Tt; Wed, 02 Oct 2019 16:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4c3l=X3=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iFhKK-00025q-P7
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 16:18:08 +0000
X-Inumbo-ID: 382a522c-e530-11e9-bf31-bc764e2007e4
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by localhost (Halon) with ESMTPS
 id 382a522c-e530-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 16:18:07 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d26so6644408pgl.7
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XhZfvdAX+Ooy3aiL7PVi/+SCOdQ+j5XjnFLdmhIPw1c=;
 b=eS8q6nQxNJlPVuAZR/yRBg2/9cFNLIHCyQKi/hI1OXLWwsVNzxlqYLcaca96JYewJ/
 xm1/ihOZ0WtffhrQAd+gJ72yvInvyyYvA21oHUqxyY50sUiIMgWJE8bj38kEJii9tPOm
 Y1tX77SF+QtkEyuqBj2H0Nx9Q8Cp4O8rljmWY56vf4lqLsl8nEvg+mGaVM1FfZwFI1jP
 a6SXOy+J0xlxIxkEdcOMaJHx2xm/TDOYJuMFlT/CLyPMMWF2hYNBdOcRJebFwPlQqbdy
 GAi5RE43qAOCu+enSrwDyakGVIYHW/kGxN0KxrJGop4bKosuFJNQeNrU9S7UM9R1IM6z
 AWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhZfvdAX+Ooy3aiL7PVi/+SCOdQ+j5XjnFLdmhIPw1c=;
 b=FkGOr+iQKe1OPuszYbFGbgythLtn/6+qTB0fPjmlM47k8epU9NaIkRdDUgDIpj2wb1
 zOWnqHWyO63L3y+ksMLOyUfIs083gUGTxbu4fV67LH+3vX8l9HbYhj0B6iUuhzcC6FhQ
 G1OSAwwQ4zS+Xg+KImeR/HeBXxCwsUbeSGzdrYntm+gLE1epZ9//Pcw5ShY3ckUwoh/W
 uLKx4e4Vryf6VgXZfx2vfMUhEiISQk6tHQn8x3jqRf2eIzPq1fy2wmWhHzIwVGeXK8QT
 cHIO6oZTQxd9KTBMok3+CJm6bmEuzLWUM6BOrQhDqbqqtFv4aF/+nFm27ZKJl7ocWdVU
 FrWQ==
X-Gm-Message-State: APjAAAXl92WEQgURhClRBjNddeUy2/0Pp2syV9O8uvWP+jwxHoLE9Ve6
 N6arL8W9lhmwYe+CXX8LpQLkBO2PJDflA7AV5sM=
X-Google-Smtp-Source: APXvYqw+kKc7N3GYLxQbBFlJvif4PMyQHzAowIxTzVwe0RjkfprogiK/K6+q7pNftMFDOsM70yCC1dalz26WLA8AW2c=
X-Received: by 2002:a63:225f:: with SMTP id t31mr4588220pgm.50.1570033086873; 
 Wed, 02 Oct 2019 09:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191001145714.556-1-paul.durrant@citrix.com>
 <23956.51705.860315.343098@mariner.uk.xensource.com>
In-Reply-To: <23956.51705.860315.343098@mariner.uk.xensource.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 2 Oct 2019 17:18:01 +0100
Message-ID: <CACCGGhDXHhuF7z-ezZUWyGGLY8T9a+JDC4_yw-TrCY3HuPyKPQ@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2 0/2] libxl: fix assertion failure
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5IGF0IDE3OjA0LCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0
cml4LmNvbT4gd3JvdGU6Cj4KPiBQYXVsIER1cnJhbnQgd3JpdGVzICgiW1BBVENILWZvci00LjEz
IHYyIDAvMl0gbGlieGw6IGZpeCBhc3NlcnRpb24gZmFpbHVyZSIpOgo+ID4gVGhpcyB3YXMgb3Jp
Z2luYWxseSBhIHNpbmdsZSBwYXRjaCwgd2hpY2ggaXMgbm93IHBhdGNoICMyIG9mIHRoaXMgc2Vy
aWVzLgo+ID4KPiA+IFBhdWwgRHVycmFudCAoMik6Cj4gPiAgIGxpYnhsOiByZXBsYWNlICdlbmFi
bGVkJyB3aXRoICd1bmtub3duJyBpbiBsaWJ4bF9wYXNzdGhyb3VnaAo+ID4gICAgIGVudW1lcmF0
aW9uCj4gPiAgIGxpYnhsOiBjaG9vc2UgYW4gYXBwcm9wcmlhdGUgZGVmYXVsdCBmb3IgcGFzc3Ro
cm91Z2guLi4KPgo+IFRoYW5rcy4gIEkgaGF2ZSBhcHBsaWVkIHRoZXNlLCBhbmQgYWxzbyBhIHN0
eWxlIGZpeHVwIChiZWxvdykuCj4KCkNvb2wuCgo+IEkgYW0gY29udGludWluZyB0byBsb29rIGF0
IHRoZSBkZWZhdWx0aW5nIGFuZCBjb25maWcgbWFuYWdlbWVudCBoZXJlCj4gd2l0aCBhIHZpZXcg
dG8gZ2V0dGluZyByaWQgb2Ygc29tZSBvZiB0aGUgZHVwbGljYXRlZCBjb2RlIGFuZCBtb3ZpbmcK
PiBpdCBhbGwgaW50byBsaWJ4bC4KPgoKVGhhdCB3b3VsZCBpbmRlZWQgYmUgYmVuZWZpY2lhbCBm
b3IgdGhlIGxpa2VzIG9mIGxpYnZpcnQuIFBlcmhhcHMgaXQKd291bGQgYmUgcmVhc29uYWJsZSB0
byB1bmlmeSB0aGUgY3JlYXRlIGFuZCBidWlsZCBpbmZvIGF0IGEgbGlieGwKbGV2ZWwgKGV2ZW4g
dGhvdWdoIHRoZXkgbWF5IGZlZWQgaW50byBkaXN0aW5jdCBkb21jdGxzIHVuZGVybmVhdGggZm9y
CnRoZSBtb21lbnQpPwoKICBDaGVlcnMsCgogICAgUGF1bAoKPiBJYW4uCj4KPiBGcm9tIGIwMWIx
ZGMwNDZkYTcwYTI2MjFhNGQxZjAzMmRkYjIyYjBjZGRlNmIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gRGF0
ZTogV2VkLCAyIE9jdCAyMDE5IDE2OjU1OjQ3ICswMTAwCj4gU3ViamVjdDogW1BBVENIXSBsaWJ4
bDogY3JlYXRlOiBzdHlsZTogQWRkIGEgcGFpciBvZiBtaXNzaW5nIHsgXQo+Cj4gRnJvbSBDT0RJ
TkdfU1RZTEU6Cj4KPiAgIEV2ZXJ5IGluZGVudGVkIHN0YXRlbWVudCBpcyBicmFjZWQsIGJ1dCBi
bG9ja3MgdGhhdCBjb250YWluIGp1c3Qgb25lCj4gICBzdGF0ZW1lbnQgbWF5IGhhdmUgdGhlIGJy
YWNlcyBvbWl0dGVkLiAgVG8gYXZvaWQgY29uZnVzaW9uLCBlaXRoZXIgYWxsCj4gICB0aGUgYmxv
Y2tzIGluIGFuIGlmLi4uZWxzZSBjaGFpbiBoYXZlIGJyYWNlcywgb3Igbm9uZSBvZiB0aGVtIGRv
Lgo+Cj4gQ0M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gLS0tCj4g
IHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBpbmRleCA2MmUx
M2YzZTdjLi4wOTk3NjFhMmQ3IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0
ZS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAtNjgsOCArNjgsOSBA
QCBpbnQgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2Ms
Cj4gICAgICAgICAgY19pbmZvLT5wYXNzdGhyb3VnaCA9ICgoY19pbmZvLT50eXBlID09IExJQlhM
X0RPTUFJTl9UWVBFX1BWKSB8fAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIWlu
Zm8uY2FwX2lvbW11X2hhcF9wdF9zaGFyZSkgPwo+ICAgICAgICAgICAgICBMSUJYTF9QQVNTVEhS
T1VHSF9TWU5DX1BUIDogTElCWExfUEFTU1RIUk9VR0hfU0hBUkVfUFQ7Cj4gLSAgICB9IGVsc2Ug
aWYgKCFpbmZvLmNhcF9odm1fZGlyZWN0aW8pCj4gKyAgICB9IGVsc2UgaWYgKCFpbmZvLmNhcF9o
dm1fZGlyZWN0aW8pIHsKPiAgICAgICAgICBjX2luZm8tPnBhc3N0aHJvdWdoID0gTElCWExfUEFT
U1RIUk9VR0hfRElTQUJMRUQ7Cj4gKyAgICB9Cj4KPiAgICAgIC8qIEFuIGV4cGxpY2l0IHNldHRp
bmcgc2hvdWxkIG5vdyBoYXZlIGJlZW4gY2hvc2VuICovCj4gICAgICBhc3NlcnQoY19pbmZvLT5w
YXNzdGhyb3VnaCAhPSBMSUJYTF9QQVNTVEhST1VHSF9VTktOT1dOKTsKPiAtLQo+IDIuMTEuMAo+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
