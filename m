Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7051135A48
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 14:37:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipXv0-00022F-GE; Thu, 09 Jan 2020 13:32:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuxF=26=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipXuz-00022A-5Y
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 13:32:09 +0000
X-Inumbo-ID: 69808dc6-32e4-11ea-ac27-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69808dc6-32e4-11ea-ac27-bc764e2007e4;
 Thu, 09 Jan 2020 13:31:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578576719; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=2TAio9vsZZRBn917kcuBAtJHEKgYEH3ThNMOgh4pDnA=;
 b=uyqVBd3urLXAaP2bQh+ExcDNGJl6JScpVQBQUocdL8xQyClrJdm+lCDWwe8a9oNx+MDNAUe0
 ZsuHxjpOZaMaeybr24pJxuYX55Em3uaZ3mvT73GoDViKQEVJIx4E/MBW26krdqs/US5mk7UJ
 MAGYEgzCWYDd170Tkg0SW+pl4sY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5e172b4e.7fc94d7cd7b0-smtp-out-n02;
 Thu, 09 Jan 2020 13:31:58 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p17so2857462wma.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 05:31:57 -0800 (PST)
X-Gm-Message-State: APjAAAUlLuTJEVOQcMukBUgEOMkuVQoq6FceCIL1oZjGhVISMPFnmoEl
 kgs/pU4AXzFpXVGptFfb5LB5W7cwCeQ5mqbTcqE=
X-Google-Smtp-Source: APXvYqyTfwBzaerAreNKWv8Ghb9TIdQctTyECn6an0nSpbTYHjMAcQ0LO7VXqVEB23Ybnxbygg5bAkfH3LLH+ufSJUI=
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr5253075wmi.15.1578576716245; 
 Thu, 09 Jan 2020 05:31:56 -0800 (PST)
MIME-Version: 1.0
References: <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
 <20200108150841.GR11756@Air-de-Roger>
 <CABfawhnWYn_MwaQzdAQ4QezA0vgQ7ByK44eUEerGRP7AU9si+A@mail.gmail.com>
 <20200108180042.GT11756@Air-de-Roger>
 <CABfawhm==Gpca8+E=PihvW3x7Y79kAKD48rk5PHHbbhdATh4-w@mail.gmail.com>
 <20200108183649.GW11756@Air-de-Roger>
 <CABfawh=AK+HAgLqByo_Xgr_Ev53+cEo3tiMuPn4SYL7R1i8P-Q@mail.gmail.com>
 <20200109094751.GY11756@Air-de-Roger>
In-Reply-To: <20200109094751.GY11756@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Jan 2020 06:31:19 -0700
X-Gmail-Original-Message-ID: <CABfawhkJ54+RrQZVbAoV2Ki4HG=Q3fESyvR6FnwPmgT7LYY3mg@mail.gmail.com>
Message-ID: <CABfawhkJ54+RrQZVbAoV2Ki4HG=Q3fESyvR6FnwPmgT7LYY3mg@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gOSwgMjAyMCBhdCAyOjQ4IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSmFuIDA4LCAyMDIwIGF0IDEyOjUxOjM1
UE0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIFdlZCwgSmFuIDgsIDIwMjAg
YXQgMTE6MzcgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBXZWQsIEphbiAwOCwgMjAyMCBhdCAxMToxNDo0NkFNIC0wNzAwLCBU
YW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBKYW4gOCwgMjAyMCBhdCAxMTow
MSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gT24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDg6MzI6MjJBTSAtMDcwMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBXZWQsIEphbiA4LCAyMDIwIGF0
IDg6MDggQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
ID4gPiA+ID4gPiA+IEkgdGhpbmsgeW91IGFsc28gbmVlZCBzb21ldGhpbmcgbGlrZToKPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ICMgeGwgZm9yay12bSAtLWxhdW5jaC1kbSBsYXRlIDxwYXJl
bnRfZG9taWQ+IDxmb3JrX2RvbWlkPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU28gdGhh
dCBhIHVzZXIgZG9lc24ndCBuZWVkIHRvIHBhc3MgYSBxZW11LXNhdmUtZmlsZT8KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gVGhpcyBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byBtZS4gVG8gbGF1
bmNoIFFFTVUgeW91IG5lZWQgdGhlIGNvbmZpZwo+ID4gPiA+ID4gPiBmaWxlIHRvIHdpcmUgdGhp
bmdzIHVwIGNvcnJlY3RseS4gTGlrZSBpbiBvcmRlciB0byBsYXVuY2ggUUVNVSB5b3UKPiA+ID4g
PiA+ID4gbmVlZCB0byB0ZWxsIGl0IHRoZSBuYW1lIG9mIHRoZSBWTSwgZGlzayBwYXRoLCBldGMu
IHRoYXQgYXJlIGFsbAo+ID4gPiA+ID4gPiBjb250YWluZWQgaW4gdGhlIGNvbmZpZy4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBZb3UgY291bGQgZ2V0IGFsbCB0aGlzIGluZm9ybWF0aW9uIGZyb20gdGhl
IHBhcmVudCBWTSwgSUlSQyBsaWJ4bCBoYXMKPiA+ID4gPiA+IGEganNvbiB2ZXJzaW9uIG9mIHRo
ZSBjb25maWcuIEZvciBleGFtcGxlIGZvciBtaWdyYXRpb24gdGhlcmUncyBubwo+ID4gPiA+ID4g
bmVlZCB0byBwYXNzIGFueSBjb25maWcgZmlsZSwgc2luY2UgdGhlIGluY29taW5nIFZNIGNhbiBi
ZSByZWNyZWF0ZWQKPiA+ID4gPiA+IGZyb20gdGhlIGRhdGEgaW4gdGhlIHNvdXJjZSBWTS4KPiA+
ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBCdXQgYWdhaW4sIGNyZWF0aW5nIGEgZm9yayB3aXRoIHRo
ZSBleGFjdCBjb25maWcgb2YgdGhlIHBhcmVudCBpcyBub3QKPiA+ID4gPiBwb3NzaWJsZS4gRXZl
biBpZiB0aGUgdG9vbCB3b3VsZCByZW5hbWUgdGhlIGZvcmsgb24tdGhlLWZseSBhcyBpdCBkb2Vz
Cj4gPiA+ID4gZHVyaW5nIHRoZSBtaWdyYXRpb24sIHRoZSBmb3JrIHdvdWxkIGVuZCB1cCB0aHJh
c2hpbmcgdGhlIHBhcmVudCBWTSdzCj4gPiA+ID4gZGlzayBhbmQgbWFraW5nIGl0IGltcG9zc2li
bGUgdG8gY3JlYXRlIGFueSBhZGRpdGlvbmFsIGZvcmtzLiBJdCB3b3VsZAo+ID4gPiA+IGFsc28g
bWVhbiB0aGF0IGF0IG5vIHBvaW50IGNhbiB0aGUgb3JpZ2luYWwgVk0gYmUgdW5wYXVzZWQgYWZ0
ZXIgdGhlCj4gPiA+ID4gZm9ya3MgYXJlIGdvbmUuIEkgZG9uJ3Qgc2VlIGFueSB1c2VjYXNlIGlu
IHdoaWNoIHRoYXQgd291bGQgbWFrZSBhbnkKPiA+ID4gPiBzZW5zZSBhdCBhbGwuCj4gPiA+Cj4g
PiA+IFlvdSBjb3VsZCBoYXZlIHRoZSBkaXNrKHMpIGFzIHJlYWQtb25seSBhbmQgdGhlIFZNIHJ1
bm5pbmcgY29tcGxldGVseQo+ID4gPiBmcm9tIFJBTS4gQWxwaW5lLWxpbnV4IGhhcyAob3IgaGFk
KSBhIG1vZGUgd2hlcmUgaXQgd2FzIGNvbXBsZXRlbHkKPiA+ID4gc3RhdGVsZXNzIGFuZCBydW5u
aW5nIGZyb20gUkFNLiBJIHRoaW5rIGl0J3MgZmluZSB0byByZXF1aXJlIHBhc3NpbmcgYQo+ID4g
PiBjb25maWcgZmlsZSBmb3IgdGhlIHRpbWUgYmVpbmcsIHdlIGNhbiBsb29rIGF0IG90aGVyIG9w
dGlvbnMKPiA+ID4gYWZ0ZXJ3YXJkcy4KPiA+ID4KPiA+Cj4gPiBPSywgdGhlcmUgaXMgdGhhdC4g
QnV0IEkgd291bGQgc2F5IHRoYXQncyBhIGZhaXJseSBuaWNoZSB1c2UtY2FzZS4gWW91Cj4gPiB3
b3VsZG4ndCBoYXZlIGFueSBuZXR3b3JrIGFjY2VzcyBpbiB0aGF0IGZvcmssIG5vIGRpc2ssIG5v
IHdheSB0byBnZXQKPiA+IGluZm9ybWF0aW9uIGluIG9yIG91dCBiZXNpZGUgdGhlIHNlcmlhbCBj
b25zb2xlLgo+Cj4gV2h5IHdvbid0IHRoZSBmb3JrIGhhdmUgbmV0d29yayBhY2Nlc3M/CgpJZiB5
b3UgaGF2ZSBtdWx0aXBsZSBmb3JrcyB5b3UgZW5kIHVwIGhhdmluZyBNQUMtYWRkcmVzcyBjb2xs
aXNpb24uIEkKZG9uJ3Qgc2VlIHdoYXQgd291bGQgYmUgdGhlIHBvaW50IG9mIGNyZWF0aW5nIGEg
c2luZ2xlIGZvcmsgd2hlbiB0aGUKcGFyZW50IHJlbWFpbnMgcGF1c2VkIC0geW91IGNvdWxkIGp1
c3Qga2VlcCBydW5uaW5nIHRoZSBwYXJlbnQgc2luY2UKeW91IGFyZW4ndCBnYWluaW5nIGFueXRo
aW5nIGJ5IGNyZWF0aW5nIHRoZSBmb3JrLiBUaGUgbWFpbiByZWFzb24gdG8KY3JlYXRlIGEgZm9y
ayB3b3VsZCBiZSB0byBjcmVhdGUgbXVsdGlwbGVzIG9mIHRoZW0uCgo+Cj4gSWYgdGhlIHBhcmVu
dCBWTSBpcyBsZWZ0IHBhdXNlZCB0aGUgZm9yayBzaG91bGQgYmVoYXZlIGxpa2UgYSBsb2NhbAo+
IG1pZ3JhdGlvbiByZWdhcmRpbmcgbmV0d29yayBhY2Nlc3MsIGFuZCB0aHVzIGJlIGZ1bGx5IGZ1
bmN0aW9uYWwuCj4KPiA+IFNvIEkgd291bGRuJ3Qgd2FudAo+ID4gdGhhdCBzZXR1cCB0byBiZSBj
b25zaWRlcmVkIHRoZSBkZWZhdWx0LiBJZiBzb21lb25lIHdhbnRzIHRvIHRoYXQgSQo+ID4gd291
bGQgcmF0aGVyIGhhdmUgYW4gb3B0aW9uIHRoYXQgdGVsbHMgeGwgdG8gYXV0b21hdGljYWxseSBu
YW1lIHRoZQo+ID4gZm9yayBmb3IgeW91IGluc3RlYWQgb2YgdGhlIG90aGVyIHdheSBhcm91bmQu
Cj4KPiBBY2ssIEkganVzdCB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHdoYXRldmVyIGludGVyZmFj
ZSB3ZSBlbmQgdXAgdXNpbmcKPiBpcyBkZXNpZ25lZCB0YWtpbmcgaW50byBhY2NvdW50IG90aGVy
IHVzZSBjYXNlcyBhcGFydCBmcm9tIHRoZSBvbmUgYXQKPiBoYW5kLgo+Cj4gT24gYW4gdW5yZWxh
dGVkIG5vdGUsIGRvZXMgZm9ya2luZyB3b3JrIHdoZW4gdXNpbmcgUFYgaW50ZXJmYWNlcz8KCkFz
IEkgcmVjYWxsIHllcywgYnV0IEluIG15IExpbnV4IHRlc3RzIHRoZXNlIHdlcmUgdGhlIGNvbmZp
ZyBvcHRpb25zIEkKdGVzdGVkIGFuZCB3b3JrIHdpdGggdGhlIGZvcmsuIE5vdCBzdXJlIGlmIHRo
ZSB2aWYgZGV2aWNlIGJ5IGRlZmF1bHQKaXMgUFYgb3IgZW11bGF0ZWQ6Cgp2bmM9MQp2bmNsaXN0
ZW49IjAuMC4wLjA6MSIKCnVzYj0xCnVzYmRldmljZT1bJ3RhYmxldCddCgpkaXNrID0gWydwaHk6
L2Rldi90MHZnL2RlYmlhbi1zdHJldGNoLHh2ZGEsdyddCnZpZiA9IFsnYnJpZGdlPXhlbmJyMCxt
YWM9MDA6MDc6NUI6QkI6MDA6MDEnXQoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
