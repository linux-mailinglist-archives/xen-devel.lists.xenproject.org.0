Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE85D75F05B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568586.888123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsDG-00069y-HT; Mon, 24 Jul 2023 09:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568586.888123; Mon, 24 Jul 2023 09:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsDF-0005Z7-5M; Mon, 24 Jul 2023 09:50:45 +0000
Received: by outflank-mailman (input) for mailman id 568586;
 Mon, 24 Jul 2023 09:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsBh-0007SE-Az
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:49:09 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54e37582-2a07-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:49:08 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b8c364ad3bso8861005ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:49:08 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:49:06 -0700 (PDT)
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
X-Inumbo-ID: 54e37582-2a07-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192146; x=1690796946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CXd5cxT7BQDd98tt8oaC0MvbTuhoGV4WCiM7GrnKVE=;
        b=Om2j7Eq4b1zO3xdV6jpRgZNyxXUYFkRHVqkn+q5W951pJcNCyyCCfcFLMOexVrickD
         J4ocoN591zedkzE2l/xp9SKWxYNmVY9krcCZp1enxIDkg3AuGZslR02ZNhQ4EqRsU2HZ
         PP0+JI5GQi1EzLTs4k94q0v4nCvWQ/wpATlpWJHquPmCZ9F29qdBLMIvq7n3uMU0LBE+
         S5G8d6zEmU4sF3lI0zmYqBRm2zlIoJryhG+DWOUkdilD+QmzqjFCVIDjtSm2UD8IjhcW
         4f3Go/NoxA8FuaENkugEjSaXcGkVRUNsilnpPO5VZgwHu2urEIWQPvH/FMxPOeDNA9uj
         omeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192146; x=1690796946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CXd5cxT7BQDd98tt8oaC0MvbTuhoGV4WCiM7GrnKVE=;
        b=Tmn3+bHHrXJZJKddUEjES5CU6rHIhnLVaGXKQMkq/u7afychM1/hbY9uB9PTGCOJMU
         D9fiA0OCGrqVN0DJtFFXQxOEvOJFADrl1u5+YLaDYj8XGPtMNMownHAxVskjXsyMXuK9
         aTC7UObnfJtttLG5IDli0sowfM9n68kyXBAAvloVQxLQX968zuYn8fzroebgzopuoVSH
         ooXkHQT6IzpuCctxRdHc1YNX/oEhbKXxLowVXJ9PXsdXe/Iai/Cp5cJ2H5EVy3nPp3GK
         cPyEcgaXP/oRG/dhr3aD8JyPPUNtuSLtQtG8xBqe4lHd2O00H+3OHSmpZFGsJELrusNq
         E3TA==
X-Gm-Message-State: ABy/qLYw8XyhrJBEkkF6z0Hln7rwczRl7VgOk9lgEEjwI6G2Wr86ev+o
	zVi/g/sBPmxaVdu40fz4Uibosg==
X-Google-Smtp-Source: APBJJlGIkgxKi3c8vlsRfvF8eC2AUaCtjB+PIQLMdMMArsufsHEWiltHfQyyqXBdYUy9SpebX4CtOg==
X-Received: by 2002:a17:902:e80a:b0:1b8:50a9:6874 with SMTP id u10-20020a170902e80a00b001b850a96874mr12324079plg.5.1690192146760;
        Mon, 24 Jul 2023 02:49:06 -0700 (PDT)
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
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 20/47] sunrpc: dynamically allocate the sunrpc_cred shrinker
Date: Mon, 24 Jul 2023 17:43:27 +0800
Message-Id: <20230724094354.90817-21-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the sunrpc_cred shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 net/sunrpc/auth.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index 2f16f9d17966..74e40c8a512d 100644
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
+	shrinker_unregister(rpc_cred_shrinker);
 }
-- 
2.30.2


