Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B835B22067
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2019 00:43:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRlXD-0001Q6-G1; Fri, 17 May 2019 22:41:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Ke0=TR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRlXC-0001Q1-E6
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 22:41:02 +0000
X-Inumbo-ID: d7c416b5-78f4-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d7c416b5-78f4-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 22:41:00 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z1so7626620ljb.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 15:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9HpqvjNjSbuD1En2VfmYeZH7+KGA/+UqLc5Ds8mP/MA=;
 b=EWWdgA7LxSKNdliBG8EMWBo9jL6t9s2KuxehH+OaZ18aC6LvMj+z55JqKK8mxbHqus
 2eMbuqe6uoCdZ4OQ1F5Nj/DzUOJUr2zXOOCbg1oXTVrj1YMCEtyYFvwCRRzLht+K57iG
 kZerfobC30RX0BOR2UMysAh+sCmyg7pIfevhSwcsv4rGuob2cxpFsyDT/PqmzLagd2sC
 sCziBmupMIJ7g0JI9QrDvW5APK1h/+0tRkuOXbp/dd/bIo94VAUZD/otV3jAJqA5Kx4e
 BwDKh2NsB5WvmHp9N0waCGd+8arhDr2HKph87Bplurb3/WSPfkjLBjVF5o5AzfVZAptI
 MKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9HpqvjNjSbuD1En2VfmYeZH7+KGA/+UqLc5Ds8mP/MA=;
 b=dEhdI3ePpS2HOzGclrIu66i4vsc3nQ18BECfRig8FejmVXee/8QnCpfvJfWj6LflVW
 ct7YNnPrG2ZXXMtlQMMbUAKOGtfgxKEzzbuP0Dkf6ej5SMO4v2g4GEtI7113saXZtyMg
 VLET4b8MZpaKD3Y/4AoO4orIM0cYcDWMgPZ0hPVuyThvWa42oeoLQ1ze71bZ7ldZn6jq
 4euAuF3qT/J+2d5gFW0UyAEMrPo9aDY+BuZD8hIGGZWVtpXmhMQrsjop5Mlr34j3XJkc
 81jr2wOUZe8tqfkkg7ItIBdCYoRakM+szGELLUNre7Ux2wGmrlM/WhN7CxcOV7SNu5g6
 cxmQ==
X-Gm-Message-State: APjAAAXZxXBQxiThhIDPa4d2Qu2/Mw6KD5nGduCFyudcfqS9oTLcoX9C
 lY1JeC8XpXTzhJTNLHvtranlc4pI9o4Ej9ZK2Co=
X-Google-Smtp-Source: APXvYqwNIrfiyPc5iigRtjIcpk0A7/q2Xfp08T6p2FmpSc67ny1qlLvcGN1UwYMqurLfgKK4knZ05fk0G6WlWPGH+Mg=
X-Received: by 2002:a2e:8583:: with SMTP id b3mr4074925lji.136.1558132859507; 
 Fri, 17 May 2019 15:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
 <20190516151819.168c6b36.olaf@aepfle.de>
 <20190516133037.GH2798@zion.uk.xensource.com>
 <CAKmqyKPjkTJEHe_AR7sqZ+Od34A6ZTU4-N0+rYpLAS1h2HoL6g@mail.gmail.com>
 <20190517163756.GP2798@zion.uk.xensource.com>
In-Reply-To: <20190517163756.GP2798@zion.uk.xensource.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 May 2019 15:38:47 -0700
Message-ID: <CAKmqyKPp-vPFYxykbAEJ+8KfyUbhhNBJC0jOrmWkNPzFcZEw5g@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgOTozOCBBTSBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDEyOjI3OjE5UE0gLTA3MDAs
IEFsaXN0YWlyIEZyYW5jaXMgd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCA2OjMw
IEFNIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBU
aHUsIE1heSAxNiwgMjAxOSBhdCAwMzoxODoxOVBNICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToK
PiA+ID4gPiBBbSBUaHUsIDE2IE1heSAyMDE5IDEyOjM5OjAyICswMTAwCj4gPiA+ID4gc2Nocmll
YiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjoKPiA+ID4gPgo+ID4gPiA+ID4gYXV0b3Rv
b2xzIHNoaXBwZWQgaW4gYWxsIHRoZSBkaXN0cm9zIHdlIGNhcmUgYWJvdXQKPiA+ID4gPgo+ID4g
PiA+IEkgc2VlIGF1dG9jb25mIDIuNjkgaXMgYXZhaWxhYmxlIHByYWN0aWNhbGx5IGV2ZXJ5d2hl
cmUsIHN0YXJ0aW5nCj4gPiA+ID4gd2l0aCBvcGVuU1VTRSAxMi4yLCB3aGljaCB3YXMgcmVsZWFz
ZWQgaW4gUTMgMjAxMi4gU0xFMTEsIHdoaWNoCj4gPiA+ID4gY2FuIG5vdCBiZSBwcm9wZXJseSBz
dXBwb3J0ZWQgYW55bW9yZSwgaGFkIGF1dG9jb25mIDIuNjMuCj4gPiA+ID4KPiA+ID4KPiA+ID4g
VGhhbmtzIGZvciBjaGVja2luZyEKPiA+Cj4gPiBPaywgSSBoYXZlIHVwZGF0ZWQgdGhlIHBhdGNo
IHRvIHJlbW92ZSB0aGUgY29uZmlndXJlIHNjcmlwdCwgYnV0IHdlCj4gPiBzdGlsbCBhcmUgc3R1
Y2sgd2l0aCBjb25maWcuc3ViIGFuZCBjb25maWcuZ3Vlc3MgYXMgd2UgYXJlIHVzaW5nIHRoZQo+
ID4gQUNfQ0FOT05JQ0FMX0hPU1QgbWFjcm8gWzFdLiBJIHdpbGwgc2VuZCBhIHYyIHRoYXQgcmVt
b3ZlcyB0aGUKPiA+IGNvbmZpZ3VyZSBzY3JpcHQsIGJ1dCB0aGlzIHBhdGNoIGlzIHN0aWxsIHJl
cXVpcmVkLgo+ID4KPiA+IDE6IGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvYXV0b2NvbmYv
bWFudWFsL2F1dG9jb25mLmh0bWwjQ2Fub25pY2FsaXppbmcKPiA+Cj4KPiBCZWZvcmUgeW91IGdv
IGF3YXkgYW5kIGRvIHdvcmssIHBsZWFzZSB3YWl0IGZvciByZXBseSBmcm9tIElhbi4KCkkgaGFk
IGFscmVhZHkgZG9uZSBhbGwgdGhlIHdvcmsgc28gSSBzZW50IGEgdjIuIFdlIGNhbiBoYXZlIHRo
ZQpkaXNjdXNzaW9uIHRoZXJlLCBpdCBzdGlsbCBoYXMgdGhpcyBwYXRjaCAobW9yZSBvciBsZXNz
KSBhcyBwYXRjaCAxLgoKQWxpc3RhaXIKCj4KPiBXZWkuCj4KPiA+IEFsaXN0YWlyCj4gPgo+ID4g
Pgo+ID4gPiBXZWkuCj4gPiA+Cj4gPiA+ID4gT2xhZgo+ID4gPgo+ID4gPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
