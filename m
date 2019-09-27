Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3FC05B0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:50:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpf4-0000jo-6o; Fri, 27 Sep 2019 12:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BxSY=XW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDpf2-0000jQ-NG
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:47:48 +0000
X-Inumbo-ID: 0215adf8-e125-11e9-8628-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id 0215adf8-e125-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 12:47:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v8so2611361wrt.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 05:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Q6uvNcbHCYUwuhnch+FcX/TNB8FDYikNNty1jo8BAWU=;
 b=XwNsE6heMaYmHWMQi94f+I95MeX43RIvSQjmD9WEAKrj0PIrmHY2tbmPZeyo3jtQEL
 TKs70SMlATnEoe+DnLHl8imrhJ9cN6asovr6PIfppfuhBZM4rU3bYHJ3F4M9DgoS7x6Q
 bQyEnaAuFy6X0D/RqvOtEKC/oz5/D8oBm5M9G60dsgQe7WDYeqlbtUoCYAmtwaCqPFRY
 c9uhaBNvQVtvWywc9XYWHJ7KTnMRhJsu5lgD/1auvG582I+bfqXYI8Eu71/HqO1ndNdH
 baKmN+GobNRlxWf1Ozowhuf0SE34t83rcavgEGeoGZJcFvrx68yRDhIpXVYJCyLJFOms
 txrg==
X-Gm-Message-State: APjAAAVnf1d7Ua+by1stQp6mjAjoElnG8YYkjGKTipa3D/D4/BNYnsYb
 zMefLaCtxVU90EvCrgoySag=
X-Google-Smtp-Source: APXvYqwGYuVzq64nFAxp3a2WfnIhnAiOTX83cBwGK2WVoxqH2qdxBZWTRCwSI61nW21oNA0lS2YbkA==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr2720404wrp.290.1569588467391; 
 Fri, 27 Sep 2019 05:47:47 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id t18sm6295698wmi.44.2019.09.27.05.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 05:47:46 -0700 (PDT)
Date: Fri, 27 Sep 2019 13:47:45 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190927124745.6ozkkm4qpilr7j66@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-5-liuwe@microsoft.com>
 <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
 <20190927113058.53xs3sw57as3r3tr@debian>
 <f5459c03-dcc7-e498-1a78-d2bad960ef18@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5459c03-dcc7-e498-1a78-d2bad960ef18@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 4/8] x86: factor out xen
 variants for hypervisor setup code
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDE6Mzk6MTRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMDkuMjAxOSAxMzozMCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgU2Vw
IDI1LCAyMDE5IGF0IDEyOjIzOjU0UE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
Pj4gQWxzbyBpdCBtaWdodCBiZSBuaWNlIHRvIGludHJvZHVjZSBzb21ldGhpbmcgbGlrZToKPiA+
Pgo+ID4+IGVudW0gZ3Vlc3RfdHlwZSB7Cj4gPj4gICAgIFhFTl9HVUVTVCwKPiA+PiB9IGd1ZXN0
X3R5cGU7Cj4gPj4KPiA+IAo+ID4gVGhpcyB3b3JrcyBmb3IgbWUuCj4gPiAKPiA+PiBTbyB0aGF0
IHlvdSBjYW4gYWRkIGEgc3dpdGNoIGhlcmUsIGV2ZW4gaWYgdGhlIG9ubHkgY2FzZSBpcyBYZW4g
QVRNLiBJCj4gPj4gZ3Vlc3MgdGhpcyB3aWxsIGJlIGRvbmUgaW4gYSBsYXRlciBwYXRjaCwgb3Ig
aW50cm9kdWNlIGFuCj4gPj4gaHlwZXJ2aXNvcl9vcHMgc3RydWN0IHRoYXQgY29udGFpbiBwb2lu
dGVycyB0byBmdW5jdGlvbnMgdG8gYWxsb3cgZm9yCj4gPj4gZGlmZmVyZW50IGltcGxlbWVudGF0
aW9ucy4KPiA+Pgo+ID4gCj4gPiBJIGRlYmF0ZWQgdGhpcy4gVGhlc2UgY2hhbmdlcyByZXF1aXJl
IG1vcmUgY29kZSBjaHVybiB3aXRoIG5vIGFwcGFyZW50Cj4gPiBiZW5lZml0LCBidXQgaWYgcGVv
cGxlIGFncmVlIHRoaXMgaXMgYmV0dGVyIEkgY2FuIG1ha2UgdGhvc2UgY2hhbmdlcy4KPiAKPiBX
ZWxsLCBpZiB0aGUgZXhwZWN0YXRpb24gaXMgZm9yIHRoZSBlbnVtIHRvIGdyb3cgKGV2ZW4ganVz
dCBieSBvbmUKPiBmdXJ0aGVyIGVudHJ5KSwgdGhlbiB5ZXMsIEknZCBhZ3JlZSB0aGF0IGEgc3dp
dGNoKCkgd291bGQgYmUgbmljZS4KCk5vdCBzdXJlIGlmIHlvdSBub3RpY2UgY29tbWVudHMgaW4g
YSBsYXRlciBlbWFpbC4KCkRvIHlvdSBwcmVmZXIgZW51bStzd2l0Y2ggc29sdXRpb24gb3IgaHlw
ZXJ2aXNvcl9vcCBzdHJ1Y3Q/CgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
