Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036519C8D72
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 15:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836524.1252419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIY-0007N3-RZ; Thu, 14 Nov 2024 14:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836524.1252419; Thu, 14 Nov 2024 14:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIY-0007KN-OW; Thu, 14 Nov 2024 14:58:18 +0000
Received: by outflank-mailman (input) for mailman id 836524;
 Thu, 14 Nov 2024 14:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBbIX-0007K6-0z
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 14:58:17 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deaf943d-a298-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 15:58:12 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso131186466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 06:58:12 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e04676csm71508766b.157.2024.11.14.06.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 06:58:11 -0800 (PST)
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
X-Inumbo-ID: deaf943d-a298-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRlYWY5NDNkLWEyOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTk2MjkyLjgzMzQ1Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731596292; x=1732201092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCwomx5oWlO9wzXtDz6ZAqMPkfB4MOVjmOfc5ylfA5w=;
        b=cP/lkVHoUVliE9szsfk2lW7eOv23P50p3A6Gw4Oxwl+emXBvJC1LJ2DPvB1xeSAyCJ
         5qazQtW12HzNA7gHm3x/VTr3G5YszJ4ubnumFmPdeWjcF9zzKj+G/71aSs2oVT3Jw0AG
         1G8YAUVXiIQoYepe/UoKRHhbdg3hFkzIc1PFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596292; x=1732201092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCwomx5oWlO9wzXtDz6ZAqMPkfB4MOVjmOfc5ylfA5w=;
        b=P8D9oFbdLr/wyZg2ie5Tp0oXKhEv4c/QhLJ4en5BPedn1FXbGG1KJOt8ZHv2XY8XDf
         3LKbYMgPwxtIo0IM/JRNZgP4d0qJqP0DaEYTccr16shWXHWU57uCPjqBgNe2o42fMbo4
         /cnQuuOjqS9eGfpkGJdWJgccVnTChC0jltcT6Zzx0jv+6fNvWmRb6LFOaA3l8utbUXp2
         7uArjrqJl/r/J52UFVXrOVMklqXSM+GyK+SQe7NbaHly3wOLl94GcXg37T8O2Yv56gGq
         MuxiElSL0OTJL2AJEn15+J5xSlceFIUiSS2DicUfFPHQ6o61Xkky3tI6sBrbYpBHUuh2
         3vcQ==
X-Gm-Message-State: AOJu0YylpOxZw3/aB1VL7O1h8PJMKU2yHeDoEpQrYcktYEODhb13AVsC
	YwhG+IavjaPG3zBf8W7IW/KjQGO+48gF2LBSRWNy3K4/pDeA8RipRXaIrs8dRG9YjsMB/OZFN/s
	K
X-Google-Smtp-Source: AGHT+IG5kd+2M59kuF5D4Q+iisSIKim4XR0z0mBjGlBgQowljIJ4vjkj6a2zuc0j1WQTclCGlNc9Bg==
X-Received: by 2002:a17:907:3e9e:b0:a9a:8674:1739 with SMTP id a640c23a62f3a-a9ef0008cf0mr2359333466b.53.1731596291895;
        Thu, 14 Nov 2024 06:58:11 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/4] x86/mm: miscellaneous fixes
Date: Thu, 14 Nov 2024 15:57:11 +0100
Message-ID: <20241114145715.59777-1-roger.pau@citrix.com>
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

 xen/arch/x86/mm.c    | 33 ++++++++++++++++++++++-----------
 xen/arch/x86/setup.c |  4 +++-
 2 files changed, 25 insertions(+), 12 deletions(-)

-- 
2.46.0


