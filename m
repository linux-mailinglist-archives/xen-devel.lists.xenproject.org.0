Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0D11CFE4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:34:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifPUD-0002Xy-DP; Thu, 12 Dec 2019 14:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S2J5=2C=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1ifPUC-0002Xt-5G
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:30:36 +0000
X-Inumbo-ID: f58957d0-1ceb-11ea-88e7-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f58957d0-1ceb-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 14:30:35 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id cy15so1974200edb.4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gju3EUlngyusbKeS6vFaR/4XTTpuzfrnNm7m53rjtdE=;
 b=dYYEoLWjGK9W8p+yiUutI7BGeeIKV0/RdjN3Gt84kx/qrI6+quYm+R4q7R8KgzYRfH
 1YYFyXMrK/6dBqERMsYUHg8Mj8/T7gZ0o6JWCPYKsSGitnJjbJnrhF3FkGY7JKqBleNX
 0i0MJ98ZFiAN8IHuTzkUOindwOq78aDHnU5mHGQMKRjpIJwnH3XB4yCiNfz8qhLNzZfq
 +g9FZKv0XXtcdb4V7dPsHAbg6duaE1XAOuZy4Kwqg2s26QSvBnk84uvdkK7GmDvMf6rR
 a3Wo6xPBGcQWrizvKDoM8qRe8u3DFM3ZjVAY40JirvimWtuJ0NNiv8pif5P34SQ0NPtk
 lJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gju3EUlngyusbKeS6vFaR/4XTTpuzfrnNm7m53rjtdE=;
 b=rVDcPZqsVJ8GY7GUcaI0Z4Y80r5DfCKOpSdyIfzf6gDks5L2Be+aU6UCjpJC4ucCAt
 RdGyJZ5JBBMtDznNs1/RPRzjIj/F2euNSPCcjkt99+BCpB4RE1jEw6FL0LFad3lJqjoI
 VtXvUZ4Qr1KLI7McG3u5/wly+YI/1gTtqZBcm1M1J+aC4+JMO8LmErBUvaAgoXx53Sqy
 F3ohozez7QVjbAJMrUyJKOz5++7C1mXbY3hjhU2NqNxTHrNattiZUmDRfBHgZE7Logen
 AU0wIROK8KGaa3TBYpcq3bGmdLRpvjygWBLZsZygBvPn0D0zlds12snmgJu9TsZ1mjbo
 cEhA==
X-Gm-Message-State: APjAAAUsPtn91IbUzipz1ncdMXJChuKaO0naqm2jTjmlx2FmmQjd9PtU
 L9fVZeyY1iOe3kEJZ3NgojFaJLHKLYuD1cDGjBU=
X-Google-Smtp-Source: APXvYqyDquDIo8nbaHLUJu1exvNn+kbIwh+mgg1HZJLsQFgkicoo5nX7ziPVSDABLQOaC+QsFVSUBhIfu0aJymKr07s=
X-Received: by 2002:a05:6402:28d:: with SMTP id
 l13mr9402518edv.236.1576161034659; 
 Thu, 12 Dec 2019 06:30:34 -0800 (PST)
MIME-Version: 1.0
References: <CAFqpmVJ90bAV4vasH1Z0DcTUjT7asCJFPeJBxtxGZwAhTVP7=w@mail.gmail.com>
 <b02d053f-1b07-bd4f-20fc-9a26106145d1@suse.com>
 <CAFqpmVLnHPUZEpvmw1-f=2LoPkfUHO67ETdwtnsPA7DsXRSRSA@mail.gmail.com>
 <7feb44ef-0957-3df1-3411-2a7b971d8931@suse.com>
In-Reply-To: <7feb44ef-0957-3df1-3411-2a7b971d8931@suse.com>
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Date: Thu, 12 Dec 2019 09:30:23 -0500
Message-ID: <CAFqpmV+UZo91+TXD+wqnZ88bn5km3uPoBf0rz=56aSCp9a3iBA@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
 boris.ostrovsky@oracle.com
Subject: Re: [Xen-devel] [BUG] Xen-ballooned memory never returned to domain
 after partial-free
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4gRG8geW91IGhhcHBlbiB0byBrbm93IHRoZSBhbnN3ZXIgdG8gbXkgc2Vjb25kIHF1ZXN0aW9u
PyBJdCdzIG5vdCBhcyBpbXBvcnRhbnQsCj4+IGJ1dCBpdCBkb2VzIGNvbmZ1c2UgbWUgYXMgSSB3
b3VsZG4ndCBleHBlY3QgdGhlIHRvdGFsIG1lbW9yeSB0byBiZQo+PiBiYWxsb29uLWFibGUgYXQK
Pj4gYWxsIHdpdGggdGhlIGhvdHBsdWdnaW5nIGNvbmZpZ3MgZGlzYWJsZWQuCgo+IEJhbGxvb25p
bmcgIT0gaG90cGx1Z2dpbmcgbWVtb3J5Cj4KPiBXaXRoIG1lbW9yeSBob3RwbHVnIHlvdSBjYW4g
YWRkIChvciAtIGluIHRoZW9yeSAtIHJlbW92ZSkgbWVtb3J5IHRvIHRoZQo+IGtlcm5lbCBpdCBk
aWRuJ3Qga25vdyBhYm91dCBiZWZvcmUuCj4KPiBXaXRoIGJhbGxvb25pbmcgeW91IGp1c3QgZ2l2
ZSBzb21lIG1lbW9yeSBiYWNrIHRvIHRoZSBoeXBlcnZpc29yLCBidXQKPiBrZXJuZWwgc3RpbGwg
aGFzIHNvbWUga25vd2xlZGdlIGFib3V0IGl0IChlLmcuIGtlZXBzIHN0cnVjdCBwYWdlIGZvcgo+
IGVhY2ggYmFsbG9vbmVkIG1lbW9yeSBwYWdlKS4KCkdvdCBpdCwgdGhhbmtzIGZvciB0aGF0IGNs
YXJpZmljYXRpb24gYW5kIGZvciBhbGwgeW91ciBoZWxwIQoKLS1OaWtvCgpPbiBUaHUsIERlYyAx
MiwgMjAxOSBhdCA5OjIxIEFNIErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6
Cj4KPiBPbiAxMi4xMi4xOSAxNToxMCwgTmljaG9sYXMgVHNpcmFraXMgd3JvdGU6Cj4gPj4gQW5k
IEkgdGhpbmsgdGhpcyBpcyB0aGUgcHJvYmxlbS4gV2Ugd2FudCBoZXJlOgo+ID4+Cj4gPj4gICAg
ICBiYWxsb29uX3N0YXRzLnRhcmdldF9wYWdlcyA9IGJhbGxvb25fc3RhdHMuY3VycmVudF9wYWdl
cyArCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJhbGxvb25fc3RhdHMu
dGFyZ2V0X3VucG9wdWxhdGVkOwo+ID4KPiA+IEFoaCBJIGtuZXcgSSB3YXMgbWlzc2luZyBzb21l
dGhpbmcuIFRlc3RlZCB0aGUgcGF0Y2gsIHdvcmtzIGdyZWF0ISAiUmVwb3J0ZWQgYnkiCj4gPiBp
cyBmaW5lIHdpdGggbWUuCj4KPiBUaGFua3MuCj4KPiA+Cj4gPiBEbyB5b3UgaGFwcGVuIHRvIGtu
b3cgdGhlIGFuc3dlciB0byBteSBzZWNvbmQgcXVlc3Rpb24/IEl0J3Mgbm90IGFzIGltcG9ydGFu
dCwKPiA+IGJ1dCBpdCBkb2VzIGNvbmZ1c2UgbWUgYXMgSSB3b3VsZG4ndCBleHBlY3QgdGhlIHRv
dGFsIG1lbW9yeSB0byBiZQo+ID4gYmFsbG9vbi1hYmxlIGF0Cj4gPiBhbGwgd2l0aCB0aGUgaG90
cGx1Z2dpbmcgY29uZmlncyBkaXNhYmxlZC4KPgo+IEJhbGxvb25pbmcgIT0gaG90cGx1Z2dpbmcg
bWVtb3J5Cj4KPiBXaXRoIG1lbW9yeSBob3RwbHVnIHlvdSBjYW4gYWRkIChvciAtIGluIHRoZW9y
eSAtIHJlbW92ZSkgbWVtb3J5IHRvIHRoZQo+IGtlcm5lbCBpdCBkaWRuJ3Qga25vdyBhYm91dCBi
ZWZvcmUuCj4KPiBXaXRoIGJhbGxvb25pbmcgeW91IGp1c3QgZ2l2ZSBzb21lIG1lbW9yeSBiYWNr
IHRvIHRoZSBoeXBlcnZpc29yLCBidXQKPiBrZXJuZWwgc3RpbGwgaGFzIHNvbWUga25vd2xlZGdl
IGFib3V0IGl0IChlLmcuIGtlZXBzIHN0cnVjdCBwYWdlIGZvcgo+IGVhY2ggYmFsbG9vbmVkIG1l
bW9yeSBwYWdlKS4KPgo+IEhUSCwgSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
