Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502B17A26
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMN1-0007e3-BG; Wed, 08 May 2019 13:12:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMN0-0007dp-3w
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:12:26 +0000
X-Inumbo-ID: ebd3cae6-7192-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ebd3cae6-7192-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 13:12:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:12:24 -0600
Message-Id: <5CD2D5B6020000780022CD7F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:12:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 09/12] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
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

U2luY2UgdGhlICJDYW5ub3Qgc2V0IGFmZmluaXR5IC4uLiIgd2FybmluZyBpcyBhIG9uZSB0aW1l
IG9uZSwgYXZvaWQKdHJpZ2dlcmluZyBpdCBhbHJlYWR5IGF0IGJvb3QgdGltZSB3aGVuIHBhcmtp
bmcgc2Vjb25kYXJ5IHRocmVhZHMgYW5kCnRoZSBzZXJpYWwgY29uc29sZSB1c2VzIGEgKHN0aWxs
IHVuY29ubmVjdGVkIGF0IHRoYXQgdGltZSkgUENJIElSUS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9pcnEuYwpAQCAtMjQyOCw4ICsyNDI4LDIwIEBAIHZvaWQgZml4dXBfaXJxcyhj
b25zdCBjcHVtYXNrX3QgKm1hc2ssIGIKICAgICAgICAgdmVjdG9yID0gaXJxX3RvX3ZlY3Rvcihp
cnEpOwogICAgICAgICBpZiAoIHZlY3RvciA+PSBGSVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAmJgog
ICAgICAgICAgICAgIHZlY3RvciA8PSBMQVNUX0hJUFJJT1JJVFlfVkVDVE9SICkKKyAgICAgICAg
ewogICAgICAgICAgICAgY3B1bWFza19hbmQoZGVzYy0+YXJjaC5jcHVfbWFzaywgZGVzYy0+YXJj
aC5jcHVfbWFzaywgbWFzayk7CiAKKyAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgKiBUaGlz
IGNhbiBpbiBwYXJ0aWN1bGFyIGhhcHBlbiB3aGVuIHBhcmtpbmcgc2Vjb25kYXJ5IHRocmVhZHMK
KyAgICAgICAgICAgICAqIGR1cmluZyBib290IGFuZCB3aGVuIHRoZSBzZXJpYWwgY29uc29sZSB3
YW50cyB0byB1c2UgYSBQQ0kgSVJRLgorICAgICAgICAgICAgICovCisgICAgICAgICAgICBpZiAo
IGRlc2MtPmhhbmRsZXIgPT0gJm5vX2lycV90eXBlICkKKyAgICAgICAgICAgIHsKKyAgICAgICAg
ICAgICAgICBzcGluX3VubG9jaygmZGVzYy0+bG9jayk7CisgICAgICAgICAgICAgICAgY29udGlu
dWU7CisgICAgICAgICAgICB9CisgICAgICAgIH0KKwogICAgICAgICBpZiAoIGRlc2MtPmFyY2gu
bW92ZV9jbGVhbnVwX2NvdW50ICkKICAgICAgICAgewogICAgICAgICAgICAgLyogVGhlIGNsZWFu
dXAgSVBJIG1heSBoYXZlIGdvdCBzZW50IHdoaWxlIHdlIHdlcmUgc3RpbGwgb25saW5lLiAqLwoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
