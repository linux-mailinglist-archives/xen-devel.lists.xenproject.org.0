Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E565068BC8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 15:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1FO-0000Mv-5S; Mon, 15 Jul 2019 13:42:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wBjO=VM=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hn1FM-0000Mq-Gs
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 13:42:28 +0000
X-Inumbo-ID: 61a10281-a706-11e9-8980-bc764e045a96
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 61a10281-a706-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 13:42:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s3so15241618wms.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2019 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4qYrPpHtXttLLowrN8Knek7QEnSX+SMkW593DpWPUE=;
 b=k14s6/yGo2kB9v6MUVDyixJ3Nh92w7GeU+S14s3L5mJj1mT0Vh4KO1ip0A8SyfCOlK
 2Uk/ImTp1bkZmtfvlk/a9XZT7vu0DDpeRgCr5XZ+5cfGXORXQ9rDGaOU8DSVV+NVUuxS
 tHmwyhjxlUWlkDT2de7qztTNZ8RtEWb6u1F0Eyz9788ijQ4/UCayUX14e43rFtHCAqpL
 zxHbHqMNfBenWn5eVMrLXAHQXVDlFf5jB8N8cBrSmBPIAx/SBANIcRugF+JAETWkOIZn
 X702v3VtBKgYUuuDgEkZIiGOJjMAf82DUvyEZTRgt9e/Y0TByfRIMZSoYSd5D8hamp4J
 0u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4qYrPpHtXttLLowrN8Knek7QEnSX+SMkW593DpWPUE=;
 b=tJOMqyPDUEzK59GWAeG1yjGVBtyJhMkBQGKwQqn0C10+YfIGIogDUXBCs9Pi+S3j6O
 ZVcPHyX44nLcjJBe+ZCxSKeimXoUB8eUCgd8PFXRsvb6tAc8tK1el7q5RTHIJSCMK5q3
 GXk8Qxs4dI6qG2k/sTZKocBg4OET67RGv9+avrQx0wjxVhbddaUewUBODdOJxMji6DxQ
 ydE8/mKyWErfcmfwi8+crcemr+Z3Ew+f3K9s40hAR43EZyKOdwG1wgQXvpyA8hZ4Vurj
 JSscNl5NtMVTP9oPSF7Vb57tbN1aEGtvllqFnlepK8zRgr+EuVJHYlzZ3R4OWwXT+quI
 9BBw==
X-Gm-Message-State: APjAAAW+F8F0br6HhqJ8yTdUshv8PwoboOTcTXXkP9oUfN3q3Z3OL0iI
 5oadXSC4PiB0EtPGGx2BYqSTUeNNcVd14uiW6Ag=
X-Google-Smtp-Source: APXvYqyhaES39NV6LcSuIkacpr/kuxlT/I6k5RWgMpRhjFhIYHj0Tl+SPGFkIH3xI6bB0hJCr0+fuLQyPQ9HCEbYUJk=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr24929351wmj.128.1563198145640; 
 Mon, 15 Jul 2019 06:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
In-Reply-To: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 15 Jul 2019 07:41:48 -0600
Message-ID: <CABfawhmHFWEQ36S6M0+M+Ls1fFJpvHRCN6+Q4Mn0_DrFQjOVPg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgNDozNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gV2l0aCBub24tZW1wdHkgQ09ORklHX0RPTTBfTUVNIGNsYW5nNSBw
cm9kdWNlcwo+Cj4gZG9tMF9idWlsZC5jOjM0NDoyNDogZXJyb3I6IHVzZSBvZiBsb2dpY2FsICcm
Jicgd2l0aCBjb25zdGFudCBvcGVyYW5kIFstV2Vycm9yLC1XY29uc3RhbnQtbG9naWNhbC1vcGVy
YW5kXQo+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgXiAgfn5+fn5+fn5+fn5+fn5+fn5+Cj4gZG9tMF9idWls
ZC5jOjM0NDoyNDogbm90ZTogdXNlICcmJyBmb3IgYSBiaXR3aXNlIG9wZXJhdGlvbgo+ICAgICAg
aWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgXn4KPiAgICAgICAgICAgICAgICAgICAgICAgICAmCj4gZG9tMF9idWlsZC5j
OjM0NDoyNDogbm90ZTogcmVtb3ZlIGNvbnN0YW50IHRvIHNpbGVuY2UgdGhpcyB3YXJuaW5nCj4g
ICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklHX0RPTTBfTUVNWzBdICkKPiAgICAgICAg
ICAgICAgICAgICAgICAgIH5efn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAxIGVycm9yIGdlbmVyYXRl
ZC4KPgo+IE9idmlvdXNseSBuZWl0aGVyIG9mIHRoZSB0d28gc3VnZ2VzdGlvbnMgYXJlIGFuIG9w
dGlvbiBoZXJlLiBPZGRseQo+IGVub3VnaCBzd2FwcGluZyB0aGUgb3BlcmFuZHMgb2YgdGhlICYm
IGhlbHBzLCB3aGlsZSBlLmcuIGNhc3Rpbmcgb3IKPiBwYXJlbnRoZXNpemluZyBkb2Vzbid0LiBB
bm90aGVyIHdvcmthYmxlIHZhcmlhbnQgbG9va3MgdG8gYmUgdGhlIHVzZSBvZgo+ICEhIG9uIHRo
ZSBjb25zdGFudC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiAtLS0KPiBJJ20gb3BlbiB0byBnb2luZyB0aGUgISEgb3IgeWV0IHNvbWUgZGlmZmVy
ZW50IHJvdXRlLiBObyBtYXR0ZXIgd2hpY2gKPiBvbmUgd2UgY2hvb3NlLCBJJ20gYWZyYWlkIGl0
IGlzIGdvaW5nIHRvIHJlbWFpbiBndWVzc3dvcmsgd2hhdCBuZXdlcgo+IChhbmQgZnV0dXJlKSB2
ZXJzaW9ucyBvZiBjbGFuZyB3aWxsIGNob2tlIG9uLgoKSXMgZGlzYWJsaW5nIHRoZSBjaGVjayBp
dHNlbGYgbm90IGFuIG9wdGlvbj8gU2VlbXMgdG8gbWUgdG8gYmUgYSBtb3JlCnNlbnNpYmxlIG9w
dGlvbiB0aGVuIGhhY2tpbmcgYXJvdW5kIGl0LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
