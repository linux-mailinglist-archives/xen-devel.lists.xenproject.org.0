Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799821699C7
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2020 20:33:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5wwy-0003cn-QS; Sun, 23 Feb 2020 19:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtdu=4L=arm.com=qais.yousef@srs-us1.protection.inumbo.net>)
 id 1j5wwx-0003bA-R7
 for xen-devel@lists.xenproject.org; Sun, 23 Feb 2020 19:29:59 +0000
X-Inumbo-ID: de5c013c-5672-11ea-b0fd-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id de5c013c-5672-11ea-b0fd-bc764e2007e4;
 Sun, 23 Feb 2020 19:29:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D692101E;
 Sun, 23 Feb 2020 11:29:54 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 437293F6CF;
 Sun, 23 Feb 2020 11:29:52 -0800 (PST)
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Sun, 23 Feb 2020 19:29:28 +0000
Message-Id: <20200223192942.18420-2-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223192942.18420-1-qais.yousef@arm.com>
References: <20200223192942.18420-1-qais.yousef@arm.com>
Subject: [Xen-devel] [PATCH v3 01/15] cpu: Add new {add,
 remove}_cpu() functions
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
Cc: Juergen Gross <jgross@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-parisc@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 Qais Yousef <qais.yousef@arm.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG5ldyBmdW5jdGlvbnMgdXNlIGRldmljZV97b25saW5lLG9mZmxpbmV9KCkgd2hpY2ggYXJl
IHVzZXJzcGFjZQpzYWZlLgoKVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiB0byBtb3ZlIGNwdV97dXAs
IGRvd259IGtlcm5lbCB1c2VycyB0byB1c2UKYSBzYWZlciBpbnRlcmZhY2UgdGhhdCBpcyBub3Qg
cmFjeSB3aXRoIHVzZXJzcGFjZS4KClN1Z2dlc3RlZC1ieTogIlBhdWwgRS4gTWNLZW5uZXkiIDxw
YXVsbWNrQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFFhaXMgWW91c2VmIDxxYWlzLnlvdXNl
ZkBhcm0uY29tPgpDQzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNDOiAi
UGF1bCBFLiBNY0tlbm5leSIgPHBhdWxtY2tAa2VybmVsLm9yZz4KQ0M6IEhlbGdlIERlbGxlciA8
ZGVsbGVyQGdteC5kZT4KQ0M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4K
Q0M6ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDQzogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgpDQzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT4KQ0M6IExvcmVuem8gUGllcmFsaXNpIDxsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tPgpD
QzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNDOiBsaW51eC1wYXJpc2NAdmdlci5r
ZXJuZWwub3JnCkNDOiBzcGFyY2xpbnV4QHZnZXIua2VybmVsLm9yZwpDQzogbGludXhwcGMtZGV2
QGxpc3RzLm96bGFicy5vcmcKQ0M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpDQzogeDg2QGtlcm5lbC5vcmcKQ0M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0t
CiBpbmNsdWRlL2xpbnV4L2NwdS5oIHwgIDIgKysKIGtlcm5lbC9jcHUuYyAgICAgICAgfCAyNCAr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY3B1LmggYi9pbmNsdWRlL2xpbnV4L2NwdS5o
CmluZGV4IDFjYTJiYWY4MTdlZC4uY2Y4Y2YzOGRjYTQzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L2NwdS5oCisrKyBiL2luY2x1ZGUvbGludXgvY3B1LmgKQEAgLTg5LDYgKzg5LDcgQEAgZXh0
ZXJuIHNzaXplX3QgYXJjaF9jcHVfcmVsZWFzZShjb25zdCBjaGFyICosIHNpemVfdCk7CiAjaWZk
ZWYgQ09ORklHX1NNUAogZXh0ZXJuIGJvb2wgY3B1aHBfdGFza3NfZnJvemVuOwogaW50IGNwdV91
cCh1bnNpZ25lZCBpbnQgY3B1KTsKK2ludCBhZGRfY3B1KHVuc2lnbmVkIGludCBjcHUpOwogdm9p
ZCBub3RpZnlfY3B1X3N0YXJ0aW5nKHVuc2lnbmVkIGludCBjcHUpOwogZXh0ZXJuIHZvaWQgY3B1
X21hcHNfdXBkYXRlX2JlZ2luKHZvaWQpOwogZXh0ZXJuIHZvaWQgY3B1X21hcHNfdXBkYXRlX2Rv
bmUodm9pZCk7CkBAIC0xMTgsNiArMTE5LDcgQEAgZXh0ZXJuIHZvaWQgY3B1X2hvdHBsdWdfZGlz
YWJsZSh2b2lkKTsKIGV4dGVybiB2b2lkIGNwdV9ob3RwbHVnX2VuYWJsZSh2b2lkKTsKIHZvaWQg
Y2xlYXJfdGFza3NfbW1fY3B1bWFzayhpbnQgY3B1KTsKIGludCBjcHVfZG93bih1bnNpZ25lZCBp
bnQgY3B1KTsKK2ludCByZW1vdmVfY3B1KHVuc2lnbmVkIGludCBjcHUpOwogCiAjZWxzZSAvKiBD
T05GSUdfSE9UUExVR19DUFUgKi8KIApkaWZmIC0tZ2l0IGEva2VybmVsL2NwdS5jIGIva2VybmVs
L2NwdS5jCmluZGV4IDljNzA2YWY3MTNmYi4uMDY5ODAyZjcwMTBmIDEwMDY0NAotLS0gYS9rZXJu
ZWwvY3B1LmMKKysrIGIva2VybmVsL2NwdS5jCkBAIC0xMDU3LDYgKzEwNTcsMTggQEAgaW50IGNw
dV9kb3duKHVuc2lnbmVkIGludCBjcHUpCiB9CiBFWFBPUlRfU1lNQk9MKGNwdV9kb3duKTsKIAor
aW50IHJlbW92ZV9jcHUodW5zaWduZWQgaW50IGNwdSkKK3sKKwlpbnQgcmV0OworCisJbG9ja19k
ZXZpY2VfaG90cGx1ZygpOworCXJldCA9IGRldmljZV9vZmZsaW5lKGdldF9jcHVfZGV2aWNlKGNw
dSkpOworCXVubG9ja19kZXZpY2VfaG90cGx1ZygpOworCisJcmV0dXJuIHJldDsKK30KK0VYUE9S
VF9TWU1CT0xfR1BMKHJlbW92ZV9jcHUpOworCiAjZWxzZQogI2RlZmluZSB0YWtlZG93bl9jcHUJ
CU5VTEwKICNlbmRpZiAvKkNPTkZJR19IT1RQTFVHX0NQVSovCkBAIC0xMjA5LDYgKzEyMjEsMTgg
QEAgaW50IGNwdV91cCh1bnNpZ25lZCBpbnQgY3B1KQogfQogRVhQT1JUX1NZTUJPTF9HUEwoY3B1
X3VwKTsKIAoraW50IGFkZF9jcHUodW5zaWduZWQgaW50IGNwdSkKK3sKKwlpbnQgcmV0OworCisJ
bG9ja19kZXZpY2VfaG90cGx1ZygpOworCXJldCA9IGRldmljZV9vbmxpbmUoZ2V0X2NwdV9kZXZp
Y2UoY3B1KSk7CisJdW5sb2NrX2RldmljZV9ob3RwbHVnKCk7CisKKwlyZXR1cm4gcmV0OworfQor
RVhQT1JUX1NZTUJPTF9HUEwoYWRkX2NwdSk7CisKICNpZmRlZiBDT05GSUdfUE1fU0xFRVBfU01Q
CiBzdGF0aWMgY3B1bWFza192YXJfdCBmcm96ZW5fY3B1czsKIAotLSAKMi4xNy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
