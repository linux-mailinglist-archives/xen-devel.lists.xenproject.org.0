Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF25684AB7C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 02:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676577.1052743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8t-0007OK-L0; Tue, 06 Feb 2024 01:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676577.1052743; Tue, 06 Feb 2024 01:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8t-0007Lj-Ho; Tue, 06 Feb 2024 01:20:55 +0000
Received: by outflank-mailman (input) for mailman id 676577;
 Tue, 06 Feb 2024 01:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXA8s-0007Lc-4c
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 01:20:54 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83e2c02-c48d-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 02:20:53 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-511344235c6so6207961e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 17:20:52 -0800 (PST)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a3726a5e5fdsm486803ejd.95.2024.02.05.17.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 17:20:51 -0800 (PST)
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
X-Inumbo-ID: f83e2c02-c48d-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707182452; x=1707787252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PFj8HgVee9CL5hZuq7phfC1KZf2NA8rTrVNFEifSRSA=;
        b=MeJl3dQjKCWjNWPLOwEG56vON5yxO35mrixTbR40Ri5eTtBRWNraaV9ixqyeIbq9xO
         SePK0pBnD4HVIu1ueTln9nEt4ZGzQQ6X+dIGR0e/mBggmotb1/hn5z8gN9hibNjiGM/T
         h9WiYISu3csH6AunmlSkwEsUPVh1fItnjrPNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707182452; x=1707787252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFj8HgVee9CL5hZuq7phfC1KZf2NA8rTrVNFEifSRSA=;
        b=kJIig/95vbBNSw9gnot71zG4nI+1qvG9/E73Zu3O300KGZJkcg1g30Av8WEGeoapoC
         m2nQ7csdrNG1nhblcZN09ehyX3VQHlZGyF8qcID25hOqYzlBRV08zyPuhYgRyR7/lOdQ
         YHVafeiwkK56LfIEgEB98qtvjPO6bGNo1ccXSYcfPKgXlAUsS6udcQsqJ8kH51xxYvHT
         tjclvCMrb2pPij2NaAGaLfMXLIALqxW6B5AtBq+tJCAn8O5ihlZgD2+RJIcAu7Hp6JDQ
         eReue0zWkU0MguyJxb2gC7qG4R4ooBXO4JFb7jRf73eqfndpGUHy5r9Q0egYI+pt68cr
         hJ5g==
X-Gm-Message-State: AOJu0YxnFxXd5ugOrDiCHHOpp4Uo1gUQg9XX5g5OBZwEcV03+4+VaJo0
	0W8E0flujNbYsWhtta45RAIz7dFdpnTtXfgc4mCCbfq0avCzX0huy1P2Vk3Solwp2PThiBVr7ZS
	D6/U=
X-Google-Smtp-Source: AGHT+IEIXw3PeeC2SheiJ2UFfimdTWI3ueOlX7KSPtKagS+F+N+GgcQi4W9jueJ7L7tA2EfS08nmDg==
X-Received: by 2002:a05:6512:318e:b0:511:5ca2:350d with SMTP id i14-20020a056512318e00b005115ca2350dmr356805lfe.47.1707182451818;
        Mon, 05 Feb 2024 17:20:51 -0800 (PST)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH 0/6] AMD Nested Virt Preparation
Date: Tue,  6 Feb 2024 01:20:45 +0000
Message-Id: <20240206012051.3564035-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series lays the groundwork for revamp of the AMD nested virt
functionality.  The first five patches are clean-ups or reorganizations
of existing code.  The final patch is the first major step towards making
the feature supportable: allowing Xen to refuse nested virt support if certain
hardware features are not present.

George Dunlap (6):
  xen/hvm: Convert hap_capabilities into a bitfield
  svm: Improve type of cpu_has_svm_feature
  xen/hvm: Move other hvm_function_table booleans into the caps bitfield
  nestedsvm: Disable TscRateMSR
  nestedsvm: Remove bogus debug message from nestedsvm_check_intercepts
  svm/nestedvm: Introduce nested capabilities bit

 docs/designs/nested-svm-cpu-features.md      | 110 +++++++++++++++++++
 xen/arch/x86/cpu-policy.c                    |   3 +-
 xen/arch/x86/domain.c                        |   6 +
 xen/arch/x86/hvm/hvm.c                       |  14 +--
 xen/arch/x86/hvm/svm/nestedhvm.h             |   1 +
 xen/arch/x86/hvm/svm/nestedsvm.c             |  22 +++-
 xen/arch/x86/hvm/svm/svm.c                   |  65 +----------
 xen/arch/x86/hvm/vlapic.c                    |   4 +-
 xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
 xen/arch/x86/hvm/vmx/vmx.c                   |  19 ++--
 xen/arch/x86/include/asm/hvm/hvm.h           |  47 ++++----
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h |   5 -
 xen/arch/x86/include/asm/hvm/svm/svm.h       |   5 +-
 13 files changed, 191 insertions(+), 116 deletions(-)
 create mode 100644 docs/designs/nested-svm-cpu-features.md

-- 
2.25.1


