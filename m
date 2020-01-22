Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7714580B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:42:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHA6-0007vv-0K; Wed, 22 Jan 2020 14:39:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdgK=3L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuHA5-0007vq-0s
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:39:17 +0000
X-Inumbo-ID: f6b7af68-3d24-11ea-8e9a-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6b7af68-3d24-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 14:39:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j26so7029096ljc.12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wREOJBun3OYZh914uuc0WBi8sxURIiHt9qe9mmMscQI=;
 b=Lbk2VWvCqv0svAZHe8QnjONWO+OiAiedMOHKO/pcOHpq9N6itOQhXIALdGMQMBlHDg
 IB3UHZz4xItLUTo/NzLeuYbPfWS+NHaGVLzc5OIbOMiVD8Stjs9GIycgGuavLEvCEmVr
 FS9ahBgIX+CQ1FxNDI4JqwtQzdBjaezG3koD1A8Tqi/go9ToDIDr3X29ZdWGc/9/YPfa
 uzVZra4aQxIBisvugY7ZO/BFMWV9Vb0AqmgX6D28ZlUGOrZd5tP9Ls83P0HG0Of05aC/
 r72Cj/qWxsCn+IqBWEx1p2kRnXqXQAlElvdtqPatkiHBI3nD9FM3GdFjFOjpH/zLx7E4
 HE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wREOJBun3OYZh914uuc0WBi8sxURIiHt9qe9mmMscQI=;
 b=LpiNmS8yXvxmNWJRwjGxkEiwEl9ZSklQlSxlrWGA55IfCG6Szil+e1i0HLYkBllY2V
 IrPRhCSYoKdD+XPbuQaIdTO7rSz0B3m0eN3ZqtWlagtNSrxHce0JGb5cwyVvgFXZ2KCq
 HqvekRlGjKoqof3ZMEYNDiLZzy6bGsrztvWoG5dLBg8Q2UC70BJijThSModV2sBzfV1X
 csKX2RxubbZ1j3ZdxpGokltsJyDY4gMLyDvOlpt+Pxvs6D00qdHeUitkWIXgISqomOBn
 16BofkWEAB7apuE6c+95bqLEE8aDrpPeZD5agMxBkCg0StTeQmrIxvQaKZHSgHEvxtsA
 OHgg==
X-Gm-Message-State: APjAAAWvdHpZKPgThy4JZtsEoOOgJHfdkGgbWMHIHE7tSw0fSqd9xTba
 lPgj3ifdgl91b808YwbWO2ttESDVul1F2uB6aWY=
X-Google-Smtp-Source: APXvYqzSHTh3FwUGD0E5uJhp/VJneAduezFZf3PcThx3XLviLu8LanyrpZR3e6raf3pxLHgzc5VGHUHfgRehXFgC6rA=
X-Received: by 2002:a2e:5357:: with SMTP id t23mr20040278ljd.227.1579703955035; 
 Wed, 22 Jan 2020 06:39:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <cd76e3559f841d3072558d9c603dc686f67d54c1.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xptXYOwWu8V-mZh5H5o+gi-O01AmAw9PEuYVu0opUCpH3A@mail.gmail.com>
 <20200121211942.GR1314@mail-itl>
In-Reply-To: <20200121211942.GR1314@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Jan 2020 09:39:04 -0500
Message-ID: <CAKf6xpsq_BB_f2sHukP5+MaD+NdZSRxvj+Qo+AuNnnOP-MXvaA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 06/16] libxl: write qemu arguments into
 separate xenstore keys
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgNDoxOSBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBK
YW4gMjAsIDIwMjAgYXQgMDI6MzY6MDhQTSAtMDUwMCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiA+
IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDk6NDEgUE0gTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpCj4gPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IFRoaXMgYWxsb3dzIHVzaW5nIGFyZ3VtZW50cyB3aXRoIHNwYWNlcywgbGlrZSAtYXBwZW5k
LCB3aXRob3V0Cj4gPiA+IG5vbWluYXRpbmcgYW55IHNwZWNpYWwgInNlcGFyYXRvciIgY2hhcmFj
dGVyLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFu
Z2VzIGluIHYzOgo+ID4gPiAgLSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggImxpYnhs
OiB1c2UgXHgxYiB0byBzZXBhcmF0ZSBxZW11Cj4gPiA+ICAgIGFyZ3VtZW50cyBmb3IgbGludXgg
c3R1YmRvbWFpbiIgdXNlZCBzcGVjaWZpYyBub24tcHJpbnRhYmxlCj4gPiA+ICAgIHNlcGFyYXRv
ciwgYnV0IGl0IHdhcyByZWplY3RlZCBhcyB4ZW5zdG9yZSBkb2Vzbid0IGNvcGUgd2VsbCB3aXRo
Cj4gPiA+ICAgIG5vbi1wcmludGFibGUgY2hhcnMKPiA+ID4gLS0tCj4gPgo+ID4gVGhlIGNvZGUg
bG9va3MgZ29vZC4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtA
Z21haWwuY29tPgo+ID4KPiA+IE9uZSB0aG91Z2h0IEkgaGF2ZSBpcyBkbWFyZ3MgaXMgYSBzdHJp
bmcgZm9yIG1pbmktb3MgYW5kIGEgZGlyZWN0b3J5Cj4gPiBmb3IgbGludXggc3R1YmRvbS4gIEl0
J3MgdG9vbHN0YWNrIG1hbmFnZWQsIHNvIGl0J3Mgbm90IGEgcHJvYmxlbS4KPiA+IEJ1dCB3b3Vs
ZCBhIGRpZmZlcmVudCB4ZW5zdG9yZSBub2RlIGJlIGxlc3Mgc3VycHJpc2luZyB0byBodW1hbnM/
Cj4KPiBkbWFyZ3NfbGlzdD8KCmRtYXJnc19saXN0IHdvcmtzLiAgZG1hcmd2IHRvIG1pbWljIGFy
Z3Y/ICBUaGF0IG1pZ2h0IGJlIHRvbyBzdWJ0bGUuCgpJJ20gbm90IGFza2luZyBmb3IgdGhlIGNo
YW5nZS4gIEkganVzdCB3YW50ZWQgdG8gYnJpbmcgaXQgdXAgZm9yIGRpc2N1c3Npb24uCgpSZWdh
cmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
