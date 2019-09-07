Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD8AC98F
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 23:45:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6iSV-0007TC-Rx; Sat, 07 Sep 2019 21:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PlyV=XC=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i6iSU-0007T3-0h
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2019 21:41:26 +0000
X-Inumbo-ID: 3da1293c-d1b8-11e9-978d-bc764e2007e4
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3da1293c-d1b8-11e9-978d-bc764e2007e4;
 Sat, 07 Sep 2019 21:41:25 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 4so5469274pgm.12
 for <xen-devel@lists.xenproject.org>; Sat, 07 Sep 2019 14:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=Zj674LUoNkKvSpexmegA5PsZaKcGFKG4/kThw6ZXlmw=;
 b=Ujox5d061GkoJp1y4gs3/uinU01AK46f9UdarPx27G2y1doaNX1SE5I+pgGob0a5xq
 D7naagu+P+UhLSm36uYT2/ZbPOVD/+lYyDb62ieH655Wfp1Twoitw1+DetYB6tJoYZV7
 mAPa5PZfA5MTIzejdGl0ftr1u6aapyu99pEq4yrW30hF6rh0oBUjUsVaWDhokWEfSmEy
 YHkz/g2ZSRovh5Hz45kJJynuABEvmOrcI9AmcO/Pzqhro3NT3c7vO5cgFaH4d4Hk15Px
 KAy/zaOFRAsiJiQ2Iqpeigz8cpiyCt5vtvHH12MLqnzlhnDJ87YKjN09D3C9lwP5wCTo
 0mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=Zj674LUoNkKvSpexmegA5PsZaKcGFKG4/kThw6ZXlmw=;
 b=j8jvqlBSi8O4xkjzuWEp3rkcaIvvSkDrsixNXFIZDiFoy2H7kcZ8eQtw/jKeTdud5C
 nd7qPf/65SdlJAMTqf83YboLrrtmGPJtUv7LhF+S9RiGYcsDYDHzPXFaIx9nuGsOvwdj
 RUoKfO/FUTbseurPvbBQoFN6chRURwkHVuooAGZ1pnVzGezjui0p2EFJZk6c93GS8wKD
 qy1YCASs5B74lDbNsDbdi7CrKPD5iqtdGDAVwyV4d+ZkogSJA+DxV6wScVDMXTT/TBzL
 mcuZ/RDMZkgHHxOyAspE++IStdV5lp6TtVAIJQ8UjvJdliZ963B4aMFLsmeyzLYODlT1
 Jcjw==
X-Gm-Message-State: APjAAAWPfVi1c6GnJEUe+fjIYggXI2I+wQtZmg46g7cx+DS6pL/YkwXR
 4VpUkDlwZ/1D0j/Pdy/WpBg=
X-Google-Smtp-Source: APXvYqxfWkn27m4YwwErHi0RMDLqVgW7yc2OyNzSnRttW+TV1ma82at8a0X804W7PsbzNHRM+aaXvw==
X-Received: by 2002:a65:430b:: with SMTP id j11mr14111649pgq.383.1567892484556; 
 Sat, 07 Sep 2019 14:41:24 -0700 (PDT)
Received: from localhost.localdomain ([112.79.80.177])
 by smtp.gmail.com with ESMTPSA id h11sm9078516pgv.5.2019.09.07.14.41.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 07 Sep 2019 14:41:23 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 sashal@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, akpm@linux-foundation.org, david@redhat.com,
 osalvador@suse.com, mhocko@suse.com, pasha.tatashin@soleen.com,
 dan.j.williams@intel.com, richard.weiyang@gmail.com, cai@lca.pw
Date: Sun,  8 Sep 2019 03:17:02 +0530
Message-Id: <8e1bc9d3b492f6bde16e95ebc1dee11d6aefabd7.1567889743.git.jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
Subject: [Xen-devel] [PATCH 1/3] hv_ballon: Avoid calling dummy function
 __online_page_set_limits()
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, xen-devel@lists.xenproject.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

X19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKCkgaXMgYSBkdW1teSBmdW5jdGlvbiBhbmQgYW4gZXh0
cmEgY2FsbAp0byB0aGlzIGZ1bmN0aW9uIGNhbiBiZSBhdm9pZGVkLgoKU2lnbmVkLW9mZi1ieTog
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9odi9o
dl9iYWxsb29uLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9odi9odl9iYWxsb29uLmMgYi9kcml2ZXJzL2h2L2h2X2JhbGxvb24uYwpp
bmRleCA2ZmI0ZWE1Li45YmFiNDQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2h2L2h2X2JhbGxvb24u
YworKysgYi9kcml2ZXJzL2h2L2h2X2JhbGxvb24uYwpAQCAtNjgwLDcgKzY4MCw2IEBAIHN0YXRp
YyB2b2lkIGh2X3BhZ2Vfb25saW5lX29uZShzdHJ1Y3QgaHZfaG90YWRkX3N0YXRlICpoYXMsIHN0
cnVjdCBwYWdlICpwZykKIAkJX19DbGVhclBhZ2VPZmZsaW5lKHBnKTsKIAogCS8qIFRoaXMgZnJh
bWUgaXMgY3VycmVudGx5IGJhY2tlZDsgb25saW5lIHRoZSBwYWdlLiAqLwotCV9fb25saW5lX3Bh
Z2Vfc2V0X2xpbWl0cyhwZyk7CiAJX19vbmxpbmVfcGFnZV9pbmNyZW1lbnRfY291bnRlcnMocGcp
OwogCV9fb25saW5lX3BhZ2VfZnJlZShwZyk7CiAKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
