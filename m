Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97883FF5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqI-0000m0-JW; Wed, 07 Aug 2019 01:34:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqG-0000jc-OV
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:16 +0000
X-Inumbo-ID: 778214c5-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 778214c5-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:15 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i189so42499402pfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=eL3MErGFo1XqhdMwEg2Kjw8ppwk7Vahm6mgoNNA3cii/CVgkEKjt7vsL/U/CmyPRH+
 vBu50G7ybGgkp7Hokph0DkgDWhI/CbhoDAa+AbddMqWT6ISLL60rYA89HWspc4xyz4Vp
 5XWKqpmskK/zJd8DBYamJF8+Y0ROhmLz8Fdh4cz2AghIDfFUZCj9rMXq3aFWqKMWQAG2
 HgrGAFAgdTFgMvzU7LHu/FiPYMdm8mLe8AL0h5BcC9G6165T14l59ud/pmRsQYRQ9HTJ
 QDGVt3CGvwstyiOJQq9AlYZoAOTVBthJyf2RDDu2y6x+HTZ/VWBzsErS5Ba5fNi4EntP
 9Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=Y/oHZ5MB9WNmmQDdyxf2XtYlwaBnApakK6Skesj1QXEBZaMSQH2INcefdtW68IhvHI
 qqDH5t16NhGnctUdDBTtS4Vt/syEEMKp2bRAnNd8EwRE7LeUuvn9s3L+PX+J/Au1FMRv
 I5PFAkJh07xq2n03z14zdTOl+iuihp2YFX+ADt5txVYoUyVua5vClFfrceewHVgl92HM
 Xfz4QuWJdEuLieZ+lPlBeJhP44jnhHCHOrzsV18hc3kes4LbCCpeYkhjZpL+PhwD/oRR
 PBNwz8ETLEyrhaU3/rOBaMyqCbGY2Qo2CACY+SMagSFbRxaU2Zu/ZNy6qkXOsQZ2lxWv
 fUuA==
X-Gm-Message-State: APjAAAWiuOfYzJdO3xW1W9FQhjj0qcnYTLlHhJYmsifsfAmneMlesSif
 sgSLehePABHditNOnaCVOl0=
X-Google-Smtp-Source: APXvYqzI59Ma7HfX7JZrmVs+MBRFW3wzbxtnFzHUxVGy1m1ZSRzZ7m9Bk2Hb9Owa8Q1RMoC2THAX6w==
X-Received: by 2002:a63:c008:: with SMTP id h8mr5698079pgg.427.1565141655205; 
 Tue, 06 Aug 2019 18:34:15 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:14 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:18 -0700
Message-Id: <20190807013340.9706-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 19/41] vfio: convert put_page() to
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
 rds-devel@oss.oracle.com, Alex Williamson <alex.williamson@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpOb3RlIHRoYXQg
dGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2RlJ3MgYmVoYXZpb3IgaW4KcXBfcmVsZWFz
ZV9wYWdlcygpOiBpdCBub3cgdWx0aW1hdGVseSBjYWxscyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCks
Cmluc3RlYWQgb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcyBwcm9iYWJseSBtb3JlIGFjY3Vy
YXRlLgoKQXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBv
bmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUg
d2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpDYzog
QWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KQ2M6IGt2bUB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jCmluZGV4IDA1NDM5MWYzMGZhOC4uNWE1NDYxYTE0Mjk5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCisrKyBiL2RyaXZlcnMvdmZpby92Zmlv
X2lvbW11X3R5cGUxLmMKQEAgLTMyMCw5ICszMjAsOSBAQCBzdGF0aWMgaW50IHB1dF9wZm4odW5z
aWduZWQgbG9uZyBwZm4sIGludCBwcm90KQogewogCWlmICghaXNfaW52YWxpZF9yZXNlcnZlZF9w
Zm4ocGZuKSkgewogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Ci0JCWlm
IChwcm90ICYgSU9NTVVfV1JJVEUpCi0JCQlTZXRQYWdlRGlydHkocGFnZSk7Ci0JCXB1dF9wYWdl
KHBhZ2UpOworCQlib29sIGRpcnR5ID0gcHJvdCAmIElPTU1VX1dSSVRFOworCisJCXB1dF91c2Vy
X3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIGRpcnR5KTsKIAkJcmV0dXJuIDE7CiAJfQogCXJl
dHVybiAwOwpAQCAtMzU2LDcgKzM1Niw3IEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAkJICovCiAJCWlmIChyZXQg
PiAwICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkgewogCQkJcmV0ID0gLUVPUE5PVFNVUFA7Ci0J
CQlwdXRfcGFnZShwYWdlWzBdKTsKKwkJCXB1dF91c2VyX3BhZ2UocGFnZVswXSk7CiAJCX0KIAl9
CiAJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
