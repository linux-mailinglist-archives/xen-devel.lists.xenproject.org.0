Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A3135B28
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 15:15:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipYYB-0006Vs-HZ; Thu, 09 Jan 2020 14:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipYY9-0006Vn-VG
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 14:12:37 +0000
X-Inumbo-ID: 11996e6a-32ea-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11996e6a-32ea-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 14:12:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39043B2F2F;
 Thu,  9 Jan 2020 14:12:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200108170040.7728-1-andrew.cooper3@citrix.com>
 <20200109115133.24176-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a4c7ce0-d16d-7f5c-4101-e218a7918551@suse.com>
Date: Thu, 9 Jan 2020 15:12:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109115133.24176-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/boot: Rationalise stack handling
 during early boot
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxMjo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgdG9wIChudW1l
cmljYWxseSBoaWdoZXIgYWRkcmVzc2VzKSBvZiBjcHUwX3N0YWNrW10gY29udGFpbnMgdGhlIEJT
UCdzCj4gY3B1X2luZm8gYmxvY2suICBMb2dpYyBpbiBYZW4gZXhwZWN0cyB0aGlzIHRvIGJlIGlu
aXRpYWxpc2VkIHRvIDAsIGJ1dCB0aGlzCj4gYXJlYSBvZiBzdGFjayBpcyBhbHNvIHVzZWQgZHVy
aW5nIGVhcmx5IGJvb3QuCj4gCj4gVXBkYXRlIHRoZSBoZWFkLlMgY29kZSB0byBhdm9pZCB1c2lu
ZyB0aGUgY3B1X2luZm8gYmxvY2suICBBZGRpdGlvbmFsbHksCj4gdXBkYXRlIHRoZSBzdGFja19z
dGFydCB2YXJpYWJsZSB0byBtYXRjaCwgd2hpY2ggYXZvaWRzIF9faGlnaF9zdGFydCgpIGFuZAo+
IGVmaV9hcmNoX3Bvc3RfZXhpdF9ib290KCkgbmVlZGluZyB0byBtYWtlIHRoZSBhZGp1c3RtZW50
IG1hbnVhbGx5Lgo+IAo+IEZpbmFsbHksIGxlYXZlIGEgYmlnIHdhcm5pbmcgYnkgdGhlIEJJT1Mg
QlNTIGluaXRpYWxpc2F0aW9uLCBiZWNhdXNlIGl0IGlzIGJ5Cj4gbm8gbWVhbnMgb2J2aW91cyB0
aGF0IHRoZSBzdGFjayBkb2Vzbid0IHN1cnZpdmUgdGhlIFJFUCBTVE9TLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
