Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C774802C8C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646549.1008905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3pR-0001Av-VL; Mon, 04 Dec 2023 07:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646549.1008905; Mon, 04 Dec 2023 07:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3pR-000186-SC; Mon, 04 Dec 2023 07:57:21 +0000
Received: by outflank-mailman (input) for mailman id 646549;
 Mon, 04 Dec 2023 07:57:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDhU=HP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rA3pQ-000180-Cz
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:57:20 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf619077-927a-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 08:57:19 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54cde11d0f4so450307a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 03 Dec 2023 23:57:19 -0800 (PST)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 sa12-20020a1709076d0c00b009fd585a2155sm4972023ejc.0.2023.12.03.23.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 23:57:17 -0800 (PST)
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
X-Inumbo-ID: bf619077-927a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701676638; x=1702281438; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dicC/kX5P2TsFX0dpgAdoM++hBrgoMivXSnmGvQBMt8=;
        b=mSFmWwTx7/lnPVLfHTZ11bLNCdxhlzpWovf8IO7UsyMGtCZaESSr8u8Ze9vIjY9JkI
         02x3AdUe14veQyOfTd0y0uULkweXvOPPDEh0/rgGWqd44lxMPrjmT3Lz08F6IvuSlrtZ
         P1n2n3O2IgCAtuzkA1s5JPRmid8VB1KoahXwkxMIehnnQvAKjKiRMfk9Q5GrvgvIdDvJ
         bNSmY1LXw9aXIwTVbPV2grGTkIYYWAMfvWPGImYOso3pwGuR2h6PdRK+qYqsgt/VaFJR
         j9fu1qodMb7kTUI+lm0sIaZ1RM2pr9yVlYWiFwC/wlc0MM+JZi4mfTwYasdsJMWes4Ri
         YFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701676638; x=1702281438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dicC/kX5P2TsFX0dpgAdoM++hBrgoMivXSnmGvQBMt8=;
        b=aJqHjZ4MnqoKXa7NEE8qmMxNEnb0Fll0RncaHVnKxb3XbG+Xu+zwjKxWu14yG9xrjg
         1ZJeCkUuU9Lg3RDQesx1Ivh3vn8T6A2bmok4XYkUoZOHLSslq7eQMj8jJw/TYJtQGvTJ
         gkRKanupxu7n+lcTm8I6B0tVGicXfgvshRGiU8OCWYC7kKqYLs9gc9VoWDTqxnFxuzf8
         /ZpHndUfkuqQ5HFT3csG4Zecjw5UqswB5U6VxulPErqs5K8wd6v1mzz7pmFuLIIqaFiG
         fvnCWwaJHbIdB+PDlN62gdGXkFLuLSdqaavegsBTHjtNVuKzVVHSZKFfK7IawqThFG6w
         tkYQ==
X-Gm-Message-State: AOJu0YzXv0ell7wHciPM1f2Zdk5jRtj4SkhSrad5GMk2ZKLgFhBK0kYm
	wwf+99pY4SygdmL02M8Jdkdgxq5eYho6bxyCjTU=
X-Google-Smtp-Source: AGHT+IFTCVNFjvdrvzd9eyF+h0wvkyajDRYtoTaC560ySHY2WEDWy20SFdMrvbAWkd0/3eBMjBvN+w==
X-Received: by 2002:a17:906:9e23:b0:a19:a1ba:da2e with SMTP id fp35-20020a1709069e2300b00a19a1bada2emr2390252ejc.85.1701676638197;
        Sun, 03 Dec 2023 23:57:18 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest destroy
Date: Mon,  4 Dec 2023 08:55:53 +0100
Message-Id: <20231204075552.3585875-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an FF-A enabled guest is destroyed it may leave behind memory
shared with SPs. This memory must be reclaimed before it's reused or an
SP may make changes to memory used by a new unrelated guest. So when the
domain is teared down add FF-A requests to reclaim all remaining shared
memory.

SPs in the secure world are notified using VM_DESTROYED that a guest has
been destroyed. An SP is supposed to relinquish all shared memory to allow
reclaiming the memory. The relinquish operation may need to be delayed if
the shared memory is for instance part of a DMA operation.

If the FF-A memory reclaim request fails, return -ERESTART to retry
again. This will effectively block the destruction of the guest until
all memory has been reclaimed.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Hi,

This patch is a bit crude, but gets the job done. In a well designed
system this might even be good enough since the SP or the secure world
will let the memory be reclaimed and we can move on. But, if for some
reason reclaiming the memory is refused it must not be possible to reuse
the memory.

These shared memory ranges are typically quite small compared to the
total memory usage of a guest so it would be an improvement if only
refused shared memory ranges where set aside from future reuse while the
guest was destroyed and other resources made available for reuse. This
could be done by for instance assign the refused shared memory ranges
to a dummy VM like DOMID_IO.

Thanks,
Jens
---
 xen/arch/arm/tee/ffa.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 183528d13388..9c596462a8a2 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -1539,6 +1539,7 @@ static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
 static int ffa_domain_teardown(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
+    struct ffa_shm_mem *shm, *tmp;
     unsigned int n;
     int32_t res;
 
@@ -1564,10 +1565,45 @@ static int ffa_domain_teardown(struct domain *d)
             printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
                    get_vm_id(d), subscr_vm_destroyed[n], res);
     }
+    /*
+     * If this function is called again due to -ERESTART below, make sure
+     * not to send the FFA_MSG_SEND_VM_DESTROYED's.
+     */
+    subscr_vm_destroyed_count = 0;
 
     if ( ctx->rx )
         rxtx_unmap(ctx);
 
+
+    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
+    {
+        register_t handle_hi;
+        register_t handle_lo;
+
+        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
+        res = ffa_mem_reclaim(handle_lo, handle_hi, 0);
+        if ( res )
+        {
+            printk(XENLOG_INFO, "ffa: Failed to reclaim handle %#lx : %d\n",
+                   shm->handle, res);
+        }
+        else
+        {
+            printk(XENLOG_DEBUG, "ffa: Reclaimed handle %#lx\n", shm->handle);
+            ctx->shm_count--;
+            list_del(&shm->list);
+        }
+    }
+    if ( !list_empty(&ctx->shm_list) )
+    {
+        printk(XENLOG_INFO, "ffa: Remaining unclaimed handles, retrying\n");
+        /*
+         * TODO: add a timeout where we either panic or let the guest be
+         * fully destroyed.
+         */
+        return -ERESTART;
+    }
+
     XFREE(d->arch.tee);
 
     return 0;
-- 
2.34.1


