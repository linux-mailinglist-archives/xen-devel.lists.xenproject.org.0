Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B492174A
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:52:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaR9-0006AB-PJ; Fri, 17 May 2019 10:50:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaR8-00062y-9k
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:50:02 +0000
X-Inumbo-ID: 838b4494-7891-11e9-9eaa-d75cfc801f85
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 838b4494-7891-11e9-9eaa-d75cfc801f85;
 Fri, 17 May 2019 10:49:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:49:57 -0600
Message-Id: <5CDE91D602000078002300AE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:49:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 09/15] x86/IRQ: make fixup_irqs() skip
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
bi9hcmNoL3g4Ni9pcnEuYwpAQCAtMjQ1Miw4ICsyNDUyLDIwIEBAIHZvaWQgZml4dXBfaXJxcyhj
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
