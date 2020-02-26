Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6F170351
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:57:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6z1s-0004he-Rz; Wed, 26 Feb 2020 15:55:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RfmG=4O=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j6z1r-0004hY-1t
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:55:19 +0000
X-Inumbo-ID: 62a04130-58b0-11ea-aba8-bc764e2007e4
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62a04130-58b0-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 15:55:18 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h23so3660671ljc.8
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/2IyVKobP/t7YBQUsRY43pwDoy6NWLZAJFT/2M0Q5v0=;
 b=kTwz4Yg1pySmN56I/03fnR08nqtMw0DCpqlIuwB5n8pTm+oBK+iseKyf4Gg4XzL5w4
 ajviel07TqV8Z3kKLlHaX/RkjHJCBslZFvJ3KE6O+SZCxVbEvFt1LAYDHJ2QIF1zH2QR
 GRywiBqn57ElkRh890zD8m3l2mfE+goBfzJUNjtjByO3ZvXSQylzY8ms+rTcGPX8WHKd
 5ufQmamnGeJqMtjqgUFWBQtBewL+Y5EdhP/gzWDkRbzxOd4THv4Tki1S7vxtiHgiBqHh
 jCDQxPtaYkK4N5P9pe9ccP4nbVGCa+ARFrHcEmSqQoG3SrTa39+AERA33TbcVDHwTkeK
 qRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/2IyVKobP/t7YBQUsRY43pwDoy6NWLZAJFT/2M0Q5v0=;
 b=Wmx3MZ/ExTbsMeuUSS96UFoV9gASG5PsczQCCgmlvDrf7qhCeXcaRGAJ7ci+6u0HrU
 0m5Yry9kuJQ9krNEeIYja6E9fopEsgmec+DdHnYlXuWtBGpBDbZTrCspI4yqKwcwS0yy
 AIaPMd2Aq1bIqpdgydOELAUF2idM/MJgn7Xx3gDa5C8s2fTfHv/S8go92DO1dWvLpwkx
 zu268maVjoCJIF3see2PE6sayOeSfKYJSSVfNtEfxOsApLmLJknSs68MFt4joS5tS3ey
 MfnneM7FdFOdmvLOsmr2d37iTr946WhySBRWnpw5Rxuj6PxUYqH8o5J4oNwKGXkPJaWw
 ClAQ==
X-Gm-Message-State: APjAAAWbyVL4qqZxbbM+Fx1bCvRxXp5CTnriB08mIX469YhWmYT/CPk3
 tz5X0AbRUxx1MzHTspeFMTwu7WZPs3AyWPJcW9tWywKg
X-Google-Smtp-Source: APXvYqw7B54kf4JiglwOicCMorjgliG727V1YfJdEo7bzB1t/viXbBaJSaU4C/1vHCabMYSDCN3wxE1ggUEXsgLSRjM=
X-Received: by 2002:a2e:b4dc:: with SMTP id r28mr1620508ljm.255.1582732517283; 
 Wed, 26 Feb 2020 07:55:17 -0800 (PST)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Feb 2020 10:55:06 -0500
Message-ID: <CAKf6xpv-U91nF2Fik7GRN3SFeOWWcdR5R+ZcK5fgojE+-D43sg@mail.gmail.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] block scripts file:// check_sharing bug
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

SGksCgpJJ3ZlIG5vdGljZWQgYSBjb3VwbGUgb2YgaXNzdWVzIGluIHRoZSBibG9jayBzY3JpcHQg
Y2hlY2tfc2hhcmluZwpmdW5jdGlvbi4gIFJpZ2h0IG5vdywgbG9vcGJhY2sgZmlsZSBjYW4gYmUg
YXNzaWduZWQgbXVsdGlwbGUgdGltZXMgdG8KbXVsdGlwbGUgVk1zLgoKVGhlIGZpcnN0IGlzc3Vl
IGlzIGBzdGF0IC1jICclRCdgIGlzIHVzZWQgdG8gZ2V0IHRoZSBkZXZpY2UgbnVtYmVyIG9mCnRo
ZSBmaWxlIGluIGhleGFkZWNpbWFsLCBidXQgbG9zZXR1cCBwcmludHMgdGhlIGRldmljZSBudW1i
ZXIgYXMKZGVjaW1hbC4KCiQgc3VkbyBsb3NldHVwIC9kZXYvbG9vcDEKL2Rldi9sb29wMTogWzY0
NzcwXTo4NDg1NiAoL3N2ci9yYXcuaW1nKQokIHN0YXQgLWMgJWQgL3N2ci9yYXcuaW1nCjY0Nzcw
CiQgc3RhdCAtYyAlRCAvc3ZyL3Jhdy5pbWcKZmQwMgoKSSBmb3VuZCB0aGlzIG9uIENlbnRPUzcs
IGJ1dCBpdCBsb29rcyBsaWtlIGxvc2V0dXAgaGFzIHJldHVybmVkCmRlY2ltYWwgc2luY2UgMjAx
MS4KaHR0cHM6Ly9naXRodWIuY29tL2thcmVsemFrL3V0aWwtbGludXgvY29tbWl0cy8zOWZkZTEz
NzNkOWY4ODhiNjg2ZmM4Zjc4MGMwNWJhNDA5MWM3MGJkCmNoYW5nZWQgZnJvbSBzaG93X2xvb3Bf
ZmQgdXNpbmcgUFJJeDY0IHRvIHByaW50Zl9sb29wZGV2IHdpdGggIiUwNGQiLgoKVGhlIHNlY29u
ZCBJJ20gbm90IHN1cmUgaG93IHRvIGNvcnJlY3QuICBIZW5jZSB0aGlzIGVtYWlsIGluc3RlYWQg
b2YgYSBwYXRjaC4KCldoZW4gYSBsb29wIGRldmljZSBpcyBjcmVhdGVkLCB0aGUgbG9vcGRldidz
IG1ham9yOm1pbm9yIGlzIHN0b3JlZAppbnRvIHRoZSBwaHlzaWNhbC1kZXZpY2Ugbm9kZS4gIFdo
ZW4gY2hlY2tfc2hhcmluZyBpdGVyYXRlcyB0aHJvdWdoCnRoZSBwaHlzaWNhbC1kZXZpY2Ugbm9k
ZXMsIGl0IGlzIHVzaW5nIHRoZSBmaWxlJ3MgbWFqb3I6bWlub3IuICBTbwpldmVuIHRob3VnaCAv
ZGV2L2xvb3AwIGFscmVhZHkgZXhpc3RzIHBvaW50aW5nIHRvIGEgZ2l2ZW4gZmlsZSwgaXQKZG9l
c24ndCBnZXQgbWF0Y2hlZC4gIEl0IHNlZW1zIGxpa2UgZmlsZXMgc2hvdWxkIGJlIGhhbmRsZWQg
aW4gdGVybXMKb2YgYmxvY2stZGV2aWNlICYgZmlsZXBhdGgvaW5vZGUgc2VwYXJhdGVseSBmcm9t
IHRoZSBibG9ja2RldmljZQptYWpvcjptaW5vci4gIE1heWJlIGNoZWNrX3NoYXJpbmcgbmVlZHMg
dG8gbWF0Y2ggdGhlIGxvc2V0dXAgb3V0cHV0CmFnYWluc3QgdGhlIGZpbGVzIHBhdGhzIHdoZW4g
Y3JlYXRpbmcgZGV2bW0/CgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
