Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F21021CF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 11:16:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX0Uf-0002fh-KG; Tue, 19 Nov 2019 10:12:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5shB=ZL=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1iX0Ud-0002fc-US
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 10:12:19 +0000
X-Inumbo-ID: 10f64706-0ab5-11ea-b678-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10f64706-0ab5-11ea-b678-bc764e2007e4;
 Tue, 19 Nov 2019 10:12:18 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iX0UX-0001XN-Bb; Tue, 19 Nov 2019 11:12:13 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id E47B11C19C7;
 Tue, 19 Nov 2019 11:12:12 +0100 (CET)
Date: Tue, 19 Nov 2019 10:12:12 -0000
From: "tip-bot2 for Jan Beulich" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
MIME-Version: 1.0
Message-ID: <157415833282.12247.2847277914358020515.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: [Xen-devel] [tip: x86/urgent] x86/stackframe/32: Repair 32-bit Xen
 PV
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: Denys Vlasenko <dvlasenk@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, Brian Gerst <brgerst@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHg4Ni91cmdlbnQg
YnJhbmNoIG9mIHRpcDoKCkNvbW1pdC1JRDogICAgIDE4OWViN2YzZDdlYzcwY2VlYWExOTUyMjFk
ZGZkOTUwMTZlMTBhY2UKR2l0d2ViOiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy90aXAv
MTg5ZWI3ZjNkN2VjNzBjZWVhYTE5NTIyMWRkZmQ5NTAxNmUxMGFjZQpBdXRob3I6ICAgICAgICBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkF1dGhvckRhdGU6ICAgIE1vbiwgMTggTm92
IDIwMTkgMTY6MjE6MTIgKzAxOjAwCkNvbW1pdHRlcjogICAgIEluZ28gTW9sbmFyIDxtaW5nb0Br
ZXJuZWwub3JnPgpDb21taXR0ZXJEYXRlOiBUdWUsIDE5IE5vdiAyMDE5IDA5OjAxOjU5ICswMTow
MAoKeDg2L3N0YWNrZnJhbWUvMzI6IFJlcGFpciAzMi1iaXQgWGVuIFBWCgpPbmNlIGFnYWluIFJQ
TCBjaGVja3MgaGF2ZSBiZWVuIGludHJvZHVjZWQgd2hpY2ggZG9uJ3QgYWNjb3VudCBmb3IgYQoz
Mi1iaXQga2VybmVsIGxpdmluZyBpbiByaW5nIDEgd2hlbiBydW5uaW5nIGluIGEgUFYgWGVuIGRv
bWFpbi4gVGhlCmNhc2UgaW4gRklYVVBfRlJBTUUgaGFzIGJlZW4gcHJldmVudGluZyBib290LiBB
ZGp1c3QgQlVHX0lGX1dST05HX0NSMwphcyB3ZWxsIHRvIGd1YXJkIGFnYWluc3QgZnV0dXJlIHVz
ZXMgb2YgdGhlIG1hY3JvIG9uIGEgY29kZSBwYXRoCnJlYWNoYWJsZSB3aGVuIHJ1bm5pbmcgaW4g
UFYgbW9kZSB1bmRlciBYZW47IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEkKc3RvcHBlZCBhdCBhIGNl
cnRhaW4gcG9pbnQgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hldGhlciB0aGVyZSBhcmUKcHJlc2Vu
dCBvbmVzLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpD
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+CkNjOiBBbmR5IEx1dG9taXJza2kgPGx1dG9Aa2Vy
bmVsLm9yZz4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzogQnJpYW4gR2Vy
c3QgPGJyZ2Vyc3RAZ21haWwuY29tPgpDYzogRGVueXMgVmxhc2Vua28gPGR2bGFzZW5rQHJlZGhh
dC5jb20+CkNjOiBILiBQZXRlciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4KQ2M6IExpbnVzIFRvcnZh
bGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IFBldGVyIFppamxzdHJhIDxw
ZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4
LmRlPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIDx4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc+CkZpeGVzOiAzYzg4YzY5MmMyODcgKCJ4ODYvc3RhY2tmcmFtZS8zMjog
UHJvdmlkZSBjb25zaXN0ZW50IHB0X3JlZ3MiKQpTaWduZWQtb2ZmLWJ5OiBJbmdvIE1vbG5hciA8
bWluZ29Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5TICAgICAgfCAg
NCArKy0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZWdtZW50LmggfCAxMiArKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5TIGIvYXJjaC94ODYvZW50cnkvZW50cnlf
MzIuUwppbmRleCBmODNjYTVhLi4zZjg0N2Q4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9lbnRyeS9l
bnRyeV8zMi5TCisrKyBiL2FyY2gveDg2L2VudHJ5L2VudHJ5XzMyLlMKQEAgLTE3Miw3ICsxNzIs
NyBAQAogCUFMVEVSTkFUSVZFICJqbXAgLkxlbmRfXEAiLCAiIiwgWDg2X0ZFQVRVUkVfUFRJCiAJ
LmlmIFxub191c2VyX2NoZWNrID09IDAKIAkvKiBjb21pbmcgZnJvbSB1c2VybW9kZT8gKi8KLQl0
ZXN0bAkkU0VHTUVOVF9SUExfTUFTSywgUFRfQ1MoJWVzcCkKKwl0ZXN0bAkkVVNFUl9TRUdNRU5U
X1JQTF9NQVNLLCBQVF9DUyglZXNwKQogCWp6CS5MZW5kX1xACiAJLmVuZGlmCiAJLyogT24gdXNl
ci1jcjM/ICovCkBAIC0yMTcsNyArMjE3LDcgQEAKIAl0ZXN0bAkkWDg2X0VGTEFHU19WTSwgNCo0
KCVlc3ApCiAJam56CS5MZnJvbV91c2VybW9kZV9ub19maXh1cF9cQAogI2VuZGlmCi0JdGVzdGwJ
JFNFR01FTlRfUlBMX01BU0ssIDMqNCglZXNwKQorCXRlc3RsCSRVU0VSX1NFR01FTlRfUlBMX01B
U0ssIDMqNCglZXNwKQogCWpuegkuTGZyb21fdXNlcm1vZGVfbm9fZml4dXBfXEAKIAogCW9ybAkk
Q1NfRlJPTV9LRVJORUwsIDMqNCglZXNwKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9h
c20vc2VnbWVudC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc2VnbWVudC5oCmluZGV4IGFjMzg5
MjkuLjY2NjkxNjQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NlZ21lbnQuaAor
KysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZWdtZW50LmgKQEAgLTMxLDYgKzMxLDE4IEBACiAg
Ki8KICNkZWZpbmUgU0VHTUVOVF9SUExfTUFTSwkweDMKIAorLyoKKyAqIFdoZW4gcnVubmluZyBv
biBYZW4gUFYsIHRoZSBhY3R1YWwgcHJpdmlsZWdlIGxldmVsIG9mIHRoZSBrZXJuZWwgaXMgMSwK
KyAqIG5vdCAwLiBUZXN0aW5nIHRoZSBSZXF1ZXN0ZWQgUHJpdmlsZWdlIExldmVsIGluIGEgc2Vn
bWVudCBzZWxlY3RvciB0bworICogZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGNvbnRleHQgaXMgdXNl
ciBtb2RlIG9yIGtlcm5lbCBtb2RlIHdpdGgKKyAqIFNFR01FTlRfUlBMX01BU0sgaXMgd3Jvbmcg
YmVjYXVzZSB0aGUgUFYga2VybmVsJ3MgcHJpdmlsZWdlIGxldmVsCisgKiBtYXRjaGVzIHRoZSAw
eDMgbWFzay4KKyAqCisgKiBUZXN0aW5nIHdpdGggVVNFUl9TRUdNRU5UX1JQTF9NQVNLIGlzIHZh
bGlkIGZvciBib3RoIG5hdGl2ZSBhbmQgWGVuIFBWCisgKiBrZXJuZWxzIGJlY2F1c2UgcHJpdmls
ZWdlIGxldmVsIDIgaXMgbmV2ZXIgdXNlZC4KKyAqLworI2RlZmluZSBVU0VSX1NFR01FTlRfUlBM
X01BU0sJMHgyCisKIC8qIFVzZXIgbW9kZSBpcyBwcml2aWxlZ2UgbGV2ZWwgMzogKi8KICNkZWZp
bmUgVVNFUl9SUEwJCTB4MwogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
