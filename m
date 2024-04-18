Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B317B8A9F21
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708493.1107450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU49-00049e-Pd; Thu, 18 Apr 2024 15:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708493.1107450; Thu, 18 Apr 2024 15:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU49-00047M-Ml; Thu, 18 Apr 2024 15:52:49 +0000
Received: by outflank-mailman (input) for mailman id 708493;
 Thu, 18 Apr 2024 15:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0X1s=LX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxU49-00047G-8J
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:52:49 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4084cd3-fd9b-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 17:52:48 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-78ecd752a7cso69878485a.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:52:48 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 z3-20020ae9f443000000b0078ecc43a45dsm741147qkl.92.2024.04.18.08.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 08:52:45 -0700 (PDT)
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
X-Inumbo-ID: b4084cd3-fd9b-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713455567; x=1714060367; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwgIViGviH2ySrxNQOTQAavkytQdqdPCI6ghOt6q6OE=;
        b=uOz71QSihnKY4lr/KPNH7xCFMDCwOFtE3D43LGGKAkjGFh0GsGkOU336x4ZPyAVYzz
         rDcnQCPNsEuZD7fSAWS1vyirA7Li/P6elTcBqVp82PG/HLTPm6dtZysrHm3rNwMXn39Y
         E014uZX9EnBOE3/7pvwgPJFKzySMLJRQgUAY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455567; x=1714060367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwgIViGviH2ySrxNQOTQAavkytQdqdPCI6ghOt6q6OE=;
        b=Ipiw3SMcIKIRl/bXsjVahLrutOCa2mxYumWh0rdTKc4p+Kt07e8f/NJ0W5mrBXO/lW
         TQA8Gbu8ROHCggGw6RtS67wsw7pr4xWvn14g/3tI0S4b60RivLJq+1aokKrGLUBXTYap
         tEo6S0wMWXVL+Zkq/hj1K/qxKWCDU+97lpvV7HxKvKrZTli6OmvjhivxcQ4L92g9AEpw
         SQ6ecMokykHWtXjaV0EnCpkWR9e5tbYMYAGVWYEA6kYMz2GFbls7a9lQcrZtxlEXJ/xN
         JfSjFTFdV/LtCaP5nk+mkJHLVCqFplE2vlqGDLPp2uzccrFhhpA5ITBhB4BdyGR8YdWH
         uq+w==
X-Gm-Message-State: AOJu0YynxDlZcYJ9+XJXBPrZPbt+xnPYNG5m2KX6k85oON57QE39Kmju
	jIGnMKMcKSkd1dzT5Z/xsjWSf4pcM2ISkuPwgvfXzaHrk/EE6jue8+JSVHU8Vg9LZoU2qfCiH7q
	T
X-Google-Smtp-Source: AGHT+IFA8B+P5k3qQLjzPXRqKuQVwQSS0M3Qg+bFS628NQG/pWdCeObSggyoobWWpyUJ/52NK8lnfQ==
X-Received: by 2002:a05:620a:4d19:b0:78d:68c2:a02b with SMTP id wa25-20020a05620a4d1900b0078d68c2a02bmr3507655qkn.19.1713455566881;
        Thu, 18 Apr 2024 08:52:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/2] x86/spec: misc fixes for XSA-456
Date: Thu, 18 Apr 2024 17:52:06 +0200
Message-ID: <20240418155208.7771-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Fix patch fixing the printing of whether BHB-entry is used for PV or
HVM, second patch refines a bit the logic to decide whether the lfence
on entry can be elided for the entry points.

Thanks, Roger.

Roger Pau Monne (2):
  x86/spec: fix reporting of BHB clearing usage from guest entry points
  x86/spec: adjust logic to logic that elides lfence

 xen/arch/x86/include/asm/cpufeature.h |  3 ---
 xen/arch/x86/spec_ctrl.c              | 14 +++++++-------
 2 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.44.0


