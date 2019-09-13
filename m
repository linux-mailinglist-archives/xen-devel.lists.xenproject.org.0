Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F41B1B09
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 11:43:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8i4N-00020m-Ap; Fri, 13 Sep 2019 09:40:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8i4M-00020h-1b
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 09:40:46 +0000
X-Inumbo-ID: 8edd1c10-d60a-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8edd1c10-d60a-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 09:40:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2EC5AAF59;
 Fri, 13 Sep 2019 09:40:44 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-27-jgross@suse.com>
 <53f10944-0c99-f5f1-1eff-f1f240dceee4@suse.com>
 <bd2874b1-e10e-2066-8a3f-5788c796479f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f47cfa3f-6bb8-2044-9074-05d1830a7e1b@suse.com>
Date: Fri, 13 Sep 2019 11:40:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bd2874b1-e10e-2066-8a3f-5788c796479f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 26/48] xen/sched: rework and rename
 vcpu_force_reschedule()
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxMTozMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMC4wOS4xOSAx
NjowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoKSBpcyBvbmx5IHVzZWQgZm9y
IG1vZGlmeWluZyB0aGUgcGVyaW9kaWMgdGltZXIKPj4+IG9mIGEgdmNwdS4KPj4KPj4gSSBkb24n
dCB0aGluayB0aGlzIGlzIHRydWUgcHJpb3IgdG8gdGhpcyBwYXRjaCwgb3IgZWxzZSAuLi4KPj4K
Pj4+IEBAIC00MTksOCArNDE5LDYgQEAgaW50IHB2X3NoaW1fc2h1dGRvd24odWludDhfdCByZWFz
b24pCj4+PiAgIAo+Pj4gICAgICAgICAgIGlmICggdiAhPSBjdXJyZW50ICkKPj4+ICAgICAgICAg
ICAgICAgdmNwdV91bnBhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIodik7Cj4+PiAtICAgICAgICBl
bHNlCj4+PiAtICAgICAgICAgICAgdmNwdV9mb3JjZV9yZXNjaGVkdWxlKHYpOwo+Pgo+PiAuLi4g
dGhlcmUgd291bGRuJ3QgYmUgdGhpcyBkZWxldGlvbiBvZiBjb2RlLiBXaXRob3V0IGZ1cnRoZXIK
Pj4gZXhwbGFuYXRpb24gaXQncyB1bmNsZWFyIHRvIG1lIHdoZXRoZXIgdGhlIHJlLXNjaGVkdWxl
IGhlcmUKPj4gaXNuJ3QgYWxzbyBuZWVkZWQgZm9yIG90aGVyIHRoYW4gcHJvY2Vzc2luZyB0aGUg
cmVzZXQgb2YgdGhlCj4+IHBlcmlvZGljIHRpbWVyIHBlcmlvZC4KPiAKPiBUaGlzIGRlbGV0aW9u
IGlzIHJlbGF0ZWQgdG8gcmVwbGFjaW5nIHRoZSBkaXJlY3Qgd3JpdGUgb2YKPiB2LT5wZXJpb2Rp
Y19wZXJpb2QgYnkgdmNwdV9zZXRfcGVyaW9kaWNfdGltZXIoKS4KPiAKPiBJIGNhbid0IHNlZSBh
bnkgb3RoZXIgcmVhc29uIGZvciB0aGUgcmUtc2NoZWR1bGUuCgpSb2dlciwgeW91IGFkZGVkIHRo
aXMgaW4gZTg5Y2I3OWFhZSAoInhlbi9wdnNoaW06IGFkZCBtaWdyYXRpb24Kc3VwcG9ydCIpIC0g
Y2FuIHlvdSBjb25maXJtIHRoZSBhYm92ZT8KClRoYW5rcywgSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
