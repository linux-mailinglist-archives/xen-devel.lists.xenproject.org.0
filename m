Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E10D0C4D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:11:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI8tq-00080A-Se; Wed, 09 Oct 2019 10:08:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI8to-000805-Fq
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:08:52 +0000
X-Inumbo-ID: ca179702-ea7c-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca179702-ea7c-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 10:08:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5BF75AE48;
 Wed,  9 Oct 2019 10:08:49 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191009090539.2141-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41262e54-44ac-4a31-21d4-83ed8a63eb8f@suse.com>
Date: Wed, 9 Oct 2019 12:08:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009090539.2141-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/passthrough: fix migration of
 MSI when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joe Jin <joe.jin@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxMTowNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC00MTEsNiAr
NDExLDcgQEAgaW50IHB0X2lycV9jcmVhdGVfYmluZCgKPiAgCj4gICAgICAgICAgICAgICAgICBw
aXJxX2RwY2ktPmdtc2kuZ3ZlYyA9IHB0X2lycV9iaW5kLT51Lm1zaS5ndmVjOwo+ICAgICAgICAg
ICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmdmbGFncyA9IGdmbGFnczsKPiArICAgICAgICAgICAg
ICAgIHByZXZfdmNwdV9pZCA9IHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQ7CgpJZiB0aGlz
IGFuZCAuLi4KCj4gQEAgLTQ0MCw3ICs0NDEsOCBAQCBpbnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAo+
ICAgICAgICAgIC8qIFVzZSBpbnRlcnJ1cHQgcG9zdGluZyBpZiBpdCBpcyBzdXBwb3J0ZWQuICov
Cj4gICAgICAgICAgaWYgKCBpb21tdV9pbnRwb3N0ICkKPiAgICAgICAgICAgICAgcGlfdXBkYXRl
X2lydGUodmNwdSA/ICZ2Y3B1LT5hcmNoLmh2bS52bXgucGlfZGVzYyA6IE5VTEwsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGluZm8sIHBpcnFfZHBjaS0+Z21zaS5ndmVjKTsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW5mbywgcGlycV9kcGNpLT5nbXNpLmd2ZWMsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHByZXZfdmNwdV9pZCA+PSAwID8gZC0+dmNwdVtwcmV2
X3ZjcHVfaWRdIDogTlVMTCk7CgouLi4gdGhpcyBhcmUgdG8gYmUgcmVsaWFibGUsIHRoZW4gLSBh
cyBleHBsYWluZWQgdG8gSm9lIGFscmVhZHkKaW4gdGhlIGVhcmxpZXIgZGlzY3Vzc2lvbiAtIEkg
dGhpbmsgeW91IG5lZWQgdG8gdXBkYXRlCnBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQgaW4g
YSBjb2RlIHNlY3Rpb24gYSBmZXcgbGluZXMgdXAKZnJvbSBoZXJlIChzdWNoIHRoYXQgaXQgd291
bGQgYmUgcmVsaWFibGUgdGhlIG5leHQgdGltZSB3ZSBjb21lCmhlcmUpIGxpa2UgdGhpczoKCkBA
IC14eHgsNyAreXl5LDEwIEBACiAgICAgICAgICAgICAgICAgdmNwdSA9IHZlY3Rvcl9oYXNoaW5n
X2Rlc3QoZCwgZGVzdCwgZGVzdF9tb2RlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5ndmVjKTsKICAgICAgICAgICAgIGlmICggdmNw
dSApCisgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLnBvc3Rl
ZCA9IHRydWU7CisgICAgICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNwdV9pZCA9
IHZjcHUtPnZjcHVfaWQ7CisgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICAgICAgaWYgKCB2
Y3B1ICYmIGlzX2lvbW11X2VuYWJsZWQoZCkgKQogICAgICAgICAgICAgaHZtX21pZ3JhdGVfcGly
cShwaXJxX2RwY2ksIHZjcHUpOwoKVGhpcyBvdWdodCB0byBiZSBmaW5lIGJlY2F1c2Ugc28gZmFy
IC5kZXN0X3ZjcHVfaWQgaGFzIGEgY29uc3VtZXIKb25seSBpbiB0aGUgbm9uLXBvc3RlZCBjYXNl
IChpbiBodm1fbWlncmF0ZV9waXJxKCkpLgoKQ29uc2lkZXJpbmcgdGhhdCBodm1fZ2lycV9kZXN0
XzJfdmNwdV9pZCgpIGlzbid0IHJlYWxseSBpbmV4cGVuc2l2ZSwKc3Vic2VxdWVudCBjbGVhbnVw
IG1heSB0aGVuIGludm9sdmUgYXZvaWRpbmcgdG8gY2FsbCB0aGlzIGZ1bmN0aW9uCmlmIHdlJ2Qg
b3ZlcndyaXRlIC5kZXN0X3ZjcHVfaWQgYXMgcGVyIGFib3ZlIGFueXdheS4KCj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2ludHJlbWFwLmMKPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYwo+IEBAIC05NDYsMTIgKzk0NiwxMyBAQCB2b2lkIGlu
dGVsX2lvbW11X2Rpc2FibGVfZWltKHZvaWQpCj4gICAgICAgICAgZGlzYWJsZV9xaW52YWwoZHJo
ZC0+aW9tbXUpOwo+ICB9Cj4gIAo+ICsjaWYgQ09ORklHX0hWTQoKI2lmZGVmIHBsZWFzZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
