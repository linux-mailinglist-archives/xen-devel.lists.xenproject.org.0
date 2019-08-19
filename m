Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3625891E8F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 10:05:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzcce-0000zp-Ox; Mon, 19 Aug 2019 08:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PvWu=WP=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1hzc9u-0006NQ-Pu
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 07:32:54 +0000
X-Inumbo-ID: 8e6ab244-c253-11e9-8beb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e6ab244-c253-11e9-8beb-12813bfff9fa;
 Mon, 19 Aug 2019 07:32:54 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 358142086C;
 Mon, 19 Aug 2019 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566199973;
 bh=2lDcf3QQwVsKtMhMZhdAAuqPtLzNgs151JSGDBAUuzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D6tRAlCEy9T9B1f/Fr8dqhepWZ75Fhl8VQaANcZGYdzMgTqJwFcqVlTLJy909tybu
 RPrW2ST42+f3cgF7RF1ZGbkSknGDDVoqX/qyb5n7MDo/L7aDS8rJjVyvjCsgexBYmi
 MajDi6YVzh9HEPWR+mvVck/OTqThG4PCoWxxK8k4=
Date: Mon, 19 Aug 2019 08:32:49 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190819073248.wtmnnl3mkjososvc@willie-the-truck>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816130013.31154-12-hch@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:02:35 +0000
Subject: Re: [Xen-devel] [PATCH 11/11] arm64: use asm-generic/dma-mapping.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDM6MDA6MTNQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gTm93IHRoYXQgdGhlIFhlbiBzcGVjaWFsIGNhc2VzIGFyZSBnb25lIG5vdGhp
bmcgd29ydGggbWVudGlvbmluZyBpcwo+IGxlZnQgaW4gdGhlIGFybTY0IDxhc20vZG1hLW1hcHBp
bmcuaD4gZmlsZSwgc28gc3dpdGNoIHRvIHVzZSB0aGUKPiBhc20tZ2VuZXJpYyB2ZXJzaW9uIGlu
c3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vS2J1aWxkICAgICAgICB8ICAxICsKPiAg
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oIHwgMjIgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICBhcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMgICAgICAgICAgfCAgMSArCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vZG1hLW1hcHBpbmcuaAoKQWNr
ZWQtYnk6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+CgpUaGFua3MgZm9yIGNsZWFuaW5n
IHRoaXMgdXAuCgpXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
