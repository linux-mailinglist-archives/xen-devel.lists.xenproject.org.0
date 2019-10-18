Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F6DC5CA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:09:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLRw5-0000rl-3s; Fri, 18 Oct 2019 13:04:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hxM9=YL=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1iLRgK-0007mx-OM
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 12:48:36 +0000
X-Inumbo-ID: 974e38f0-f1a5-11e9-bbab-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 974e38f0-f1a5-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 12:48:32 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iLRg2-00078J-T1; Fri, 18 Oct 2019 14:48:18 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 5E5E11C009C;
 Fri, 18 Oct 2019 14:48:18 +0200 (CEST)
Date: Fri, 18 Oct 2019 12:48:18 -0000
From: "tip-bot2 for Masami Hiramatsu" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <156777566048.25081.6296162369492175325.stgit@devnote2>
References: <156777566048.25081.6296162369492175325.stgit@devnote2>
MIME-Version: 1.0
Message-ID: <157140289814.29376.7139596484011081680.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Fri, 18 Oct 2019 13:04:51 +0000
Subject: [Xen-devel] [tip: x86/core] x86: kprobes: Prohibit probing on
 instruction which has emulate prefix
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHg4Ni9jb3JlIGJy
YW5jaCBvZiB0aXA6CgpDb21taXQtSUQ6ICAgICAwMDRlOGRjZTljNTU5NTY5Nzk1MWY3Y2QwZTlm
NjZiMzVjOTIyNjVlCkdpdHdlYjogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdGlwLzAw
NGU4ZGNlOWM1NTk1Njk3OTUxZjdjZDBlOWY2NmIzNWM5MjI2NWUKQXV0aG9yOiAgICAgICAgTWFz
YW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KQXV0aG9yRGF0ZTogICAgRnJpLCAw
NiBTZXAgMjAxOSAyMjoxNDoyMCArMDk6MDAKQ29tbWl0dGVyOiAgICAgUGV0ZXIgWmlqbHN0cmEg
PHBldGVyekBpbmZyYWRlYWQub3JnPgpDb21taXR0ZXJEYXRlOiBUaHUsIDE3IE9jdCAyMDE5IDIx
OjMxOjU3ICswMjowMAoKeDg2OiBrcHJvYmVzOiBQcm9oaWJpdCBwcm9iaW5nIG9uIGluc3RydWN0
aW9uIHdoaWNoIGhhcyBlbXVsYXRlIHByZWZpeAoKUHJvaGliaXQgcHJvYmluZyBvbiBpbnN0cnVj
dGlvbiB3aGljaCBoYXMgWEVOX0VNVUxBVEVfUFJFRklYCm9yIEtWTSdzIGVtdWxhdGUgcHJlZml4
LiBTaW5jZSB0aGF0IHByZWZpeCBpcyBhIG1hcmtlciBmb3IgWGVuCmFuZCBLVk0sIGlmIHdlIG1v
ZGlmeSB0aGUgbWFya2VyIGJ5IGtwcm9iZSdzIGludDMsIHRoYXQgZG9lc24ndAp3b3JrIGFzIGV4
cGVjdGVkLgoKU2lnbmVkLW9mZi1ieTogTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVs
Lm9yZz4KU2lnbmVkLW9mZi1ieTogUGV0ZXIgWmlqbHN0cmEgKEludGVsKSA8cGV0ZXJ6QGluZnJh
ZGVhZC5vcmc+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiB4ODZAa2Vy
bmVsLm9yZwpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
Q2M6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgpDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4KQ2M6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUByZWRoYXQuY29tPgpMaW5r
OiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzE1Njc3NzU2NjA0OC4yNTA4MS42Mjk2MTYyMzY5
NDkyMTc1MzI1LnN0Z2l0QGRldm5vdGUyCi0tLQogYXJjaC94ODYva2VybmVsL2twcm9iZXMvY29y
ZS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva2VybmVsL2twcm9iZXMvY29yZS5jIGIvYXJjaC94ODYva2VybmVsL2twcm9i
ZXMvY29yZS5jCmluZGV4IDQzZmMxM2MuLjRmMTNhZjcgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tl
cm5lbC9rcHJvYmVzL2NvcmUuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwva3Byb2Jlcy9jb3JlLmMK
QEAgLTM1MSw2ICszNTEsMTAgQEAgaW50IF9fY29weV9pbnN0cnVjdGlvbih1OCAqZGVzdCwgdTgg
KnNyYywgdTggKnJlYWwsIHN0cnVjdCBpbnNuICppbnNuKQogCWtlcm5lbF9pbnNuX2luaXQoaW5z
biwgZGVzdCwgTUFYX0lOU05fU0laRSk7CiAJaW5zbl9nZXRfbGVuZ3RoKGluc24pOwogCisJLyog
V2UgY2FuIG5vdCBwcm9iZSBmb3JjZSBlbXVsYXRlIHByZWZpeGVkIGluc3RydWN0aW9uICovCisJ
aWYgKGluc25faGFzX2VtdWxhdGVfcHJlZml4KGluc24pKQorCQlyZXR1cm4gMDsKKwogCS8qIEFu
b3RoZXIgc3Vic3lzdGVtIHB1dHMgYSBicmVha3BvaW50LCBmYWlsZWQgdG8gcmVjb3ZlciAqLwog
CWlmIChpbnNuLT5vcGNvZGUuYnl0ZXNbMF0gPT0gQlJFQUtQT0lOVF9JTlNUUlVDVElPTikKIAkJ
cmV0dXJuIDA7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
