Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B95124ED1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 18:07:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihcjW-0001aP-TT; Wed, 18 Dec 2019 17:03:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hOUS=2I=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1ihcjV-0001aD-ET
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 17:03:33 +0000
X-Inumbo-ID: 5275afea-21b8-11ea-a1e1-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5275afea-21b8-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 17:03:32 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id u10so960528qvi.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 09:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ROOLNvCZDAtH74XS6xDgksTInSFsqSXxVaCZS4oOh9g=;
 b=gLO9C/5wP41eshuo/lgvCTMdgIt+w3eOwHutuuEKRSY4A64CROyYMlxAyAAFZH+QXI
 4Vrmfggsb/JNU4cJevVR+kwtkry+cvEi2tmY0jpbB+z0b7VwW83t2fuI9NfLd4a602A/
 +obgWHVPfTzBdfRfR6jPJq3lVyVU00f4W+iBpAPmuDY/mQR01oVt/UHYS7eU/AaI8jNo
 J2BALQ1+IO3NVBqVao8hjWNpNe5b/XiSsoj1/2SANJ2lBeCa3tj8rzZDBi2m4uW0k6J+
 sJPIatm/zU4fbtot/uUWl8ZMGBrYTVipyg0d13cOUs37T3JFPrZ62PkMtfq06+aMHl90
 +Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ROOLNvCZDAtH74XS6xDgksTInSFsqSXxVaCZS4oOh9g=;
 b=gzbGqhfhwMnxvW7hRtW++32EhIEPzQ/NDZ9cQKcfFyy4YclusprQJftYGQ693Y8mbt
 /mlZl7PXQsFOmJD7S4Egtt6G3o84nA8kTCJS9pfmj+EalPlhnKNcyxqK26i/VuyZ92y1
 tFX7/WBuJhJnRB5RMuQhqJMP7ivaT/Yt7a/wht3RsO1909WYdnv5ZP8eKs42t/0HZsos
 ngUDSUEJXYcDPnlFoPokKMidcaKPZ0mLhL9/Zsssjld514Wo0UlFWnRP3FqRB1Yel+WO
 Kt1efFRT+TwuSxb1nRk+lWSnFvxlxZc0HIV2FiKOzK/Po50qW8KMFKHvuKqSIW8mwy0D
 VPig==
X-Gm-Message-State: APjAAAWMV+ufCK3cGNCjoMKpYO0y6Bshgant5FNCbUyJTNkH5vXbNi+f
 QkafwRT9qrgLdIbjI1t2Xt4KdRCARrqOoT7Jo/tHlg==
X-Google-Smtp-Source: APXvYqyQB/81TmMoqJE23Mb9srCmEU8MB8ryb9iODL00J0ZCbWFPnTaXwJX3cSFtwNhVpu4JLeL0Jp3GvM661GDSqC8=
X-Received: by 2002:a05:6214:bc5:: with SMTP id
 ff5mr3288120qvb.31.1576688612433; 
 Wed, 18 Dec 2019 09:03:32 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
 <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
 <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
In-Reply-To: <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 18 Dec 2019 09:03:21 -0800
Message-ID: <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMzo1MCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTgvMTIvMjAxOSAwNzozNiwgUm9tYW4gU2hhcG9z
aG5payB3cm90ZToKPiA+IE9uIFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDY6NTYgUE0gUm9tYW4gU2hh
cG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT4gd3JvdGU6Cj4gPj4gRXhhY3RseSEgVGhhdCdzIHRo
ZSBvdGhlciBzdXJwcmlzaW5nIGJpdCAtLSBJIG5vdGljZWQgdGhhdCB0b28gLS0gaXRzIG5vdCBs
aWtlCj4gPj4gWGVuIGRvZXNuJ3Qgc2VlIGFueSBvZiB0aGUgbWVtb3J5IGFib3ZlIDFHIC0tIGl0
IGp1c3QgZG9lc24ndCBzZWUgZW5vdWdoIG9mIGl0Lgo+ID4+Cj4gPj4gU28gdGhlIHF1ZXN0aW9u
IGlzIC0tIHdoYXQgaXMgTGludXggZG9pbmcgdGhhdCBYZW4gZG9lc24ndD8KPiA+Cj4gPiBCeSB0
aGUgd2F5LCBzcGVha2luZyBvZiBydW5uaW5nIFhlbiB1bmRlciBBUk0vcWVtdSAtLSBoZXJlJ3Mg
YW4gaW50ZXJlc3RpbmcKPiA+IG9ic2VydmF0aW9uOiB3aGVuIEkgcnVuIHFlbXUtc3lzdGVtLWFh
cmNoNjQgd2l0aCAtbSA0MDk2IG9wdGlvbiBpdCBzZWVtcwo+ID4gdGhhdCwgYWdhaW4sIExpbnV4
IGtlcm5lbCBpcyBwZXJmZWN0bHkgY29udGVudCB3aXRoIGhhdmluZyBhY2Nlc3MgdG8gNEcgb2Yg
UkFNLAo+ID4gd2hpbGUgWGVuIG9ubHkgc2VlcyBhYm91dCAyRy4KPgo+IExpbnV4IGFuZCBYZW4g
c2hvdWxkIHNlZSBjbG9zZSB0byB0aGUgc2FtZSBhbW91bnQgYXMgbWVtb3J5IGFzIGxvbmcgYXMK
PiB5b3UgYXJlIHVzaW5nIHRoZSBzYW1lIGJvb3Rsb2FkZXIuLi4KClRoYW5rcyBmb3IgY29uZmly
bWluZy4gVGhpcyBpcyB3aGF0IEknbSB0cnlpbmcgdG8gZ2V0IHRvIG9uIHRoaXMKdGhyZWFkLiBB
bnkgaGVscAp3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkIQoKPiA+IFRoaXMgbWF5IGFjdHVh
bGx5IGhhdmUgc29tZXRoaW5nIHRvIGRvIHdpdGggVUVGSSBJIGd1ZXNzLgo+Cj4gLi4uICBjb3Vs
ZCB5b3UgY29uZmlybSB3aGV0aGVyIHlvdSBhcmUgYm9vdGluZyBMaW51eCB1c2luZyBVRUZJIG9y
IG5vdD8KClRoZSBib290IHNlcXVlbmNlIGluIGJvdGggY2FzZXMgaXM6CiAgIEhpS2V5IGwtbG9h
ZGVyCiAgIEhpS2V5IFRpYW5vY29yZSBFREsyIOKAkyBVRUZJCiAgIEdSVUIgKGFzIGEgVUVGSSBw
YXlsb2FkKQogICBYZW4gfCBMaW51eAoKR1JVQidzIGNvbW1hbmRzIGZvciBib290aW5nIFhlbiAr
IERvbTA6CiAgICB4ZW5faHlwZXJ2aXNvciAvYm9vdC94ZW4uZWZpIGNvbnNvbGU9ZHR1YXJ0ICAg
ZG9tMF9tZW09NjQwTQpkb20wX21heF92Y3B1cz0xIGRvbTBfdmNwdXNfcGluCiAgICB4ZW5fbW9k
dWxlIC9ib290L2tlcm5lbCBjb25zb2xlPWh2YzAgcm9vdD0oaGQxLGdwdDEpL3Jvb3Rmcy5pbWcg
dGV4dAogICAgZGV2aWNldHJlZSAoaGQxLGdwdDQpL2V2ZS5kdGIKICAgIHhlbl9tb2R1bGUgKGhk
MSxncHQxKS9pbml0cmQuaW1nCgpHUlVCJ3MgY29tbWFuZHMgZm9yIGJvb3RpbmcgTGludXggb25s
eToKICAgIGxpbnV4IC9ib290L2tlcm5lbCAgY29uc29sZT10dHlBTUEwIGNvbnNvbGU9dHR5QU1B
MQpjb25zb2xlPXR0eUFNQTIgY29uc29sZT10dHlBTUEzCnJvb3Q9UEFSVFVVSUQ9ZjcxYmQ5ODct
ZDk5YS00Yzg4LTk3ODEtY2Y0YzI2Y2FlNTVlIHJvb3RkZWxheT0zCiAgICBkZXZpY2V0cmVlICho
ZDEsZ3B0NCkvZXZlLmR0YgoKU28gLS0gbm90aGluZyBib290cyBkaXJlY3RseSBieSBVRUZJIC0t
IGV2ZXJ5dGhpbmcgZ29lcyB0aHJvdWdoIEdSVUIuCgpIb3dldmVyLCBteSB1bmRlcnN0YW5kaW5n
IGlzIHRoYXQgR1JVQiB3aWxsIGRldGVjdCBkZXZpY2V0cmVlCmluZm9ybWF0aW9uIHByb3ZpZGVk
IGJ5IFVFRkkgKGV2ZW4gdGhvdWdoIGRldmljZXRyZWUgY29tbWFuZCBpcwpzdXBwb3NlZCB0byBj
b21wbGV0ZWx5IHJlcGxhY2UgdGhhdCkuIEhlbmNlIGl0IGlzIHBvc3NpYmxlIHRoYXQgTGludXgK
cmVsaWVzIG9uIHNvbWUgcmVzaWR1YWxzIGxlZnQgaW4gbWVtb3J5IGJ5IEdSVUIgdGhhdCBYZW4g
ZG9lc24ndCBwYXkKYXR0ZW50aW9uIHRvIChidXQgdGhpcyBpcyBhIHByZXR0eSB3aWxkIHNwZWN1
bGF0aW9uIG9ubHkpLgoKVGhhbmtzLApSb21hbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
