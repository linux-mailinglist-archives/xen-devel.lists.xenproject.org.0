Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6F46A24A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239481.415220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSn-0001n9-2r; Mon, 06 Dec 2021 17:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239481.415220; Mon, 06 Dec 2021 17:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSm-0001Zt-BY; Mon, 06 Dec 2021 17:07:40 +0000
Received: by outflank-mailman (input) for mailman id 239481;
 Mon, 06 Dec 2021 17:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOj-0005ta-Vz
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6efd5052-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:29 +0100 (CET)
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
X-Inumbo-ID: 6efd5052-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xZ8A4jgJ4Y38L4d9figc1Ddx9Yxc2qvFPaFW8MGy500=;
  b=HnkWPBaHObDBKQwgG5LZ6gF08fvqp4yXg/JWzUjs0elW+cWrkaEbTFFM
   lRnVjHUeBlqPm7ynSX6hTYLRZ2WS8mowd0T2NIrLPqr81bMM5OYR5GO3v
   T1M6aQZDqOVYNmRUK//BkZ9HqC0aSfq7PEajrbbZNxY3VlKSK9w8szB5l
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: repNzCQmembTuxtYYe4kLpCJIOHAMIBVWfcZn6aJyjwy5jPOmG9aQICne92kvFmNGgFtXLKp3n
 J0k6mD2z5fwGo2FZiB5SOJtEy0jwpEpEqbmBJLHgzazVhg73dwAxy9WdFEeHnVv8xAa2iPwp47
 NFC9lTisWdhTLf5T7wMRr8z93+0fDD8T18a2OaYh6Wg/3hrqV2nav42XO+SgKlmcviVV2yQuCo
 AdsAwb7LMuUmKbv95RgPzBVDkIdTPXyAH4mKnvinjCIzksaOgCbbQ1PVy0kgUoK8gqUIiRoJtn
 V9sY3/Bpepaie9d3RCe9Vi98
X-SBRS: 5.1
X-MesageID: 61420633
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OZlPaa6fPS2ASOrKJYN37wxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 mAWW2+DPqmNa2LxeYglati3oBwF68DWnNJqHVZrpCFhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 NFVhbq8WwITLqT0xOAtAkdADAUvBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRKqEP
 5RCMlKDajzwbgEIP21ULqkOs7qi3GvAI2FIonmK8P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2Qd/DYuqq4jslSmVNDnUzW3pXeFulgXXN84LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobWAuz
 m+vk8HsPyxmiOGReSPD7qiw/ArnbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr1/sCRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHHUKAnuNOvwjxpgDNE6qQQ1d3XG327yk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvUJR1l/m9T467CaC8gj9yjn5ZLlXvEMZGPxH44owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:WoN1567+X5EqBYCxqQPXwMLXdLJyesId70hD6qhwISY7TiX+rb
 HKoB17726StN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxelZnO/fKlbbdREWmNQw6U
 4ZSdkcNOHN
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="61420633"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 17/57] tools/xl: Remove unnecessary -I. from CFLAGS
Date: Mon, 6 Dec 2021 17:02:00 +0000
Message-ID: <20211206170241.13165-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

GCC will search the directory where the source file is for
quote-includes.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 656b21c7da..2e129f00e1 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -7,7 +7,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
-CFLAGS += -I. -fPIC
+CFLAGS += -fPIC
 
 CFLAGS += $(PTHREAD_CFLAGS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
-- 
Anthony PERARD


