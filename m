Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB3D5FD7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 12:15:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJxK2-0003Q5-5y; Mon, 14 Oct 2019 10:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flUq=YH=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iJxK0-0003Q0-2B
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 10:11:24 +0000
X-Inumbo-ID: f8f8ecaa-ee6a-11e9-bbab-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8f8ecaa-ee6a-11e9-bbab-bc764e2007e4;
 Mon, 14 Oct 2019 10:11:22 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i32so9817195pgl.10
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6WI0gDjbvLg3JzSkl1yVQQFCwF5JM/S0gxkF6bM6fg=;
 b=lBY+KsDoJUg2hKJs7lp8p8z4x5tDAIj44Rj+aOGnsc7Inftl94nbqA0J0mKXUfDTYT
 QeRQihPX6F3qwA0JnLbUVxFOYnix5KjZebKetNhRYXQUuSbNc9oH58UrD5vRXY5ckaze
 Bfj3ploISAFEcjrqZuu/ms2lVfnWBhQLnitoRsqsDE/bqp3+nSuYpLdkkWiU6tXjxsiq
 B9jYhvh42Vy5qQg1ZlpbFsI/zPK1qfuvEy8mRTVUROOTZzIGss8e1qGfv6QsNX6DP8ov
 clD+1K+1Lj0yn0HyUbUfbyrab+M0EYUMY/Rh9ao7p213ftX+UygJAaKK1ziLIWpq9VJL
 ZoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6WI0gDjbvLg3JzSkl1yVQQFCwF5JM/S0gxkF6bM6fg=;
 b=Fi6udE7iOAOYgETdbLloZoPFepj0v+dXbt2RhkuHqeYZIcWCu4rzfOyYBIcIlCry5U
 dRKJbWTyT5qi38I1zKXPjagcThGYj7oKe1DfN5DfLo/hFyofD8DLHUOyyBqrZcnDuncn
 PnaGmCZJ9rvnfST1rSasAR6ITFqG+jFnGjndHO8ZlrmexW1cmw+ej+6aisJi7Nl2V1Rr
 Krj3XQcPpPkXKsuoFuha8FG4uxjVBxj4v48uboGL3EDTVHDFCBwYb6pIdAnBNs+R16DQ
 0/OnhkJ0SYW/BVzFU5H3Pv8b0z2YwLLxEQ/7Tyn846PjM7HP2D9rYLRj0/bBhK2ECc5N
 4Q4Q==
X-Gm-Message-State: APjAAAWw6KJzrvfukL643nq0XLmZVsRmfXDC0zXwKppg0ZeA1IuZ22DT
 XQoUPpFNx8QqXpLilQ5kUPQOaEiSMd3H6ztyHv8=
X-Google-Smtp-Source: APXvYqwwxxKi/wqKL8hzQH0JWvzTmEg06U0A67Gdgik5ysLzrtrS1capqHHl51ggKu1gORfFTWboMHEJXTZ5IVFyuCs=
X-Received: by 2002:a17:90a:c684:: with SMTP id
 n4mr35304592pjt.33.1571047881584; 
 Mon, 14 Oct 2019 03:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191014090910.9701-1-jgross@suse.com>
 <20191014090910.9701-2-jgross@suse.com>
In-Reply-To: <20191014090910.9701-2-jgross@suse.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 14 Oct 2019 11:11:10 +0100
Message-ID: <CACCGGhDz6nAqoKUaZ+Ud7O7Srm1ygt=6UgSrydajizJfWZsRPQ@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/2] xen/netback: fix error path of
 xenvif_connect_data()
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
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNCBPY3QgMjAxOSBhdCAxMDowOSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPiB3cm90ZToKPgo+IHhlbnZpZl9jb25uZWN0X2RhdGEoKSBjYWxscyBtb2R1bGVfcHV0KCkg
aW4gY2FzZSBvZiBlcnJvci4gVGhpcyBpcwo+IHdyb25nIGFzIHRoZXJlIGlzIG5vIHJlbGF0ZWQg
bW9kdWxlX2dldCgpLgo+Cj4gUmVtb3ZlIHRoZSBzdXBlcmZsdW91cyBtb2R1bGVfcHV0KCkuCj4K
PiBGaXhlczogMjc5ZjQzOGUzNmMwYTcgKCJ4ZW4tbmV0YmFjazogRG9uJ3QgZGVzdHJveSB0aGUg
bmV0ZGV2IHVudGlsIHRoZSB2aWYgaXMgc2h1dCBkb3duIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmc+ICMgMy4xMgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KClllcywgbG9va3MgbGlrZSB0aGlzIHNob3VsZCBoYXZlIGJlZW4gY2xlYW5lZCB1
cCBhIGxvbmcgdGltZSBhZ28uCgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5v
cmc+Cgo+IC0tLQo+ICBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyB8IDEgLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50
ZXJmYWNlLmMKPiBpbmRleCAyNDBmNzYyYjM3NDkuLjEwM2VkMDA3NzVlYiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwo+ICsrKyBiL2RyaXZlcnMvbmV0
L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jCj4gQEAgLTcxOSw3ICs3MTksNiBAQCBpbnQgeGVudmlm
X2Nvbm5lY3RfZGF0YShzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKPiAgICAgICAgIHhlbnZp
Zl91bm1hcF9mcm9udGVuZF9kYXRhX3JpbmdzKHF1ZXVlKTsKPiAgICAgICAgIG5ldGlmX25hcGlf
ZGVsKCZxdWV1ZS0+bmFwaSk7Cj4gIGVycjoKPiAtICAgICAgIG1vZHVsZV9wdXQoVEhJU19NT0RV
TEUpOwo+ICAgICAgICAgcmV0dXJuIGVycjsKPiAgfQo+Cj4gLS0KPiAyLjE2LjQKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
