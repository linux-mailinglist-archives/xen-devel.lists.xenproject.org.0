Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9E411F8CE
	for <lists+xen-devel@lfdr.de>; Sun, 15 Dec 2019 17:15:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igWTt-0001c0-Gs; Sun, 15 Dec 2019 16:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NK43=2F=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1igWTs-0001bv-0v
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2019 16:10:52 +0000
X-Inumbo-ID: 767da7e0-1f55-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 767da7e0-1f55-11ea-88e7-bc764e2007e4;
 Sun, 15 Dec 2019 16:10:51 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so4042609wmc.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zHzfAo+PCNLw3sALHosalVNGcbIna7A4mY/mFcUWnS4=;
 b=pDdPo/OXwsM7gXOxujARwcdalf8paJW3Rmv/ghIBuV+Bg2XN/j9xY7OHtGT+JsFrsW
 mTjuqsN06biu7ds7DKIJvDj9BSSsK2RgCBy+KxIecCD2+s9+Ix5xxnUZPc33ijsziKC1
 myWmJRi3PhPAvW0UHUVwtXWyqVJjMVWKjJVO3efh40FWIpXi6gqOcQtuW+eKyTkq1hwi
 Yp1j4YcM2iR485ObJuZ2hPJqxh7iHquxraKGCVqwW0hn26D7lImLobYKFTF60o/DLXJQ
 Xn7hmzeoooRaWLmFVtKJuUnta7FpLmI/vBFDp/UQjExlL0tdaEu20jdzSPdlICDGePmh
 lOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zHzfAo+PCNLw3sALHosalVNGcbIna7A4mY/mFcUWnS4=;
 b=WRbQuQLEaMmd0gIkSIwWBHY99gJGYG8aczH3MENVHMmp6vp/MskLAzrQublRieHXSj
 hLCYg58jIFSVYSxriV3TMrJfZKH+VlEJc8uU1T0MVRmLpy/xtJePA2aN9BP/lPDIkSHR
 Fn4XPUyMz1/ba/iAIAVJVyTDuyv3Ws8R4W2TuSZCl3NU26VcjU88ZK52Q1Gu3yIjanrl
 jU5dptyOC+gO5oRjTESBwbD1ydNukHA6oTrnXMF9p4AW1xiFfUF5dqbDy6rzcdhBPmNk
 rtPEepFkI66DNZkCQjSWiC93KVQOjo7dyHoWmzx4k/5/MaEF7CDbWcvuBPzN/XnQibEN
 HDiA==
X-Gm-Message-State: APjAAAVnwZ22pMYbZgoU8SrhW9iOCx72C+aiHk/kb1hcAIADlXCkAfEu
 LBMBT3VcYZaIQ131+RcmZTiROZeHqJ19PwOAlus=
X-Google-Smtp-Source: APXvYqzdmP9CLsfdAHlbHLPBKYg3Ndi8wRAGolTKffXYGkpaWl3zJsj9KPhdVDzXi5t4tUnMi7w0VvNGtA+pzehi0ng=
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr27314461wmi.15.1576426250373; 
 Sun, 15 Dec 2019 08:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
 <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
 <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
 <ff5b0699-5010-fabc-f7fd-2d40f8c56644@amazon.com>
 <2d23e5e7-fe5d-3446-57e5-6559cd8e7258@citrix.com>
 <CABfawhmU=EwU0RD2b4aD6GjD8rjePg7o6QFG-JwJqODWcMq1Cw@mail.gmail.com>
 <46668b7d-8dd5-1c73-1d08-c5beabdf0fd5@citrix.com>
In-Reply-To: <46668b7d-8dd5-1c73-1d08-c5beabdf0fd5@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 15 Dec 2019 09:10:14 -0700
Message-ID: <CABfawhmbw4FE0Yfz6XSRQi2+Fh_HtE5O9KZ7iA1svVpn-hfWuw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEZvciBEUlRNIEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgbXVjaAo+ID4gZGlmZmVyZW5jZSwg
SSBiZWxpZXZlIHRoZSBhY3RpdmUgbWljcm9jb2RlIGluZm8gaXMgYWxyZWFkeSBwYXJ0IG9mIHRo
ZQo+ID4gbWVhc3VyZW1lbnQsIHNvIGhhdmluZyBpdCBtZWFzdXJlZCBhcyBwYXJ0IG9mIHRoZSBY
ZW4gYmxvYiBkb2Vzbid0IGFkZAo+ID4gYW55dGhpbmcuCj4KPiBJIGNvdWxkbid0IHBvc3NpYmx5
IGNvbW1lbnQgb24gdGltZWxpbmVzLCBidXQgaWYgSSBjb3VsZCwgdGhlIGFuc3dlcgo+IG1pZ2h0
IGJlICJub3QgZm9yIGEgbGl0dGxlIHdoaWxlIHlldCIuCj4KPiBGb3Igbm93LCBtaWNyb2NvZGUg
aXMgdmVyeSBkZWZpbml0ZWx5IHNvZnR3YXJlJ3MgcHJvYmxlbSB0byBpbmNsdWRlIGluCj4gbWVh
c3VyZW1lbnRzLgoKQWggcmlnaHQsIEkgd2FzIG1peGluZyBpdCB1cCB3aXRoIHRoZSBBQ00gYmxv
YiB0aGF0IGdldHMgbWVhc3VyZWQgdGhlcmUuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
