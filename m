Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2691D9170E1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 21:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748023.1155572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVk-0000BZ-71; Tue, 25 Jun 2024 19:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748023.1155572; Tue, 25 Jun 2024 19:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVk-000092-46; Tue, 25 Jun 2024 19:07:24 +0000
Received: by outflank-mailman (input) for mailman id 748023;
 Tue, 25 Jun 2024 19:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMBVj-00008w-CL
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 19:07:23 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 269f10fc-3326-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 21:07:22 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d251b5fccso5689047a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 12:07:22 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725d7b190fsm180434766b.50.2024.06.25.12.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:07:21 -0700 (PDT)
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
X-Inumbo-ID: 269f10fc-3326-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719342441; x=1719947241; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pbMsYGv+JExFuhLbvU/7RxYzCy5BhhzPeqcWqtXHjNU=;
        b=DWRxCxv3nQAijocWdtHiNlKABH+S4c3eNpuIAgPsYtiibkYgBPUmsnz/syI0hTxsMG
         96XmkZYGWoK+ooackuCQoPA76cr3nUVNcFYLhx8PVTqMA5Vvrwd/cHTwds3jPFCcg2IG
         nFE6dLJQmQtualZP817cuDgBFcI3cPhAd7ncA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342441; x=1719947241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbMsYGv+JExFuhLbvU/7RxYzCy5BhhzPeqcWqtXHjNU=;
        b=Peb0zfJGKPurdnmaow+YthhZ4ydg+X0lVmvY/G+FgncpMWSMdw01Pn2QM3LfM1KGm7
         bJvni5pF7ME6L2auYxRiHyQRcCIp1Gov7ndvfLd99KC47/2VgsSHfzAGu0MKVadxkTIw
         7R08asorGIVfi2ATUnw+czBiCwlhkzkQB6TRwffbE3hFE5ojRbazpNtSKd5cd/Kp1OQo
         /p4LXhfW/oIr4jKXZGFdT8QKTl3ae4nuE454LIA3QfL5Hr91JfIduonaEvaDD7Cdan6c
         FUjSvApeqoG2yiTLXB1JEB9+W3mJhQWS00lzH8GvT0lYNCA7cIWWulllAT+gWyuRay6V
         roPg==
X-Gm-Message-State: AOJu0Yy43qPZJgbm8WSXGKkmxtsNJ5gx9m9SeVWkT9it/YN1DuaZesIE
	6yWepktK056YJGCvTmrcBuLsKZnzTnoN26z7EFIj8AO98poZ81SRTL0VVvIW90m1kvyQiCcjL1i
	X2Bo=
X-Google-Smtp-Source: AGHT+IHqWbH8dR8xfcXFpDSH3kjtcbjHnXSOkIXAllH6bLeB+ZJF32lLfEI+FkHSdX4LTTFQBaI3Yg==
X-Received: by 2002:a17:906:f0c8:b0:a68:a800:5f7e with SMTP id a640c23a62f3a-a7245b45abbmr540133166b.10.1719342441534;
        Tue, 25 Jun 2024 12:07:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20 0/6] xen: Rework for_each_set_bit()
Date: Tue, 25 Jun 2024 20:07:13 +0100
Message-Id: <20240625190719.788643-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

for_each_set_bit() is currently horribly inefficient for how we commonly use
it.  See patch 4 for details.

Andrew Cooper (6):
  x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more efficient
  xen/bitops: Rename for_each_set_bit() to bitmap_for_each()
  xen/macros: Introduce BUILD_ERROR()
  xen/bitops: Introduce for_each_set_bit()
  ARM/vgic: Use for_each_set_bit() in vgic_set_irqs_pending()
  x86/xstate: Switch back to for_each_set_bit()

 xen/arch/arm/gic-vgic.c          |  2 +-
 xen/arch/arm/vgic.c              |  8 ++---
 xen/arch/arm/vgic/vgic-mmio-v2.c |  2 +-
 xen/arch/arm/vgic/vgic-mmio.c    | 12 +++----
 xen/arch/x86/cpu-policy.c        | 10 +++---
 xen/arch/x86/hvm/vmx/vmx.c       | 61 +++++++++++++++++++++++++++-----
 xen/arch/x86/xstate.c            |  8 ++---
 xen/common/bitops.c              | 29 +++++++++++++++
 xen/include/xen/bitmap.h         | 12 +++++++
 xen/include/xen/bitops.h         | 35 ++++++++++++------
 xen/include/xen/macros.h         |  2 ++
 xen/include/xen/self-tests.h     |  4 +--
 12 files changed, 142 insertions(+), 43 deletions(-)

-- 
2.39.2


