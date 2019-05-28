Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD12C5BE
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 13:50:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVaa7-0000Wi-BW; Tue, 28 May 2019 11:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVaa5-0000Wd-GL
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:47:49 +0000
X-Inumbo-ID: 68353f46-813e-11e9-9be6-abb43b2b8533
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68353f46-813e-11e9-9be6-abb43b2b8533;
 Tue, 28 May 2019 11:47:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 28 May 2019 05:47:44 -0600
Message-Id: <5CED1FDC0200007800233141@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 28 May 2019 05:47:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-55-jgross@suse.com>
In-Reply-To: <20190528103313.1343-55-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 54/60] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGhhdmluZyBhIGZ1bGwgYmxvd24gc2NoZWR1bGVyIHJ1bm5pbmcgZm9yIHRoZSBmcmVl
IGNwdXMKPiBhZGQgYSB2ZXJ5IG1pbmltYWxpc3RpYyBzY2hlZHVsZXIgZm9yIHRoYXQgcHVycG9z
ZSBvbmx5IGV2ZXIgc2NoZWR1bGluZwo+IHRoZSByZWxhdGVkIGlkbGUgdmNwdS4gVGhpcyBoYXMg
dGhlIGJpZyBhZHZhbnRhZ2Ugb2Ygbm90IG5lZWRpbmcgYW55Cj4gcGVyLWNwdSwgcGVyLWRvbWFp
biBvciBwZXItc2NoZWR1bGluZyB1bml0IGRhdGEgZm9yIGZyZWUgY3B1cyBhbmQgaW4KPiB0dXJu
IHNpbXBsaWZ5aW5nIG1vdmluZyBjcHVzIHRvIGFuZCBmcm9tIGNwdXBvb2xzIGEgbG90LgoKQW5k
IHRoZSBudWxsIHNjaGVkdWxlciBpcyBub3QgbWluaW1hbGlzdGljIGVub3VnaD8KCj4gLS0tIGEv
eGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMKPiBA
QCAtMzUwLDggKzM1MCw2IEBAIHZvaWQgc3RhcnRfc2Vjb25kYXJ5KHVuc2lnbmVkIGxvbmcgYm9v
dF9waHlzX29mZnNldCwKPiAgCj4gICAgICBzZXR1cF9jcHVfc2libGluZ19tYXAoY3B1aWQpOwo+
ICAKPiAtICAgIHNjaGVkdWxlcl9wZXJjcHVfaW5pdChjcHVpZCk7Cj4gLQo+ICAgICAgLyogUnVu
IGxvY2FsIG5vdGlmaWVycyAqLwo+ICAgICAgbm90aWZ5X2NwdV9zdGFydGluZyhjcHVpZCk7Cj4g
ICAgICAvKgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiArKysgYi94ZW4vYXJjaC94
ODYvc21wYm9vdC5jCj4gQEAgLTM4Miw4ICszODIsNiBAQCB2b2lkIHN0YXJ0X3NlY29uZGFyeSh2
b2lkICp1bnVzZWQpCj4gIAo+ICAgICAgc2V0X2NwdV9zaWJsaW5nX21hcChjcHUpOwo+ICAKPiAt
ICAgIHNjaGVkdWxlcl9wZXJjcHVfaW5pdChjcHUpOwo+IC0KPiAgICAgIGluaXRfcGVyY3B1X3Rp
bWUoKTsKPiAgCj4gICAgICBzZXR1cF9zZWNvbmRhcnlfQVBJQ19jbG9jaygpOwoKU2VlaW5nIHlv
dSByZXZlcnQgaGVyZSB3aGF0IGFuIGVhcmxpZXIgcGF0Y2ggaW4gdGhlIHNlcmllcyBoYXMgYWRk
ZWQsCkkgZG9uJ3Qgc3VwcG9zZSByZS1vcmRlcmluZyBjb3VsZCBhdm9pZCB0aGlzIGNvZGUgY2h1
cm4/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
