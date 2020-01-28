Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E722014B904
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:31:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRqq-0002WG-6T; Tue, 28 Jan 2020 14:28:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VmX/=3R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwRqo-0002W5-Q0
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:28:22 +0000
X-Inumbo-ID: 6f78e764-41da-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f78e764-41da-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 14:28:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4C281AC88;
 Tue, 28 Jan 2020 14:28:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 Jan 2020 15:28:16 +0100
Message-Id: <20200128142818.27200-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200128142818.27200-1-jgross@suse.com>
References: <20200128142818.27200-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/3] xenstore: setup xenstore stubdom console
 interface properly
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byBnZXQgYWNjZXNzIHRvIHRoZSBjb25zb2xlIG9mIFhlbnN0
b3JlIHN0dWJkb20Kd2UgbmVlZCBhbiBhcHByb3ByaWF0ZSBncmFudHRhYiBlbnRyeS4gU28gY2Fs
bCB4Y19kb21fZ250dGFiX2luaXQoKQp3aGVuIGNvbnN0cnVjdGluZyB0aGUgZG9tYWluIGFuZCBw
cmVzZXQgc29tZSBpbmZvcm1hdGlvbiBuZWVkZWQKZm9yIHRoYXQgZnVuY3Rpb24gaW4gdGhlIGRv
bSBzdHJ1Y3R1cmUuCgpXZSBuZWVkIHRvIGNyZWF0ZSB0aGUgZXZlbnQgY2hhbm5lbCBmb3IgdGhl
IGNvbnNvbGUsIHRvby4gRG8gdGhhdCBhbmQKc3RvcmUgYWxsIG5lY2Vzc2FyeSBkYXRhIGxvY2Fs
bHkuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQog
dG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIHwgMTMgKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9oZWxw
ZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMgYi90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUt
ZG9tYWluLmMKaW5kZXggYWRiODQwOGI2My4uYTMxMmJjMzhiOCAxMDA2NDQKLS0tIGEvdG9vbHMv
aGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jCisrKyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC14
ZW5zdG9yZS1kb21haW4uYwpAQCAtMjQsNiArMjQsOCBAQCBzdGF0aWMgY2hhciAqcGFyYW07CiBz
dGF0aWMgY2hhciAqbmFtZSA9ICJYZW5zdG9yZSI7CiBzdGF0aWMgaW50IG1lbW9yeTsKIHN0YXRp
YyBpbnQgbWF4bWVtOworc3RhdGljIHhlbl9wZm5fdCBjb25zb2xlX21mbjsKK3N0YXRpYyB1bnNp
Z25lZCBpbnQgY29uc29sZV9ldnRjaG47CiAKIHN0YXRpYyBzdHJ1Y3Qgb3B0aW9uIG9wdGlvbnNb
XSA9IHsKICAgICB7ICJrZXJuZWwiLCAxLCBOVUxMLCAnaycgfSwKQEAgLTExMyw2ICsxMTUsNyBA
QCBzdGF0aWMgaW50IGJ1aWxkKHhjX2ludGVyZmFjZSAqeGNoKQogICAgICAgICBmcHJpbnRmKHN0
ZGVyciwgInhjX2RvbWFpbl9zZXRtYXhtZW0gZmFpbGVkXG4iKTsKICAgICAgICAgZ290byBlcnI7
CiAgICAgfQorICAgIGNvbnNvbGVfZXZ0Y2huID0geGNfZXZ0Y2huX2FsbG9jX3VuYm91bmQoeGNo
LCBkb21pZCwgMCk7CiAgICAgcnYgPSB4Y19kb21haW5fc2V0X21lbW1hcF9saW1pdCh4Y2gsIGRv
bWlkLCBsaW1pdF9rYik7CiAgICAgaWYgKCBydiApCiAgICAgewpAQCAtMTMzLDYgKzEzNiw5IEBA
IHN0YXRpYyBpbnQgYnVpbGQoeGNfaW50ZXJmYWNlICp4Y2gpCiAgICAgICAgIHNucHJpbnRmKGNt
ZGxpbmUsIDUxMiwgIi0tZXZlbnQgJWQgLS1pbnRlcm5hbC1kYiIsIHJ2KTsKIAogICAgIGRvbSA9
IHhjX2RvbV9hbGxvY2F0ZSh4Y2gsIGNtZGxpbmUsIE5VTEwpOworICAgIGRvbS0+Y29udGFpbmVy
X3R5cGUgPSBYQ19ET01fUFZfQ09OVEFJTkVSOworICAgIGRvbS0+eGVuc3RvcmVfZG9taWQgPSBk
b21pZDsKKyAgICBkb20tPmNvbnNvbGVfZXZ0Y2huID0gY29uc29sZV9ldnRjaG47CiAgICAgcnYg
PSB4Y19kb21fa2VybmVsX2ZpbGUoZG9tLCBrZXJuZWwpOwogICAgIGlmICggcnYgKQogICAgIHsK
QEAgLTE4Niw2ICsxOTIsMTIgQEAgc3RhdGljIGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkK
ICAgICAgICAgZnByaW50ZihzdGRlcnIsICJ4Y19kb21fYm9vdF9pbWFnZSBmYWlsZWRcbiIpOwog
ICAgICAgICBnb3RvIGVycjsKICAgICB9CisgICAgcnYgPSB4Y19kb21fZ250dGFiX2luaXQoZG9t
KTsKKyAgICBpZiAoIHJ2ICkKKyAgICB7CisgICAgICAgIGZwcmludGYoc3RkZXJyLCAieGNfZG9t
X2dudHRhYl9pbml0IGZhaWxlZFxuIik7CisgICAgICAgIGdvdG8gZXJyOworICAgIH0KIAogICAg
IHJ2ID0geGNfZG9tYWluX3NldF92aXJxX2hhbmRsZXIoeGNoLCBkb21pZCwgVklSUV9ET01fRVhD
KTsKICAgICBpZiAoIHJ2ICkKQEAgLTIwMSw2ICsyMTMsNyBAQCBzdGF0aWMgaW50IGJ1aWxkKHhj
X2ludGVyZmFjZSAqeGNoKQogICAgIH0KIAogICAgIHJ2ID0gMDsKKyAgICBjb25zb2xlX21mbiA9
IHhjX2RvbV9wMm0oZG9tLCBkb20tPmNvbnNvbGVfcGZuKTsKIAogZXJyOgogICAgIGlmICggZG9t
ICkKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
