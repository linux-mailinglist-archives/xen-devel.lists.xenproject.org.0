Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 402197EB17
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxW-0005ql-Qb; Fri, 02 Aug 2019 04:14:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNB8-00074F-L3
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:22 +0000
X-Inumbo-ID: 14152e4a-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 14152e4a-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:21 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id y8so33024939plr.12
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEUR/G5OnJcefSlX4AYJWWcgqHhC+JXxEofDOG22P/4=;
 b=ZjBIvPI6FGYYuQaoM3wYb6xPjNep6A1qdBgLoxOD+angQDRZC9mN7qZBiGsA4x1Mmk
 DVp0b1Fq3km/l8LFUFJZZReS797zF2kYF9KrMWUllVa8HFfcUrM1hAE1P/qQjXzrMnOX
 JxD/xFl+WZHXSEuAGF9iElPEIqC+TRo873joNlnRMAHY9AMqSmLW3nsU27bTpXhcFKV6
 4LeM2yIf45e6IoMit2yX6aFzmLhkspb/EkG8Tlqf3bZNN4WeHI7tMYFctQdF6liMtwoJ
 IvfT9HS49sxx2bYOPNOBswTMjccuTwXWnzyhwEMT1ktty7/Al6mbgY/88Wt++RCGQUor
 cVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fEUR/G5OnJcefSlX4AYJWWcgqHhC+JXxEofDOG22P/4=;
 b=msNJc+hpl9cdrQjpjGWecbsxoGjSSGKF0IOoakIo1eqUxs96PIEJU1qpijNwQNYj9C
 wx0F4Et+KPo0Ax5SKs9Ze5hEYz5PW8qV3gx9tWK2iCcFJgqfZFHFuK2tsOz6XcSeBMPu
 +pI3Ufu/Xia7UWK85PQONupFySf0K3UGaI4sDkjqNVrxaPcp11/1fB7uvyflsB9DoXHK
 br2rRcLRyMLjasnNd56SHqILnUMGONscyyjN+Rz60g4B2+aVr0puivHDOl2Ua5JIUXTD
 xSjdTZdeN/xB5RKgB2F0ui3BmgT+8YCayEZ2WaKhAeaiMIYSqPbwNhMNByivICos2E9v
 E5qw==
X-Gm-Message-State: APjAAAVUs+aBFzYw4ydnfJ4O+RI6TJjmfFvai92uQq3c/ZT4ZYr3OBKc
 nDnDbmFOEP8oNAV88wSPokU=
X-Google-Smtp-Source: APXvYqx7CDlh0PC+iGQbvpFabXIK4hA95kcB6ECyCRgjU7tdLEhAXCZnA9jGvinS59yHHVq1pirulQ==
X-Received: by 2002:a17:902:a409:: with SMTP id
 p9mr130268364plq.218.1564712421229; 
 Thu, 01 Aug 2019 19:20:21 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:20 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:37 -0700
Message-Id: <20190802022005.5117-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 06/34] drm/i915: convert put_page() to
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpOb3RlIHRoYXQg
dGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2RlJ3MgYmVoYXZpb3IgaW4KaTkxNV9nZW1f
dXNlcnB0cl9wdXRfcGFnZXMoKTogaXQgbm93IGNhbGxzIHNldF9wYWdlX2RpcnR5X2xvY2soKSwK
aW5zdGVhZCBvZiBzZXRfcGFnZV9kaXJ0eSgpLiBUaGlzIGlzIHByb2JhYmx5IG1vcmUgYWNjdXJh
dGUuCgpBcyBDaHJpc3RvcGhlIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBv
bmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUg
d2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpDYzog
SmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEpvb25hcyBMYWh0
aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRy
LmMgfCA5ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
dXNlcnB0ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYwpp
bmRleCA1MjhiNjE2NzgzMzQuLmMxODAwOGQzY2MyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCkBAIC01MjcsNyArNTI3LDcgQEAgX19pOTE1X2dlbV91
c2VycHRyX2dldF9wYWdlc193b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0ICpfd29yaykKIAl9CiAJ
bXV0ZXhfdW5sb2NrKCZvYmotPm1tLmxvY2spOwogCi0JcmVsZWFzZV9wYWdlcyhwdmVjLCBwaW5u
ZWQpOworCXB1dF91c2VyX3BhZ2VzKHB2ZWMsIHBpbm5lZCk7CiAJa3ZmcmVlKHB2ZWMpOwogCiAJ
aTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOwpAQCAtNjQwLDcgKzY0MCw3IEBAIHN0YXRpYyBpbnQg
aTkxNV9nZW1fdXNlcnB0cl9nZXRfcGFnZXMoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9i
aikKIAkJX19pOTE1X2dlbV91c2VycHRyX3NldF9hY3RpdmUob2JqLCB0cnVlKTsKIAogCWlmIChJ
U19FUlIocGFnZXMpKQotCQlyZWxlYXNlX3BhZ2VzKHB2ZWMsIHBpbm5lZCk7CisJCXB1dF91c2Vy
X3BhZ2VzKHB2ZWMsIHBpbm5lZCk7CiAJa3ZmcmVlKHB2ZWMpOwogCiAJcmV0dXJuIFBUUl9FUlJf
T1JfWkVSTyhwYWdlcyk7CkBAIC02NjMsMTEgKzY2Myw4IEBAIGk5MTVfZ2VtX3VzZXJwdHJfcHV0
X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCiAJaTkxNV9nZW1fZ3R0X2Zp
bmlzaF9wYWdlcyhvYmosIHBhZ2VzKTsKIAogCWZvcl9lYWNoX3NndF9wYWdlKHBhZ2UsIHNndF9p
dGVyLCBwYWdlcykgewotCQlpZiAob2JqLT5tbS5kaXJ0eSkKLQkJCXNldF9wYWdlX2RpcnR5KHBh
Z2UpOwotCiAJCW1hcmtfcGFnZV9hY2Nlc3NlZChwYWdlKTsKLQkJcHV0X3BhZ2UocGFnZSk7CisJ
CXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIG9iai0+bW0uZGlydHkpOwogCX0K
IAlvYmotPm1tLmRpcnR5ID0gZmFsc2U7CiAKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
