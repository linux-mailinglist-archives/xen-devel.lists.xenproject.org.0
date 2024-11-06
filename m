Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD29BDA73
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 01:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830527.1245552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5P-0007aU-Fh; Wed, 06 Nov 2024 00:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830527.1245552; Wed, 06 Nov 2024 00:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5P-0007W9-9u; Wed, 06 Nov 2024 00:39:51 +0000
Received: by outflank-mailman (input) for mailman id 830527;
 Wed, 06 Nov 2024 00:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8U5M-0007Sp-RW
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 00:39:48 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d0cc213-9bd7-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 01:39:42 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c9388a00cfso7070604a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 16:39:42 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d66b9sm198664166b.59.2024.11.05.16.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 16:39:40 -0800 (PST)
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
X-Inumbo-ID: 9d0cc213-9bd7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkMGNjMjEzLTliZDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODUzNTgyLjg4MjM2MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730853582; x=1731458382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5qN0JZKZ0eGrmOBrjForrxeu3WkmhK+HUk9e72Uf5k=;
        b=p/VF3u8AXFu7USiEBgW5IHqVQamiQI0XKDpZqCwHaFK9daoVl100L9n7mHvy1IciXg
         3z8oVd4vJXqsbOdz7WvaI0reL5Z1rYlUB49BLV+EFN/hD+hz+Om18RtNEujHlm9rrMw0
         dq86hjqoaOdQJge+ZgIMT1Vvl7OOUFoCSPTUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730853582; x=1731458382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5qN0JZKZ0eGrmOBrjForrxeu3WkmhK+HUk9e72Uf5k=;
        b=fP4bFF60V1xFT8oec45bk9l7Rnqn+IEfMD4yA96BP4FCzEXrY4IgH+vfwmatfBX7zZ
         9slb5cbR8H6SSGMnh/knxQ7C5WnWwkTTgRxEmlwVz+PqT8j9epNJqgld7/fHq+cSyHF2
         MqzaW2xwWUiLAD7LksTphuoyBpfRDwlaIxn9D9iw+/35/wo45KN1y9M9dGjWeL1y6XuF
         ecKTFge1CWOKyqIrNFZklGF0WX4Fagt3cyLY+sb7CSF6Q+M4OoFY+D/7OAzR58bvi/tr
         QUuoViatmSwOGMRW+YULmthYZ0FjjZtdROUGwKA781ntIiIdpOMsddTJ+oaLJUZN06W4
         mWdA==
X-Gm-Message-State: AOJu0Yxpr0FcBXq+LpFvnc2y4NiSKuhnd0MH0TMx5UE7Wl3c0Uq/vzK4
	+/nCMwqORbrbh5WOVsLR3wVfIyeJNUBJof1iAfnxY9gdl2m3VA5D2ny2ef36U82iFMwKp0CS1zC
	f
X-Google-Smtp-Source: AGHT+IEDaxrSK2PmsDczFHi7QRiDc5YMFoqoTy+KgVSbpHrVJVDmXn98Wf3ltPMTvdhi5/6Q4g0Rdg==
X-Received: by 2002:a17:907:944f:b0:a9a:825:4c39 with SMTP id a640c23a62f3a-a9de5d00e3emr4119145066b.20.1730853581449;
        Tue, 05 Nov 2024 16:39:41 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 0/4] x86/ucode: Fix module-handling use-after-free's
Date: Wed,  6 Nov 2024 00:39:34 +0000
Message-Id: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Half of the series already committed.  No other major changes.

Andrew Cooper (4):
  x86/ucode: Enforce invariant about module selection
  x86/ucode: Use bootstrap_unmap() in early_microcode_load()
  x86/ucode: Drop ucode_mod and ucode_blob
  x86/ucode: Fold early_update_cache() into its single caller

 xen/arch/x86/cpu/microcode/core.c | 313 ++++++++++++++++--------------
 1 file changed, 170 insertions(+), 143 deletions(-)

-- 
2.39.5


