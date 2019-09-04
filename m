Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B6A8628
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 17:48:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5XSd-00086u-Ra; Wed, 04 Sep 2019 15:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bAUX=W7=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1i5XSc-00086o-J7
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 15:44:42 +0000
X-Inumbo-ID: e90886d4-cf2a-11e9-b76c-bc764e2007e4
Received: from mail-ot1-x336.google.com (unknown [2607:f8b0:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e90886d4-cf2a-11e9-b76c-bc764e2007e4;
 Wed, 04 Sep 2019 15:44:41 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id c7so21112793otp.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2019 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wqr8xYUz312qqW7ANTd3R5QhUFy7JW/+4BeGOKry5qc=;
 b=rPvonVKbhIySERdv4QYHog/mL0/J0FqAtruZN4NgTWnahChnR/1oTDQ2ao7qGLUnL5
 tMtxjc58xGMtWbOASTU3OTIOPgPQX6qIkKgRtu3Y6exmqd9HAhmvm1H1eL8kQGrwsQI4
 q9OT3PNrk3yK6fSqljaT0raoeQrIhf+mWOMHKt8Lt5JPCtPxWg532+ko8BjlAeXDuRNE
 fJcWLHJdhGs6ROj5RPlLQM2A659G8L7jnIXN3rhfiII1mdJG1rgzn1BzsMCDPoHaOhVR
 P2U5/j9i2YF4uyOhx7RuK3NqNGheaxoNIxTR3971PkILGomcW/U4RBFSqiy+pigMvugp
 qAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wqr8xYUz312qqW7ANTd3R5QhUFy7JW/+4BeGOKry5qc=;
 b=SBMuG8j01eZMx45mXEabDSoXoGze4g0db+01U4XsmPruyipGsEhHtEKewTFmqMHHq/
 MSp5qO66O1RLvg4uYhkM55ceHryvo2tER0uIqYWelcOgK3/N+XfITnYlc8vOKI6wpAGP
 DtzXfsWnBM8FsBDICo9PV6sjzDouL4uJIL9cQixFme3KtX7INsgaeOq41ZO/MhBjX/1n
 aDFa+4UrS+gr8wvwRyTkl2vc5XFy8zHuGr+LxNuezLmEHeZnpMGI31CyOeMbmHVqr79l
 o+vx7xzI/aS3/0d5pQh3ukfgm0hgXn0hb1R6GOliRwVAP9qipiCw2uTu1syQAPdjBafM
 qekA==
X-Gm-Message-State: APjAAAVBO10n6AsJj/Q/3jgs1UqOf8LcKVboAg9GSMKUuGAmUhaEpGLk
 sdwE8O9APM5di8Px3Nr6SEbECiOm0Vig22c+6/l8AFSI
X-Google-Smtp-Source: APXvYqyaXbBqg1wOdcGBdmrIYrcB359n3JfLGWvztDRa/w8AXC+1VviWy4ccsva5OdtaQn+DruesRBtdp8j85XuQ4M8=
X-Received: by 2002:a9d:61d3:: with SMTP id h19mr12925441otk.325.1567611881029; 
 Wed, 04 Sep 2019 08:44:41 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Smith <dpsmith.dev@gmail.com>
Date: Wed, 4 Sep 2019 11:45:15 -0400
Message-ID: <CADAP9AWJ46Oh=b-1K1hTNnkD=0DTYtYGX4L7VQp51QBaQCeYNw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] Running xenstored in Linux stubdom
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JlZXRpbmdzLAoKSSBhbSBhdHRlbXB0aW5nIHRvIHNlZSBpZiBJIGNhbiBnZXQgeGVuc3RvcmVk
IHRvIHJ1biB3aXRoaW4gYSBMaW51eApzdHViZG9tIGZvciBhIHZhcmlldHkgb2YgcmVhc29ucy4g
VGhlIHdheSBJIGhhdmUgaXQgY29uc3RydWN0ZWQgYXQKdGhpcyBwb2ludCBpcyB0aGF0IGVtYmVk
ZGVkIHdpdGhpbiB0aGUgaW5pdHJhbWZzIG9mIGRvbTAgaXMgdGhlIGxpbnV4CnN0dWJkb20gaW1h
Z2UgYWxvbmcgd2l0aCB0aGUgaW5pdC14ZW5zdG9yZS1kb21haW4gaGVscGVyLiBUaGUgaW5pdApz
Y3JpcHQgd2l0aGluIHRoZSBpbml0cmFtZnMgZG9lcyBiYXNpYyBMaW51eCBzdGFydCBzZXR1cCwg
bGF1bmNoZXMKdWRldiBhbmQgdGhlbiBhdHRlbXB0cyB0byBzdGFydCB0aGUgc3R1YmRvbSB1c2lu
ZyB0aGUgaGVscGVyIGJpbmFyeS4KVGhlIGhlbHBlciBiaW5hcnkgaGFuZ3MgYW5kIHVzaW5nIHN0
cmFjZSBzaG93cyB0aGUgbGFzdCBjYWxscyBiZWZvcmUKaGFuZ2luZyBpcywKCndyaXRlKDMsICIv
dG9vbC94ZW5zdG9yZWQvZG9taWRcMDosIDIyKSA9IDIyCndyaXRlKDMsICIxIiwgMSkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMQpyZWFkKDMsCgpGb3IgdGhlIHN0dWJk
b20gaXRzZWxmLCBpdHMgaW5pdCBzY3JpcHQgZG9lcyB0aGUgYmFzaWMgTGludXggc3RhcnQKc2V0
dXAgYW5kIHRoZW4gZXhlY3V0ZXMgeGVuc3RvcmVkIGluIGZvcmVncm91bmQuIEkgaGF2ZSB0ZXN0
ZWQgdGhlCnN0dWJkb20gYXMgYSByZWd1bGFyIGd1ZXN0IHBhc3NpbmcgdGhlIC0tbm8tZG9tYWlu
LWluaXQgZmxhZyBhbmQgSSBzZWUKbm8gaXNzdWVzIHdpdGggdGhlIGRvbWFpbiBzdGFydGluZyBh
bmQgbGF1bmNoaW5nIHhlbnN0b3JlZC4KCkZvciBhIHBvaW50IG9mIHJlZmVyZW5jZSwgSSBoYXZl
IGJlZW4gYWJsZSB0byBzdWNjZXNzZnVsbHkgdXNlIHRoZQptaW5pb3Mgc3R1YmRvbSBpbiBwbGFj
ZSBvZiB0aGUgTGludXggc3R1YmRvbS4gSSBoYXZlIGJlZW4gcmV2aWV3aW5nCnRoZSBtaW5pb3Mg
dmVyc2lvbiB0byBzZWUgd2hhdCBJIG1pZ2h0IGJlIG1pc3NpbmcgaW4gdGhlIExJbnV4IHZlcnNp
b24KdG8gbm8gYXZhaWwuIFBlcmhhcHMgb3RoZXJzIG1heSBoYXZlIGluc2lnaHQgb24gd2hhdCB0
aGUgaXNzdWUgbWF5IGJlLgoKVGhhbmsgaW4gYWR2YW5jZSwKRGFuaWVsIFAuIFNtaXRoCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
