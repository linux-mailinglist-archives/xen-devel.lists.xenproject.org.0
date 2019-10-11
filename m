Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF2D4771
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 20:20:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIzTr-0006pi-Or; Fri, 11 Oct 2019 18:17:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MXO=YE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIzTq-0006pd-2Q
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 18:17:34 +0000
X-Inumbo-ID: 64aa7118-ec53-11e9-933e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 64aa7118-ec53-11e9-933e-12813bfff9fa;
 Fri, 11 Oct 2019 18:17:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531C41570;
 Fri, 11 Oct 2019 11:17:32 -0700 (PDT)
Received: from [10.37.12.177] (unknown [10.37.12.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 170653F703;
 Fri, 11 Oct 2019 11:17:30 -0700 (PDT)
To: Brian Woods <brian.woods@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
 <20191011164325.GA18594@xilinx.com>
 <b623fddb-9ab6-d9ef-0d66-93e465ee64c6@arm.com>
 <20191011180612.GA19987@xilinx.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a3cf5b20-9a67-f3db-5a0d-1fb672b2bbe3@arm.com>
Date: Fri, 11 Oct 2019 19:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011180612.GA19987@xilinx.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: add warning if memory modules
 overlap
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xMS8xOSA3OjA2IFBNLCBCcmlhbiBXb29kcyB3cm90ZToKPiBPbiBGcmksIE9j
dCAxMSwgMjAxOSBhdCAwNTo1ODozNVBNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gRm9y
IHRoYXQsIHlvdSdkIG5lZWQgdG8gZWl0aGVyIGNoZWNrIHRoZSBzdGFydCBhbmQgZW5kIG9mIHRo
ZSBhZGRlZAo+IG1vZHVsZSBvciB0aGUgc3RhcnQgb2YgYm90aC4gIFNvIHNvbWV0aGluZyBsaWtl
Ogo+IAo+IGlmICggKChtb2QtPnN0YXJ0ID49IHN0YXJ0KSAmJiAobW9kLT5zdGFydCA8IChzdGFy
dCArIHNpemUpKSkgfHwKPiAgICAgICAoKHN0YXJ0ID49IG1vZC0+c3RhcnQpICYmIChzdGFydCA8
IChtb2QtPnN0YXJ0ICsgbW9kLT5zaXplKSkpICkKPiAgICAgIHByaW50aygiV0FSTklORzogLi4u
Iik7Cj4gCj4gSWYgeW91IGRvbid0IHlvdSBydW4gdGhlIHJpc2sgb2YgaGF2aW5nIGEgbW9kdWxl
IG92ZXJsYXAgYnV0IG5vdCBhdCB0aGUKPiBzdGFydCBvZiB0aGUgYWRkZWQgbW9kdWxlICh1bmxl
c3MgdGhlcmUncyBhIGd1YXJhbnRlZWQgb3JkZXIpLiAgWW91J3JlCj4gc3RpbGwgcnVubmluZyBh
bGwgb2YgdGhlIGNoZWNrcyBmcm9tIHdoYXQgSSBjYW4gdGVsbCwganVzdCBub3QgaW4gbmVzdGVk
Cj4gZm9yIGxvb3Agc28uIFBsdXMgSSdtIG5vdCBzdXJlIGhvdyBtYW55IHRpbWVzIGFkZF9ib290
X21vZHVsZSBnZXRzIHJ1bgo+IGFuZCB0aGUgIm1vZC0+a2luZCA9PSBraW5kIC4uIiBpZiBzdGF0
ZW1lbnQgZ2V0cyBydW4gYW5kIGlzIHRydWUuCj4gSWYgdGhlIGFib3ZlIGlzIHRydWUsIHdvdWxk
bid0IHRoYXQgY2F1c2UgZXh0cmEgY2hlY2tzIGZvciB0aGUgZm9yIGxvb3AKPiBpdGVyYXRpb25z
IGJlZm9yZSBpdCB3YXMgdHJ1ZT8KCkZvciBub24tZG9tMGxlc3MgY2FzZSwgd2UgYXJlIHRhbGtp
bmcgYWJvdXQgNCBtb2R1bGVzIG1heCAoWGVuLCBLZXJuZWwsIApJbml0cmFtZnMsIGZsYXNrIHBv
bGljeSkuIE1vZHVsZXMgY2Fubm90IGJlIHRoZSBzaGFyZWQgaGVyZS4KCkZvciBkb20wbGVzcywg
eW91IGFyZSB1bmxpa2VseSB0byBoYXZlIHRoYXQgbWFueSBkb21haW5zIHN0YXJ0ZWQgZnJvbSAK
WGVuLiBTbyB0aGUgbnVtYmVyIG9mIG1vZHVsZXMgd2lsbCBzdGlsbCBiZSBsaW1pdGVkIChldmVu
IG1vcmUgaWYgeW91IApzaGFyZSBpdCkuCgpUaGlzIGNvZGUgaXMgYWxzbyBvbmx5IGNhbGxlZCBh
dCBib290IHdoZXJlIHRoZXJlIGFyZSBiaWdnZXIgdGltZSAKY29uc3VtaW5nIHBhcnQgKHN1Y2gg
YXMgZG9taGVhcCBpbml0aWFsaXphdGlvbikuIFNvIEkgd291bGQgYmUgc3VycHJpc2VkIAppZiB5
b3Ugc2VlIGFueSBpbXByb3ZlbWVudCAob3RoZXIgdGhhbiBhIGNvdXBsZSBvZiBjeWNsZXMpIGlu
IGJvb3QgdGltZSAKaGVyZS4KClRoZXJlZm9yZSwgSSB3b3VsZCBmYXZvciBhIHJlYWRhYmxlIHNv
bHV0aW9uIG92ZXIgYSBtaWNyby1vcHRpbWl6ZWQgCnNvbHV0aW9uIGhlcmUuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
