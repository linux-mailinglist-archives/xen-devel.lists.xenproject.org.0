Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B965E45DB60
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231211.399977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzP-0008Px-Dc; Thu, 25 Nov 2021 13:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231211.399977; Thu, 25 Nov 2021 13:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzP-0008Kj-4a; Thu, 25 Nov 2021 13:40:39 +0000
Received: by outflank-mailman (input) for mailman id 231211;
 Thu, 25 Nov 2021 13:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzM-0007NX-Jr
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c6aa46-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:40:35 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 43c6aa46-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jQJAUxBLM/0m6SUtricyeZkrF61UL/f8bZNw+7LnUuE=;
  b=AlOItSa0uLQlF2q5Wom1cF2QvDZteffvWuQb5gQUQ5CWTZf2bQBSQwgW
   gpRDmVgqnCZ2r7YVw0E+1sJ1E2DiHo8iUpx1j4mHO+FlIvzZpfnL8YBFf
   Prxa+EnBsbSLWLcW2oxDgJxCZ2/LxATn0+Cjzts+4ySjlHcXGH2azUwII
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SpLB2JVZLT1tpqFMwNTKwhY0jtt7aiU/VagXUS33Zq8+3C3opRRGVoCF7VnfYEvwXWhjClWUYL
 +BvugkFmclJ+TSOcI9O+65lgd5X9SdVAve0f4ZBegdZAv8zBbgtRGoFH8HunFFEGcdg6WlyMHm
 RvAyH7oxxZEkRKxIykyMXSW/67MEVaY/rRiYdlbuuiN5zA6N424ygPSXN8wa5Q2Lp6Q+W3MFi9
 onrIkyqt4nIS2bBnfb6Bd/o3sUADtwP/yV5ieqQPbMFHVYyU2tEhPcas8d/4L37YUoGrhXzpCN
 LCVmu09b8sFRgU399y9MBhfT
X-SBRS: 5.1
X-MesageID: 59005967
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KSkYVK/8aKM06a6KKYqfDrUDC3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 mAfCzyGOPffZWb3LtkjbN6/ph5UsMOHx9VgTgVrrS48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgg9
 elnuaCAdDsYEa2TlrUEWjViOBNhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0fRa6DN
 pRGAdZpRDXvXl5hAX0TMoMZhvyzi3/uIgUH63vA8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKi8dMNuT2D+U6EWGj+XEnT74cI8KHbj+/flv6HWZy3YPEhQQWR2+qOOgl0+lc9tFL
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMWDN/
 xqGkBgDu4Q8jZEFhryy0WrssS358/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZnwv67dWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdIRfMoC25SI55zpUQFKTgCfqqJBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05l2XpGLZNge5xmHFWKYbvqXfTlUrP7FZjTCTNFedt3KWmMojVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQtiEJTPPriv85Y/XrfaemJOQTh9Y9eMkeJJU9E0xMx9y7aXl
 kxRr2cFkTITc1Wccl7UAp2iAZuyNatCQYUTYXZxYA32gid7Ou5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5zo7i1nRmuV9jIDQ4P6qYA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOF1Z4EcLbSPOz1Fft73ITr/1/AhnTKd5JdUSyrIUzc37tjuU6Kt0nIAnYwmfIz
 B6fBBoV/LGfo4I8/NTTq7qDqoOlT7l3EkZARjGJ5reqLyjKuGGkxNYYAuqPeDncUkLy+bmjO
 roJn62tbqVfkQ8T4YRmErttwaYv3PfVpudXnlZ+AXHGT1W3Ebc8cHOI6tZC6/9WzbhDtAroB
 k/WootGOa+EMd/OGUIKIFZ3dfyK0PwZl2WA7fkxJ0mmtiZ78KDeDBdXNhiIzidcMKF0IMUux
 uJ44Jwa7Am2ixwLNNeaj38LqzTQfyJYC6h35IsHBILLixYwzgAQaJPRPSb6/ZWTZogeKUItO
 DKV2PLPirk0KpAuqJbv+awhBdZguKk=
IronPort-HdrOrdr: A9a23:ou8a4KjUqFS9D0myolYCb/bCLnBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="59005967"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v8 05/47] build: adjust $(TARGET).efi creation in arch/arm
Date: Thu, 25 Nov 2021 13:39:24 +0000
Message-ID: <20211125134006.1076646-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need to try to guess a relative path to the "xen.efi" file,
we can simply use $@. Also, there's no need to use `notdir`, make
already do that work via $(@F).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v8:
    - s/fix/adjust/ in patch title
    - reviewed

 xen/arch/arm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index a3a497bafe89..d0dee10102b6 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -95,7 +95,7 @@ endif
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 ifeq ($(CONFIG_ARM_64),y)
-	ln -sf $(notdir $@)  ../../$(notdir $@).efi
+	ln -sf $(@F) $@.efi
 endif
 
 ifeq ($(CONFIG_LTO),y)
-- 
Anthony PERARD


