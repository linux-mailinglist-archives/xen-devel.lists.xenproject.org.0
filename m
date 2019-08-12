Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9789990
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 11:13:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx6Lh-00055a-5r; Mon, 12 Aug 2019 09:10:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hx6Lf-00055V-PR
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 09:10:39 +0000
X-Inumbo-ID: 0c2f8044-bce1-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0c2f8044-bce1-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 09:10:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6BE9AAD35;
 Mon, 12 Aug 2019 09:10:36 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <6dc2b63127f966961aeb2a7bfe89a5cdce83241b.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ba6171d-b3a1-14e8-184b-634c5415fe35@suse.com>
Date: Mon, 12 Aug 2019 11:10:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6dc2b63127f966961aeb2a7bfe89a5cdce83241b.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/6] x86/boot: Only jump into low
 trampoline code for real-mode boot
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNzowMSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ib290L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+IEBA
IC03MzUsNyArNzM1LDE3IEBAIHRyYW1wb2xpbmVfc2V0dXA6Cj4gICAgICAgICAgLyogU3dpdGNo
IHRvIGxvdy1tZW1vcnkgc3RhY2sgd2hpY2ggbGl2ZXMgYXQgdGhlIGVuZCBvZiB0cmFtcG9saW5l
IHJlZ2lvbi4gKi8KPiAgICAgICAgICBtb3YgICAgIHN5bV9mcyh0cmFtcG9saW5lX3BoeXMpLCVl
ZGkKPiAgICAgICAgICBsZWEgICAgIFRSQU1QT0xJTkVfU1BBQ0UrVFJBTVBPTElORV9TVEFDS19T
UEFDRSglZWRpKSwlZXNwCj4gKyAgICAgICAgY21wYiAgICAkMCwgc3ltX2ZzKHNraXBfcmVhbG1v
ZGUpCj4gKyAgICAgICAganogICAgICAxZgo+ICsgICAgICAgIC8qIElmIG5vLXJlYWwtbW9kZSwg
anVtcCBzdHJhaWdodCB0byB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5ICovCj4gKyAgICAgICAg
bGVhICAgICB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5LXRyYW1wb2xpbmVfc3RhcnQoJWVkaSks
JWVheAo+ICsgICAgICAgIC8qIEVCWCA9PSAwIGluZGljYXRlcyB3ZSBhcmUgdGhlIEJQIChCb290
IFByb2Nlc3NvcikuICovCj4gKyAgICAgICAgeG9yICAgICAlZWJ4LCVlYngKPiArICAgICAgICBq
bXAgICAgIDJmCj4gKzE6Cj4gKyAgICAgICAgLyogR28gdmlhIDE2LWJpdCBjb2RlIGluIHRyYW1w
b2xpbmVfYm9vdF9jcHVfZW50cnkgKi8KPiAgICAgICAgICBsZWEgICAgIHRyYW1wb2xpbmVfYm9v
dF9jcHVfZW50cnktdHJhbXBvbGluZV9zdGFydCglZWRpKSwlZWF4Cj4gKzI6Cj4gICAgICAgICAg
cHVzaGwgICAkQk9PVF9DUzMyCj4gICAgICAgICAgcHVzaCAgICAlZWF4CgpNYXkgSSBzdWdnZXN0
IHRvIHNsaWdodGx5IHN0cmVhbWxpbmUgdGhpcyBpbnRvCgogICAgICAgICAvKiBTd2l0Y2ggdG8g
bG93LW1lbW9yeSBzdGFjayB3aGljaCBsaXZlcyBhdCB0aGUgZW5kIG9mIHRyYW1wb2xpbmUgcmVn
aW9uLiAqLwogICAgICAgICBtb3YgICAgIHN5bV9mcyh0cmFtcG9saW5lX3BoeXMpLCVlZGkKICAg
ICAgICAgbGVhICAgICBUUkFNUE9MSU5FX1NQQUNFK1RSQU1QT0xJTkVfU1RBQ0tfU1BBQ0UoJWVk
aSksJWVzcAogICAgICAgICAvKiBHbyB2aWEgMTYtYml0IGNvZGUgaW4gdHJhbXBvbGluZV9ib290
X2NwdV9lbnRyeSAqLwogICAgICAgICBsZWEgICAgIHRyYW1wb2xpbmVfYm9vdF9jcHVfZW50cnkt
dHJhbXBvbGluZV9zdGFydCglZWRpKSwlZWF4CiAgICAgICAgIGNtcGIgICAgJDAsc3ltX2ZzKHNr
aXBfcmVhbG1vZGUpCiAgICAgICAgIGplICAgICAgMWYKICAgICAgICAgLyogSWYgbm8tcmVhbC1t
b2RlLCBqdW1wIHN0cmFpZ2h0IHRvIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnkgKi8KICAgICAg
ICAgbGVhICAgICB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5LXRyYW1wb2xpbmVfc3RhcnQoJWVk
aSksJWVheAogICAgICAgICAvKiBFQlggPT0gMCBpbmRpY2F0ZXMgd2UgYXJlIHRoZSBCUCAoQm9v
dCBQcm9jZXNzb3IpLiAqLwogICAgICAgICB4b3IgICAgICVlYngsJWVieAoxOgogICAgICAgICBw
dXNobCAgICRCT09UX0NTMzIKICAgICAgICAgcHVzaCAgICAlZWF4CgpwZXJoYXBzIHdpdGggdGhl
IHNlY29uZCBzbGlnaHRseSBhZGFwdGVkIHRvIGl0IG5vdyBiZWluZyBhbiBvdmVycmlkZQpyYXRo
ZXIgdGhhbiBhbiBhbHRlcm5hdGl2ZSBwYXRoPwoKQWRkaXRpb25hbGx5IEkgdGhpbmsgaXQgd291
bGQgYmUgbmljZSBpZiB0aGUgY2xlYXJpbmcgb2YgJWVieCB3YXNuJ3QKcmVwbGljYXRlZCBoZXJl
IGFuZCAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4gKysrIGIv
eGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4gQEAgLTE5NCw5ICsxOTQsNiBAQCBnZHRf
NDg6IC53b3JkICAgNio4LTEKPiAgIAo+ICAgICAgICAgICAuY29kZTMyCj4gICB0cmFtcG9saW5l
X2Jvb3RfY3B1X2VudHJ5Ogo+IC0gICAgICAgIGNtcGIgICAgJDAsYm9vdHN5bV9yZWwoc2tpcF9y
ZWFsbW9kZSw1KQo+IC0gICAgICAgIGpueiAgICAgLkxza2lwX3JlYWxtb2RlCj4gLQo+ICAgICAg
ICAgICAvKiBMb2FkIHBzZXVkby1yZWFsLW1vZGUgc2VnbWVudHMuICovCj4gICAgICAgICAgIG1v
diAgICAgJEJPT1RfUFNFVURPUk1fRFMsJWVheAo+ICAgICAgICAgICBtb3YgICAgICVlYXgsJWRz
Cj4gQEAgLTI3Niw3ICsyNzMsNiBAQCB0cmFtcG9saW5lX2Jvb3RfY3B1X2VudHJ5Ogo+ICAgICAg
ICAgICBtb3YgICAgICVlYXgsJWdzCj4gICAgICAgICAgIG1vdiAgICAgJWVheCwlc3MKPiAgIAo+
IC0uTHNraXBfcmVhbG1vZGU6Cj4gICAgICAgICAgIC8qIEVCWCA9PSAwIGluZGljYXRlcyB3ZSBh
cmUgdGhlIEJQIChCb290IFByb2Nlc3NvcikuICovCj4gICAgICAgICAgIHhvciAgICAgJWVieCwl
ZWJ4CgouLi4gaGVyZS4gV2h5IGRvbid0IHlvdSBmdXJ0aGVyIGRvCgogICAgICAgICAuY29kZTMy
CnRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnlfYnNwOgogICAgICAgICAvKiBFQlggPT0gMCBpbmRp
Y2F0ZXMgd2UgYXJlIHRoZSBCU1AgKEJvb3QgU3RyYXAgUHJvY2Vzc29yKS4gKi8KICAgICAgICAg
eG9yICAgICAlZWJ4LCVlYngKdHJhbXBvbGluZV9wcm90bW9kZV9lbnRyeToKCmRpcmVjdGluZyB0
aGUgQlNQIHBhdGhzIHRvIHRoZSBuZXcgbGFiZWw/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
