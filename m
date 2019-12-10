Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F66118A4C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 15:01:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieg1K-0001J4-Fp; Tue, 10 Dec 2019 13:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieg1J-0001Iz-2Y
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 13:57:45 +0000
X-Inumbo-ID: 09adc52c-1b55-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09adc52c-1b55-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 13:57:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 472CEAD6C;
 Tue, 10 Dec 2019 13:57:43 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
 <1042aef4-c873-6cf9-c7b4-cca1214d61af@suse.com>
 <df136147-76f4-841c-9f3e-2700fb856405@suse.com>
 <74022d78-e4b4-11e2-95bc-7986fe2cb76e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc867c90-baf3-a678-ee02-ea46d5815e91@suse.com>
Date: Tue, 10 Dec 2019 14:58:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <74022d78-e4b4-11e2-95bc-7986fe2cb76e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/AMD: unbreak CPU hotplug on AMD
 systems without RstrFpErrPtrs
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxMzozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8xMi8yMDE5
IDEwOjI2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAxMC4xMi4xOSAxMToxMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNC4xMi4yMDE5IDAwOjU2LCBJZ29yIERydXpoaW5pbiB3cm90
ZToKPj4+PiBJZiB0aGUgZmVhdHVyZSBpcyBub3QgcHJlc2VudCBYZW4gd2lsbCB0cnkgdG8gZm9y
Y2UgWDg2X0JVR19GUFVfUFRSUwo+Pj4+IGZlYXR1cmUgYXQgQ1BVIGlkZW50aWZpY2F0aW9uIHRp
bWUuIFRoaXMgaXMgZXNwZWNpYWxseSBub3RpY2VhYmxlIGluCj4+Pj4gUFYtc2hpbSB0aGF0IHVz
dWFsbHkgaG90cGx1Z3MgaXRzIHZDUFVzLiBXZSBlaXRoZXIgbmVlZCB0byByZXN0cmljdAo+Pj4+
IHRoaXMKPj4+PiBhY3Rpb24gZm9yIGJvb3QgQ1BVIG9ubHkgb3IgYWxsb3cgc2Vjb25kYXJ5IENQ
VXMgdG8gbW9kaWZ5Cj4+Pj4gZm9yY2VkIENQVSBjYXBhYmlsaXRpZXMgYXQgcnVudGltZS4gQ2hv
b3NlIHRoZSBmb3JtZXIgc2luY2UgbW9kaWZ5aW5nCj4+Pj4gZm9yY2VkIGNhcGFiaWxpdGllcyBv
dXQgb2YgYm9vdCBwYXRoIGxlYXZlcyB0aGUgc3lzdGVtIGluIHBvdGVudGlhbGx5Cj4+Pj4gaW5j
b25zaXN0ZW50IHN0YXRlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4g
PGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+Pgo+Pj4gSSd2ZSBjb21taXR0ZWQgdGhpcyB0
byB1bnN0YWJsZSwgYXMgcGVyIHRoZSBvdXRjb21lIG9mIHRoZQo+Pj4gY29tbXVuaXR5IGNhbGwu
Cj4gCj4gV2hhdCBvdXRjb21lP8KgIFllcyB0ZWNobmljYWxseSB5b3VyIFItYnkgaXMgc3VmZmlj
aWVudCB0byBnZXQgdGhlIHBhdGNoCj4gaW4sIGJ1dCB5b3Uga25vdyB2ZXJ5IHdlbGwgdGhlcmUg
YXJlIG9wZW4gb2JqZWN0aW9ucyBhZ2FpbnN0IHRoaXMKPiB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4K
Ck15IHByb3Bvc2FsIG9uIHRoZSBjYWxsIHdhcyB0byBnbyB3aXRoIHRoZSBleGlzdGluZyBwYXRj
aCwgYW5kIGltcHJvdmUKZnJvbSB0aGVyZS4gVGhlcmUgd2Fzbid0IGdyZWF0IGVudGh1c2lhc20s
IGJ1dCB0aGVyZSB3YXMgYWdyZWVtZW50IHRoYXQKdGhpcyBpcyB0aGUgbW9zdCBwcmFnbWF0aWMg
cm91dGUgdG8gZm9sbG93LiBJbiBwYXJ0aWN1bGFyIEkgZG9uJ3QKcmVjYWxsIHlvdSB2b2ljaW5n
IGFueSBvYmplY3Rpb24gdG8gdGhpcyBvbiB0aGUgY2FsbCAoSSBkbyB2ZXJ5IHdlbGwKcmVjYWxs
IHRoZSBvYmplY3Rpb24geW91IHZvaWNlZCBlYXJsaWVyIG9uLCB3aGljaCBJIGhhZCByZXNwb25k
ZWQgdG8Kd2l0aCBhIHN1Z2dlc3Rpb24gb2YgYSBzbGlnaHRseSBkaWZmZXJlbnQgYXBwcm9hY2gs
IHRha2luZyBjYXJlIFtJCnRoaW5rXSBvZiB5b3VyIHdpc2hlcyBhcyB3ZWxsIGFzIG1pbmUpLgoK
PiBBbHNvLCB5b3UncmUgYWN0dWFsbHkgaW4gYSBwb3NpdGlvbiB3aGVyZSB5b3UgYXJlIHJldmll
d2luZyB5b3VyIG93bgo+IHdvcmssIHdoaWNoIGlzIG5vdCBob3cgUi1ieSBpcyBpbnRlbmRlZCB0
byB3b3JrLgoKV2hpY2ggb3duIHdvcms/IFRoZSBwYXRjaCBkb2Vzbid0IGV2ZW4gY2FycnkgYSBT
dWdnZXN0ZWQtYnkuIElpcmMKSWdvciB0b2xkIG1lIHRoYXQgd2hhdCBoYXMgZ29uZSBpbiBpcyBo
b3cgaGUgaGFkIGl0IGluaXRpYWxseS4gU28KSSdtIHByZXR0eSBjb25mdXNlZCBieSB0aGlzIHN0
YXRlbWVudCBvZiB5b3Vycy4KCkZ1cnRoZXJtb3JlLCBhcyBhIHJlY3VycmluZyBwYXR0ZXJuLCBz
aW1wbHkgbm90IHJlc3BvbmRpbmcgdG8gb25nb2luZwpkaXNjdXNzaW9ucyBzaG91bGQgbm90LCBp
biB0aGUgY29tbW9uIGNhc2UsIGxlYWQgdG8gbm8gcHJvZ3Jlc3MgYXQKYWxsLiBJaXJjIHRoaXMg
d2FzIGFsc28gbWVudGlvbmVkIG9uIHRoZSBjYWxsICgibGF6eSBjb25zZW5zdXMiKS4KCj4gRnVy
dGhlcm1vcmUsIHlvdSB3aWxsIG9ic2VydmUgdGhhdCB0aGVyZSBpcyBhbiBhY3Rpb24gaXRlbSBv
biBtZSBmcm9tCj4gdGhlIGNhbGwgdG8gY29tZSB1cCB3aXRoIGEgbGVzcyBicm9rZW4gYWx0ZXJu
YXRpdmUgd2hpY2ggSSdtIGdlbnVpbmVseQo+IGF0dGVtcHRpbmcgdG8gZG8uCgpUaGVyZSdzIG5v
IGluZGljYXRpb24gdG93YXJkcyB0aGlzIGluIHRoZSBtaW51dGVzLCBhZmFpY3MuIE9yIHdhaXQK
LSB0aGUgc2FtZSB0b3BpYyBhcHBlYXJzIHR3aWNlIHRoZXJlIChhcyBib3RoIDQgYW5kIDYpLiBJ
IHdhc24ndApldmVuIGF3YXJlIG9mIHN1Y2ggYW4gYWN0aW9uIGl0ZW0uIEknbGwgYmUgaGFwcHkg
dG8gcmV2ZXJ0IGlmIHlvdQppbmRpY2F0ZSBzbywgYW5kIGlmIGEgYmV0dGVyIGZpeCBpcyBnb2lu
ZyB0byBzaG93IHVwIGluIHRpbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
