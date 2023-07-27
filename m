Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85958764BC7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570903.893448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBp-0002nP-68; Thu, 27 Jul 2023 08:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570903.893448; Thu, 27 Jul 2023 08:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBo-0002Tt-7D; Thu, 27 Jul 2023 08:17:40 +0000
Received: by outflank-mailman (input) for mailman id 570903;
 Thu, 27 Jul 2023 08:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw4h-0001DS-5J
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:10:19 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e7b41e-2c55-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 10:10:18 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-686f74a8992so77854b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:10:18 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:10:16 -0700 (PDT)
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
X-Inumbo-ID: 05e7b41e-2c55-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445417; x=1691050217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYuXWIGRd3SDQUNwBNnDU/RFUGkEJd0z6ud/pRWhp58=;
        b=T9ifvBS7grSXMXHZ+aFeKzum6pF3H2DhLFdohTJRx7vF7szcBG6tJ5VPINqCVu3pCX
         FmubTvt88b5ysMWaYtFibatbXMnoo6Jib8lbo65gbMoj4iY6HbdoFrEeXgYSqYC9Jqe0
         PGHsLAS4RpAPQjTV72r0GtDUpuZ/ybvTZ9EZC90EXosh65ardfAALzeVYgFduHUdYxNh
         uE3GuwKiv2CyHXolQ3XZqpbE7oSyCW4E0iZzkXVJZoTlkXjievgPAGhg1+Kv8s/E0hIi
         dyIaavdNWwWhQNwuCKJwqWG502/DMJOkmwjObTrka2ckcmNrtUCmvsEGY2FZ9fmQFWZZ
         aE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445417; x=1691050217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYuXWIGRd3SDQUNwBNnDU/RFUGkEJd0z6ud/pRWhp58=;
        b=SnNk0akUpxp1nbMMAXmwZWTgN/6mGHzWn5/W5CmwpFE08Tt/QeAsXhD2BcXLBAXRxO
         5bHvGG+GxlurqIENciAxg3ZSKV+YLO7rKOUMXnLQAOJGDK0SSCVP/rCc+xqT5QTKfigY
         ZIGwGciCHb60tfFoXePfgGo3HBmEosBEeIu8HS9MixGWnNpPgz6FoUT61fsyfI8NNT1k
         lLI0IyvBZxJv6nWWdT+KlqAjO6yrsS+t4VhMyWEDfBR9xB2VZ47naevA4mjyaglYj58i
         JS4lBkvqhRWYg2lsKKjFwEYRHh0bnVcl/gMXqHmy72cvnE2rZy2aMMjksG5FggKZWt9a
         xPOA==
X-Gm-Message-State: ABy/qLaTLgK4rIC3ljmuwQmkaNybempP8GXn1crxXR2l53RnlTo/Ds4W
	fMeUxQ0bD9kp5dUs0P+OwNGLHw==
X-Google-Smtp-Source: APBJJlFP1iLC566NPrkWwKL0iKI9L1P+4s+IlmNKaBmXVe5HE8WAAvDQ5uBELCFt4/l7YPuEeyQdfQ==
X-Received: by 2002:a05:6a21:7882:b0:123:3ec2:360d with SMTP id bf2-20020a056a21788200b001233ec2360dmr5970181pzc.5.1690445417252;
        Thu, 27 Jul 2023 01:10:17 -0700 (PDT)
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
	muchun.song@linux.dev
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
Subject: [PATCH v3 22/49] sunrpc: dynamically allocate the sunrpc_cred shrinker
Date: Thu, 27 Jul 2023 16:04:35 +0800
Message-Id: <20230727080502.77895-23-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the sunrpc_cred shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 net/sunrpc/auth.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index 2f16f9d17966..6b898b1be6f5 100644
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
@@ -874,9 +870,16 @@ int __init rpcauth_init_module(void)
 	err = rpc_init_authunix();
 	if (err < 0)
 		goto out1;
-	err = register_shrinker(&rpc_cred_shrinker, "sunrpc_cred");
-	if (err < 0)
+	rpc_cred_shrinker = shrinker_alloc(0, "sunrpc_cred");
+	if (!rpc_cred_shrinker)
 		goto out2;
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
@@ -887,5 +890,5 @@ int __init rpcauth_init_module(void)
 void rpcauth_remove_module(void)
 {
 	rpc_destroy_authunix();
-	unregister_shrinker(&rpc_cred_shrinker);
+	shrinker_free(rpc_cred_shrinker);
 }
-- 
2.30.2


