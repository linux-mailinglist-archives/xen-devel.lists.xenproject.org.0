Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E59D7EB30
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxb-0005tz-Ts; Fri, 02 Aug 2019 04:14:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBa-00079W-1G
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:50 +0000
X-Inumbo-ID: 23f9dec6-b4cc-11e9-8980-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23f9dec6-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:48 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i18so35237270pgl.11
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=R1dyNzOze/eqllrUqxRpjhDn38RC7VsduB92QlfhFLYwuwka43d0Yt9myEGcw6WlZm
 fYIT193clb3cCKkKRa4gQjk01O64tt0BXAAw6nkursyUCEWzk96M/WL6vzziPZU6IL+r
 rvITeJdAvAjJK8q/L91CFM+eVayVF1xEXzXBIhRNt9HdhEGbz9zWiE6QknGvjT5Q+PbG
 0FUQwvdG6OLHf8hS8zvFCr0JHd7YtbTEpJO3//HXWtUvFA/ZCzXGA0y95q3Jed0ZzVaE
 Qk7ZxouFXvlN6jsSJv67cehYgfxqrCWaOQlJqOD886yacjrOWwt50AkY8+51bO/ECErB
 IQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=rufObBNvFkXKD2ZuZ3l/shIUsBglgCNzhJNMYY008cASzEs1eE9NStabWKc0JsWu1+
 ZvQDmqSh9GstehwVLUANOx6sz50oa1wxHNCq68OOAzvBLTiLI+nMweAzUGxkCjSzi+By
 5SzEZKza8W1UEuVOB/e7HfG12VdAM+j1mhGTQAnbUjpSl6aVfgBkZsS0CzgiHzelWNhE
 ajJo2ud8407fIAlhynXycsiAJF8FmBk7bAnYGe4/eUT/FcpBZDKrnZkQXFdMSF2XLXsB
 Y57mKP/ut1xYBmmiczRAN90Vg0LwZOelv6yD0x/R36mUdeDDQQdVrjHdkDuaJVLyZw+d
 nihQ==
X-Gm-Message-State: APjAAAUinkLKU0sNkqvueUxeKibytr1rck2eRpbVT2+EcdUcjuhP628v
 PS93ZcQik8RzT1W7YIa/vvw=
X-Google-Smtp-Source: APXvYqxwmSe9JrA8Nqe8Cu6LF/8yd68XYfT17/pT9PHXIhg3Pa3JuYgXApqhYkPrHPsf3+6NRlbhyg==
X-Received: by 2002:a17:90a:601:: with SMTP id j1mr1872789pjj.96.1564712447882; 
 Thu, 01 Aug 2019 19:20:47 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:47 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:54 -0700
Message-Id: <20190802022005.5117-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 23/34] uprobes: convert put_page() to
 put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogUGV0ZXIg
WmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJl
ZGhhdC5jb20+CkNjOiBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gPGFjbWVAa2VybmVsLm9yZz4K
Q2M6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNv
bT4KQ2M6IEppcmkgT2xzYSA8am9sc2FAcmVkaGF0LmNvbT4KQ2M6IE5hbWh5dW5nIEtpbSA8bmFt
aHl1bmdAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGtlcm5lbC9ldmVudHMvdXByb2Jlcy5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
a2VybmVsL2V2ZW50cy91cHJvYmVzLmMgYi9rZXJuZWwvZXZlbnRzL3Vwcm9iZXMuYwppbmRleCA4
NGZhMDA0OTdjNDkuLjRhNTc1ZGU4Y2VjOCAxMDA2NDQKLS0tIGEva2VybmVsL2V2ZW50cy91cHJv
YmVzLmMKKysrIGIva2VybmVsL2V2ZW50cy91cHJvYmVzLmMKQEAgLTM5Nyw3ICszOTcsNyBAQCBf
X3VwZGF0ZV9yZWZfY3RyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRy
LCBzaG9ydCBkKQogCXJldCA9IDA7CiBvdXQ6CiAJa3VubWFwX2F0b21pYyhrYWRkcik7Ci0JcHV0
X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAlyZXR1cm4gcmV0OwogfQogCkBA
IC01MDQsNyArNTA0LDcgQEAgaW50IHVwcm9iZV93cml0ZV9vcGNvZGUoc3RydWN0IGFyY2hfdXBy
b2JlICphdXByb2JlLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlyZXQgPSBfX3JlcGxhY2VfcGFn
ZSh2bWEsIHZhZGRyLCBvbGRfcGFnZSwgbmV3X3BhZ2UpOwogCXB1dF9wYWdlKG5ld19wYWdlKTsK
IHB1dF9vbGQ6Ci0JcHV0X3BhZ2Uob2xkX3BhZ2UpOworCXB1dF91c2VyX3BhZ2Uob2xkX3BhZ2Up
OwogCiAJaWYgKHVubGlrZWx5KHJldCA9PSAtRUFHQUlOKSkKIAkJZ290byByZXRyeTsKQEAgLTE5
ODEsNyArMTk4MSw3IEBAIHN0YXRpYyBpbnQgaXNfdHJhcF9hdF9hZGRyKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyKQogCQlyZXR1cm4gcmVzdWx0OwogCiAJY29weV9m
cm9tX3BhZ2UocGFnZSwgdmFkZHIsICZvcGNvZGUsIFVQUk9CRV9TV0JQX0lOU05fU0laRSk7Ci0J
cHV0X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKICBvdXQ6CiAJLyogVGhpcyBu
ZWVkcyB0byByZXR1cm4gdHJ1ZSBmb3IgYW55IHZhcmlhbnQgb2YgdGhlIHRyYXAgaW5zbiAqLwog
CXJldHVybiBpc190cmFwX2luc24oJm9wY29kZSk7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
