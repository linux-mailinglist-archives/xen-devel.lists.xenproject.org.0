Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4690A3BCEC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1p-0007cp-GD; Mon, 10 Jun 2019 19:32:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1n-0007cP-CR
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:23 +0000
X-Inumbo-ID: 76ac26e8-8bb6-11e9-a02e-ef0228b4bcef
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 76ac26e8-8bb6-11e9-a02e-ef0228b4bcef;
 Mon, 10 Jun 2019 19:32:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21C91344;
 Mon, 10 Jun 2019 12:32:20 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 381EE3F73C;
 Mon, 10 Jun 2019 12:32:19 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:31:58 +0100
Message-Id: <20190610193215.23704-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH 00/17] xen/arm64: Rework head.S to make it more
 compliant with the Arm Arm
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyBwYXJ0IG9mIHRoZSBib290L21lbW9yeSByZXdvcmsgZm9yIFhlbiBv
biBBcm0sIGJ1dCBub3Qgc2VudCBhcwpNTS1QQVJUeCBhcyB0aGlzIGlzIGZvY3VzaW5nIG9uIHRo
ZSBib290IGNvZGUuCgpTaW1pbGFyIHRvIHRoZSBtZW1vcnkgY29kZSwgdGhlIGJvb3QgY29kZSBp
cyBub3QgZm9sbG93aW5nIHRoZSBBcm0gQXJtIGFuZApjb3VsZCBsZWFkIHRvIG1lbW9yeSBjb3Jy
dXB0aW9uL1RMQiBjb25mbGljdCBhYm9ydC4gSSBhbSBub3QgYXdhcmUKb2YgYW55IHBsYXRmb3Jt
cyB3aGVyZSBYZW4gZmFpbHMgdG8gYm9vdCwgeWV0IGl0IHNob3VsZCBiZSBmaXhlZCBzb29uZXIK
cmF0aGVyIHRoYW4gbGF0ZXIuCgpXaGlsZSBtYWtpbmcgdGhlIGNvZGUgbW9yZSBjb21wbGlhbnQs
IEkgaGF2ZSBhbHNvIHRvb2sgdGhlIG9wcG9ydHVuaXR5CnRvIHNpbXBsaWZ5IHRoZSBib290IGFu
ZCBhbHNvIGFkZCBtb3JlIGRvY3VtZW50YXRpb24uCgpBZnRlciB0aGlzIHNlcmllcywgdGhlIGJv
b3QgQ1BVIGFuZCBzZWNvbmRhcnkgQ1BVcyBwYXRoIGlzIG1vc3RseSBjb21wbGlhbnQKd2l0aCB0
aGUgQXJtIEFybS4gVGhlIG9ubHkgbm9uLWNvbXBsaWFudCBwbGFjZXMgSSBhbSBhd2FyZSBvZiBh
cmU6CiAgICAxKSBjcmVhdGVfcGFnZV90YWJsZXM6IFNvbWUgcmV3b3JrIGlzIG5lY2Vzc2FyeSB0
byB1cGRhdGUgdGhlIHBhZ2UtdGFibGVzCiAgICBzYWZlbHkgd2l0aG91dCB0aGUgTU1VIG9uLgog
ICAgMikgVGhlIHN3aXRjaGVzIGJldHdlZW4gYm9vdCBhbmQgcnVudGltZSBwYWdlLXRhYmxlcyAo
Zm9yIGJvdGggYm9vdCBDUFUKICAgICAgIGFuZCBzZWNvbmRhcnkgQ1BVcykgYXJlIG5vdCBzYWZl
LgoKQm90aCB3aWxsIGJlIGFkZHJlc3NlZCBpbiBmb2xsb3ctdXAgd29yay4KCkxhc3RseSwgb25s
eSBBcm02NCBoYXMgYmVlbiBtb2RpZmllZCBzbyBmYXIuIEFybTMyIHJlcXVpcmVzIHRoZSBzYW1l
Cm1vZGlmaWNhdGlvbnMuIEl0IHdpbGwgYmUgc2VudCBvbmNlIEkgZ2F0aGVyZWQgZmVlZGJhY2sg
b24gdGhlIGFwcHJvYWNoLgoKTm90ZSB0aGF0IHRoZSBzZXJpZXMgaGF2ZSBhIG1pbm9yIGNsYXNo
IHdpdGggTU0tUEFSVDMgYW5kIHJlZmVyZW5jZSBzb21lCmNoYW5nZSBkb25lIGluIE1NLVBBUlQx
LiBZZXQgdGhlIGNvZGUgaXMgbW9zdGx5IHNlbGYtY29udGFpbmVkIHRvCnhlbi9hcmNoL2FybTY0
L2hlYWQuUy4KCkZvciBjb252ZW5pZW5jZSBJIHByb3ZpZGVkIGEgYnJhbmNoIGJhc2VkIG9uIHN0
YWdpbmc6CiAgICBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL2p1bGllbmcveGVuLXVuc3Rh
YmxlLmdpdCBicmFuY2ggYm9vdC9hcm02NC92MQoKQ2hlZXJzLAoKSnVsaWVuIEdyYWxsICgxNyk6
CiAgeGVuL2FybTY0OiBoZWFkIE1hcmsgdGhlIGVuZCBvZiBzdWJyb3V0aW5lcyB3aXRoIEVORFBS
T0MKICB4ZW4vYXJtNjQ6IGhlYWQ6IERvbid0IGNsb2JiZXIgeDMwL2xyIGluIHRoZSBtYWNybyBQ
UklOVAogIHhlbi9hcm02NDogaGVhZDogUmV3b3JrIFVBUlQgaW5pdGlhbGl6YXRpb24gb24gYm9v
dCBDUFUKICB4ZW4vYXJtNjQ6IGhlYWQ6IERvbid0ICJyZXNlcnZlIiB4MjQgZm9yIHRoZSBDUFVJ
RAogIHhlbi9hcm02NDogaGVhZDogSW50cm9kdWNlIHByaW50X3JlZwogIHhlbi9hcm02NDogaGVh
ZDogSW50cm9kdWNlIGRpc3RpbmN0IHBhdGhzIGZvciB0aGUgYm9vdCBDUFUgYW5kCiAgICBzZWNv
bmRhcnkgQ1BVcwogIHhlbi9hcm02NDogaGVhZDogUmV3b3JrIGFuZCBkb2N1bWVudCBjaGVja19j
cHVfbW9kZSgpCiAgeGVuL2FybTY0OiBoZWFkOiBSZXdvcmsgYW5kIGRvY3VtZW50IHplcm9fYnNz
KCkKICB4ZW4vYXJtNjQ6IGhlYWQ6IEltcHJvdmUgY29kaW5nIHN0eWxlIGFuZCBkb2N1bWVudCBj
cHVfaW5pdCgpCiAgeGVuL2FybTY0OiBoZWFkOiBJbXByb3ZlIGNvZGluZyBzdHlsZSBhbmQgZG9j
dW1lbnQKICAgIGNyZWF0ZV9wYWdlc190YWJsZXMoKQogIHhlbi9hcm02NDogaGVhZDogRG9jdW1l
bnQgZW5hYmxlX21tdSgpCiAgeGVuL2FybTY0OiBoZWFkOiBNb3ZlIGFzc2VtYmx5IHN3aXRjaCB0
byB0aGUgcnVudGltZSBQVCBpbiBzZWNvbmRhcnkKICAgIENQVXMgcGF0aAogIHhlbi9hcm02NDog
aGVhZDogRG9uJ3Qgc2V0dXAgdGhlIGZpeG1hcCBvbiBzZWNvbmRhcnkgQ1BVcwogIHhlbi9hcm02
NDogaGVhZDogUmVtb3ZlIElEIG1hcCBhcyBzb29uIGFzIGl0IGlzIG5vdCB1c2VkCiAgeGVuL2Fy
bTY0OiBoZWFkOiBSZXdvcmsgYW5kIGRvY3VtZW50IHNldHVwX2ZpeG1hcCgpCiAgeGVuL2FybTY0
OiBoZWFkOiBSZXdvcmsgYW5kIGRvY3VtZW50IGxhdW5jaCgpCiAgeGVuL2FybTY0OiBaZXJvIEJT
UyBhZnRlciB0aGUgTU1VIGFuZCBELWNhY2hlIGlzIHR1cm5lZCBvbgoKIHhlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMgfCAzOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICB8ICAyMyArKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMzA2IGluc2VydGlvbnMoKyksIDExMyBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
