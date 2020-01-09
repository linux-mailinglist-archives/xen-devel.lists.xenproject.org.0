Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411E135A63
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 14:40:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipXzJ-0002BA-5O; Thu, 09 Jan 2020 13:36:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bIGD=26=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipXzH-0002B4-M8
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 13:36:35 +0000
X-Inumbo-ID: 0d9497ea-32e5-11ea-b89f-bc764e2007e4
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d9497ea-32e5-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 13:36:35 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q8so3398460pfh.7
 for <xen-devel@lists.xen.org>; Thu, 09 Jan 2020 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cf95WORT6GX1WJSn8Af/G1OCB1Irn/cMBwQxwXC43X4=;
 b=rmPFqplFiG2J23km4wRX/Ng/4kLCh6mrZt9F0tbMq9Fkk952L8sqSIO4o7LgYULfwU
 1KtC1gWAKTfa0XSUUAQOR/AmiotKOiyRCtMVmsyZgWl7wiNros6lsyIzVBKk/lEPxX0N
 5O4IjgJWkFY0lyOJzBgBeSNBDQagktLXZMzfFMLURXzGXfLJjyf9u7JhjvdvJVIPPoIV
 +FpzI1GmzdsT0mwz6RfBwpQvN5KYst18bnDXEZX/R66raaG4xngUb7fMMFDFr4XRrHLC
 HS0EaXm5BYy8/MMd3k9yPgsTCotJx3MtIWFki3GxVm5+umLuLYzDRu1kI/QqXQdGnzea
 4fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cf95WORT6GX1WJSn8Af/G1OCB1Irn/cMBwQxwXC43X4=;
 b=g5yIuJbQXIcSjx8af4YGg/TDTzESyrh2TyHYJjnHAnRQ4fgGIa7BvxDQd5LafUlW2v
 dyKhpvAt4pWQn08bYO/NvAtLf4nydKG+NROEhS68ywHwJEam2MqmOzpvlX0aoTtJj1vN
 EP8Uc96ry/Xke/ScfbzZtvYNRE8o8NTI2vabT4Z5I2Q6tWANfzr7AZ6PKCe8tjMD1+8H
 8nJQFdrgJud2O3YML/4KeCZS5/dknxWsrsWNVO09GP/2gzdnTkePSEjoRYMHbkwG367P
 ZcSph2M8BhOaTsYLT6xKuA6OP1z3KEBFwzbtN/ZQRcQGyRDQL5NccgGcE/x2gjjcCc4Z
 gKpg==
X-Gm-Message-State: APjAAAV+9OZjoMr3xVYXZVj1oIatmS5xl3J0wkOmJYfrlrrdIlHRW1aN
 hC19VWrniCjHE6DXqiGEZyOkCKv4enoB8REdndY=
X-Google-Smtp-Source: APXvYqzYs38vcWA8XTYQ6/bQR6VN+il7W5RyHWICEMlfnkK4VOVNx6yJKOpUbeM/o/gNmhfTvQD92qFBUgw0+jdnlik=
X-Received: by 2002:a63:3dc6:: with SMTP id
 k189mr10954174pga.396.1578576993895; 
 Thu, 09 Jan 2020 05:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
 <20200108152100.7630-5-sergey.dyasli@citrix.com>
In-Reply-To: <20200108152100.7630-5-sergey.dyasli@citrix.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Thu, 9 Jan 2020 13:36:22 +0000
Message-ID: <CACCGGhCGcdEq7CC3J0201ETvAd+PZ2fTDNUS3mo599Tuf-61yA@mail.gmail.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [Xen-devel] [PATCH v1 4/4] xen/netback: Fix grant copy across
 page boundary with KASAN
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xen.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA4IEphbiAyMDIwIGF0IDE1OjIxLCBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xp
QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+Cj4KPiBXaGVuIEtBU0FOIChvciBTTFVCX0RFQlVHKSBpcyB0dXJuZWQg
b24sIHRoZSBub3JtYWwgZXhwZWN0YXRpb24gdGhhdAo+IGFsbG9jYXRpb25zIGFyZSBhbGlnbmVk
IHRvIHRoZSBuZXh0IHBvd2VyIG9mIDIgb2YgdGhlIHNpemUgZG9lcyBub3QKPiBob2xkLiBUaGVy
ZWZvcmUsIGhhbmRsZSBncmFudCBjb3BpZXMgdGhhdCBjcm9zcyBwYWdlIGJvdW5kYXJpZXMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5j
b20+Cj4gLS0tCj4gUkZDIC0tPiB2MToKPiAtIEFkZGVkIEJVSUxEX0JVR19PTiB0byB0aGUgbmV0
YmFjayBwYXRjaAo+IC0geGVudmlmX2lkeF9yZWxlYXNlKCkgbm93IGxvY2F0ZWQgb3V0c2lkZSB0
aGUgbG9vcAo+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9yZz4KPiBDQzogUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+CltzbmlwXQo+Cj4gK3N0YXRpYyB2b2lkIF9faW5pdCBfX21h
eWJlX3VudXNlZCBidWlsZF9hc3NlcnRpb25zKHZvaWQpCj4gK3sKPiArICAgICAgIEJVSUxEX0JV
R19PTihzaXplb2Yoc3RydWN0IHhlbnZpZl90eF9jYikgPiA0OCk7CgpGSUVMRF9TSVpFT0Yoc3Ry
dWN0IHNrX2J1ZmYsIGNiKSByYXRoZXIgdGhhbiBhIG1hZ2ljICc0OCcgSSB0aGluay4KCiAgUGF1
bAoKPiArfQo+ICsKPiAgTU9EVUxFX0xJQ0VOU0UoIkR1YWwgQlNEL0dQTCIpOwo+ICBNT0RVTEVf
QUxJQVMoInhlbi1iYWNrZW5kOnZpZiIpOwo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
