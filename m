Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B133ACD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:09:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXv5I-0003tF-Dl; Mon, 03 Jun 2019 22:05:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXv5H-0003t9-LG
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:05:39 +0000
X-Inumbo-ID: b806a598-864b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b806a598-864b-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 22:05:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0297A78;
 Mon,  3 Jun 2019 15:05:37 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEE733F5AF;
 Mon,  3 Jun 2019 15:05:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
 <20190603220245.22750-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8fe2cf58-d890-bdd4-3572-1785fe6aa607@arm.com>
Date: Mon, 3 Jun 2019 23:05:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603220245.22750-3-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, JBeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzMvMTkgMTE6MDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9wZHguYyBiL3hlbi9jb21tb24vcGR4LmMKPiBpbmRleCBiYjdl
NDM3MDQ5Li5hM2M2ZjRjMWVlIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vcGR4LmMKPiArKysg
Yi94ZW4vY29tbW9uL3BkeC5jCj4gQEAgLTUwLDkgKzUwLDEyIEBAIHN0YXRpYyB1NjQgX19pbml0
IGZpbGxfbWFzayh1NjQgbWFzaykKPiAgICAgICByZXR1cm4gbWFzazsKPiAgIH0KPiAgIAo+ICsv
Kgo+ICsgKiBXZSBkb24ndCBjb21wcmVzcyB0aGUgZmlyc3QgTUFYX09SREVSIGJpdCBvZiB0aGUg
YWRkcmVzc2VzLgo+ICsgKi8KPiAgIHU2NCBfX2luaXQgcGR4X2luaXRfbWFzayh1NjQgYmFzZV9h
ZGRyKQo+ICAgewo+IC0gICAgcmV0dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIgLSAxKTsKPiArICAg
IHJldHVybiBmaWxsX21hc2sobWF4KGJhc2VfYWRkciwgKHU2NCkxIDw8IChNQVhfT1JERVIgKyBQ
QUdFX1NISUZUKSkgLSAxKTsKClNlZSBteSBjb21tZW50IG9uIHYyIHJlZ2FyZGluZyB1NjQgdnMg
dWludDY0X3QuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
