Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36773128309
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 21:08:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOWi-0006q6-Uj; Fri, 20 Dec 2019 20:05:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiOWh-0006ps-2R
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 20:05:31 +0000
X-Inumbo-ID: 0dabbb68-2364-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dabbb68-2364-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 20:05:22 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c127so2530971wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 12:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=NiRw5B0PkZaDhMGdwjtuCVIx3tzPxJOvAX91c1WGDnE=;
 b=Ww88mLEiLrkA6c+LvHRi4Nn0A1LwJOQrAHPQEhhnvXYqkLZ2W7fnDzYuVjVplRLZyo
 5VELDQDqDxpHR9RDtmjzftmpwFrbHtOjB5ok4JS5lAoTEqx7DoBrleL+Am+X12L5FPc5
 uLbBpXgMoCKUiMMhx1Zej/n7iuYvg9oc8mUJVAam5e4ZXrMNxBSpCObeY1+lOffNxCCp
 5/bDKyIa9rd4vTCL06qfaD4MXnvbA/t/xfs1/Qg00vPlnXP73ywHb8W2la+5R22fiZt/
 jUi5TDB1e9TxIsdqOeB5nO8Or8ss5GZP6Kuzc86yVdtOypOahJtyBdixFRG4ko/SRnYU
 1TYA==
X-Gm-Message-State: APjAAAXHIYAa1Xpfdy+kmw3lQRuAJlU//zI2FF/4v/MqkrqGVDuv4qD9
 qiHfpE8EIhfrE/DZ/j4JloY=
X-Google-Smtp-Source: APXvYqw2j+Mi04IbRfXZAyL93w78s0tzYw8SVEoiX6d9WuIXiFB3gOM6uJs/5mX0lplTnb+lzBAe7Q==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr17261860wmm.145.1576872321612; 
 Fri, 20 Dec 2019 12:05:21 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id p26sm10479850wmc.24.2019.12.20.12.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 12:05:21 -0800 (PST)
Date: Fri, 20 Dec 2019 20:05:19 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191220200519.765smknio75kty4e@debian>
References: <20191220194749.19692-1-liuwe@microsoft.com>
 <0b3f3a90-a8ae-caed-9ed9-33a0dc5cfe97@citrix.com>
 <CAK9nU=oeK0X8QAGw2Wwu+E01kymXKWDiu39KfZqrKqR+5J6ABw@mail.gmail.com>
 <41fc8ae8-690e-57d0-633d-60f789b3a243@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41fc8ae8-690e-57d0-633d-60f789b3a243@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86: Hyper-V clock source's offset should
 be signed
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <JBeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMDg6MDQ6MTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMC8xMi8yMDE5IDIwOjAyLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gRnJpLCAy
MCBEZWMgMjAxOSBhdCAxOTo1NywgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4gPj4gT24gMjAvMTIvMjAxOSAxOTo0NywgV2VpIExpdSB3cm90ZToKPiA+
Pj4gRml4ZXM6IDY4NWQxNmJkNSAoeDg2OiBpbXBsZW1lbnQgSHlwZXItViBjbG9jayBzb3VyY2Up
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPj4+
IC0tLQo+ID4+PiBJIGRpc2NvdmVyIHRoaXMgc3R1cGlkIG1pc3Rha2Ugd2hlbiBJIHdvcmsgb24g
ZXh0cmFjdGluZyBjb21tb24gY29kZQo+ID4+PiBmcm9tIHZpcmlkaWFuIGFuZCB0aGUgY2xvY2sg
c291cmNlIGltcGxlbWVudGF0aW9uLgo+ID4+IERvZXMgaXQgbWFrZSBhIHByYWN0aWNhbCBkaWZm
ZXJlbmNlPwo+ID4+Cj4gPiBQcm9iYWJseSBub3QuIFRoZSBzcGVjcyBzYXlzIHRoYXQgZmllbGQg
aXMgc2lnbmVkLCBzbyBvdXIgY29kZSBzaG91bGQKPiA+IHJlZmxlY3QgdGhhdC4KPiAKPiBGYWly
IGVub3VnaC7CoCBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gKHdpdGgKPiB0aGUgaW5saW5lIGZpeCBhcyB3ZWxsKQoKVGhhbmtzLiBJIHdpbGwgY29t
bWl0IHRoaXMgbm93LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
