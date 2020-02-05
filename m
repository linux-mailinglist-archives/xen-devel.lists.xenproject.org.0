Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E3153186
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:15:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKT6-0004tW-Q4; Wed, 05 Feb 2020 13:11:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKT5-0004tR-Eg
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:11:47 +0000
X-Inumbo-ID: 0fc5ce46-4819-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fc5ce46-4819-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 13:11:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C49B7AB3D;
 Wed,  5 Feb 2020 13:11:45 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Date: Wed, 5 Feb 2020 14:11:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/6] misc hardening and some cleanup
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWxqYSBoYXMgcmVwb3J0ZWQgYSBjb3VwbGUgb2YgaXNzdWVzIHdoaWNoIHdlcmUgb24gdGhlIGJv
dW5kYXJ5IG9mCm5lZWRpbmcgYW4gWFNBLCBkdWUgdG8gc29tZSB2YWd1ZW5lc3Mgb2YgdGhlIHN0
YXRlbWVudHMgcmVzdWx0aW5nCmZyb20gWFNBLTc3LiBUaGUgZmlyc3QgMyBwYXRjaGVzIGhlcmUg
YWRkcmVzcyB0aGVzZSByZXBvcnRzLCBhZnRlcgpoYXZpbmcgc2V0dGxlZCB3aXRoaW4gdGhlIFNl
Y3VyaXR5IFRlYW0gdGhhdCB3ZSBjYW4ndCBmaW5kIGFueW9uZSAvCmFueXRoaW5nIGFjdHVhbGx5
IGJlaW5nIHBvdGVudGlhbGx5IGFmZmVjdGVkIGluIHJlYWxpdHkuCgpJbiB0aGUgY291cnNlIG9m
IGF1ZGl0aW5nIGZvciBwb3NzaWJsZSBhY3R1YWwgaXNzdWVzIHJlc3VsdGluZyBmcm9tCnRoZSBt
aXNzaW5nIG92ZXJmbG93IGNoZWNrIGFkZHJlc3NlZCBieSBwYXRjaCAzLCBhIGZldyBtb3JlIGNs
ZWFudXAKb3Bwb3J0dW5pdGllcyB3ZXJlIG5vdGljZWQsIHdoaWNoIHRoZSByZW1haW5pbmcgMyBw
YXRjaGVzIHRha2UgY2FyZQpvZi4KCjE6IEVGSTogcmUtY2hlY2sge2dldCxzZXR9LXZhcmlhYmxl
IG5hbWUgc3RyaW5ncyBhZnRlciBjb3B5aW5nIGluCjI6IEVGSTogZG9uJ3QgbGVhayBoZWFwIGNv
bnRlbnRzIHRocm91Z2ggWEVOX0VGSV9nZXRfbmV4dF92YXJpYWJsZV9uYW1lCjM6IHhtYWxsb2M6
IGd1YXJkIGFnYWluc3QgaW50ZWdlciBvdmVyZmxvdwo0OiBBcm0vR0lDdjI6IGRvbid0IG5lZWRs
ZXNzbHkgdXNlIHh6YWxsb2NfYnl0ZXMoKQo1OiBzeXNjdGw6IHVzZSB4bWFsbG9jX2FycmF5KCkg
Zm9yIFhFTl9TWVNDVExfcGFnZV9vZmZsaW5lX29wCjY6IGRvbWN0bC92TlVNQTogYXZvaWQgYXJp
dGhtZXRpYyBvdmVyZmxvdwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
