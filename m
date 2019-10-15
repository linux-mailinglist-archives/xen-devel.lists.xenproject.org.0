Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78265D7EC5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 20:20:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKROf-0007Mi-Oc; Tue, 15 Oct 2019 18:18:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKROe-0007Ma-D8
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 18:18:12 +0000
X-Inumbo-ID: 251aff05-ef78-11e9-939d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 251aff05-ef78-11e9-939d-12813bfff9fa;
 Tue, 15 Oct 2019 18:18:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B221E28;
 Tue, 15 Oct 2019 11:18:10 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BDED3F6C4;
 Tue, 15 Oct 2019 11:18:08 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 15 Oct 2019 19:18:02 +0100
Message-Id: <20191015181802.21957-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dmlydF90b19tYWRkcigpIGlzIHVzaW5nIHRoZSBoYXJkd2FyZSBwYWdlLXRhYmxlIHdhbGsgaW5z
dHJ1Y3Rpb25zIHRvCnRyYW5zbGF0ZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBwaHlzaWNhbCBhZGRy
ZXNzLiBUaGUgZnVuY3Rpb24gc2hvdWxkCm9ubHkgYmUgY2FsbGVkIG9uIHZpcnR1YWwgYWRkcmVz
cyBtYXBwZWQuCgpfZW5kIHBvaW50cyBwYXN0IHRoZSBlbmQgb2YgWGVuIGJpbmFyeSBhbmQgbWF5
IG5vdCBiZSBtYXBwZWQgd2hlbiB0aGUKYmluYXJ5IHNpemUgaXMgcGFnZS1hbGlnbmVkLiBUaGlz
IG1lYW5zIHZpcnRfdG9fbWFkZHIoKSB3aWxsIG5vdCBiZSBhYmxlCnRvIGRvIHRoZSB0cmFuc2xh
dGlvbiBhbmQgdGhlcmVmb3JlIGNyYXNoIFhlbi4KCk5vdGUgdGhlcmUgaXMgYWxzbyBhbiBvZmYt
Ynktb25lIGlzc3VlIGluIHRoaXMgY29kZSwgYnV0IHRoZSBwYW5pYyB3aWxsCnRydW1wIHRoYXQu
CgpCb3RoIGlzc3VlcyBjYW4gYmUgZml4ZWQgYnkgdXNpbmcgX2VuZCAtIDEgaW4gdGhlIGNoZWNr
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0t
LQoKQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBqZ3Jvc3NAc3VzZS5jb20KCng4NiBzZWVtcyB0byBi
ZSBhZmZlY3RlZCBieSB0aGUgb2ZmLWJ5LW9uZSBpc3N1ZS4gSmFuLCBBbmRyZXc/CgpUaGlzIGNv
dWxkIGJlIHJlYWNoZWQgYnkgYSBkb21haW4gdmlhIFhFTl9TWVNDVExfcGFnZV9vZmZsaW5lX29w
LgpIb3dldmVyLCB0aGUgb3BlcmF0aW9uIGlzIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQgKHNlZSBY
U0EtNzcpLiBTbyB3ZSBhcmUKZmluZSBoZXJlLgotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0u
aCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaAppbmRleCAyNjJkOTJmMThkLi4xNzRhY2Q4ODU5IDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL21tLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCkBAIC0xNTMs
NyArMTUzLDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgeGVuaGVhcF9iYXNlX3BkeDsKIAogI2Rl
ZmluZSBpc194ZW5fZml4ZWRfbWZuKG1mbikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgICAoKG1mbl90b19tYWRkcihtZm4pID49IHZpcnRfdG9fbWFkZHIoJl9zdGFydCkp
ICYmICAgICAgICAgICBcCi0gICAgIChtZm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRy
KCZfZW5kKSkpCisgICAgIChtZm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKF9lbmQg
LSAxKSkpCiAKICNkZWZpbmUgcGFnZV9nZXRfb3duZXIoX3ApICAgIChfcCktPnYuaW51c2UuZG9t
YWluCiAjZGVmaW5lIHBhZ2Vfc2V0X293bmVyKF9wLF9kKSAoKF9wKS0+di5pbnVzZS5kb21haW4g
PSAoX2QpKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
