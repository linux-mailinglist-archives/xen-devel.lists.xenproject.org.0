Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF6BF8BC9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 10:30:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUSTI-000543-NF; Tue, 12 Nov 2019 09:28:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUSTG-00053s-Ba
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 09:28:22 +0000
X-Inumbo-ID: c46ca8ac-052e-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c46ca8ac-052e-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 09:28:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A359AB35C;
 Tue, 12 Nov 2019 09:28:20 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20191108065739.21345-1-jgross@suse.com>
 <8cccef1789872091a80d639bc5c08c1048021ba7.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7bb59fdc-6b81-bba3-9cbc-9b343b0cf537@suse.com>
Date: Tue, 12 Nov 2019 10:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8cccef1789872091a80d639bc5c08c1048021ba7.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix a potential issue with core
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMTkgMTA6MTQsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0x
MS0wOCBhdCAwNzo1NyArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gY3B1cG9vbF9vbmxp
bmVfY3B1bWFzaygpIGlzIHVzZWQgYnkgY3JlZGl0IGFuZCBydCBzY2hlZHVsZXIuIEl0Cj4+IHJl
dHVybnMKPj4gYWxsIHRoZSBjcHVzIG9mIGEgY3B1cG9vbCBvciBhbGwgb25saW5lIGNwdXMgaW4g
Y2FzZSBubyBjcHVwb29sIGlzCj4+IHNwZWNpZmllZC4KPj4KPj4gVGhlICJubyBjcHVwb29sIiBj
YXNlIGNhbiBiZSBkcm9wcGVkLCBhcyBubyBzY2hlZHVsZXIgb3RoZXIgdGhhbiB0aGUKPj4gaW5p
dCBzY2hlZHVsZXIgd2lsbCBldmVyIHdvcmsgb24gY3B1cyBub3QgYXNzb2NpYXRlZCB3aXRoIGFu
eQo+PiBjcHVwb29sLgo+Pgo+IFllcywgdGhpcyBpcyBhIGNvb2wgdGhpbmcgYWJvdXQgaGF2aW5n
IHRoZSBpbml0IGNwdXBvb2wvaWRsZSBzY2hlZHVsZXIKPiBpbiBwbGFjZS4gSXQncyBldmVuIGNv
b2xlciBpbiBDcmVkaXQyLCB3aGVyZSBpdCB3aWxsIGFsbG93IHVzIHRvIGRyb3AKPiBzb21lIG9m
IHRoZSBjcHVtYXNrX2FuZCgpIGNwdW1hc2tfb3IoKSBvcGVyYXRpb25zLgo+IAo+IEl0J3MgdGhl
IHJlYXNvbiB3aHksIGV2ZW4gYmVmb3JlIGNvcmUgc2NoZWR1bGluZywgSSB3YXMgY29uc2lkZXJp
bmcKPiBkb2luZyBhbiBpZGxlIHNjaGVkdWxlciBteXNlbGYuCj4gCj4gSSdsbCBnZXQgdG8gd3Jp
dGUgdGhhdCBwYXRjaCAodGhlIG9uZSBmb3IgQ3JlZGl0MiwgSSBtZWFuKSBhdCBzb21lCj4gcG9p
bnQuIDotKQo+IAo+PiBBcyB0aGUgaW5kaXZpZHVhbCBzY2hlZHVsZXJzIHNob3VsZCBvbmx5IGV2
ZXIgd29yayBvbiBzY2hlZHVsaW5nCj4+IHJlc291cmNlcyBpbnN0ZWFkIG9mIGluZGl2aWR1YWwg
Y3B1cywgdGhlaXIgY3B1cG9vbF9vbmxpbmVfY3B1bWFzaygpCj4+IHVzZSBzaG91bGQgYmUgcmVw
bGFjZWQgYnkgY3B1cG9vbC0+cmVzX3ZhbGlkLgo+Pgo+PiBOb3RlIHRoYXQgb25seSB3aXRoIGNv
cmUgc2NoZWR1bGluZyBhY3RpdmUgdGhpcyBtaWdodCByZXN1bHQgaW4KPj4gcG90ZW50aWFsIHBy
b2JsZW1zLCBhcyB3aXRoIGNwdSBzY2hlZHVsaW5nIGJvdGggbWFza3MgYXJlIGlkZW50aWNhbC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+
IFJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKQW5kIHdp
dGggbXkgcmVsZWFzZSBtYW5hZ2VyIGhhdCBvbjoKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
