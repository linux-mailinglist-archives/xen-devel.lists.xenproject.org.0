Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188F2ADB4E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:38:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Klb-00029g-2C; Mon, 09 Sep 2019 14:35:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7KlZ-00029a-Ue
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:35:41 +0000
X-Inumbo-ID: 18cdee80-d30f-11e9-ac0d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18cdee80-d30f-11e9-ac0d-12813bfff9fa;
 Mon, 09 Sep 2019 14:35:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 26B90AE49;
 Mon,  9 Sep 2019 14:35:40 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-23-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61e63336-affb-ca2b-944a-a6cb8e3c2862@suse.com>
Date: Mon, 9 Sep 2019 16:35:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-23-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 22/48] xen/sched: switch schedule() from
 vcpus to sched_units
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMjQ4LDYg
KzI0OCwyMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UoCj4gICAg
ICB2LT5ydW5zdGF0ZS5zdGF0ZSA9IG5ld19zdGF0ZTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGlu
ZSB2b2lkIHNjaGVkX3VuaXRfcnVuc3RhdGVfY2hhbmdlKHN0cnVjdCBzY2hlZF91bml0ICp1bml0
LAo+ICsgICAgYm9vbCBydW5uaW5nLCBzX3RpbWVfdCBuZXdfZW50cnlfdGltZSkKPiArewo+ICsg
ICAgc3RydWN0IHZjcHUgKnYgPSB1bml0LT52Y3B1X2xpc3Q7Cj4gKwo+ICsgICAgaWYgKCBydW5u
aW5nICkKPiArICAgICAgICB2Y3B1X3J1bnN0YXRlX2NoYW5nZSh2LCBSVU5TVEFURV9ydW5uaW5n
LCBuZXdfZW50cnlfdGltZSk7Cj4gKyAgICBlbHNlCj4gKyAgICAgICAgdmNwdV9ydW5zdGF0ZV9j
aGFuZ2UodiwKPiArICAgICAgICAgICAgKCh2LT5wYXVzZV9mbGFncyAmIFZQRl9ibG9ja2VkKSA/
IFJVTlNUQVRFX2Jsb2NrZWQgOgo+ICsgICAgICAgICAgICAgKHZjcHVfcnVubmFibGUodikgPyBS
VU5TVEFURV9ydW5uYWJsZSA6IFJVTlNUQVRFX29mZmxpbmUpKSwKPiArICAgICAgICAgICAgbmV3
X2VudHJ5X3RpbWUpOwo+ICt9CgpJIGZpbmQgaXQgcHV6emxpbmcgdGhhdCB0aGlzIGdldHMgaW50
cm9kdWNlZCwgYnV0IHdvbid0IHN1cnZpdmUgdGlsbAp0aGUgZW5kIG9mIHRoZSBzZXJpZXMuIEkg
Y2FuIG9ubHkgZ3Vlc3MgdGhhdCB5b3UgY2FuJ3QgZG8gd2l0aG91dCB0aGUKc2VwYXJhdGlvbiBp
bnRlcm1lZGlhdGVseS4gTWFraW5nIHN1Y2ggdHJhbnNpZW50IHN0YXRlIG1vcmUgYXBwYXJlbnQK
ZnJvbSB0aGUgZGVzY3JpcHRpb24gd291bGQgYmUgbmljZSBpbW8uCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
