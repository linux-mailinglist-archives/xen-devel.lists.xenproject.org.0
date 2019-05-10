Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC41E1A301
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 20:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPAFl-0006wJ-N8; Fri, 10 May 2019 18:28:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hPAFj-0006vy-N7
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 18:28:15 +0000
X-Inumbo-ID: 5cba340a-7351-11e9-b1a9-c7d1e482a741
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cba340a-7351-11e9-b1a9-c7d1e482a741;
 Fri, 10 May 2019 18:28:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,454,1549929600"; d="scan'208";a="85337736"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 10 May 2019 19:28:02 +0100
Message-ID: <1557512884-32395-3-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] xen/watchdog: Rearrange the logic to fold
 the timer-arming paths
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QnkgcmVhcnJhbmdpbmcgdGhlIGxvZ2ljLCB0aGUgdGltZXIgYWxsb2NhdGlvbiBsb29wIGNhbiBy
ZXVzZSB0aGUgY29tbW9uIHRpbWVyCmFybWluZy9jbGVhcmluZyBsb2dpYy4gIFRoaXMgcmVzdWx0
cyBpbiBlYXNpZXIgdG8gZm9sbG93IGNvZGUsIGFuZCBhIG1vZGVzdApyZWR1Y3Rpb24gaW4gY29t
cGlsZWQgY29kZSBzaXplICgtNjQsIDI5MCA9PiAyMjYpLgoKRm9yIGRvbWFpbnMgd2hpY2ggdXNl
IHdhdGNoZG9ncywgdGhlIG92ZXJ3aGVtbGluZyBtYWpvcml5IG9mIGh5cGVyY2FsbHMgd2lsbApi
ZSByZS1hcm1pbmcgYW4gZXhpc3RpbmcgdGltZXIuICBBcnJhbmdlIHRoZSBmYXN0cGF0aCB0byBt
YXRjaC4KClRoaXMgZG9lcyBjYXVzZSBvbmUgY2hhbmdlIGluIGJlaGF2aW91ciBmb3IgYSBjb3Ju
ZXIgY2FzZS4gIFByZXZpb3VzbHksCnNwZWNpZnlpbmcgaWQgPSAwLCB0aW1lb3V0ID0gMCB3b3Vs
ZCBpbnN0YW50bHkga2lsbCB0aGUgZG9tYWluLCBhcyB0aGUgdGltZXIKd291bGQgZmlyZSBiZWZv
cmUgcmV0dXJuaW5nIHRvIHRoZSBndWVzdC4gIFRoaXMgY29ybmVyIGNhc2UgaXMgZ29pbmcgdG8g
YmUKcmV1c2VkIGZvciBhIGRpZmZlcmVudCBwdXJwb3NlIGluIGEgbGF0ZXIgY2hhbmdlLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0t
CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0
cml4LmNvbT4KQ0M6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNv
bT4KQ0M6IFBhdSBSdWl6IFNhZm9udCA8cGF1LnNhZm9udEBjaXRyaXguY29tPgotLS0KIHhlbi9j
b21tb24vc2NoZWR1bGUuYyB8IDMyICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4
IDQ3ZjVkMDQuLjg5YWJhODggMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysg
Yi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTEwNTcsMzUgKzEwNTcsMzkgQEAgc3RhdGljIGxv
bmcgZG9tYWluX3dhdGNoZG9nKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGlkLCB1aW50MzJf
dCB0aW1lb3V0KQogCiAgICAgc3Bpbl9sb2NrKCZkLT53YXRjaGRvZ19sb2NrKTsKIAotICAgIGlm
ICggaWQgPT0gMCApCisgICAgaWYgKCBsaWtlbHkoaWQgIT0gMCkgKSAvKiBPcGVyYXRlIG9uIGEg
c3BlY2lmaWMgdGltZXIuICovCisgICAgeworICAgICAgICBpZCAtPSAxOworICAgICAgICBpZiAo
ICF0ZXN0X2JpdChpZCwgJmQtPndhdGNoZG9nX2ludXNlX21hcCkgKQorICAgICAgICB7CisgICAg
ICAgICAgICByYyA9IC1FSU5WQUw7CisgICAgICAgICAgICBnb3RvIHVubG9jazsKKyAgICAgICAg
fQorICAgIH0KKyAgICBlbHNlIC8qIEFsbG9jYXRlIHRoZSBuZXh0IGF2YWlsYWJsZSB0aW1lci4g
Ki8KICAgICB7CiAgICAgICAgIGZvciAoIGlkID0gMDsgaWQgPCBOUl9ET01BSU5fV0FUQ0hET0df
VElNRVJTOyBpZCsrICkKICAgICAgICAgewogICAgICAgICAgICAgaWYgKCB0ZXN0X2FuZF9zZXRf
Yml0KGlkLCAmZC0+d2F0Y2hkb2dfaW51c2VfbWFwKSApCiAgICAgICAgICAgICAgICAgY29udGlu
dWU7Ci0gICAgICAgICAgICBzZXRfdGltZXIoJmQtPndhdGNoZG9nX3RpbWVyW2lkXSwgTk9XKCkg
KyBTRUNPTkRTKHRpbWVvdXQpKTsKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICB9Ci0gICAg
ICAgIHJjID0gaWQgPT0gTlJfRE9NQUlOX1dBVENIRE9HX1RJTUVSUyA/IC1FTk9TUEMgOiBpZCAr
IDE7Ci0gICAgICAgIGdvdG8gdW5sb2NrOwotICAgIH0KLQotICAgIGlkIC09IDE7Ci0gICAgaWYg
KCAhdGVzdF9iaXQoaWQsICZkLT53YXRjaGRvZ19pbnVzZV9tYXApICkKLSAgICB7Ci0gICAgICAg
IHJjID0gLUVJTlZBTDsKLSAgICAgICAgZ290byB1bmxvY2s7CisgICAgICAgIGlmICggaWQgPT0g
TlJfRE9NQUlOX1dBVENIRE9HX1RJTUVSUyApCisgICAgICAgIHsKKyAgICAgICAgICAgIHJjID0g
LUVOT1NQQzsKKyAgICAgICAgICAgIGdvdG8gdW5sb2NrOworICAgICAgICB9CisgICAgICAgIHJj
ID0gaWQgKyAxOwogICAgIH0KIAotICAgIGlmICggdGltZW91dCA9PSAwICkKKyAgICAvKiAocmUt
KWFybSwgb3IgY2xlYXIgYSBzcGVjaWZpYyB0aW1lci4gKi8KKyAgICBpZiAoIHVubGlrZWx5KHRp
bWVvdXQgPT0gMCkgKQogICAgIHsKICAgICAgICAgc3RvcF90aW1lcigmZC0+d2F0Y2hkb2dfdGlt
ZXJbaWRdKTsKICAgICAgICAgY2xlYXJfYml0KGlkLCAmZC0+d2F0Y2hkb2dfaW51c2VfbWFwKTsK
ICAgICB9CiAgICAgZWxzZQotICAgIHsKICAgICAgICAgc2V0X3RpbWVyKCZkLT53YXRjaGRvZ190
aW1lcltpZF0sIE5PVygpICsgU0VDT05EUyh0aW1lb3V0KSk7Ci0gICAgfQogCiAgdW5sb2NrOgog
ICAgIHNwaW5fdW5sb2NrKCZkLT53YXRjaGRvZ19sb2NrKTsKLS0gCjIuMS40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
