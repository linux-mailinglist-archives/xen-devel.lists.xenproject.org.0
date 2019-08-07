Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D487683FE8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvApv-0000Or-Kl; Wed, 07 Aug 2019 01:33:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvApu-0000OY-6L
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:33:54 +0000
X-Inumbo-ID: 69eecfa3-b8b3-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69eecfa3-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:33:53 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id w24so38588537plp.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGaquJbd5n3vWHVjzVcVo6+uSZsjc3dg9cLGAnxVc2E=;
 b=D48he9iwy4Ni5qMxjRsQe5pMA51Ifn5pyuXezWFqJsv4KqB2UjEmI492A+H3zjBozl
 z4vxBXelaWALb4vc9TiVQD3xffg2JpycIgMryRj7DdNlQnLoLTJRT2Pr6AqdUldNm96s
 mYxTY6jOTBKy5nq3H5sJhLnHjju1CLRU8H+bKZdHFr7DowwoqkFP2M9FXdH0qDJ2nJJ/
 ss8voK0KQx4e801oBm16bmWlzeZbPR02TnPcDNJm+WHvvx9pL8SRfhdK+3B1hDFHty8B
 eCloTAbKTVyukUiotzfMnjDTWGmB31ermFBDzmeDTGPpsb9KGnZpeSIajIf3hrjzGw2F
 MknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGaquJbd5n3vWHVjzVcVo6+uSZsjc3dg9cLGAnxVc2E=;
 b=tSriBTe9Ln81qXcynjOJe9dhXze3zONiLC2ddqx1KOvS4LBz/929MIEenXDNlhDU57
 4apJ2qMwUZUYa1KTKXIH1Ryj7BKn65n5kElEm+atNavFfj4GIvKPPlo7fJbLb45GPoSz
 6dudN4uvMPH91gLqcWLYGmRTZ2PDkqnJhewZIHBlMtQnVA/dfidWmtngBw5m4WD3ul3n
 nnC33TvTQIlOJIjfvi/YgRBXr0Ph9tH3KESyvH91KAX6Q0mjlQSZ3+f2bOx5t3f5SyAn
 mgebZJeHim8lJzUbkP1QyptPwbWwWxIiSe9Y09h3QzLj8VZT/MxqMRgslGngUWsuTlF4
 NJ3g==
X-Gm-Message-State: APjAAAWY2Fe6r0k2uXk0Ru3/wjzDqdzQPIPKUCbKpX2vExcF9ej8kil6
 P6NSKe+RYNncwZVlyUAwSv0=
X-Google-Smtp-Source: APXvYqyUH791dwLub9+aSF5x8hGs1SuLVkdyMKqfaB808Vqluqgizufg0qdY3/pJKJrf/LUH7OWf8Q==
X-Received: by 2002:a17:902:29e6:: with SMTP id
 h93mr5591074plb.297.1565141632504; 
 Tue, 06 Aug 2019 18:33:52 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:52 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:04 -0700
Message-Id: <20190807013340.9706-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 05/41] net/ceph: convert put_page() to
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
 rds-devel@oss.oracle.com, Sage Weil <sage@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBY2tlZC1ieTog
SmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCkNjOiBJbHlhIERyeW9tb3YgPGlkcnlv
bW92QGdtYWlsLmNvbT4KQ2M6IFNhZ2UgV2VpbCA8c2FnZUByZWRoYXQuY29tPgpDYzogRGF2aWQg
Uy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDYzogY2VwaC1kZXZlbEB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIG5ldC9jZXBoL3BhZ2V2ZWMuYyB8IDggKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9uZXQvY2VwaC9wYWdldmVjLmMgYi9uZXQvY2VwaC9wYWdldmVjLmMKaW5kZXgg
NjQzMDVlNzA1NmExLi5jODhmZmYyYWI5YmQgMTAwNjQ0Ci0tLSBhL25ldC9jZXBoL3BhZ2V2ZWMu
YworKysgYi9uZXQvY2VwaC9wYWdldmVjLmMKQEAgLTEyLDEzICsxMiw3IEBACiAKIHZvaWQgY2Vw
aF9wdXRfcGFnZV92ZWN0b3Ioc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IG51bV9wYWdlcywgYm9v
bCBkaXJ0eSkKIHsKLQlpbnQgaTsKLQotCWZvciAoaSA9IDA7IGkgPCBudW1fcGFnZXM7IGkrKykg
ewotCQlpZiAoZGlydHkpCi0JCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2VzW2ldKTsKLQkJcHV0
X3BhZ2UocGFnZXNbaV0pOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2VzLCBu
dW1fcGFnZXMsIGRpcnR5KTsKIAlrdmZyZWUocGFnZXMpOwogfQogRVhQT1JUX1NZTUJPTChjZXBo
X3B1dF9wYWdlX3ZlY3Rvcik7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
