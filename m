Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9B58CDC5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 20:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382540.617488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7fT-0004uT-VN; Mon, 08 Aug 2022 18:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382540.617488; Mon, 08 Aug 2022 18:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7fT-0004sg-ST; Mon, 08 Aug 2022 18:39:59 +0000
Received: by outflank-mailman (input) for mailman id 382540;
 Mon, 08 Aug 2022 18:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWor=YM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oL7fS-0004Zn-TM
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 18:39:58 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80d891d8-1749-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 20:39:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id gk3so18135001ejb.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Aug 2022 11:39:58 -0700 (PDT)
Received: from uni.. ([2a02:587:ac16:4a00:f2e5:15e2:30fb:8a7e])
 by smtp.googlemail.com with ESMTPSA id
 c16-20020aa7df10000000b0043cf2e0ce1csm4915221edy.48.2022.08.08.11.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 11:39:56 -0700 (PDT)
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
X-Inumbo-ID: 80d891d8-1749-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=cXG2+avotaR7lN8ZJi5h+68QPfMGOHqEOSY+Ekpxhkk=;
        b=AUPuDRqh7QvgRFSrJcNW7aFTiX/i95bUDjEwKNubYUe+rWVkYLTFtWobIj/okRWKRS
         7YagORddxPffepA9eXlQR9d8lprKYGSqR+oR4+8h3i+o2+POl+ttJjQQON0nzzgVJq/D
         F2sUoogK0i8uuu125FdBtJUGNkzq3NDtY+ulICkQsXiGdPNJ2T+jL+dWagAiMV9XBSLF
         8hSbO/9wkV0ShMT6kvrn+0CD3rkZQs+AYQW4KiQzRTnkKmqz4BgX5WjmTAR8xJ2XK5Ty
         l0Ki2NCZzGcSFUAxLbeDUKit2KIjtBpnMiYNrnyhjoO7aGQhNX0kTJIIb0l/owy2PpQo
         x+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=cXG2+avotaR7lN8ZJi5h+68QPfMGOHqEOSY+Ekpxhkk=;
        b=Ei8NNj/am+wXyoo5WFZjSnpvAn+FxefpaLYvBvHpKiVUhafaZ/lCowkm+HMtr82wKg
         HQAa9uhhC10moGNLrlNKqZ+GEhHERMVkTc2MIs1JYHc2/vWYLBzcrpEs1pFB221fke2+
         IiAL6sWpA4sM0FnncTGW7avfGhXY21N/O0E8LC5rEEIG57iha6nnkVr5s2Trzx/ILocZ
         qWz5SM8FR9cdvylCag6xiltcXBCYiN+gfRIbYK2WU44S5urCSpxXgKP+lcsvZkFvdt8M
         qf0ri441U4C7QU+FtZxhewucwGDIBFf8oY3Qi6XtvCHs68IIacOKIIFMzTq2tOtGvgZ2
         rR6w==
X-Gm-Message-State: ACgBeo1mdtSXoAjtqLx1aXwz9SjlE680Bz+NLTGHXt2MCdWTFT0hN7mX
	cmBqHzlAAW1mCEIYUBS9OI+Qh5HD9w8=
X-Google-Smtp-Source: AA6agR74qktu5SFIRl8fSuNICmS6rxOQBbSpfp6bo2bD51rJtNOtH4L0rllAaFBDzvQLeBy+M9iWDA==
X-Received: by 2002:a17:906:ef8c:b0:730:e4e0:1f69 with SMTP id ze12-20020a170906ef8c00b00730e4e01f69mr13118415ejb.113.1659983997388;
        Mon, 08 Aug 2022 11:39:57 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] automation: Test a pv network interface under dom0less enhanced
Date: Mon,  8 Aug 2022 21:39:50 +0300
Message-Id: <20220808183952.1888459-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenia Ragiadakou (2):
  automation: qemu-smoke-arm64: Use kernel 5.19
  automation: qemu-smoke-arm64: Run ping test over a pv network
    interface

 automation/gitlab-ci/build.yaml               | 11 +++++
 automation/gitlab-ci/test.yaml                | 10 +++--
 automation/scripts/qemu-smoke-arm64.sh        | 44 ++++++++++++++++---
 .../kernel/5.19-arm64v8.dockerfile            | 37 ++++++++++++++++
 4 files changed, 93 insertions(+), 9 deletions(-)
 create mode 100644 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile

-- 
2.34.1


