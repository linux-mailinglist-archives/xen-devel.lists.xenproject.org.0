Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D23F101A2C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 08:15:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWxhM-00035C-MM; Tue, 19 Nov 2019 07:13:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=byRa=ZL=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iWxhK-000357-7t
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 07:13:14 +0000
X-Inumbo-ID: 0c80d15a-0a9c-11ea-b678-bc764e2007e4
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c80d15a-0a9c-11ea-b678-bc764e2007e4;
 Tue, 19 Nov 2019 07:13:12 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id p20so23499044qtq.5
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 23:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VFF26+USTCmeB95xWegw46B+Rve/IS7W0D2TvG3an2U=;
 b=CKRNOZGf5Tl4TF6TbdXk2Sv2DFd+XywmDsYmQTNxdSAd+9nWjtjTYt4P+OCHBP0UHn
 OpAQXAxxdlRS8BZWMi+fgf14GXG84Te7NQoAWfYg5qJenjc3XAza+Gl0J1P64L2A1/rk
 lK3u9zzrS2dRscjtYgLiz5T/JH8SbHL0xpmrrkqS5j7MT8OJSpZjiP65f+oH8cw4vxud
 DtKKFfWxo6tQo5sbJh0GO0nyrrrgFzqREP8uu/4KkD3kM2FgRx28fKYdaRkcrzF832bD
 F7O40eQ6ru+ia0JFFM3B86lf6cCgwWnAIXAwM/T437nq7uur82ILdCiNofWZ3mLLht4d
 W9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VFF26+USTCmeB95xWegw46B+Rve/IS7W0D2TvG3an2U=;
 b=dOYuBQvo7nWT21YgJ1iwKlDGZt5F+LgvwHvR2V+BEhFcHwO6e2RxGLR0cRvGNGovLv
 TwJ1Ndr2yIp1VZRkqdpNTj5E9lgR4kgTuZAMEAXh8ddJfjO+7o73zMvdJXS3u/63VKKe
 oBbb4Uj+n0F1Jf84GgV+M4vZdMyjNDcdwG7kvGOq5h/0P3qDugTfY62AaYnMzvxhiM17
 EJXVns1yHIfPGq/84pYnFrnYHhb29VJ27mFHlnOF7uwFRrxhC4HOO4Qtljgt0Q5JYVvm
 YEiwjE2W92GRwM+5eSfwyR/XdeCpJka3RK8vYv1mmVe2raHKd/cxYnP8ZPlwfm1em5H3
 J0pw==
X-Gm-Message-State: APjAAAWmJUG9b8bbnIm/8/9a62JDGBXQn6r7/BHzdAxOmvE92g7d6hhE
 yms3Pp/a7qF+tPnQLJk7HLY/gY+s7xBTeTASV2pGrZaBwGkluA==
X-Google-Smtp-Source: APXvYqw1AuHozSfLkRCHvO6PiP+9qS3584fLQsbdU2pXTDGcSIYYG5tYDgNqBRJB34u/DTp4tAswWhJ2rtJ9ft/w2I0=
X-Received: by 2002:ac8:4454:: with SMTP id m20mr2938524qtn.77.1574147592591; 
 Mon, 18 Nov 2019 23:13:12 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
 <D7B6817F-5609-4D21-AEFB-D7F1F5D786A4@gmail.com>
In-Reply-To: <D7B6817F-5609-4D21-AEFB-D7F1F5D786A4@gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 18 Nov 2019 23:13:01 -0800
Message-ID: <CAMmSBy9QicAxM8c-8+-gOwbZNEC8p4+P_M_80JwiNAOMYcZM9w@mail.gmail.com>
To: Rich Persaud <persaur@gmail.com>
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2ssIHRvIHN1bSB1cCAtLSB0aGVyZSdzIGRlZmluaXRlbHkgYSBwcmV0dHkgbWFqb3IgcmVncmVz
c2lvbiBvbiBhbGwKdGhpcyBoYXJkd2FyZSB3aXRoIFhlbiA0LjEzIFJDMjoKICAgICBodHRwczov
L3d3dy5kZWxsLmNvbS9lbi11cy93b3JrL3Nob3AvZ2F0ZXdheXMtZW1iZWRkZWQtY29tcHV0aW5n
L3NjL2dhdGV3YXlzLWVtYmVkZGVkLXBjcy9lZGdlLWdhdGV3YXk/fmNrPWJ0CgpXaXRob3V0IGVm
aT1uby1ycyBvcHRpb24gWGVuIHBhbmljcyBvbiBib290IChzb3JyeSBmb3IgYXR0YWNoaW5nIHRo
ZQpzY3JlZW5zaG90IC0tIEkga25vdyBpdCBpcyBub3Qgc3VwZXIgaGVscGZ1bCBidXQgaXQgZ2V0
cyB0aGUgcG9pbnQKYWNyb3NzKQoKV2l0aCBlZmk9bm8tcnMgWGVuIGJvb3RzIGZpbmUsIGJ1dCBE
b20wIGNhbid0IGNvbWUgdXAuCgpBbmQsIG9uY2UgYWdhaW4sIHRoaXMgaXMgY2xlYXJseSBhIHJl
Z3Jlc3Npb24gZnJvbSBSQzEgKGp1c3QgdmVyaWZpZWQpLgoKVGhhbmtzLApSb21hbi4KCk9uIFNh
dCwgTm92IDE2LCAyMDE5IGF0IDEyOjQ3IFBNIFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gSSBkb24ndCBrbm93IGlmIHRoZXJlJ3MgYSBjaGFuZ2UgaW4gZWZpPW5v
LXJzIGJlaGF2aW9yLCBidXQgc29tZSBFRkkgZml4ZXMgd2VyZSBtZXJnZWQgb24gMTAvMjUsIHdo
aWNoIChvbiBzb21lIG1hY2hpbmVzKSBoYXZlIHJlZHVjZWQgdGhlIG5lZWQgdG8gZGlzYWJsZSBV
RUZJIHJ1bnRpbWUgc2VydmljZXMgdG8gd29yayBhcm91bmQgbm9uLXNwZWMgVUVGSSBmaXJtd2Fy
ZS4gIFRoaXMgc2hvdWxkIGluY3JlYXNlIGhhcmR3YXJlIGNvbXBhdGliaWxpdHkgd2l0aCBYZW4u
ICBPZiBjb3Vyc2UsIHRoZXJlIGNvdWxkIHN0aWxsIGJlIG90aGVyIHJlYXNvbnMgdG8gZGlzYWJs
ZSBVRUZJIHJ1bnRpbWUgc2VydmljZXMuCj4KPiBDb3VsZCB5b3UgdHJ5IGJvb3RpbmcgdGhlIGFm
ZmVjdGVkIHN5c3RlbXMgd2l0aCBlZmk9cnM/Cj4KPiBSaWNoCj4KPiA+IE9uIE5vdiAxNiwgMjAx
OSwgYXQgMDA6MjcsIFJvbWFuIFNoYXBvc2huaWsgPHJvbWFuQHplZGVkYS5jb20+IHdyb3RlOgo+
ID4KPiA+IO+7v0hpIQo+ID4KPiA+IGFzIEkndmUgcmVwb3J0ZWQgZWFybGllciAtLSBwYXJ0IG9m
IG15IHRlc3Rpbmcgb2YgWGVuIDQuMTMgUkMyIGZhaWxlZAo+ID4gaW4gYSBtYXNzaXZlIHdheSB3
aXRoIERvbTAgbmV2ZXIgY29taW5nIHVwLiBJJ3ZlIHRyYWNlZCB0aGF0IHByb2JsZW0KPiA+IHRv
IHRoZSBvcHRpb24gdGhhdCB3ZSdyZSB1c2luZyB0byBib290IFhlbjoKPiA+ICAgIGVmaT1uby1y
cwo+ID4gV2UndmUgYmVlbiB1c2luZyB0aGlzIG9wdGlvbiBmb3IgcXVpdGUgc29tZXRpbWUgYW5k
IFhlbiA0LjEzIFJDMgo+ID4gaXMgdGhlIGZpcnN0IG9uZSB0aGF0IHNlZW1zIHRvIG1ha2UgRG9t
MCBib290IGZhaWwgd2l0aCB0aGlzIG9wdGlvbgo+ID4gcHJlc2VudCAobm90ZSB0aGF0IFJDMSB3
YXMgZmluZSkuCj4gPgo+ID4gSSB3YXMgd29uZGVyaW5nIHdoZXRoZXIgdGhlcmUgd2VyZSBhbnkg
Y2hhbmdlcyBpbiB0aGUgYXJlYXMgcmVsYXRlZAo+ID4gdG8gVUVGSSBpbiBYZW4gdGhhdCBtYXkg
aGF2ZSB0cmlnZ2VyZWQgdGhpcy4KPiA+Cj4gPiBIZXJlJ3MgdGhlIGJvb3QgbGluZSB0aGF0IHdv
cmtzIHdpdGggUkMyOgo+ID4gICAgZG9tMF9tZW09MTAyNE0sbWF4OjEwMjRNIGRvbTBfbWF4X3Zj
cHVzPTEgZG9tMF92Y3B1c19waW4gc210PWZhbHNlCj4gPiBhZGRpbmcgZWZpPW5vLXJzIG1ha2Ug
RG9tMCBib290IHByb2Nlc3MgZmFpbDoKPiA+ICAgIGVmaT1uby1ycyBkb20wX21lbT0xMDI0TSxt
YXg6MTAyNE0gZG9tMF9tYXhfdmNwdXM9MSBkb20wX3ZjcHVzX3BpbiBzbXQ9ZmFsc2UKPiA+Cj4g
PiBBdHRhY2hpbmcgeGwgaW5mbyBhbmQgZG1lc2cganVzdCBpbiBjYXNlCj4gPgo+ID4gVGhhbmtz
LAo+ID4gUm9tYW4uCj4gPiA8ZG1lc2cudHh0Pgo+ID4gPGluZm8udHh0Pgo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IFhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
