Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4D216CA
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:13:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRZoo-0002Eu-SK; Fri, 17 May 2019 10:10:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRZon-0002Ep-BK
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:10:25 +0000
X-Inumbo-ID: fc61193b-788b-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc61193b-788b-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 10:10:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:10:23 -0600
Message-Id: <5CDE88900200007800230027@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:10:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC1F1@prv1-mh.provo.novell.com>
 <5B61C21202000078001F8805@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC6BD@prv1-mh.provo.novell.com>
 <5B61C212020000780020B6D8@prv1-mh.provo.novell.com>
 <5B61C21202000000000FF27E@prv1-mh.provo.novell.com>
 <5B61C2120200007800224310@prv1-mh.provo.novell.com>
 <5B61C2120200000000101EDC@prv1-mh.provo.novell.com>
 <5B61C212020000780022FF0D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 0/3] x86: more power-efficient CPU parking
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBwdXR0aW5nIENQVXMgdG8gc2xlZXAgcGVybWFuZW50bHksIHdlIHNob3VsZCB0cnkgdG8g
cHV0IHRoZW0gaW50bwp0aGUgbW9zdCBwb3dlciBjb25zZXJ2aW5nIHN0YXRlIHBvc3NpYmxlLiBG
b3Igbm93IGl0IGlzIHVuY2xlYXIgd2hldGhlciwKZXNwZWNpYWxseSBpbiBhIGRlZXAgQy1zdGF0
ZSwgdGhlIFAtc3RhdGUgYWxzbyBtYXR0ZXJzLCBzbyB0aGlzIHNlcmllcyBvbmx5CmFycmFuZ2Vz
IGZvciB0aGUgQy1zdGF0ZSBzaWRlIG9mIHRoaW5ncyAocGx1cyBzb21lIGNsZWFudXApLgoKMTog
eDg2L2lkbGU6IHJlLWFycmFuZ2UgZGVhZC1pZGxlIGhhbmRsaW5nCjI6IHg4Ni9jcHVpZGxlOiBw
dXNoIHBhcmtlZCBDUFVzIGludG8gZGVlcGVyIHNsZWVwIHN0YXRlcyB3aGVuIHBvc3NpYmxlCjM6
IHg4Ni9jcHVpZGxlOiBjbGVhbiB1cCBDeCBkdW1waW5nCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
