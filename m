Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094151B7B2
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:04:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBVs-0006oz-EY; Mon, 13 May 2019 14:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQBVr-0006op-1z
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:01:07 +0000
X-Inumbo-ID: 8c77de3a-7587-11e9-b3d5-2f98e99b996b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c77de3a-7587-11e9-b3d5-2f98e99b996b;
 Mon, 13 May 2019 14:01:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 08:01:04 -0600
Message-Id: <5CD9789D020000780022E267@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 08:01:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
 <5CD97567020000780022E1F0@prv1-mh.provo.novell.com>
 <9d672876-1630-4a10-4b85-e1db7dbefbd4@citrix.com>
In-Reply-To: <9d672876-1630-4a10-4b85-e1db7dbefbd4@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] xen/watchdog: Fold exit paths to have a
 single unlock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA1LjE5IGF0IDE1OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDUvMjAxOSAxNDo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEw
LjA1LjE5IGF0IDIwOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUu
Ywo+Pj4gQEAgLTEwNTAsNiArMTA1MCw4IEBAIHN0YXRpYyB2b2lkIGRvbWFpbl93YXRjaGRvZ190
aW1lb3V0KHZvaWQgKmRhdGEpCj4+PiAgCj4+PiAgc3RhdGljIGxvbmcgZG9tYWluX3dhdGNoZG9n
KHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0aW1lb3V0KQo+Pj4gIHsK
Pj4+ICsgICAgbG9uZyByYyA9IDA7Cj4+IEknbSB3b25kZXJpbmcgd2h5IHRoaXMgaXNuJ3QgcGxh
aW4gaW50LiBOb3QgYSBiaWcgZGVhbCwgYnV0IEknbQo+PiBjdXJpb3VzIGFueXdheS4KPiAKPiBU
byBtYXRjaCB0aGUgcmV0dXJuIHZhbHVlLgoKQnV0IHRoZSBjb21waWxlciB3aWxsIGhhcHBpbHkg
c2lnbi1leHRlbmQgdGhlIHZhbHVlIGF0IHRoZSByZXR1cm4gc3RhdGVtZW50LgoKPiAgVGhpcyBm
dW5jdGlvbiBpcyBjb21waWxlZCB0d2ljZSBBRkFJQ1QuCgpJIGhhdmUgbm8gaWRlYSBob3cgdGhp
cyBtYXR0ZXJzLgoKPj4gQXMgcGVyIHlvdXIgb3duIHJlc3BvbnNlIHRvIHBhdGNoIDIgSSB1bmRl
cnN0YW5kIHRoYXQgdGhlCj4+IG90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgZG9uI3QgbmVl
ZCBsb29raW5nIGF0IHVudGlsIHlvdQo+PiBzZW5kIGEgdjIuCj4gCj4gcGF0Y2ggMyBpcyBpbmRl
cGVuZGVudCBvZiB0aGUgQUJJIGNoYW5nZXMsIHNvIGZpbmUgaW4gcHJpbmNpcGxlIHRvCj4gcmV2
aWV3IG5vdy4KCk9rYXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
