Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A5C0F6D
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 05:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iE35a-00037y-WE; Sat, 28 Sep 2019 03:08:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y9qB=XX=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iE35Z-00037t-O1
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 03:08:05 +0000
X-Inumbo-ID: 305b0316-e19d-11e9-bf31-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by localhost (Halon) with ESMTPS
 id 305b0316-e19d-11e9-bf31-bc764e2007e4;
 Sat, 28 Sep 2019 03:08:04 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id y144so3583801qkb.7
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 20:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fONCvjWB5gyniUuE4K1/PiO7ByikOkTCKe/7iMeRfs8=;
 b=FLYgok/MfScvRgc4IdaET35jIxP3VJhMzP4Ptk9EDvwbqEb0KNUgzji24+wrHOvcOq
 LcMHOkycH2QLau7uAgko8VeaSboduEbeJyOvG2/Wbp4fL+s1lJY/BZ5UoHl+VBh0dV+o
 MrSFDdBf0jO9KzSnSPdK3TKY2Bbug3k5yO2FVToOxEHDeTGOFZqbltLHMh0vqiX+gRfF
 ncPwrWKLwjEPl8VK8dCYF3SWMD1F1xMmi0Qh0O+p+5vrLDe11Od4euLS2KlWHYo4S6OH
 ZhdEXkU+LqXwk5VtG15iPOQfic6/RVfmEHiKWzlOuFAWG9tvzCSTrDIdsxZrBKmdm6zZ
 Q6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fONCvjWB5gyniUuE4K1/PiO7ByikOkTCKe/7iMeRfs8=;
 b=UceeabI/vPFGUD/kF7bPJTbMBX6SgcNNMTkL7zDF9SH4Bx4u7comSzVVJX+21+/cHX
 DVj46BAUsF6ht57yzjZc4KCe99/vMOwV2Wn+RTrvJPrXTdo2yWGQEiyennnNHr8NTeTb
 LlINDTf2KE34LKRdvf9NEovIReFF3hcU960E6nlIuFr2H8bTPrD7oh533j+ASh0Dy9lg
 iJ7CR4pc7ekpkFubbLMyVLxzx9Z8YwkdFOC6XBbJxgYUwO2EwTN7/vZs+GHFS/IKi0AC
 2vh1gsDx15NvuRgTCO4kJ49mfk6Jj/2XOViaIxDkI9im+EMtpbe9sIGMneckaQ3Hvelk
 yxXA==
X-Gm-Message-State: APjAAAWEjvBwORx6MWEYBMwUZ2fibrvXZYCKg1jlH1W5G6vvGr1rZwiV
 R5eDIyiPtae1XxaY6ZT6qHesGfjXHSRz7iQtQJgd8g==
X-Google-Smtp-Source: APXvYqw/PgapwFNrPLj2WRbAASpsEW+17+usgL21JVkQ4jXAqdN0gmUlXT2ZVwkRIHgqT1btQEA1xpSxFeIAdjwDzkc=
X-Received: by 2002:a37:2e42:: with SMTP id u63mr8120608qkh.157.1569640084456; 
 Fri, 27 Sep 2019 20:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
In-Reply-To: <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 27 Sep 2019 20:07:53 -0700
Message-ID: <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6NDQgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDI2LjA5LjIwMTkgMDA6MzEsIFJvbWFuIFNoYXBvc2huaWsg
d3JvdGU6Cj4gPiBKYW4sIFJvZ2VyLCB0aGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIGluaXRpYWwg
aWRlYXMuIEkgdHJpZWQgYSBmZXcgb2YKPiA+IHRob3NlIGFuZCBoZXJlJ3Mgd2hlcmUgSSBhbS4K
PiA+Cj4gPiBGaXJzdCBvZiBhbGwsIGl0IGlzIGRlZmluaXRlbHkgcmVsYXRlZCB0byBDUFUgYnJp
bmcgdXAuIEFkZGluZwo+ID4gY3B1aWRsZT0wIHRvIHhlbiBjb21tYW5kIGxpbmUgbWFkZSBYZW4g
Ym9vdC4KPiA+Cj4gPiBUaGVuLCBhIGdvb2QgZnJpZW5kIG9mIG1pbmUgKHdobyB5b3UgbWF5IGtu
b3cgZnJvbSBhbmNpZW50IFhlbiBkYXlzCj4gPiA7LSkpIHN1Z2dlc3RlZCB0aGF0IHRoaXMgY291
bGQgYmUgcmVsYXRlZCB0byB0aGlzOgo+ID4gICAgICBodHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9YZW5fcG93ZXJfbWFuYWdlbWVudAo+ID4gc28gSSB3ZW50IHRvIHRoZSBCSU9TIHNl
dHRpbmdzIGFuZCBxdWl0ZSB0byBteSBzdXJwcmlzZSBhbGwgb2YgdGhlbQo+ID4gd2VyZSBncmF5
ZWQgb3V0IChub3QgdHdlYWthYmxlKS4KPiA+Cj4gPiBUaGUgb25seSBvbmUgdGhhdCB3YXNuJ3Qg
d2FzIDJ4QVBJQyBzdXBwb3J0LiBTbyBqdXN0IGZvciBraWNrcyAtLSBJCj4gPiBkaXNhYmxlZCB0
aGF0Lgo+ID4KPiA+IFRoYXQsIGluIHR1cm4sIG1hZGUgWGVuIGJvb3QgZXZlbiB3aXRob3V0IGNw
dWlkbGU9MC4gSSdtIGF0dGFjaGluZyB0aGF0IGxvZy4KPgo+IEludGVyZXN0aW5nLCBidXQgdW5m
b3J0dW5hdGVseSB0aGlzIHBhcnRpY3VsYXIgbG9nIGlzIG9mIG5vIHJlYWwgdXNlCj4gZm9yIGlu
dmVzdGlnYXRpb24gb2YgdGhlIGlzc3VlIChvdGhlciB0aGFuIGtub3dpbmcgdGhlIENQVSBtb2Rl
bCkuIEkKPiBhbHNvIG5vdGljZSBpdCdzIGEgNC4xMi4wIGxvZywgd2hlbiB5b3VyIG9yaWdpbmFs
IHJlcG9ydCB3YXMgYWdhaW5zdAo+IGxhdGVzdCBtYXN0ZXIuCj4KPiA+IFNvIEkgZ3Vlc3MgYXQg
dGhpcyBwb2ludCwgeW91IGNvdWxkIHNheSB0aGF0IEkgaGF2ZSBhIGZ1bmN0aW9uYWwKPiA+IHN5
c3RlbSwgYnV0IEknbSBjdXJpb3VzIHdoZXRoZXIgeW91IGd1eXMgd291bGQgYmUgaW50ZXJlc3Rl
ZCB0byBsb29rCj4gPiBpbnRvIDJ4QVBJQyBzaXR1YXRpb24uCj4KPiBPZiBjb3Vyc2Ugd2UgZG8u
IEFzIGEgbmV4dCBzdGVwIEknZCBzdWdnZXN0IHJldmVydGluZyB0aGUgQklPUyBzZXR0aW5ncwo+
IGNoYW5nZSB5b3UgZGlkLCBhbmQgaW5zdGVhZCB1c2luZyB0aGUgIngyYXBpYz0wIiBYZW4gY29t
bWFuZCBsaW5lIG9wdGlvbi4KCkludGVyZXN0aW5nbHkgZW5vdWdoLCB0aGlzIGRvZXNuJ3QgcmVh
bGx5IHNvbHZlIHRoZSBwcm9ibGVtIGNvbXBsZXRlbHkuClNwZWNpZnlpbmcgeDJhcGljPTAgY2Vy
dGFpbmx5IG1ha2VzIFhlbiBnbyBtdWNoIGZ1cnRoZXIgdG8gYSBwb2ludAp3aGVyZSBpdCB0cmll
cyB0byBsb2FkIERvbTAgYW5kIHRoZW4gdGhlIGNvbnNvbGUgVkdBIHNjcmVlbiBnb2VzCmJsYW5r
ICh0aGlzIGlzIHdoZXJlIHRoYXQgc2VyaWFsIGRlYnVnIG91dHB1dCB3b3VsZCBiZSB2ZXJ5IHVz
ZWZ1bCA6LSgpLgoKSSBzdXBwb3NlIEkgY2FuIGJ1eToKICAgICBodHRwczovL3d3dy5jZHcuY29t
L3Byb2R1Y3QvaHBlLWRsMjAtbWwzMC1nZW4xMC1tLjItZGVkaWNhdGVkLWlsby1hbmQtc2VyaWFs
LXBvcnQta2l0LzUzNDgwMjQKYnV0IHRoYXQnbGwgdGFrZSBzb21lIHRpbWUgdG8gYXJyaXZlLgoK
PiBBbmQgdGhlbiB3ZSBvZiBjb3Vyc2UgbmVlZCBhIGNvbXBsZXRlIGJvb3QgbG9nIChhcyByZXF1
ZXN0ZWQgZWFybGllcikgb2YKPiBhIHByb2JsZW0gY2FzZS4KPgo+IEZ1cnRoZXIgSSdkIHN1Z2dl
c3QgbW92aW5nIGF3YXkgZnJvbSB0aGUgYmxhY2stYW5kLXdoaXRlICJjcHVpZGxlPSIKPiBvcHRp
b24sIGFuZCBpbnN0ZWFkIGxpbWl0aW5nIHVzZSBvZiBkZWVwIEMgc3RhdGVzICgibWF4X2NzdGF0
ZT0iKS4gSQo+IHdvdWxkbid0IGJlIHN1cnByaXNlZCBpZiB0aGlzIHdhcyB0aGUgaXNzdWU7IHdl
J2QgdGhlbiBoYXZlIHRvIGZpcnN0Cj4gb2YgYWxsIGdvIHRocm91Z2ggZXJyYXRhIGZvciB0aGUg
cGFydCB5b3VyIHN5c3RlbSBpcyB1c2luZy4KCll1cC4gbWF4X2NzdGF0ZT0xIG1ha2VzIGl0IGJv
b3QgZmluZS4gbWF4X2NzdGF0ZT0yIHRob3VnaCBoYW5ncwp0aGUgc3lzdGVtICpleGFjdGx5KiBp
biB0aGUgc2FtZSB3YXkgYXMgc3BlY2lmeWluZyB4MmFwaWM9MAood2hpY2ggaXMgZGlmZmVyZW50
IGZyb20gdGhlIG9yaWdpbmFsIHByb2JsZW0gYXMgSSd2ZSBkZXNjcmliZWQgYWJvdmUpLgoKQ2Fu
IHlvdSBwbGVhc2UgZWxhYm9yYXRlIG9uICJ3ZSdkIHRoZW4gaGF2ZSB0byBmaXJzdCBvZiBhbGwg
Z28gdGhyb3VnaAplcnJhdGEgZm9yIHRoZSBwYXJ0IHlvdXIgc3lzdGVtIGlzIHVzaW5nIgoKVGhh
bmtzLApSb21hbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
