Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23B145A48
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:53:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuJDM-00057f-MJ; Wed, 22 Jan 2020 16:50:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdgK=3L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuJDL-00057W-0r
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:50:47 +0000
X-Inumbo-ID: 55855402-3d37-11ea-b833-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55855402-3d37-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 16:50:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j26so7561817ljc.12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 08:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gjt7UrxxZ2tYU/nvS0owNnhHNPdtaK6xE4UT6oDtStI=;
 b=tdQn0ibfHSj/pqCsYRZShYKZsGZG7KcuFgyycRIuUjHfoKxYlkA+aiyKWnHJKGJytX
 POWy8x+SEFzyT8TuK4eK4cNKJ/aHc9x54inMBQrkHkRPFAPD4l5YHx6sLIIP0Lmkiqu9
 82y1lQVkvMh+xtwMBxXZB8VOxIvr37gLgKKkuEIlPrMCx5jRCXohuzKorTqqHoa6uMGQ
 /lM96CYiT1Th3FEVc4zhltoOspOG7Oe9QWOfEFvZDmhHNnSVFuXNJpwyoWWuC7knmB4G
 xjVUB0oEn7WGhhXVnhr9cgzViO7SnWrGTlIjp4l888ekwYMrHMUStGDd3gHmgYeWCETG
 z3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gjt7UrxxZ2tYU/nvS0owNnhHNPdtaK6xE4UT6oDtStI=;
 b=Vcptt2xtuT8oi+k9FfTX/CR2t8diIYehdUP+aGnxmS+zrKljmtD34SAi0w1a+tibxl
 8jbrKihsTYWo0khC/os9f0RnYhiFS7cfovrdTP80WDfPbxldWUORCMUvoY//j3EzEIXp
 cDjfPZHKJbN0IytAqx4Y/0iHd08qCcxBWTaKrjYQMM5SKGFAP8+EOjL2Xr1sE6+EebjA
 iwsQ6aHtCh05sYFBIavINPMzmU6ogCTc0Pg2/Su0rkb/8IsVRfnINjXHYW5NywfY1dgi
 8D6PjaptFJmbiJ6f4eLloqIJ5blKuxS315gvKb1NSwMdvSeVV+96SkUtaoiMBDd+nzW1
 Ayog==
X-Gm-Message-State: APjAAAVPl9urF9ozRkKSKneKJP6LMC4pHeH5NwAfC+IIsOoeIMdjJBzk
 siegbXe87ZilENDk+Azg3lj0+tnX6lQhLABQh0Q=
X-Google-Smtp-Source: APXvYqz1LD+nkdo8eY1KafwKyaow55gXTXs+ywH2RHqMuoNl5GSbi5Wf32Cx+8XcTyNyHH0lKxSxlZpOYwSpBcVGH4s=
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr20914997lji.274.1579711845134; 
 Wed, 22 Jan 2020 08:50:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Jan 2020 11:50:33 -0500
Message-ID: <CAKf6xpuZ6PDY-E9wAs=pkjU60bJOEirqzOQZTS7ahWNiFTAbkA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 00/16] Add support for qemu-xen runnning
 in a Linux-based stubdomain.
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
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eric Shelton <eshelton@pobox.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgoKPHNuaXA+Cgo+IExh
dGVyIHBhdGNoZXMgYWRkIFFNUCBvdmVyIGxpYnZjaGFuIGNvbm5lY3Rpb24gc3VwcG9ydC4gVGhl
IGFjdHVhbCBjb25uZWN0aW9uCj4gaXMgbWFkZSBpbiBhIHNlcGFyYXRlIHByb2Nlc3MuIEFzIGRp
c2N1c3NlZCBvbiBYZW4gU3VtbWl0IDIwMTksIHRoaXMgYWxsb3dzIHRvCj4gYXBwbHkgc29tZSBi
YXNpYyBjaGVja3MgYW5kL29yIGZpbHRlcmluZyAobm90IHBhcnQgb2YgdGhpcyBzZXJpZXMpLCB0
byBsaW1pdAo+IGxpYnhsIGV4cG9zdXJlIGZvciBwb3RlbnRpYWxseSBtYWxpY2lvdXMgc3R1YmRv
bWFpbi4KClRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzISAgSSB0aGluayB0aGUgc2VwYXJhdGUg
cHJvY2VzcyBpcyBuaWNlci4KCj4gVGhlIGFjdHVhbCBzdHViZG9tYWluIGltcGxlbWVudGF0aW9u
IGlzIGhlcmU6Cj4KPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL21hcm1hcmVrL3F1YmVzLXZtbS14
ZW4tc3R1YmRvbS1saW51eAo+ICAgICAoYnJhbmNoIGZvci11cHN0cmVhbSwgdGFnIGZvci11cHN0
cmVhbS12MykKPgo+IFNlZSByZWFkbWUgdGhlcmUgZm9yIGJ1aWxkIGluc3RydWN0aW9ucy4KPiBC
ZXdhcmU6IGJ1aWxkaW5nIG9uIERlYmlhbiBpcyBkYW5nZXJvdXMsIGFzIGl0IHJlcXVpcmUgaW5z
dGFsbGluZyAiZHJhY3V0IiwKPiB3aGljaCB3aWxsIHJlbW92ZSBpbml0cmFtZnMtdG9vbHMuIFlv
dSBtYXkgZW5kIHVwIHdpdGggYnJva2VuIGluaXRyZCBvbgo+IHlvdXIgaG9zdC4KCkp1c3QgYXMg
YW4gRllJLCBNYXJlaydzIHVzZSBvZiBkcmFjdXQgaXMgbWFpbmx5IGZvciBkcmFjdXQtaW5zdGFs
bCB0bwpjb3B5IGEgYmluYXJ5ICYgZGVwZW5kZW50IGxpYnJhcmllcyB3aGVuIGdlbmVyYXRpbmcg
dGhlIGluaXRyYW1mcwooaHR0cHM6Ly9naXRodWIuY29tL21hcm1hcmVrL3F1YmVzLXZtbS14ZW4t
c3R1YmRvbS1saW51eC9ibG9iL21hc3Rlci9yb290ZnMvZ2VuKS4KVGhlIGluaXRyYW1mcyBpc24n
dCBydW5uaW5nIGRyYWN1dCBzY3JpcHRzLiAgVXNpbmcgaW5pdHJhbWZzLXRvb2xzCmhvb2stZnVu
Y3Rpb25zOmNvcHlfZXhlYygpIGZvciBzaW1pbGFyIGZ1bmN0aW9uYWxpdHkgaXMgYSBwb3NzaWJp
bGl0eS4KCj4gMS4gVGhlcmUgYXJlIGV4dHJhIHBhdGNoZXMgZm9yIHFlbXUgdGhhdCBhcmUgbmVj
ZXNzYXJ5IHRvIHJ1biBpdCBpbiBzdHViZG9tYWluLgo+IFdoaWxlIGl0IGlzIGRlc2lyYWJsZSB0
byB1cHN0cmVhbSB0aGVtLCBJIHRoaW5rIGl0IGNhbiBiZSBkb25lIGFmdGVyIG1lcmdpbmcKPiBs
aWJ4bCBwYXJ0LiBTdHViZG9tYWluJ3MgcWVtdSBidWlsZCB3aWxsIGluIG1vc3QgY2FzZXMgYmUg
c2VwYXJhdGUgYW55d2F5LCB0bwo+IGxpbWl0IHFlbXUncyBkZXBlbmRlbmNpZXMgKHNvIHRoZSBz
dHViZG9tYWluIHNpemUpLgoKQSBtb3N0bHkgdW5wYXRjaGVkIFFFTVUgd29ya3MgZm9yIG5ldHdv
cmtpbmcgJiBkaXNrLiAgVGhlIGV4Y2VwdGlvbiBpcwpQQ0kgcGFzc3Rocm91Z2gsIHdoaWNoIG5l
ZWRzIHNvbWUgcGF0Y2hlcy4gIEkgdGVzdGVkIHRoaXMgYnkgcmVtb3ZpbmcKcGF0Y2hlcyBmcm9t
IE1hcmVrJ3MgcmVwbywgZXhjZXB0IGZvciB0aGUgc2VjY29tcCBvbmVzIGFuZApkaXNhYmxlLW5p
Yy1vcHRpb24tcm9tLnBhdGNoLiAgV2l0aG91dCBkaXNhYmxlLW5pYy1vcHRpb24tcm9tLnBhdGNo
LApRRU1VIGZhaWxzIHRvIHN0YXJ0IHdpdGggJ2ZhaWxlZCB0byBmaW5kIHJvbWZpbGUgImVmaS1y
dGw4MTM5LnJvbSInCgpPbmUgaXNzdWUgSSd2ZSBub3RpY2VkIGlzIFFFTVUgfjQuMSBjYWxscyBn
ZXRyYW5kb20oKSBkdXJpbmcgc3RhcnR1cC4KSW4gYSBzdHViZG9tIHRoZXJlIGlzIGluc3VmZmlj
aWVudCBlbnRyb3B5LCBzbyBRRU1VIGJsb2NrcyBhbmQgc3R1YmRvbQpzdGFydHVwIHRpbWVzIG91
dC4gIFlvdSBjYW4gYXZvaWQgZ2V0cmFuZG9tKCkgYmxvY2tpbmcgd2l0aApDT05GSUdfUkFORE9N
X1RSVVNUX0NQVSBvcgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD01MGVlNzUyOWVjNDUwMGM4OGY4NjY0
NTYwNzcwYTdhMWI2NWRiNzJiCm9yIHNvbWUgb3RoZXIgd2F5IG9mIGFkZGluZyBlbnRyb3B5LgoK
UmVnYXJkcywKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
