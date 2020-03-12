Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1201833BF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:51:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCP9a-0000ZN-OT; Thu, 12 Mar 2020 14:49:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=780U=45=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jCOh1-0006XZ-T6
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:20:11 +0000
X-Inumbo-ID: 94cb597b-646c-11ea-b19e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94cb597b-646c-11ea-b19e-12813bfff9fa;
 Thu, 12 Mar 2020 14:20:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3CAA6B2F1;
 Thu, 12 Mar 2020 14:20:10 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 12 Mar 2020 15:20:06 +0100
Message-Id: <20200312142007.11488-2-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200312142007.11488-1-mbenes@suse.cz>
References: <20200312142007.11488-1-mbenes@suse.cz>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 14:49:40 +0000
Subject: [Xen-devel] [PATCH 1/2] x86/xen: Make the boot CPU idle task
 reliable
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
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 xen-devel@lists.xenproject.org, Miroslav Benes <mbenes@suse.cz>,
 jslaby@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHVud2luZGVyIHJlcG9ydHMgdGhlIGJvb3QgQ1BVIGlkbGUgdGFzaydzIHN0YWNrIG9uIFhF
TiBQViBhcwp1bnJlbGlhYmxlLCB3aGljaCBhZmZlY3RzIGF0IGxlYXN0IGxpdmUgcGF0Y2hpbmcu
IFRoZXJlIGFyZSB0d28gcmVhc29ucwpmb3IgdGhpcy4gRmlyc3QsIHRoZSB0YXNrIGRvZXMgbm90
IGZvbGxvdyB0aGUgeDg2IGNvbnZlbnRpb24gdGhhdCBpdHMKc3RhY2sgc3RhcnRzIGF0IHRoZSBv
ZmZzZXQgcmlnaHQgYmVsb3cgc2F2ZWQgcHRfcmVncy4gSXQgYWxsb3dzIHRoZQp1bndpbmRlciB0
byBlYXNpbHkgZGV0ZWN0IHRoZSBlbmQgb2YgdGhlIHN0YWNrIGFuZCB2ZXJpZnkgaXQuIFNlY29u
ZCwKc3RhcnR1cF94ZW4oKSBmdW5jdGlvbiBkb2VzIG5vdCBzdG9yZSB0aGUgcmV0dXJuIGFkZHJl
c3MgYmVmb3JlIGp1bXBpbmcKdG8geGVuX3N0YXJ0X2tlcm5lbCgpIHdoaWNoIGNvbmZ1c2VzIHRo
ZSB1bndpbmRlci4KCkFtZW5kIGJvdGggaXNzdWVzIGJ5IG1vdmluZyB0aGUgc3RhcnRpbmcgcG9p
bnQgb2YgaW5pdGlhbCBzdGFjayBpbgpzdGFydHVwX3hlbigpIGFuZCBzdG9yaW5nIHRoZSByZXR1
cm4gYWRkcmVzcyBiZWZvcmUgdGhlIGp1bXAuCgpTaWduZWQtb2ZmLWJ5OiBNaXJvc2xhdiBCZW5l
cyA8bWJlbmVzQHN1c2UuY3o+Ci0tLQogYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCA0ICsrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUyBiL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TCmlu
ZGV4IDFkMGNlZTMxNjNlNC4uNjQyZjM0NmJmZTAyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4v
eGVuLWhlYWQuUworKysgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwpAQCAtMzUsNyArMzUsNyBA
QCBTWU1fQ09ERV9TVEFSVChzdGFydHVwX3hlbikKIAlyZXAgX19BU01fU0laRShzdG9zKQogCiAJ
bW92ICVfQVNNX1NJLCB4ZW5fc3RhcnRfaW5mbwotCW1vdiAkaW5pdF90aHJlYWRfdW5pb24rVEhS
RUFEX1NJWkUsICVfQVNNX1NQCisJbW92ICRpbml0X3RocmVhZF91bmlvbitUSFJFQURfU0laRS1T
SVpFT0ZfUFRSRUdTLCAlX0FTTV9TUAogCiAjaWZkZWYgQ09ORklHX1g4Nl82NAogCS8qIFNldCB1
cCAlZ3MuCkBAIC01MSw3ICs1MSw5IEBAIFNZTV9DT0RFX1NUQVJUKHN0YXJ0dXBfeGVuKQogCXdy
bXNyCiAjZW5kaWYKIAorCXB1c2ggJDFmCiAJam1wIHhlbl9zdGFydF9rZXJuZWwKKzE6CiBTWU1f
Q09ERV9FTkQoc3RhcnR1cF94ZW4pCiAJX19GSU5JVAogI2VuZGlmCi0tIAoyLjI1LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
