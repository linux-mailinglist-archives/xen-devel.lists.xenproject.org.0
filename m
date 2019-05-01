Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87F910775
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 13:20:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLnFB-0001hC-5s; Wed, 01 May 2019 11:17:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7ua=TB=merlin.srs.infradead.org=batv+1e733e8c069b692f204e+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLnF9-0001g9-FC
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:43 +0000
X-Inumbo-ID: bbd7e216-6c02-11e9-843c-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbd7e216-6c02-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:References:In-Reply-To:
 Message-Id:Date:Subject:To:From:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fOirksPB/oJn6xmpo4fvbo5BpG0EWvK9QEfvnnz5lLU=; b=EjZ7fWUVPXph832wkuLaxTmFe
 So0zl2I1i7mDiclfOvw9f44G4k6rrpnkYV7zEjOweY+awEpbEI5qtSmWLbqebThiXJAViYi5N901r
 kp0gn9RQ78AMjry//xvwwWcYUyGa23s+VVImXW/e11p4qNhTClXDuKKWhgavmrA9tya+14gxyAH81
 aZZaC4CNz52fs/3E4EI3hqaLYFqn1ad/pefcEKxiDqbEytfC3N7bwdVJBGBu0pKyG5MQejyooID7A
 YI73PlHamoPY+ZC6ja5oZ54ht8cEU2iwzeR27MoOSuzR+BrggYV1OHWM3S7khcSDXBbHvaV1W+uwl
 /9c9/QLhQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLnF6-0008Rr-58
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hLnF5-0030Nn-8w
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:17:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 12:17:33 +0100
Message-Id: <22e1febec473b55fd7e43ffe02fb3a81f70a5e86.1556708226.git.dwmw2@infradead.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 1/7] x86/wakeup: Stop using %fs for lidt/lgdt
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoZSB3YWtldXAgY29k
ZSBpcyBub3cgcmVsb2NhdGVkIGFsb25nc2lkZSB0aGUgdHJhbXBvbGluZSBjb2RlLCBzbyAlZHMK
aXMganVzdCBmaW5lIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdA
YW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290L3dha2V1cC5TIHwgMTEgKystLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMgYi94ZW4vYXJjaC94ODYvYm9v
dC93YWtldXAuUwppbmRleCBmOTYzMmVlZjk1Li44YzUyODE5MTcxIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvYm9vdC93YWtldXAuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC93YWtldXAuUwpA
QCAtNDAsMTEgKzQwLDggQEAgRU5UUlkod2FrZXVwX3N0YXJ0KQogICAgICAgICBtb3Z3ICAgICVh
eCwgJWZzCiAgICAgICAgIG1vdncgICAgJDB4MGUwMCArICdMJywgJWZzOigweDEwKQogCi0gICAg
ICAgICMgYm9vdCB0cmFtcG9saW5lIGlzIHVuZGVyIDFNLCBhbmQgc2hpZnQgaXRzIHN0YXJ0IGlu
dG8KLSAgICAgICAgIyAlZnMgdG8gcmVmZXJlbmNlIHN5bWJvbHMgaW4gdGhhdCBhcmVhCi0gICAg
ICAgIG1vdiAgICAgd2FrZXN5bSh0cmFtcG9saW5lX3NlZyksICVmcwotICAgICAgICBsaWR0ICAg
ICVmczpib290c3ltKGlkdF80OCkKLSAgICAgICAgbGdkdCAgICAlZnM6Ym9vdHN5bShnZHRfNDgp
CisgICAgICAgIGxpZHQgICAgYm9vdHN5bShpZHRfNDgpCisgICAgICAgIGxnZHQgICAgYm9vdHN5
bShnZHRfNDgpCiAKICAgICAgICAgbW92dyAgICAkMSwgJWF4CiAgICAgICAgIGxtc3cgICAgJWF4
ICAgICAgICAgICAgICMgVHVybiBvbiBDUjAuUEUgCkBAIC0xMDIsMTAgKzk5LDYgQEAgR0xPQkFM
KHZpZGVvX21vZGUpCiAgICAgICAgIC5sb25nIDAKIEdMT0JBTCh2aWRlb19mbGFncykKICAgICAg
ICAgLmxvbmcgMAotdHJhbXBvbGluZV9zZWc6IC53b3JkIDAKLSAgICAgICAgLnB1c2hzZWN0aW9u
IC50cmFtcG9saW5lX3NlZywgImEiCi0gICAgICAgIC5sb25nICAgdHJhbXBvbGluZV9zZWcgLSAu
Ci0gICAgICAgIC5wb3BzZWN0aW9uCiAKICAgICAgICAgLmNvZGUzMgogCi0tIAoyLjE3LjIKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
