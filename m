Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC72D8EB4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:56:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgvX-0002lf-G4; Wed, 16 Oct 2019 10:53:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKgvW-0002lW-2J
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:53:10 +0000
X-Inumbo-ID: 241df2a6-f003-11e9-8aca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 241df2a6-f003-11e9-8aca-bc764e2007e4;
 Wed, 16 Oct 2019 10:53:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04BEA28;
 Wed, 16 Oct 2019 03:53:09 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 259B63F6C4;
 Wed, 16 Oct 2019 03:53:07 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 16 Oct 2019 11:53:03 +0100
Message-Id: <20191016105303.21948-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13 v2] xen/arm: Don't use _end in
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmVs
ZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKLS0tCgpDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpD
YzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KCng4NiBzZWVtcyB0byBiZSBhZmZlY3RlZCBieSB0aGUgb2ZmLWJ5LW9u
ZSBpc3N1ZS4gSmFuLCBBbmRyZXc/CgpUaGlzIGNvdWxkIGJlIHJlYWNoZWQgYnkgYSBkb21haW4g
dmlhIFhFTl9TWVNDVExfcGFnZV9vZmZsaW5lX29wLgpIb3dldmVyLCB0aGUgb3BlcmF0aW9uIGlz
IG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQgKHNlZSBYU0EtNzcpLiBTbyB3ZSBhcmUKZmluZSBoZXJl
LgoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBDYXN0IF9lbmQgdG8gdmFkZHJfdCB0byBw
cmV2ZW50IFVCLgogICAgICAgIC0gQWRkIEp1ZXJnZW4ncyByZWxlYXNlZC1hY2tlZC1ieQotLS0K
IHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
bW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAppbmRleCAyNjJkOTJmMThkLi4zMzNlZmQz
YTYwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oCkBAIC0xNTMsNyArMTUzLDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcg
eGVuaGVhcF9iYXNlX3BkeDsKIAogI2RlZmluZSBpc194ZW5fZml4ZWRfbWZuKG1mbikgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAoKG1mbl90b19tYWRkcihtZm4pID49
IHZpcnRfdG9fbWFkZHIoJl9zdGFydCkpICYmICAgICAgICAgICBcCi0gICAgIChtZm5fdG9fbWFk
ZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKCZfZW5kKSkpCisgICAgIChtZm5fdG9fbWFkZHIobWZu
KSA8PSB2aXJ0X3RvX21hZGRyKCh2YWRkcl90KV9lbmQgLSAxKSkpCiAKICNkZWZpbmUgcGFnZV9n
ZXRfb3duZXIoX3ApICAgIChfcCktPnYuaW51c2UuZG9tYWluCiAjZGVmaW5lIHBhZ2Vfc2V0X293
bmVyKF9wLF9kKSAoKF9wKS0+di5pbnVzZS5kb21haW4gPSAoX2QpKQotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
