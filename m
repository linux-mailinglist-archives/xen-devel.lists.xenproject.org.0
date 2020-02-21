Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C0167AF2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 11:41:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j55hx-0000F9-JA; Fri, 21 Feb 2020 10:38:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j55hw-0000EP-IF
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:38:56 +0000
X-Inumbo-ID: 5b93d430-5496-11ea-8622-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b93d430-5496-11ea-8622-12813bfff9fa;
 Fri, 21 Feb 2020 10:38:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A868AC66;
 Fri, 21 Feb 2020 10:38:54 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 21 Feb 2020 11:38:51 +0100
Message-Id: <20200221103851.7855-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] x86/mm: fix dump_pagetables with Xen PV
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
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDJhZTI3MTM3YjJkYjg5ICgieDg2OiBtbTogY29udmVydCBkdW1wX3BhZ2V0YWJsZXMg
dG8gdXNlCndhbGtfcGFnZV9yYW5nZSIpIGJyb2tlIFhlbiBQViBndWVzdHMgYXMgdGhlIGh5cGVy
dmlzb3IgcmVzZXJ2ZWQgaG9sZQppbiB0aGUgbWVtb3J5IG1hcCB3YXMgbm90IHRha2VuIGludG8g
YWNjb3VudC4KCkZpeCB0aGF0IGJ5IHN0YXJ0aW5nIHRoZSBrZXJuZWwgcmFuZ2Ugb25seSBhdCBH
VUFSRF9IT0xFX0VORF9BRERSLgoKRml4ZXM6IDJhZTI3MTM3YjJkYjg5ICgieDg2OiBtbTogY29u
dmVydCBkdW1wX3BhZ2V0YWJsZXMgdG8gdXNlIHdhbGtfcGFnZV9yYW5nZSIpClJlcG9ydGVkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogYXJjaC94ODYvbW0vZHVtcF9wYWdldGFibGVzLmMg
fCA3ICstLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJsZXMuYyBiL2FyY2gveDg2
L21tL2R1bXBfcGFnZXRhYmxlcy5jCmluZGV4IDY0MjI5ZGFkN2VhYi4uNjkzMDljZDU2ZmRmIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJsZXMuYworKysgYi9hcmNoL3g4Ni9t
bS9kdW1wX3BhZ2V0YWJsZXMuYwpAQCAtMzYzLDEzICszNjMsOCBAQCBzdGF0aWMgdm9pZCBwdGR1
bXBfd2Fsa19wZ2RfbGV2ZWxfY29yZShzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCiB7CiAJY29uc3Qgc3Ry
dWN0IHB0ZHVtcF9yYW5nZSBwdGR1bXBfcmFuZ2VzW10gPSB7CiAjaWZkZWYgQ09ORklHX1g4Nl82
NAotCi0jZGVmaW5lIG5vcm1hbGl6ZV9hZGRyX3NoaWZ0ICg2NCAtIChfX1ZJUlRVQUxfTUFTS19T
SElGVCArIDEpKQotI2RlZmluZSBub3JtYWxpemVfYWRkcih1KSAoKHNpZ25lZCBsb25nKSgodSkg
PDwgbm9ybWFsaXplX2FkZHJfc2hpZnQpID4+IFwKLQkJCSAgIG5vcm1hbGl6ZV9hZGRyX3NoaWZ0
KQotCiAJezAsIFBUUlNfUEVSX1BHRCAqIFBHRF9MRVZFTF9NVUxUIC8gMn0sCi0Je25vcm1hbGl6
ZV9hZGRyKFBUUlNfUEVSX1BHRCAqIFBHRF9MRVZFTF9NVUxUIC8gMiksIH4wVUx9LAorCXtHVUFS
RF9IT0xFX0VORF9BRERSLCB+MFVMfSwKICNlbHNlCiAJezAsIH4wVUx9LAogI2VuZGlmCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
