Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A63B7EB1F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxa-0005tB-Dv; Fri, 02 Aug 2019 04:14:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBR-00077y-Rg
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:41 +0000
X-Inumbo-ID: 1f8a8b10-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1f8a8b10-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:41 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id 4so26013739pld.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=nL5gA8HkBp1qUXL8uSk44yRPDpQM1GzztnKY+vjFkpLO4+ej8Ho3KCm6C4y+E5m8LE
 h9Iaftsjh1UsJUr+Pb21bHX0tSSHXapiGzhmehbpJMXTX/8OVSokepo7ZYp/sAOufRJM
 Dn+Q/LNbJL1I2nNGcQbJ8ZQUaKHbOXUsbWTmj876BCAWOoZWZ6NdZCYaUx//X8gLE1Fe
 Ao4iR+EL7uUQrdQvqWcLAimsvB7jPrqJUl8VTCYTJSYJDpeTKlwz9tVoL0Kex6hlm0oH
 POKBdW3YOuZavjeRiRdEl20H0UanKpKGw2d45prgvnfRqnKjFtcxDl+Dci+NMwFW+1GP
 a0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=BTrBpC1NYhcs4yqGkoOQJVqGAWauC4ctMQWG/TmJz3zgotCg1lAFctcHpPb6x3ZKPH
 NA9t9Y3kTo4ekYdOA1xrsHCAv49cyXfwFVhaolBHYj280XtfS2NwYcKoANpeWzPPhX4H
 Bg6xKTinwb8P4BIo2gcmeS46MkcVysLrfx2+OrULlZjLtICol/BA1jf2OUdltVNj1FAJ
 hFUX82Og2W71lg+secn4q4B+f5JBrgNuN9vNNALCeK0ADGo7dXvLcHubWwL4pGl87Kkg
 mP01Qqky/7x9u4zKPvFy9UOq25vG6egudRFtclvafOh5ZBYbwH30hUjrOuLwlfhhuLIB
 DaBw==
X-Gm-Message-State: APjAAAXtG8LpylF6BUE+hXijCBRTYYbgaVXA+I5z7pbAZK9MM2u6pdZX
 k2sD4Ma/QZbm8ULLI4YiW6c=
X-Google-Smtp-Source: APXvYqztsbUVpJnR1pWJXE324fW+SugJBxHHKLNQRZirN/VnD1v0OsiDr/qT4pG5Y0OOV3QlfOZRKQ==
X-Received: by 2002:a17:902:830c:: with SMTP id
 bd12mr131600821plb.237.1564712440479; 
 Thu, 01 Aug 2019 19:20:40 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:40 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:49 -0700
Message-Id: <20190802022005.5117-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 18/34] fbdev/pvr2fb: convert put_page() to
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
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Arvind Yadav <arvind.yadav.cs@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Bhumika Goyal <bhumirks@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQmFydGxv
bWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4KQ2M6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KQ2M6IEFydmlu
ZCBZYWRhdiA8YXJ2aW5kLnlhZGF2LmNzQGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2Zm
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy92aWRl
by9mYmRldi9wdnIyZmIuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLmMKaW5kZXggN2ZmNGI2Yjg0MjgyLi4wZTRm
OWFhNjQ0NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHZyMmZiLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwpAQCAtNzAwLDggKzcwMCw3IEBAIHN0YXRpYyBz
c2l6ZV90IHB2cjJmYl93cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hhciAqYnVm
LAogCXJldCA9IGNvdW50OwogCiBvdXRfdW5tYXA6Ci0JZm9yIChpID0gMDsgaSA8IG5yX3BhZ2Vz
OyBpKyspCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhwYWdlcywgbnJf
cGFnZXMpOwogCiAJa2ZyZWUocGFnZXMpOwogCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
