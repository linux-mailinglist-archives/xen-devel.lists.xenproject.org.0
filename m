Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB19E13D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 13:26:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL4O7-0007rz-W0; Mon, 29 Apr 2019 11:23:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4O6-0007rk-Jm
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:23:58 +0000
X-Inumbo-ID: 46048172-6a71-11e9-a0ff-5f3e81f5e566
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46048172-6a71-11e9-a0ff-5f3e81f5e566;
 Mon, 29 Apr 2019 11:23:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 05:23:54 -0600
Message-Id: <5CC6DEC50200007800229EA0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 05:23:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 3/9] x86/IRQ: improve dump_irqs()
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

RG9uJ3QgbG9nIGEgc3RyYXkgdHJhaWxpbmcgY29tbWEuIFNob3J0ZW4gYSBmZXcgZmllbGRzLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2FyY2gveDg2L2lycS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwpAQCAtMjMxOCw3ICsyMzE4
LDcgQEAgc3RhdGljIHZvaWQgZHVtcF9pcnFzKHVuc2lnbmVkIGNoYXIga2V5KQogCiAgICAgICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZkZXNjLT5sb2NrLCBmbGFncyk7CiAKLSAgICAgICAgcHJpbnRr
KCIgICBJUlE6JTRkIGFmZmluaXR5OiUqcGIgdmVjOiUwMnggdHlwZT0lLTE1cyBzdGF0dXM9JTA4
eCAiLAorICAgICAgICBwcmludGsoIiAgIElSUTolNGQgYWZmOiUqcGIgdmVjOiUwMnggJS0xNXMg
c3RhdHVzPSUwM3ggIiwKICAgICAgICAgICAgICAgIGlycSwgbnJfY3B1X2lkcywgY3B1bWFza19i
aXRzKGRlc2MtPmFmZmluaXR5KSwgZGVzYy0+YXJjaC52ZWN0b3IsCiAgICAgICAgICAgICAgICBk
ZXNjLT5oYW5kbGVyLT50eXBlbmFtZSwgZGVzYy0+c3RhdHVzKTsKIApAQCAtMjMyOSwyMyArMjMy
OSwyMSBAQCBzdGF0aWMgdm9pZCBkdW1wX2lycXModW5zaWduZWQgY2hhciBrZXkpCiAgICAgICAg
IHsKICAgICAgICAgICAgIGFjdGlvbiA9IChpcnFfZ3Vlc3RfYWN0aW9uX3QgKilkZXNjLT5hY3Rp
b247CiAKLSAgICAgICAgICAgIHByaW50aygiaW4tZmxpZ2h0PSVkIGRvbWFpbi1saXN0PSIsIGFj
dGlvbi0+aW5fZmxpZ2h0KTsKKyAgICAgICAgICAgIHByaW50aygiaW4tZmxpZ2h0PSVkJWMiLAor
ICAgICAgICAgICAgICAgICAgIGFjdGlvbi0+aW5fZmxpZ2h0LCBhY3Rpb24tPm5yX2d1ZXN0cyA/
ICcgJyA6ICdcbicpOwogCi0gICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+bnJf
Z3Vlc3RzOyBpKysgKQorICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBhY3Rpb24tPm5yX2d1
ZXN0czsgKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIGQgPSBhY3Rpb24tPmd1ZXN0
W2ldOworICAgICAgICAgICAgICAgIGQgPSBhY3Rpb24tPmd1ZXN0W2krK107CiAgICAgICAgICAg
ICAgICAgcGlycSA9IGRvbWFpbl9pcnFfdG9fcGlycShkLCBpcnEpOwogICAgICAgICAgICAgICAg
IGluZm8gPSBwaXJxX2luZm8oZCwgcGlycSk7Ci0gICAgICAgICAgICAgICAgcHJpbnRrKCIldTol
M2QoJWMlYyVjKSIsCisgICAgICAgICAgICAgICAgcHJpbnRrKCJkJWQ6JTNkKCVjJWMlYyklYyIs
CiAgICAgICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgcGlycSwKICAgICAgICAgICAg
ICAgICAgICAgICAgZXZ0Y2huX3BvcnRfaXNfcGVuZGluZyhkLCBpbmZvLT5ldnRjaG4pID8gJ1An
IDogJy0nLAogICAgICAgICAgICAgICAgICAgICAgICBldnRjaG5fcG9ydF9pc19tYXNrZWQoZCwg
aW5mby0+ZXZ0Y2huKSA/ICdNJyA6ICctJywKLSAgICAgICAgICAgICAgICAgICAgICAgKGluZm8t
Pm1hc2tlZCA/ICdNJyA6ICctJykpOwotICAgICAgICAgICAgICAgIGlmICggaSAhPSBhY3Rpb24t
Pm5yX2d1ZXN0cyApCi0gICAgICAgICAgICAgICAgICAgIHByaW50aygiLCIpOworICAgICAgICAg
ICAgICAgICAgICAgICBpbmZvLT5tYXNrZWQgPyAnTScgOiAnLScsCisgICAgICAgICAgICAgICAg
ICAgICAgIGkgPCBhY3Rpb24tPm5yX2d1ZXN0cyA/ICcsJyA6ICdcbicpOwogICAgICAgICAgICAg
fQotCi0gICAgICAgICAgICBwcmludGsoIlxuIik7CiAgICAgICAgIH0KICAgICAgICAgZWxzZSBp
ZiAoIGRlc2MtPmFjdGlvbiApCiAgICAgICAgICAgICBwcmludGsoIiVwcygpXG4iLCBkZXNjLT5h
Y3Rpb24tPmhhbmRsZXIpOwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
