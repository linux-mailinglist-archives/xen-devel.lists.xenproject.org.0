Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4556177C2E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 17:43:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9AbO-0003s3-Ir; Tue, 03 Mar 2020 16:41:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9AbM-0003ry-Ou
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:41:00 +0000
X-Inumbo-ID: c324e7ce-5d6d-11ea-8efe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c324e7ce-5d6d-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 16:41:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DA75AB04C;
 Tue,  3 Mar 2020 16:40:58 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200303123058.27210-1-jgross@suse.com>
 <c1bea0c8-3dc8-ede3-eb63-ca601b6d2d91@suse.com>
 <c8946349-ae40-fe58-26a8-c1bc918ddc82@suse.com>
 <79bdd397-4c90-fe07-5d10-a62d193c2c83@suse.com>
 <95548aca-d49f-e29a-3314-dd98293ab990@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a664aeb2-017f-a579-77b4-b07954fd291a@suse.com>
Date: Tue, 3 Mar 2020 17:40:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <95548aca-d49f-e29a-3314-dd98293ab990@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix cpu offlining with core
 scheduling
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAgMTc6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjAzLjIwMjAgMTc6
MjAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDAzLjAzLjIwIDE3OjA1LCBKw7xyZ2VuIEdy
b8OfIHdyb3RlOgo+Pj4gT24gMDMuMDMuMjAgMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
IE9uIDAzLjAzLjIwMjAgMTM6MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IEBAIC0yNTM4
LDcgKzI1NTIsMTAgQEAgc3RhdGljIHZvaWQgc2NoZWRfc2xhdmUodm9pZCkKPj4+Pj4gIMKgwqDC
oMKgwqAgbmV4dCA9IHNjaGVkX3dhaXRfcmVuZGV6dm91c19pbihwcmV2LCAmbG9jaywgY3B1LCBu
b3cpOwo+Pj4+PiAgwqDCoMKgwqDCoCBpZiAoICFuZXh0ICkKPj4+Pj4gK8KgwqDCoCB7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKPj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Cj4+Pj4g
VGhpcyBhbmQgLi4uCj4+Pj4KPj4+Pj4gQEAgLTI1OTksNyArMjYxNiwxMCBAQCBzdGF0aWMgdm9p
ZCBzY2hlZHVsZSh2b2lkKQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGNwdW1hc2tfcmFpc2Vf
c29mdGlycShtYXNrLCBTQ0hFRF9TTEFWRV9TT0ZUSVJRKTsKPj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCBuZXh0ID0gc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKHByZXYsICZsb2NrLCBjcHUsIG5v
dyk7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCAhbmV4dCApCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjdV9yZWFkX3VubG9jaygm
c2NoZWRfcmVzX3JjdWxvY2spOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Cj4+Pj4gLi4uIHRoaXMgbG9vayBsaWtl
IGluZGVwZW5kZW50IGZpeGVzLCBhcyBvbiBBcm0sCj4+Pj4gc2NoZWRfd2FpdF9yZW5kZXp2b3Vz
X2luKCkgY2FuIGFscmVhZHkgcmV0dXJuIE5VTEwuIElmIHRoZXkgZ2V0Cj4+Pj4gZm9sZGVkIGlu
dG8gaGVyZSwgSSB0aGluayB0aGUgZGVzY3JpcHRpb24gc2hvdWxkIGNsYXJpZnkgdGhhdAo+Pj4+
IHRoZXNlIGFyZSBvcnRob2dvbmFsIHRvIHRoZSByZXN0Lgo+Pj4KPj4+IFllYWgsIHByb2JhYmx5
IGJldHRlciB0byBzcGxpdCB0aGUgcGF0Y2guCj4+Cj4+IE9oLCB0aGlzIHBhdGNoIHdhcyB3cm9u
ZzogVXAgdG8gbm93IHNjaGVkX3dhaXRfcmVuZGV6dm91c19pbigpIGFsd2F5cwo+PiB3YXMgcmVz
cG9uc2libGUgZm9yIGRyb3BwaW5nIHNjaGVkX3Jlc19yY3Vsb2NrLCBzbyBJIHNob3VsZCBkbyB0
aGF0IGluCj4+IHRoZSBuZXcgTlVMTCByZXR1cm4gY2FzZSwgdG9vLgo+IAo+IE9oLCB0aHJvdWdo
IGNhbGxpbmcgb2Ygc2NoZWRfY29udGV4dF9zd2l0Y2goKS4gSSBndWVzcyBib3RoIGZ1bmN0aW9u
cwo+IHdhbnQgdG8gZ2FpbiBhIGNvbW1lbnQgYWJvdXQgdGhpcyBhc3BlY3Qgb2YgdGhlaXIgYmVo
YXZpb3IuCgpZZXMsIGFscmVhZHkgZG9uZS4gOi0pCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
