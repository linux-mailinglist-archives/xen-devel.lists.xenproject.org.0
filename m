Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DB18B0AD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 10:58:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEruP-0007xW-C8; Thu, 19 Mar 2020 09:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f9wY=5E=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jEruO-0007xG-Iw
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:56:12 +0000
X-Inumbo-ID: dcbc682c-69c7-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcbc682c-69c7-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 09:56:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6909AE59;
 Thu, 19 Mar 2020 09:56:10 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 19 Mar 2020 10:56:05 +0100
Message-Id: <20200319095606.23627-2-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319095606.23627-1-mbenes@suse.cz>
References: <20200319095606.23627-1-mbenes@suse.cz>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] x86/xen: Make the boot CPU idle task
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
Cc: andrew.cooper3@citrix.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, xen-devel@lists.xenproject.org,
 Miroslav Benes <mbenes@suse.cz>, jslaby@suse.cz
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
cm4gYWRkcmVzcyBiZWZvcmUgdGhlIGp1bXAsIHdoaWNoIGlzCmV4YWN0bHkgd2hhdCBjYWxsIGlu
c3RydWN0aW9uIGRvZXMuCgpTaWduZWQtb2ZmLWJ5OiBNaXJvc2xhdiBCZW5lcyA8bWJlbmVzQHN1
c2UuY3o+Ci0tLQogYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCA4ICsrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3hlbi94ZW4taGVhZC5TIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKaW5kZXggMWQw
Y2VlMzE2M2U0Li5lZGM3NzZhZjBlMGEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi94ZW4taGVh
ZC5TCisrKyBiL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TCkBAIC0zNSw3ICszNSwxMSBAQCBTWU1f
Q09ERV9TVEFSVChzdGFydHVwX3hlbikKIAlyZXAgX19BU01fU0laRShzdG9zKQogCiAJbW92ICVf
QVNNX1NJLCB4ZW5fc3RhcnRfaW5mbwotCW1vdiAkaW5pdF90aHJlYWRfdW5pb24rVEhSRUFEX1NJ
WkUsICVfQVNNX1NQCisjaWZkZWYgQ09ORklHX1g4Nl82NAorCW1vdiBpbml0aWFsX3N0YWNrKCVy
aXApLCAlX0FTTV9TUAorI2Vsc2UKKwltb3YgcGEoaW5pdGlhbF9zdGFjayksICVfQVNNX1NQCisj
ZW5kaWYKIAogI2lmZGVmIENPTkZJR19YODZfNjQKIAkvKiBTZXQgdXAgJWdzLgpAQCAtNTEsNyAr
NTUsNyBAQCBTWU1fQ09ERV9TVEFSVChzdGFydHVwX3hlbikKIAl3cm1zcgogI2VuZGlmCiAKLQlq
bXAgeGVuX3N0YXJ0X2tlcm5lbAorCWNhbGwgeGVuX3N0YXJ0X2tlcm5lbAogU1lNX0NPREVfRU5E
KHN0YXJ0dXBfeGVuKQogCV9fRklOSVQKICNlbmRpZgotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
