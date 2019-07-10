Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5273C646CC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 15:08:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlCHt-0003r3-VD; Wed, 10 Jul 2019 13:05:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hlM1=VH=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1hlCHs-0003qy-Ei
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 13:05:32 +0000
X-Inumbo-ID: 64a4bbb2-a313-11e9-8a11-dbe6be82b395
Received: from mout.kundenserver.de (unknown [212.227.126.134])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64a4bbb2-a313-11e9-8a11-dbe6be82b395;
 Wed, 10 Jul 2019 13:05:30 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MG9To-1hhtRC0cVY-00GcBk; Wed, 10 Jul 2019 15:05:26 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org
Date: Wed, 10 Jul 2019 15:04:55 +0200
Message-Id: <20190710130522.1802800-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:P4mHzcBPHXgdb+u5vlx/hBpSw2l3rZVeWH9UqWEV1mEVmDpXjqc
 JcS1nDm3cY6uP95lhZ6OmZV9FXhTFdBefNhUFcM/YEx5wWSzK7UfL3fNZdvXYsaVnlt9ygM
 oKo/NnHEx3zlZHa4vlzc9lXYhaGTlnESjypQx81UC210Q/dZBFOr0Q0XPSD9rlqhryzD441
 NW8eQsCEheKKtMQjTPZRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PZw3USf94/I=:M+icLSClyqLKdVhhCZubUA
 47jMTB4X8usjv8TaYgEmQHpWE1BGOo3gIbWMniuwY6yrjFjrglYMQbHIczZGTE9wc20s5+WSX
 81FFnw9MOZNvgdOrqFVuaTFOTXsKtCX9O52Gki/NToZ8/oyF4UZ/kh+uukfTcfq9BoBK/Bpdy
 AqQS5iSX3IvX9IMIf/QGTqPLMueDp3CQTo45P4Cp/7f3corWdKda00qH0EAnepwIyZp25zDpA
 bcOdI41sbabP3BVOYAwiup6Ig2fofbnUZ3r5NZ53XVkvpzZyClqKSTrsaApXIEab9hEvy/fML
 phIDyU5uxy5PsKZP2t0ZsQqTAWvlcfWXLZFfNhrNs9Ftkh5ncAPAeeIF3WBcZhrn3GnNIF2UC
 30Di1xjdKPuArGNV67oc5Ep/TtCFVxQgKhDSmIyNFx6/1Rvpw1dI6S5d7DF+v2NenNOec13UR
 g1bOQkXbwTzif1Zm8ytGOT0CPYld/GSsYUw1qlLY/sqhPBdFgX7j3g4kr7Ly+PFSnwK/LJxOo
 /5DStVTJAk2IJM2FbtI4wnpSV9ha2JytHOOO42NObZI/8v5pIE8aMxlRXcOJ6GzwrqE68uu+B
 tP5fFDmgsv1d3euocNJoIyDQ31evYwwZpl0AdTWgZlezZkrkQLGJMsJJPWfcfmgGpmp+x/SSm
 hAhw2yQiaplzkzTD+bs71xFgaGVTCW1oYeMCo3wsh9bp3/XWFAcq88FDfpBqtB5aoeUQ7/PhD
 pdqUkdJq1q7Y7bIbz7DEZRnRPYtezbWMXhbDPg==
Subject: [Xen-devel] [PATCH] x86: fix LOWMEM_PAGES constant
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
Cc: Joerg Roedel <jroedel@suse.de>, Denys Vlasenko <dvlasenk@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com,
 Peter Zijlstra <peterz@infradead.org>, Brian Gerst <brgerst@gmail.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org,
 matt@codeblueprint.co.uk, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y2xhbmcgcG9pbnRzIG91dCB0aGF0IHRoZSBjb21wdXRhdGlvbiBvZiBMT1dNRU1fUEFHRVMgY2F1
c2VzCmEgc2lnbmVkIGludGVnZXIgb3ZlcmZsb3cgb24gMzItYml0IHg4NjoKCmFyY2gveDg2L2tl
cm5lbC9oZWFkMzIuYzo4MzoyMDogZXJyb3I6IHNpZ25lZCBzaGlmdCByZXN1bHQgKDB4MTAwMDAw
MDAwKSByZXF1aXJlcyAzNCBiaXRzIHRvIHJlcHJlc2VudCwgYnV0ICdpbnQnIG9ubHkgaGFzIDMy
IGJpdHMgWy1XZXJyb3IsLVdzaGlmdC1vdmVyZmxvd10KICAgICAgICAgICAgICAgIChQQUdFX1RB
QkxFX1NJWkUoTE9XTUVNX1BBR0VTKSA8PCBQQUdFX1NISUZUKTsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+CmFyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGVf
MzIuaDoxMDk6Mjc6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ0xPV01FTV9QQUdFUycKICNk
ZWZpbmUgTE9XTUVNX1BBR0VTICgoKCgyPDwzMSkgLSBfX1BBR0VfT0ZGU0VUKSA+PiBQQUdFX1NI
SUZUKSkKICAgICAgICAgICAgICAgICAgICAgICAgIH5eIH5+CmFyY2gveDg2L2luY2x1ZGUvYXNt
L3BndGFibGVfMzIuaDo5ODozNDogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnUEFHRV9UQUJM
RV9TSVpFJwogI2RlZmluZSBQQUdFX1RBQkxFX1NJWkUocGFnZXMpICgocGFnZXMpIC8gUFRSU19Q
RVJfUEdEKQoKVXNlIHRoZSBfVUxMKCkgbWFjcm8gdG8gbWFrZSBpdCBhIDY0LWJpdCBjb25zdGFu
dC4KCkZpeGVzOiAxZTYyMGY5YjIzZTUgKCJ4ODYvYm9vdC8zMjogQ29udmVydCB0aGUgMzItYml0
IHBndGFibGUgc2V0dXAgY29kZSBmcm9tIGFzc2VtYmx5IHRvIEMiKQpTaWduZWQtb2ZmLWJ5OiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Bn
dGFibGVfMzIuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGVfMzIuaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGVfMzIuaAppbmRleCA0ZmU5ZTdmYzc0ZDMuLmM3
OGRhOGVkYThmMiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZV8zMi5o
CisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGVfMzIuaApAQCAtMTA2LDYgKzEwNiw2
IEBAIGRvIHsJCQkJCQlcCiAgKiB3aXRoIG9ubHkgYSBob3N0IHRhcmdldCBzdXBwb3J0IHVzaW5n
IGEgMzItYml0IHR5cGUgZm9yIGludGVybmFsCiAgKiByZXByZXNlbnRhdGlvbi4KICAqLwotI2Rl
ZmluZSBMT1dNRU1fUEFHRVMgKCgoKDI8PDMxKSAtIF9fUEFHRV9PRkZTRVQpID4+IFBBR0VfU0hJ
RlQpKQorI2RlZmluZSBMT1dNRU1fUEFHRVMgKCgoKF9VTEwoMik8PDMxKSAtIF9fUEFHRV9PRkZT
RVQpID4+IFBBR0VfU0hJRlQpKQogCiAjZW5kaWYgLyogX0FTTV9YODZfUEdUQUJMRV8zMl9IICov
Ci0tIAoyLjIwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
