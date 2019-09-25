Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCCCBE116
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:20:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD94D-0004g4-3E; Wed, 25 Sep 2019 15:18:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD94B-0004fk-De
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:18:55 +0000
X-Inumbo-ID: c8cf762e-dfa7-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c8cf762e-dfa7-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 15:18:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB526B696;
 Wed, 25 Sep 2019 15:18:52 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-18-jgross@suse.com>
 <40b365e4e16ef9828d7c7c73cdac7ed0527c0ead.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <46feaecc-a41f-72f2-c51e-eeebe55f6cee@suse.com>
Date: Wed, 25 Sep 2019 17:18:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <40b365e4e16ef9828d7c7c73cdac7ed0527c0ead.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 17/47] xen/sched: make credit2 scheduler
 vcpu agnostic.
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTc6MDIsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFNhdCwgMjAxOS0w
OS0xNCBhdCAxMDo1MiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gU3dpdGNoIGNyZWRp
dDIgc2NoZWR1bGVyIGNvbXBsZXRlbHkgZnJvbSB2Y3B1IHRvIHNjaGVkX3VuaXQgdXNhZ2UuCj4+
Cj4+IEFzIHdlIGFyZSB0b3VjaGluZyBsb3RzIG9mIGxpbmVzIHJlbW92ZSBzb21lIHdoaXRlIHNw
YWNlIGF0IHRoZSBlbmQKPj4gb2YKPj4gdGhlIGxpbmUsIHRvby4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+IFJldmlld2VkLWJ5OiBEYXJp
byBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IAo+IEkgZGlkIHNwb3QgYW5vdGhlciAn
aXRlbScgdGhhdCB3YW50cyB0byBiZSB0dXJuZWQgaW50by4uLgo+IAo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwo+
PiBpbmRleCBhNjA4MzI4OWY2Li4wZDFiYTk3ZGJjIDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdDIuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwo+PiAg
IAo+PiBAQCAtNTEwLDIwICs1MTAsMjAgQEAgc3RydWN0IGNzY2hlZDJfcGNwdSB7Cj4+ICAgfTsK
Pj4gICAKPj4gICAvKgo+PiAtICogVmlydHVhbCBDUFUKPj4gKyAqIFNjaGVkdWxlIEl0ZW0KPj4g
ICAgKi8KPj4KPiAuLi4gJ3VuaXQnLiAgOi0pCgpZZXMsIHRoYXQgd2FzIHRoZSB0ZXN0IHdoZXRo
ZXIgdGhlIHJldmlldyBpcyBkb25lIHRob3JvdWdobHkuIDstKQoKVGhhbmtzIQoKCkp1ZXJnZW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
