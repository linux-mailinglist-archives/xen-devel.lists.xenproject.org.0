Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9B18AEB
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 15:45:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOjJV-00063N-JW; Thu, 09 May 2019 13:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOjJU-00063H-GO
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:42:20 +0000
X-Inumbo-ID: 423b4ce6-7260-11e9-830c-830beb5e8ab4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 423b4ce6-7260-11e9-830c-830beb5e8ab4;
 Thu, 09 May 2019 13:42:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 07:42:16 -0600
Message-Id: <5CD42E37020000780022D32F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 07:42:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
In-Reply-To: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 1/3] x86/mm: short-circuit HVM-only mode
 flags when !HVM
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I2RlZmluZS1pbmcgdGhlbSB0byB6ZXJvIGFsbG93cyBiZXR0ZXIgY29kZSBnZW5lcmF0aW9uIGlu
IHRoaXMgY2FzZSwKYW5kIHBhdmVzIHRoZSB3YXkgZm9yIG1vcmUgRENFLCBhbGxvd2luZyB0byBs
ZWF2ZSBjZXJ0YWluIGZ1bmN0aW9ucyBqdXN0CmRlY2xhcmVkLCBidXQgbm90IGRlZmluZWQuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogTmV3
LgoKLS0tIGEveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
YWdpbmcuYwpAQCAtODM3LDcgKzgzNyw5IEBAIGludCBwYWdpbmdfZW5hYmxlKHN0cnVjdCBkb21h
aW4gKmQsIHUzMgogICAgIHN3aXRjaCAoIG1vZGUgJiAoUEdfZXh0ZXJuYWwgfCBQR190cmFuc2xh
dGUgfCBQR19yZWZjb3VudHMpICkKICAgICB7CiAgICAgY2FzZSAwOgorI2lmIFBHX2V4dGVybmFs
IHwgUEdfdHJhbnNsYXRlIHwgUEdfcmVmY291bnRzCiAgICAgY2FzZSBQR19leHRlcm5hbCB8IFBH
X3RyYW5zbGF0ZSB8IFBHX3JlZmNvdW50czoKKyNlbmRpZgogICAgICAgICBicmVhazsKICAgICBk
ZWZhdWx0OgogICAgICAgICByZXR1cm4gLUVJTlZBTDsKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wYWdpbmcuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2luZy5oCkBAIC00NiwxOSAr
NDYsMjkgQEAKICNkZWZpbmUgUEdfU0hfZW5hYmxlICAgMAogI2RlZmluZSBQR19TSF9mb3JjZWQg
ICAwCiAjZW5kaWYKKyNpZmRlZiBDT05GSUdfSFZNCiAjZGVmaW5lIFBHX0hBUF9lbmFibGUgICgx
VSA8PCBQR19IQVBfc2hpZnQpCisjZWxzZQorI2RlZmluZSBQR19IQVBfZW5hYmxlICAwCisjZW5k
aWYKIAogLyogY29tbW9uIHBhZ2luZyBtb2RlIGJpdHMgKi8KICNkZWZpbmUgUEdfbW9kZV9zaGlm
dCAgMTAgCisjaWZkZWYgQ09ORklHX0hWTQogLyogUmVmY291bnRzIGJhc2VkIG9uIHNoYWRvdyB0
YWJsZXMgaW5zdGVhZCBvZiBndWVzdCB0YWJsZXMgKi8KICNkZWZpbmUgUEdfcmVmY291bnRzICAg
KFhFTl9ET01DVExfU0hBRE9XX0VOQUJMRV9SRUZDT1VOVCA8PCBQR19tb2RlX3NoaWZ0KQotLyog
RW5hYmxlIGxvZyBkaXJ0eSBtb2RlICovCi0jZGVmaW5lIFBHX2xvZ19kaXJ0eSAgIChYRU5fRE9N
Q1RMX1NIQURPV19FTkFCTEVfTE9HX0RJUlRZIDw8IFBHX21vZGVfc2hpZnQpCiAvKiBYZW4gZG9l
cyBwMm0gdHJhbnNsYXRpb24sIG5vdCBndWVzdCAqLwogI2RlZmluZSBQR190cmFuc2xhdGUgICAo
WEVOX0RPTUNUTF9TSEFET1dfRU5BQkxFX1RSQU5TTEFURSA8PCBQR19tb2RlX3NoaWZ0KQogLyog
WGVuIGRvZXMgbm90IHN0ZWFsIGFkZHJlc3Mgc3BhY2UgZnJvbSB0aGUgZG9tYWluIGZvciBpdHMg
b3duIGJvb2tpbmc7CiAgKiByZXF1aXJlcyBWVCBvciBzaW1pbGFyIG1lY2hhbmlzbXMgKi8KICNk
ZWZpbmUgUEdfZXh0ZXJuYWwgICAgKFhFTl9ET01DVExfU0hBRE9XX0VOQUJMRV9FWFRFUk5BTCA8
PCBQR19tb2RlX3NoaWZ0KQorI2Vsc2UKKyNkZWZpbmUgUEdfcmVmY291bnRzICAgMAorI2RlZmlu
ZSBQR190cmFuc2xhdGUgICAwCisjZGVmaW5lIFBHX2V4dGVybmFsICAgIDAKKyNlbmRpZgorLyog
RW5hYmxlIGxvZyBkaXJ0eSBtb2RlICovCisjZGVmaW5lIFBHX2xvZ19kaXJ0eSAgIChYRU5fRE9N
Q1RMX1NIQURPV19FTkFCTEVfTE9HX0RJUlRZIDw8IFBHX21vZGVfc2hpZnQpCiAKIC8qIEFsbCBw
YWdpbmcgbW9kZXMuICovCiAjZGVmaW5lIFBHX01BU0sgKFBHX3JlZmNvdW50cyB8IFBHX2xvZ19k
aXJ0eSB8IFBHX3RyYW5zbGF0ZSB8IFBHX2V4dGVybmFsKQoKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
