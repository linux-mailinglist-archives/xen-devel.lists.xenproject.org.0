Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC189318C2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759058.1168601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOqc-0006EB-Iv; Mon, 15 Jul 2024 16:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759058.1168601; Mon, 15 Jul 2024 16:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOqc-0006Ce-GI; Mon, 15 Jul 2024 16:46:46 +0000
Received: by outflank-mailman (input) for mailman id 759058;
 Mon, 15 Jul 2024 16:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjrg=OP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sTOqb-0006CY-7Q
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:46:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0cd1938-42c9-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 18:46:43 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so560294866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 09:46:43 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc8217a4sm222304866b.224.2024.07.15.09.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 09:46:41 -0700 (PDT)
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
X-Inumbo-ID: d0cd1938-42c9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721062002; x=1721666802; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kzlwsoCWSJSbbbbdf0/ZACwS0w+qAJtUnvdnz4XCXt4=;
        b=n7Zazf3ohw9k5y5oTBe0xrzXq2ZI6RioUnAehLBzyUAZPNO/7nKazgqLxoUsHSiPcG
         VMOfChQF2Zor/kOxa8e4VB3EuS/CCLeOb72Pk0pDv1ZQnyCmMGIpIo5jG6Wg2+siMy8/
         EJShdsQg/rLejLiQScTFT7Qpuvh6TX662Qnoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062002; x=1721666802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzlwsoCWSJSbbbbdf0/ZACwS0w+qAJtUnvdnz4XCXt4=;
        b=UEmYModN0WzjgLSkxD85auo6MQZeH4eKNeWr8DZlEdyCkQVBpfqzabzEJ+GA/3Zrm+
         xqynf1JoDgU30pNZ6FmpY3hgJX4GXN20G6iWwwEE2Dz0pIlR+qPJB+lQmCQQALYaLHzW
         V2/eFcxHcD2RdpulxshegLgJ9sSt706UGGOWucWmdBCl6+AQJdbJhhaassADwvzfdF6b
         IN1tfGhPs/PWCeDmDM5LbJfG71T9NLortRLngUI0EY+eSN38uZomgdlxLlLsIQBsQMOh
         W396WKVkCwzyL0yJ/Eh/1tKSUXoUPW9UFwkTC0GhPqiW2IuSCFfGhKXzcy7/F1TGwDKr
         z92w==
X-Gm-Message-State: AOJu0YyOs2GoP2FJxqPlpK2yy+0Q4xeGFv3UvIDPUWnwRPDgMawb8//f
	M6ftFYiDdn9rw+Tg3InosN/gCFS4l1t9/Kh21TVuMGllFIX8mQeRVbvbYulB1LROvD2PDWatPBR
	0
X-Google-Smtp-Source: AGHT+IGUDrTl5k/eZQoh9FyIlly4qNABP7cwYNwEf1YnqbmIZ35vLtZ/D+xW60ac1WRlQ6RXXEsQJQ==
X-Received: by 2002:a17:906:fe0e:b0:a77:d880:2c91 with SMTP id a640c23a62f3a-a79e6a441b3mr24330966b.16.1721062002257;
        Mon, 15 Jul 2024 09:46:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH RFC for-4.19] docs/checklist: Start tagging new dev windows
Date: Mon, 15 Jul 2024 17:46:39 +0100
Message-Id: <20240715164639.3378294-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This is about figuring out when a change was first introduced.  Take
10b719dc88 for example (completely random pick).

The right answer is `git tag --contains $sha` and look for the oldest
RELEASE-$X.  In this case it's Xen 4.6, but the tags are not numerically
sorted so the answer is towards the end of the list of 166 tags.

The better answer would be to `git describe $sha` because git has an algorithm
to do this nicely.  In this case, it's 4.5.0-rc4-934-g10b719dc8830 because we
branch first and tag RELEASE-4.6.0 on the branch, rather than releasing off
master.

With 0082626f35af (opening of the 4.6 tree) containing an annotated tag of
4.6-dev, git describe now gives 4.6-dev-902-g10b719dc8830 which far more
helpful when doing code archeology.

I propose that we retroactively tag each commit which opened a new dev
tree (the commit which changes the version number)

Looking back in history, Keir did used to tag the point that the tree
branched, but that seems to have stopped when moving from HG to git.

Thoughts?
---
 docs/process/branching-checklist.txt          | 3 ++-
 docs/process/release-technician-checklist.txt | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 3dfa8ec2570b..b2bb9ac1fa00 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -79,7 +79,8 @@ The variables and there content should be:
 Where X.Y is the release version (e.g. 4.17).
 
 Update newly diverging staging (unstable) according to
-release-technician-checklist.txt section re README etc.
+release-technician-checklist.txt section re README etc.,
+including tagging the new dev window.
 
 Update newly diverging staging-$v according to
 release-technician-checklist.txt section re README etc.,
diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index e6db02b87585..7d2d90e57e7b 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -79,6 +79,8 @@ t=RELEASE-$r
 #           - xen/Kconfig.debug
 #                 config DEBUG
 #                     default n
+#
+#    - tag staging branch for the new dev window.  e.g. 4.20-dev
 
 * tag xen-unstable
 

base-commit: 1ddc8c1bad93aa6cbfe616dd72333460c47f96c9
prerequisite-patch-id: 2ea535e6248ebf47b5db0c59db0f4fcfc7a74cf9
-- 
2.39.2


