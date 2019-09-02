Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA99A5AEC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 18:00:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4oiA-0004ne-Ha; Mon, 02 Sep 2019 15:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hpg3=W5=bombadil.srs.infradead.org=batv+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i4oi8-0004nZ-Kh
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 15:57:44 +0000
X-Inumbo-ID: 61d15510-cd9a-11e9-b95f-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61d15510-cd9a-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TAPkJdtwVtnQWX8kFo2OKNkqJO94RSl/MplJJxVFMSo=; b=EHK0ifFXrGAxAzx2m8Rp+yzeA
 G2XJvYd0JQm/65pjh4Ino0bqQHRNiIZHTSqSI/8NnicuRJYFXlZOXXDF6ALr5loWn+9wqAxLC2wIm
 lACVQvsjPDzU+KrZG4OhmqCzBANJQBmuIMSkB6QicNiZGaCE74L6vro03wIP6qrIFEc/6I4in6k29
 VtoktZOyIkoKig/Ln5W4c8TEGP8nQACkf6xMBlE8WQFRvMALhO65cdW0pklBv7KI3JvsJ9FrmyGIW
 ND+elO8WN4YxEXV8XM15khihzmLOa3KRSYACoIFGjgmfpRAZAQroXcTT044mTfQQPc2iJxhvI0/qb
 aVoIeqGlA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i4ohw-0002EN-76; Mon, 02 Sep 2019 15:57:32 +0000
Date: Mon, 2 Sep 2019 08:57:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20190902155732.GA8311@infradead.org>
References: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
 <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
 <20190830085807.GA15771@infradead.org>
 <alpine.DEB.2.21.1908301926500.21347@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1908301926500.21347@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Christoph Hellwig <hch@infradead.org>, Julien Grall <Julien.Grall@arm.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, nd <nd@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDc6NDA6NDJQTSAtMDcwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+ICsgSnVlcmdlbiwgQm9yaXMKPiAKPiBPbiBGcmksIDMwIEF1ZyAyMDE5LCBD
aHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IENhbiB3ZSB0YWtlIGEgc3RlcCBiYWNrIGFuZCBm
aWd1cmUgb3V0IHdoYXQgd2Ugd2FudCB0byBkbyBoZXJlPwo+ID4gCj4gPiBBRkFJQ1MgdGhpcyBm
dW5jdGlvbiBhbGxvY2F0ZXMgbWVtb3J5IGZvciB0aGUgc3dpb3RsYi14ZW4gYnVmZmVyLAo+ID4g
YW5kIHRoYXQgbWVhbnMgaXQgbXVzdCBiZSA8PSAzMi1iaXQgYWRkcmVzc2FibGUgdG8gc2F0aXNm
eSB0aGUgRE1BIEFQSQo+ID4gZ3VhcmFudGVlcy4gIFRoYXQgbWVhbnMgd2UgZ2VuZXJhbGx5IHdh
bnQgdG8gdXNlIEdGUF9ETUEzMiBldmVyeXdoZXJlCj4gPiB0aGF0IGV4aXN0cywgYnV0IG9uIHN5
c3RlbXMgd2l0aCBvZGQgem9uZXMgd2UgbWlnaHQgd2FudCB0byBkaXAgaW50bwo+ID4gR0ZQX0RN
QS4gIFRoaXMgYWxzbyBtZWFucyBzd2lvdGxiLXhlbiBkb2Vzbid0IGFjdHVhbGx5IGRvIHRoZSBy
aWdodAo+ID4gdGhpbmcgb24geDg2IGF0IHRoZSBtb21lbnQuICBTbyBzaG91bGRuJ3Qgd2UganVz
dCBoYXZlIG9uZSBjb21tb24KPiA+IHJvdXRpbmUgaW4gc3dpb3RsYi14ZW4uYyB0aGF0IGNoZWNr
cyBpZiB3ZSBoYXZlIENPTkZJR19aT05FX0RNQTMyCj4gPiBzZXQsIHRoZW4gdHJ5IEdGUF9ETUEz
MiwgYW5kIGlmIG5vdCBjaGVjayBpZiBDT05GSUdfWk9ORV9ETUEgaXMgc2V0Cj4gPiBhbmQgdGhl
biB0cnkgdGhhdCwgZWxzZSBkZWZhdWx0IHRvIEdGUF9LRVJORUw/Cj4gCj4gWWVzLCBmb3IgQVJN
L0FSTTY0IGl0IG1ha2VzIGEgbG90IG9mIHNlbnNlIGdpdmVuIHRoYXQgZG9tMCBpcyAxOjEgbWFw
cGVkCj4gKHBzZXVkby1waHlzaWNhbCA9PSBwaHlzaWNhbCkuICBJJ2xsIGxldCBKdWVyZ2VuIGFu
ZCBCb3JpcyBjb21tZW50IG9uCj4gdGhlIHg4NiBzaWRlIG9mIHRoaW5ncywgYnV0IG9uIHg4NiBQ
ViBEb20wIGlzIG5vdCAxOjEgbWFwcGVkIHNvCj4gR0ZQX0RNQTMyIGlzIHByb2JhYmx5IG5vdCBt
ZWFuaW5nZnVsLgoKQnV0IGlzIGl0IGFjdHVhbGx5IGhhcm1mdWw/ICBJZiB0aGUgR0ZQX0RNQTMy
IGRvZXNuJ3QgaHVydCB3ZSBjb3VsZApqdXN0IHVzZSBpdCB0aGVyZS4gIE9yIGlmIHRoYXQgc2Vl
bXMgdG8gdWdseSB3ZSBjYW4gbWFrZSB0aGUgZG1hCmZsYWdzIGRlcGVuZGVudHMgb24gYSBYRU5f
MVRPMV9NQVBQRUQgY29uZmlnIG9wdGlvbiBzZXQgYnkgYXJtL2FybTY0LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
