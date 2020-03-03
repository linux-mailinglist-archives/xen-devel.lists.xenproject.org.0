Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984031776F2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 14:28:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j97Xv-0000vp-5l; Tue, 03 Mar 2020 13:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j97Xt-0000vk-VC
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 13:25:13 +0000
X-Inumbo-ID: 6912e5da-5d52-11ea-b7d4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6912e5da-5d52-11ea-b7d4-bc764e2007e4;
 Tue, 03 Mar 2020 13:25:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 714FBAFCE;
 Tue,  3 Mar 2020 13:25:11 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <316c8ebf-9cf1-53c2-98fe-03221b9ceed4@suse.com>
Date: Tue, 3 Mar 2020 14:25:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204130614.15166-3-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxNDowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVW5saWtlIHNoYWRvd19lbmFibGUoKSwgaGFw
X2VuYWJsZSgpIGNhbiBvbmx5IGJlIGNhbGxlZCBvbmNlIGR1cmluZwo+IGRvbWFpbiBjcmVhdGlv
biBhbmQgd2l0aCB0aGUgbW9kZSBlcXVhbCB0byBtb2RlIGVxdWFsIHRvCj4gUEdfZXh0ZXJuYWwg
fCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMuCj4gCj4gSWYgaXQgd2VyZSBjYWxsZWQgdHdp
Y2UsIHRoZW4gd2UgbWlnaHQgaGF2ZSBzb21ldGhpbmcgaW50ZXJlc3RpbmcKPiBwcm9ibGVtIGFz
IHRoZSBwMm0gdGFibGVzIHdvdWxkIGJlIHJlLWFsbG9jYXRlZCAoYW5kIHRoZXJlZm9yZSBhbGwg
dGhlCj4gbWFwcGluZ3Mgd291bGQgYmUgbG9zdCkuCj4gCj4gQWRkIGNvZGUgdG8gc2FuaXR5IGNo
ZWNrIHRoZSBtb2RlIGFuZCB0aGF0IHRoZSBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZAo+IG9uY2Uu
IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGFuIGlmIGNoZWNraW5nIHRoYXQgUEdfdHJhbnNsYXRl
IGlzIHNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24u
Y29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KcHJlZmVyYWJs
eSB3aXRoIHRoZSBkdXBsaWNhdGUgd29yZHMgb24gdGhlIHNlY29uZCBsaW5lIG9mIHRoZSBkZXNj
cmlwdGlvbgpkcm9wcGVkLgoKPiBJIGtlZXAgdGhlIGNoZWNrICE9IDAgYmVjYXVzZSB0aGlzIGlz
IGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGUKPiBmaWxlLiBJZiB3ZSB3YW50IHRvIG9t
aXQgY29tcGFyaXNvbiBhZ2FpbnN0IDAsIHRoZW4gdGhpcyBzaG91bGQgYmUgaW4gYQo+IHNlcGFy
YXRlIHBhdGNoZXMgY29udmVydGluZyB0aGUgZmlsZS4KCkkgZGlzYWdyZWUsIGJ1dCBub3QgZW5v
dWdoIHRvIG1ha2UgdGhlIGFjayBkZXBlbmRlbnQgdXBvbiB0aGUgYWRqdXN0bWVudC4KCj4gLS0t
IGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAv
aGFwLmMKPiBAQCAtNDQ1LDYgKzQ0NSwxMyBAQCBpbnQgaGFwX2VuYWJsZShzdHJ1Y3QgZG9tYWlu
ICpkLCB1MzIgbW9kZSkKPiAgICAgIHVuc2lnbmVkIGludCBpOwo+ICAgICAgaW50IHJ2ID0gMDsK
PiAgCj4gKyAgICBpZiAoIG1vZGUgIT0gKFBHX2V4dGVybmFsIHwgUEdfdHJhbnNsYXRlIHwgUEdf
cmVmY291bnRzKSApCj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgLyogVGhl
IGZ1bmN0aW9uIGNhbiBvbmx5IGJlIGNhbGxlZCBvbmNlICovCj4gKyAgICBpZiAoIGQtPmFyY2gu
cGFnaW5nLm1vZGUgIT0gMCApCj4gKyAgICAgICAgcmV0dXJuIC1FRVhJU1Q7CgpJIHRoaW5rIGlm
IHN1Y2ggYSBjb21tZW50IGdldHMgYWRkZWQsIGl0IHNob3VsZCBiZSB1bmFtYmlndW91cy4gVGhl
CmZ1bmN0aW9uIGNhbiBiZSBjYWxsZWQgb25jZSBwZXIgZG9tYWluLCBub3QganVzdCBvbmNlIGlu
IHRvdGFsLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
