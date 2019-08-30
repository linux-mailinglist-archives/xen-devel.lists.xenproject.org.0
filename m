Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E592A334B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 11:01:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3cjf-0000cs-PI; Fri, 30 Aug 2019 08:58:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2nn7=W2=bombadil.srs.infradead.org=batv+b0e6514120785512acaa+5850+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i3cjd-0000cn-Mp
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 08:58:21 +0000
X-Inumbo-ID: 4af651a8-cb04-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4af651a8-cb04-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lspzEa9r3JzBPnhzW703jJh/gllbyFhtWDO3SCJk8vk=; b=CgwE329pT+z1vmJinLiTGjXRo
 2cc/r6K8Bif1CDb5j7PdSIPGV3K9aa50EJMoF7YCBHJSnAufJIL55mVT0e+TFlJkBAwDA1zR4zavQ
 ipHWxmn+jjQo9IorE2zRMdvouO56vify/VPo+VI/ATY6L1Sv0Ui4skwXz2W+7cezDnKE7pKklmwiA
 HR5ZRoPFaNXI57MP/lDG2zq6ElSdp14Wu0Ea8Myc14f6SQ13eR2dochiB0xIS9FqpYg30Eu//i0Td
 ikttNcsRCM902cupjDE7b2wQZYAWOxanVVNfaTML4SrFIulgSHt235J+QPs/unlw97K5tVEnXBMX6
 EqJTQ+B6Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i3cjP-0008II-I4; Fri, 30 Aug 2019 08:58:07 +0000
Date: Fri, 30 Aug 2019 01:58:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Julien Grall <Julien.Grall@arm.com>
Message-ID: <20190830085807.GA15771@infradead.org>
References: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
 <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2FuIHdlIHRha2UgYSBzdGVwIGJhY2sgYW5kIGZpZ3VyZSBvdXQgd2hhdCB3ZSB3YW50IHRvIGRv
IGhlcmU/CgpBRkFJQ1MgdGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMgbWVtb3J5IGZvciB0aGUgc3dp
b3RsYi14ZW4gYnVmZmVyLAphbmQgdGhhdCBtZWFucyBpdCBtdXN0IGJlIDw9IDMyLWJpdCBhZGRy
ZXNzYWJsZSB0byBzYXRpc2Z5IHRoZSBETUEgQVBJCmd1YXJhbnRlZXMuICBUaGF0IG1lYW5zIHdl
IGdlbmVyYWxseSB3YW50IHRvIHVzZSBHRlBfRE1BMzIgZXZlcnl3aGVyZQp0aGF0IGV4aXN0cywg
YnV0IG9uIHN5c3RlbXMgd2l0aCBvZGQgem9uZXMgd2UgbWlnaHQgd2FudCB0byBkaXAgaW50bwpH
RlBfRE1BLiAgVGhpcyBhbHNvIG1lYW5zIHN3aW90bGIteGVuIGRvZXNuJ3QgYWN0dWFsbHkgZG8g
dGhlIHJpZ2h0CnRoaW5nIG9uIHg4NiBhdCB0aGUgbW9tZW50LiAgU28gc2hvdWxkbid0IHdlIGp1
c3QgaGF2ZSBvbmUgY29tbW9uCnJvdXRpbmUgaW4gc3dpb3RsYi14ZW4uYyB0aGF0IGNoZWNrcyBp
ZiB3ZSBoYXZlIENPTkZJR19aT05FX0RNQTMyCnNldCwgdGhlbiB0cnkgR0ZQX0RNQTMyLCBhbmQg
aWYgbm90IGNoZWNrIGlmIENPTkZJR19aT05FX0RNQSBpcyBzZXQKYW5kIHRoZW4gdHJ5IHRoYXQs
IGVsc2UgZGVmYXVsdCB0byBHRlBfS0VSTkVMPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
