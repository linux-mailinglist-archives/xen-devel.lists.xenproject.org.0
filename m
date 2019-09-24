Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B91BD1CE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 20:23:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCpQB-0000zL-A9; Tue, 24 Sep 2019 18:20:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RU4J=XT=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iCpQA-0000zG-0a
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:20:18 +0000
X-Inumbo-ID: f5de7b2a-def7-11e9-97fb-bc764e2007e4
Received: from mail-qt1-x82a.google.com (unknown [2607:f8b0:4864:20::82a])
 by localhost (Halon) with ESMTPS
 id f5de7b2a-def7-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 18:20:17 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id r5so3326373qtd.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 11:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=pbFAsf0nr9nQIedSCrTR57psV7Dnpl/lINx8FIwB7Dc=;
 b=fu0yRUOpPQJ99R5SbM8INDxh1SSoHffDNWQk5M0aMySdv3mls5U4dfH25er+9KH2wu
 Aq/lYknTm/1dhgrAEQ8l88QNcK4oL68ne0Nkv0+QoIUVqjd8cLmoghlOT2M1c0XJAszp
 tosJWdC4k8CNptbqKQZwhVBgRJ8COu0GdL8jhzBlVY3HQ/pTQmKPpVxGEOn4Z6DKnS+8
 exz52qAwzykWbEqlki4v5GTZ2HgHaeNos0airHxGxaNnxberu/6xxjIPCuNjoSUtWz6E
 YkXTMe3HhRP+ZjAcS0Td6j3WWPGCDHLRQC65ze9ylJuLthvpnkzMLbYSan1OOMjneCUJ
 EF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pbFAsf0nr9nQIedSCrTR57psV7Dnpl/lINx8FIwB7Dc=;
 b=cP4ZlBaPOkt6nuh5XOhch/G+mPCeLhl/8cKHEP51koq7ivcAIDj47z8LVWb2CCJ1Rc
 AQ4cUyYriBToGN0x+i9rWsnfBlTwegYFvZsFDURoBsuKBQiWxxKVtECwejamPtBfPiA5
 F1xxB90iw762Lnf4SwGPH7pMjoQH/Pmyjns7W6WyTB9dr7eC+IbFpvk+ES/34CYqgEMG
 dxuclu84q1T5XyEsE05O2eQmlMeEuRqU9/INzlkp+HwLrguMWmLbwTDrOb26jV3L1WO5
 2bmr8Bx1jhe5So84z2fzAiMeq+Dg2CyfAwJ1AjT8ijzZXyeM2EUi47H/OtchFyDjIjYU
 hXog==
X-Gm-Message-State: APjAAAVkW7DHbLezoGER7MT1BvEhwxvKR3I0jan+vQCrTUBgE0VNo4Ev
 bBxWUu2O4qFzogu4P77NVyGPLVux36IPjAEHz+vWbnYNsjKoOQ==
X-Google-Smtp-Source: APXvYqx8g/KYAgyU/DtZ5BxRydX0o5aUJEPDrGx2zd3ovPTWRrVRwecHexhB7d11YamMfoV5C7Rnb/2gnu1R/g1AR1Y=
X-Received: by 2002:ac8:6e8b:: with SMTP id c11mr4271530qtv.77.1569349216920; 
 Tue, 24 Sep 2019 11:20:16 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 24 Sep 2019 11:20:06 -0700
Message-ID: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkhCgpJJ20gYSBiaXQgYXQgYSBsb3NzIG9mIHdoYXQncyBoYXBwZW5pbmcgaGVyZSwgYnV0IGl0
IHNlZW1zIHRoYXQKdGhlIGxhdGVzdCBYZW4gZnJvbSBtYXN0ZXIgZmFpbHMgdG8gYm9vdCBvbiBI
UCBQcm9MaWFudCBETDIwCkdFTjEwIHNlcnZlciAoc2FtZSBYZW4gYm9vdHMgZmluZSBvbiBldmVy
eSBvdGhlciBwaWVjZSBvZgpoYXJkd2FyZSBpbiBteSBsYWIpLgoKVGhlcmUgYXJlIGFic29sdXRl
bHkgbm8gc2lnbnMgb2Ygd2hhdCdzIGdvaW5nIHdyb25nIHdpdGggaXQuCkl0IGp1c3Qgc3RvcHMg
YXQKCihYRU4pIEhWTTogQVNJRHMgZW5hYmxlZC4KKFhFTikgSFZNOiBWTVggZW5hYmxlZAooWEVO
KSBIVk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSBkZXRlY3RlZAooWEVOKSBIVk06
IEhBUCBwYWdlIHNpemVzOiA0a2IsIDJNQiwgMUdCCi4uLgooWEVOKSBBZGRpbmcgY3B1IDEgdG8g
cnVucXVldWUgMAooWEVOKSBtd2FpdC1pZGxlOiBtYXggQy1zdGF0ZSBjb3VudCBvZiA4IHJlYWNo
ZWQKKFhFTikgQWRkaW5nIGNwdSAyIHRvIHJ1bnF1ZXVlIDAKKFhFTikgbXdhaXQtaWRsZTogbWF4
IEMtc3RhdGUgY291bnQgb2YgOCByZWFjaGVkCgpJIGd1ZXNzIHRoZSBvbmx5IGNsdWUgaXMgdGhh
dCB5b3VyIHR5cGljYWwgbGluZSBvZjoKCihYRU4pIEJyb3VnaHQgdXAgWCBDUFVzCgpuZXZlciBn
ZXRzIHByaW50ZWQgLS0gc28gcGVyaGFwcyB0aGVyZSdzIHNvbWV0aGluZyB3b25reQpnb2luZyBv
biB3aXRoIENQVSBpbml0aWFsaXphdGlvbi4KCkFueSBhZHZpY2Ugb24gaG93IHRvIGRpYWdub3Nl
IHRoaXMgZnVydGhlciB3aWxsIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQuCgpUaGFua3MsClJvbWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
