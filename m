Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C21076A
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 13:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLnFC-0001jA-BD; Wed, 01 May 2019 11:17:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7ua=TB=merlin.srs.infradead.org=batv+1e733e8c069b692f204e+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLnF9-0001gX-Pl
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:43 +0000
X-Inumbo-ID: bbe17239-6c02-11e9-843c-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbe17239-6c02-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:References:In-Reply-To:
 Message-Id:Date:Subject:To:From:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ccpbk33Kh2sU+iShNHwwwyNtiYF4GnNFpbcwF0XKD94=; b=fXdwQ6Y566jXI7ZbgyAUR5JC/
 X9gZwiDRu0fu7gzZhBCyMLZpcT/iVAORWN9XihcN0BR5d7lmDzpojmAR5h3kHfewRywAgW8TwDx+u
 44SPPZg1RrIkUkiNYnVTrz4NPSk5hrj6+305xf+DQUYBKVmTYGdqdQOcTselalWfDy2zWRI/Tpe7R
 qHxYHeijcjWsx+dXB3/84B95fCrBNFCqP3KUemo/pnRKmYO9qVa3M1tJjZurFnseF2XQOPsXpbbRw
 lcURY9gvAoANadwuf7Ix7imKNlk2xSdBfKc4fWipYCJ9Z2Vhf2NpRpysxKFtwyPsTPwJxZJP+YT65
 fFnRT4q1Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLnF6-0008Rs-5f
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hLnF5-0030Ns-9b
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:17:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 12:17:34 +0100
Message-Id: <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 2/7] x86/boot: Remove gratuitous call back
 into low-memory code
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCldlIGFwcGVhciB0byBo
YXZlIGltcGxlbWVudGVkIGEgbWVtY3B5KCkgaW4gdGhlIGxvdy1tZW1vcnkgdHJhbXBvbGluZQp3
aGljaCB3ZSB0aGVuIGNhbGwgaW50byBmcm9tIF9fc3RhcnRfeGVuKCksIGZvciBubyBhZGVxdWF0
ZWx5IGRlZmluZWQKcmVhc29uLgoKS2lsbCBpdCB3aXRoIGZpcmUuCgpTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290
L21lbS5TICAgIHwgMjcgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYv
c2V0dXAuYyAgICAgICB8IDEyICsrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9lODIw
LmggfCAgNSArKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9tZW0uUyBiL3hlbi9hcmNo
L3g4Ni9ib290L21lbS5TCmluZGV4IGM2YTliZDRkM2IuLjJkNjFkMjg4MzUgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9ib290L21lbS5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L21lbS5TCkBA
IC03LDcgKzcsNyBAQCBnZXRfbWVtb3J5X21hcDoKIAogLkxtZW1lODIwOgogICAgICAgICB4b3Js
ICAgICVlYngsICVlYnggICAgICAgICAgICAgICAgICAgICAgIyBjb250aW51YXRpb24gY291bnRl
cgotICAgICAgICBtb3Z3ICAgICRib290c3ltKGU4MjBtYXApLCAlZGkgICAgICAgICAgICAgIyBw
b2ludCBpbnRvIHRoZSB3aGl0ZWxpc3QKKyAgICAgICAgbW92dyAgICAkYm9vdHN5bShiaW9zX2U4
MjBtYXApLCAlZGkgICAgICMgcG9pbnQgaW50byB0aGUgd2hpdGVsaXN0CiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIHNvIHdlIGNhbiBoYXZlIHRoZSBi
aW9zCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGRp
cmVjdGx5IHdyaXRlIGludG8gaXQuCiAKQEAgLTIyLDggKzIyLDggQEAgZ2V0X21lbW9yeV9tYXA6
CiAgICAgICAgIGNtcGwgICAgJFNNQVAsJWVheCAgICAgICAgICAgICAgICAgICAgICAjIGNoZWNr
IHRoZSByZXR1cm4gaXMgYFNNQVAnCiAgICAgICAgIGpuZSAgICAgLkxtZW04OAogCi0gICAgICAg
IGluY3cgICAgYm9vdHN5bShlODIwbnIpCi0gICAgICAgIGNtcHcgICAgJEU4MjBfQklPU19NQVgs
Ym9vdHN5bShlODIwbnIpICAjIHVwIHRvIHRoaXMgbWFueSBlbnRyaWVzCisgICAgICAgIGluY3cg
ICAgYm9vdHN5bShiaW9zX2U4MjBucikKKyAgICAgICAgY21wdyAgICAkRTgyMF9CSU9TX01BWCxi
b290c3ltKGJpb3NfZTgyMG5yKSAjIHVwIHRvIHRoaXMgbWFueSBlbnRyaWVzCiAgICAgICAgIGph
ZSAgICAgLkxtZW04OAogCiAgICAgICAgIG1vdncgICAgJWRpLCVheApAQCAtNjYsMjcgKzY2LDEw
IEBAIGdldF9tZW1vcnlfbWFwOgogCiAgICAgICAgIHJldAogCi0vKgotICogQ29weSBFODIwIG1h
cCBvYnRhaW5lZCBmcm9tIEJJT1MgdG8gYSBidWZmZXIgYWxsb2NhdGVkIGJ5IFhlbi4KLSAqIElu
cHV0OiAlcmRpOiB0YXJnZXQgYWRkcmVzcyBvZiBlODIwIGVudHJ5IGFycmF5Ci0gKiAgICAgICAg
JWVzaTogbWF4aW11bSBudW1iZXIgb2YgZW50cmllcyB0byBjb3B5Ci0gKiBPdXRwdXQ6ICVlYXg6
IG51bWJlciBvZiBlbnRyaWVzIGNvcGllZAotICovCi0gICAgICAgIC5jb2RlNjQKLUVOVFJZKGU4
MjBtYXBfY29weSkKLSAgICAgICAgbW92ICAgICAlZXNpLCAlZWF4Ci0gICAgICAgIGxlYSAgICAg
ZTgyMG1hcCglcmlwKSwgJXJzaQotICAgICAgICBtb3YgICAgIGU4MjBuciglcmlwKSwgJWVjeAot
ICAgICAgICBjbXAgICAgICVlY3gsICVlYXgKLSAgICAgICAgY21vdmEgICAlZWN4LCAlZWF4ICAg
ICAgICAgICAgICAgICAgICAgICMgbnVtYmVyIG9mIGVudHJpZXMgdG8gbW92ZQotICAgICAgICBp
bXVsICAgICQ1LCAlZWF4LCAlZWN4Ci0gICAgICAgIHJlcCBtb3ZzbCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAjIGRvIHRoZSBtb3ZlCi0gICAgICAgIHJldAotCiAgICAgICAgIC5hbGln
biAgNAotZTgyMG1hcDoKK0dMT0JBTChiaW9zX2U4MjBtYXApCiAgICAgICAgIC5maWxsICAgRTgy
MF9CSU9TX01BWCoyMCwxLDAKLWU4MjBucjoKK0dMT0JBTChiaW9zX2U4MjBucikKICAgICAgICAg
LmxvbmcgICAwCiBHTE9CQUwobG93bWVtX2tiKQogICAgICAgICAubG9uZyAgIDAKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggYTM1
M2Q3NmY5YS4uNWZhN2QzYjc5YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysr
IGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTY2NCw2ICs2NjQsMTggQEAgc3RhdGljIGNoYXIg
KiBfX2luaXQgY21kbGluZV9jb29rKGNoYXIgKnAsIGNvbnN0IGNoYXIgKmxvYWRlcl9uYW1lKQog
ICAgIHJldHVybiBwOwogfQogCitzdGF0aWMgaW50IGNvcHlfYmlvc19lODIwKHN0cnVjdCBlODIw
ZW50cnkgKm1hcCwgdW5zaWduZWQgaW50IGxpbWl0KQoreworICAgIHVuc2lnbmVkIGludCBuID0g
Ym9vdHN5bShiaW9zX2U4MjBucik7CisgICAgaWYgKG4gPiBsaW1pdCkKKyAgICAgICAgbiA9IGxp
bWl0OworCisgICAgaWYgKG4pCisgICAgICAgIG1lbWNweShtYXAsIGJvb3RzeW0oYmlvc19lODIw
bWFwKSwgc2l6ZW9mKCptYXApICogbik7CisKKyAgICByZXR1cm4gbjsKK30KKwogdm9pZCBfX2lu
aXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKIHsKICAgICBjaGFy
ICptZW1tYXBfdHlwZSA9IE5VTEw7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2U4
MjAuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZTgyMC5oCmluZGV4IGVlMzE3YjE3YWEuLjUyOTE2
ZmI3NWQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZTgyMC5oCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvZTgyMC5oCkBAIC0zNyw4ICszNyw3IEBAIGV4dGVybiBzdHJ1Y3QgZTgy
MG1hcCBlODIwX3JhdzsKIAogLyogVGhlc2Ugc3ltYm9scyBsaXZlIGluIHRoZSBib290IHRyYW1w
b2xpbmUuICovCiBleHRlcm4gdW5zaWduZWQgaW50IGxvd21lbV9rYiwgaGlnaG1lbV9rYjsKLXVu
c2lnbmVkIGludCBlODIwbWFwX2NvcHkoc3RydWN0IGU4MjBlbnRyeSAqbWFwLCB1bnNpZ25lZCBp
bnQgbGltaXQpOwotCi0jZGVmaW5lIGNvcHlfYmlvc19lODIwIGJvb3RzeW0oZTgyMG1hcF9jb3B5
KQorZXh0ZXJuIHN0cnVjdCBlODIwbWFwIGJpb3NfZTgyMG1hcFtdOworZXh0ZXJuIHVuc2lnbmVk
IGludCBiaW9zX2U4MjBucjsKIAogI2VuZGlmIC8qX19FODIwX0hFQURFUiovCi0tIAoyLjE3LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
