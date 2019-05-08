Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358517A21
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:13:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMMZ-0007VM-1p; Wed, 08 May 2019 13:11:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMMX-0007V7-Hw
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:11:57 +0000
X-Inumbo-ID: d9c4ada6-7192-11e9-bcc5-7b041e85e155
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9c4ada6-7192-11e9-bcc5-7b041e85e155;
 Wed, 08 May 2019 13:11:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:11:54 -0600
Message-Id: <5CD2D598020000780022CD43@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:11:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 08/12] x86/IRQs: correct/tighten vector check
 in _clear_irq_vector()
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

SWYgYW55IHBhcnRpY3VsYXIgdmFsdWUgd2FzIHRvIGJlIGNoZWNrZWQgYWdhaW5zdCwgaXQgd291
bGQgbmVlZCB0byBiZQpJUlFfVkVDVE9SX1VOQVNTSUdORUQuCgpSZXBvcnRlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpCZSBtb3JlIHN0cmljdCB0aG91Z2gg
YW5kIHVzZSB2YWxpZF9pcnFfdmVjdG9yKCkgaW5zdGVhZC4KClRha2UgdGhlIG9wcG9ydHVuaXR5
IGFuZCBhbHNvIGNvbnZlcnQgbG9jYWwgdmFyaWFibGVzIHRvIHVuc2lnbmVkIGludC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBOZXcuCgot
LS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2lycS5jCkBAIC0yNzYs
MTQgKzI3NiwxMyBAQCBzdGF0aWMgdm9pZCByZWxlYXNlX29sZF92ZWMoc3RydWN0IGlycV9kCiAK
IHN0YXRpYyB2b2lkIF9jbGVhcl9pcnFfdmVjdG9yKHN0cnVjdCBpcnFfZGVzYyAqZGVzYykKIHsK
LSAgICB1bnNpZ25lZCBpbnQgY3B1OwotICAgIGludCB2ZWN0b3IsIG9sZF92ZWN0b3IsIGlycSA9
IGRlc2MtPmlycTsKKyAgICB1bnNpZ25lZCBpbnQgY3B1LCBvbGRfdmVjdG9yLCBpcnEgPSBkZXNj
LT5pcnE7CisgICAgdW5zaWduZWQgaW50IHZlY3RvciA9IGRlc2MtPmFyY2gudmVjdG9yOwogICAg
IGNwdW1hc2tfdCB0bXBfbWFzazsKIAotICAgIEJVR19PTighZGVzYy0+YXJjaC52ZWN0b3IpOwor
ICAgIEJVR19PTighdmFsaWRfaXJxX3ZlY3Rvcih2ZWN0b3IpKTsKIAogICAgIC8qIEFsd2F5cyBj
bGVhciBkZXNjLT5hcmNoLnZlY3RvciAqLwotICAgIHZlY3RvciA9IGRlc2MtPmFyY2gudmVjdG9y
OwogICAgIGNwdW1hc2tfYW5kKCZ0bXBfbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzaywgJmNwdV9v
bmxpbmVfbWFwKTsKIAogICAgIGZvcl9lYWNoX2NwdShjcHUsICZ0bXBfbWFzaykgewoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
