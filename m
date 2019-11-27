Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33410B236
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:16:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZz1S-00071P-DD; Wed, 27 Nov 2019 15:14:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=juU/=ZT=arm.com=mark.rutland@srs-us1.protection.inumbo.net>)
 id 1iZz1R-00071J-FA
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:14:29 +0000
X-Inumbo-ID: 9af6978e-1128-11ea-83b8-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9af6978e-1128-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 15:14:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 158B0328;
 Wed, 27 Nov 2019 07:14:28 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 544BC3F68E;
 Wed, 27 Nov 2019 07:14:25 -0800 (PST)
Date: Wed, 27 Nov 2019 15:14:23 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191127151423.GD51937@lakrids.cambridge.arm.com>
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-3-pasha.tatashin@soleen.com>
 <20191127150137.GB51937@lakrids.cambridge.arm.com>
 <CA+CK2bBvgDe5zVur7EYJgYhoZesuQkZVeyRxPCBSySqsR=-YPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+CK2bBvgDe5zVur7EYJgYhoZesuQkZVeyRxPCBSySqsR=-YPQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Subject: Re: [Xen-devel] [PATCH v2 2/3] arm64: remove uaccess_ttbr0 asm
 macros from cache functions
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6MTA6MDdBTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gSGkgTWFyaywKPiAKPiBUaGFuayB5b3UgZm9yIHJldmlld2luZyB0aGlzIHdvcmsu
CiAKPiA+IFRoZSAnYXJjaF8nIHByZWZpeCBzaG91bGQgcHJvYmFibHkgYmUgJ2FzbV8nIChvciBo
YXZlIGFuICdfYXNtJyBzdWZmaXgpLAo+ID4gc2luY2UgdGhpcyBpcyBlbnRpcmVseSBsb2NhbCB0
byB0aGUgYXJjaCBjb2RlLCBhbmQgZXZlbiB0aGVuIHNob3VsZCBvbmx5Cj4gPiBiZSBjYWxsZWQg
ZnJvbSB0aGUgQyB3cmFwcGVycy4KPiAKPiBTdXJlLCBJIGNhbiBjaGFuZ2UgaXQgdG8gYXNtXyos
IEkgd2FzIHVzaW5nIGFyY2hfKiB0byBiZSBjb25zaXN0ZW50Cj4gd2l0aCBfX2FyY2hfY29weV9m
cm9tX3VzZXIoKSBhbmQgZnJpZW5kcy4KCkZXSVcsIHRoYXQgbmFtaW5nIHdhcyBmcm9tIGJlZm9y
ZSB0aGUgY29tbW9uIHVhY2Nlc3MgY29kZSB0b29rIG9uIHRoZQpyYXdfKiBhbm1pbmcgZm9yIHRo
ZSBhcmNoIGZ1bmN0aW9ucywgYW5kIEkgd2FzIGV4cGVjdGluZyB0aGF0IHRoZSBhcmNoXyoKZnVu
Y3Rpb25zIHdvdWxkIGVuZCB1cCBiZWluZyBjYWxsZWQgZnJvbSBjb3JlIGNvZGUuCgpGb3Igbm93
IGl0J3MgcHJvYmFibHkgdG9vIGNodXJueSB0byBjaGFuZ2UgdGhhdCBleGlzdGluZyBjYXNlLgoK
VGhhbmtzLApNYXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
