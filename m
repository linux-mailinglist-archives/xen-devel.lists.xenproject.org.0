Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB2F1215
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 10:23:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSHTL-0006rW-4G; Wed, 06 Nov 2019 09:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rf37=Y6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iSHTI-0006rO-TV
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 09:19:24 +0000
X-Inumbo-ID: 8388bb1c-0076-11ea-adbe-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8388bb1c-0076-11ea-adbe-bc764e2007e4;
 Wed, 06 Nov 2019 09:19:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t5so25236023ljk.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 01:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y60o9fNUcHZsrorXcWFX4zvC9XULhWVpmJqmThUGBvs=;
 b=imZLBWBS0BJ7Slb1xEMmz7uUDllOi1B5SPzOa4E59Fx/u6gcbMWxkuWXAaJZGCWt1e
 mSb/Nal1B8A7d4GjoAaWx9DQ3r3CZbRt0PPwrrDOHyHnOYMtahcx25Ay+Mtcq4Ui2UjO
 FG/xbXglpY0Y4zAzBswfAC6Tb9jFpNA3vq6Co6nMz3qSV1iSDzOd4eEqC6QyfOsBDNOR
 n3bbnCSdIrjnBD44KowCtgYooSTQdNQz1s4gjmY18rg3YyaJo8vjvoe/nd8f3NTNP+5H
 tsSUO6J0/V/GIvDDg/f6Fa1ZsEfbzUIFxe5onipgRsHnwPS5BR+1qaMfowQkdH8AYM6m
 hDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y60o9fNUcHZsrorXcWFX4zvC9XULhWVpmJqmThUGBvs=;
 b=S9NCUjy3nL+7FBplMrGR49s//YSs54TVZPAqmqczjABYyL8nBAYPCSv5JscDytTVcQ
 4IptwPKmGIceD6oB8wjp5VDG898r4P+Vdf9S81FzkHDw1/Dr3EFg9LHTxL08ytkPw77U
 MKeT1RxZD+ZhFBUia1t9OdpgyYMwLxLfdsdey4dL22Ml09fWPBsi6rmyqFllQKBW8xWd
 ibSnXS/bGC2OHG1S4jUco1BCH1TzWLLEqIE0PKaBaQIoCjVzvv8K7iaqDCe6h0s/Hs0G
 OHBJF7YkjrOs3JeKURxqDB+jhFUCtJyVXruzAn1+zdwMusOYvY0Vj5x1ro3VnAQkQsZ2
 6IEQ==
X-Gm-Message-State: APjAAAVeo4je9dxcUuq59ACSjh+1UzdX3wGxtIeLjMxMywI/rKfUZpCZ
 2O28to0SioRpn3DyhO4es6lpog3D1ds=
X-Google-Smtp-Source: APXvYqxq2jsEIltaX02AKa3Gqbw+LafXe5XEfUcR2SOIqbK/Lwd8ii4AhvQDQodcR1Q0x3lGOX3GzQ==
X-Received: by 2002:a2e:890e:: with SMTP id d14mr1098025lji.6.1573031958811;
 Wed, 06 Nov 2019 01:19:18 -0800 (PST)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id g23sm3945937lja.104.2019.11.06.01.19.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 06 Nov 2019 01:19:18 -0800 (PST)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  6 Nov 2019 11:19:07 +0200
Message-Id: <1573031953-12894-2-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 1/7] xen: clang: Support correctly cross-compile
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNsYW5nIHVzZXMgIi10
YXJnZXQiIG9wdGlvbiBmb3IgY3Jvc3MtY29tcGlsYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIGNvbmZpZy9TdGRHTlUubWsgfCA5
ICsrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9jb25maWcvU3RkR05VLm1rIGIvY29uZmlnL1N0ZEdOVS5tawppbmRl
eCAwMzkyNzRlLi40OGM1MGI1IDEwMDY0NAotLS0gYS9jb25maWcvU3RkR05VLm1rCisrKyBiL2Nv
bmZpZy9TdGRHTlUubWsKQEAgLTEsOCArMSwxMyBAQAogQVMgICAgICAgICA9ICQoQ1JPU1NfQ09N
UElMRSlhcwogTEQgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlsZAogaWZlcSAoJChjbGFuZyks
eSkKLUNDICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpY2xhbmcKLUNYWCAgICAgICAgPSAkKENS
T1NTX0NPTVBJTEUpY2xhbmcrKworaWZuZXEgKCQoQ1JPU1NfQ09NUElMRSksKQorQ0MgICAgICAg
ICA9IGNsYW5nIC10YXJnZXQgJChDUk9TU19DT01QSUxFOi09KQorQ1hYICAgICAgICA9IGNsYW5n
KysgLXRhcmdldCAkKENST1NTX0NPTVBJTEU6LT0pCitlbHNlCitDQyAgICAgICAgID0gY2xhbmcK
K0NYWCAgICAgICAgPSBjbGFuZysrCitlbmRpZgogTERfTFRPICAgICA9ICQoQ1JPU1NfQ09NUElM
RSlsbHZtLWxkCiBlbHNlCiBDQyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWdjYwotLSAKMi43
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
