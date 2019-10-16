Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BBCD927A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 15:30:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKjJu-00070U-0Z; Wed, 16 Oct 2019 13:26:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kVf2=YJ=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iKjJs-00070P-P5
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 13:26:28 +0000
X-Inumbo-ID: 8ee6a49c-f018-11e9-bbab-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ee6a49c-f018-11e9-bbab-bc764e2007e4;
 Wed, 16 Oct 2019 13:26:28 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t5so2580894ilh.10
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2019 06:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKOTZmkisUzzW0kthONfve/DoeJR9KaCArCV/GIyG8s=;
 b=KDThNsqlpgk2J0Uj6NKXWD0+Rl1S1O5F1ywNqBYG3H6qQdvNmJSNAkJAya+L6wy1RT
 E1bQ5TkEDgevOaELlSN0zUKUQCBK5Focz7AFRxKNjvUgC5AT4NR5eogcguEmKMniCnUU
 5XaWtECFNogzopbcyTyMG3LbR0ovfTSs1331iTzk6Lyjt2Na2d9dRkMmZOSG4IdC/lym
 1F7m7qCSrO5mn7jgiuHiEKpqzVogb30LDA5Kf7ZZx1MayhUWgEQmYKIqghQZ9HBIgx4v
 1HQo7tfy2G0jD9M9mQMMrztFO+k7iH18hwfUM1vCm5TXW1Db6b/5+KOkc/7NNcN3uJWp
 y2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKOTZmkisUzzW0kthONfve/DoeJR9KaCArCV/GIyG8s=;
 b=gp4GNpW8JIdJmnSuMHSzEJcIH89lF8N3aXm7ljWRz0kjaVZPC5NaN5NIR9crqfi3Jh
 lQHauMHOa34q6JwdYkiPKd8aN/dEQ8tYFHR93NY1mH5AKqkubJn0wP+NkJS6EE2P3H8f
 BkZuQc8S10d+NjQ0vEQZIjokowjSBsQFlceMnhvzmXm8N4I33NAJVWKJR1BKP3VaJz4q
 YjACuadTnw0LP6gkXmTxbm81CRpS991jBtfHd5FssM3PghWhpzSgjBIgqmdHFXX64wmz
 044d/KmOB8jz2nXE085y9wAMvCHNCDUlTGP3E1OCiJD54cw3WSFIIp+tTgOVOy058yyQ
 2HzA==
X-Gm-Message-State: APjAAAXQR2ROso2kddu2uyv2TOd6d/itvbh+jXDm/vrG/BEfEJvDLe1d
 gAV7vO4g3VFgPpDfMVKKBFwpoMMOhyRY1UjYMKI1ep2CPMpqjA==
X-Google-Smtp-Source: APXvYqwUwp1zc8rc8bLnNkoPoa71lT7XaTyzI9L05GHxsN9T9O2hXiLkS92P023GO8ZVdLPZKzFTid1JZA8IMfzS6cQ=
X-Received: by 2002:a92:7702:: with SMTP id s2mr11453964ilc.248.1571232387402; 
 Wed, 16 Oct 2019 06:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <23968.39034.34800.276030@mariner.uk.xensource.com>
 <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
 <23968.46591.386956.861918@mariner.uk.xensource.com>
In-Reply-To: <23968.46591.386956.861918@mariner.uk.xensource.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Wed, 16 Oct 2019 16:26:16 +0300
Message-ID: <CACvf2oXrw9KdbYq__+Q7bSEPi7Gx8ZnjMTatQRj38Kw80-ywYA@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgODowNCBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbGVrc2FuZHIgR3J5dHNvdiB3cml0ZXMgKCJSZTogW1BB
VENIIHYxIDEvMl0gbGlieGw6IGludHJvZHVjZSBuZXcgYmFja2VuZCB0eXBlIFZJTlBVVCIpOgo+
ID4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNTo1OCBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+IEkgdGhpbmsgaXQgd2FzIGE0OGUwMGYxNGEyZCAi
bGlieGw6IGFkZCBiYWNrZW5kIHR5cGUgYW5kIGlkIHRvIHZrYiIKPiA+ID4gd2hpY2ggaW50cm9k
dWNlZCB3aGF0IHlvdSBhcmUgY2FsbGluZyAidXNlciBzcGFjZSIgYmFja2VuZHMuICBJdAo+ID4g
PiBhcHBlYXJzIHRoYXQgdGhlIHZrYiBiYWNrZW5kIHR5cGUgZW51bSB3YXMgaW50cm9kdWNlZCB0
aGVyZQo+ID4gPiBzcGVjaWZpY2FsbHkgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiB0aGVzZSB0d28g
c2l0dWF0aW9ucy4gIEZvciByZWFzb25zCj4gPiA+Cj4gPiA+IEFtIEkgd3JvbmcgPyAgSWYgbm90
LCB3aHkgaXMgdGhpcyBub3Qgd29ya2luZyBvciBub3Qgc3VpdGFibGUgPwo+ID4KPiA+IFlvdSBh
cmUgcmlnaHQuIEl0IGlzIG5vdCB3b3JraW5nIGluIHNvbWUgY2FzZXMgZHVlIHRvIFFFTVVfQkFD
S0VORCBtYWNyby4KPiA+IFFFTVVfQkFDS0VORCB0cmVhdHMgYm90aCBiYWNrZW5kcyBhcyBRRU1V
LiBBcyByZXN1bHQgeGwgcGVyZm9ybXMgZGV2aWNlCj4gPiBob3RwbHVnIG9uIGFkZC9yZW1vdmUg
ZGV2aWNlLiBXaGljaCBpcyBub3QgZXhwZWN0ZWQgaW4gY2FzZSAidXNlcgo+ID4gc3BhY2UiIGJh
Y2tlbmQuCj4KPiBUaGVuIHBlcmhhcHMgdGhpcyBtYWNybyBuZWVkcyB0byBiZSBhZGp1c3RlZCBv
ciBjYWxsZWQgb25seQo+IGNvbmRpdGlvbmFsbHkgb3Igc29tZXRoaW5nID8KCkkgaGFkIGFuIGlk
ZWEgdG8gbW92ZSB0aGlzIG1hY3JvIHRvIGxpYnhsX19kZXZpY2VfdHlwZSBhbmQgbGV0IGRldmlj
ZQppdHNlbGYgZGVjaWRlcwppZiBpdCBpcyBxZW11IGJhY2tlbmQuIEJ1dCBpbiBjYXNlIG9mIFZL
QkQgaXQgd2lsbCByZWFkIFhTIHRvIGRldGVybWluZSBiYWNrZW5kCnR5cGUuIEkgZ3Vlc3MgaXQg
aXMgb2suCgo+Cj4gPiBJbiB0aGlzIHBhdGNoIEkgcHJvcG9zZSBzb2x1dGlvbiBzaW1pbGFyIHRv
IFZVU0IgZGV2aWNlLiBXaGVyZSBWVVNCCj4gPiB1c2VkIGZvciBmcm9udGVuZCBhbmQgZGVwZW5k
cyBvbiBiYWNrZW5kIChrZXJuZWwgb3IgUUVNVSkgZWl0aGVyCj4gPiBWVVNCIG9yIFFVU0IgdXNl
ZCBmb3IgYmFja2VuZCBkZXZpY2UgdHlwZSBlLmcuIHVzZSBkaWZmZXJlbnQgYmFja2VuZAo+ID4g
ZGV2aWNlIHR5cGUgZm9yIGRpZmZlcmVudCBiYWNrZW5kcy4KPgo+IEkgY29uZmVzcyBJIGRvbid0
IHF1aXRlIGZvbGxvdyBhbGwgdGhlIFZVU0Igc3R1ZmYgYnV0IEkgZG9uJ3QgdGhpbmsgaXQKPiBp
cyBuZWNlc3NhcmlseSBhIGdvb2QgbW9kZWwuCgpJZiB5b3UgZG9uJ3QgbWluZCB0byBtb3ZlIFFF
TVVfQkFDS0VORCBtYWNydG8gdG8gbGlieGxfX2RldmljZV90eXBlIHRoZW4Kbm8gbmVlZCB0byBh
ZGQgbmV3IGRldmljZSB0eXBlIGF0IGFsbC4KCj4KPiA+IEludHJvZHVjaW5nIG5ldyBiYWNrZW5k
IGRldmljZSB0eXBlIGZvciBWS0JEIGFsc28gYWxsb3dzIHRvIGhhdmUKPiA+IGJvdGggYmFja2Vu
ZHMgKFFFTVUgYW5kIG5vbiBRRU1VKSBydW4gaW4gc2FtZSBkb21haW4uIE5vdCBzdXJlIGlmIGl0
Cj4gPiBpcyB1c2VmdWwgc2NlbmFyaW8gYnV0IHdpdGggdGhpcyBwcm9wb3NhbCBpdCBpcyBwb3Nz
aWJsZSBmcm9tCj4gPiB0ZWNobmljYWwgcG9pbnQgb2Ygdmlldy4KPgo+IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aHkgdGhpcyBpcyBub3QgcG9zc2libGUgc2ltcGx5IGJ5IGhhdmluZyBhCj4gZGlmZmVy
ZW50IGJhY2tlbmQgdHlwZS4KPgo+ID4gPiBJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhl
ICJ1c2VyIHNwYWNlIiBrYmQgYmFja2VuZCBzZWVtcyB0byBiZQo+ID4gPiAibGludXgiIGluIHRo
ZSBlbnVtLgo+ID4KPiA+IEkgYWdyZWUgdGhpcyBpcyBub3Qgc28gZ29vZCBuYW1lLiBCdXQgSSBk
b24ndCBrbm93IGhvdyB0byBjYWxsCj4gPiBiYWNrZW5kcyB3aGljaCBhcmUgbm90IHJ1bm5pbmcK
PiA+IGluc2lkZSBRRU1VIGluIGdlbmVyYWwuCj4KPiBJIHRoaW5rIHRoaXMgd291bGQgYmUgdXNl
YWJsZSBvbiBmcmVlYnNkID8gICJsaW51eCIgZGVmaW5pdGVseSBzZWVtcwo+IHdyb25nLiAgSSBz
ZWUgaXQgaGFzbid0IGJlZW4gaW4gYSByZWxlYXNlIHNvIGl0IGlzIG5vdCB0b28gbGF0ZSB0bwo+
IHJlbmFtZSBpdCwgc3ViamVjdCB0byBkaXNjdXNzaW9uIHdpdGggSnVlcmdlbiBhcyBSTS4KPgo+
ID4gPiBXaGVyZSBpcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhpcyB1c2VyIHNwYWNlCj4gPiA+
IGJhY2tlbmQgPwo+ID4KPiA+IFdlIGhhdmUgZXh0ZW5kZWQga2JkIGludGVyZmFjZSAoa2JkaWYu
aCkgdG8gc3VwcG9ydCBtdWx0aS10b3VjaCBldmVudHMKPiA+IGFzIHdlbGwuIEFuZCB3ZSBoYXZl
Cj4gPiBpbXBsZW1lbnRlZCBvd24ga2JkIGJhY2tlbmQgaHR0cHM6Ly9naXRodWIuY29tL3hlbi10
cm9vcHMvZGlzcGxfYmUvCj4gPiBJdCBpcyBpbnRlZ3JhdGVkIHdpdGggZGlzcGxheSBiYWNrZW5k
IGFzIGJvdGggdXNlIHdheWxhbmQgQVBJLgo+Cj4gR3JlYXQuCj4KPiA+ID4gSXMgaXQgYmUgY29u
dHJvbGxlZCBlbnRpcmVseSB0aHJvdWdoIHhlbnN0b3JlID8KPiA+Cj4gPiBZZXMgaXQgaXMgY29u
dHJvbGxlZCBlbnRpcmVseSB0aHJvdWdoIHhlbnN0b3JlOiBsaWIgeGwgY3JlYXRlcwo+ID4gZnJv
bnRlbmQvYmFja2VuZCBlbnRyaWVzIHdpdGgKPiA+IGluaXRpYWwgc3RhdGVzIGFuZCBjb25maWd1
cmF0aW9uLgo+Cj4gQW5kIHlvdXIgZGlzcGxheSBiYWNrZW5kIGluICJ0cm9vcHMiIChpcyB0aGF0
IHRoZSBuYW1lIG9mIHlvdXIKPiBwcm9qZWN0KSBjaGVja3Mgd2hldGhlciB0aGUgYmFja2VuZCB0
eXBlIGlzIHNldCB0byAibGludXgiLCBzbyB0aGF0IGl0Cj4ga25vd3MgdG8gaWdub3JlIG9uZXMg
dGhhdCBzYXkgInFlbXUiID8KPgo+IE1heWJlICJsaW51eCIgc2hvdWxkIGJlICJ0cm9vcHMiLi4u
Cj4KCkl0IGRvZXNuJ3QgbG9vayBhcyBnZW5lcmljIHNvbHV0aW9uLiBJZiBzb21lIHVzZXIgaW1w
bGVtZW50cyBvd24gYmFja2VuZAppdCBzaG91bGQgYWRkIG5ldyBlbnRyeSBpbnRvIGJhY2tlbmQg
dHlwZSBlbnVtLgpXaGF0IGFib3V0IHRvIGhhdmUganVzdCBzdHJpbmcgdmFsdWUgaW5zdGVhZCBv
ZiBlbnVtPyBJbiBjYXNlIFFFTVUKd2UgZG9uJ3QgaGF2ZSBzdWNoIGVudHJ5IGF0IGFsbCBidXQg
aW4gY2FzZSBjdXN0b20gYmFja2VuZCB0aGUgdXNlcgpjYW4ndCBwdXQgYW55IHN0cmluZyB2YWx1
ZSBoZXJlIHRvIGJlIHJlY29nbml6ZWQgYnkgaGlzIGJhY2tlbmQuCgo+IElhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
