Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35425912CFA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 20:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745442.1152565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKif9-0007Nh-Qa; Fri, 21 Jun 2024 18:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745442.1152565; Fri, 21 Jun 2024 18:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKif9-0007MQ-Mk; Fri, 21 Jun 2024 18:07:03 +0000
Received: by outflank-mailman (input) for mailman id 745442;
 Fri, 21 Jun 2024 18:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKif8-0007MK-Tg
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 18:07:02 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e8f3bc5-2ff9-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 20:07:01 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso2873686a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 11:07:01 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30427976sm1244537a12.33.2024.06.21.11.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 11:06:59 -0700 (PDT)
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
X-Inumbo-ID: 0e8f3bc5-2ff9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718993220; x=1719598020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8ccN9jLjGra6aXThf/jLLz5OFdTyTcqpVE1RmNhvHI=;
        b=gfpLtprpybpzuB0dgnRkE9ZEsHUI9uqGvGWM4SLNTMgjk4ktTOLB/Wfs6jDTH+zkMF
         2KCZ+Hbnfa+AWIedmS4tDOCNvBF4lljxvTmDuaWRcYKMSVNcUb1VAdOjrVuiLICyeMZq
         87c2+zJoEM9et9BvIXeBqf0m/jzZNzBSfU7yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718993220; x=1719598020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8ccN9jLjGra6aXThf/jLLz5OFdTyTcqpVE1RmNhvHI=;
        b=ETV305S+ShP9Gq032uL68UaqntTWN/Z3M2jXyntiXucyPa2JST1giTnDsIWqSazZA5
         Y7WklopGqcrFtlmtXJL2hhED9XS7byeEBpJK22AvuUKZXjt0+LDtGzor68sgse02mhDw
         vJ8Jsuzeoik1afoNzEU8aBt7gh5oqw0C36HMi4SZjV8j0m/twh7pAE5YwzYUNyy3RXvD
         j1vW54iWLHySNQdMzgBXuWwFwrL1wB8WOyp5w1B7TQ4YdvZp2CeLHhL9AFKDetjBhFnM
         0ucyz+R+NBmlbzWpMsEgJ8hZW8WcQnmnlypL3ZfAi1MseFyotaAI4kL6lbTj+7lUjQ85
         tnaw==
X-Gm-Message-State: AOJu0Yx491av8b+D/sU6UhhY8bNZ8isYX2blESVkyL0DIoBHulzOmX6a
	jBWTwEi0QsJaZi42JyOUfZaMZAk8o73CHnlDlQVDLfYB9EgkcwIb96qB5J1wWgy/QdGYvdp4V1D
	Sg6k=
X-Google-Smtp-Source: AGHT+IHyf6QK4xAYo7do/Gh0XVopYETjVy3/AHuBLzrWRis340tLaYotXmQR+e0l52QvTeM71QEPuw==
X-Received: by 2002:a50:d558:0:b0:57d:1627:93ed with SMTP id 4fb4d7f45d1cf-57d1627946amr5666420a12.22.1718993219976;
        Fri, 21 Jun 2024 11:06:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v3 0/4] x86/shadow: Trace fixes and cleanup
Date: Fri, 21 Jun 2024 19:06:54 +0100
Message-Id: <20240621180658.92831-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches 1-3 were my review feedback to Jan's patch 4.

For 4.19.  Patch 4 (the bugfix) was Release-Acked after I posted the series
(cleanup and rebased bugfix), which suggests your happy for it in principle,
but I can't treat that as an implict release ack on the whole series.

It's a tracing fix, so is minimal risk to the 4.19 release.

v3:
 * Retain __packed attribute.

Andrew Cooper (3):
  x86/shadow: Rework trace_shadow_gen() into sh_trace_va()
  x86/shadow: Introduce sh_trace_gl1e_va()
  x86/shadow: Rework trace_shadow_emulate_other() as sh_trace_gfn_va()

Jan Beulich (1):
  x86/shadow: Don't leave trace record field uninitialized

 xen/arch/x86/mm/shadow/multi.c | 144 ++++++++++++++-------------------
 1 file changed, 60 insertions(+), 84 deletions(-)


base-commit: 9e7c26ad8532c3efda174dee5ab8bdbeef1e4f6d
-- 
2.39.2


