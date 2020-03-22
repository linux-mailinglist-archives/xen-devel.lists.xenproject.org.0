Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9018EA23
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:16:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3Fb-0004tZ-43; Sun, 22 Mar 2020 16:14:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3FZ-0004rK-89
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:57 +0000
X-Inumbo-ID: 38c696b4-6c58-11ea-8134-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38c696b4-6c58-11ea-8134-12813bfff9fa;
 Sun, 22 Mar 2020 16:14:35 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id w26so7148397edu.7
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iAgcocLWJa/thTf8SxekVYdlKQsuyCse0uToobp5LkM=;
 b=ZlSMfy0JI9jNDjfv8XbrIm8Ujbp/XNpyDis9qA/9sItD6tsK491Hi0AaZoZof+eTSv
 ZVookV5cCnBggW+3nNMI1Ru7Xe/OdlgkbFhyBh3X+zl1PvNButN3oybZM15LTaq426q2
 vzfCqhgPNbY/DryPeQrlCThp6/Djd0g6Hq77LLpqLG9ABpFJVK/Y7rPEfrMng8o5Rupa
 WhBpWunxjzggXXETHK+tgIO+JJupQHKZNsPvKxftftajPVahpoiEmYgnbPd0NV39IUj7
 0JyQ0gBI9B9icaiaz0vd+f0EcArCuaBZ5n48OHYfLJR/YXu+9VxI/QfVZsGPQTA7llea
 LZSA==
X-Gm-Message-State: ANhLgQ1KYRWooMMBl42nHxink+hf3rVYNU5yT4EeboKvwhc/Z0CNiHxQ
 cdWUYHNUYVB2YjPEFiAFzoAHEXMN3jV/jQ==
X-Google-Smtp-Source: ADFU+vtexKJQoP1o5dsMumo0E9vKS9kBg35/4qaOwxPd5C8lvf5cAFaKMC9T3UyBSG9Qp5xI6aIfiQ==
X-Received: by 2002:a17:906:2455:: with SMTP id
 a21mr16168678ejb.11.1584893674710; 
 Sun, 22 Mar 2020 09:14:34 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:34 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:11 +0000
Message-Id: <20200322161418.31606-11-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 10/17] xen/x86: pv: Use maddr_to_mfn(...)
 instead of the open-coding version
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCl9tZm4oYWRkciA+PiBQQUdF
X1NISUZUKSBpcyBlcXVpdmFsZW50IHRvIG1hZGRyX3RvX21mbihhZGRyKS4KClNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2
L2dyYW50X3RhYmxlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2dyYW50X3RhYmxl
LmMgYi94ZW4vYXJjaC94ODYvcHYvZ3JhbnRfdGFibGUuYwppbmRleCAwMzI1NjE4Yzk4Li5mODBl
MjMzNjIxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvZ3JhbnRfdGFibGUuYworKysgYi94
ZW4vYXJjaC94ODYvcHYvZ3JhbnRfdGFibGUuYwpAQCAtNzIsNyArNzIsNyBAQCBpbnQgY3JlYXRl
X2dyYW50X3B2X21hcHBpbmcodWludDY0X3QgYWRkciwgbWZuX3QgZnJhbWUsCiAgICAgICAgICAg
ICBnb3RvIG91dDsKICAgICAgICAgfQogCi0gICAgICAgIGdsMW1mbiA9IF9tZm4oYWRkciA+PiBQ
QUdFX1NISUZUKTsKKyAgICAgICAgZ2wxbWZuID0gbWFkZHJfdG9fbWZuKGFkZHIpOwogCiAgICAg
ICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX21mbihnbDFtZm4sIGN1cnJkKTsKICAgICAgICAgaWYg
KCAhcGFnZSApCkBAIC0yMjgsNyArMjI4LDcgQEAgaW50IHJlcGxhY2VfZ3JhbnRfcHZfbWFwcGlu
Zyh1aW50NjRfdCBhZGRyLCBtZm5fdCBmcmFtZSwKICAgICAgICAgICAgIGdvdG8gb3V0OwogICAg
ICAgICB9CiAKLSAgICAgICAgZ2wxbWZuID0gX21mbihhZGRyID4+IFBBR0VfU0hJRlQpOworICAg
ICAgICBnbDFtZm4gPSBtYWRkcl90b19tZm4oYWRkcik7CiAKICAgICAgICAgcGFnZSA9IGdldF9w
YWdlX2Zyb21fbWZuKGdsMW1mbiwgY3VycmQpOwogICAgICAgICBpZiAoICFwYWdlICkKLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
