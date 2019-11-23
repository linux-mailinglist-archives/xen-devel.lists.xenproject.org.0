Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819AF107D40
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 07:04:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYOT5-0001Aw-FX; Sat, 23 Nov 2019 06:00:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=feRm=ZP=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iYOT4-0001An-3R
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 06:00:26 +0000
X-Inumbo-ID: 8aca3408-0db6-11ea-9631-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aca3408-0db6-11ea-9631-bc764e2007e4;
 Sat, 23 Nov 2019 06:00:25 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id y18so3816120qve.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2019 22:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5XSDA9OjaELOT+j//nrJi24NbfEExs4ElnrygEAqRv0=;
 b=Xgc8/UUUzwxA8mHukfCvuwkMo/bg075ut1udaLRd6t8IQLYcnGe1do4y8Y+akgh0oD
 /kxvZXjvQyXYYyCpj9e5z2L8/u+04O9iXZB43O6anQaGvTqvmobVIN4oGDCHzu9dKR9s
 Gv/Lvnd6CvUxyseqgHkGxUs4a61Q0pk/ogqMDFUEXWPRuz7tUJAfk3lhsvdrqjiRBjHK
 WcpeXiei5bWOjIb7K9eeLifUNOtR9C47oJVWAs3VYOUoeS7wFqG4efEI+zVBbZkx8kih
 SLKnVVIwCnQXIDdC1k92HP4mr3l/K9tIieAQtx80B/EnNIKmx9P3g4OVHySc21CXfNfz
 agRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5XSDA9OjaELOT+j//nrJi24NbfEExs4ElnrygEAqRv0=;
 b=l/rWSb4KnIMl+K6NVOyIvTZPCFqdBrHkDM71GKAKm9OU8eKRqHERQW48+ezQdAyGbI
 J7WhbaOmNYMDv3q/CyloI+/o4/ysNO4dZCfjwAKXQ9rmBCbIM3s/jfIC91BZHF7TMldt
 RM4WCjN+HsMYsGey6Px1ihwJ2GLXy/M4NBbvD1wDkA+SV33L2pLj8ODoqL4QZ0XsMv2P
 B1kkTvbfqdy+wddC1QbGCMU/p1vTcUlUTUQDvq33j8bzxMzWV4+eiSQaxpv2sh/mm3Cb
 4ZVr9WBppMEYZRDiCY2E0JuUirGQGb/tppNU4+Og5XcBaJ6+3BPLHYFXzg1vdWYLO0yK
 iRZw==
X-Gm-Message-State: APjAAAXRwpl9fr1weH7IkNHbe/oB/HUOstdWoYoeiNDfE5Ud4rxe3g/g
 7xAgKi5RaoQ+PTgEPLycx1KzNph4MQH4zzIFgangFg==
X-Google-Smtp-Source: APXvYqz2SaiqH3+v+vyaIqHsh5fXM5OuLb1NkCdqQ0MvETPoaOB08+gt0a2ATtlZEV8Rs6KnkHRnVH8EWIuIEcn5pb8=
X-Received: by 2002:a0c:b91e:: with SMTP id u30mr1396590qvf.31.1574488824617; 
 Fri, 22 Nov 2019 22:00:24 -0800 (PST)
MIME-Version: 1.0
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
In-Reply-To: <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 22 Nov 2019 22:00:13 -0800
Message-ID: <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgOTozOCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDIxLzExLzIwMTkgMTc6MzEsIFJvbWFuIFNo
YXBvc2huaWsgd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMDowNiBQTSBKw7xy
Z2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+ID4+IFdoZXJlIGRvIHdlIHN0YW5k
IHdpdGggWGVuIDQuMTMgcmVnYXJkaW5nIGJsb2NrZXJzIGFuZCByZWxhdGVkIHBhdGNoZXM/Cj4g
Pj4KPiA+PiAxLiBPU1N0ZXN0IGZhaWx1cmUgcmVnYXJkaW5nIG5lc3RlZCB0ZXN0Ogo+ID4+ICAg
ICBJJ20gbm90IHF1aXRlIHN1cmUgd2hldGhlciB0aGUgY3VycmVudGx5IGRlYmF0ZWQgcGF0Y2gg
b2YgQW5kcmV3IGlzCj4gPj4gICAgIGZpeGluZyB0aGUgcHJvYmxlbS4gSWYgbm90LCBkbyB3ZSBr
bm93IHdoYXQgaXMgbWlzc2luZyBvciBob3cgdG8KPiA+PiAgICAgYWRkcmVzcyB0aGUgaXNzdWU/
IElmIHllcywgY291bGQgd2UgcGxlYXNlIGNvbWUgdG8gYW4gYWdyZWVtZW50Pwo+ID4+ICAgICBB
cyBhbiBhbHRlcm5hdGl2ZTogYW55IHRob3VnaHRzIGFib3V0IGlnbm9yaW5nIHRoaXMgdGVzdCBm
YWlsdXJlIGZvcgo+ID4+ICAgICA0LjEzLVJDMyAoSU9XOiBkb2luZyBhIGZvcmNlIHB1c2gpPwo+
ID4+Cj4gPj4gMi4gUnl6ZW4vUm9tZSBmYWlsdXJlcyB3aXRoIFdpbmRvd3MgZ3Vlc3RzOgo+ID4+
ICAgICBXaGF0IGlzIHRoZSBjdXJyZW50bHkgcGxhbm5lZCB3YXkgdG8gYWRkcmVzcyB0aGUgcHJv
YmxlbT8gV2hvIGlzCj4gPj4gICAgIHdvcmtpbmcgb24gdGhhdD8KPiA+Pgo+ID4+IDMuIFBlbmRp
bmcgcGF0Y2hlcyBmb3IgNC4xMzoKPiA+PiAgICAgQ291bGQgSSBwbGVhc2UgaGF2ZSBmZWVkYmFj
ayB3aGljaCBwYXRjaGVzIHRhZ2dlZCBhcyAiZm9yLTQuMTMiIGFyZQo+ID4+ICAgICBmaXhpbmcg
cmVhbCByZWdyZXNzaW9ucyBvciBpc3N1ZXM/IEkgZG9uJ3Qgd2FudCB0byB0YWtlIGFueSBwYXRj
aGVzCj4gPj4gICAgIG5vdCBmaXhpbmcgcmVhbCBwcm9ibGVtcyBhZnRlciBSQzMsIGFuZCBJIGhv
cGUgdG8gYmUgYWJsZSB0byBnZXQgYQo+ID4+ICAgICBwdXNoIHJhdGhlciBzb29uZXIgdGhhbiBs
YXRlciB0byBiZSBhYmxlIHRvIGxldCBJYW4gY3V0IFJDMy4KPiA+Pgo+ID4+IDQuIEFyZSB0aGVy
ZSBhbnkgYmxvY2tlcnMgZm9yIDQuMTMgb3RoZXIgdGhhbiAxLiBhbmQgMi4gKGFwYXJ0IG9mIGFu
eQo+ID4+ICAgICBwZW5kaW5nIFhTQXMpPwo+ID4gQW55IGNoYW5jZSB0aGUgZWZpPW5vLXJzIHJl
Z3Jlc3Npb24gY2FuIGJlIGFkZGVkIHRvIHRoZSBsaXN0PyBJIHVuZGVyc3RhbmQKPiA+IHRoYXQg
SSdtIHN0aWxsIG9uIHRoZSBob29rIHRvIHByb3ZpZGUgbW9yZSBkZXRhaWxzIChJIHByb21pc2Ug
dG8gZG8gaXQgb24gRnJpCj4gPiB3aGVuIEkgZ2V0IHRvIG15IGxhYiB0byBhY3R1YWxseSBoYXZl
IGEgc2VyaWFsIGNvbnNvbGUgb24gYWxsIHRoZXNlIGJveGVzKS4KPiA+IEF0IHRoZSBzYW1lIHRp
bWUgdGhpcyBpcyBhIHByZXR0eSBzZXJpb3VzIHJlZ3Jlc3Npb24gZm9yIGFuIGVudGlyZSBjbGFz
cyBvZgo+ID4gZGV2aWNlcyB3aGVyZSBYZW4gd2FzIHBlcmZlY3RseSBoYXBweSBldmVuIGR1cmlu
ZyBSQzEuCj4KPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNv
bW1pdGRpZmY7aD01MzRmOWUyOWNlMjg1ODA4OTJiMzg1NjAzNmI1ZTVjZDgwNTY2N2NjCj4gaGFz
IGJlZW4gY29tbWl0dGVkLiAgSXQgaXMgaW4gc3RhZ2luZywgYnV0IG5vdCBpbiBtYXN0ZXIgeWV0
IChiZWNhdXNlCj4gbWFzdGVyIGlzIGJsb2NrZWQgYnkgbXkgcmVncmVzc2lvbiBpbiAxKS4KClJl
cG9ydGluZyBiYWNrIGFmdGVyIHNwZW5kaW5nIHNvbWUgdGltZSBpbiB0aGUgbGFiIHRvZGF5OgoK
MS4gR29vZCBuZXdzLCB0aGUgYWJvdmUgcGF0Y2ggdGFrZXMgY2FyZSBvZiB0aGUgcmVncmVzc2lv
bi4gSSBjYW4gbm93CmFkZCBlZmk9bm8tcnMKYmFjayBhbmQgWGVuIGJvb3RzIChhbmQgYWxzbyBi
b290cyBEb20wKSBvbiBhbGwgdGhlIGJveGVzIGludm9sdmVkLgoKMi4gTmV1dHJhbCBuZXdzOiBE
ZWxsIHByb2R1Y3QgbGluZSBzdGlsbCByZXF1aXJlcyBlZmk9bm8tcnMgYW5kCmNvcmVkdW1wcyB3
aXRob3V0IGl0CihubyByZWdyZXNzaW9uIC0tIHRoYXQncyBJIHN0YXJ0ZWQgdXNpbmcgZWZpPW5v
LXJzIHRvIGJlZ2luIHdpdGgpLgoKMy4gQmFkIG5ld3M6IE1hcmVrJ3Mgc3VnZ2VzdGlvbiBkaWRu
J3Qgd29yayBvbiBEZWxsIHByb2R1Y3QgbGluZSAoYW5kIHllcwpJIGRvdWJsZSBjaGVja2VkIHRo
YXQgSSBidWlsdCBpdCBjb3JyZWN0bHkpLgoKU28uLi4gd2hlbiBpdCBjb21lcyB0byBSQzIgcmVn
cmVzc2lvbiAtLSB3ZSdyZSBhbGwgZ29vZC4KCkJ1dCBzaW5jZSB3ZSdyZSBoZXJlIGFueXdheSAt
LSBJJ20gd29uZGVyaW5nIGlmIGFueW9uZSB3b3VsZCBiZQppbnRlcmVzdGVkIGluIGhlbHBpbmcg
bWUgZmlndXJlIG91dCB3aHkgWGVuIG9uIHRob3NlIERlbGwgYm94ZXMgY29yZWR1bXBzCndpdGhv
dXQgZWZpPW5vLXJzID8KCk1hcmVrLCBhbnkgY2hhbmNlIEkgY2FuIGludGVyZXN0IHlvdSBpbiBo
ZWxwaW5nIG1lIGEgYml0IGhlcmU/IDstKQoKVGhhbmtzLApSb21hbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
