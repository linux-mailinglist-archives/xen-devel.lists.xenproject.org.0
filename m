Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807A42219
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 12:16:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb0FD-0008JD-VQ; Wed, 12 Jun 2019 10:12:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hb0FC-0008J8-Es
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 10:12:38 +0000
X-Inumbo-ID: 97a56338-8cfa-11e9-bbeb-e7fef4e86fbf
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97a56338-8cfa-11e9-bbeb-e7fef4e86fbf;
 Wed, 12 Jun 2019 10:12:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96C5DAF81;
 Wed, 12 Jun 2019 10:12:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 12 Jun 2019 12:12:28 +0200
Message-Id: <20190612101228.23898-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] x86/xen: disable nosmt in Xen guests
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
 Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBydW5uaW5nIGFzIGEgWGVuIGd1ZXN0IHNlbGVjdGluZyAibm9zbXQiIGVpdGhlciB2aWEg
Y29tbWFuZCBsaW5lCm9yIGltcGxpY2l0bHkgdmlhIGRlZmF1bHQgc2V0dGluZ3MgbWFrZXMgbm8g
c2Vuc2UsIGFzIHRoZSBndWVzdCBoYXMgbm8KY2x1ZSBhYm91dCB0aGUgcmVhbCBzeXN0ZW0gdG9w
b2xvZ3kgaXQgaXMgcnVubmluZyBvbi4gV2l0aCBYZW4gaXQgaXMKdGhlIGh5cGVydmlzb3IncyBq
b2IgdG8gZW5zdXJlIHRoZSBwcm9wZXIgYnVnIG1pdGlnYXRpb25zIGFyZSBhY3RpdmUKcmVnYXJk
aW5nIHNtdCBzZXR0aW5ncy4KClNvIHdoZW4gcnVubmluZyBhcyBhIFhlbiBndWVzdCBzZXQgY3B1
X3NtdF9jb250cm9sIHRvICJub3Qgc3VwcG9ydGVkIgppbiBvcmRlciB0byBhdm9pZCBkaXNhYmxp
bmcgcmFuZG9tIHZjcHVzLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgotLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYyAgICAgfCA4ICsrKysrKysrCiBh
cmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIHwgMiArKwogYXJjaC94ODYveGVuL2VubGlnaHRl
bl9wdi5jICB8IDIgKysKIGFyY2gveDg2L3hlbi94ZW4tb3BzLmggICAgICAgfCAyICsrCiA0IGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4v
ZW5saWdodGVuLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuLmMKaW5kZXggNzUwZjQ2YWQwMThh
Li4zMTJiNzM2OThkMGMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYworKysg
Yi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuLmMKQEAgLTM0NSwzICszNDUsMTEgQEAgdm9pZCB4ZW5f
YXJjaF91bnJlZ2lzdGVyX2NwdShpbnQgbnVtKQogfQogRVhQT1JUX1NZTUJPTCh4ZW5fYXJjaF91
bnJlZ2lzdGVyX2NwdSk7CiAjZW5kaWYKKwordm9pZCBfX2luaXQgeGVuX2Rpc2FibGVfbm9zbXQo
dm9pZCkKK3sKKyNpZmRlZiBDT05GSUdfSE9UUExVR19TTVQKKwkvKiBEb24ndCBhbGxvdyBTTVQg
ZGlzYWJsaW5nIGluIFhlbiBndWVzdHMuICovCisJY3B1X3NtdF9jb250cm9sID0gQ1BVX1NNVF9O
T1RfU1VQUE9SVEVEOworI2VuZGlmCit9CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX2h2bS5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwppbmRleCAwZTc1NjQyZDQy
YTMuLjdjNjI2NjJjZDJjYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0u
YworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0xMTYsNiArMTE2LDggQEAg
c3RhdGljIHZvaWQgX19pbml0IGluaXRfaHZtX3B2X2luZm8odm9pZCkKIAkJdGhpc19jcHVfd3Jp
dGUoeGVuX3ZjcHVfaWQsIGVieCk7CiAJZWxzZQogCQl0aGlzX2NwdV93cml0ZSh4ZW5fdmNwdV9p
ZCwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKworCXhlbl9kaXNhYmxlX25vc210KCk7CiB9CiAKICNp
ZmRlZiBDT05GSUdfS0VYRUNfQ09SRQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRl
bl9wdi5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCmluZGV4IDQ3MjJiYTI5NjZhYy4u
ZGNmZWM2NWJjYTYwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKKysr
IGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCkBAIC0xMzEsNiArMTMxLDggQEAgc3RhdGlj
IHZvaWQgX19pbml0IHhlbl9wdl9pbml0X3BsYXRmb3JtKHZvaWQpCiAKIAkvKiBwdmNsb2NrIGlz
IGluIHNoYXJlZCBpbmZvIGFyZWEgKi8KIAl4ZW5faW5pdF90aW1lX29wcygpOworCisJeGVuX2Rp
c2FibGVfbm9zbXQoKTsKIH0KIAogc3RhdGljIHZvaWQgX19pbml0IHhlbl9wdl9ndWVzdF9sYXRl
X2luaXQodm9pZCkKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4tb3BzLmggYi9hcmNoL3g4
Ni94ZW4veGVuLW9wcy5oCmluZGV4IDJmMTExZjQ3YmE5OC4uNjNhMzFiOWQ3MjE3IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni94ZW4veGVuLW9wcy5oCisrKyBiL2FyY2gveDg2L3hlbi94ZW4tb3BzLmgK
QEAgLTE2MSw0ICsxNjEsNiBAQCB2b2lkIHhlbl9odm1fcG9zdF9zdXNwZW5kKGludCBzdXNwZW5k
X2NhbmNlbGxlZCk7CiBzdGF0aWMgaW5saW5lIHZvaWQgeGVuX2h2bV9wb3N0X3N1c3BlbmQoaW50
IHN1c3BlbmRfY2FuY2VsbGVkKSB7fQogI2VuZGlmCiAKK3ZvaWQgX19pbml0IHhlbl9kaXNhYmxl
X25vc210KHZvaWQpOworCiAjZW5kaWYgLyogWEVOX09QU19IICovCi0tIAoyLjE2LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
