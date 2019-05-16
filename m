Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E99721336
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 06:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRUfT-0007p7-2e; Fri, 17 May 2019 04:40:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pg8o=TQ=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRM2f-00079R-Fv
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 19:27:49 +0000
X-Inumbo-ID: af9ad7b9-7810-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id af9ad7b9-7810-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 19:27:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id j24so4194451ljg.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 12:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ittBp4n1QeTsBkX2q20F02j4uE6MuTDN62K48+XfnbQ=;
 b=eAmJbghRX3jKVQZfU1xsCXZYsK+5C/At4JeSv1g61KlFZqn2csoI9KT02BQ+xtUGRf
 ApFDDrtRiJponPr6PnSHQS6DHK/flO96ESjfb1wYUkzx7/FX8RhZsWIw+I4z7NEH05Z8
 mXLbaUZkKfd55DXBsYD6dw9GzVFJknbRSzHssBcAr04e1HByusSk7hA/m14WlV9na6ha
 GVFv558tZNztsgy81Mcd9JItzZTxcutr2BXWrGPk8i6QxfzaBFDoOg2uzMwsECqndepF
 B4l+M147wbp4gVH64zh/WaYyGaiDYIEzhPqjYrGYz6sp0X7nWhmW0PbbIn1mp7sgqNXY
 RXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ittBp4n1QeTsBkX2q20F02j4uE6MuTDN62K48+XfnbQ=;
 b=dJTS6JBw1PWSScGYjSZW+zmiv2cmvKGtmAcfH6xDELNCUhpSSXWEPh48YFcBADyqDH
 a6Xh4KGpNzl7pd1T/cgDhTN5mGXi+uwvvB745bJDr+7nQbu/0bkqxcVhnAUk5wt9g9WX
 0PVQzy8ZZlt3AHzQN2ja8geIkpN5wWhl93k6YRajavqr0bfTEnD3wRUSwt3IVL12LYIH
 /SRZpiY72qwCEWg1M3XH65HNJ0go0sXeKMmnpf+Ce/1RXZ0UlZnhuAQPLnwTjZ7+mMqs
 jhrzuEJgebvrZSKSDm3vWGaLB2X9GGx9kRhjxHwX3HnK+5MyH3fmCdDnTa8CeID+Av0g
 te2Q==
X-Gm-Message-State: APjAAAVE87g6dwOEV+IO0mx2csw1hBYp2xz7NGLwZDUGXOffg1fk1LCn
 tDQL5rpUyFPTo8ndv0R/v3Ysmz66h6+SQxhfd/A=
X-Google-Smtp-Source: APXvYqwxPh7XpErOTYF8/Wra6iTw5gMWZcwrIam0GFuKnv5tY5sUV9f7ePsFnPH+dGXhUnp7tBj7q1FLX57MwZV9QIA=
X-Received: by 2002:a2e:914d:: with SMTP id q13mr5223118ljg.140.1558034866859; 
 Thu, 16 May 2019 12:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
 <20190516151819.168c6b36.olaf@aepfle.de>
 <20190516133037.GH2798@zion.uk.xensource.com>
In-Reply-To: <20190516133037.GH2798@zion.uk.xensource.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 May 2019 12:27:19 -0700
Message-ID: <CAKmqyKPjkTJEHe_AR7sqZ+Od34A6ZTU4-N0+rYpLAS1h2HoL6g@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>
X-Mailman-Approved-At: Fri, 17 May 2019 04:40:25 +0000
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

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgNjozMCBBTSBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDAzOjE4OjE5UE0gKzAyMDAs
IE9sYWYgSGVyaW5nIHdyb3RlOgo+ID4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMjozOTowMiArMDEw
MAo+ID4gc2NocmllYiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjoKPiA+Cj4gPiA+IGF1
dG90b29scyBzaGlwcGVkIGluIGFsbCB0aGUgZGlzdHJvcyB3ZSBjYXJlIGFib3V0Cj4gPgo+ID4g
SSBzZWUgYXV0b2NvbmYgMi42OSBpcyBhdmFpbGFibGUgcHJhY3RpY2FsbHkgZXZlcnl3aGVyZSwg
c3RhcnRpbmcKPiA+IHdpdGggb3BlblNVU0UgMTIuMiwgd2hpY2ggd2FzIHJlbGVhc2VkIGluIFEz
IDIwMTIuIFNMRTExLCB3aGljaAo+ID4gY2FuIG5vdCBiZSBwcm9wZXJseSBzdXBwb3J0ZWQgYW55
bW9yZSwgaGFkIGF1dG9jb25mIDIuNjMuCj4gPgo+Cj4gVGhhbmtzIGZvciBjaGVja2luZyEKCk9r
LCBJIGhhdmUgdXBkYXRlZCB0aGUgcGF0Y2ggdG8gcmVtb3ZlIHRoZSBjb25maWd1cmUgc2NyaXB0
LCBidXQgd2UKc3RpbGwgYXJlIHN0dWNrIHdpdGggY29uZmlnLnN1YiBhbmQgY29uZmlnLmd1ZXNz
IGFzIHdlIGFyZSB1c2luZyB0aGUKQUNfQ0FOT05JQ0FMX0hPU1QgbWFjcm8gWzFdLiBJIHdpbGwg
c2VuZCBhIHYyIHRoYXQgcmVtb3ZlcyB0aGUKY29uZmlndXJlIHNjcmlwdCwgYnV0IHRoaXMgcGF0
Y2ggaXMgc3RpbGwgcmVxdWlyZWQuCgoxOiBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2F1
dG9jb25mL21hbnVhbC9hdXRvY29uZi5odG1sI0Nhbm9uaWNhbGl6aW5nCgpBbGlzdGFpcgoKPgo+
IFdlaS4KPgo+ID4gT2xhZgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
