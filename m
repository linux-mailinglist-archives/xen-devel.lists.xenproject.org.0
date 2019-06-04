Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F130534663
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 14:17:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY8Li-0007ZB-QF; Tue, 04 Jun 2019 12:15:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY8Lh-0007Z5-90
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 12:15:29 +0000
X-Inumbo-ID: 6db216a4-86c2-11e9-8503-f39052d8e86c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6db216a4-86c2-11e9-8503-f39052d8e86c;
 Tue, 04 Jun 2019 12:15:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 06:15:22 -0600
Message-Id: <5CF660D50200007800235060@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 06:15:17 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2] AMD/IOMMU: don't "add" IOMMUs
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIGZpbmRfaW9tbXVfZm9yX2RldmljZSgpIHRvIGNvbnNpc3RlbnRseSAoaW5kZXBlbmRlbnQg
b2YgQUNQSSB0YWJsZXMpCnJldHVybiBOVUxMIGZvciB0aGUgUENJIGRldmljZXMgY29ycmVzcG9u
ZGluZyB0byBJT01NVXMsIG1ha2Ugc3VyZQpJT01NVXMgZG9uJ3QgZ2V0IG1hcHBlZCB0byB0aGVt
c2VsdmVzIGJ5IGl2cnNfbWFwcGluZ3NbXS4KCldoaWxlIGFtZF9pb21tdV9hZGRfZGV2aWNlKCkg
d29uJ3QgYmUgY2FsbGVkIGZvciBJT01NVXMgZnJvbQpwY2lfYWRkX2RldmljZSgpLCBhcyBJT01N
VXMgaGF2ZSBnb3QgbWFya2VkIHIvbywKX3NldHVwX2h3ZG9tX3BjaV9kZXZpY2VzKCkgY2FsbHMg
dGhlcmUgbmV2ZXJ0aGVsZXNzLiBBdm9pZCBpc3N1aW5nIHRoZQpib2d1cyBkZWJ1Z2dpbmcgb25s
eSAiTm8gaW9tbXUgZm9yIC4uLjsgY2Fubm90IGJlIGhhbmRlZCB0byAuLi4iIGxvZwptZXNzYWdl
IGFzIHdlbGwgYXMgdGhlIG5vbi1kZWJ1Z2dpbmcgInNldHVwIC4uLiBmb3IgLi4uIGZhaWxlZCAo
LTE5KSIKb25lLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgotLS0KdjI6IEFsc28gY2hhbmdlIGFkZF9pdnJzX21hcHBpbmdfZW50cnkoKSBhbmQgZmluZF9p
b21tdV9mb3JfZGV2aWNlKCkKICAgIChJIHNob3VsZCBoYXZlIGNoZWNrZWQgd2h5IEkgZGlkbid0
IHJlY2FsbCBzZWVpbmcgdGhlIGxvZyBtZXNzYWdlcwogICAgb24gdGhlIG9sZGVyIEFNRCBzeXN0
ZW0gYmVmb3JlIHNlbmRpbmcgdjEpLiBPbmx5IHJldHVybiBzdWNjZXNzCiAgICBmcm9tIGFtZF9p
b21tdV9hZGRfZGV2aWNlKCkgZm9yIERvbTAuCi0tLQpUaGUgc2l0dWF0aW9uIGZvciBob3N0IGJy
aWRnZXMgaXMgc2ltaWxhcjogQmVoYXZpb3IgY3VycmVudGx5IGRlcGVuZHMKb24gd2hldGhlciB0
aGV5J3JlIHdpdGhpbiB0aGUgZGV2aWNlIHJhbmdlcyByZXBvcnRlZCBieSBJVlJTIGVudHJpZXMu
Ck9uIHRoZSBvbGRlciBzeXN0ZW0gMDAwMDowMDowMC4wIGlzIGluY2x1ZGVkLCB3aGlsZSBvbiB0
aGUgbmV3ZXIgb25lCml0J3Mgbm90LiBXaGV0aGVyIGl0IGdldHMgaXRzIGRldmljZSB0YWJsZSBl
bnRyeSBwb2ludCB0byBEb20wJ3MgcGFnZQp0YWJsZXMgZGVwZW5kcyBvbiB0aGlzLgoKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYworKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfYWNwaS5jCkBAIC04MSw4ICs4MSw4IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBhZGRfaXZyc19tYXBwaW5nX2VudHIKICAgICAgICAgICAgICBpdnJzX21hcHBp
bmdzW2FsaWFzX2lkXS5pbnRyZW1hcF9pbnVzZSA9IHNoYXJlZF9pbnRyZW1hcF9pbnVzZTsKICAg
ICAgICAgIH0KICAgICB9Ci0gICAgLyogYXNzZ2luIGlvbW11IGhhcmR3YXJlICovCi0gICAgaXZy
c19tYXBwaW5nc1tiZGZdLmlvbW11ID0gaW9tbXU7CisgICAgLyogQXNzaWduIElPTU1VIGhhcmR3
YXJlLCBidXQgZG9uJ3QgbWFwIGFuIElPTU1VIGJ5IGl0c2VsZi4gKi8KKyAgICBpdnJzX21hcHBp
bmdzW2JkZl0uaW9tbXUgPSBpb21tdS0+YmRmICE9IGJkZiA/IGlvbW11IDogTlVMTDsKIH0KIAog
c3RhdGljIHN0cnVjdCBhbWRfaW9tbXUgKiBfX2luaXQgZmluZF9pb21tdV9mcm9tX2JkZl9jYXAo
Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwpAQCAtNDMsNyArNDMs
NyBAQCBzdHJ1Y3QgYW1kX2lvbW11ICpmaW5kX2lvbW11X2Zvcl9kZXZpY2UoCiAgICAgewogICAg
ICAgICB1bnNpZ25lZCBpbnQgYmQwID0gYmRmICYgflBDSV9GVU5DKH4wKTsKIAotICAgICAgICBp
ZiAoIGl2cnNfbWFwcGluZ3NbYmQwXS5pb21tdSApCisgICAgICAgIGlmICggaXZyc19tYXBwaW5n
c1tiZDBdLmlvbW11ICYmIGl2cnNfbWFwcGluZ3NbYmQwXS5pb21tdS0+YmRmICE9IGJkZiApCiAg
ICAgICAgIHsKICAgICAgICAgICAgIHN0cnVjdCBpdnJzX21hcHBpbmdzIHRtcCA9IGl2cnNfbWFw
cGluZ3NbYmQwXTsKIApAQCAtNDI0LDYgKzQyNCwxMSBAQCBzdGF0aWMgaW50IGFtZF9pb21tdV9h
ZGRfZGV2aWNlKHU4IGRldmZuCiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogCiAgICAgYmRmID0g
UENJX0JERjIocGRldi0+YnVzLCBwZGV2LT5kZXZmbik7CisKKyAgICBmb3JfZWFjaF9hbWRfaW9t
bXUoaW9tbXUpCisgICAgICAgIGlmICggcGRldi0+c2VnID09IGlvbW11LT5zZWcgJiYgYmRmID09
IGlvbW11LT5iZGYgKQorICAgICAgICAgICAgcmV0dXJuIGlzX2hhcmR3YXJlX2RvbWFpbihwZGV2
LT5kb21haW4pID8gMCA6IC1FTk9ERVY7CisKICAgICBpb21tdSA9IGZpbmRfaW9tbXVfZm9yX2Rl
dmljZShwZGV2LT5zZWcsIGJkZik7CiAgICAgaWYgKCB1bmxpa2VseSghaW9tbXUpICkKICAgICB7
CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
