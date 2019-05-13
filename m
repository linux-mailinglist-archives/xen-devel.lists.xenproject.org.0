Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337381B75F
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 15:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBIi-00046f-JX; Mon, 13 May 2019 13:47:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQBIh-000469-2D
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:47:31 +0000
X-Inumbo-ID: a5539d9c-7585-11e9-a1db-035add300fd4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5539d9c-7585-11e9-a1db-035add300fd4;
 Mon, 13 May 2019 13:47:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 07:47:27 -0600
Message-Id: <5CD97567020000780022E1F0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 07:47:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDEwLjA1LjE5IGF0IDIwOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4gKysrIGIveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4gQEAgLTEwNTAsNiArMTA1MCw4IEBAIHN0YXRpYyB2b2lkIGRvbWFpbl93YXRjaGRv
Z190aW1lb3V0KHZvaWQgKmRhdGEpCj4gIAo+ICBzdGF0aWMgbG9uZyBkb21haW5fd2F0Y2hkb2co
c3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3QgaWQsIHVpbnQzMl90IHRpbWVvdXQpCj4gIHsKPiAr
ICAgIGxvbmcgcmMgPSAwOwoKSSdtIHdvbmRlcmluZyB3aHkgdGhpcyBpc24ndCBwbGFpbiBpbnQu
IE5vdCBhIGJpZyBkZWFsLCBidXQgSSdtCmN1cmlvdXMgYW55d2F5LgoKQXMgcGVyIHlvdXIgb3du
IHJlc3BvbnNlIHRvIHBhdGNoIDIgSSB1bmRlcnN0YW5kIHRoYXQgdGhlCm90aGVyIHBhdGNoZXMg
aW4gdGhpcyBzZXJpZXMgZG9uI3QgbmVlZCBsb29raW5nIGF0IHVudGlsIHlvdQpzZW5kIGEgdjIu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
