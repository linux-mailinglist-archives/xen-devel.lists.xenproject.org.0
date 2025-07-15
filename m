Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D17B053A9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043639.1413640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaRJ-0007EE-In; Tue, 15 Jul 2025 07:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043639.1413640; Tue, 15 Jul 2025 07:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaRJ-0007Bj-Fa; Tue, 15 Jul 2025 07:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1043639;
 Tue, 15 Jul 2025 07:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tvk=Z4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ubaNI-0003TX-0A
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:46:52 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe07866-614f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:46:47 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so50511785e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:46:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e1e2cfsm14233198f8f.75.2025.07.15.00.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 00:46:45 -0700 (PDT)
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
X-Inumbo-ID: dbe07866-614f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752565606; x=1753170406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8fFwOFkatgpf2W8ouBTkbV3BvmNFHlLMACaphRwVMI=;
        b=DtXcma6VX6p2P09Lp7u0tJX3Yyv9fkiktZbRuc8+oo1N8kUgZhLwb1FgWS9AMTtCeq
         r2EUzKCBH6+d3ULKzLlFn3Jr1M2DdaOA140qERN/y6A5vB9deKsecUH8XxZSJiESpMGy
         mhL6lU/xqpErJlxICZFBecSro1Hz6+ZR9j6rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752565606; x=1753170406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8fFwOFkatgpf2W8ouBTkbV3BvmNFHlLMACaphRwVMI=;
        b=iCSXbHEbjV57OkGjUD0d1//Y5HNeqpE7D7xnJcWMKY0uN7HM4lZo7xvYPXBlQCE+5D
         4qgmcfGaElaIADLKfDzTLDDxgRVN9iYLS1Gu3pS/4ZyBNit96x47KBlrj7+KO8OOif7h
         5CnurWc8gQasbRHThCNYwbB9PgFDHlYqrEbNfdr0XEBQp2YCx6kWjIFtXVweQ0m4o2Xr
         DORt4oht2OKzCWA+duWFKIOSlw33FXl2N30FlAEAwekUpjoi6oNG981d2MKaE9SAQz1M
         6ikEbkeRy8JEfV6Yn2P/mT+v0m8adCPvX1rRly2zg/7RN79JMl1PF4JoL1yFOZJI0Czj
         hn6Q==
X-Gm-Message-State: AOJu0Yzg90/TrlqW8KB7jwvxuZcrt2Nq9EcU6ga5bBGaJsZZGb0Q7ysR
	6xB0GFpev41we7a5A1nkvDi48tcSfXZ/6Cj2l5iwrpUcaLfCWZ6WlnKL2GLy5kRM+/3n1Yex9GI
	8yt1e
X-Gm-Gg: ASbGncvwjTq/qTE9//tX4TYBHYh3WTdK6jnspF4OkTNm/sxGyGzGFYrCQ+pISDVspf0
	DB9pu+4R8VJfibagK7uNeRHZRVTA+633vUR1KpSI+yqslg6Vd1kEgFn4c9UUWoCzJhfDTAmJXp+
	y7wvlRDFlmkIPwlhTSpkA3Cb+uX8vv/6FSyO4ZiYQ90OK/4hf5XUNYwCxwQBqre8dUy+AdKL6jv
	hBVEfQoxHtr+/q2TzawZIMiTpmTTS/qs2YqpHxJRoB1aDDL+u7ew+vOaHAW22ba9lEsq5WWeGw7
	RTIReg3ujH03UfFJRg5ZnMGoedv/aiLQd3Hnyf+Yf2sbPsJoA7xQoLWo7YYIHvsmGxo6aDqsKJw
	oxBW/Wbpd8UILdcfDSHmrQXWBIXZYOHRuvBPRgZboxTtQu2hV+VIIMmlwhRyh6tJVkQ==
X-Google-Smtp-Source: AGHT+IHfVazl7LDDwGfAyJJrq/hJ0jgW7cm2+JS64JMMnh2m2bA0r4pUw/LytqYAn3BfrBPSEwEt+g==
X-Received: by 2002:a05:600c:3b17:b0:455:fc16:9eb3 with SMTP id 5b1f17b1804b1-455fc16a2ccmr97527605e9.33.1752565605882;
        Tue, 15 Jul 2025 00:46:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/ept: batch PML type-changes into single locked region
Date: Tue, 15 Jul 2025 09:45:57 +0200
Message-ID: <20250715074559.73197-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series attempts to batch PML related type-changes into a
single locked region, so that the lock is not individually taken for
each gfn that requires changing, and to also defer the EPT flush until
all type-changes are done.  Doing an EPT flush for each gfn changed is
extremely wasteful

First patch moves the implementation of vmx_domain_flush_pml_buffers()
into the EPT file, so it has access to the mm locking primitives.  Patch
2 introduces p2m locking around the type change loop.

PML related code is already split between EPT and VMX, it could
certainly do with some cleanup.  The patch here doesn't make things
better, but I don't think it makes them any worse either.

Thanks, Roger.

Roger Pau Monne (2):
  x86/ept: move vmx_domain_flush_pml_buffers() to p2m-ept.c
  x86/ept: batch PML p2m type-changes into single locked region

 xen/arch/x86/hvm/vmx/vmcs.c             | 59 +---------------------
 xen/arch/x86/hvm/vmx/vmx.c              |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  1 -
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  1 +
 xen/arch/x86/mm/p2m-ept.c               | 65 +++++++++++++++++++++++++
 5 files changed, 69 insertions(+), 59 deletions(-)

-- 
2.49.0


