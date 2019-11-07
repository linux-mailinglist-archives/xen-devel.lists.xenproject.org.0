Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC4F2BF3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 11:17:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSenL-0004pS-Ch; Thu, 07 Nov 2019 10:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSenJ-0004pN-P5
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 10:13:37 +0000
X-Inumbo-ID: 41ec9c6a-0147-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41ec9c6a-0147-11ea-984a-bc764e2007e4;
 Thu, 07 Nov 2019 10:13:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64461B189;
 Thu,  7 Nov 2019 10:13:34 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <d41313de-f95d-729d-9cdb-bb19dc45d162@suse.com>
 <60e91912-1271-8b85-a11a-ed7f58366d1c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9a13cff-0a01-b3f0-375f-0d92e4579130@suse.com>
Date: Thu, 7 Nov 2019 11:13:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <60e91912-1271-8b85-a11a-ed7f58366d1c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] AMD/IOMMU: don't needlessly trigger
 errors/crashes when unmapping a page
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxODoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8xMS8yMDE5
IDE1OjE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVW5tYXBwaW5nIGEgcGFnZSB3aGljaCBoYXMg
bmV2ZXIgYmVlbiBtYXBwZWQgc2hvdWxkIGJlIGEgbm8tb3AgKG5vdGUgaG93Cj4+IGl0IGFscmVh
ZHkgaXMgaW4gY2FzZSB0aGVyZSB3YXMgbm8gcm9vdCBwYWdlIHRhYmxlIGFsbG9jYXRlZCkuCj4g
Cj4gV2hpY2ggZnVuY3Rpb24gYXJlIHlvdSB0YWxraW5nIGFib3V0IGhlcmU/wqAgaW9tbXVfcGRl
X2Zyb21fZGZuKCkgd2lsbAo+IEJVRygpIGlmIG5vIHJvb3Qgd2FzIHNldCB1cC4KCmFtZF9pb21t
dV91bm1hcF9wYWdlKCkgaGFzIHN1Y2ggYSBjaGVjayBmaXJzdCB0aGluZy4KCj4+IFRoZXJlJ3MK
Pj4gaW4gcGFydGljdWxhciBubyBuZWVkIHRvIGdyb3cgdGhlIG51bWJlciBvZiBwYWdlIHRhYmxl
IGxldmVscyBpbiB1c2UsCj4+IGFuZCB0aGVyZSdzIGFsc28gbm8gbmVlZCB0byBhbGxvY2F0ZSBp
bnRlcm1lZGlhdGUgcGFnZSB0YWJsZXMgZXhjZXB0Cj4+IHdoZW4gbmVlZGluZyB0byBzcGxpdCBh
IGxhcmdlIHBhZ2UuCj4gCj4gVG8gYmUgaG9uZXN0LCBJJ3ZlIG5ldmVyIGJlZW4gY29udmluY2Vk
IHRoYXQgZHluYW1pY2FsbHkgY2hhbmdpbmcgdGhlCj4gbnVtYmVyIG9mIGxldmVscyBpbiB0aGUg
QU1EIElPTU1VIHRhYmxlcyBpcyBjbGV2ZXIuwqAgSXQgc2hvdWxkIGJlIGZpeGVkCj4gYXQgNCAo
bGlrZSBldmVyeXRoaW5nIGVsc2UpIGFuZCBzdWRkZW5seSBhIGxvdCBvZiBydW50aW1lIGNvbXBs
ZXhpdHkKPiBkaXNhcHBlYXJzLsKgIChJJ20gZmFpcmx5IGNvbmZpZGVudCB0aGF0IHdlJ2xsIG5l
ZWQgYSBkb21haW4gY3JlYXRlCj4gcGFyYW1ldGVyIHRvIHN1cHBvcnQgNSBsZXZlbCBwYWdpbmcg
aW4gYSByYXRpb25hbCB3YXksIHNvIHdlIHdvbid0IGV2ZW4KPiBpbmNsdWRlIHdhbGstbGVuZ3Ro
IGd5bW5hc3RpY3MgdGhlbiBlaXRoZXIuKQoKNS1sZXZlbCBwYWdpbmcgZm9yIHRoZSBDUFUgMXN0
LXN0YWdlLXRyYW5zbGF0aW9uIGlzIGltbyBwcmV0dHkgb3J0aG9nb25hbAp0byBuZWVkaW5nIDUg
bGV2ZWxzIG9mIHBhZ2luZyBmb3IgMm5kLXN0YWdlLXRyYW5zbGF0aW9uICh3aGljaCBhbHNvIGlz
CndoYXQgdGhlIElPTU1VIGNvZGUgaGVyZSBpcyBhYm91dCkuCgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MsIEphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
