Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7C104FFD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:05:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjHw-0002fT-QB; Thu, 21 Nov 2019 10:02:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXjHv-0002fO-G4
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:02:11 +0000
X-Inumbo-ID: fb9995cf-0c45-11ea-a326-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb9995cf-0c45-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 10:02:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6436AD85;
 Thu, 21 Nov 2019 10:02:09 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Chao Gao <chao.gao@intel.com>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
 <0b848790-fcdd-1267-b621-62be6098369d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d15f8ad-27ba-52a2-7006-d94874a2f5ba@suse.com>
Date: Thu, 21 Nov 2019 11:02:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0b848790-fcdd-1267-b621-62be6098369d@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/2] x86/cpu: maintain a parked CPU bitmap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxMDo0NywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIwLzExLzIwMTkg
MjM6MDUsIENoYW8gR2FvIHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMKPj4gQEAgLTM5LDYgKzM5LDcgQEAKPj4gICBj
cHVtYXNrX3QgY3B1X29ubGluZV9tYXA7Cj4+ICAgY3B1bWFza190IGNwdV9wcmVzZW50X21hcDsK
Pj4gICBjcHVtYXNrX3QgY3B1X3Bvc3NpYmxlX21hcDsKPj4gK2NwdW1hc2tfdmFyX3QgY3B1X3Bh
cmtlZF9tYXA7Cj4gCj4gWW91IGRlZmluZSBjcHVfcGFya2VkX21hcCBidXQgQUZBSUsgaXQgd2ls
bCBuZXZlciBnZXQgYWxsb2NhdGVkLiBUaGUgCj4gcmlzayBoZXJlIGlzIGFueSBhY2Nlc3MgdG8g
dGhhdCB2YXJpYWJsZSB3aWxsIHJlc3VsdCB0byBhIGZhdWx0Lgo+IAo+IExvb2tpbmcgYXQgdGhl
IGNoYW5nZXMgYmVsb3csIGl0IGxvb2tzIGxpa2UgYWNjZXNzIGluIGNvbW1vbiBjb2RlIHdpbGwg
Cj4gYmUgcHJvdGVjdGVkIGJ5IHBhcmtfb2ZmbGluZV9jcHVzLiBUaGlzIGlzIGFsd2F5cyBmYWxz
ZSBvbiBBcm0sIHNvIHRoZSAKPiBjb21waWxlciBzaG91bGQgcmVtb3ZlIGFueSBhY2Nlc3MgdG8g
Y3B1X3BhcmtlZF9tYXAuCj4gCj4gV2l0aCB0aGF0IGluIG1pbmQsIEkgdGhpbmsgaXQgd291bGQg
YmUgYmVzdCB0byBvbmx5IHByb3ZpZGUgYSBwcm90b3R5cGUgCj4gZm9yIGNwdV9wYXJrZWRfbWFw
IGFuZCBzbyB0aGUgbGlua2VyIGNhbiB3YXJuIGlmIHNvbWVvbmUgdXNlZCBpdC4KCisxCgpJbiBm
YWN0IEkgd29uZGVyIHdoZXRoZXIgdGhlIG1haW50ZW5hbmNlIG9mIHRoZSBtYXAgc2hvdWxkIGxp
dmUgaW4KY29tbW9uIGNvZGUgaW4gdGhlIGZpcnN0IHBsYWNlLiBXaGlsZSBjbGVhcmluZyB0aGUg
cmVzcGVjdGl2ZSBiaXQKaW4gY3B1X3VwKCkgbG9va3MgY29ycmVjdCAoYW5kIGNvdWxkIGJlIGRv
bmUgd2l0aG91dCBhbnkgaWYoKSksCkknbSBub3QgY29udmluY2VkIHRoZSBzZXR0aW5nIG9mIHRo
ZSBiaXQgaW4gY3B1X2Rvd24oKSBpcyBnb2luZyB0bwpiZSBjb3JyZWN0IGluIGFsbCBjYXNlcy4g
SSdkIHJhdGhlciBsZWF2ZSB0aGlzIHRvIHRoZSByZWxldmFudApjYWxsZXJzIG9mIGNwdV9kb3du
KCkuIFRvIGRlYWwgd2l0aCBjcHVfYWRkX3JlbW92ZV9sb2NrIG5vdCBiZWluZwpoZWxkIHBlcmhh
cHMgaXQgd291bGQgYmUgYmVzdCB0byBzZXQgdGhlIGZsYWcgX2JlZm9yZV8gY2FsbGluZwpjcHVf
ZG93bigpOyBjb25zdW1lcnMgb2YgdGhlIG1hcCB0aGVuIHdvdWxkIG5lZWQgdG8gZG91YmxlIGNo
ZWNrCnRoYXQgYSBDUFUgaXMgbm90IF9hbHNvXyAoc3RpbGwpIG9ubGluZS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
