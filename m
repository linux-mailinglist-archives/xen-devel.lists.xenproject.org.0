Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE110D563
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:05:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaezE-0002kF-NO; Fri, 29 Nov 2019 12:03:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaezD-0002k7-EZ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:02:59 +0000
X-Inumbo-ID: 2f554cfe-12a0-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f554cfe-12a0-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 12:02:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 52937ACC4;
 Fri, 29 Nov 2019 12:02:58 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <99d9e737-53be-7add-cb5c-b29bd674459d@suse.com>
Date: Fri, 29 Nov 2019 13:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTE6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSBzd2l0Y2ggb2YgZ3Vl
c3RfY29uc29sZV93cml0ZSgpJ3Mgc2Vjb25kIHBhcmFtZXRlciBmcm9tIHBsYWluIHRvCj4gdW5z
aWduZWQgaW50IGhhcyBjYXVzZWQgdGhlIGZ1bmN0aW9uJ3MgbWFpbiBsb29wIGhlYWRlciB0byBu
byBsb25nZXIKPiBndWFyZCB0aGUgbWluX3QoKSB1c2Ugd2l0aGluIHRoZSBmdW5jdGlvbiBhZ2Fp
bnN0IGVmZmVjdGl2ZWx5IG5lZ2F0aXZlCj4gdmFsdWVzLCBkdWUgdG8gdGhlIGNhc3RzIGhpZGRl
biBpbnNpZGUgdGhlIG1hY3JvLiBSZXBsYWNlIGJ5IGEgcGxhaW4KPiBtaW4oKSwgY29udmVydGlu
ZyBvbmUgb2YgdGhlIGFyZ3VtZW50cyBzdWl0YWJseSB3aXRob3V0IGludm9sdmluZyBhbnkKPiBj
YXN0Lgo+IAo+IEZpeGVzOiBlYTYwMWVjOTk5NWIgKCJ4ZW4vY29uc29sZTogUmV3b3JrIEhZUEVS
Q0FMTF9jb25zb2xlX2lvIGludGVyZmFjZSIpCj4gUmVwb3J0ZWQtYnk6IElsamEgVmFuIFNwcnVu
ZGVsIDxpdmFuc3BydW5kZWxAaW9hY3RpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
