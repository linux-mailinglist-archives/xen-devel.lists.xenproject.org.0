Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7875C8E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 03:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqp5R-0008WL-Gf; Fri, 26 Jul 2019 01:31:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RaF+=VX=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hqp5Q-0008WG-Cm
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 01:31:56 +0000
X-Inumbo-ID: 267b5207-af45-11e9-8980-bc764e045a96
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 267b5207-af45-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 01:31:54 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so51016020qtn.13
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2019 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EzavtEDn64JL6mfHsDYYNkrzttgDS8jY0cTtcHHJdSY=;
 b=kbUeKSQz/16iZiEwEb4gR/alTx3qvwDMJeVet1di6edLNprBGbVnvOb4lU1dtlLiel
 8jXfKa/X35iYr6HjT/1T6slP9pxtemb0kKXhQi74WQxcGxzBZiyAn0xVfe0QJXlA1YtN
 cHrW0V9eX7512Dtr9PEcAIWS5AUMkhOtDrwjW6mhInLSNz4+hihx7pe3Xed4EOt+jrEu
 lxjGKfrpr70L2eePB+RSpGOJc3Mm74doSf/rRE2HlLHPUfBEmqAi5RTUAOPaYxiAA5+d
 Ob/uwT227HPzejy8klSiJ98zV3jyXt5XPWDThaGTwnZoM/Ay5AQX6JVu6o1iNIdY6KEv
 egKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EzavtEDn64JL6mfHsDYYNkrzttgDS8jY0cTtcHHJdSY=;
 b=ZUHv0a9VmRwZPolRruoMmSpsT8rrQPvTDYSZIbxUXhkd6nhpKreTpT7TYXGfrV0KXS
 t+1VOdjBe+kmEOU/IM2Kqa+VGqeckFU8PWy/qIxr3ZDACVuHCk0ZDIO1t0jIBPiAA+Hv
 ACRYlsG+YeMFuVeqOqtpjF/0ou0OLwWZSSpeybV3Ye8a+TdBeyIyZ/uiUtZPMIuIOYEC
 xgBI86ao1ZuEkri2yTEx3GH8kBA42Kth5NR7xAg+xBZEdOpiyipfHZTecnj9G3Oxxlh7
 P+1CDnbcwbEgy4F18rO1Pv68RWxlirj9/KqCztodbbcqv6bdjhDYjQt51ZWDgyu3Nl07
 elmQ==
X-Gm-Message-State: APjAAAXYYeBjONkrBwTm4fZngVVUzYNnq5xbzYMg2ihvNN1eUV29MppI
 z327QGU/Hp0xVfQGLDWByBzu71zWjCK3y32tThOxdw==
X-Google-Smtp-Source: APXvYqzTmLh8zZLH6+PVpYd2w6FmEpuL1DDJTDy23JmNZ3WaElrVQgX7vFqp/lxrCk8eIW4pbbCYla0IYN6gYDXNHOo=
X-Received: by 2002:a0c:af33:: with SMTP id i48mr66203443qvc.185.1564104714135; 
 Thu, 25 Jul 2019 18:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <MA1PR01MB3851BEA4FBF03BB603B1A971E8F20@MA1PR01MB3851.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB3851A10D5DE69A99DDB292A0E8C70@MA1PR01MB3851.INDPRD01.PROD.OUTLOOK.COM>
 <CAMmSBy-uMGqa3SDwhmoutmorsg+KUi8ddr-9r2wRMEyZcpCRGw@mail.gmail.com>
 <761fb7e2-2096-f2f6-3693-8f2b5c18fb0b@arm.com>
In-Reply-To: <761fb7e2-2096-f2f6-3693-8f2b5c18fb0b@arm.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 25 Jul 2019 18:31:43 -0700
Message-ID: <CAMmSBy8HEP9hAdZF3+vLPyJE608T2nCn4Gn284xWBCS_VYhEhw@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] Xen Hypervisor porting on Raspberry Pi 3B+/4
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "xenprojecthelp@linuxfoundation.org" <xenprojecthelp@linuxfoundation.org>,
 Sushant Bhangale <Sushant.Bhangale@ltts.com>,
 Nikhil Wadke <Nikhil.Wadke@ltts.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Pranav Paralikar <Pranav.Paralikar@ltts.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgNDowNyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjMvMDcvMjAxOSAxODo1NSwgUm9tYW4g
U2hhcG9zaG5payB3cm90ZToKPiA+IEl0IHdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgWGVuIHJ1bm5p
bmcgb24gUlBpLCBidXQgSSBoYXZlIHRvIHdvbmRlcjogaXMKPiA+IGl0IG5vdyBwb3NzaWJsZSB0
byB3b3JrYXJvdW5kIFJQaSBsaW1pdGF0aW9ucyBvZiBob3cgR1BVIGJvb3RzPwo+ID4gICAgIGh0
dHBzOi8vd3d3LnJhc3BiZXJyeXBpLm9yZy9mb3J1bXMvdmlld3RvcGljLnBocD90PTE4NzA4NiNw
MTIwNjQ4Nwo+ID4KPiA+IEkgdGhvdWdodCB0aGF0IHRoaXMgaXMgY29tcGxldGVseSBsb2NrZWQs
IHByb3ByaWV0YXJ5IGJjbTI4MzcgY29kZQo+ID4gdGhhdCBYZW4gY2FuJ3QgZG8gbXVjaCBvZiBh
bnl0aGluZyBhYm91dC4KPgo+IFRoYXQncyBub3QgcmVhbGx5IGEgcHJvYmxlbS4gUGVvcGxlIGhh
dmUgbWFuYWdlZCB0byBnZXQgb3RoZXIgaHlwZXJ2aXNvciBydW5uaW5nCj4gb24gUlBJLiBUaGUg
bWFqb3IgaXNzdWUgaXMgZ29pbmcgdG8gYmUgdGhlIGludGVycnVwdCBjb250cm9sbGVyLCB0aGUg
UlBJMyBkb2VzCj4gbm90IGhhdmUgYSBHSUMgd2hpY2ggaXMgYSByZXF1aXJlbWVudCBmb3IgdXNp
bmcgWGVuLgo+Cj4gSWYgeW91IHdhbnQgdG8gZ2V0IFhlbiB3b3JraW5nIG9uIFJQSTMsIHRoZW4g
eW91IHdvdWxkIGF0IGxlYXN0IG5lZWQgdG8gcHJvdmlkZQo+IGRyaXZlciBmb3IgdGhlIGludGVy
cnVwdCBjb250cm9sbGVyIGFuZCBlbXVsYXRlIGl0IGZvciB0aGUgZ3Vlc3RzLiBBbHRlcm5hdGl2
ZWx5Cj4geW91IGNvdWxkIHByb3ZpZGUgYSBQViBpbnRlcmZhY2UgYXMgeDg2IHVzZSB0byBkby4g
Qm90aCBjYXNlcyBhcmUgZ29pbmcgdG8KPiByZXF1aXJlIGEgZmFpciBhbW91bnQgb2Ygd29yayBh
bmQgdmVyeSB1bmxpa2VseSB0byBiZSBhY2NlcHRlZCB1cHN0cmVhbS4gSSB3b3VsZAo+IGxpa2Ug
dG8ga2VlcCBYZW4gc21hbGwgYW5kIHNpbXBsZS4KPgo+IEFueXdheSwgUmFzYmVycnkgUEkgZm91
bmRhdGlvbiBqdXN0IHJlbGVhc2UgUlBJNCB3aGljaCBub3cgY29udGFpbiBhIEdJQy4gU28KPiB0
aGlzIHNob3VsZCBtYWtlIGVhc2llciB0byBnZXQgWGVuIHdvcmtpbmcgb24gdGhlIHBsYXRmb3Jt
Lgo+Cj4gQW5kcmUgKGluIENDKSBoYXMgYmVlbiB3b3JraW5nIG9uIHBvcnRpbmcgQXJtIFRydXN0
ZWQgRmlybXdhcmUgdG8gdGhlIFJQSTQgYW5kCj4gbWFuYWdlIHRvIGdldCBYZW4gYm9vdGluZyB1
cCB0byB0aGUgc3RhZ2Ugb2YgYnJpbmdpbmctdXAgc2Vjb25kYXJ5IENQVXMgKHNlZSBbMV0uCj4K
PiBJIGFsc28gYm91Z2h0IGEgUlBJNCBzbyBJIHdpbGwgaGF2ZSBhIGdvIGF0IFhlbiB3aGVuIEkg
aGF2ZSBzb21lIHNwYXJlIHRpbWUuCj4KPiBDaGVlcnMsCj4KPiBbMV0gaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi11c2Vycy8yMDE5LTA3L21zZzAwMDMyLmh0
bWwKClRoaXMgaXMgdmVyeSBleGNpdGluZyEgVGhhbmtzIGZvciBzaGFyaW5nLgoKU3RlZmFubywg
aXMgdGhpcyBzb21ldGhpbmcgb24geW91ciByYWRhcj8KClRoYW5rcywKUm9tYW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
