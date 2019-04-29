Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E1E74F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8nW-0003OM-Hd; Mon, 29 Apr 2019 16:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8nV-0003OH-68
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:06:29 +0000
X-Inumbo-ID: bdcfa098-6a98-11e9-a1ee-3b064fb596ec
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdcfa098-6a98-11e9-a1ee-3b064fb596ec;
 Mon, 29 Apr 2019 16:06:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556553986; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=NfRZPljVJqWn6Kxu3SItCiT114Zv7njTQ3FCi8TUt6c=;
 b=gjAyvnqKdvdqoycwh/KaPIJWyTno07tHH0p7YM4M/B9Tt4bffAiUNC8pvuNQ//B916AXSjqX
 +zDPinvxZS+Q9oYZOitsrzaSiMwV+rPYYjYEoPRxjjifjz+hgXfXId8c2iCmsIDzqw/4tW2C
 Iv7ai1q0LSxJxfyqfRSamLMjEPs=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5cc72101.7f3c971458f0-smtp-out-n02;
 Mon, 29 Apr 2019 16:06:25 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id h18so16632605wml.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 09:06:24 -0700 (PDT)
X-Gm-Message-State: APjAAAWosVzIoWyJt+4/4/hADGuCMLy8/kUQ4Jg83mVVvLcd4qy+miSj
 scY4pnk42GVTzeT+Iz8yy9y1X5AxjVQV8nk8b7c=
X-Google-Smtp-Source: APXvYqwv2cxHcngqL9+gPOC5jcuO1XY1kvBeu0SVSUmlV6+WG5xO6aigNGhxSV7Fc7opaxCn5pbrZXvWnzAXm7Z7yUw=
X-Received: by 2002:a1c:cc10:: with SMTP id h16mr17732414wmb.39.1556553983662; 
 Mon, 29 Apr 2019 09:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
In-Reply-To: <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 10:05:47 -0600
X-Gmail-Original-Message-ID: <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
Message-ID: <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo1MiBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8yOS8xOSA0OjQxIFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAyOSwgMjAxOSBhdCA5OjAxIEFNIEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pj4+PiBPbiAyNi4wNC4xOSBh
dCAxOToyMSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+PiBAQCAtOTk5LDYgKzk5
NiwxMCBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBz
Z2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4gPj4+ICAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2so
c2Vjb25kcGcpOwo+ID4+PiAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKGZpcnN0cGcpOwo+
ID4+Pgo+ID4+PiArICAgIEJVR19PTighcHV0X2NvdW50KTsKPiA+Pj4gKyAgICB3aGlsZSAoIHB1
dF9jb3VudC0tICkKPiA+Pj4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOwo+ID4+
PiArCj4gPj4+ICAgICAgLyogRnJlZSB0aGUgY2xpZW50IHBhZ2UgKi8KPiA+Pj4gICAgICBpZih0
ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+Y291bnRfaW5mbykpCj4g
Pj4+ICAgICAgICAgIHB1dF9wYWdlKGNwYWdlKTsKPiA+Pgo+ID4+IElmIHRoaXMgd2FzIHRvIGhh
cHBlbiBiZWZvcmUgYWxsIHRoZSBwdXRfcGFnZV9hbmRfdHlwZSgpIGNhbGxzLAo+ID4+IHdvdWxk
bid0IGl0IHJlbmRlciB1bm5lY2Vzc2FyeSB0aGUgZXh0cmEgZ2V0X3BhZ2UoKS9wdXRfcGFnZSgp
Cj4gPj4gYXJvdW5kIHRoaXMgY29kZSByZWdpb24/Cj4gPgo+ID4gSXQgd291bGQgLSBJIGFscmVh
ZHkgc2VudCBhIHZlcnNpb24gb2YgdGhlIHBhdGNoIGluIHRoYXQgZm9ybSBidXQKPiA+IHRoZXJl
IHdhcyB1bmVhc2UgZXhwcmVzc2VkIGJ5IEdlb3JnZSBnb2luZyB0aGF0IHJvdXRlIGJlY2F1c2Ug
b2YgdGhlCj4gPiBjb21wbGV4aXR5IG9mIHRoZSBjb2RlIGFuZCBpbiBoaXMgdmlldyBpdCdzIHRo
ZSBzYWZlIGJldCB0byBrZWVwIHRoZQo+ID4gZXh0cmEgcmVmZXJlbmNlcy4gSSB0aGluayB0aGUg
b3ZlcmhlYWQgb2YgZ3JhYmJpbmcgdGhlIGV4dHJhCj4gPiByZWZlcmVuY2VzIGlzIG5lZ2xpZ2li
bGUgZW5vdWdoIHRoYXQgSSdtIG5vdCBnb2luZyB0byBhcmd1ZSBvdmVyIGl0Lgo+Cj4gRXIsIHRo
YXQncyBub3Qgd2hhdCBJIHNhaWQuIDotKQo+Cj4gSSBnYXZlIGZvdXIgcG9zc2libGUgb3B0aW9u
cywgKm9uZSogb2Ygd2hpY2ggd2FzIHRvIGNoYW5nZSB0aGUgQVNTRVJUKCkKPiB0byBhIEJVR19P
TigpLCBhbmQgKm9uZSogb2Ygd2hpY2ggd2FzIHRvIGtlZXAgdGhlIChwcm9iYWJseSByZWR1bmRh
bnQpCj4gZ2V0X3BhZ2UoKSBhbmQgcHV0X3BhZ2UoKSBjYWxscy4gIFlvdSBhcHBlYXIgdG8gaGF2
ZSBkb25lIGJvdGguIDotKQoKQWggaW5kZWVkIC0gSSd2ZSBjb21iaW5lZCB0aG9zZSByZWNvbW1l
bmRhdGlvbnMgOikKCj4KPiBJIGhhdmVuJ3QgcmUtZ3Jva2tlZCB0aGUgY29kZSBoZXJlLCBidXQg
YXNzdW1pbmcgSSB3YXMgY29ycmVjdCAyIHdlZWtzCj4gYWdvLCBpZiB5b3UgaGF2ZSB0aGUgQlVH
X09OKCkgdGhlcmUsIHlvdSBjYW4gZ2V0IHJpZCBvZiB0aGUgZXh0cmEKPiByZWZlcmVuY2VzLgo+
CgpTdXJlLCBidXQgYWdhaW4sIHRoZSBvdmVyaGVhZCBvZiBoYXZpbmcgdGhlbSBpbi1wbGFjZSBp
cyBuZWdsaWdpYmxlIHNvCm1pZ2h0IGFzIHdlbGwganVzdCBrZWVwIGl0LgoKVGFtYXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
