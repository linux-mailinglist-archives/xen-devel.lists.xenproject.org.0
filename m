Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F4E453A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 10:08:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNuZx-000298-ME; Fri, 25 Oct 2019 08:04:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AepH=YS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNuZw-000293-5J
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 08:04:12 +0000
X-Inumbo-ID: 03fba61a-f6fe-11e9-94b9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03fba61a-f6fe-11e9-94b9-12813bfff9fa;
 Fri, 25 Oct 2019 08:04:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E26BB92D;
 Fri, 25 Oct 2019 08:04:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2019 09:38:58 +0200
Message-Id: <20191025073858.15081-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen: issue deprecation warning for 32-bit pv
 guest
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

U3VwcG9ydCBmb3IgdGhlIGtlcm5lbCBhcyBYZW4gMzItYml0IFBWIGd1ZXN0IHdpbGwgc29vbiBi
ZSByZW1vdmVkLgpJc3N1ZSBhIHdhcm5pbmcgd2hlbiBib290ZWQgYXMgc3VjaC4KClNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2LmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9wdi5jCmluZGV4IDU4Zjc5YWIzMjM1OC4uNWJmZWEzNzRhMTYwIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKKysrIGIvYXJjaC94ODYveGVuL2Vu
bGlnaHRlbl9wdi5jCkBAIC0xMTcsNiArMTE3LDE0IEBAIHN0YXRpYyB2b2lkIF9faW5pdCB4ZW5f
YmFubmVyKHZvaWQpCiAJcHJpbnRrKEtFUk5fSU5GTyAiWGVuIHZlcnNpb246ICVkLiVkJXMlc1xu
IiwKIAkgICAgICAgdmVyc2lvbiA+PiAxNiwgdmVyc2lvbiAmIDB4ZmZmZiwgZXh0cmEuZXh0cmF2
ZXJzaW9uLAogCSAgICAgICB4ZW5fZmVhdHVyZShYRU5GRUFUX21tdV9wdF91cGRhdGVfcHJlc2Vy
dmVfYWQpID8gIiAocHJlc2VydmUtQUQpIiA6ICIiKTsKKworI2lmZGVmIENPTkZJR19YODZfMzIK
Kwlwcl93YXJuKCJXQVJOSU5HISBXQVJOSU5HISBXQVJOSU5HISBXQVJOSU5HISBXQVJOSU5HISBX
QVJOSU5HISBXQVJOSU5HIVxuIgorCQkiU3VwcG9ydCBmb3IgcnVubmluZyBhcyAzMi1iaXQgUFYt
Z3Vlc3QgdW5kZXIgWGVuIHdpbGwgc29vbiBiZSByZW1vdmVkXG4iCisJCSJmcm9tIHRoZSBMaW51
eCBrZXJuZWwhXG4iCisJCSJQbGVhc2UgdXNlIGVpdGhlciBhIDY0LWJpdCBrZXJuZWwgb3Igc3dp
dGNoIHRvIEhWTSBvciBQVkggbW9kZSFcbiIKKwkJIldBUk5JTkchIFdBUk5JTkchIFdBUk5JTkch
IFdBUk5JTkchIFdBUk5JTkchIFdBUk5JTkchIFdBUk5JTkchXG4iKTsKKyNlbmRpZgogfQogCiBz
dGF0aWMgdm9pZCBfX2luaXQgeGVuX3B2X2luaXRfcGxhdGZvcm0odm9pZCkKLS0gCjIuMTYuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
