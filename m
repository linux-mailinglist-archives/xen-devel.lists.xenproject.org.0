Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBA1799A
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 14:43:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOLqu-0003G0-Qm; Wed, 08 May 2019 12:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOLqt-0003Fv-Gs
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:39:15 +0000
X-Inumbo-ID: 4787b9e6-718e-11e9-803a-d39017f60bd5
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4787b9e6-718e-11e9-803a-d39017f60bd5;
 Wed, 08 May 2019 12:39:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 06:39:10 -0600
Message-Id: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 06:39:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/4] x86: EOI timer corrections / improvements
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

VGhlIGZpcnN0IHBhdGNoIHdhcyBzZW50IG9uIGl0cyBvd24gYmVmb3JlOyB0aGlzIGlzIGEgcGxh
aW4gcmVzZW5kLiBUaGUKb3RoZXJzIGhhdmUgYmVlbiBhZGRlZCB0byBhZGRyZXNzIGF0IGxlYXN0
IHRoZSBtYWpvcml0eSBvZiB0aGUKcXVlc3Rpb25zIHJhaXNlZCBpbgpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDQvbXNnMDA4ODMuaHRt
bAoKMTogZG9uJ3Qga2VlcCBFT0kgdGltZXIgcnVubmluZyB3aXRob3V0IG5lZWQKMjogYmFpbCBl
YXJseSBmcm9tIGlycV9ndWVzdF9lb2lfdGltZXJfZm4oKSB3aGVuIG5vdGhpbmcgaXMgaW4gZmxp
Z2h0CjM6IHJlbGF4IGxvY2tpbmcgaW4gaXJxX2d1ZXN0X2VvaV90aW1lcl9mbigpCjQ6IEFDS1RZ
UEVfTk9ORSBjYW5ub3QgbWFrZSBpdCBpbnRvIGlycV9ndWVzdF9lb2lfdGltZXJfZm4oKQoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
