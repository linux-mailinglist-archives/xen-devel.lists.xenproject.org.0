Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97014580A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:42:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHAg-0007yN-As; Wed, 22 Jan 2020 14:39:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdgK=3L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuHAf-0007yG-Ff
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:39:53 +0000
X-Inumbo-ID: 0c977e08-3d25-11ea-b833-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c977e08-3d25-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 14:39:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so7090956ljh.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 06:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OIPGSdnV2sqdRcTjXwfT1tIve1n+sXhTHjvfAlq5mvk=;
 b=j1m4+0VJYPEQdKBCUbfwv488IFW/Zcy/jYrXmsMosP65GhsMT8R/J6z4t78BPbzu5W
 bH41fg+eZWjy+4mzbjdIRYKvxG9vmJtepjcxqcUsLGlCiHxbsmV6ZqtO1AM7U/ddqjkU
 MJyQ0tuB9yU94jeUnAOeRtKmQRPO0zxPrvrA4wJzin2MG+YN3QZjmkkGUoiTjE2YGLH+
 /iDOQizpExriOJKm1s1AQUrUQP7jRs5KsPvG+W5SizvmfWZpMiJ1VoNPSmVk25Z4F7/c
 dKPkkWxfArvVRCxNZLWzMfBVNBv72wdnkQGXYOYqcldRr+pLt+KnMmUWFMTwopVAPVgs
 8q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OIPGSdnV2sqdRcTjXwfT1tIve1n+sXhTHjvfAlq5mvk=;
 b=TSgNO1gCA2rXJ1GGz8Oiunzpp2ySevjc2xJsc6nq/9+0Ojhz9/3VMSzcj6RrnAB+Al
 9rPcL+co8AN0gzKpyv++RGCV3uZYE8XFp7Jmnr2eAvVcPdXQ1OONjuPO9burVw1iNg6I
 FTBs+JIr4FhUs8YAOP7tVZOzAPyMtgt0ItieB9Bcmh5xtU1I/wTLKcyR3cWsuh4uoAPO
 0LDqGywxmvMbjuRzvebai+rkmJOL4jLZO6hERqTLxx3wrURMbkgIMXlAyRAy680b70rV
 UlJlyaT93qfIawB1PO2nOssguL4gLVlMYD9CUPN198vBAmS0ZBZt1QB2eHLjWgyYPp+I
 dRcw==
X-Gm-Message-State: APjAAAUtRrTWHa17B/QZodige1mv3DEvKeLQUHRX6a9none8qnJQzsnT
 NZ4vTf/rP/l0FHTXTXpRctFsKbPeVDLkLiHjImo=
X-Google-Smtp-Source: APXvYqxwh0nPxBoUHsOypvt4fl56uKV8KHJ0QA4Ns5BVOj+nWorkzfsFkC0dFLaTyW3j1HI+/LcEYoCmfJgAvcmnfF4=
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr20554526lji.274.1579703991877; 
 Wed, 22 Jan 2020 06:39:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <25fe2a1f9840ac0e6ca962b218013da0d1a46982.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpvf3syzz2ck1fWbmK_1xrL8LD3=bqO9SWeb6L44hhueJg@mail.gmail.com>
 <20200121212215.GS1314@mail-itl>
In-Reply-To: <20200121212215.GS1314@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Jan 2020 09:39:39 -0500
Message-ID: <CAKf6xpt38PUbZQR8fDwXdEMKpaz_tuuh=9Bfr0r-ARCKGGweHQ@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 07/16] xl: add stubdomain related options
 to xl config parser
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgNDoyMiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBK
YW4gMjAsIDIwMjAgYXQgMDI6NDE6MDdQTSAtMDUwMCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiA+
IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDk6NDAgUE0gTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpCj4gPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtA
aW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsg
PGphbmRyeXVrQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkb2NzL21hbi94bC5jZmcuNS5w
b2QuaW4gfCAyMyArKysrKysrKysrKysrKysrKysrLS0tLQo+ID4gPiAgdG9vbHMveGwveGxfcGFy
c2UuYyAgICAgIHwgIDcgKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW4v
eGwuY2ZnLjUucG9kLmluIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCj4gPiA+IGluZGV4IDI0
NWQzZjkuLjZhZTBiZDAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5p
bgo+ID4gPiArKysgYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPiA+ID4gQEAgLTI3MjAsMTAg
KzI3MjAsMjUgQEAgbW9kZWwgd2hpY2ggdGhleSB3ZXJlIGluc3RhbGxlZCB3aXRoLgo+ID4gPgo+
ID4gQWxzbzoKPiA+Cj4gPiArPWl0ZW0gQjxzdHViZG9tYWluX21lbW9yeT1NQllURVM+Cj4gPiAr
Cj4gPiArU3RhcnQgdGhlIHN0dWJkb21haW4gd2l0aCBNQllURVMgbWVnYWJ5dGVzIG9mIFJBTS4K
Pgo+IEFkZGVkLCB0b2dldGhlciB3aXRoIGRlZmF1bHQgdmFsdWUuCgpUaGFua3MuICBHb29kIGlk
ZWEgdG8gYWRkIHRoZSBkZWZhdWx0LgoKUmVnYXJkcywKSmFzb24KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
