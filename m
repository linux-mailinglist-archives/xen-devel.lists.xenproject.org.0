Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49574C1F08
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1A-0007YY-JZ; Mon, 30 Sep 2019 10:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XJln=XZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iEt18-0007Wd-QO
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:58 +0000
X-Inumbo-ID: e9f8e0e6-e36d-11e9-bf31-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by localhost (Halon) with ESMTPS
 id e9f8e0e6-e36d-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:43 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 72so6605177lfh.6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/5QqhEY8sr/m2PCb6rugPypIrwPNA7528k9/4F6Nll0=;
 b=YpPu0Ept6hX/SanABqL+Wjp6F4mIPjDCBTKL+KjkYNheJMPJD3J9G1MmGvPDyP7f9i
 A5uZiHYw4YY4pY3M7QaKqXaLYujoCaw8zt2RgFotVt5sTD8BQiq6WXVa0scPItcACzYd
 FtraTQ/Oi3V2Fr0q7QhzhyiN5YIlgsDcMcwZcttyX+uV5bHUuy9qAEiwWu3q8iuUD/xA
 7OGjzQc9ETAUZLocJsvuXVYQC9FACCfQvqGGRNhhep6IUKQ8SYFJoaw1AnlQ8sFtoftv
 HZX+g8+bzM0GUTjOnSNbcJGK8416PrP9xpqu9CkCGaIdESufiSInb2fd7Ljbdh1h7hD0
 XjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/5QqhEY8sr/m2PCb6rugPypIrwPNA7528k9/4F6Nll0=;
 b=gt2PhJ6eo+gktdzrURKlXCt4PCs9OVROUAn9tucn8b3r8SU4SvuyUb4c+q8X23xZu5
 FKpE8KmLbTctwp0+KaDauJo5eKundC7w25HGk+vEi3FS9YAZnobkODLCeTVSCJcRX7eS
 O/8yhQsDmyQs18rvbxgsk1hcBSv+D+kzs9ARVQy61GVWYk8EEzb9fV11Iu6tP8XEdj7J
 cdNJ2TqYv9wnxTdTFn73tO/yxFmT82tGqQbu7D2j0yL79DrIKNcMy6BsEEAbFq2hLiK6
 mIYnh0TDTJju1NZsObk98CJTWAjV4tM0hLTaAKs2Anbgyb2ra9HsboSFJ8yA8noZAkdw
 LuKQ==
X-Gm-Message-State: APjAAAVR/7f2Dk3g09O6zjgBmrlsbpHk6ccYqRTkiPbFOHKu43L5TAhk
 zingiRw8ZAusknhJ4J85ZQtMsGQ34hg=
X-Google-Smtp-Source: APXvYqxksoLNwjSNYfursiplbWLNW70YYu50lNRYxOPBFlw0qszqtPTr+6xta7yI45Ao7d6mrDiURg==
X-Received: by 2002:ac2:4213:: with SMTP id y19mr10758001lfh.13.1569839682076; 
 Mon, 30 Sep 2019 03:34:42 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id e19sm3229223lja.8.2019.09.30.03.34.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 30 Sep 2019 03:34:41 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 13:34:31 +0300
Message-Id: <1569839671-772-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH for Xen 4.13] iommu/arm: Remove
 arch_iommu_populate_page_table() completely
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
Cc: jgross@suse.com, sstabellini@kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 paul.durrant@citrix.com, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhlIEFybSByZWFsaXphdGlvbiBzaG91bGQgaGF2ZSBiZWVuIHJlbW92ZWQgaW4gdGhlIGZv
bGxvd2luZyBjb21taXQKYXMgcmVkdW5kYW50OgpmODlmNTU1IHJlbW92ZSBsYXRlIChvbi1kZW1h
bmQpIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcwoKU28sIHJlbW92ZSB1bnVzZWQg
ZnVuY3Rpb24gY29tcGxldGVseS4KClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtv
IDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hcm0vaW9tbXUuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCmluZGV4IDc2ZTExNTIuLmRiM2IwN2Eg
MTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCkBAIC0xMzIsMTIgKzEzMiw2IEBAIHZv
aWQgYXJjaF9pb21tdV9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQogewogfQogCi1p
bnQgYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKHN0cnVjdCBkb21haW4gKmQpCi17Ci0g
ICAgLyogVGhlIElPTU1VIHNoYXJlcyB0aGUgcDJtIHdpdGggdGhlIENQVSAqLwotICAgIHJldHVy
biAtRU5PU1lTOwotfQotCiB2b2lkIF9faHdkb21faW5pdCBhcmNoX2lvbW11X2h3ZG9tX2luaXQo
c3RydWN0IGRvbWFpbiAqZCkKIHsKIH0KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
