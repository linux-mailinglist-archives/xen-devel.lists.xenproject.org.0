Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E29C1C35
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 12:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832462.1247766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE4-00062r-Bm; Fri, 08 Nov 2024 11:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832462.1247766; Fri, 08 Nov 2024 11:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE4-00060r-7x; Fri, 08 Nov 2024 11:32:28 +0000
Received: by outflank-mailman (input) for mailman id 832462;
 Fri, 08 Nov 2024 11:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9NE2-00060f-NJ
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 11:32:26 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f1d1f01-9dc5-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 12:32:22 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cb6ca2a776so2970988a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 03:32:22 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4b90esm224837466b.65.2024.11.08.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 03:32:21 -0800 (PST)
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
X-Inumbo-ID: 1f1d1f01-9dc5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFmMWQxZjAxLTlkYzUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDY1NTQyLjk4NDkyMiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731065542; x=1731670342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5GMxLpSdX/qKdomxrV7skRI1u0DIRvFBG4c4tYQWUrQ=;
        b=pIax7XgK5sXT5+A4nUWfGLYT4BgwobalGsei0/NjPz4EdaAgR0JvPqCXIoW7nRJs3w
         Z/kVPGTTLAgd53Az6BBv5k7I+qt/DImKulDbcgY5Ga5cxbDGfyfQ51wWUPah5QKCCOAR
         80oleDYPTlekpstbAuFfmHWgyB/fx1lva9KWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065542; x=1731670342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GMxLpSdX/qKdomxrV7skRI1u0DIRvFBG4c4tYQWUrQ=;
        b=UbSbmzkV0wggDVMFAkk4c9BK33ft9QLhCmP5M2fMeH4ZD8D5oYljdi6wrcoQv0Ey5v
         ehkkr5pfF20yLtWMs5Np7bxbor5AwcH1APBcv2lFX8sENV0dwlZWPh+xOopnSv//Hhrk
         /ZkYJMoCJTzHOzU6gUotYd5F/k67edhNS3ZcEIUy8o2Qi7fgwa6m9TpiOT8N2NsZIQDz
         TWyh1ZmJZzxii3wViJETl23W3HL6/pMIR/TBmFn+oMnwzeGzDfjEK/cYCT3pDqVhF39e
         OSxeXQWEW+NgYlpzaD0y48cwq7FGqEk5d5KRCQc8BIuLKKsqXs/6zwiFsmS2ClaGykUW
         Apew==
X-Gm-Message-State: AOJu0Yyo+7A5UJDj3S0b0InFDczk0MJ/N1SdrwvYxy5KswhcrYz5DPkO
	ydfLJwMo/g3hU0tVIz2fFPwRV7N3dCJ5weXuLxrdhI1nLJyQZhXC9cSIkCGYCUgCjLVskVzFERK
	z
X-Google-Smtp-Source: AGHT+IH+l8YC9ByJg3VKrS3n3vRH/yFhzouzPcHReqanIT966AqxnixfAjMyhUZyRFSu67t9Bk2FTA==
X-Received: by 2002:a17:906:dc8a:b0:a9e:b471:8006 with SMTP id a640c23a62f3a-a9eefff13demr182493066b.43.1731065542060;
        Fri, 08 Nov 2024 03:32:22 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/4] x86/mm: miscellaneous fixes
Date: Fri,  8 Nov 2024 12:31:40 +0100
Message-ID: <20241108113144.83637-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The attempt to fix destroy_xen_mappings() so that L2 tables are
consistently freed uncovered some errors in the memory management code.
The following series attempts to fix them.

All patches except for 4/4 are new in v2, and 4/4 has no change from v1,
hence kept Jan's Reviewed-by tag in 4/4.

Thanks, Roger.

Roger Pau Monne (4):
  x86/mm: introduce helpers to detect super page alignment
  x86/mm: skip super-page alignment checks for non-present entries
  x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
  x86/mm: ensure L2 is always freed if empty

 xen/arch/x86/mm.c    | 30 ++++++++++++++++++++++--------
 xen/arch/x86/setup.c |  4 +++-
 2 files changed, 25 insertions(+), 9 deletions(-)

-- 
2.46.0


