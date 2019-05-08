Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7077D17A2B
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:15:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMOk-0007yZ-AG; Wed, 08 May 2019 13:14:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMOi-0007yN-Sg
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:14:12 +0000
X-Inumbo-ID: 29d8ce08-7193-11e9-8199-4b334b65a014
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29d8ce08-7193-11e9-8199-4b334b65a014;
 Wed, 08 May 2019 13:14:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:14:08 -0600
Message-Id: <5CD2D61E020000780022CD88@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:14:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 12/12] x86/IRQ: simplify and rename
 pirq_acktype()
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

SXRzIG9ubHkgY2FsbGVyIGFscmVhZHkgaGFzIHRoZSBJUlEgZGVzY3JpcHRvciBpbiBpdHMgaGFu
ZHMsIHNvIHRoZXJlJ3MKbm8gbmVlZCBmb3IgdGhlIGZ1bmN0aW9uIHRvIHJlLW9idGFpbiBpdC4g
QXMgYSByZXN1bHQgdGhlIGxlYWRpbmcgcCBvZgppdHMgbmFtZSBpcyBubyBsb25nZXIgYXBwcm9w
cmlhdGUgYW5kIGhlbmNlIGdldHMgZHJvcHBlZC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBOZXcuCgotLS0gYS94ZW4vYXJjaC94ODYvaXJx
LmMKKysrIGIveGVuL2FyY2gveDg2L2lycS5jCkBAIC0xNTUwLDE3ICsxNTUwLDggQEAgaW50IHBp
cnFfZ3Vlc3RfdW5tYXNrKHN0cnVjdCBkb21haW4gKmQpCiAgICAgcmV0dXJuIDA7CiB9CiAKLXN0
YXRpYyBpbnQgcGlycV9hY2t0eXBlKHN0cnVjdCBkb21haW4gKmQsIGludCBwaXJxKQorc3RhdGlj
IGludCBpcnFfYWNrdHlwZShjb25zdCBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpCiB7Ci0gICAgc3Ry
dWN0IGlycV9kZXNjICAqZGVzYzsKLSAgICBpbnQgaXJxOwotCi0gICAgaXJxID0gZG9tYWluX3Bp
cnFfdG9faXJxKGQsIHBpcnEpOwotICAgIGlmICggaXJxIDw9IDAgKQotICAgICAgICByZXR1cm4g
QUNLVFlQRV9OT05FOwotCi0gICAgZGVzYyA9IGlycV90b19kZXNjKGlycSk7Ci0KICAgICBpZiAo
IGRlc2MtPmhhbmRsZXIgPT0gJm5vX2lycV90eXBlICkKICAgICAgICAgcmV0dXJuIEFDS1RZUEVf
Tk9ORTsKIApAQCAtMTU5MSw3ICsxNTgyLDggQEAgc3RhdGljIGludCBwaXJxX2Fja3R5cGUoc3Ry
dWN0IGRvbWFpbiAqZAogICAgIGlmICggIXN0cmNtcChkZXNjLT5oYW5kbGVyLT50eXBlbmFtZSwg
IlhULVBJQyIpICkKICAgICAgICAgcmV0dXJuIEFDS1RZUEVfVU5NQVNLOwogCi0gICAgcHJpbnRr
KCJVbmtub3duIFBJQyB0eXBlICclcycgZm9yIElSUSAlZFxuIiwgZGVzYy0+aGFuZGxlci0+dHlw
ZW5hbWUsIGlycSk7CisgICAgcHJpbnRrKCJVbmtub3duIFBJQyB0eXBlICclcycgZm9yIElSUSVk
XG4iLAorICAgICAgICAgICBkZXNjLT5oYW5kbGVyLT50eXBlbmFtZSwgZGVzYy0+aXJxKTsKICAg
ICBCVUcoKTsKIAogICAgIHJldHVybiAwOwpAQCAtMTY2OCw3ICsxNjYwLDcgQEAgaW50IHBpcnFf
Z3Vlc3RfYmluZChzdHJ1Y3QgdmNwdSAqdiwgc3RydQogICAgICAgICBhY3Rpb24tPm5yX2d1ZXN0
cyAgID0gMDsKICAgICAgICAgYWN0aW9uLT5pbl9mbGlnaHQgICA9IDA7CiAgICAgICAgIGFjdGlv
bi0+c2hhcmVhYmxlICAgPSB3aWxsX3NoYXJlOwotICAgICAgICBhY3Rpb24tPmFja190eXBlICAg
ID0gcGlycV9hY2t0eXBlKHYtPmRvbWFpbiwgcGlycS0+cGlycSk7CisgICAgICAgIGFjdGlvbi0+
YWNrX3R5cGUgICAgPSBpcnFfYWNrdHlwZShkZXNjKTsKICAgICAgICAgaW5pdF90aW1lcigmYWN0
aW9uLT5lb2lfdGltZXIsIGlycV9ndWVzdF9lb2lfdGltZXJfZm4sIGRlc2MsIDApOwogCiAgICAg
ICAgIGRlc2MtPnN0YXR1cyB8PSBJUlFfR1VFU1Q7CgoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
