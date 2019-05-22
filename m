Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626B270CA
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 22:27:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTXnE-00082P-Vy; Wed, 22 May 2019 20:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hTXnE-00082E-1P
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 20:24:56 +0000
X-Inumbo-ID: a915edb2-7ccf-11e9-9e26-13983f4ca38e
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a915edb2-7ccf-11e9-9e26-13983f4ca38e;
 Wed, 22 May 2019 20:24:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 027FC20868;
 Wed, 22 May 2019 20:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558556694;
 bh=UZ0cyj+Gstu1oWiqAvLS2QOmica8369fDe/nc7l+zx0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YU5kwhT3tuQWAdG7xsp3jDGnDFimxmIFkBTHdS12MK/axYXptx4XT4w7WG/JE4bfG
 Dni2zu+QAGE5rIlW8c1Eq00t0aIF8Da1RTI+Tz/QPuOeOu+SX5bNbC2SW1RXYxWlYd
 IEAQkBMJtDszjMhQ7m0ZDkqyyhxj1cNvd15b3THY=
Date: Wed, 22 May 2019 13:24:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Alistair Francis <alistair.francis@wdc.com>
In-Reply-To: <20190521222418.27107-1-alistair.francis@wdc.com>
Message-ID: <alpine.DEB.2.21.1905221324450.20440@sstabellini-ThinkPad-T480s>
References: <20190521222418.27107-1-alistair.francis@wdc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] xen/drivers/char: Protect the
 asm/vpl011.h include
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 alistair23@gmail.com, julien.grall@arm.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMSBNYXkgMjAxOSwgQWxpc3RhaXIgRnJhbmNpcyB3cm90ZToKPiBUaGUgb25seSB1
c2Ugb2YgYXNtL3ZwbDAxMS5oIGlzIHByb3RlY3RlZCBieSB0aGUgQ09ORklHX1NCU0FfVlVBUlRf
Q09OU09MRQo+IGRlZmluZSBzbyBsZXRzIHByb3RlY3QgdGhlIGluY2x1ZGUgYXMgd2VsbC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5j
b20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgoKCj4gLS0tCj4gIHYzOgo+ICAgLSBSZXdvcmsgY29tbWl0IHRpdGxlIGFuZCBtZXNzYWdlCj4g
ICAtIFNwbGl0IGl0IGludG8gYSBzZXBlcmF0ZSBpZmRlZgo+IAo+ICB4ZW4vZHJpdmVycy9jaGFy
L2NvbnNvbGUuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMg
Yi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+IGluZGV4IDM4ZWNkOWMwMTUuLmQ3MjhlNzM3
ZDEgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiArKysgYi94ZW4v
ZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+IEBAIC0zNiw3ICszNiw4IEBACj4gICNpZmRlZiBDT05G
SUdfWDg2Cj4gICNpbmNsdWRlIDx4ZW4vY29uc29sZWQuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVz
dC5oPgo+IC0jZWxzZQo+ICsjZW5kaWYKPiArI2lmZGVmIENPTkZJR19TQlNBX1ZVQVJUX0NPTlNP
TEUKPiAgI2luY2x1ZGUgPGFzbS92cGwwMTEuaD4KPiAgI2VuZGlmCj4gIAo+IC0tIAo+IDIuMjEu
MAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
