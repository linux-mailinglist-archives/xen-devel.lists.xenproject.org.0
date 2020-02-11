Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1E15882E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 03:22:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1L8c-0004n1-8c; Tue, 11 Feb 2020 02:18:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g1ru=37=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1j1L8a-0004mw-HQ
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 02:18:56 +0000
X-Inumbo-ID: da8d3ede-4c74-11ea-852a-bc764e2007e4
Received: from mail-qv1-xf2b.google.com (unknown [2607:f8b0:4864:20::f2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da8d3ede-4c74-11ea-852a-bc764e2007e4;
 Tue, 11 Feb 2020 02:18:55 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id y8so4279558qvk.6
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2020 18:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JA+99j/KiRIu5wa/G3aW5pDQDGZADd7r9ntusABXHOs=;
 b=f3vTK+34dUZZH0PHAc/gNsTYd4Ow9esExiJBnPZuglB9Wqf2Rav0STM1zlKnUr/0dt
 nW1seNy3HfO9yapkxW9gUQKKVIj7XoV5rQ5gvOZFV3ljpdGKaQYRlM2KdO7dX7F9W8mK
 MM9veJ23h0US6kppUxLNCOwkb3aQt03nHEUCVlo3uT6YM7xGnoFNSv78cGkLPS49/f7T
 NP0Ud0VdWmb4SSKZq6Jhce1vSb1g2b4UgwtnD46jMssFn/zVzv3GznpqawU+JinxxzP+
 nMEhAJSQLtLNL6h2o2tWZ91GuRg6XA9VCZjX9/NRck92aQcTaflA6hyrh/MbqrMD2Etr
 UGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JA+99j/KiRIu5wa/G3aW5pDQDGZADd7r9ntusABXHOs=;
 b=OCzBdHLKBZZeDjEwkHYyshVcAYHn96BzljDpGqTfUdXswNC/Q3eIfJqsHGrEIz4PBT
 AIm2MtuiYzNsR22IRSBv2V6s+xttXKs3E94ZwNoJclT8SABR9cM2tUcJd5ZlacnsR5Jx
 a5+ADBG+3dbsfs3DkfNuujzyISng4V0mY28cr63olYSDpiF0L+y1B+wYQ5uDpNPZXSvc
 jhgBAOVMKa1L9DvhY6FAoQLg+4aM3q9lDvytD5+4yrbbXFAVfcXAlIWvI4idnCExCEJS
 llxbeyYkQZ3qiM5pzfOm/9TLo0n3Osw90YqW+kYI0jT3Z28cRcGAY2jt9XLbAqp2TbOf
 iX9w==
X-Gm-Message-State: APjAAAVQY5Q8rrvu0q/RsLXetutN+h8LfcJoG0qlzFY4RQIZoOuingrK
 xCa6zWo6rhI0CQEN2Pk/j19d+dXvktys5oKTWt5eJw==
X-Google-Smtp-Source: APXvYqzke+yHedqZ/yGGKLRChSer3eE/9sNE/LfB496yKCIHub7SqyRJz2+kZXeLr1R5HcBbwFVxyAzRDjKwvh2ijpo=
X-Received: by 2002:ad4:442c:: with SMTP id e12mr992615qvt.19.1581387535175;
 Mon, 10 Feb 2020 18:18:55 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8d1EGVeNLis-RJqBogihiY3T=4poxfLyF_s2PG89yGNQ@mail.gmail.com>
 <20200127122718.xz44jspb5wslprtt@debian>
 <20200127142836.GG57924@desktop-tdan49n.eng.citrite.net>
 <20200127145246.GH57924@desktop-tdan49n.eng.citrite.net>
In-Reply-To: <20200127145246.GH57924@desktop-tdan49n.eng.citrite.net>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 10 Feb 2020 18:18:44 -0800
Message-ID: <CAMmSBy_iayzNCQb1gHU80B-BFNoE+KHBBdmsfTpSSDs+iE352A@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] PVH PCI passthrough for DomUs
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciBhbGwgdGhlIGJhY2tncm91bmQgaW5mb3JtYXRpb24gLS0gdGhpcyBpcyB2ZXJ5
IG11Y2ggYXBwcmVjaWF0ZWQhCgpMb29raW5nIGF0IHRoZSBsZXZlbCBvZiBlZmZvcnQgb24gdGhp
cyBvbmUsIHdlIHVsdGltYXRlbHkgZGVjaWRlZCB0bwpzdGljayB3aXRoIEhWTSBmb3Igb3VyIHVz
ZWNhc2UgaW4gUHJvamVjdCBFVkUgZm9yIG5vdy4KCklmIHRoZXJlJ3MgYSBjdXN0b21lciBwcmVz
c3VyZSAtLSB3ZSdsbCBkZWZpbml0ZWx5IGxvb2sgaW50byBwaWNraW5nIGl0IGJhY2sgdXAuCgpU
aGFua3MsClJvbWFuLgoKT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgNjo1MiBBTSBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBGb3Jnb3QgdG8gc2V0ICdU
bzonIGNvcnJlY3RseS4KPgo+IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0IDAzOjI4OjM2UE0gKzAx
MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAyNywgMjAyMCBhdCAx
MjoyNzoxOFBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBDYyBSb2dlcgo+ID4KPiA+IFRo
YW5rcyA6KS4KPiA+Cj4gPiA+IE9uIFN1biwgSmFuIDE5LCAyMDIwIGF0IDExOjMwOjQyUE0gLTA4
MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gPiA+ID4gSGkhCj4gPiA+ID4KPiA+ID4gPiBJ
J3ZlIGp1c3QgdHJpZWQgdGhpcyB3aXRoIFhlbiA0LjEzLjAgYW5kIGl0IHNlZW1zIGxpa2UgdGhh
dCBpcyBzdGlsbAo+ID4gPiA+IG5vdCBzdXBwb3J0ZWQuCj4gPgo+ID4gTm8sIHRoZXJlIGhhc24n
dCBiZWVuIG11Y2ggcHJvZ3Jlc3Mgb24gdGhpcyBzYWRseS4KPiA+Cj4gPiA+ID4gVGhpcyBtYWtl
cyBtZSBjdXJpb3VzIGlmIGFueWJvZHkgaXMgd29ya2luZyBvbiB0aGlzIGFuZCB3aGV0aGVyCj4g
PiA+ID4gdGhlcmUncyBhbnl0aGluZyB3ZSBjYW4gZG8gdG8gaGVscCBhY2NlbGVyYXRlIHRoZSBl
ZmZvcnQuCj4gPgo+ID4gVGhlIGZpcnN0IHN0ZXAgd291bGQgYmUgdG8gZ2V0IHZQQ0kgaG9va2Vk
IGludG8gdGhlIGlvcmVxIG1hY2hpbmVyeSwKPiA+IHNvIHRoYXQgYSBkb21haW4gY2FuIGhhdmUg
ZGV2aWNlcyBvbiB0aGUgZW11bGF0ZWQgUENJIGJ1cyBoYW5kbGVkIGJ5Cj4gPiB2UENJIHdoaWxl
IG90aGVycyBhcmUgaGFuZGxlZCBieSBleHRlcm5hbCBpb3JlcSBlbXVsYXRvcnMuIEkndmUgcG9z
dGVkCj4gPiBhIHYzIG9mIHRoaXMgd29yayBvbiBTZXB0ZW1iZXI6Cj4gPgo+ID4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAz
Mjc4Lmh0bWwKPiA+Cj4gPiBCdXQgSSBoYXZlbid0IGdvdCB0aW1lIHRvIGdvIG92ZXIgdGhlIGNv
bW1lbnRzIGFuZCBwb3N0IGEgbmV3IHZlcnNpb24uCj4gPgo+ID4gT25jZSB0aGF0J3MgZG9uZSB0
aGUgcmVtYWluaW5nIHN0ZXAgd291bGQgYmUgdG8gbWFrZSB2UENJIHNhZmUgZm9yCj4gPiB1bnBy
aXZpbGVnZWQgZ3Vlc3RzLiBXZSBuZWVkIHRvIGFzc3VyZSB0aGF0IGd1ZXN0cyBjYW4gb25seSB3
cml0ZSB0bwo+ID4gc3BlY2lmaWMgYml0cyBvZiB0aGUgY29uZmlnIHNwYWNlLCBhbmQgbmVlZCB0
byBsaW1pdCB0aGUgY2FwYWJpbGl0aWVzCj4gPiB0aGF0IGFyZSBleHBvc2VkIHRvIHRoZSBvbmVz
IFhlbiBrbm93cyB0byBiZSBzYWZlIHRvIGhhbmRsZS4gVGhpcyBjYW4KPiA+IGJlIHdvcmtlZCBi
eSBtdWx0aXBsZSBwZW9wbGUgY29uY3VycmVudGx5IElNTywgYnV0IHJlcXVpcmVzIHN0ZXAgMQo+
ID4gKGludGVncmF0aW9uIHdpdGggaW9yZXEpIHRvIGJlIGZpbmlzaGVkIGZpcnN0Lgo+ID4KPiA+
IEknbSBtb3JlIHRoYW4gaGFwcHkgZm9yIHNvbWVvbmUgdG8gcGljayBhbnkgb2YgdGhvc2UgdGFz
a3MsIGluY2x1ZGluZwo+ID4gdGhlIGludGVncmF0aW9uIG9mIHZQQ0kgd2l0aCB0aGUgaW9yZXEg
bWFjaGluZXJ5LiBJZiBub3QsIEkgZXhwZWN0IEkKPiA+IHdpbGwgYmUgYWJsZSB0byBkbyBzb21l
IHdvcmsgb24gdGhpcyBpbiBhIGNvdXBsZSBvZiB3ZWVrcywgYnV0IHRoYXQKPiA+IGRlcGVuZHMg
b24gbm90aGluZyBlbHNlIGdldHRpbmcgb24gZmlyZSwgYW5kIG1lIGJlaW5nIGFibGUgdG8gZmx1
c2ggbXkKPiA+IHF1ZXVlIG9mIHBlbmRpbmcgcGF0Y2hlcy4KPiA+Cj4gPiBXb3VsZCB5b3UgYmUg
dXAgdG8gcGljayBzb21lIG9mIHRoZXNlIHRhc2tzPwo+ID4KPiA+IEkgY2FuIHRyeSB0byBzcGVl
ZHVwIHRoZSB2UENJIGlvcmVxIGludGVncmF0aW9uIGlmIHRoZXJlJ3MgcGVvcGxlCj4gPiB3aWxs
aW5nIHRvIHdvcmsgb24gdGhlIHJlbWFpbmluZyBzdGVwcywgSSBoYXZlbid0IGRvbmUgc28gYmVj
YXVzZSBJCj4gPiBkaWRuJ3Qgc2VlIG11Y2ggaW50ZXJlc3QgaW4gZ2VuZXJhbCwgYW5kIEkgd2Fz
IGV4cGVjdGluZyB0byBiZSB0aGUKPiA+IG9ubHkgb25lIHdvcmtpbmcgb24gdGhlIHJlbWFpbmlu
ZyBzdGVwcyBhbnl3YXkuCj4gPgo+ID4gUmVnYXJkcywgUm9nZXIuCj4gPgo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IFhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
