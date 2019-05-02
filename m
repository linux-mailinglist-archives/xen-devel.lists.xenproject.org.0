Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EED120C5
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 19:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMF4U-0001yS-8A; Thu, 02 May 2019 17:00:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f+J5=TC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hMF4T-0001yN-7b
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 17:00:33 +0000
X-Inumbo-ID: cb3d624f-6cfb-11e9-843c-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb3d624f-6cfb-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 17:00:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e18so2855798lja.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BMAnGAfCvkLmVPxyl7nsvCURgiYXRkDKwKbSjg+5c+s=;
 b=c5Mf3mc+FE0Q0luNMZY23IvaEGH3e+WXyyZzJPfOJPMFd7TIo11/gDVSURMq5+h1Kp
 y1j/f3EBhkWEHRlE/iovRwAO7ky/pzgaB3TtkKzaFt3knr2MRTXQpu5q9WwZwoUQ1mvh
 O6WceyMkSGkRTMDg1Rc6+ZlQ+aZrB1pp4rLSFu/LPNHxGtDiubYKMWg9OwEVH4bmTpcq
 fx9YGEv5cxm0CwX6KpO5xg0QdXJVm+kMoFITqnIB8ZWI07cpbJ0cW6lES4D0b2yo9/Us
 KriQS0ylP6LxtvcDJIOW/OXxBwdk9fjd+r8F/fIbPTGfV0XdO3C7qYS9FkjTh7ddfAxF
 THIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BMAnGAfCvkLmVPxyl7nsvCURgiYXRkDKwKbSjg+5c+s=;
 b=GmSzmFl1Ne9p31MwquoY51R9QveRmCGDtsJ+fE61THcIsjjzlMt3pxYkLvR0Cs7rD9
 9Inw2P25ZXXxkdw5kq5J23BTcBmpCTgaRWQYRQ2pKBqKs45QeRYlgPJhQzEMOS09xXju
 zWerwQUKj+UfXhgjDcYL4Z3DMZcXnKX3FnA6+BR7wCIKf9fz8LOSIEMCue++fsaKVRnt
 K5FW32bVH330R5kU8cMZaxMvlj/a69YEjPbMcf/V+qirB4t+C6ik5+31rfL6ohb+4p3X
 zszB40fYi9ubpbSD+O5wDd1vSSlNVja2BKDoL6yyyPBPn72l5U5yLqeYBeA18FlNupw4
 psHQ==
X-Gm-Message-State: APjAAAXSjxt/zkiqZDEcM4gU5ckM0MgYHB9WiYLm/LjizXZPBNdwGFLG
 k3L351Owwv8y8vtPfRQwGnFIBdv2/Lw=
X-Google-Smtp-Source: APXvYqwvnjcfalAwVxc5tlsq2LnEHqEsr+4K7IFeyA/8OZdMqQwiA+51ouMd69emy2m/NJfiqGclSg==
X-Received: by 2002:a2e:89da:: with SMTP id c26mr2503006ljk.186.1556816430517; 
 Thu, 02 May 2019 10:00:30 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id k21sm2659652ljb.3.2019.05.02.10.00.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 02 May 2019 10:00:29 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 20:00:18 +0300
Message-Id: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH V5 0/4] Renesas Stout board support (R-Car Gen2)
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKSGksIGFsbC4KClRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRvIGFkZCBy
ZXF1aXJlZCBzdXBwb3J0IHRvIGJlIGFibGUgdG8gcnVuClhlbiBvbiBSZW5lc2FzIFN0b3V0IGJv
YXJkIFsxXSB3aGljaCB1c2VzIFNDSUZBIGNvbXBhdGlibGUgVUFSVCBhcyBhIGNvbnNvbGUKaW50
ZXJmYWNlLgoKQWN0dWFsbHkgWGVuIGFscmVhZHkgaGFzIHN1cHBvcnQgZm9yIFNDSUYgY29tcGF0
aWJsZSBVQVJUcyB3aGljaCBhcmUgdXNlZCBvbgpSZW5lc2FzIExhZ2VyIChSLUNhciBHZW4yKSwg
U2FsdmF0b3ItWCwgSDNVTENCL00zVUxDQiAoUi1DYXIgR2VuMykgYW5kIG90aGVyCmRldmVsb3Bt
ZW50IGJvYXJkcy4gU28gdGhpcyBwYXRjaCBzZXJpZXMgZXh0ZW5kcyBleGlzdGluZyBzdXBwb3J0
IHRvIGJlIGFibGUKdG8gaGFuZGxlIGJvdGggaW50ZXJmYWNlcy4KCi0tLS0tLS0tLS0KCkN1cnJl
bnQgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcgY29tbWl0IDFjNjUwNDE2
MzU5NWQ0NWU0N2EwMTc1MDMxOGMyYjdiNTA1NDFjYmUKYW5kIHRlc3RlZCBvbiBTdG91dCAoQVJN
MzIpIGFuZCBIM1VMQ0IgKEFSTTY0KSBib2FyZHMuCgpZb3UgY2FuIGZpbmQgY3VycmVudCBwYXRj
aCBzZXJpZXMgaGVyZToKcmVwbzogaHR0cHM6Ly9naXRodWIuY29tL290eXNoY2hlbmtvMS94ZW4u
Z2l0IGJyYW5jaDogc3RvdXRfdXBzdHJlYW0zCgpZb3UgY2FuIGZpbmQgcHJldmlvdXMgZGlzY3Vz
c2lvbnMgaGVyZToKW1YxXSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3hlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2cyMTA1OC5odG1sCltWMl0gaHR0cHM6Ly93d3cubWFpbC1h
cmNoaXZlLmNvbS94ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcvbXNnMzc1MTguaHRtbApb
VjNdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20veGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnL21zZzQyNDkzLmh0bWwKW1Y0XSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3hl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2c0MzMzMi5odG1sCgotLS0tLS0tLS0tCgpJ
biBvcmRlciB0byBydW4gWGVuIG9uIFN0b3V0IGJvYXJkIHlvdSBuZWVkICJQU0NJLWVuYWJsZWQi
IFUtQm9vdCAobm90IHVwc3RlYW1lZCB5ZXQpLgpZb3UgY2FuIGZpbmQgY29ycmVzcG9uZGluZyBw
YXRjaGVzIGZvciBVLUJvb3QgaGVyZToKaHR0cDovL3UtYm9vdC4xMDkxMi5uNy5uYWJibGUuY29t
L1BBVENILTAtMy1QU0NJLXN1cHBvcnQtZm9yLXI4YTc3OTAtU29DLUxhZ2VyLVN0b3V0LWJvYXJk
cy10ZDM1NzM1Mi5odG1sCgpIYXZlIGEgcGxhbiB0byB1cGRhdGUgWGVuIFdpa2kgcmVnYXJkaW5n
IHRoaXMgYm9hcmQuCgotLS0tLS0tLS0tCgpQbGVhc2Ugbm90ZSwgdGhhdCBmaXJzdCB0d28gcGF0
Y2hlcyBhbHJlYWR5IGhhdmUgSnVsaWVuJ3MgQS1iLCAKYW5kIHRoZSBmb2xsb3dpbmcgcGF0Y2gg
IltQQVRDSCBWNCAxLzVdIHhlbi9hcm06IENsYXJpZnkgdXNhZ2Ugb2YgZWFybHlwcmludGsgZm9y
IExhZ2VyIGJvYXJkIgp3YXMgcmVtb3ZlZCBmcm9tIHRoaXMgc2VyaWVzIChhcyBoYW5kbGVkIHNl
cGFyYXRlbHkpLgoKWzFdIGh0dHBzOi8vZWxpbnV4Lm9yZy9SLUNhci9Cb2FyZHMvU3RvdXQKCgpP
bGVrc2FuZHIgVHlzaGNoZW5rbyAoNCk6CiAgeGVuL2FybTogZHJpdmVyczogc2NpZjogRXh0ZW5k
IGRyaXZlciB0byBoYW5kbGUgb3RoZXIgaW50ZXJmYWNlcwogIHhlbi9hcm06IGRyaXZlcnM6IHNj
aWY6IEFkZCBzdXBwb3J0IGZvciBTQ0lGQSBjb21wYXRpYmxlIFVBUlRzCiAgeGVuL2FybTogRXh0
ZW5kIFNDSUYgZWFybHkgcHJpbmsgY29kZSB0byBoYW5kbGUgb3RoZXIgaW50ZXJmYWNlcwogIHhl
bi9hcm06IEFkZCBlYXJseSBwcmludGsgc3VwcG9ydCBmb3IgU0NJRkEgY29tcGF0aWJsZSBVQVJU
cwoKIGRvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCAgICB8ICAgNSArKwogeGVuL2FyY2gv
YXJtL1J1bGVzLm1rICAgICAgICAgICAgIHwgICA3ICsrCiB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVi
dWctc2NpZi5pbmMgfCAgMjIgKysrKystLQogeGVuL2RyaXZlcnMvY2hhci9zY2lmLXVhcnQuYyAg
ICAgIHwgMTMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiB4ZW4vaW5j
bHVkZS9hc20tYXJtL3NjaWYtdWFydC5oICAgfCAgNDQgKysrKysrKysrKystLQogNSBmaWxlcyBj
aGFuZ2VkLCAxNjEgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
