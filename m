Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C2685F3F3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 10:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684257.1063983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd52a-0007gG-CR; Thu, 22 Feb 2024 09:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684257.1063983; Thu, 22 Feb 2024 09:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd52a-0007eg-93; Thu, 22 Feb 2024 09:06:52 +0000
Received: by outflank-mailman (input) for mailman id 684257;
 Thu, 22 Feb 2024 09:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rd52Y-0007eV-KV
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 09:06:50 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b66e2838-d161-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 10:06:49 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d23a22233fso49256691fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 01:06:49 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ch19-20020a5d5d13000000b0033d817eddd3sm4414473wrb.13.2024.02.22.01.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 01:06:48 -0800 (PST)
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
X-Inumbo-ID: b66e2838-d161-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708592808; x=1709197608; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXk63syKH0DiHAkRMGb27p2YfWstaLmmfAzDV6w563M=;
        b=cyY/k7EUt/NzYPmsYzD2wXMMh22YOngpoGuwQ3Nil/hfeyS7IQU/soukRf6n+BP7d2
         o11Q3VFW2becoV8H0NngZ8WHKeoL8+/WT+X9ii/Uv4rqhRvwvvOsX86s2paGH5My1UAd
         7GRk6WqDf2c0qZP9tXTfcb8z7Qy2OUMi5QvcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592808; x=1709197608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXk63syKH0DiHAkRMGb27p2YfWstaLmmfAzDV6w563M=;
        b=GDsmp61BihovjdQTUFiX+KsJkHDApsDDstBQG6NxgD0WFbPMaCgLuTR5LA3YiBl5le
         fCKGaYWeQq+mhwiB3GHrzXdWaBLrD3NpF3qyVjH9NcKofdALtdEh9uU5OvtLllDupGdF
         u5fgAta14Rb6iWBOrvRZ96TcFN+TtmElC7IzKIp0TSe1TuGSxaf+uPBqqDJpLAWFTFJz
         D5B7+vXoELNEmA/4SBsfCNX8fa2e7tEl3QoMYrZ719KlYosibd7RloABipzCAYjdLHPp
         qbJn8ycpQowOCIwH1GviPcLuzpayr089dmnzglWJGvAzrKI2QAyAO5U82mQUUtJjOfTW
         r+Ng==
X-Gm-Message-State: AOJu0Yz9dB7o9yRVY1qipXqt1ctJBADh4yAMzvPMljlxL4TTQ/OgJiXd
	Ic+NKRbqaLP1FZ0jpuvb51YprSCHU5mEGnszT8xJypEBc/Z9rlpBHLpM/6L4zLs3Gj4NT4vo5ro
	P
X-Google-Smtp-Source: AGHT+IEdpaCEOWZ2GcD0LzLeBwXq+tsb4ah3z17bTN9fnrvDf2wCOma5A5FTrXnzls7Y9z7/MtSVlw==
X-Received: by 2002:a2e:8ec9:0:b0:2d2:500a:1dd with SMTP id e9-20020a2e8ec9000000b002d2500a01ddmr3639377ljl.23.1708592808612;
        Thu, 22 Feb 2024 01:06:48 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] xen/x86: cmpxchg cleanup
Date: Thu, 22 Feb 2024 10:05:28 +0100
Message-ID: <20240222090530.62530-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series replace a couple of cmpxchg loops with an atomic inc.
The usage of such loops probably dates back to 32bit support, which
didn't have an instruction to do an atomic 64bit addition.

Thanks, Roger.

Roger Pau Monne (2):
  x86/memsharing: use an atomic add instead of a cmpxchg loop
  x86/hpet: use an atomic add instead of a cmpxchg loop

 xen/arch/x86/hpet.c           | 6 +-----
 xen/arch/x86/mm/mem_sharing.c | 8 +-------
 2 files changed, 2 insertions(+), 12 deletions(-)

-- 
2.43.0


