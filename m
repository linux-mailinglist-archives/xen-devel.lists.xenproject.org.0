Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BEE3D6C7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 21:26:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hamMT-0002fN-9F; Tue, 11 Jun 2019 19:23:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W27b=UK=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hamMR-0002fH-Vo
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 19:23:12 +0000
X-Inumbo-ID: 58baa3ee-8c7e-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 58baa3ee-8c7e-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 19:23:10 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j29so10167397lfk.10
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQ5+BidQ9Tn8iXNNRvGjRH2tHOEQnFpsDpMe0k3BjWY=;
 b=W26toL5E9Wa9CjJKdcBMCHzIueNBtPCXJQVV5uPcD54uOWjdxLwrh9vyZXLeF6RPt4
 I6Lbc1pgL9BtIbvSDPn5qNS4BF1rTOWCFTlNQnl17swgj0r/EULNxy+hVkTwDDdPPvQB
 GEcPeW2lFcbQiR/rthbnuEJQwbfk7mA2vKroUWZBuZIOnh6FcscYVN4BZ2QTIUt/N8g+
 PZSCdtMHOBWiaLdGqyOTYhQaAnQeyMnvwet93uqTnfG4bs+eqzwawLwlKROfOgUNLuRp
 V3ZLAFvGxe5Bw9iaFBjvvm4w5gQkPd0+QiZpBttrJtjMd2HsoGPTPZjwZ6Chmb7cW1Fq
 0e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQ5+BidQ9Tn8iXNNRvGjRH2tHOEQnFpsDpMe0k3BjWY=;
 b=WYktbSAyDa4bA0JGJhfQ2ozP0+XgBKwV0JB3W1Yg+gHunKv8NE/jAfTJUleUuKyNV0
 otZ9nARsAbo1QWJG8BBLNvEP+HO6aH4jwMvsN2E4Uxn0c2r+ivhzbaTFFu5Wcw/PRX/n
 3M98CYbqf1gRl1wkQGBsQZFT+TgOZEIR7yzv719UKAaOSSNITHBdlDesgM6PLTfsolft
 /qwbzEYK5lu4Ub464VAwZLceEcqp4gXToXp6/Gzcim5/cd9WPPFNnFiY7QwfiEA9gtHw
 YiJDYVFB5zhp2xvZg+xOS33GV4I2OJesLVAVCVo79YP1AhBPiGhNKeuje01yP7ytyfcB
 BVgQ==
X-Gm-Message-State: APjAAAWn8JzlGXPhZdjmmpZxlWzbJYN/QrUY7bNz+wafLyyW1JvK6txk
 R8gxUUQVJh6abTz2CKdQseUVjW2tVxaicmCTMS0=
X-Google-Smtp-Source: APXvYqxK1IvCsdsl/xYmCxCToQvntyBve+UcXnuETf02pArzX7T6VCCl70RANwG0HigcbWiOcdQDnyIxG1MGicxcd6w=
X-Received: by 2002:a19:f713:: with SMTP id z19mr37089601lfe.121.1560280988972; 
 Tue, 11 Jun 2019 12:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
 <CACMJ4GYFeudWjWUOEDPYCKPF+JNJ761yQ7n+rkEY4bzWbnO69Q@mail.gmail.com>
 <fed80081-964c-05a2-8438-4b01d250eb8c@citrix.com>
In-Reply-To: <fed80081-964c-05a2-8438-4b01d250eb8c@citrix.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 11 Jun 2019 12:22:57 -0700
Message-ID: <CACMJ4GYGAc0xU836Cz2B6NTn-52uKmA5q0+s9vmOt6HD8kYUKw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/2] argo: warn sendv() caller when ring is
 full
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
 Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Nicholas Tsirakis <niko.tsirakis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTI6MTYgUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS8wNi8yMDE5IDE5OjQzLCBDaHJpc3Rv
cGhlciBDbGFyayB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDEwOjExIEFNIE5p
Y2hvbGFzIFRzaXJha2lzCj4gPiA8bmlrby50c2lyYWtpc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+
IEluIGl0cyBjdXJyZW50IHN0YXRlLCBpZiB0aGUgZGVzdGluYXRpb24gcmluZyBpcyBmdWxsLCBz
ZW5kdigpCj4gPj4gd2lsbCByZXF1ZXVlIHRoZSBtZXNzYWdlIGFuZCByZXR1cm4gdGhlIHJjIG9m
IHBlbmRpbmdfcmVxdWV1ZSgpLAo+ID4+IHdoaWNoIHdpbGwgcmV0dXJuIDAgb24gc3VjY2Vzcy4g
VGhpcyBwcmV2ZW50cyB0aGUgY2FsbGVyIGZyb20KPiA+PiBkaXN0aW5ndWlzaGluZyB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIGEgc3VjY2Vzc2Z1bCB3cml0ZSBhbmQgYQo+ID4+IG1lc3NhZ2UgdGhh
dCBuZWVkcyB0byBiZSByZXNlbnQgYXQgYSBsYXRlciB0aW1lLgo+ID4+Cj4gPj4gSW5zdGVhZCwg
Y2FwdHVyZSB0aGUgLUVBR0FJTiB2YWx1ZSByZXR1cm5lZCBmcm9tIHJpbmdidWZfaW5zZXJ0KCkK
PiA+PiBhbmQgKm9ubHkqIG92ZXJ3cml0ZSBpdCBpZiB0aGUgcmMgb2YgcGVuZGluZ19yZXF1ZXVl
KCkgaXMgbm9uLXplcm8uCj4gPj4gVGhpcyBhbGxvd3MgdGhlIGNhbGxlciB0byBtYWtlIGludGVs
bGlnZW50IGRlY2lzaW9ucyBvbiAtRUFHQUlOIGFuZAo+ID4+IHN0aWxsIGJlIGFsZXJ0ZWQgaWYg
dGhlIHBlbmRpbmcgbWVzc2FnZSBmYWlscyB0byByZXF1ZXVlLgo+ID4+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogTmljaG9sYXMgVHNpcmFraXMgPHRzaXJha2lzbkBhaW5mb3NlYy5jb20+Cj4gPiBUaGFu
a3MgZm9yIHRoZSBjb3JyZWN0IGlkZW50aWZpY2F0aW9uIG9mIHRoZSBwcm9ibGVtIGFuZCB0aGUg
cGF0Y2guCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhl
ci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Cj4KPiBTbyBJIHdhcyBjb21pbmcgdG8gY29tbWl0IHRo
aXMsIGJ1dCB0ZWNobmljYWxseSBhY2NvcmRpbmcgdG8gdGhlCj4gbWFpbnRhaW5lcnMgZmlsZSwg
QVJHTyBpcyBtYWludGFpbmVkIGJ5IDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4KPgo+
IExvb2tpbmcgYXQgdGhlIEFSR08gc2VyaWVzIGFzIGNvbW1pdHRlZCwgdGhlIHBhdGNoZXMgd2hl
cmUgYWxsIEZyb206Cj4gZ21haWwsIFNvQjogYmFlc3lzdGVtcy4KPgo+IFdoaWNoIGlzIHRoZSBj
b3JyZWN0IGFsaWFzIHRvIHVzZT8KCkZvciB0aGlzIHB1cnBvc2U6ClJldmlld2VkLWJ5OiBDaHJp
c3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+Cgp0aGFua3MKCkNo
cmlzdG9waGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
