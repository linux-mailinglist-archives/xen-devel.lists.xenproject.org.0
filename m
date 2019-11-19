Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A1101A4D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 08:25:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWxqp-0003yx-Ax; Tue, 19 Nov 2019 07:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=byRa=ZL=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iWxqo-0003ys-Q4
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 07:23:02 +0000
X-Inumbo-ID: 6b122b1e-0a9d-11ea-b678-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b122b1e-0a9d-11ea-b678-bc764e2007e4;
 Tue, 19 Nov 2019 07:23:01 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y39so23564424qty.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 23:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gYGuTn0/svS3itaKAXa4+T/pwsbVsJ8fVR9olbB0tYE=;
 b=AAyNxGO4pNvAnpFeJ9IGFilbe96MD8ZSWixkSnU78njnLniaPCb8UmJkeFwmw+I18V
 I9aAQ3xoRD/vci1LNbAUyO/Pbo80zCWgBlLVB7kAOPoJW4oxV9JD/6gcCp93VCGUAkDt
 oQfS7TtS+OnCjVb+g7NbdTvkJkySI+hIHs3QV+ogvOxHZRvJTkiG0N0O07vEfh7PS1GL
 0X0vz7dDaa+XQLFN7/FqZeu5gZiZgIQQttplN/2KQh4Nu4Za2UJ5X1EITIR0qRl+My6L
 yHuqahSQoB8gr4j6md4LDABDXNY+Nyu0/Dl5fBOXiiBpB/pIQQAkC+5cidAt/cBN824G
 nQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gYGuTn0/svS3itaKAXa4+T/pwsbVsJ8fVR9olbB0tYE=;
 b=caICGYAXSwSTUwtLadOjGOrc9+H++pGdP07jFNTDXy1WIZWTp+UkowpHT1X2NvCC0a
 TTMJhAODg+3faqetGkRH2+AMAFY0Ilhu7ZJRQrwTxJJmUH8OfNMlJjCPNBzh/cVqEX0l
 4jnaE39dWwEJAg84RphW9dFN5a3SB9op8CVrhtd9rdQG/v7FF0WUbg8TTVDa0MHQQC9j
 UOuND6Emryh8CGa2yzPd8Q4xiWFz1sck4aZHx3crKo1dXcmTL+93qRqvVlVpp/C9oZ4a
 MK/Cv4slRflOA+qPzz2pM2HF7K9JSS2f5vViQop90I0io5l7S+fvZRDIvuLfJ1gtOh/T
 UWtg==
X-Gm-Message-State: APjAAAWqWn3z+cCxd0fb2pduaM5MIOWXUPeXIqQau3k7lt91vjC8Mqz1
 dugNVcZaQBtTBkcPIWJIS74EFRMwS2mm8BXoCKvHpQ==
X-Google-Smtp-Source: APXvYqysx4d2sKomlK0WFdJJ/S5YOj2RGx8wWcEXw9SEeWT7DbmuhAkvS+j9FgeeQXaCoppdH1kXUdrjc8DO/NL/WJU=
X-Received: by 2002:ac8:3358:: with SMTP id u24mr31174960qta.63.1574148180726; 
 Mon, 18 Nov 2019 23:23:00 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8qFCEssF6vdTTAgxpijGns4QFgKQpT6Kvj9AorQ5mSZQ@mail.gmail.com>
 <365fbdb1-955a-37dc-eb45-83d2ebed3c3c@suse.com>
In-Reply-To: <365fbdb1-955a-37dc-eb45-83d2ebed3c3c@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 18 Nov 2019 23:22:49 -0800
Message-ID: <CAMmSBy_XYUSE+tvyJuRCnROjwNuHoh-jNnM2vrstvDzKT4+2sQ@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] [TESTDAY] Test report
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

T24gU3VuLCBOb3YgMTcsIDIwMTkgYXQgMTA6MTUgUE0gSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDE2LjExLjE5IDAyOjEyLCBSb21hbiBTaGFwb3NobmlrIHdy
b3RlOgo+ID4gTk9URTogdGhpcyBtYXkgb3IgbWF5IG5vdCBiZSBhIGhhaXIgb24gZmlyZSBwcm9i
bGVtLCByZXBvcnRpbmcgaXQKPiA+IGFueXdheSBzaW5jZSBJJ2QgaGF0ZSB0byBwYXNzIG9uIHNv
bWV0aGluZyB0aGF0IG1heWJlIGEgc2VyaW91cyBpc3N1ZS4KPiA+IEkgaGF2ZW4ndCBoYWQgdGlt
ZSB0byBkZWJ1ZyB0aGlzIGp1c3QgeWV0IC0tIHNvIGp1c3QgcmVwb3J0aW5nIGl0IGhlcmUKPiA+
IHByZXR0eSByYXcuCj4gPgo+ID4gU29mdHdhcmU6Cj4gPiAgICAgWGVuIDQuMTMgUkMyCj4gPiAg
ICAgTGludXgga2VybmVsIDQuMTkuNQo+ID4gSGFyZHdhcmU6Cj4gPiAgICAgU3VwZXJtaWNybyBF
MzAwCj4gPiAgICAgICAgIGh0dHBzOi8vd3d3LnN1cGVybWljcm8uY29tL2VuL3Byb2R1Y3RzL3N5
c3RlbS9NaW5pLUlUWC9TWVMtRTMwMC04RC5jZm0KPiA+ICAgICBTdXBlcm1pY3JvIEUxMDAKPiA+
ICAgICAgICAgaHR0cHM6Ly93d3cuc3VwZXJtaWNyby5jb20vZW4vcHJvZHVjdHMvc3lzdGVtL0Jv
eF9QQy9TWVMtRTEwMC05Uy5jZm0KPiA+ICAgICBTdXBlcm1pY3JvIEU1MAo+ID4gICAgICAgICBo
dHRwczovL3d3dy5zdXBlcm1pY3JvLmNvbS9lbi9wcm9kdWN0cy9zeXN0ZW0vQm94X1BDL1NZUy1F
NTAtOUFQLmNmbQo+ID4KPiA+IEZ1bmN0aW9uYWxpdHkgdGVzdGVkOiB0cnlpbmcgdG8gYm9vdCBE
b20wCj4gPiBDb21tZW50czogWGVuIGJvb3RzIGNvbXBsZXRlbHkgYW5kIHRoZW4gc2VlbXMgbGlr
ZSBpdCBlaXRoZXIgZGllcwo+ID4gcmlnaHQgYWZ0ZXIgc2F5aW5nCj4gPiAgICAgIFhlbiByZWxp
bnF1aXNoaW5nIGEgY29uc29sZQo+ID4gb3IgRG9tMCBkaWVzICh3aXRob3V0IHByaW50aW5nIGEg
c2luZ2xlIGxpbmUgb2Ygb3V0cHV0KQo+ID4KPiA+IEZXSVcsIHRoaXMgc3RhcnRlZCBoYXBwZW5p
bmcgYWZ0ZXIgdXBncmFkZSB0byBSQzIuIElPVywgaWYgSSB0YWtlIG15Cj4gPiBwcmV2aW91cyBS
QzEgYmluYXJ5IGFuZCBzdGljayBpdCBpbnRvIHRoZSB2ZXJ5IHNhbWUgc2V0dXAgLS0KPiA+IGV2
ZXJ5dGhpbmcgYm9vdHMgZmluZS4KPiA+Cj4gPiBUaGUgaXNzdWUgZG9lc24ndCBzZWVtIHRvIGJl
IHJlcHJvZHVjaWJsZSBvbiBEZWxsIGJveGVzIChhbmQgaW4gbXkKPiA+IHZpcnR1YWwgUUVtdSBz
ZXR1cCkgdGhhdCBJJ3ZlIGdvdC4KPgo+IENhbiB5b3UgcGxlYXNlIGFkZCB0aGUgZm9sbG93aW5n
IHRvIGRvbTAncyBib290IHBhcmFtZXRlcnM6Cj4KPiBjb25zb2xlPWh2YzAgZWFybHlwcmludGs9
eGVuCj4KPiBhbmQgc2VuZCB0aGUgWGVuIGJvb3QgbG9nIChvYnRhaW5lZCB2aWEgc2VyaWFsIGxp
bmUpPwoKV2lsbCBkbyBvbmNlIEkgZ2V0IHRvIHRoZSBsYWIgKHRyYXZlbGluZyBmb3IgS3ViZUNP
TiBmb3IgdGhlIG5leHQKY291cGxlIG9mIGRheXMpLgoKVGhhdCBzYWlkLCBpZiB5b3Ugc2VlIHRo
ZSBvdGhlciB0aHJlYWQgLS0gd2UndmUgZmlndXJlZCBvdXQgdGhhdCB0aGUKY3VscHJpdCB3YXMg
ZWZpPW5vLXJzCnRoYXQgcmVncmVzc2VkIGluIGZ1bmN0aW9uYWxpdHkgYmV0d2VlbiBSQzEgYW5k
IFJDMi4gTWFyZWsgaGFzIHN1Z2dlc3RlZCBhIHBhdGNoCnRoYXQgSSBuZWVkIHRvIHRlc3QuCgpO
b3csIGlmIEkgZHJvcCBlZmk9bm8tcnMgLS0gSSBjYW4gYm9vdCBhbGwgdGhlIGhhcmR3YXJlIG1l
bnRpb25lZCBpbgoqdGhpcyogcmVwb3J0Cmp1c3QgZmluZS4KCkEgbXVjaCBiaWdnZXIgcHJvYmxl
bSBpcyB0aGF0IHRoZSBmb2xsb3dpbmcgZW50aXJlIHByb2R1Y3QgbGluZSBpcyBub3cKYnVzdGVk
IHdpdGggWGVuIDQuMTMgUkMyOgogICAgIGh0dHBzOi8vd3d3LmRlbGwuY29tL2VuLXVzL3dvcmsv
c2hvcC9nYXRld2F5cy1lbWJlZGRlZC1jb21wdXRpbmcvc2MvZ2F0ZXdheXMtZW1iZWRkZWQtcGNz
L2VkZ2UtZ2F0ZXdheT9+Y2s9YnQKCk9uIGFsbCB0aGVzZSBib3hlczoKICAgLSBXaXRob3V0IGVm
aT1uby1ycyBvcHRpb24gWGVuIHBhbmljcyBvbiBib290CiAgIC0gV2l0aCBlZmk9bm8tcnMgWGVu
IGJvb3RzIGZpbmUsIGJ1dCBEb20wIGNhbid0IGNvbWUgdXAKClRoYW5rcywKUm9tYW4uCgpQLlMu
IEFuIGFkZGl0aW9uYWwgY29tcGxpY2F0aW9uIHdpdGggdGhlc2UgRGVsbCBib3hlcyBpcyB0aGF0
IGl0CnJlcXVpcmVkIHJlYXNvbmFibHkgbWFqb3IgYnJhaW4gc3VyZ2VyeSB3aXRoIHNvbGRlcmlu
ZyBpcm9uIHRvIHJpZwpjb25zb2xlIG91dHB1dCBvbiB0aGVtLiBJIGRpZCBpdCBmb3Igb25lIGJv
eCBpbiBteSBsYWIgYnV0IEkgbmVlZApwaHlzaWNhbCBhY2Nlc3MgdG8gaXQgYW5kIEknbSBjdXJy
ZW50bHkgdHJhdmVsaW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
