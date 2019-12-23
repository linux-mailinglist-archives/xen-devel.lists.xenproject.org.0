Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD5129440
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 11:35:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijL1V-0008D3-Cr; Mon, 23 Dec 2019 10:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z6Dt=2N=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ijL1U-0008CJ-7d
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 10:33:12 +0000
X-Inumbo-ID: 9df5d142-256f-11ea-96bb-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9df5d142-256f-11ea-96bb-12813bfff9fa;
 Mon, 23 Dec 2019 10:33:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c127so6820600wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 02:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RDEbiX1PgPIs9DfBlPsjrzCUQWJkeJV7WO+aGYDxCDw=;
 b=cPxosAtA6pzKQI2T3BFTIM4/G6f/Cq4m6c6/oTOWZNH6GrNeP5fOOGQPwTjHQdlUco
 Zm2Uo/QQSvxlCTTrSb0Qnj3H5ML8PMkBz12L6jLVfYBDijZMm61zIYb7YLjS5t3hWAN/
 JxjJDJWgw+bTd0mbDNPctrh3oQQF8BSYTASHccqogre1tfryPjzVbwnO0KRlA4JI8UVD
 d3AsJ5LqNWJtK7wMVTdKcG/4t7wA0rC4MqLjhPPoY3geJblNIKz0z6fYPrjwWMYKp4gD
 R4TClN32gPJ2WgwiMb1auA5fxDq8Xn2aBkO+FMVsUpQ3MMskvrzSQE4k5KWhdgfMgABA
 cGdw==
X-Gm-Message-State: APjAAAU8nSe2ToO5XL3JBMjQbW91eoNpN/6kZ/Vo8jm/VXqdVZl5qWpX
 9Yw8chy32wrtUv6Xto6Br5I=
X-Google-Smtp-Source: APXvYqz+CowkOpU6V/b6F3gZmA2WTmn+PrEksw9kzMWmUaoKDoVvI1R8fp7F7iD6AUe2JSAOQm0mBQ==
X-Received: by 2002:a05:600c:305:: with SMTP id
 q5mr31264838wmd.167.1577097190665; 
 Mon, 23 Dec 2019 02:33:10 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id w8sm19705726wmm.0.2019.12.23.02.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 02:33:10 -0800 (PST)
Date: Mon, 23 Dec 2019 10:33:08 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191223103308.4llsi27mnfntm5su@debian>
References: <20191221235049.4928-1-liuwe@microsoft.com>
 <28ed98be-50ee-3b2c-2f9f-2805ee50089f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28ed98be-50ee-3b2c-2f9f-2805ee50089f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/hyperv: change hv_tlb_flush_ex to fix
 clang build
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgMTA6NTM6MjlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjIuMTIuMjAxOSAwMDo1MCwgV2VpIExpdSB3cm90ZToKPiA+IENsYW5nIGNvbXBs
YWluczoKPiA+IAo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHN5bmljLmM6MTU6Cj4gPiAvYnVp
bGRzL3hlbi1wcm9qZWN0L3hlbi94ZW4vaW5jbHVkZS9hc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaDo5
MDA6MTg6IGVycm9yOiBmaWVsZCAnaHZfdnBfc2V0JyB3aXRoIHZhcmlhYmxlIHNpemVkIHR5cGUg
J3N0cnVjdCBodl92cHNldCcgbm90IGF0IHRoZSBlbmQgb2YgYSBzdHJ1Y3Qgb3IgY2xhc3MgaXMg
YSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZhcmlhYmxlLXNpemVkLXR5cGUtbm90LWF0
LWVuZF0KPiA+ICAgICAgICAgc3RydWN0IGh2X3Zwc2V0IGh2X3ZwX3NldDsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KPiAKPiBJJ20gc3VycHJpc2VkIGdjYyBkb2VzIG5vdCBjb21wbGFp
bi4KCk1lIHRvby4KCj4gCj4gPiAxIGVycm9yIGdlbmVyYXRlZC4KPiA+IC9idWlsZHMveGVuLXBy
b2plY3QveGVuL3hlbi9SdWxlcy5tazoxOTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzeW5pYy5vJyBm
YWlsZWQKPiA+IG1ha2VbNl06ICoqKiBbc3luaWMub10gRXJyb3IgMQo+ID4gCj4gPiBEcm9wIHRo
ZSBsYXN0IHZhcmlhYmxlIHNpemUgYXJyYXkgZnJvbSBodl90bGJfZmx1c2hfZXggZm9yIG5vdyB0
byBmaXgKPiA+IGNsYW5nIGJ1aWxkcy4KPiAKPiBXaHkgImZvciBub3ciPyBUaGUgZmllbGQgaXMg
aWxsZWdhbCB0aGVyZSwgYW5kIEkgY2FuJ3Qgc2VlIGEgd2F5IHRvCj4gbWFrZSBpdCBsZWdhbC4g
VG8ga25vdyBpdHMgYWN0dWFsIHBsYWNlIGluIG1lbW9yeSB5b3UgbmVlZCB0byBrbm93Cj4gdGhl
IG51bWJlciBvZiBlbGVtZW50cyBpbiBiYW5rX2NvbnRlbnRzW10sIGkuZS4gaGF2aW5nIHRoZSBm
aWVsZAo+IGlmIHRoZSBjb21waWxlciBlcnJvbmVvdXNseSBhY2NlcHRlZCBpdCB3b3VsZCBtZWFu
IHdyb25nIGNvZGUgdG8KPiBnZXQgZ2VuZXJhdGVkIChzaWxlbnRseSkuCj4gCgpPSy4gSSBjYW4g
ZHJvcCAiZm9yIG5vdyIuCgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnYtdGxmcy5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZz
LmgKPiA+IEBAIC04OTMsMTIgKzg5MywxMSBAQCBzdHJ1Y3QgaHZfdGxiX2ZsdXNoIHsKPiA+ICAJ
dTY0IGd2YV9saXN0W107Cj4gPiAgfSBfX3BhY2tlZDsKPiA+ICAKPiA+IC0vKiBIdkZsdXNoVmly
dHVhbEFkZHJlc3NTcGFjZUV4LCBIdkZsdXNoVmlydHVhbEFkZHJlc3NMaXN0RXggaHlwZXJjYWxs
cyAqLwo+ID4gKy8qIEh2Rmx1c2hWaXJ0dWFsQWRkcmVzc1NwYWNlRXggaHlwZXJjYWxsICovCj4g
PiAgc3RydWN0IGh2X3RsYl9mbHVzaF9leCB7Cj4gPiAgCXU2NCBhZGRyZXNzX3NwYWNlOwo+ID4g
IAl1NjQgZmxhZ3M7Cj4gPiAgCXN0cnVjdCBodl92cHNldCBodl92cF9zZXQ7Cj4gPiAtCXU2NCBn
dmFfbGlzdFtdOwo+IAo+IFJhdGhlciB0aGFuIG91dHJpZ2h0IHJlbW92aW5nIHRoZSBsaW5lLCBr
ZWVwIGl0IGFzIGEgY29tbWVudD8KClRoYXQncyBmaW5lIGJ5IG1lLgoKV2VpLgoKPiAKPiBKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
