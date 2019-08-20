Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A8963BD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 17:08:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i05h1-0005Ga-OW; Tue, 20 Aug 2019 15:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3t4G=WQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i05gz-0005GS-II
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 15:05:01 +0000
X-Inumbo-ID: e0de5d1a-c35b-11e9-9ab1-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0de5d1a-c35b-11e9-9ab1-bc764e2007e4;
 Tue, 20 Aug 2019 15:05:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l14so5435677ljj.9
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JvMqBuk7ekE9JzwNoNe/4JRrIrYmSDD5e+dZeYF0vhQ=;
 b=I8gLrCW4YlriV7+pzVQpCdFCTD80bo1e1cWoka3G7i7kodMYv15KfQbAS8P+qJfOte
 bBMxbWrzcgDRRR24yOoxMLQyHxmSCLFEKSFskEKlEfas/QAvYHfu0/njN3lUBu+8tWAH
 ph+56wjnqk//G8KNSLjc4Bw1vi6RCIWGD2B2DV/AvTd6wOeNG6sqzch/H7t8yvfW8yyh
 qS2vHuXOGOtAYfKgm64dOm3owfss3lpgtB3xUERIjvN8jyHmoc3ucTfaDi8ThjFrJ5xI
 YZPlXZ+Icyetoa+oJTpvvpyMBlT/Tq/C+Ht8yRe9uoPtGLxOnVcHn/mJxs2LWqNQB3IR
 5OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JvMqBuk7ekE9JzwNoNe/4JRrIrYmSDD5e+dZeYF0vhQ=;
 b=nIXUS2Zu1xN8js69XMIPQVaF8jl9w401RQYJtmDtUcnfZHN9hGSV/XvX4Yidl7gHQo
 BFmCC1KXMCSo8gQkgf0cSO6PUH/aFynXYfHfKmRQuUZNwEOKQ4dd7L1m7sDj5ouuw01U
 rsdF4E2fxL9yED1qbCUvxXKE/8blDlcx3dtcmd71F0FWGiTF7cBzSOB4xMwJwI2L+714
 uSkX2fMHp9fGPcd6VP1SX56EKWk+J7SrlTehov5FE2LU8fbN3/9Pxttpabrp3rDl02+e
 XgJRJw6Q7iJscTLk3q/hyVnOeINTTLHD6+Af63VU7xaR9H1DGOHOHInm8gey2vl3LjMY
 b5Vw==
X-Gm-Message-State: APjAAAUU3htvQYz/DmBCg0u2dfTnyP19NVxLX9fTy1AtCTkC7M/NN85g
 CHJJEw6wptU+2iidCwQpJWA=
X-Google-Smtp-Source: APXvYqyfuGywYslBSyMcYySslky7f/Z8M9LA8PKTWUnPHu7mpZfPZyc2yJHWZkceS+L9fqAKl3b1kA==
X-Received: by 2002:a2e:9905:: with SMTP id v5mr15811475lji.162.1566313498887; 
 Tue, 20 Aug 2019 08:04:58 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r16sm2833567lji.33.2019.08.20.08.04.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 08:04:58 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190812202735.23411-1-julien.grall@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1ec280ed-bc3f-9334-ac8d-833b3c323c5d@gmail.com>
Date: Tue, 20 Aug 2019 18:04:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812202735.23411-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: p2m: Free the p2m entry after
 flushing the IOMMU TLBs
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
Cc: oleksandr_tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEyLjA4LjE5IDIzOjI3LCBKdWxpZW4gR3JhbGwgd3JvdGU6CgpIaSwgSnVsaWVuCgo+IFdo
ZW4gZnJlZWluZyBhIHAybSBlbnRyeSwgYWxsIHRoZSBzdWItdHJlZSBiZWhpbmQgaXQgd2lsbCBh
bHNvIGJlIGZyZWVkLgo+IFRoaXMgbWF5IGluY2x1ZGUgaW50ZXJtZWRpYXRlIHBhZ2UtdGFibGVz
IG9yIGFueSBsMyBlbnRyeSByZXF1aXJpbmcgdG8KPiBkcm9wIGEgcmVmZXJlbmNlIChlLmcgZm9y
IGZvcmVpZ24gcGFnZXMpLiBBcyBzb29uIGFzIHBhZ2VzIGFyZSBmcmVlZCwKPiB0aGV5IG1heSBi
ZSByZS11c2VkIGJ5IFhlbiBvciBhbm90aGVyIGRvbWFpbi4gVGhlcmVmb3JlIGl0IGlzIG5lY2Vz
c2FyeQo+IHRvIGZsdXNoICphbGwqIHRoZSBUTEJzIGJlZm9yZWhhbmQuCj4KPiBXaGlsZSBDUFUg
VExCcyB3aWxsIGJlIGZsdXNoZWQgYmVmb3JlIGZyZWVpbmcgdGhlIHBhZ2VzLCB0aGlzIGlzIG5v
dAo+IHRoZSBjYXNlIGZvciBJT01NVSBUTEJzLiBUaGlzIGNhbiBiZSBzb2x2ZWQgYnkgbW92aW5n
IHRoZSBJT01NVSBUTEJzCj4gZmx1c2ggZWFybGllciBpbiB0aGUgY29kZS4KPgo+IFRoaXMgd2Fz
bid0IGNvbnNpZGVyZWQgYXMgYSBzZWN1cml0eSBpc3N1ZSBhcyBkZXZpY2UgcGFzc3Rocm91Z2gg
b24gQXJtCj4gaXMgbm90IHNlY3VyaXR5IHN1cHBvcnRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4KPiAtLS0KPgo+IENjOiBvbGVrc3R5
c2hAZ21haWwuY29tCj4gQ2M6IG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tCj4KPiAgICAg
IEkgZGlzY292ZXJlZCBpdCB3aGlsZSBsb29raW5nIGF0IHRoZSBjb2RlLCBzbyBJIGRvbid0IGhh
dmUgYW55Cj4gICAgICByZXByb2R1Y2VyIG9mIHRoZSBpc3N1ZS4gVGhlcmUgaXMgYSBzbWFsbCB3
aW5kb3dzIHdoZXJlIHBhZ2UgY291bGQKPiAgICAgIGJlIHJlYWxsb2NhdGVkIHRvIFhlbiBvciBh
bm90aGVyIGRvbWFpbiBidXQgc3RpbGwgcHJlc2VudCBpbiB0aGUKPiAgICAgIElPTU1VIFRMQnMu
CgpJIGhhdmVuJ3QgcmVwcm9kdWNlZCB0aGlzIGlzc3VlIGFzIHdlbGwuCgpTbywgbXkgdGVzdGlu
ZyBoZXJlIGlzIHJhdGhlciBmb3JtYWwgdG8gYmUgc3VyZSB0aGF0IHBhdGNoIGRvZXNuJ3QgYnJl
YWsgCmFueXRoaW5nLgoKCllvdSBjYW4gYWRkIChpZiBuZWVkZWQpOgoKVGVzdGVkLWJ5OiBPbGVr
c2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CgoKPiAgICAg
IFRoaXMgcGF0Y2ggb25seSBhZGRyZXNzIHRoZSBjYXNlIHdoZXJlIHRoZSBmbHVzaCBzdWNjZWVk
LiBJbiB0aGUKPiAgICAgIHVubGlrZWx5IGNhc2Ugd2hlcmUgaXQgZG9lcyBub3Qgc3VjY2VlZCwg
dGhlbiB3ZSB3aWxsIHN0aWxsIGZyZWUgdGhlCj4gICAgICBwYWdlcy4gVGhlIElPTU1VIGhlbHBl
ciB3aWxsIGNyYXNoIGRvbWFpbiwgYnV0IHRoZSBkZXZpY2UgbWF5IHN0aWxsCj4gICAgICBub3Qg
YmUgcXVpZXNjZW50LiBTbyB0aGVyZSBhcmUgYSBwb3RlbnRpYWxseSBpc3N1ZXMgZG8gRE1BIG9u
IHdyb25nCj4gICAgICB0aGluZ3MuCj4KPiAgICAgIEF0IHRoZSBtb21lbnQsIG5vbmUgb2YgdGhl
IEFybSBJT01NVXMgZHJpdmVycyAoaW5jbHVkaW5nIHRoZSBJUE1NVQo+ICAgICAgb25lIHVuZGVy
IHJldmlldykgYXJlIHJldHVybiBhbiBlcnJvciBoZXJlLiBOb3RlIHRoYXQgZmx1c2ggbWF5Cj4g
ICAgICBzdGlsbCBmYWlsIChzZWUgdGltZW91dCksIGJ1dCBpcyBpZ25vcmVkLiBUaGlzIGlzIG5v
dCBncmVhdCBhcyBpdAo+ICAgICAgbWVhbnMgYSBkZXZpY2UgbWF5IERNQSBpbnRvIHNvbWV0aGlu
ZyB0aGF0IGRvZXMgbm90IGJlbG9uZyB0byB0aGUKPiAgICAgIGRvbWFpbi4gU28gd2UgcHJvYmFi
bHkgd2FudCB0byByZXR1cm4gYW4gZXJyb3IgaGVyZS4KCk1ha2VzIHNlbnNlLgoKCltJIGhhdmVu
J3QgYmVlbiBmYWNpbmcgZmx1c2ggdGltZW91dCBpc3N1ZSBzaW5jZSBzdGFydCBwbGF5aW5nIHdp
dGggCklQTU1VLi4uXQoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
