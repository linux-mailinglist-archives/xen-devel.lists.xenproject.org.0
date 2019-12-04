Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F703112372
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 08:17:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icOqb-0007lo-Jd; Wed, 04 Dec 2019 07:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W6bj=Z2=gmail.com=jeremi.piotrowski@srs-us1.protection.inumbo.net>)
 id 1icOqa-0007lj-2j
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 07:13:16 +0000
X-Inumbo-ID: 89971134-1665-11ea-aea8-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89971134-1665-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 07:13:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b11so5790640wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XXy7kGyUdHAVGewn1kx0MHi2b86jUR7obPg9Ey6M1gc=;
 b=BgB1XU1H0NKNrdYv4hQebpxCY7Mz8hvBQ7Ssb69R4ihiXiS2kc21k3z6J25ATENQl4
 oTd8AWOYUfuhhSIIZWxzF9t/d/EBsz+jnsCreeT/1JSVCRWwh9Pt3/4WJDKwrTuxE0P/
 5wkND7g8D0JsZt3YRquQgJ87NBWKUO8oXbaQHlXd7YLKt2OIG7lPtQMSygAmLbXqPckO
 KpKk2LNVh/IIccDrxsWTXQ2NKtMQoO6+iD3tclOS32qnJBO3ads1dVU1Ux1xTSUq0ZAS
 oeDSZ/GRv44YUfQ/jMibOWSYatGhix6aXntkbNaSakc/7v5Q4egtdmmqWiOqbWxHMg4h
 XDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XXy7kGyUdHAVGewn1kx0MHi2b86jUR7obPg9Ey6M1gc=;
 b=eEdMKF+dVJMSsHTMwozLM4iy8DbMkm4afYhyk7NRSIEmOxN+pu00taQdf+bKsuHtJt
 hjfGle7z9ZZXjfG25CIaEehqf8vvAm/KIsHRFx0jyH4S8zedLZ+z889PfpbWEMOJUHne
 ypPzt3M+ov/bn0zgGPr3XjgdmBjMZ/EO4P6ibmUTL5Fam7d7rMo7kMNxBGZf1tWrc1oM
 UWgm2/n+5qOhIuDsolfu13IedzBm3AVE0Bfx1QK5RU7HEaEoQ1EZZfJS3iZX6kbU17aX
 nR4UnyDcE8WrXnAvLoqEJQlBC9GNo1z606Y67JGCiXesubgWobZIB5ufNnajNN7A9ohj
 7ESQ==
X-Gm-Message-State: APjAAAWFJnvCPj9rJ/FUm8wxjVENWKwngssv15GMrC2VqMpoCf9aklcf
 wSzMILAHfICmzDTDC71IgBg=
X-Google-Smtp-Source: APXvYqzIHSP9rZVVQnxgAEK0KLrclLuxXavJyNqJ1/93WQl3TEWgvwJiHmgSHcTtXJjKMsnIJ3Do3A==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr37346693wmb.167.1575443593931; 
 Tue, 03 Dec 2019 23:13:13 -0800 (PST)
Received: from gentoo-tp.home ([2a02:908:1086:7e00:b6c5:9957:10c9:5b67])
 by smtp.gmail.com with ESMTPSA id e6sm6161439wru.44.2019.12.03.23.13.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Dec 2019 23:13:12 -0800 (PST)
Date: Wed, 4 Dec 2019 08:14:33 +0100
From: Jeremi Piotrowski <jeremi.piotrowski@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204071433.GA5806@gentoo-tp.home>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
 <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
 <20191201174714.GA13968@gentoo-tp.home>
 <68a03bc4-2f75-4327-8089-f6724c1d867c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68a03bc4-2f75-4327-8089-f6724c1d867c@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDk6MDI6MThBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDEuMTIuMjAxOSAxODo0NywgSmVyZW1pIFBpb3Ryb3dza2kgd3JvdGU6Cj4gPiBP
biBUaHUsIE9jdCAyNCwgMjAxOSBhdCAxMDoxMjoxOUFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAyMy4xMC4yMDE5IDIyOjMzLCBQcnkgTWFyIHdyb3RlOgo+ID4+PiBIZWxsbyB4
ZW4tZGV2ZWwsCj4gPj4+Cj4gPj4+IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC9wbGFpbi8xMTA5
Mzc0Cj4gPj4+Cj4gPj4+IHNob3dzIG15IHRyYWNlcyBmcm9tIGEgaGVhbHRoeSBDZW50T1MgOCwg
eGVuLTQuMTIuMSBkb20wIHdoZW4gdHJ5aW5nCj4gPj4+IHRvIGxhdW5jaCBhIHB2IGluc3RhbGwg
b2YgdGhlIG5ld2x5IHJlbGVhc2VkIHViMTkxMC4gVGhlIHNvdXJjZSBpcyBhCj4gPj4+IGJsb2Nr
LWF0dGFjaGVkIElTTyBhbmQgdGhlIGtlcm5lbC9yYW1kaXNrIHdhcyBjb3BpZWQgb2ZmIGxvY2Fs
bHkuCj4gPj4KPiA+PiBXb3VsZCB5b3UgcGxlYXNlIGluY3JlYXNlIHZlcmJvc2l0eSAoeGwgLXZ2
diBjcmVhdGUgLi4uKSBzdWNoIHRoYXQgd2UKPiA+PiBjYW4gc2VlIHdoYXQgZXhhY3RseSB0aGUg
ZGVjb21wcmVzc2lvbiBjb2RlIGRvZXNuJ3QgbGlrZSBhYm91dCB0aGlzCj4gPj4ga2VybmVsIGlt
YWdlPwo+ID4gCj4gPiBJIHN0dW1ibGVkIGFjcm9zcyB0aGUgc2FtZSBpc3N1ZSwgYmVsb3cgaXMg
dGhlIHhsIC12dnZ2IGNyZWF0ZSBvdXRwdXQuCj4gPiAKPiA+IFBhcnNpbmcgY29uZmlnIGZyb20g
dWJ1bnR1LmNmZwo+ID4gbGlieGw6IGRlYnVnOiBsaWJ4bF9jcmVhdGUuYzoxNjkzOmRvX2RvbWFp
bl9jcmVhdGU6IERvbWFpbiAwOmFvIDB4NTVhNTk4ZTc3MTkwOiBjcmVhdGU6IGhvdz0obmlsKSBj
YWxsYmFjaz0obmlsKSBwb2xsZXI9MHg1NWE1OThlNzQwNDAKPiA+IGxpYnhsOiBkZWJ1ZzogbGli
eGxfZGV2aWNlLmM6Mzk3OmxpYnhsX19kZXZpY2VfZGlza19zZXRfYmFja2VuZDogRGlzayB2ZGV2
PXh2ZGEgc3BlYy5iYWNrZW5kPXVua25vd24KPiA+IGxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNl
LmM6MzU4OmRpc2tfdHJ5X2JhY2tlbmQ6IERpc2sgdmRldj14dmRhLCBiYWNrZW5kIHBoeSB1bnN1
aXRhYmxlIGR1ZSB0byBmb3JtYXQgcWNvdzIKPiA+IGxpYnhsOiBkZWJ1ZzogbGlieGxfZGV2aWNl
LmM6NDMxOmxpYnhsX19kZXZpY2VfZGlza19zZXRfYmFja2VuZDogRGlzayB2ZGV2PXh2ZGEsIHVz
aW5nIGJhY2tlbmQgcWRpc2sKPiA+IGxpYnhsOiBkZWJ1ZzogbGlieGxfY3JlYXRlLmM6MTAxODpp
bml0aWF0ZV9kb21haW5fY3JlYXRlOiBEb21haW4gMTE6cnVubmluZyBib290bG9hZGVyCj4gPiBs
aWJ4bDogZGVidWc6IGxpYnhsX2Jvb3Rsb2FkZXIuYzozMzQ6bGlieGxfX2Jvb3Rsb2FkZXJfcnVu
OiBEb21haW4gMTE6bm8gYm9vdGxvYWRlciBjb25maWd1cmVkLCB1c2luZyB1c2VyIHN1cHBsaWVk
IGtlcm5lbAo+ID4gbGlieGw6IGRlYnVnOiBsaWJ4bF9ldmVudC5jOjY4OTpsaWJ4bF9fZXZfeHN3
YXRjaF9kZXJlZ2lzdGVyOiB3YXRjaCB3PTB4NTVhNTk4ZTgyN2E4OiBkZXJlZ2lzdGVyIHVucmVn
aXN0ZXJlZAo+ID4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21fYWxsb2NhdGU6IGNtZGxp
bmU9IiIsIGZlYXR1cmVzPSIiCj4gPiBsaWJ4bDogZGVidWc6IGxpYnhsX2RvbS5jOjc5OTpsaWJ4
bF9fYnVpbGRfcHY6IHB2IGtlcm5lbCBtYXBwZWQgMCBwYXRoIC90YW5rL3hlbnNjcmF0Y2gvdWJ1
bnR1L3ZtbGludXotNS4zLjAtMjMtZ2VuZXJpYwo+ID4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4
Y19kb21fa2VybmVsX2ZpbGU6IGZpbGVuYW1lPSIvdGFuay94ZW5zY3JhdGNoL3VidW50dS92bWxp
bnV6LTUuMy4wLTIzLWdlbmVyaWMiCj4gPiBkb21haW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9t
YWxsb2NfZmlsZW1hcCAgICA6IDExMTMyIGtCCj4gPiBkb21haW5idWlsZGVyOiBkZXRhaWw6IHhj
X2RvbV9ib290X3hlbl9pbml0OiB2ZXIgNC4xMiwgY2FwcyB4ZW4tMy4wLXg4Nl82NCB4ZW4tMy4w
LXg4Nl8zMnAgCj4gPiBkb21haW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9wYXJzZV9pbWFnZTog
Y2FsbGVkCj4gPiBkb21haW5idWlsZGVyOiBkZXRhaWw6IHhjX2RvbV9maW5kX2xvYWRlcjogdHJ5
aW5nIG11bHRpYm9vdC1iaW5hcnkgbG9hZGVyIC4uLiAKPiA+IGRvbWFpbmJ1aWxkZXI6IGRldGFp
bDogbG9hZGVyIHByb2JlIGZhaWxlZAo+ID4gZG9tYWluYnVpbGRlcjogZGV0YWlsOiB4Y19kb21f
ZmluZF9sb2FkZXI6IHRyeWluZyBIVk0tZ2VuZXJpYyBsb2FkZXIgLi4uIAo+ID4gZG9tYWluYnVp
bGRlcjogZGV0YWlsOiBsb2FkZXIgcHJvYmUgZmFpbGVkCj4gPiBkb21haW5idWlsZGVyOiBkZXRh
aWw6IHhjX2RvbV9maW5kX2xvYWRlcjogdHJ5aW5nIExpbnV4IGJ6SW1hZ2UgbG9hZGVyIC4uLiAK
PiA+IGRvbWFpbmJ1aWxkZXI6IGRldGFpbDogTFo0IGRlY29tcHJlc3Npb24gZXJyb3I6IGRlY29k
aW5nIGZhaWxlZAo+IAo+IFRoaXMgc3VnZ2VzdHMgdGhhdCB0aGUgZGVjb2RpbmcgbG9naWMgZGlk
bid0IGxpa2UgdGhlIGlucHV0LiBTaW5jZSBhcwo+IHBlciB0aGUgb3RoZXIgbWFpbCBtYW51YWwg
ZGVjb21wcmVzc2lvbiB3b3JrcywgdGhpcyB3aWxsIGxpa2VseSBuZWVkCj4gZGVidWdnaW5nIGJ5
IHNvbWVvbmUgYWJsZSB0byByZXByby4KPiAKPiBKYW4KCkknbSBhYmxlIHRvIHJlcHJvLCBhbmQg
SSBpc29sYXRlZCB0aGUgY29kZSBmcm9tIHhjX2RvbV9iemltYWdlbG9hZGVyLmMsCnhjX2RvbV9k
ZWNvbXByZXNzX2x6NC5jIGFuZCAveGVuL2NvbW1vbi9sejQvZGVjb21wcmVzcy5jIHN1Y2ggdGhh
dCBJIGNhbgp0ZXN0IG1vcmUgZWFzaWx5IChJJ20gdXNpbmcgY29kZSBmcm9tIDQuMTIuMSkuIEkn
bSB0ZXN0aW5nIHdpdGgKdm1saW51ei01LjMuMC0yMy1nZW5lcmljIGluc3RhbGxlZCBpbiB1YnVu
dHUtMTkuMTAuCgpXaGF0IEkgc2VlIGlzIHRoYXQgdGhlIGNvZGUgZmFpbHMgYXQgdGhlIGZpcnN0
IGZyYW1lIGF0IGRlY29tcHJlc3MuYzoyODIKKGlmICh1bmxpa2VseSgodW5zaWduZWQgbG9uZylj
cHkgPCAodW5zaWduZWQgbG9uZylvcCkpKS4KYmVjYXVzZSBjcHkgPT0gKG9wIC0gMSkuCmRlY29t
cHJlc3MuYzoyNjUgKGNweSA9IG9wICsgbGVuZ3RoIC0gKFNURVBTSVpFLTQpOykgZ2V0cyBleGVj
dXRlZCB0d2ljZSBhbmQKcHJpbnRzOgoKbGVuZ3RoPTQKbGVuZ3RoPTMKClNURVBTSVpFIGlzIDgg
KHg4Nl82NCkuIFNvIHRoaXMgaGFzIHRvIGZhaWwuIFRoZSBTVEVQU0laRSBnYXZlIG1lIHRoZQpp
ZGVhIHRvIHJlYnVpbGQgdGhlIGNvZGUgYXMgMzItYml0IGFuZCBkZWNvbXByZXNzaW9uIHdvcmtz
IGNvcnJlY3RseS4KCkFueSBzdWdnZXN0aW9ucyBob3cgdG8gcHJvY2VlZD8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
