Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94B80DFD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPK6-0003tH-FH; Sun, 04 Aug 2019 22:49:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPK5-0003ri-4R
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:53 +0000
X-Inumbo-ID: 2b2b4f6e-b70a-11e9-8980-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b2b4f6e-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p184so38593780pfp.7
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AuJQGBUMCI3UccHUazXwp/b3Q3tZUYyhW4Da3QIy1yc=;
 b=DGwCGc6XDVUwXaE45gbbQy6fhhO+2zHlJorg8NcW6argb8euBbhs0pQfwz4p3wmYGr
 nE4Tqc1S5TSCGn3z79bluHB8kOP9URQ6GDk8Ag8nOY+Zwx7t9ZzdbkCdvZMxHFv73WPf
 yFrTejZLylWrlE9UzmSxnSGub+p3uIuGa+QwFG1rIqaL2jFj/TWeF75UBCckNw/JWLPd
 Hk2vfaOt8Y8GmAEec78Ag4Fdx8td9DJVeEYJYZvv4nQW4t60cvCAgLcPPzOrCX7IP55D
 7nJuSqZwA2LhbQQi1IP2+3jA4kCrhPeh22tmmVy2bqH2f2tTU9mzsW8VQ8AU7oTjorNW
 HTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AuJQGBUMCI3UccHUazXwp/b3Q3tZUYyhW4Da3QIy1yc=;
 b=SMNyxm24N0j86uoZ5nCXVAZrVp+0hEEFxVU/ukTqmsnASUw0DJr7Vf/xTDK7fQTmnw
 /UK+PMmz68QaZ/kHupRhldC/r2jD7Mk373uk4wPFyOqgPbmUgQ393k+/SvNyeTr7EZQk
 NynstkEULY0PUj7vAswiyQ8MSvCmC6kvnvWfUw2SxH2M4XlhPl1rO4fifOhE2IOeuYhO
 k1Ikhqo6U9NpaH6tTizWzZfj61lFrz5kMySkg2QixR8WkC/YkM2yJjLQ4UtsbJxi126r
 7xjGjc9CMRPXWKVPB+bKc/xvkevxH8MIJ55pddUPvnv9lvrp+XEHrr/ArqXSdnJDPIhV
 aB+g==
X-Gm-Message-State: APjAAAWwb8I6hiwMHGngvWVZcSRTwNaD7BMWmj7SS6hwywWNx4XrPEUG
 pud3HKZWG6398MEczAYOcjU=
X-Google-Smtp-Source: APXvYqzeg0CaPIMsZN4B1HhyHGpth3yiq29pMJbbq07Rs0YdWkJ20xSQ2I1Fc/jcHmyqwiJczRrqSg==
X-Received: by 2002:a63:c006:: with SMTP id h6mr3370638pgg.290.1564958991047; 
 Sun, 04 Aug 2019 15:49:51 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:50 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:01 -0700
Message-Id: <20190804224915.28669-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 20/34] xen: convert put_page() to
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGFsc28g
aGFuZGxlcyBwYWdlc1tpXSA9PSBOVUxMIGNhc2VzLCB0aGFua3MgdG8gYW4gYXBwcm9hY2gKdGhh
dCBpcyBhY3R1YWxseSB3cml0dGVuIGJ5IEp1ZXJnZW4gR3Jvc3MuCgpTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFy
ZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJv
dnNreUBvcmFjbGUuY29tPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCi0tLQoK
SGkgSnVlcmdlbiwKClNheSwgdGhpcyBpcyAqZXhhY3RseSogd2hhdCB5b3UgcHJvcG9zZWQgaW4g
eW91ciBndXAucGF0Y2gsIHNvCkkndmUgc3BlY3VsYXRpdmVseSBhZGRlZCB5b3VyIFNpZ25lZC1v
ZmYtYnkgYWJvdmUsIGJ1dCBuZWVkIHlvdXIKYXBwcm92YWwgYmVmb3JlIHRoYXQncyBmaW5hbC4g
TGV0IG1lIGtub3cgcGxlYXNlLi4uCgp0aGFua3MsCkpvaG4gSHViYmFyZAoKCiBkcml2ZXJzL3hl
bi9wcml2Y21kLmMgfCAzMiArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL3ByaXZjbWQuYyBiL2RyaXZlcnMveGVuL3ByaXZjbWQuYwppbmRleCBjNjA3
MGU3MGRkNzMuLmM3ZDA3NjNjYThjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcHJpdmNtZC5j
CisrKyBiL2RyaXZlcnMveGVuL3ByaXZjbWQuYwpAQCAtNTgyLDEwICs1ODIsMTEgQEAgc3RhdGlj
IGxvbmcgcHJpdmNtZF9pb2N0bF9tbWFwX2JhdGNoKAogCiBzdGF0aWMgaW50IGxvY2tfcGFnZXMo
CiAJc3RydWN0IHByaXZjbWRfZG1fb3BfYnVmIGtidWZzW10sIHVuc2lnbmVkIGludCBudW0sCi0J
c3RydWN0IHBhZ2UgKnBhZ2VzW10sIHVuc2lnbmVkIGludCBucl9wYWdlcykKKwlzdHJ1Y3QgcGFn
ZSAqcGFnZXNbXSwgdW5zaWduZWQgaW50ICpucl9wYWdlcykKIHsKLQl1bnNpZ25lZCBpbnQgaTsK
Kwl1bnNpZ25lZCBpbnQgaSwgZnJlZSA9ICpucl9wYWdlczsKIAorCSpucl9wYWdlcyA9IDA7CiAJ
Zm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7CiAJCXVuc2lnbmVkIGludCByZXF1ZXN0ZWQ7CiAJ
CWludCBwaW5uZWQ7CkBAIC01OTMsMzUgKzU5NCwyMiBAQCBzdGF0aWMgaW50IGxvY2tfcGFnZXMo
CiAJCXJlcXVlc3RlZCA9IERJVl9ST1VORF9VUCgKIAkJCW9mZnNldF9pbl9wYWdlKGtidWZzW2ld
LnVwdHIpICsga2J1ZnNbaV0uc2l6ZSwKIAkJCVBBR0VfU0laRSk7Ci0JCWlmIChyZXF1ZXN0ZWQg
PiBucl9wYWdlcykKKwkJaWYgKHJlcXVlc3RlZCA+IGZyZWUpCiAJCQlyZXR1cm4gLUVOT1NQQzsK
IAogCQlwaW5uZWQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KAogCQkJKHVuc2lnbmVkIGxvbmcpIGti
dWZzW2ldLnVwdHIsCi0JCQlyZXF1ZXN0ZWQsIEZPTExfV1JJVEUsIHBhZ2VzKTsKKwkJCXJlcXVl
c3RlZCwgRk9MTF9XUklURSwgcGFnZXMgKyAqbnJfcGFnZXMpOwogCQlpZiAocGlubmVkIDwgMCkK
IAkJCXJldHVybiBwaW5uZWQ7CiAKLQkJbnJfcGFnZXMgLT0gcGlubmVkOwotCQlwYWdlcyArPSBw
aW5uZWQ7CisJCWZyZWUgLT0gcGlubmVkOworCQkqbnJfcGFnZXMgKz0gcGlubmVkOwogCX0KIAog
CXJldHVybiAwOwogfQogCi1zdGF0aWMgdm9pZCB1bmxvY2tfcGFnZXMoc3RydWN0IHBhZ2UgKnBh
Z2VzW10sIHVuc2lnbmVkIGludCBucl9wYWdlcykKLXsKLQl1bnNpZ25lZCBpbnQgaTsKLQotCWlm
ICghcGFnZXMpCi0JCXJldHVybjsKLQotCWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7
Ci0JCWlmIChwYWdlc1tpXSkKLQkJCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLQl9Ci19Ci0KIHN0YXRp
YyBsb25nIHByaXZjbWRfaW9jdGxfZG1fb3Aoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgX191c2Vy
ICp1ZGF0YSkKIHsKIAlzdHJ1Y3QgcHJpdmNtZF9kYXRhICpkYXRhID0gZmlsZS0+cHJpdmF0ZV9k
YXRhOwpAQCAtNjgxLDExICs2NjksMTIgQEAgc3RhdGljIGxvbmcgcHJpdmNtZF9pb2N0bF9kbV9v
cChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCBfX3VzZXIgKnVkYXRhKQogCiAJeGJ1ZnMgPSBrY2Fs
bG9jKGtkYXRhLm51bSwgc2l6ZW9mKCp4YnVmcyksIEdGUF9LRVJORUwpOwogCWlmICgheGJ1ZnMp
IHsKKwkJbnJfcGFnZXMgPSAwOwogCQlyYyA9IC1FTk9NRU07CiAJCWdvdG8gb3V0OwogCX0KIAot
CXJjID0gbG9ja19wYWdlcyhrYnVmcywga2RhdGEubnVtLCBwYWdlcywgbnJfcGFnZXMpOworCXJj
ID0gbG9ja19wYWdlcyhrYnVmcywga2RhdGEubnVtLCBwYWdlcywgJm5yX3BhZ2VzKTsKIAlpZiAo
cmMpCiAJCWdvdG8gb3V0OwogCkBAIC02OTksNyArNjg4LDggQEAgc3RhdGljIGxvbmcgcHJpdmNt
ZF9pb2N0bF9kbV9vcChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCBfX3VzZXIgKnVkYXRhKQogCXhl
bl9wcmVlbXB0aWJsZV9oY2FsbF9lbmQoKTsKIAogb3V0OgotCXVubG9ja19wYWdlcyhwYWdlcywg
bnJfcGFnZXMpOworCWlmIChwYWdlcykKKwkJcHV0X3VzZXJfcGFnZXMocGFnZXMsIG5yX3BhZ2Vz
KTsKIAlrZnJlZSh4YnVmcyk7CiAJa2ZyZWUocGFnZXMpOwogCWtmcmVlKGtidWZzKTsKLS0gCjIu
MjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
