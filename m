Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BE863E2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvj1E-0003xf-0G; Thu, 08 Aug 2019 14:03:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvj1C-0003wh-0S
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:03:50 +0000
X-Inumbo-ID: 57b6ecc7-b9e5-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 57b6ecc7-b9e5-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:03:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E795C15A2;
 Thu,  8 Aug 2019 07:03:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C812C3F694;
 Thu,  8 Aug 2019 07:03:46 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-3-julien.grall@arm.com>
 <ae2cd958-e0ac-670a-2e2e-96cca2c9b82e@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <43a90737-7e1a-9eea-0a47-04f4be65ff46@arm.com>
Date: Thu, 8 Aug 2019 15:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ae2cd958-e0ac-670a-2e2e-96cca2c9b82e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] xen/console: Rework
 HYPERCALL_console_io interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOC8wOC8yMDE5IDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNS4wOC4yMDE5
IDE1OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEBAIC02MjcsNiArNjI5LDE1IEBAIGxvbmcg
ZG9fY29uc29sZV9pbyhpbnQgY21kLCBpbnQgY291bnQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0o
Y2hhcikgYnVmZmVyKQo+PiAgICAgICAgICAgIHJjID0gZ3Vlc3RfY29uc29sZV93cml0ZShidWZm
ZXIsIGNvdW50KTsKPj4gICAgICAgICAgICBicmVhazsKPj4gICAgICAgIGNhc2UgQ09OU09MRUlP
X3JlYWQ6Cj4+ICsgICAgICAgIC8qCj4+ICsgICAgICAgICAqIFRoZSByZXR1cm4gdmFsdWUgaXMg
ZWl0aGVyIHRoZSBudW1iZXIgb2YgY2hhcmFjdGVycyByZWFkIG9yCj4+ICsgICAgICAgICAqIGEg
bmVnYXRpdmUgdmFsdWUgaW4gY2FzZSBvZiBlcnJvci4gU28gd2UgbmVlZCB0byBwcmV2ZW50Cj4+
ICsgICAgICAgICAqIG92ZXJsYXAgYmV0d2VlbiB0aGUgdHdvIHNldHMuCj4+ICsgICAgICAgICAq
Lwo+PiArICAgICAgICByYyA9IC1FMkJJRzsKPj4gKyAgICAgICAgaWYgKCAoaW50KWNvdW50IDwg
MCApCj4+ICsgICAgICAgICAgICBicmVhazsKPiAKPiBBIG1vcmUgcG9ydGFibGUgKGFmYWljdCkg
YXBwcm9hY2ggd291bGQgYmUgdG8gY2hlY2sgYWdhaW5zdCBJTlRfTUFYLgoKSXQgd291bGQgYmUg
YmV0dGVyIHRoYW4gdGhlIGNhc3QuIEkgd2lsbCB1cGRhdGUgaXQuCgo+IEVpdGhlciB3YXkKPiBS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhhbmsgeW91IQoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
