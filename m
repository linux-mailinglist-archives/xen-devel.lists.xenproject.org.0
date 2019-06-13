Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4343659
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:17:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPZH-0000FA-3S; Thu, 13 Jun 2019 13:15:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbPZG-0000EP-F5
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 13:15:02 +0000
X-Inumbo-ID: 3ece854e-8ddd-11e9-9763-333ec73eabe3
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ece854e-8ddd-11e9-9763-333ec73eabe3;
 Thu, 13 Jun 2019 13:14:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 07:14:58 -0600
Message-Id: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 07:14:56 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/9] x86: AMD x2APIC support
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVzcGl0ZSB0aGUgdGl0bGUgdGhpcyBpcyBhY3R1YWxseSBhbGwgQU1EIElPTU1VIHNpZGUgd29y
azsgYWxsIHg4NgpzaWRlIGFkanVzdG1lbnRzIGhhdmUgYWxyZWFkeSBiZWVuIGNhcnJpZWQgb3V0
LgoKSWYgaW4gZG91YnQsIHRoZSBzZXJpZXMgaXMgYXNzdW1lZCB0byBnbyBvbiB0b3Agb2YKCkFN
RC9JT01NVTogaW5pdGlhbGl6ZSBJUlEgdGFza2xldCBvbmx5IG9uY2UgWzFdCkFNRC9JT01NVTog
cmV2ZXJ0ICJhbWQvaW9tbXU6IGFzc2lnbiBpb21tdSBkZXZpY2VzIHRvIFhlbiIgWzJdCkFNRC9J
T01NVTogZG9uJ3QgImFkZCIgSU9NTVVzIFszXQoKMTogQU1EL0lPTU1VOiB1c2UgYml0IGZpZWxk
IGZvciBleHRlbmRlZCBmZWF0dXJlIHJlZ2lzdGVyCjI6IEFNRC9JT01NVTogdXNlIGJpdCBmaWVs
ZCBmb3IgY29udHJvbCByZWdpc3RlcgozOiBBTUQvSU9NTVU6IHVzZSBiaXQgZmllbGQgZm9yIElS
VEUKNDogQU1EL0lPTU1VOiBpbnRyb2R1Y2UgMTI4LWJpdCBJUlRFIG5vbi1ndWVzdC1BUElDIElS
VEUgZm9ybWF0CjU6IEFNRC9JT01NVTogc3BsaXQgYW1kX2lvbW11X2luaXRfb25lKCkKNjogQU1E
L0lPTU1VOiBhbGxvdyBlbmFibGluZyB3aXRoIElSUSBub3QgeWV0IHNldCB1cAo3OiBBTUQvSU9N
TVU6IGFkanVzdCBzZXR1cCBvZiBpbnRlcm5hbCBpbnRlcnJ1cHQgZm9yIHgyQVBJQyBtb2RlCjg6
IEFNRC9JT01NVTogZW5hYmxlIHgyQVBJQyBtb2RlIHdoZW4gYXZhaWxhYmxlCjk6IEFNRC9JT01N
VTogY29ycmVjdCBJUlRFIHVwZGF0aW5nCgpKYW4KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDI0NDEuaHRtbApbMl0g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5
LTA2L21zZzAwMDk1Lmh0bWwKWzNdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNi9tc2cwMDIwMC5odG1sCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
