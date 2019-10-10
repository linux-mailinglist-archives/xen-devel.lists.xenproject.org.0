Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9562D2D00
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 16:54:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIZk6-0003Ss-Q4; Thu, 10 Oct 2019 14:48:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIZk6-0003Sl-0E
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 14:48:38 +0000
X-Inumbo-ID: 0a6b9da8-eb6d-11e9-931d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a6b9da8-eb6d-11e9-931d-12813bfff9fa;
 Thu, 10 Oct 2019 14:48:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB517337;
 Thu, 10 Oct 2019 07:48:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FE683F6C4;
 Thu, 10 Oct 2019 07:48:36 -0700 (PDT)
To: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191004164243.30822-1-julien.grall@arm.com>
 <f262a8aeb67c6aabde80b1e6cdae6f19c077ff11.camel@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5281ebd9-cc7e-64b4-3c88-3eaee64d3457@arm.com>
Date: Thu, 10 Oct 2019 15:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f262a8aeb67c6aabde80b1e6cdae6f19c077ff11.camel@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>, "paul@xen.org" <paul@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOS8xMC8yMDE5IDEyOjU3LCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+IEhpIEp1bGllbgoK
SGksCgo+IE9uIEZyaSwgMjAxOS0xMC0wNCBhdCAxNzo0MiArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+PiBmbGFza19hc3NpZ25feywgZHR9ZGV2aWNlKCkgbWF5IGJlIHVzZWQgdG8gY2hlY2sg
d2hldGhlciB5b3UgY2FuIHRlc3QKPj4gaWYKPj4gYSBkZXZpY2UgaXMgYXNzaWduZWQuIEluIHRo
aXMgY2FzZSwgdGhlIGRvbWFpbiB3aWxsIGJlIE5VTEwuCj4+Cj4+IEhvd2V2ZXIsIGZsYXNrX2lv
bW11X3Jlc291cmNlX3VzZV9wZXJtKCkgd2lsbCBiZSBjYWxsZWQgYW5kIG1heSBlbmQKPj4gdXAK
Pj4gdG8gZGVmZXJlbmNlIGEgTlVMTCBwb2ludGVyLiBUaGlzIGNhbiBiZSBwcmV2ZW50ZWQgYnkg
bW92aW5nIHRoZSBjYWxsCj4+IGFmdGVyIHdlIGNoZWNrIHRoZSB2YWxpZGl0eSBmb3IgdGhlIGRv
bWFpbiBwb2ludGVyLgo+Pgo+PiBDb3Zlcml0eS1JRDogMTQ4Njc0MQo+IAo+IFRoZSBjb3JyZWN0
IENJRCBpcyAxNDg2NzQyCgpIbW1tIHllcy4gVGhlIGNvdmVyaXR5IHJlcG9ydCBlLW1haWwgaXMg
YSBiaXQgY29uZnVzaW5nIHRvIHJlYWQuCgpIb3dldmVyLCBJIGhhdmUgYWxyZWFkeSBjb21taXR0
ZWQgdGhlIHBhdGNoIHNvIHdlIHdpbGwgaGF2ZSB0byBsZWF2ZSB3aXRoIGl0IDooLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
