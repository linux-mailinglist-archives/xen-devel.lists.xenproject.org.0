Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7EBCC2E5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 20:48:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGSa6-00066R-Ci; Fri, 04 Oct 2019 18:45:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b/Xi=X5=gmail.com=katereenart@srs-us1.protection.inumbo.net>)
 id 1iGSa5-00066M-7A
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 18:45:33 +0000
X-Inumbo-ID: 24733d18-e6d7-11e9-80e3-bc764e2007e4
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24733d18-e6d7-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 18:45:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u3so5146221lfl.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2019 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=UAzPROSEn/XuY6xoNSf0MEcM/1FohGNqyCYaTXjKJ8Q=;
 b=ZzgAxW3ABiOftLjEr0WcvVDoULfz0+HcPIs2+MsdczAlpYWZELtWHb7Zlii9e5SwtC
 BEuVYtO0bkXxc/MadHgtnpIb6xkTIG2/SoCROyaKVSLMksxSLDEXqFMqGPkvNAX32aIN
 Ceo43Ju25jV7aOqydtWpzpCf7TC31LHqbwdbcgrNMURM6+9Y/l3Oma7tfV9J6FioBf/m
 aY6HLJUicfcudHt0thLN3Nar0oyy5AzbBGXiYiERadOeN/Zt0pNEyYZK+RK5nb9ArfhW
 ln8a65SZaiH5vwMj3j3FIQW4NGInO4e1yDJo+c4REO8dy7tbh1kWkSWv3wTk+db5YAY7
 7GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=UAzPROSEn/XuY6xoNSf0MEcM/1FohGNqyCYaTXjKJ8Q=;
 b=TWrGcyGVO2E4n7LmLhiKOurcue8iokiRrmdK9i2ZZ1kOGXR8NVv6xmt95pa+0RaKLH
 AEs1IwioCXyHlUn4EwGEupb7pKeZmJg4fShD0s8ZR9IKqsNeNpFYM4QojwHC7f67bnvP
 fYuyTHavS75VkEpqvvCryrVP768Z9bxzzmMu/FriZBdMm7jcccK8CpPuH0pWC2NkVwyz
 WTsOpJ85UBtZibSQ9CGFP8cYfHBrV92FlDWNaklsBJeiJQxh55nW6y1OjrOUL8gr1kLp
 rEzgLYSzP8kiCxoLf+wSr2hm1mN2h745XXYXTD5hRk5SLVe7Wn0SDEirNlPlxTLGyFcH
 8cuA==
X-Gm-Message-State: APjAAAVUmoQ7/7qPPLUCWek7Fc+wigfWqquz4aICG0TEkCkW19jKX+EJ
 Jvt0+0LJ50PR1zTSqP1LVGh6XJ+o3R+p1ZjxGjk1+w==
X-Google-Smtp-Source: APXvYqzdAsquiFn41CBXo8089XvOby3O1NbXoepvaQE97DEhR7tovD02KrTSjkZA9oQImcWgEy/iui7fZTHt7naBrHk=
X-Received: by 2002:ac2:5196:: with SMTP id u22mr9970961lfi.130.1570214731105; 
 Fri, 04 Oct 2019 11:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFjkr2qCb7ZoOAx2A_oFE1znjpia=2Auk+XePybfWbk8jB-9Nw@mail.gmail.com>
 <CAFjkr2qskyxgtoZzToNXWAZPnN=5fbEiWpZO3P+Lq=1PiiEZPg@mail.gmail.com>
 <20191002103340.vxqzkwcptpw7lhol@debian>
 <CAFjkr2rK6vi4CmqyT+2ce3LFRz0FNngproCeOGROnO5rSWp8uA@mail.gmail.com>
 <20191003141913.ixezqr2lzinautw7@debian>
In-Reply-To: <20191003141913.ixezqr2lzinautw7@debian>
From: Kateryna Razumova <katereenart@gmail.com>
Date: Fri, 4 Oct 2019 20:45:20 +0200
Message-ID: <CAFjkr2ok+Q=0hJM3XyoF8Dq6d2xp0ewBANWLq0JTUCq=wcPRAw@mail.gmail.com>
To: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] I want to participate in Outreachy with CONFIG_PDX
 related project
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmsgeW91IFdlaSwKCkkganVzdCBkaWRuJ3QgcmVhbGl6ZSB0aGF0LiBJIHRob3VnaHQgdGhh
dCBhbiBhcHBsaWNhbnQgc2hvdWxkIGtub3cgd2hhdApidWdzIGFscmVhZHkgZXhpc3RlZCBhbmQg
dHJpZWQgdG8gZml4IHRoZW0uIEkgd2FzIHRyeWluZyB0byBmaW5kIHNvbWUKb24gdGhlIGdpdGh1
YiBwYWdlIGJ1dCBoYXZlbid0IHN1Y2NlZWRlZC4KQnV0IG5vdyBJIGNhbiB0cnkgdG8gZG8gbXkg
YmVzdC4gQXQgbGVhc3QsIEkgd2lsbCB0cnkgdG8gaGVscCB3aXRoIHR5cG8KZXh0ZXJtaW5hdGlv
bi4KCgoKT24gVGh1LCAzIE9jdCAyMDE5IGF0IDE2OjE5LCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3
cm90ZToKPgo+IE9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA2OjE5OjQ0UE0gKzAyMDAsIEthdGVy
eW5hIFJhenVtb3ZhIHdyb3RlOgo+ID4gRGVhciBMaXUsCj4gPgo+ID4gb2gsIEkgdGhvdWdodCB0
aGF0IHhlbiBwYXJ0aWNpcGF0ZXMgaW4gT3V0cmVhY2h5IGluIG9yZGVyIHRvIGdldCBuZXcKPiA+
IGNvbnRyaWJ1dG9ycyB2aWEgZWFzaW5nIHRoZSBlbnRyYW5jZSBwcm9jZXNzLgo+ID4gQnV0IGl0
IHNlZW1zIHRoYXQgYSBwb3RlbnRpYWwgY29udHJpYnV0b3IgdG8geGVuIHNob3VsZCBhbHJlYWR5
IGhhdmUgc29tZQo+ID4ga25vd2xlZGdlIG9mIHhlbiAoZm9yIGV4YW1wbGUsIGhvdyB0byBmaW5k
IGEgYnVnLCBzaW5jZSB0aGVyZSBhcmUgbm8gaXNzdWVzCj4gPiBvbiBnaXRodWIgYW5kIG5vIHZp
c2libGUgbGluayB0byBidWd6aWxsYSkuIEkgZGlkbid0IGtub3cgdGhhdCEKPiA+IEkgYW0gcmVh
bGx5IHNvcnJ5IGZvciB0aGlzIGluY29udmVuaWVuY2UhISEKPgo+IFRoZXJlIGlzIG5vIG5lZWQg
dG8gYmUgc29ycnkgZm9yIGFueXRoaW5nLgo+Cj4gVG8gYmUgY2xlYXIsIHdlIGRvbid0IGFzc3Vt
ZSBwcmlvciBrbm93bGVkZ2Ugb2YgWGVuLiBXZSByZXF1aXJlIGludGVybnMKPiB0byBnZXQgZmFt
aWxpYXJpc2VkIHdpdGggdGhlIGRldmVsb3BtZW50IHByb2Nlc3MgYnkgcmVhZGluZyByZWxldmFu
dAo+IG1hdGVyaWFscy4gIEFmdGVyIHJlYWRpbmcgdGhlIG1hdGVyaWFscyB0aGV5IHNob3VsZCBh
c2sgc3BlY2lmaWMKPiBxdWVzdGlvbnMgYWJvdXQgdGhlIHByb2Nlc3MuCj4KPiBXZSB1c2VkIHRv
IGhhdmUgYSBjZW50cmFsaXNlZCBwbGFjZSBmb3IgZWFzeSBidWdzLCBidXQgSSB0aGluayBtb3N0
Cj4gbG93LWhhbmdpbmcgZnJ1aXRzIGFyZSBhbHJlYWR5IGdvbmUuICBUaGF0J3Mgd2h5IEkgYXNr
ZWQgcG90ZW50aWFsCj4gaW50ZXJucyB0byBzdWJtaXQgcGF0Y2hlcyB0byBmaXggdHlwb3MgaW4g
dGhlIGh5cGVydmlzb3IgY29kZSBiYXNlIC0tCj4ganVzdCBvcGVuIGEgZmlsZSB0aGF0IGludGVy
ZXN0cyB5b3UgYW5kIHNlZSBpZiB5b3UgZmluZCBhbnkgdHlwb3MgaW4KPiBjb21tZW50cy4gIEJl
aW5nIGFibGUgdG8gZmluZCBhbmQgZml4IGEgcmVhbCBidWcgd291bGQgYmUgbmljZSwgYnV0Cj4g
dGhhdCdzIG5vdCBhIGhhcmQgcmVxdWlyZW1lbnQuIFRoZSBrZXkgcG9pbnQgaXMgdG8gZ28gdGhy
b3VnaCB0aGUKPiBkZXZlbG9wbWVudCBwcm9jZXNzIGFuZCBpbnRlcmFjdCB3aXRoIHRoZSBjb21t
dW5pdHkuCj4KPiBXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
