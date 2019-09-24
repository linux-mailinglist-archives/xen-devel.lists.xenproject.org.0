Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488DBD077
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:19:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoRj-0002fB-A3; Tue, 24 Sep 2019 17:17:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCoRh-0002ev-60
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:17:49 +0000
X-Inumbo-ID: 3b2e3e62-deef-11e9-8628-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 3b2e3e62-deef-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 17:17:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20C1D142F;
 Tue, 24 Sep 2019 10:17:48 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A20FE3F694;
 Tue, 24 Sep 2019 10:17:46 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 18:17:42 +0100
Message-Id: <20190924171742.25480-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [RESEND][PATCH for-4.13] xen: sched: Fix Arm build
 after commit f855dd9625
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGY4NTVkZDk2MjUgInNjaGVkOiBhZGQgbWluaW1hbGlzdGljIGlkbGUgc2NoZWR1bGVy
IGZvciBmcmVlIGNwdXMiCmludHJvZHVjZSB0aGUgdXNlIG9mIFpFUk9fQkxPQ0tfUFRSIGluIHRo
ZSBzY2hlZHVsZXIgY29kZS4gSG93ZXZlciwgdGhlCmRlZmluZSBkb2VzIG5vdCBleGlzdCBvdXRz
aWRlIG9mIHhtYWxsb2NfdHNmLmMgZm9yIG5vbi14ODYgYXJjaGl0ZWN0dXJlLgoKVGhpcyB3aWxs
IHJlc3VsdCB0byBhIGNvbXBpbGF0aW9uIGVycm9yIG9uIEFybToKCnNjaGVkdWxlLmM6IEluIGZ1
bmN0aW9uIOKAmHNjaGVkX2lkbGVfYWxsb2NfdmRhdGHigJk6CnNjaGVkdWxlLmM6MTAwOjEyOiBl
cnJvcjog4oCYWkVST19CTE9DS19QVFLigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMg
ZnVuY3Rpb24pCiAgICAgcmV0dXJuIFpFUk9fQkxPQ0tfUFRSOwogICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+CnNjaGVkdWxlLmM6MTAwOjEyOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRl
bnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFy
cyBpbgpzY2hlZHVsZS5jOjEwMToxOiBlcnJvcjogY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24t
dm9pZCBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KIH0KIF4KY2MxOiBhbGwgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKClRvIGF2b2lkIHRoZSBjb21waWxhdGlvbiBlcnJv
ciwgdGhlIGRlZmF1bHQgZGVmaW5pdGlvbiBmb3IKWkVST19CTE9DS19QVFIgaXMgbm93IG1vdmVk
IGluIHhlbi9jb25maWcuaCBhbGxvd2luZyBhbGwgdGhlIGNvZGUgdG8gdXNlCnRoZSBkZWZpbmUu
CgpGaXhlczogZjg1NWRkOTYyNSAoJ3NjaGVkOiBhZGQgbWluaW1hbGlzdGljIGlkbGUgc2NoZWR1
bGVyIGZvciBmcmVlIGNwdXMnKQpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgotLS0KIHhlbi9jb21tb24veG1hbGxvY190bHNmLmMgfCA1IC0tLS0tCiB4
ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmggIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi94bWFs
bG9jX3Rsc2YuYyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKaW5kZXggZTk4YWQ2NTQ1NS4u
MWU4ZDcyZGVhMiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYworKysgYi94
ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCkBAIC01NDksMTEgKzU0OSw2IEBAIHN0YXRpYyB2b2lk
IHRsc2ZfaW5pdCh2b2lkKQogICogeG1hbGxvYygpCiAgKi8KIAotI2lmbmRlZiBaRVJPX0JMT0NL
X1BUUgotLyogUmV0dXJuIHZhbHVlIGZvciB6ZXJvLXNpemUgYWxsb2NhdGlvbiwgZGlzdGluZ3Vp
c2hlZCBmcm9tIE5VTEwuICovCi0jZGVmaW5lIFpFUk9fQkxPQ0tfUFRSICgodm9pZCAqKS0xTCkK
LSNlbmRpZgotCiB2b2lkICpfeG1hbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxv
bmcgYWxpZ24pCiB7CiAgICAgdm9pZCAqcCA9IE5VTEw7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vY29uZmlnLmggYi94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmgKaW5kZXggYTFkMGY5NzBh
Ny4uYTEwNjM4MGEyMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbmZpZy5oCisrKyBi
L3hlbi9pbmNsdWRlL3hlbi9jb25maWcuaApAQCAtODYsNCArODYsOSBAQAogI2RlZmluZSBOREVC
VUcKICNlbmRpZgogCisjaWZuZGVmIFpFUk9fQkxPQ0tfUFRSCisvKiBSZXR1cm4gdmFsdWUgZm9y
IHplcm8tc2l6ZSBhbGxvY2F0aW9uLCBkaXN0aW5ndWlzaGVkIGZyb20gTlVMTC4gKi8KKyNkZWZp
bmUgWkVST19CTE9DS19QVFIgKCh2b2lkICopLTFMKQorI2VuZGlmCisKICNlbmRpZiAvKiBfX1hF
Tl9DT05GSUdfSF9fICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
