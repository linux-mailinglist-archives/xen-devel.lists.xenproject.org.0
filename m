Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB50FD8D7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 10:25:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVXnM-0003qZ-K8; Fri, 15 Nov 2019 09:21:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oWLJ=ZH=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1iVXnL-0003qU-2P
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 09:21:35 +0000
X-Inumbo-ID: 510a13e2-0789-11ea-984a-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 510a13e2-0789-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 09:21:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l1so8905210wme.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 01:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7bn7YokeAeXm5BBJ6T/lvBeGEKknPiOWxZqo9r4HuKg=;
 b=iPsLs/5cfYIlrdmZTkqsrS08Xzs+mb1WigGIc8UF9mWaopmOt67NMkE/lXX4F+eOoG
 sp3k+sinSMfKknbC2E/NHc0xpYuS/w/dMw/+BuJ86EZXz8bPRSoOq9QAXYjPCB1Yvifq
 U2y8J/LVbYpFVejCPFSt7NoNf07QSjEGvzgEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7bn7YokeAeXm5BBJ6T/lvBeGEKknPiOWxZqo9r4HuKg=;
 b=OhyONHAPnYeV8xb2ITBdcI0Ot7M6o+UZjA5qmwPvV1OGQTZ/NJYKlB7+jfsul5rwXg
 7tvvPI0Q7B936fk/UCV31NiOdT4tFya9euU4oBDGI01EJ4uB/UEVaEcTZcUljyUDkejz
 Q4flzJC3iXUutPccq6a8xMlLkgPyo80viRwc9i6huUinthQ+zXq9EmWzMFFJFCKneos+
 7EtTUVE85obuKqgvP5Irwoaak92U4dSpuy8KjACRiVsbu25ABUIZzqfTgnKYlYqWFSs2
 JimrnsHK11a7ZyGlwD8I7vYo7qutsNxRnaUBwvKG36l0yy0jjGFNLgdKMxgwUoMjGADO
 ZR0w==
X-Gm-Message-State: APjAAAVmf/mv1q2RPVO6PAWHvHyCet/etIs9ide1mSJXaS3cuad7/Ptn
 xnOJXQVXjk4y4YyxbozsdepYCg==
X-Google-Smtp-Source: APXvYqw5pA6Z4/To2HtwhxA8s+cQMEm12J+4VegYlzVpaDN9QcIFr5+3oidjgBd15trxx9d517+bhw==
X-Received: by 2002:a1c:62c5:: with SMTP id w188mr13020645wmb.77.1573809693584; 
 Fri, 15 Nov 2019 01:21:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 11sm8987506wmi.8.2019.11.15.01.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 01:21:32 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 15 Nov 2019 10:21:18 +0100
Message-Id: <20191115092120.4445-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/8] drm/xen: Simplify fb_create
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgY29kZSBpcyBhIHByZXR0eSBnb29kIHd0ZiBtb21lbnQsIHNpbmNlIHdlIGRy
b3AgdGhlCnJlZmVyZW5jZSBiZWZvcmUgd2UgdXNlIGl0LiBJdCdzIG5vdCBhIGJpZyBkZWFsLCBi
ZWNhdXNlIGEpIHdlIG9ubHkKdXNlIHRoZSBwb2ludGVyLCBzbyBkb2Vzbid0IGJsb3cgdXAgYW5k
IHRoZSByZWFsIHJlYXNvbiBiKSBmYi0+b2JqWzBdCmFscmVhZHkgaG9sZHMgYSBmdWxsIHJlZmVy
ZW5jZSBmb3IgdXMuCgpNaWdodCBhcyB3ZWxsIHRha2UgdGhlIHJlYWwgcG9pbnRlciBpbnMndCBv
ZiBjb21wbGljYXRlZCBnYW1lcyB0aGF0CmJhZmZsZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgpDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2tt
cy5jIHwgOSArLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKaW5kZXggZmY1
MDZiYzk5NDE0Li40ZjM0YzUyMDgxODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnRfa21zLmMKQEAgLTYzLDE0ICs2Myw3IEBAIGZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsCiAJaWYgKElTX0VSUl9PUl9OVUxMKGZiKSkKIAkJ
cmV0dXJuIGZiOwogCi0JZ2VtX29iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxwLCBtb2Rl
X2NtZC0+aGFuZGxlc1swXSk7Ci0JaWYgKCFnZW1fb2JqKSB7Ci0JCURSTV9FUlJPUigiRmFpbGVk
IHRvIGxvb2t1cCBHRU0gb2JqZWN0XG4iKTsKLQkJcmV0ID0gLUVOT0VOVDsKLQkJZ290byBmYWls
OwotCX0KLQotCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnZW1fb2JqKTsKKwlnZW1fb2Jq
ID0gZmItPm9ialswXTsKIAogCXJldCA9IHhlbl9kcm1fZnJvbnRfZmJfYXR0YWNoKGRybV9pbmZv
LT5mcm9udF9pbmZvLAogCQkJCSAgICAgIHhlbl9kcm1fZnJvbnRfZGJ1Zl90b19jb29raWUoZ2Vt
X29iaiksCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
