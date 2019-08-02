Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501347EB38
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxX-0005r3-MQ; Fri, 02 Aug 2019 04:14:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBC-00075A-Sb
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:26 +0000
X-Inumbo-ID: 16c0fa5b-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16c0fa5b-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:26 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay6so33057816plb.9
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vxuyadJL7U7uLaLdbmi0wM48++CcjfxvCZKqh2vh4A=;
 b=IPnKJ+t+ZuscR+9jkZCr9SYsDod9H1pKxsH7GEiMUhOWm9vGlL+eTdFKhv7CAbJqfW
 uU/KQltFOReuOI2Tb15OkXQ52DWMqedLb39cjCQmyiEWLJR87wjugh79Hhbg0qc6zuHg
 MYJzaAbjIW3STqDPj5Lq2JXvJEE6XELaroV158AptkQMUJ7o1/IZqEXjs4JGgfMi9wWi
 x8L4AJBxrRgeZMqNQthxmzZvgld8OAsmXF7S7qthmuL3HABTVNmwDglQdeK4bcdDS+le
 GYNA0EDvk+skaAjBLW5tt19+LuDGuf6feAdMRYQaTc3LrWG+I4hPzx8Lwm1aQRwe4UW2
 hk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vxuyadJL7U7uLaLdbmi0wM48++CcjfxvCZKqh2vh4A=;
 b=PnbxQcV/RXNSx+vZyDLz3EERPGuXkZ8xOsIU91wqz+PsniGF/hUpEYyK117ISxYNOu
 FAInNks8pY2woektfPAnq0wevTgosDokAWdVUxixo0HYwQp8R2Z6AeDYMhmqf0WaQXgF
 gZmCsTQHMx555mmT6hty8vP8whdl+ZUhdRMVHrX0lghCuqWMI7nTZs4uikigSVdsdFgv
 srr3/+7TMW8vlqc1PtogSTRwiXedsi6KyeDUCTpEjj/ErxItaNYvMsHeCZCu3DLkRnPO
 3DxtFx1oRe2bWL3EgaP3pw5Z+LVwkkfGJ0Os3k9FRApLlVhoASQgRjq2vWOa8AhoOOzc
 RAsQ==
X-Gm-Message-State: APjAAAWRzMblzZVXjmljX7wTIVEu6S+D5VHXdf86BUMUlwE/YSb12Spv
 nsdMyn713wfj29oziTXVBnw=
X-Google-Smtp-Source: APXvYqx4n4e9g9/ly0KjHqDWX94uIzBzDxMQOC1nP9LzDlFTNiWIDkQ4j/aY6KUtiphGoFtrA+EDzw==
X-Received: by 2002:a17:902:f301:: with SMTP id
 gb1mr126844849plb.292.1564712425718; 
 Thu, 01 Aug 2019 19:20:25 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:25 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:40 -0700
Message-Id: <20190802022005.5117-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 09/34] media/v4l2-core/mm: convert put_page() to
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Hans Verkuil <hans.verkuil@cisco.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogTWF1cm8g
Q2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+CkNjOiBLZWVzIENvb2sgPGtlZXNj
b29rQGNocm9taXVtLm9yZz4KQ2M6IEhhbnMgVmVya3VpbCA8aGFucy52ZXJrdWlsQGNpc2NvLmNv
bT4KQ2M6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4KQ2M6IEph
biBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPgpDYzogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+CkNjOiBEYW4g
V2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5j
b20+Ci0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jIGIvZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKaW5kZXggNjZhNmM2YzIzNmE3Li5k
NmVlYjQzN2VjMTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVm
LWRtYS1zZy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5j
CkBAIC0zNDksOCArMzQ5LDcgQEAgaW50IHZpZGVvYnVmX2RtYV9mcmVlKHN0cnVjdCB2aWRlb2J1
Zl9kbWFidWYgKmRtYSkKIAlCVUdfT04oZG1hLT5zZ2xlbik7CiAKIAlpZiAoZG1hLT5wYWdlcykg
ewotCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5ucl9wYWdlczsgaSsrKQotCQkJcHV0X3BhZ2UoZG1h
LT5wYWdlc1tpXSk7CisJCXB1dF91c2VyX3BhZ2VzKGRtYS0+cGFnZXMsIGRtYS0+bnJfcGFnZXMp
OwogCQlrZnJlZShkbWEtPnBhZ2VzKTsKIAkJZG1hLT5wYWdlcyA9IE5VTEw7CiAJfQotLSAKMi4y
Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
