Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984EA6C18B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 21:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnpgf-0000I6-VI; Wed, 17 Jul 2019 19:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K8rP=VO=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hnpge-0000HY-S5
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 19:34:00 +0000
X-Inumbo-ID: d1b9fad0-a8c9-11e9-b1fa-239cefdce2bf
Received: from mail-io1-f46.google.com (unknown [209.85.166.46])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1b9fad0-a8c9-11e9-b1fa-239cefdce2bf;
 Wed, 17 Jul 2019 19:33:57 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k20so47594915ios.10
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2019 12:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QETwMaZ1/fKFNeTqiJ8Ul71lh14Z/VE7ZvRMcOw3JcI=;
 b=S68CrYm4zRlMrgSGQSukOdusbX3mHSqXCiufgoZfUoeTchRwkJ3lJlCVltIC2lzoFf
 y4Ic8TAtvfwvV5pIyBYJR7YlwMg7PvRL6hgcx2GjVDooyCUwF0pLqvdWDOntPkJx0B8z
 4gKXloa+6VMYurG/XCGAbldfd78G2iiwiwk3cqSar1q5mRAwAB9Wt+BtTSnzDkYNuvMA
 zgwq+4Z6zhVwacFkVCuoHNE+1LgypqlIURNJS0tzWXHbm6kDpxROquwr+B15w/dP6vhb
 mYaLoUXsDNuGdczn4fQqQHehpvHJolnWOl6XwuUQZa3B25r5IkuL7k43x4lLYcz6eHcj
 iRjw==
X-Gm-Message-State: APjAAAUf7YvhYMz1UodXHQFhMHLV83HQtUrNI3kIjsEUSrhXsLdyhXEu
 O940s65i6OZ8T3v92Iv8AWcxV93E
X-Google-Smtp-Source: APXvYqzjVjorbwpqQfSra1qhunjoOrVEu+JGhAndJEAN19qgBuyUhs219TP6oJ81kLqgltJH7XQtJA==
X-Received: by 2002:a5d:885a:: with SMTP id t26mr33729373ios.218.1563392036708; 
 Wed, 17 Jul 2019 12:33:56 -0700 (PDT)
Received: from l1.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id v13sm21743421ioq.13.2019.07.17.12.33.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 12:33:56 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Jul 2019 13:33:33 -0600
Message-Id: <20190717193335.11991-4-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717193335.11991-1-tamas@tklengyel.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 3/5] x86/mem_sharing: enable mem_share audit
 mode only in debug builds
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW1wcm92ZXMgcGVyZm9ybWFuY2UgZm9yIHJlbGVhc2UgYnVpbGRzLgoKU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KdjY6IHBhdGNoIHBpbmcKLS0tCiB4ZW4vaW5j
bHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5n
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKaW5kZXggOWY5ZjdlOTNlMy4u
YWZkMGMxNzI5MiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaApAQCAtMjUsNyArMjUsMTEg
QEAKICNpbmNsdWRlIDxwdWJsaWMvbWVtb3J5Lmg+CiAKIC8qIEF1ZGl0aW5nIG9mIG1lbW9yeSBz
aGFyaW5nIGNvZGU/ICovCisjaWZuZGVmIE5ERUJVRwogI2RlZmluZSBNRU1fU0hBUklOR19BVURJ
VCAxCisjZWxzZQorI2RlZmluZSBNRU1fU0hBUklOR19BVURJVCAwCisjZW5kaWYKIAogdHlwZWRl
ZiB1aW50NjRfdCBzaHJfaGFuZGxlX3Q7IAogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
