Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642687740E
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2019 00:33:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr8jb-0007oH-1o; Fri, 26 Jul 2019 22:30:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr8jZ-0007oC-R2
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 22:30:41 +0000
X-Inumbo-ID: ff757e90-aff4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ff757e90-aff4-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 22:30:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 419F8337;
 Fri, 26 Jul 2019 15:30:40 -0700 (PDT)
Received: from [10.37.8.53] (unknown [10.37.8.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79D7F3F71F;
 Fri, 26 Jul 2019 15:30:39 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8b608443-9526-d09a-040f-5d25b9bc0a27@arm.com>
Date: Fri, 26 Jul 2019 23:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726210854.6408-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] arm/percpu: Move {get,
 set}_processor_id() into smp.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKVGhhbmsgeW91IGZvciBsb29raW5nIGludG8gdGhpcy4KCk9uIDcvMjYvMTkg
MTA6MDggUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gRm9yIGNsZWFudXAgcHVycG9zZXMsIGl0
IGlzIG5lY2Vzc2FyeSBmb3IgYXNtL3BlcmNwdS5oIHRvIG5vdCB1c2UKPiBERUNMQVJFX1BFUl9D
UFUoKSBpdHNlbGYuICBhc20vc21wLmggaXMgYXJndWFibHkgYSBiZXR0ZXIgcGxhY2UgZm9yIGl0
IHRvCj4gbGl2ZSBhbnl3YXkuCkkgaGF2ZSBub3RpY2VkIHRoYXQgYSBsb3Qgb2YgYXJjaCBoZWxw
ZXJzIGNhbGxlZCBieSBjb21tb24gY29kZSAKYXJlIGRlZmluZWQgaW4gZGlmZmVyZW50IGhlYWRl
cnMuIFRoZSBtb3N0IG9mZmVuZGVycyBhcmUgaW4gbW0uaAphbmQgcGFnZS5oLgoKTG9va2luZyBh
dCB4ODYsIHRoZSB0d28gaGVscGVycyBhcmUgZGVmaW5lZCBpbiBjdXJyZW50LmguIFNvIEkKdGhp
bmsgaXQgd291bGQgbWFrZSBzZW5zZSB0byBkZWZpbmUgdGhlbSBhdCB0aGUgc2FtZSBwbGFjZXMu
IEkKZG9uJ3QgaGF2ZSBhIHBhcnRpY3VsYXIgcHJlZmVyZW5jZSBiZXR3ZWVuIHNtcC5oIGFuZCBj
dXJyZW50LmgsCmp1c3Qgd2FudCBzb21lIGNvbnNpc3RlbmN5IDopLgoKRldJVywgWGVuIGJ1aWxk
IG5pY2VseSB3aGVuIHRoZSBoZWxwZXJzIGFyZSBtb3ZlZCBpbiBjdXJyZW50Lmg6CgpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9jdXJyZW50LmggYi94ZW4vaW5jbHVkZS9hc20tYXJt
L2N1cnJlbnQuaAppbmRleCBjNGFmNjZmYmI5Li4yM2ZhNjAwOWQ4IDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJl
bnQuaApAQCAtMzksNiArMzksMTMgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgY3B1X2luZm8gKmdl
dF9jcHVfaW5mbyh2b2lkKQogCiAjZGVmaW5lIHJlc2V0X3N0YWNrX2FuZF9qdW1wKGZuKSBzd2l0
Y2hfc3RhY2tfYW5kX2p1bXAoZ2V0X2NwdV9pbmZvKCksIGZuKQogCitERUNMQVJFX1BFUl9DUFUo
dW5zaWduZWQgaW50LCBjcHVfaWQpOworI2RlZmluZSBnZXRfcHJvY2Vzc29yX2lkKCkgICAgKHRo
aXNfY3B1KGNwdV9pZCkpCisjZGVmaW5lIHNldF9wcm9jZXNzb3JfaWQoaWQpICBkbyB7ICAgICAg
ICAgICAgICAgICAgICAgIFwKKyAgICBXUklURV9TWVNSRUcoX19wZXJfY3B1X29mZnNldFtpZF0s
IFRQSURSX0VMMik7ICAgICAgXAorICAgIHRoaXNfY3B1KGNwdV9pZCkgPSAoaWQpOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCit9IHdoaWxlKDApCisKICNlbmRpZgogCiAjZW5kaWYgLyog
X19BUk1fQ1VSUkVOVF9IX18gKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGVy
Y3B1LmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BlcmNwdS5oCmluZGV4IDk1ODRiODMwZDQuLjAx
MTAxNjM0N2IgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGVyY3B1LmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9wZXJjcHUuaApAQCAtMjcsMTIgKzI3LDYgQEAgdm9pZCBwZXJj
cHVfaW5pdF9hcmVhcyh2b2lkKTsKIAogI2RlZmluZSBERUNMQVJFX1BFUl9DUFUodHlwZSwgbmFt
ZSkgZXh0ZXJuIF9fdHlwZW9mX18odHlwZSkgcGVyX2NwdV9fIyNuYW1lCiAKLURFQ0xBUkVfUEVS
X0NQVSh1bnNpZ25lZCBpbnQsIGNwdV9pZCk7Ci0jZGVmaW5lIGdldF9wcm9jZXNzb3JfaWQoKSAg
ICAodGhpc19jcHUoY3B1X2lkKSkKLSNkZWZpbmUgc2V0X3Byb2Nlc3Nvcl9pZChpZCkgIGRvIHsg
ICAgICAgICAgICAgICAgICAgICAgXAotICAgIFdSSVRFX1NZU1JFRyhfX3Blcl9jcHVfb2Zmc2V0
W2lkXSwgVFBJRFJfRUwyKTsgICAgICBcCi0gICAgdGhpc19jcHUoY3B1X2lkKSA9IChpZCk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKLX0gd2hpbGUoMCkKICNlbmRpZgogCiAjZW5kaWYg
LyogX19BUk1fUEVSQ1BVX0hfXyAqLwoKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
