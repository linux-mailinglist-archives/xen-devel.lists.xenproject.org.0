Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01421772047
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578048.905274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyBz-0006Pe-O8; Mon, 07 Aug 2023 11:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578048.905274; Mon, 07 Aug 2023 11:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyBz-0006ME-LO; Mon, 07 Aug 2023 11:14:31 +0000
Received: by outflank-mailman (input) for mailman id 578048;
 Mon, 07 Aug 2023 11:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSyBx-000610-Vx
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:14:29 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9293b0d0-3513-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:14:28 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2690803a368so590612a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:14:28 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:14:26 -0700 (PDT)
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
X-Inumbo-ID: 9293b0d0-3513-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406867; x=1692011667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igblsYgdIrcTAL0swCZj529c9jjsKo5CwfFS1Qcng2s=;
        b=E/hLPt4J9XwFdy6Q/ScFkKAboS35nT/aVetijUs1uOyzpCdXJrzvux0WuTkbJahYDU
         HJ4RnOFgFoSV4vIvUSABYCFS8MT8O5BBdFRn/e0d22QvpkBHCvD7k0jL91l8VKqh/AnF
         pNO49bmGYrjFLlyM+it2E7+BjcoRQ4qvC4Z3zAnwRx4Mtu2gDzO6KjINZG5u37W7YPwR
         rd9mA5oeLZ1tw0ARUeeWuqEeVLZXyyZpLkD+mkbNh9jB2r9y+xHrPRtEaxpg/6wzvL2p
         pP/svPPe0egiR6EyNxAsA97H1SimGEidDNnScRjB0NSGHk7qAYW8vH7pvvrUaRXF4mmo
         0r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406867; x=1692011667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igblsYgdIrcTAL0swCZj529c9jjsKo5CwfFS1Qcng2s=;
        b=SG1iYr5DToFf2UekpJKlS+aeMnNLA5c23LJI+7tclLiUebUfSX5RubMWhYTvgnxCR4
         myVbOtIuByKwhwUZ7KkcwmwpyUgSrcj9Rod7vD+Z+L3qQVZcPtqRVb9nymGyFO/r8xC7
         RyxdBxEwEJ6s96UQMnvNIEEks4Wj11JzwQsW9lk06+P8Hsq6uY/77yN/l/8Ab3EZ1P8C
         SzivgY743hR91IGeJxL1UNSU18t3F6udDc22kAbiOl9q453RZZFTjQdRGq35LgtK0Lus
         UN6ER0+o4C9rCSnr7kLx3mWNx62NQrMf3pRDpzHXwkRwUUVUgtoh68lcOKjqzq3nxGN2
         H2bA==
X-Gm-Message-State: ABy/qLa2dZ2QbSnl53V9CACBKgJCMAWuenCA52kiRbfnaM1wjmfAR8xV
	ozSfswKlO7/SPpWt40prC6ty2A==
X-Google-Smtp-Source: APBJJlGEDKqK4nyUWs8xE2EOJL+ODt25deDnA1/u8sHRAURqC7uD6bjxMDwwed+SXn6y84Un7sE7wA==
X-Received: by 2002:a17:90a:1090:b0:268:126c:8a8b with SMTP id c16-20020a17090a109000b00268126c8a8bmr24570134pja.3.1691406867003;
        Mon, 07 Aug 2023 04:14:27 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org,
	david@fromorbit.com,
	tkhai@ya.ru,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	djwong@kernel.org,
	brauner@kernel.org,
	paulmck@kernel.org,
	tytso@mit.edu,
	steven.price@arm.com,
	cel@kernel.org,
	senozhatsky@chromium.org,
	yujie.liu@intel.com,
	gregkh@linuxfoundation.org,
	muchun.song@linux.dev,
	simon.horman@corigine.com,
	dlemoal@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	rcu@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dm-devel@redhat.com,
	linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 21/48] sunrpc: dynamically allocate the sunrpc_cred shrinker
Date: Mon,  7 Aug 2023 19:09:09 +0800
Message-Id: <20230807110936.21819-22-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the sunrpc_cred shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 net/sunrpc/auth.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index 2f16f9d17966..0cc52e39f859 100644
--- a/net/sunrpc/auth.c
+++ b/net/sunrpc/auth.c
@@ -861,11 +861,7 @@ rpcauth_uptodatecred(struct rpc_task *task)
 		test_bit(RPCAUTH_CRED_UPTODATE, &cred->cr_flags) != 0;
 }
 
-static struct shrinker rpc_cred_shrinker = {
-	.count_objects = rpcauth_cache_shrink_count,
-	.scan_objects = rpcauth_cache_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *rpc_cred_shrinker;
 
 int __init rpcauth_init_module(void)
 {
@@ -874,9 +870,18 @@ int __init rpcauth_init_module(void)
 	err = rpc_init_authunix();
 	if (err < 0)
 		goto out1;
-	err = register_shrinker(&rpc_cred_shrinker, "sunrpc_cred");
-	if (err < 0)
+	rpc_cred_shrinker = shrinker_alloc(0, "sunrpc_cred");
+	if (!rpc_cred_shrinker) {
+		err = -ENOMEM;
 		goto out2;
+	}
+
+	rpc_cred_shrinker->count_objects = rpcauth_cache_shrink_count;
+	rpc_cred_shrinker->scan_objects = rpcauth_cache_shrink_scan;
+	rpc_cred_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(rpc_cred_shrinker);
+
 	return 0;
 out2:
 	rpc_destroy_authunix();
@@ -887,5 +892,5 @@ int __init rpcauth_init_module(void)
 void rpcauth_remove_module(void)
 {
 	rpc_destroy_authunix();
-	unregister_shrinker(&rpc_cred_shrinker);
+	shrinker_free(rpc_cred_shrinker);
 }
-- 
2.30.2


