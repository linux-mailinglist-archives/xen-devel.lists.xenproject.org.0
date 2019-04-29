Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D001FE6D3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8Pk-0000Xt-NF; Mon, 29 Apr 2019 15:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8Pj-0000Xm-EV
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:41:55 +0000
X-Inumbo-ID: 4ff861ca-6a95-11e9-b951-0bf3ed357bd0
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ff861ca-6a95-11e9-b951-0bf3ed357bd0;
 Mon, 29 Apr 2019 15:41:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556552513; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=p0SuIAOdHwDKrrcptBJTvwnteSQj4fWI4P0ziFaaxgs=;
 b=aUnDOZ3QveiCl3klcFCBP5b1h+JXChsbjkWlQkhUE8C823iBmjdxAm/xIGbwBtlJd5nkdJXj
 fEZ1/soBGZMLS5xZ18tzHvwuL1ffSiBHXwLZywLfgHZIeqmHxW7+Iu6xX9tT2peqKQ1w5Sy9
 4AJGFsIBx3BAQQF2j6KVCZ6S84A=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mxa.mailgun.org with ESMTP id 5cc71b40.7fca98c3ab70-smtp-out-n01;
 Mon, 29 Apr 2019 15:41:52 -0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y197so16511753wmd.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 08:41:51 -0700 (PDT)
X-Gm-Message-State: APjAAAW3h0Jm8/uqu2P7dV/0DA7AeP4ygN9zGQdoZiEpKZE4UG2LnLZr
 iIUC6zxSAiK9MayOLthw6xtGechgEir4VKOdOCM=
X-Google-Smtp-Source: APXvYqzttzaRAMz0WscQQnCKuYSGWosp+ECD1z18nh8uZ9Z8e/nN1GMYtVLHRgbQ8C3gz8mi8n/OBdN397sofPIQEXQ=
X-Received: by 2002:a1c:cc10:: with SMTP id h16mr17654858wmb.39.1556552510370; 
 Mon, 29 Apr 2019 08:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
In-Reply-To: <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 09:41:13 -0600
X-Gmail-Original-Message-ID: <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
Message-ID: <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTowMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBAQCAtOTk5LDYgKzk5NiwxMCBAQCBzdGF0aWMgaW50IHNoYXJl
X3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4g
PiAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBnKTsKPiA+ICAgICAgbWVtX3No
YXJpbmdfcGFnZV91bmxvY2soZmlyc3RwZyk7Cj4gPgo+ID4gKyAgICBCVUdfT04oIXB1dF9jb3Vu
dCk7Cj4gPiArICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQo+ID4gKyAgICAgICAgcHV0X3BhZ2Vf
YW5kX3R5cGUoY3BhZ2UpOwo+ID4gKwo+ID4gICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAq
Lwo+ID4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+
Y291bnRfaW5mbykpCj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4KPiBJZiB0aGlzIHdh
cyB0byBoYXBwZW4gYmVmb3JlIGFsbCB0aGUgcHV0X3BhZ2VfYW5kX3R5cGUoKSBjYWxscywKPiB3
b3VsZG4ndCBpdCByZW5kZXIgdW5uZWNlc3NhcnkgdGhlIGV4dHJhIGdldF9wYWdlKCkvcHV0X3Bh
Z2UoKQo+IGFyb3VuZCB0aGlzIGNvZGUgcmVnaW9uPwoKSXQgd291bGQgLSBJIGFscmVhZHkgc2Vu
dCBhIHZlcnNpb24gb2YgdGhlIHBhdGNoIGluIHRoYXQgZm9ybSBidXQKdGhlcmUgd2FzIHVuZWFz
ZSBleHByZXNzZWQgYnkgR2VvcmdlIGdvaW5nIHRoYXQgcm91dGUgYmVjYXVzZSBvZiB0aGUKY29t
cGxleGl0eSBvZiB0aGUgY29kZSBhbmQgaW4gaGlzIHZpZXcgaXQncyB0aGUgc2FmZSBiZXQgdG8g
a2VlcCB0aGUKZXh0cmEgcmVmZXJlbmNlcy4gSSB0aGluayB0aGUgb3ZlcmhlYWQgb2YgZ3JhYmJp
bmcgdGhlIGV4dHJhCnJlZmVyZW5jZXMgaXMgbmVnbGlnaWJsZSBlbm91Z2ggdGhhdCBJJ20gbm90
IGdvaW5nIHRvIGFyZ3VlIG92ZXIgaXQuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
