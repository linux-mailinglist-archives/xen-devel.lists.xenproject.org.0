Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE48F8D15
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 11:43:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUTbT-0003Rh-Jh; Tue, 12 Nov 2019 10:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RWbO=ZE=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iUTbS-0003Rc-SX
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 10:40:54 +0000
X-Inumbo-ID: e6cec164-0538-11ea-9631-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6cec164-0538-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 10:40:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f3so2375010wmc.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 02:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GACSvJcCrptTXxplWBwFxw06ayTlnHLfFfkyqygYsI0=;
 b=QKOo5lkrs5AAXFpN8ExqXBVBqbCvbBpgRC103nWl6dLazh15FVRxuDPbXp6l5i5qli
 S7lNz4pqJGk3YrGOujOJ15Ne6QOoEbiUZsubl+h64HjuScvJj0vc4pQdvg3c6J4MzDnI
 glj0DX/r3QpZO/AoV2fuJmQtibfJn7zX6kYdNBTpudYYroYFt33roA6/gVtmRgV3C2G1
 t/E3Xkf3Ewe887HhqmZN+/6O5ZRfsB56zA7esAPdQT5tEEkrgDPZmrowGKkYzm4sfqGv
 ncSWCTAR2Qpjdj9QFLoSC7DlkpmKIzrxyH1yIPJv7D7vo70VvRIbCfsCViES5TPnVZH/
 kb8Q==
X-Gm-Message-State: APjAAAW0oHbE9ijazyV8OSp5U+4PSQ1OjcG85/ooa8D6IX0ZejaKkCyf
 D3kv0X/uxQ8z2L+71rh5vno=
X-Google-Smtp-Source: APXvYqzjrXDId5yOQgoxDRqBu6cpNcBqDS8kbxR1kPQHXXmvryk39jPlh2DgkHBwCvNGc4eONAuioQ==
X-Received: by 2002:a05:600c:28c:: with SMTP id
 12mr3187868wmk.25.1573555253290; 
 Tue, 12 Nov 2019 02:40:53 -0800 (PST)
Received: from debian (63.149.115.87.dyn.plus.net. [87.115.149.63])
 by smtp.gmail.com with ESMTPSA id b15sm11135500wrx.77.2019.11.12.02.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 02:40:52 -0800 (PST)
Date: Tue, 12 Nov 2019 10:40:51 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20191112104051.kfqhc3ms4eq77bsd@debian>
References: <1573206153-22090-1-git-send-email-paul@xen.org>
 <20191108103136.aqxuzk23p2uofxlx@debian>
 <d85fbe14-f0af-aa3e-3cc2-29d4500ac3a2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d85fbe14-f0af-aa3e-3cc2-29d4500ac3a2@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3] tools/hotpug: only attempt to call 'ip
 route' if there is valid command
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTE6MDE6MjZBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAwOC4xMS4xOSAxMTozMSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgTm92
IDA4LCAyMDE5IGF0IDA5OjQyOjMzQU0gKzAwMDAsIHBhdWxAeGVuLm9yZyB3cm90ZToKPiA+ID4g
RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gPiAKPiA+ID4gVGhl
IHZpZi1yb3V0ZSBzY3JpcHQgc2hvdWxkIG9ubHkgY2FsbCAnaXAgcm91dGUnIHdoZW4gJ2lwY21k
JyBoYXMgYmVlbgo+ID4gPiBzZXQsIG90aGVyd2lzZSBpdCB3aWxsIGZhaWwgZHVlIHRvIGFuIGlu
Y29ycmVjdCBjb21tYW5kIHN0cmluZy4KPiA+ID4gCj4gPiA+IFRoaXMgcGF0Y2ggYWxzbyBhZGRz
IHJvdXRlcyBmb3IgJ3RhcCcgKGkuZS4gZW11bGF0ZWQpIGRldmljZXMgYXMgd2VsbCBhcwo+ID4g
PiAndmlmJyAoaS5lLiBQVikgZGV2aWNlcy4gRW1waXJpY2FsbHkgb2ZmbGluZS9vbmxpbmUgY29t
bWFuZHMgcmVsYXRlIHRvCj4gPiA+ICd2aWYnIGRldmljZXMsIGFuZCBhZGQvcmVtb3ZlIGNvbW1h
bmRzIHJlbGF0ZSB0byAndGFwJyBkZXZpY2VzLiBIb3dldmVyLAo+ID4gPiB0aGlzIHBhdGNoIHRy
ZWF0cyB0aGVtIGVxdWFsbHkgYW5kIHVzZXMgJHt0eXBlX2lmfSB0byBkaXN0aW5ndWlzaC4gQnkK
PiA+ID4gYWRkaW5nIGNhc2VzIGZvciBhZGQvcmVtb3ZlIHRoZSBjb21tYW5kIGxpc3QgYmVjb21l
cyBleGhhdXN0aXZlIGFuZCBoZW5jZQo+ID4gPiAnaXBjbWQnIGlzIGd1YXJhbnRlZWQgdG8gYmUg
c2V0Lgo+ID4gPiAKPiA+ID4gUm91dGVzIGZvciAndGFwJyBhbmQgJ3ZpZicgZGV2aWNlcyBhcmUg
ZGlzdGluZ3Vpc2hlZCBieSBhIHJvdXRlIG1ldHJpYy4KPiA+ID4gRW11bGF0ZWQgZGV2aWNlcyBh
cmUgdXNlZCBieSBIVk0gZ3Vlc3RzIHVudGlsIHRoZXkgYXJlIHVucGx1Z2dlZCwgYXQgd2hpY2gK
PiA+ID4gcG9pbnQgdGhlIFBWIGRldmljZSBiZWNvbWVzIGFjdGl2ZS4gVGh1cyAndGFwJyBkZXZp
Y2VzIHNob3VsZCBnZXQgYSBoaWdoZXIKPiA+ID4gcHJpb3JpdHkgKGkuZS4gbG93ZXIgbnVtYmVy
ZWQpIG1ldHJpYyB0aGFuICd2aWYnIGRldmljZXMuCj4gPiA+IAo+ID4gPiBUaGVyZSBpcyBhbHNv
IG9uZSBzbWFsbCB3aGl0ZXNwYWNlIGZpeC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+IAo+ID4gQWNrZWQtYnk6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+Cj4gCj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKVGhhbmtzLiBRdWV1ZWQuCgpBbHNvIGNoYW5nZSBob3RwdWcgdG8gaG90
cGx1ZyBpbiB0aGUgc3ViamVjdCBsaW5lLgoKV2VpLgoKPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
