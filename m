Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C024418CB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 01:19:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hapzu-0004Xp-Os; Tue, 11 Jun 2019 23:16:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W27b=UK=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hapzs-0004Xk-HE
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 23:16:08 +0000
X-Inumbo-ID: e3b23e8c-8c9e-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e3b23e8c-8c9e-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 23:16:07 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j29so10559200lfk.10
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 16:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zvlfmaw0ZE/4jsknjaabUCvdY7QQhJp7ckapgQSgNNk=;
 b=TZrY0mtHdrU05F9aXeJ31lSC2LTkUrPVynKnh3n6QVLCVcyA8cj/d9OJyB4rNY+w7K
 xdzwhMV6aMEuWVwEwPUEATGf2Tq2dtI5XYHV6VgtMdg6T0G5F4kRo+NojtYhhjIryHCL
 yO2aXfTd8EGG+Xb0QU3ZmInk91fT7cydHcut1zrR7ni0OaghUKc56uNeulvXLnw9Vazc
 ZjyJBgn2n6EHWEaVWvqTJbg8A5qpeoRPnZsoUjNmAQvGdhZPUq+qmLJY7gStXimhvIzS
 rqNis1yts/PWcWBNRd5b0Po+Em9Rcdbsj7yHzA9Yu9XBoFwunQG/BogjfB+eMx5lFAiY
 WxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zvlfmaw0ZE/4jsknjaabUCvdY7QQhJp7ckapgQSgNNk=;
 b=lTxUfiXijBnDDl41hMiCWWf2v8v79qnd/1A3YW10E+sF7BqLq/CK2GD9L+ko6lCA6h
 JHYIsvETL4ygvCgA1GDXXHcK48OKrKzPjEaaQNjuO32V67z4EHRCIxMMJ5rolNOiUKiZ
 0uxSld49sQRcNX9EOI7yP1M055bDKDafCwd7+LZIBMuZ3bhEUSbKpwqu8g4kAElp/jrM
 cLlG2kxq6DHh6VfgmeXioPBOyv3IqehTISDEdu9/v8zuMlQvGTMU4HEzpA/9cMAf4ZL5
 G7TGjBvGcKTTWs8qurkmodMg/CBwqvmA8hCGfIuI+l1UxQ33tKG4SQBqtssiCCKL2tss
 xZKg==
X-Gm-Message-State: APjAAAW3BxKNGSxuMw+E67fkMmYEDyyfzvuaPOAr8Pw0+PDMOsAmlZmY
 l6pxTyypVdK2ocrtxQBcC6Gfn3+rHr6du7hF0cw=
X-Google-Smtp-Source: APXvYqwaV6WKXHgFmkcypmoqCJakh11p+PECuFrEUfFEv2f1b+J8ZdAhos6iZ+oQRGM2AE8dkssujCZWdvgBqifgawc=
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr33082250lfg.62.1560294966021; 
 Tue, 11 Jun 2019 16:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560286430.git.tsirakisn@ainfosec.com>
In-Reply-To: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560286430.git.tsirakisn@ainfosec.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 11 Jun 2019 16:15:54 -0700
Message-ID: <CACMJ4GavqX2CUHXpEnSv4k-By5RwGrKdQEN9L=4PaO78iQi0mg@mail.gmail.com>
To: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Subject: Re: [Xen-devel] [PATCH v2 1/2] argo: warn sendv() caller when ring
 is full
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
 Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMjoxNCBQTSBOaWNob2xhcyBUc2lyYWtpcwo8bmlrby50
c2lyYWtpc0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSW4gaXRzIGN1cnJlbnQgc3RhdGUsIGlmIHRo
ZSBkZXN0aW5hdGlvbiByaW5nIGlzIGZ1bGwsIHNlbmR2KCkKPiB3aWxsIHJlcXVldWUgdGhlIG1l
c3NhZ2UgYW5kIHJldHVybiB0aGUgcmMgb2YgcGVuZGluZ19yZXF1ZXVlKCksCj4gd2hpY2ggd2ls
bCByZXR1cm4gMCBvbiBzdWNjZXNzLiBUaGlzIHByZXZlbnRzIHRoZSBjYWxsZXIgZnJvbQo+IGRp
c3Rpbmd1aXNoaW5nIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYSBzdWNjZXNzZnVsIHdyaXRlIGFu
ZCBhCj4gbWVzc2FnZSB0aGF0IG5lZWRzIHRvIGJlIHJlc2VudCBhdCBhIGxhdGVyIHRpbWUuCj4K
PiBJbnN0ZWFkLCBjYXB0dXJlIHRoZSAtRUFHQUlOIHZhbHVlIHJldHVybmVkIGZyb20gcmluZ2J1
Zl9pbnNlcnQoKQo+IGFuZCAqb25seSogb3ZlcndyaXRlIGl0IGlmIHRoZSByYyBvZiBwZW5kaW5n
X3JlcXVldWUoKSBpcyBub24temVyby4KPiBUaGlzIGFsbG93cyB0aGUgY2FsbGVyIHRvIG1ha2Ug
aW50ZWxsaWdlbnQgZGVjaXNpb25zIG9uIC1FQUdBSU4gYW5kCj4gc3RpbGwgYmUgYWxlcnRlZCBp
ZiB0aGUgcGVuZGluZyBtZXNzYWdlIGZhaWxzIHRvIHJlcXVldWUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBOaWNob2xhcyBUc2lyYWtpcyA8dHNpcmFraXNuQGFpbmZvc2VjLmNvbT4KClRoaXMgcGF0Y2gg
aGFzIGFscmVhZHkgYmVlbiBhcHByb3ZlZCBhbmQgYXBwbGllZDsgc28gbm8gbmVlZCB0byByZXNl
bmQKaXQgYWdhaW4sIHRoYW5rcy4KCkNocmlzdG9waGVyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
