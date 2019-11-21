Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8F7105A85
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 20:41:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXsIa-0003Cu-HL; Thu, 21 Nov 2019 19:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L+rW=ZN=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iXsIY-0003Cp-Og
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 19:39:26 +0000
X-Inumbo-ID: a01dafd6-0c96-11ea-9631-bc764e2007e4
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a01dafd6-0c96-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 19:39:25 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id e187so4164345qkf.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 11:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mpyu3UkDlGsdhwkJ190x+aHVxqvbS6/1MYFDYBCiAC4=;
 b=ISqjzQpEgZj45GkQq1uq/wd5Su3U9GIxZ+gl0gq0yzx1NJ3Szlhb5DZ3EFsOrIUPwH
 Cg6q4MJTZwVtjqf+TkKqJEgujG6mDfMj+RMNhaihX8OVO9cb7tTPFLzV4X5a9GTx+6bd
 dV7dEN4iUAAMjL7QUnAypTvacTmnS8vya4y+UnwbFRktAvQMRsfALphTqEZ7DmL7UNl+
 tPpXV9GKctDLdrAUbQ3zR2SNevhcrtvFTZmJobUIbeXlkJssKHL1800ogmgBdcfuq0CQ
 UOTgbdntii50PAvR6adA2N+fVjRTB8k1ZIrtXQMnjx+tgSk4PMFhC2eKSE7zGMPXjsE8
 MVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mpyu3UkDlGsdhwkJ190x+aHVxqvbS6/1MYFDYBCiAC4=;
 b=Rn0eL0LOEHmS3YvHq0mwZjWDq6xRJAnPWxRynnU44xKhLr3gttXsYYI+uhVz0n3/Jh
 7Ghv9dfV/8Flq/2cvnj66lqG7C5FwBN/nBv/ghgvqgC7gc2T6V5i++JxJ9la6ItEMnil
 LrOrb8aMgtWkgIc7lC51uY1gtxReoonxx2D1TH9kyHyqalmc9gNEGlDj/evLaMN57jqA
 kz+GrsN2IVRfoA8URs/OqyKhhxh4yh8B1crKVwMH2mjibsZJncAcApZNZeaDHvq2+9lL
 /1TWA2woeQUd9mVk3+KxDgHkBlE4F5rO1ZRvws3acQzuQ0pCnJepgK548rk7IGLCN3gy
 9hkw==
X-Gm-Message-State: APjAAAW3cEOXvfWhtao8sAhI8HAP55GmlzVfusLHoVjhNRu/xZ6kZAfD
 WOnAwgcRodSVU02Tki58HbUGR8hkPQ51v7ANHRT8WQ==
X-Google-Smtp-Source: APXvYqzgfM/yiExXnkfv6qzONL6/XL3OkJfR/1TCRhel1w3uY4oZ+NXXfdXq/PLEhvzx1Mal3p08QREXCegkyI+f56o=
X-Received: by 2002:ae9:f511:: with SMTP id o17mr9637302qkg.157.1574365165420; 
 Thu, 21 Nov 2019 11:39:25 -0800 (PST)
MIME-Version: 1.0
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
In-Reply-To: <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 21 Nov 2019 11:39:14 -0800
Message-ID: <CAMmSBy9ytrZ6dhvPWGj5K8aHYOaTfFFwnS3oLbMwUpRDAGEzjA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgOTozOCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDIxLzExLzIwMTkgMTc6MzEsIFJvbWFuIFNo
YXBvc2huaWsgd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMDowNiBQTSBKw7xy
Z2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+ID4+IFdoZXJlIGRvIHdlIHN0YW5k
IHdpdGggWGVuIDQuMTMgcmVnYXJkaW5nIGJsb2NrZXJzIGFuZCByZWxhdGVkIHBhdGNoZXM/Cj4g
Pj4KPiA+PiAxLiBPU1N0ZXN0IGZhaWx1cmUgcmVnYXJkaW5nIG5lc3RlZCB0ZXN0Ogo+ID4+ICAg
ICBJJ20gbm90IHF1aXRlIHN1cmUgd2hldGhlciB0aGUgY3VycmVudGx5IGRlYmF0ZWQgcGF0Y2gg
b2YgQW5kcmV3IGlzCj4gPj4gICAgIGZpeGluZyB0aGUgcHJvYmxlbS4gSWYgbm90LCBkbyB3ZSBr
bm93IHdoYXQgaXMgbWlzc2luZyBvciBob3cgdG8KPiA+PiAgICAgYWRkcmVzcyB0aGUgaXNzdWU/
IElmIHllcywgY291bGQgd2UgcGxlYXNlIGNvbWUgdG8gYW4gYWdyZWVtZW50Pwo+ID4+ICAgICBB
cyBhbiBhbHRlcm5hdGl2ZTogYW55IHRob3VnaHRzIGFib3V0IGlnbm9yaW5nIHRoaXMgdGVzdCBm
YWlsdXJlIGZvcgo+ID4+ICAgICA0LjEzLVJDMyAoSU9XOiBkb2luZyBhIGZvcmNlIHB1c2gpPwo+
ID4+Cj4gPj4gMi4gUnl6ZW4vUm9tZSBmYWlsdXJlcyB3aXRoIFdpbmRvd3MgZ3Vlc3RzOgo+ID4+
ICAgICBXaGF0IGlzIHRoZSBjdXJyZW50bHkgcGxhbm5lZCB3YXkgdG8gYWRkcmVzcyB0aGUgcHJv
YmxlbT8gV2hvIGlzCj4gPj4gICAgIHdvcmtpbmcgb24gdGhhdD8KPiA+Pgo+ID4+IDMuIFBlbmRp
bmcgcGF0Y2hlcyBmb3IgNC4xMzoKPiA+PiAgICAgQ291bGQgSSBwbGVhc2UgaGF2ZSBmZWVkYmFj
ayB3aGljaCBwYXRjaGVzIHRhZ2dlZCBhcyAiZm9yLTQuMTMiIGFyZQo+ID4+ICAgICBmaXhpbmcg
cmVhbCByZWdyZXNzaW9ucyBvciBpc3N1ZXM/IEkgZG9uJ3Qgd2FudCB0byB0YWtlIGFueSBwYXRj
aGVzCj4gPj4gICAgIG5vdCBmaXhpbmcgcmVhbCBwcm9ibGVtcyBhZnRlciBSQzMsIGFuZCBJIGhv
cGUgdG8gYmUgYWJsZSB0byBnZXQgYQo+ID4+ICAgICBwdXNoIHJhdGhlciBzb29uZXIgdGhhbiBs
YXRlciB0byBiZSBhYmxlIHRvIGxldCBJYW4gY3V0IFJDMy4KPiA+Pgo+ID4+IDQuIEFyZSB0aGVy
ZSBhbnkgYmxvY2tlcnMgZm9yIDQuMTMgb3RoZXIgdGhhbiAxLiBhbmQgMi4gKGFwYXJ0IG9mIGFu
eQo+ID4+ICAgICBwZW5kaW5nIFhTQXMpPwo+ID4gQW55IGNoYW5jZSB0aGUgZWZpPW5vLXJzIHJl
Z3Jlc3Npb24gY2FuIGJlIGFkZGVkIHRvIHRoZSBsaXN0PyBJIHVuZGVyc3RhbmQKPiA+IHRoYXQg
SSdtIHN0aWxsIG9uIHRoZSBob29rIHRvIHByb3ZpZGUgbW9yZSBkZXRhaWxzIChJIHByb21pc2Ug
dG8gZG8gaXQgb24gRnJpCj4gPiB3aGVuIEkgZ2V0IHRvIG15IGxhYiB0byBhY3R1YWxseSBoYXZl
IGEgc2VyaWFsIGNvbnNvbGUgb24gYWxsIHRoZXNlIGJveGVzKS4KPiA+IEF0IHRoZSBzYW1lIHRp
bWUgdGhpcyBpcyBhIHByZXR0eSBzZXJpb3VzIHJlZ3Jlc3Npb24gZm9yIGFuIGVudGlyZSBjbGFz
cyBvZgo+ID4gZGV2aWNlcyB3aGVyZSBYZW4gd2FzIHBlcmZlY3RseSBoYXBweSBldmVuIGR1cmlu
ZyBSQzEuCj4KPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNv
bW1pdGRpZmY7aD01MzRmOWUyOWNlMjg1ODA4OTJiMzg1NjAzNmI1ZTVjZDgwNTY2N2NjCj4gaGFz
IGJlZW4gY29tbWl0dGVkLiAgSXQgaXMgaW4gc3RhZ2luZywgYnV0IG5vdCBpbiBtYXN0ZXIgeWV0
IChiZWNhdXNlCj4gbWFzdGVyIGlzIGJsb2NrZWQgYnkgbXkgcmVncmVzc2lvbiBpbiAxKS4KCkkn
bGwgbWFrZSBzdXJlIHRvIHRlc3QgaXQgb24gRnJpLCBidXQgaGVyZSdzIHdoZXJlIEknbSBsb3N0
IC0tIG15CnVuZGVyc3RhbmRpbmcgdGhhdAphY3RpdmF0aW9uIG9mIHRoaXMgcGF0Y2ggcmVxdWly
ZXMgYSBzcGVjaWFsIGJ1aWxkIGZsYWcgdG8gYmUgcGFzc2VkLgpXaGljaCBtZWFucywKd2UncmUg
c3RpbGwgdmVyeSBtdWNoIGluIGEgcmVncmVzc2VzIHN0YXRlIHdoZW4gaXQgY29tZXMgdG8gYnVp
bGRpbmcKb3V0LW9mLXRoZS1ib3gsCm5vPwoKVGhhbmtzLApSb21hbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
