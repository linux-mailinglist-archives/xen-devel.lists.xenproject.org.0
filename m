Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDEB5856C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 17:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgW7x-00030R-CV; Thu, 27 Jun 2019 15:15:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgW7w-00030M-ET
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 15:15:56 +0000
X-Inumbo-ID: 73ace49c-98ee-11e9-bf1c-2bdc29943773
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73ace49c-98ee-11e9-bf1c-2bdc29943773;
 Thu, 27 Jun 2019 15:15:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 09:15:51 -0600
Message-Id: <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 09:15:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 00/10] x86: AMD x2APIC support
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
LgoKMTogQU1EL0lPTU1VOiByZXN0cmljdCBmZWF0dXJlIGxvZ2dpbmcKMjogQU1EL0lPTU1VOiB1
c2UgYml0IGZpZWxkIGZvciBleHRlbmRlZCBmZWF0dXJlIHJlZ2lzdGVyCjM6IEFNRC9JT01NVTog
dXNlIGJpdCBmaWVsZCBmb3IgY29udHJvbCByZWdpc3Rlcgo0OiBBTUQvSU9NTVU6IHVzZSBiaXQg
ZmllbGQgZm9yIElSVEUKNTogQU1EL0lPTU1VOiBpbnRyb2R1Y2UgMTI4LWJpdCBJUlRFIG5vbi1n
dWVzdC1BUElDIElSVEUgZm9ybWF0CjY6IEFNRC9JT01NVTogc3BsaXQgYW1kX2lvbW11X2luaXRf
b25lKCkKNzogQU1EL0lPTU1VOiBhbGxvdyBlbmFibGluZyB3aXRoIElSUSBub3QgeWV0IHNldCB1
cAo4OiBBTUQvSU9NTVU6IGFkanVzdCBzZXR1cCBvZiBpbnRlcm5hbCBpbnRlcnJ1cHQgZm9yIHgy
QVBJQyBtb2RlCjk6IEFNRC9JT01NVTogZW5hYmxlIHgyQVBJQyBtb2RlIHdoZW4gYXZhaWxhYmxl
CjEwOiBBTUQvSU9NTVU6IGNvcnJlY3QgSVJURSB1cGRhdGluZwoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
