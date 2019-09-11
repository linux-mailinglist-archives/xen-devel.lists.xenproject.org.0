Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C22AFA7A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zvo-0000Ib-Fl; Wed, 11 Sep 2019 10:33:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiaO=XG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i7zvm-0000HO-9T
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:32:58 +0000
X-Inumbo-ID: 7872d6ea-d47f-11e9-978d-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7872d6ea-d47f-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 10:32:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t8so15988533lfc.13
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=08Tfqlh32NonuTtd2lAC2CC6l3pp2R7W8WbzNwGVHbA=;
 b=BqXnLW68Bh5QTW0Ew/mCLYKCqvWmb/YPGKeQEAPTGOZotGTFSmw4ATOHcollF/TsBB
 dEmF2tOGjYrMh//MMdu5usIUo8L9tqGjIba0zOCC06Ms/OkdEWdcLPHcGfE9riHEqTnF
 abJV9QX3hUB9bLo7HYKTMZj3m5oGTFDSCg7w5rscLcLc6atTZVm6ht5vf3n7+9mD//ui
 Q2+RbmY3R7syxHPVzRUfFdtogEHRYFUtf+uOeSJ/124fdQPDiRPOCxqRjqdA+pQYk1gM
 Bbl4Br0klvYTWCrITEvr7uTMm68chLWkiF6+4adXGk8rgxqXeIu3Y/m42iA2hpoCCShr
 zR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=08Tfqlh32NonuTtd2lAC2CC6l3pp2R7W8WbzNwGVHbA=;
 b=pQYRWFk2FuLWOqW3WPXQF/uA56tmXV+93BcbFsjNdvjZAOhfwxh8L0nov5wOxmdS7y
 BHQh82JIfkIjrap1snWC2Cjx3oUhp0R0TeZF2jBHPkPHFEhsw3drgI1Jxsb46iTE7PHc
 e5PkB2Rr16m4jWV7AuNbJfZ7StYWFatES6QaWs0zVX3hjhNYPY5LdJ5Cs8VGV0RBQlPw
 p5zT6daBkOoIlLzKq1+ktwjvzBzCy7JRXQBTnn3zUl5AYhBNiWxQGET+8acPHJeDIytq
 tMhOXa4Rb6RFTsxngqDX4Luddia8URx3WHdHFMR32BTxIB2L6qLoHEsyY8sTI8e3MeIG
 6BtA==
X-Gm-Message-State: APjAAAXRKMw+lrvsOxPZvXTlvVzIkftFIZ/6Q1H1BR5fQdsS0JOAzGN0
 VekeGwObxnwj001mQ67Cqro3V7C1NgU=
X-Google-Smtp-Source: APXvYqx0Y2MLLMusealu4mWXiRk+PuMbEJzgqM8TyJJ/YqX67dWzFfUWbRs8DaLxD53ZYt1aCG9+1Q==
X-Received: by 2002:ac2:4a69:: with SMTP id q9mr22552432lfp.86.1568197954984; 
 Wed, 11 Sep 2019 03:32:34 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w27sm4585275ljd.55.2019.09.11.03.32.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 03:32:34 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 13:32:19 +0300
Message-Id: <1568197942-15374-7-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 6/9] sched:rtds: get guest time from time
 accounting code
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrii Anisov <andrii_anisov@epam.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCldoaWxlIHRoZSBS
VERTIHNjaGVkdWxlciBjb2RlIGRvZXMgbm90IHVzZSBndWVzdCB0aW1lIGZyb20gdGhlCm90aGVy
IHBjcHUsIHdlIGFyZSBmcmVlIHRvIGdvIHdpdGggbG9ja2xlc3MgdGltZSBhY2NvdW50aW5nLgoK
U2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0t
CiB4ZW4vY29tbW9uL3NjaGVkX3J0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9y
dC5jIGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCmluZGV4IGUwZTM1MGIuLjJjZTIwMGIgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfcnQuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX3J0LmMK
QEAgLTk0NSw4ICs5NDUsOSBAQCBidXJuX2J1ZGdldChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpv
cHMsIHN0cnVjdCBydF92Y3B1ICpzdmMsIHNfdGltZV90IG5vdykKICAgICBpZiAoIGlzX2lkbGVf
dmNwdShzdmMtPnZjcHUpICkKICAgICAgICAgcmV0dXJuOwogCisgICAgQVNTRVJUKHN2Yy0+dmNw
dSA9PSBjdXJyZW50KTsKICAgICAvKiBidXJuIGF0IG5hbm9zZWNvbmRzIGxldmVsICovCi0gICAg
ZGVsdGEgPSBub3cgLSBzdmMtPmxhc3Rfc3RhcnQ7CisgICAgZGVsdGEgPSB0YWNjX2dldF9ndWVz
dF90aW1lX2RlbHRhKCk7CiAgICAgLyoKICAgICAgKiBkZWx0YSA8IDAgb25seSBoYXBwZW5zIGlu
IG5lc3RlZCB2aXJ0dWFsaXphdGlvbjsKICAgICAgKiBUT0RPOiBob3cgc2hvdWxkIHdlIGhhbmRs
ZSBkZWx0YSA8IDAgaW4gYSBiZXR0ZXIgd2F5PwpAQCAtOTYwLDcgKzk2MSw2IEBAIGJ1cm5fYnVk
Z2V0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHJ0X3ZjcHUgKnN2Yywgc190
aW1lX3Qgbm93KQogICAgIH0KIAogICAgIHN2Yy0+Y3VyX2J1ZGdldCAtPSBkZWx0YTsKLSAgICBz
dmMtPmxhc3Rfc3RhcnQgPSBub3c7CiAKICAgICBpZiAoIHN2Yy0+Y3VyX2J1ZGdldCA8PSAwICkK
ICAgICB7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
