Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D51298CB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 17:36:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijQdF-0005IL-I5; Mon, 23 Dec 2019 16:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a8pi=2N=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ijQdE-0005IG-3i
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 16:32:32 +0000
X-Inumbo-ID: cb77d002-25a1-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb77d002-25a1-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 16:32:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1577118743; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Rt8yHb+W94VZX9r79uVIgJYsH3LiIIfW2XxT3MI1u2A=;
 b=XJwbXeAHWoN7QwN/RyDC8qHXJa2r5ml4D3KTnSi+WP67eTV7gAzxvSu6xmwOyh/pN5srzHRD
 lmC/jG3dQZ3QiEyW2oxK9Ml9dUwYZRov+gHIP91j07wqqmLxdq6REIsTOX5hWHb2VMCQVTla
 aYFrzPZFK0CayyFczBKk+OZ1IUs=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mxa.mailgun.org with ESMTP id 5e00ec13.7f8a13560770-smtp-out-n01;
 Mon, 23 Dec 2019 16:32:19 -0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id q9so16306312wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 08:32:18 -0800 (PST)
X-Gm-Message-State: APjAAAXSCLXGo/NhD5ziV/Gt/7gItuDB2xcXLQc55O/aI/yqFZCBbHpM
 +BkN1ToIcMti5zPT4HOJTjBhGYYLLClsf2mjIxw=
X-Google-Smtp-Source: APXvYqxZx2q3jGD43FcMdW6MhO1u5pvY9M9ycxDDcsNOMn0qwRSxObCV/9m3Kjk77vPu6r/cku/7PjDhXKWieO82P64=
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr31148896wmc.168.1577118737671; 
 Mon, 23 Dec 2019 08:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
In-Reply-To: <20191223140409.32449-2-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 23 Dec 2019 09:31:42 -0700
X-Gmail-Original-Message-ID: <CABfawhkemF16-MzBTqKfzt4K_nAzYKbyx+RLWCSHkNjoO5M7qQ@mail.gmail.com>
Message-ID: <CABfawhkemF16-MzBTqKfzt4K_nAzYKbyx+RLWCSHkNjoO5M7qQ@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH V6 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3Ay
bS5jCj4gaW5kZXggNGZjOTE5YTljNS4uZGU4MzJkY2M2ZCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBAQCAtMzA3MCw2
ICszMDcwLDcwIEBAIG91dDoKPiAgICAgIHJldHVybiByYzsKPiAgfQo+Cj4gKy8qCj4gKyAqIFNl
dC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVsdGlwbGUgcGFnZXMuICBPbmx5IGF2
YWlsYWJsZSBvbiBWTVguCj4gKyAqLwoKSSBoYXZlIHRvIHNheSBJIGZpbmQgaXQgYSBiaXQgb2Rk
IHdoeSB0aGlzIGZ1bmN0aW9uIGlzIGluIHAybS5jIGJ1dAppdCdzIGRlY2xhcmF0aW9uLi4uCgo+
ICtpbnQgcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3Nf
dmVfbXVsdGkgKnN2ZSkKPiArewoKLi4uCgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
bWVtX2FjY2Vzcy5oIGIveGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaAo+IGluZGV4IGU0ZDI0
NTAyZTAuLjAwZTU5NGEwYWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21lbV9hY2Nl
c3MuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmgKPiBAQCAtNzUsNiArNzUs
OSBAQCBsb25nIHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAo+ICBp
bnQgcDJtX3NldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wg
c3VwcHJlc3NfdmUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBhbHRw
Mm1faWR4KTsKPgoKLi4gaW4gbWVtX2FjY2Vzcy5oPwoKPiAraW50IHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpICpzdXBwcmVzc192ZSk7
Cj4gKwoKSSBtZWFuLCBldmVuIGFsdHAybS5oIHdvdWxkIG1ha2Ugc29yZSBzZW5zZSBmb3IgdGhp
cy4gU28gd2hhdCdzIHRoZQpyYXRpb25hbCBiZWhpbmQgdGhhdD8KClRhbWFzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
