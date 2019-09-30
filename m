Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEAC1D8F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 10:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iErUQ-0005e5-CV; Mon, 30 Sep 2019 08:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Su8=XZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1iErUP-0005e0-I1
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:57:05 +0000
X-Inumbo-ID: 45f2fdb8-e360-11e9-97fb-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by localhost (Halon) with ESMTPS
 id 45f2fdb8-e360-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 08:57:04 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u28so6403170lfc.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJhR9shCbg1S69w3pewECrb4kAgDlG+scodquxO8tjE=;
 b=Kqc8TKn73INKRSIoytoZjL5KBmhxE3s7z0xU+JfEr1CvjSTc7IJ/DteQUn0Kpyvabr
 tozsxkbOdCKZZSFM2VOMpuA0VTOsEnO6LFzXvcxQX1/A4M4+6u8jF5gCNOCmNNBbjZLG
 LYP53Tbqz+ju24FlNqJM//CZwXZ9rpMT1Wy7BzAF8mK+DeVXckTHGBF9uzlCFhq1NPYH
 TZMFG2LCXt+XnwSPmuP/nj3P7bcLWzXMHaNGfcGa1sGPwGpTfvxcmrkZsi0dbSYTD1Tj
 T1GTzPGbr058zTuN40MnDSuO057TvL70tAX5GmnQ67+MOfwk7N7bHFulleqf87WDUZhZ
 CTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJhR9shCbg1S69w3pewECrb4kAgDlG+scodquxO8tjE=;
 b=Sh+0Xip/4eRkAvw3D47nSorycO72kg7Hyu8Y3O9QdwA4m3Xh+gqROZAqaXyuoLbTqj
 8YTUCJPEJvbTjYP/KG5TEyNsop6NjhZXtBZx4CWWcdyLdBv6+qYhv+HIpkszJWFfU3Cl
 9CqrL6BUMs7kGwnZJJ/rF+XB+5mxqbqKsPvDhSSi5BA3E4wN6W3qTGyczn/L2HlBrGEc
 CgYiSLw1ytWvJmL/3MtiA8fvlB3voHT8EAnyW668b7FIEgK0svAgQfoxfWanORL1fzKH
 O5eBn4nOK89roBdPpZEN2fXljk3rJgPrfTJ4ELu+UAVvHREG2G8zulPtGqootveeMjme
 69EA==
X-Gm-Message-State: APjAAAX4OuvYR5IFK7iP61Vdvkba9JaEDOltkub2kg7ftBjKIj0a14Pg
 GInjkj2Go0GNLy+xGZtr+zs=
X-Google-Smtp-Source: APXvYqwygniVGwBzmus2QcYatM0akXU2k70oqSr8PXa65eCbApb3TA5SK4Ul/kaL+Suh1WS5aaxjfg==
X-Received: by 2002:ac2:491a:: with SMTP id n26mr10956836lfi.182.1569833823549; 
 Mon, 30 Sep 2019 01:57:03 -0700 (PDT)
Received: from a2k-HP-ProDesk-600-G2-SFF.kyiv.epam.com
 (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id t3sm3059407lfd.92.2019.09.30.01.57.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 30 Sep 2019 01:57:02 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: andrew.cooper3@citrix.com, George.Dunlap@eu.citrix.com,
 ian.jackson@eu.citrix.com, jbeulich@suse.com, julien.grall@arm.com,
 konrad.wilk@oracle.com, sstabellini@kernel.org, wei.liu2@citrix.com,
 xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 11:56:59 +0300
Message-Id: <20190930085659.708-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] SUPPORT.md: Add PV display/sound,
 update keyboard
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgotLS0KIFNVUFBPUlQubWQgfCAxNSArKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQKaW5kZXggMzc1NDczYTQ1NjQwLi5i
NTM2Y2YwODE0ZjMgMTAwNjQ0Ci0tLSBhL1NVUFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApAQCAt
MzcyLDYgKzM3MiwxMiBAQCBHdWVzdC1zaWRlIGRyaXZlciBjYXBhYmxlIG9mIHNwZWFraW5nIHRo
ZSBYZW4gUFYgRnJhbWVidWZmZXIgcHJvdG9jb2wKIAogICAgIFN0YXR1cywgTGludXggKHhlbi1m
YmZyb250KTogU3VwcG9ydGVkCiAKKyMjIyBQViBkaXNwbGF5IChmcm9udGVuZCkKKworR3Vlc3Qt
c2lkZSBkcml2ZXIgY2FwYWJsZSBvZiBzcGVha2luZyB0aGUgWGVuIFBWIGRpc3BsYXkgcHJvdG9j
b2wKKworICAgIFN0YXR1cywgTGludXg6IFN1cHBvcnRlZAorCiAjIyMgUFYgQ29uc29sZSAoZnJv
bnRlbmQpCiAKIEd1ZXN0LXNpZGUgZHJpdmVyIGNhcGFibGUgb2Ygc3BlYWtpbmcgdGhlIFhlbiBQ
ViBjb25zb2xlIHByb3RvY29sCkBAIC0zODQsNyArMzkwLDggQEAgR3Vlc3Qtc2lkZSBkcml2ZXIg
Y2FwYWJsZSBvZiBzcGVha2luZyB0aGUgWGVuIFBWIGNvbnNvbGUgcHJvdG9jb2wKICMjIyBQViBr
ZXlib2FyZCAoZnJvbnRlbmQpCiAKIEd1ZXN0LXNpZGUgZHJpdmVyIGNhcGFibGUgb2Ygc3BlYWtp
bmcgdGhlIFhlbiBQViBrZXlib2FyZCBwcm90b2NvbC4KLU5vdGUgdGhhdCB0aGUgImtleWJvYXJk
IHByb3RvY29sIiBpbmNsdWRlcyBtb3VzZSAvIHBvaW50ZXIgc3VwcG9ydCBhcyB3ZWxsLgorTm90
ZSB0aGF0IHRoZSAia2V5Ym9hcmQgcHJvdG9jb2wiIGluY2x1ZGVzIG1vdXNlIC8gcG9pbnRlciAv
CittdWx0aS10b3VjaCBzdXBwb3J0IGFzIHdlbGwuCiAKICAgICBTdGF0dXMsIExpbnV4ICh4ZW4t
a2JkZnJvbnQpOiBTdXBwb3J0ZWQKIApAQCAtNDE3LDYgKzQyNCwxMiBAQCBHdWVzdC1zaWRlIGRy
aXZlciBjYXBhYmxlIG9mIG1ha2luZyBwdiBzeXN0ZW0gY2FsbHMKIAogICAgIFN0YXR1cywgTGlu
dXg6IFRlY2ggUHJldmlldwogCisjIyMgUFYgc291bmQgKGZyb250ZW5kKQorCitHdWVzdC1zaWRl
IGRyaXZlciBjYXBhYmxlIG9mIHNwZWFraW5nIHRoZSBYZW4gUFYgc291bmQgcHJvdG9jb2wKKwor
ICAgIFN0YXR1cywgTGludXg6IFN1cHBvcnRlZAorCiAjIyBWaXJ0dWFsIGRldmljZSBzdXBwb3J0
LCBob3N0IHNpZGUKIAogRm9yIGhvc3Qtc2lkZSB2aXJ0dWFsIGRldmljZSBzdXBwb3J0LAotLSAK
Mi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
