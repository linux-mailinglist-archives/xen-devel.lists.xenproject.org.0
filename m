Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486258AAFA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381156.615722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwhA-0005Bp-Gd; Fri, 05 Aug 2022 12:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381156.615722; Fri, 05 Aug 2022 12:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwhA-00059d-AN; Fri, 05 Aug 2022 12:44:52 +0000
Received: by outflank-mailman (input) for mailman id 381156;
 Fri, 05 Aug 2022 12:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJwh7-0004jk-VN
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:44:50 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64840cc9-14bc-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 14:44:49 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 j4-20020a05600c1c0400b003a4f287418bso1228333wms.5
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 05:44:49 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a5d698b000000b0021eff2ecb31sm3993185wru.95.2022.08.05.05.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 05:44:48 -0700 (PDT)
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
X-Inumbo-ID: 64840cc9-14bc-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SDGt6RJ+ZB5pXGejCuARpIpNfU/+FrEqf6LGth7Ds0I=;
        b=adpcAg1igBCUfHUwrjCwgQ4nk6jPzMyEPxErkQ66X5lexek8Rdn0EFnsEUKK3VEJL6
         SOP71pHwaBwMka2blqPfZHAfwR2SMnW3LuJA0w2sSuYb+kCyfczyVAvyBe8EfuY03fG5
         oEOAKPVwuRip8+l5kRrVb335RPoEdjNfzqXVU92E7vXnN9dJHApK2JNc3N26+yJVGQB0
         XqNqIqIx5+KPvO8Yx821SxZt7bbyJa2y++Lrh1hNCFq/GzK3feDywGsY6w+crRl1hMCX
         6GWBx4NB6VZazYH+StlbRRCyerh3H3DK7ESv+pSE0J/kcdYAl7HPdtFz6WxJD9Vr8uii
         uyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SDGt6RJ+ZB5pXGejCuARpIpNfU/+FrEqf6LGth7Ds0I=;
        b=WnfLeoYe7MjcU8hhbBKP66dSK03Sbtnezr0gx+RJOA1D5JSGWxiAz9V2eYxFSfUehU
         evYdpAlsO9TVkby5F4ceRnNJedE7SiNpSDpRXZMFxJk8fQdM3erDRNMAqIJaWprwXGn0
         n8ux6wE3NhqqJIHomRgaJ0tNbzlzISjJrt8TvZGyGaP17uvJZ4hUL9L4EX9A4YaVxIy0
         wpzbVQ4lZtzguNmxLVnORmgfjdPSYnfhFiTPpxWyYsEYslVu20eQyRI4emzBafkGplle
         MJMYHHxzmOfrsN/PZxORHI16QehvIN8jVUBp4O6WHLgDi1f4+xboWNqqXkofPCZ4Bv3c
         tPPg==
X-Gm-Message-State: ACgBeo2hXIuCMXjuc4cfROg2nyF2UuT29eLsKeoxZiR3uUP3BtpM75d8
	TqGrlUqmn6pUfRbeof1OIwI7YUk8Yrk=
X-Google-Smtp-Source: AA6agR55ntopDM59sXTkYdsI3FM/121Wo2KC1XRYR50IhyYiTtwTYDm3Pp++I/uF5Fo8S2I9gINSMA==
X-Received: by 2002:a05:600c:2d02:b0:3a5:e61:d876 with SMTP id x2-20020a05600c2d0200b003a50e61d876mr4578664wmf.132.1659703488663;
        Fri, 05 Aug 2022 05:44:48 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
Date: Fri,  5 Aug 2022 15:44:40 +0300
Message-Id: <20220805124442.1857692-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805124442.1857692-1-burzalodowa@gmail.com>
References: <20220805124442.1857692-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MASK_DECLARE_ macros, the macro parameter 'x' is used as expression and
therefore it is good to be enclosed in parentheses to prevent against
unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- fix MISRA C 2012 Rule 20.7 violation in all MASK_DECLARE_ macros

 xen/common/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index b0b63cdb36..feb2a6634e 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -25,10 +25,10 @@ const cpumask_t cpumask_all = {
  */
 
 /* cpu_bit_bitmap[0] is empty - so we can back into it */
-#define MASK_DECLARE_1(x) [x+1][0] = 1UL << (x)
-#define MASK_DECLARE_2(x) MASK_DECLARE_1(x), MASK_DECLARE_1(x+1)
-#define MASK_DECLARE_4(x) MASK_DECLARE_2(x), MASK_DECLARE_2(x+2)
-#define MASK_DECLARE_8(x) MASK_DECLARE_4(x), MASK_DECLARE_4(x+4)
+#define MASK_DECLARE_1(x) [(x)+1][0] = 1UL << (x)
+#define MASK_DECLARE_2(x) MASK_DECLARE_1(x), MASK_DECLARE_1((x)+1)
+#define MASK_DECLARE_4(x) MASK_DECLARE_2(x), MASK_DECLARE_2((x)+2)
+#define MASK_DECLARE_8(x) MASK_DECLARE_4(x), MASK_DECLARE_4((x)+4)
 
 const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
 
-- 
2.34.1


