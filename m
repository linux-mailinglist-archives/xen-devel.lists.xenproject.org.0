Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F2015A257
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 08:45:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1mer-00010v-Sy; Wed, 12 Feb 2020 07:42:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TtlS=4A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1meq-00010o-Af
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 07:42:04 +0000
X-Inumbo-ID: 25b49bf4-4d6b-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25b49bf4-4d6b-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 07:41:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 30C21AF62;
 Wed, 12 Feb 2020 07:41:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 12 Feb 2020 08:41:52 +0100
Message-Id: <20200212074154.23755-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200212074154.23755-1-jgross@suse.com>
References: <20200212074154.23755-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 1/3] xenstore: setup xenstore stubdom console
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
dG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIHwgMjIgKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMgYi90b29scy9oZWxwZXJzL2luaXQt
eGVuc3RvcmUtZG9tYWluLmMKaW5kZXggYWRiODQwOGI2My4uM2E4Y2E2NDc0MSAxMDA2NDQKLS0t
IGEvdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jCisrKyBiL3Rvb2xzL2hlbHBl
cnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYwpAQCAtMjQsNiArMjQsNyBAQCBzdGF0aWMgY2hhciAq
cGFyYW07CiBzdGF0aWMgY2hhciAqbmFtZSA9ICJYZW5zdG9yZSI7CiBzdGF0aWMgaW50IG1lbW9y
eTsKIHN0YXRpYyBpbnQgbWF4bWVtOworc3RhdGljIHhjX2V2dGNobl9wb3J0X29yX2Vycm9yX3Qg
Y29uc29sZV9ldnRjaG47CiAKIHN0YXRpYyBzdHJ1Y3Qgb3B0aW9uIG9wdGlvbnNbXSA9IHsKICAg
ICB7ICJrZXJuZWwiLCAxLCBOVUxMLCAnaycgfSwKQEAgLTExMyw2ICsxMTQsMTIgQEAgc3RhdGlj
IGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkKICAgICAgICAgZnByaW50ZihzdGRlcnIsICJ4
Y19kb21haW5fc2V0bWF4bWVtIGZhaWxlZFxuIik7CiAgICAgICAgIGdvdG8gZXJyOwogICAgIH0K
KyAgICBjb25zb2xlX2V2dGNobiA9IHhjX2V2dGNobl9hbGxvY191bmJvdW5kKHhjaCwgZG9taWQs
IDApOworICAgIGlmICggY29uc29sZV9ldnRjaG4gPCAwICkKKyAgICB7CisgICAgICAgIGZwcmlu
dGYoc3RkZXJyLCAieGNfZXZ0Y2huX2FsbG9jX3VuYm91bmQgZmFpbGVkXG4iKTsKKyAgICAgICAg
Z290byBlcnI7CisgICAgfQogICAgIHJ2ID0geGNfZG9tYWluX3NldF9tZW1tYXBfbGltaXQoeGNo
LCBkb21pZCwgbGltaXRfa2IpOwogICAgIGlmICggcnYgKQogICAgIHsKQEAgLTEzMyw2ICsxNDAs
MTUgQEAgc3RhdGljIGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkKICAgICAgICAgc25wcmlu
dGYoY21kbGluZSwgNTEyLCAiLS1ldmVudCAlZCAtLWludGVybmFsLWRiIiwgcnYpOwogCiAgICAg
ZG9tID0geGNfZG9tX2FsbG9jYXRlKHhjaCwgY21kbGluZSwgTlVMTCk7CisgICAgaWYgKCAhZG9t
ICkKKyAgICB7CisgICAgICAgIGZwcmludGYoc3RkZXJyLCAieGNfZG9tX2FsbG9jYXRlIGZhaWxl
ZFxuIik7CisgICAgICAgIGdvdG8gZXJyOworICAgIH0KKyAgICBkb20tPmNvbnRhaW5lcl90eXBl
ID0gWENfRE9NX1BWX0NPTlRBSU5FUjsKKyAgICBkb20tPnhlbnN0b3JlX2RvbWlkID0gZG9taWQ7
CisgICAgZG9tLT5jb25zb2xlX2V2dGNobiA9IGNvbnNvbGVfZXZ0Y2huOworCiAgICAgcnYgPSB4
Y19kb21fa2VybmVsX2ZpbGUoZG9tLCBrZXJuZWwpOwogICAgIGlmICggcnYgKQogICAgIHsKQEAg
LTE4Niw2ICsyMDIsMTIgQEAgc3RhdGljIGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkKICAg
ICAgICAgZnByaW50ZihzdGRlcnIsICJ4Y19kb21fYm9vdF9pbWFnZSBmYWlsZWRcbiIpOwogICAg
ICAgICBnb3RvIGVycjsKICAgICB9CisgICAgcnYgPSB4Y19kb21fZ250dGFiX2luaXQoZG9tKTsK
KyAgICBpZiAoIHJ2ICkKKyAgICB7CisgICAgICAgIGZwcmludGYoc3RkZXJyLCAieGNfZG9tX2du
dHRhYl9pbml0IGZhaWxlZFxuIik7CisgICAgICAgIGdvdG8gZXJyOworICAgIH0KIAogICAgIHJ2
ID0geGNfZG9tYWluX3NldF92aXJxX2hhbmRsZXIoeGNoLCBkb21pZCwgVklSUV9ET01fRVhDKTsK
ICAgICBpZiAoIHJ2ICkKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
