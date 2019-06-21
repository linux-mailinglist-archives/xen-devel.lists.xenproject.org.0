Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256964E382
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:27:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFmK-0006Fl-3L; Fri, 21 Jun 2019 09:24:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heFmI-0006Fg-Qc
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:24:14 +0000
X-Inumbo-ID: 54c2752c-9406-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 54c2752c-9406-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 09:24:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 03:24:11 -0600
Message-Id: <5D0CA23B020000780023A005@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 03:24:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-4-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560975087-25632-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] xen/link: Fold .data.read_mostly into
 .data
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDIyOjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLmRhdGEucmVhZF9tb3N0bHkgb25seSBuZWVkcyBzZXBhcmF0aW5nIGZyb20gYWRqYWNl
bnQgZGF0YSBieSBvbmUgY2FjaGUgbGluZQo+IHRvIGJlIGVmZmVjdGl2ZSwgYW5kIHBsYWNpbmcg
aXQgYWRqYWNlbnQgdG8gLmRhdGEucGFnZV9hbGlnbmVkIGZ1bGZpbGxzIHRoaXMKPiByZXF1aXJl
bWVudC4KPiAKPiBGb3IgQVJNLCAuZXhfdGFibGUgYXBwZWFycyB0byBiZSBhIHZlc3RpZ2lhbCBy
ZW1uYW50LiAgTm90aGluZyBpbiB0aGUKPiByZXN1bHRpbmcgYnVpbGQgZXZlciBpbnNwZWN0cyBv
ciBhY3RzIG9uIHRoZSBjb250ZW50cyBvZiB0aGUgdGFibGUuICBUaGUgYXJtMzIKPiBidWlsZCBk
b2VzIGhvd2V2ZXIgaGF2ZSBzb21lIGFzc2VtYmx5IHJvdXRpbmVzIHdoaWNoIGZpbGwgLmV4X3Rh
YmxlLgo+IAo+IERyb3AgYWxsIG9mIEFSTSdzIC5leF90YWJsZSBpbmZyYXN0cnVjdHVyZSwgdG8g
cmVkdWNlIHRoZSBzaXplIG9mIHRoZSBjb21waWxlZAo+IGJpbmFyeSwgYW5kIGF2b2lkIGdpdmlu
ZyB0aGUgaWxsdXNpb24gb2YgZXhjZXB0aW9uIGhhbmRsaW5nIHdvcmtpbmcuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCldpdGhv
dXQgeW91IHVuZG9pbmcgcGFydCBvZiAwMWZlNGRhNjI0ICgieDg2OiBmb3JjZSBzdWl0YWJsZQph
bGlnbm1lbnQgaW4gc291cmNlcyByYXRoZXIgdGhhbiBpbiBsaW5rZXIgc2NyaXB0IiksIGkuZS4g
d2l0aCB0aGUKQUxJR04oUEFHRV9TSVpFKSBkcm9wcGVkLCB4ODYgcGFydApBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKWWV0IEZUUiAtIEkgZG9uJ3QgdGhpbmsgdGhl
cmUgd2FzIGFueXRoaW5nIHdyb25nIHdpdGggaXQgaGF2aW5nIGl0cyBvd24Kc2VjdGlvbiBpbiB0
aGUgZmluYWwgYmluYXJ5LiBPZiBjb3Vyc2UgdGhlcmUncyBhbHNvIG5vdGhpbmcgd3Jvbmcgd2l0
aCBpdApnZXR0aW5nIGZvbGRlZCBpbnRvIC5kYXRhLCBpbiBwYXJ0aWN1bGFyIHdpdGggaXQgc2l0
dGluZyBhaGVhZCBvZgouZGF0YS5wYWdlX2FsaWduZWQgYW55d2F5LgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
