Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5E943645
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPQo-0007iY-IB; Thu, 13 Jun 2019 13:06:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbPQn-0007iT-AG
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 13:06:17 +0000
X-Inumbo-ID: 05bfc520-8ddc-11e9-87b3-cb94c7bbae48
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05bfc520-8ddc-11e9-87b3-cb94c7bbae48;
 Thu, 13 Jun 2019 13:06:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 07:06:13 -0600
Message-Id: <5D024A430200007800237DC5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 07:06:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86/x2APIC: tighten check in cluster mode IPI
 sending
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgb25seSBvZiBsaW1pdGVkIHVzZSB0byBjaGVjayB0aGUgZnVsbCBhY2N1bXVsYXRlZCAz
Mi1iaXQgdmFsdWUsCmJlY2F1c2UgdGhlIGhpZ2ggaGFsdmVzIGFyZSB0aGUgY2x1c3RlciBJRC4g
V2hhdCBuZWVkcyB0byBiZSBub24temVybyBpcwp0aGUgYml0IG1hcCBhdCB0aGUgYm90dG9tLCBv
ciBlbHNlIEFQSUMgZXJyb3JzIHdpbGwgcmVzdWx0LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGlj
LmMKKysrIGIveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKQEAgLTE1NCw3ICsxNTQsNyBA
QCBzdGF0aWMgdm9pZCBzZW5kX0lQSV9tYXNrX3gyYXBpY19jbHVzdGVyCiAgICAgICAgICAgICBt
c3JfY29udGVudCB8PSBwZXJfY3B1KGNwdV8yX2xvZ2ljYWxfYXBpY2lkLCBjcHUpOwogICAgICAg
ICB9CiAKLSAgICAgICAgQlVHX09OKCFtc3JfY29udGVudCk7CisgICAgICAgIEJVR19PTighKG1z
cl9jb250ZW50ICYgMHhmZmZmKSk7CiAgICAgICAgIG1zcl9jb250ZW50ID0gKG1zcl9jb250ZW50
IDw8IDMyKSB8IEFQSUNfRE1fRklYRUQgfAogICAgICAgICAgICAgICAgICAgICAgIEFQSUNfREVT
VF9MT0dJQ0FMIHwgdmVjdG9yOwogICAgICAgICBhcGljX3dybXNyKEFQSUNfSUNSLCBtc3JfY29u
dGVudCk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
