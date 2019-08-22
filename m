Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B87990ED
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 12:34:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0kNd-0000f4-6W; Thu, 22 Aug 2019 10:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r9la=WS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0kNc-0000es-I3
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 10:31:44 +0000
X-Inumbo-ID: 0805b4f2-c4c8-11e9-b95f-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0805b4f2-c4c8-11e9-b95f-bc764e2007e4;
 Thu, 22 Aug 2019 10:31:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B01C115AD;
 Thu, 22 Aug 2019 03:31:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 080903F246;
 Thu, 22 Aug 2019 03:31:39 -0700 (PDT)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-11-wipawel@amazon.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ad165593-d59d-5789-cbe6-8e797ba68a9b@arm.com>
Date: Thu, 22 Aug 2019 11:31:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-11-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/14] livepatch: Add support for inline asm
 hotpatching expectations
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF3ZWwsCgpPbiAyMS8wOC8yMDE5IDA5OjE5LCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90
ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIGIveGVuL2luY2x1
ZGUvcHVibGljL3N5c2N0bC5oCj4gaW5kZXggYjU1YWQ2ZDA1MC4uZTE4MzIyMzUwZCAxMDA2NDQK
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPiArKysgYi94ZW4vaW5jbHVkZS9w
dWJsaWMvc3lzY3RsLmgKPiBAQCAtODE4LDcgKzgxOCw3IEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2Nw
dV9mZWF0dXJlc2V0IHsKPiAgICAqICAgICBJZiB6ZXJvIGV4aXQgd2l0aCBzdWNjZXNzLgo+ICAg
ICovCj4gICAKPiAtI2RlZmluZSBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9OIDIKPiArI2RlZmlu
ZSBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9OIDMKCldlIHVzdWFsbHkgb25seSBidW1wIHRoZSB2
ZXJzaW9uIG9uY2UgcGVyIHJlbGVhc2UuIFNvIHRoaXMgaXMgdW5uZWNlc3NhcnkgYXMgeW91IAph
bHJlYWR5IGRpZCBpdCBpbiB0aGUgcHJldmlvdXMgcGF0Y2guCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
