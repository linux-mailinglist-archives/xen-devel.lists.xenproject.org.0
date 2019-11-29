Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B85110D813
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:48:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaiTK-000308-OC; Fri, 29 Nov 2019 15:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaiTJ-0002zu-Ci
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:46:17 +0000
X-Inumbo-ID: 611df06e-12bf-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 611df06e-12bf-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 15:46:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4BF44B28F;
 Fri, 29 Nov 2019 15:46:16 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20191129134306.2738-1-pdurrant@amazon.com>
 <20191129134306.2738-2-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <82ff3fdf-b6f6-656d-4638-3b9f0a264fab@suse.com>
Date: Fri, 29 Nov 2019 16:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191129134306.2738-2-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/xenbus: reference count
 registered modules
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTQ6NDMsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUbyBwcmV2ZW50IGEgbW9k
dWxlIGJlaW5nIHJlbW92ZWQgd2hpbHN0IGF0dGFjaGVkIHRvIGEgZnJvbnRlbmQsIGFuZAo+IGhl
bmNlIHhlbmJ1cyBjYWxsaW5nIGludG8gcG90ZW50aWFsbHkgaW52YWxpZCB0ZXh0LCB0YWtlIGEg
cmVmZXJlbmNlIG9uCj4gdGhlIG1vZHVsZSBiZWZvcmUgY2FsbGluZyB0aGUgcHJvYmUoKSBtZXRo
b2QgKGRyb3BwaW5nIGl0IGlmIHVuc3VjY2Vzc2Z1bCkKPiBhbmQgZHJvcCB0aGUgcmVmZXJlbmNl
IGFmdGVyIHJldHVybmluZyBmcm9tIHRoZSByZW1vdmUoKSBtZXRob2QuCj4gCj4gTk9URTogVGhp
cyBhbGxvd3MgdGhlIGFkLWhvYyByZWZlcmVuY2UgY291bnRpbmcgaW4geGVuLW5ldGJhY2sgdG8g
YmUKPiAgICAgICAgcmVtb3ZlZC4gVGhpcyB3aWxsIGJlIGRvbmUgaW4gYSBzdWJzZXF1ZW50IHBh
dGNoLgo+IAo+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KClJldmll
d2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
