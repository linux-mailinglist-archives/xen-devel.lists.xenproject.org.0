Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D175F03D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568557.888005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsCz-0001jS-8c; Mon, 24 Jul 2023 09:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568557.888005; Mon, 24 Jul 2023 09:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsCy-0001Vj-I4; Mon, 24 Jul 2023 09:50:28 +0000
Received: by outflank-mailman (input) for mailman id 568557;
 Mon, 24 Jul 2023 09:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNs9M-0007J3-Nc
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:46:44 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fedfe2eb-2a06-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:46:44 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bba9539a23so640915ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:46:44 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:46:42 -0700 (PDT)
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
X-Inumbo-ID: fedfe2eb-2a06-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192002; x=1690796802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zTxasxXedNYwr5HiD+ktCpinG7wwpmHx5iR9IBn5EM=;
        b=JQ+VYszNneWq9LnVTeEUNZ2bA9JmZI8LOFjK9svc9H4hl8hRyG271LpHarvUCKIyZI
         5Vn1CBHP/6AH5rHqtPGE6/hWSk0SIy6RYK161aZhDGhYtCkOSsB2o0ayijs8INBvePS+
         ybYmPnwAbLpRLtFyM0o4EOx/Hrne48NbEWwKs3diUJ/coEGr8/xoETACnBW25DeyyWC2
         ybnkMyVu7T3nx0cFgEz9x8FtixitWLVj99q7wd/aAYhgB/uAk5tIASLlagkcZ5eA/CFb
         vVvRndH0r/gASWIjyvLt8jh52cZF67TvvoceATQn3UiM+oNvT8rjkWmY1oM8XcntVr02
         2LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192002; x=1690796802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zTxasxXedNYwr5HiD+ktCpinG7wwpmHx5iR9IBn5EM=;
        b=K9WBMbY3Pvf4fNDQWNCnOPU1h+sCWqDsu8k3wwHr4d3bmD2VUUAExtgFLG0TDYu56s
         n3qi1uLZn0SRM80o7JNjh/eUe3iOrPgr73DQPwtgzmVAFpteMN5x80u7sK9+S6Z1szk1
         3lh0HhO3iaC2oYOZsKA01VOBFzVn/7DznwV4qncaUJGtn1hsO6YFPNmdWk8g36LT6K36
         VTpxRNsahIib6OdySBbKiAijTMMsl6OMB9i8GDdtWhvNa2+quUW46nXVJucVQMeCMGCU
         bmT3fogxPuBr6+iWrnxv0p6tboU0wcFQ0LprmObCODog7rQsPaZwdBMbiej5G/prS2cE
         v4dQ==
X-Gm-Message-State: ABy/qLZQ0DgkPebBTOeQW39s5hY7EYoGPQTHAd6O8Ge5CfKJRnBCZgEE
	zwI3bZZwcK5cs+uxmMDJHXnoww==
X-Google-Smtp-Source: APBJJlEIhnQwoFDHuweIAHt2tJcWGI0d+r3I5wbhweuAT0TQly4d+VEILSYdnjVlMqhcbUSPWrZO+w==
X-Received: by 2002:a17:903:41c9:b0:1b8:17e8:547e with SMTP id u9-20020a17090341c900b001b817e8547emr12196517ple.1.1690192002389;
        Mon, 24 Jul 2023 02:46:42 -0700 (PDT)
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
Subject: [PATCH v2 08/47] erofs: dynamically allocate the erofs-shrinker
Date: Mon, 24 Jul 2023 17:43:15 +0800
Message-Id: <20230724094354.90817-9-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the erofs-shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/erofs/utils.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/erofs/utils.c b/fs/erofs/utils.c
index cc6fb9e98899..389de06e1065 100644
--- a/fs/erofs/utils.c
+++ b/fs/erofs/utils.c
@@ -270,19 +270,25 @@ static unsigned long erofs_shrink_scan(struct shrinker *shrink,
 	return freed;
 }
 
-static struct shrinker erofs_shrinker_info = {
-	.scan_objects = erofs_shrink_scan,
-	.count_objects = erofs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *erofs_shrinker_info;
 
 int __init erofs_init_shrinker(void)
 {
-	return register_shrinker(&erofs_shrinker_info, "erofs-shrinker");
+	erofs_shrinker_info = shrinker_alloc(0, "erofs-shrinker");
+	if (!erofs_shrinker_info)
+		return -ENOMEM;
+
+	erofs_shrinker_info->count_objects = erofs_shrink_count;
+	erofs_shrinker_info->scan_objects = erofs_shrink_scan;
+	erofs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(erofs_shrinker_info);
+
+	return 0;
 }
 
 void erofs_exit_shrinker(void)
 {
-	unregister_shrinker(&erofs_shrinker_info);
+	shrinker_unregister(erofs_shrinker_info);
 }
 #endif	/* !CONFIG_EROFS_FS_ZIP */
-- 
2.30.2


