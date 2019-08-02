Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C050F7EB1A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxY-0005ry-Jq; Fri, 02 Aug 2019 04:14:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBI-000768-GE
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:32 +0000
X-Inumbo-ID: 19cd7864-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 19cd7864-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:31 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t14so32990083plr.11
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtbgyNHZ/W16Wsr49ObVlGXNsYs5Ix8cECAWpHw8QNg=;
 b=RO5t4Ioq4WOEkql+z1BxTA9XpQ5l0uBsUNJdBVpEbEdDpylZNAFokBSBfkt63Vmsnw
 KKnFnDLW2SLxaXe4yEcd4Uwphs0F9rh9yrBF7wrtI6jX7Smsup4E8B+OCU5PAghiuPUe
 n/rru2nRkN4fBDLxv0E5LWIc3+ez3bVuBV4gRzIu0YbbR7/jG/nHlqRg4ui2ABpoKbbs
 zzA9SmSgidMvseL2Kb+bN8XRYc2qyorbmCL2eKn81WG2j5TabLu8TlIG3hp8Y7Gq/i02
 vYgsWfOu94xgHEddrADmlOmkGGALS2TQwhC3ZfS61Jjz+jw13+1q5hfNRcQVjxbv88fI
 6ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtbgyNHZ/W16Wsr49ObVlGXNsYs5Ix8cECAWpHw8QNg=;
 b=s6jXLrcItZTkG0+Kp5PNZ1kDBtBKPkDIFJ43CNu6Mr956EgGS+WJGp7jzonaSlBmPu
 XSVTeEK4ma+4FpxU6ok3SjfidMWG9ZPWRqSXXpTZtORhdfHlP3XLHEQDQbojqw8pmzeQ
 OGhuVIu7aFTtF1tsjxVI4E43Go5C7495K/rZU7RC1TqSpxr9nlcU2Op/JODVwubQgjNB
 0mDEE++fvfVOW0IhGdM8j95KdS8dMnKcOPZIQvm1AzwTyZBm6MsfftLAN69fdxiC859e
 G+/QO9KRxygW6cmHj1mgS7pAuKmeoRinFggi6eanQr7Ugm4hCDdIoUVKx4mRmUqE9pUO
 pV6Q==
X-Gm-Message-State: APjAAAXPzgBimVjQwfLcRkOxW9aBI8gaI0km9zj6sm7w9eQUCbXOKseh
 mnblMQoEMF8lw4lP500s5YI=
X-Google-Smtp-Source: APXvYqwKrOY4Kztkj41s0a6oi7zayzaXd8LpjaiCIksbrU4wJsvnJgU6mF0Bb9Hw/Pj5xfTEZIafcQ==
X-Received: by 2002:a17:902:5ac4:: with SMTP id
 g4mr131986648plm.80.1564712430821; 
 Thu, 01 Aug 2019 19:20:30 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:30 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:43 -0700
Message-Id: <20190802022005.5117-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 12/34] vmci: convert put_page() to
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
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
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
YXRlLgoKQXMgQ2hyaXN0b3BoZSBIZWxsd2lnIHB1dCBpdCwgInNldF9wYWdlX2RpcnR5KCkgaXMg
b25seSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxlIGJhY2tlZCBwYWdlIHdoZXJl
IHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5ncyBvZmYuIiBbMV0KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdCNzIwQGxzdC5kZQoKQ2M6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkNjOiBBbCBWaXJvIDx2aXJvQHplbml2Lmxp
bnV4Lm9yZy51az4KQ2M6ICJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9y
LmNvbT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9taXNjL3Zt
d192bWNpL3ZtY2lfY29udGV4dC5jICAgIHwgIDIgKy0KIGRyaXZlcnMvbWlzYy92bXdfdm1jaS92
bWNpX3F1ZXVlX3BhaXIuYyB8IDExICsrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL3Zt
d192bWNpL3ZtY2lfY29udGV4dC5jIGIvZHJpdmVycy9taXNjL3Ztd192bWNpL3ZtY2lfY29udGV4
dC5jCmluZGV4IDE2Njk1MzY2ZWM5Mi4uOWRhYTUyZWU2M2I3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L21pc2Mvdm13X3ZtY2kvdm1jaV9jb250ZXh0LmMKKysrIGIvZHJpdmVycy9taXNjL3Ztd192bWNp
L3ZtY2lfY29udGV4dC5jCkBAIC01ODcsNyArNTg3LDcgQEAgdm9pZCB2bWNpX2N0eF91bnNldF9u
b3RpZnkoc3RydWN0IHZtY2lfY3R4ICpjb250ZXh0KQogCiAJaWYgKG5vdGlmeV9wYWdlKSB7CiAJ
CWt1bm1hcChub3RpZnlfcGFnZSk7Ci0JCXB1dF9wYWdlKG5vdGlmeV9wYWdlKTsKKwkJcHV0X3Vz
ZXJfcGFnZShub3RpZnlfcGFnZSk7CiAJfQogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mv
dm13X3ZtY2kvdm1jaV9xdWV1ZV9wYWlyLmMgYi9kcml2ZXJzL21pc2Mvdm13X3ZtY2kvdm1jaV9x
dWV1ZV9wYWlyLmMKaW5kZXggODUzMWFlNzgxMTk1Li5lNTQzNDU1MWQwZWYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbWlzYy92bXdfdm1jaS92bWNpX3F1ZXVlX3BhaXIuYworKysgYi9kcml2ZXJzL21p
c2Mvdm13X3ZtY2kvdm1jaV9xdWV1ZV9wYWlyLmMKQEAgLTYyNiwxNSArNjI2LDggQEAgc3RhdGlj
IHZvaWQgcXBfcmVsZWFzZV9xdWV1ZV9tdXRleChzdHJ1Y3Qgdm1jaV9xdWV1ZSAqcXVldWUpCiBz
dGF0aWMgdm9pZCBxcF9yZWxlYXNlX3BhZ2VzKHN0cnVjdCBwYWdlICoqcGFnZXMsCiAJCQkgICAg
IHU2NCBudW1fcGFnZXMsIGJvb2wgZGlydHkpCiB7Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBp
IDwgbnVtX3BhZ2VzOyBpKyspIHsKLQkJaWYgKGRpcnR5KQotCQkJc2V0X3BhZ2VfZGlydHkocGFn
ZXNbaV0pOwotCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLQkJcGFnZXNbaV0gPSBOVUxMOwotCX0K
KwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2VzLCBudW1fcGFnZXMsIGRpcnR5KTsKKwlt
ZW1zZXQocGFnZXMsIDAsIG51bV9wYWdlcyAqIHNpemVvZihzdHJ1Y3QgcGFnZSAqKSk7CiB9CiAK
IC8qCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
