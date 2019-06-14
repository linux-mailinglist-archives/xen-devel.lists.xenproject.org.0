Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CDA46667
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 19:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqMl-0001mV-UV; Fri, 14 Jun 2019 17:51:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqMk-0001mQ-MS
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:51:54 +0000
X-Inumbo-ID: 1756914e-8ecd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1756914e-8ecd-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 17:51:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E6F32B;
 Fri, 14 Jun 2019 10:51:52 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 511BF3F718;
 Fri, 14 Jun 2019 10:51:51 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Jun 2019 18:51:35 +0100
Message-Id: <20190614175144.20046-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH MM-PART3 v3 0/9] xen/arm: Provide a generic
 function to update Xen PT
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyB0aGUgdGhpcmQgcGFydCBvZiB0aGUgYm9vdC9tZW1vcnkgcmV3b3Jr
IGZvciBYZW4gb24gQXJtLiBBdCB0aGUKbW9tZW50LCB0aGUgdXBkYXRlIHRvIFhlbiBQVCBpcyBz
Y2F0dGVyZWQgYWxsIGFyb3VuZCBtbS5jLiBUaGlzIG1ha2VzCmRpZmZpY3VsdCB0byByZXdvcmsg
WGVuIG1lbW9yeSBsYXlvdXQgb3IgZXZlbiBlbnN1cmluZyB3ZSBhcmUgZm9sbG93aW5nIHRoZQpB
cm0gQXJtIHByb3Blcmx5IChhbmQgd2UgYXJlIG5vdCBzbyBmYXIhKS4KClRoaXMgcGFydCBjb250
YWlucyBjb2RlIHRvIHByb3ZpZGUgYSBnZW5lcmljIGZ1bmN0aW9uIHRvIHVwZGF0ZSBYZW4gUFQu
CldoaWxlIEkgY291bGQgaGF2ZSBzdGFydGVkIGZyb20gc2NyYXRjaCwgSSBkZWNpZGVkIHRvIGJh
c2UgdGhlIG5ldyBmdW5jdGlvbgpvbiBjcmVhdGVfeGVuX2VudHJpZXMoKSAobm93IHJlbmFtZWQg
eGVuX3B0X3VwZGF0ZSgpKS4gVGhpcyBtYWtlcyBzbGlnaHRseQplYXNpZXIgdG8gZm9sbG93IHRo
ZSBjaGFuZ2VzLgoKSW4gdGhpcyBzZXJpZXMsIHRoZSBuZXcgZ2VuZXJpYyBmdW5jdGlvbiB3aWxs
IG9ubHkgc3VwcG9ydCAzcmQtbGV2ZWwgdXBkYXRlCmFuZCBjYW5ub3QgYmUgdXNlZCBpbiBlYXJs
eSBib290IChpLmUgYmVjYXVzZSB4ZW5oZWFwIGlzIG5vdCBpbml0aWFsaXplZCkuClRoaXMgd2ls
bCBiZSBleHRlbmRlZCBpbiBmb2xsb3ctdXAgc2VyaWVzIHRvIGFsbG93IG1vcmUgdXNlIHdpdGhp
biBtbS5jLgoKVGhlcmUgYXJlIHByb2JhYmx5IHNvbWUgb3B0aW1pemF0aW9uIHBvc3NpYmxlIGFy
b3VuZCB0aGUgVExCcyBmbHVzaC4gSSBoYXZlbid0Cmxvb2tlZCBhdCBpdCBzbyBmYXIuCgpUaGUg
bGFzdCB0d28gcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyBpcyB0byBzaG93IGhvdyBleGlzdGluZyBj
YWxsZXJzIGNhbiBiZQpjb252ZXJ0ZWQuIFRoZXJlIGFyZSBtb3JlIGNvbnZlcnNpb24gdG8gY29t
ZSBpbiBmb2xsb3ctdXAgc2VyaWVzLgoKRm9yIGNvbnZlbmllbmNlLCBJIHByb3ZpZGVkIGEgYnJh
bmNoIHdpdGggYWxsIHRoZSBwYXRjaGVzIGFwcGxpZWQgYmFzZQpvbiBzdGFnaW5nLgoKZ2l0Oi8v
eGVuYml0cy54ZW4ub3JnL3Blb3BsZS9qdWxpZW5nL3hlbi11bnN0YWJsZS5naXQgYnJhbmNoIG1t
L3BhcnQzL3YzCgpDaGVlcnMsCgpKdWxpZW4gR3JhbGwgKDkpOgogIHhlbi9hcm06IFJld29yayBI
U0NUTFJfQkFTRQogIHhlbi9hcm06IG1tOiBJbnRyb2R1Y2UgX1BBR0VfUFJFU0VOVCBhbmQgX1BB
R0VfUE9QVUxBVEUKICB4ZW4vYXJtOiBtbTogU2FuaXR5IGNoZWNrIGFueSB1cGRhdGUgb2YgWGVu
IHBhZ2UgdGFibGVzCiAgeGVuL2FybTogbW06IFJld29yayB4ZW5fcHRfdXBkYXRlX2VudHJ5IHRv
IGF2b2lkIHVzZSB4ZW5tYXBfb3BlcmF0aW9uCiAgeGVuL2FybTogbW06IFJlbW92ZSBlbnVtIHhl
bm1hcF9vcGVyYXRpb24KICB4ZW4vYXJtOiBtbTogVXNlIHssIHVufW1hcF9kb21haW5fcGFnZSgp
IHRvIG1hcC91bm1hcCBYZW4gcGFnZS10YWJsZXMKICB4ZW4vYXJtOiBtbTogUmV3b3JrIFhlbiBw
YWdlLXRhYmxlcyB3YWxrIGR1cmluZyB1cGRhdGUKICB4ZW4vYXJtOiBtbTogRG9uJ3Qgb3Blbi1j
b2RlIFhlbiBQVCB1cGRhdGUgaW4ge3NldCwgY2xlYXJ9X2ZpeG1hcCgpCiAgeGVuL2FybTogbW06
IFJlbW92ZSBzZXRfcHRlX2ZsYWdzX29uX3JhbmdlKCkKCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TICAgICAgIHwgIDEyICstCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICAgIHwgIDEw
ICstCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgICAgICAgIHwgMzkwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oICAg
ICAgfCAgIDkgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggfCAgNTYgKysrKyst
CiA1IGZpbGVzIGNoYW5nZWQsIDMzMiBpbnNlcnRpb25zKCspLCAxNDUgZGVsZXRpb25zKC0pCgot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
