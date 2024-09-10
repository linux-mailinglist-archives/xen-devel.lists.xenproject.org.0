Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E9973D0D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 18:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795863.1205333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XW-00078H-Ir; Tue, 10 Sep 2024 16:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795863.1205333; Tue, 10 Sep 2024 16:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XW-000759-GA; Tue, 10 Sep 2024 16:16:26 +0000
Received: by outflank-mailman (input) for mailman id 795863;
 Tue, 10 Sep 2024 16:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQ+P=QI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1so3XV-00073b-CN
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 16:16:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05832055-6f90-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 18:16:23 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c26b5f1ea6so7148323a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 09:16:23 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd468a1sm4397405a12.26.2024.09.10.09.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 09:16:21 -0700 (PDT)
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
X-Inumbo-ID: 05832055-6f90-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725984982; x=1726589782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl3liJGWcYaQpIAjKkFkrB0EMuBulEuIdxXCnKSBvoQ=;
        b=Tm2xhYfVPGVug1M57+p9x/6qOyqSUhURFBTYtX24Q+eTmx+pjjYb4RIumjkWS9lyBY
         AvZbMqbOrFH2WT9Xh7KDIz669lgpRjAMss+758Oaabnvt2DrSgLS1cnv8CuXz9P4doc5
         lwbaR8voCR69Q7VAztZOo2ipPhirROXkBG5ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725984982; x=1726589782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tl3liJGWcYaQpIAjKkFkrB0EMuBulEuIdxXCnKSBvoQ=;
        b=kttxqDBxSFsttwb9z1CQNBGviO4oft/K0uA7D0S3SgGtDnUd69E/0rL42omVHb2dNW
         7oHil6/XyTDD//fP8OfC3uXQYXITWvGk2E1njJwWMKkEN7X37lPoBTuVrs3KY1aJlu5F
         dbl5//Z52NuJCoyX27O5nyM7ZuDO4sS+pCyqypvKdfrvkBFOPf/Q/z3YKuJAcbxDN5OI
         5JmRDIaIdyu6hocbfc/zy5F7IKV4czu8/Bol+am49yQ/6PVQAEDRW+PsKvpetsH8rVUp
         VQudVGeJj7MnudiIL/6YQ4IfqWvAnHIRFZi5Decy0lyyTZLVV+lLCQOum3VfGmUgqAgg
         L+Xg==
X-Gm-Message-State: AOJu0YzhZE5R3RPVG3rqh/kewzl1UurUhUiPHqcN72s/yMOJ5jLQSdrB
	42bkjPJ+IuoBTKwKClLagm3VMyxUj7JPNMcYguMCwHJDBSOtYVxfeT75tMC/CNS5b5vnV7xgQEk
	t
X-Google-Smtp-Source: AGHT+IEnG7okpkcjp8qYBpDWEYWFYsO2PvDAXrOOQriNYEQTrLpCgTbCAEQrmA45Xr6tcGougxTL7w==
X-Received: by 2002:a05:6402:26c9:b0:5c2:4b6b:6179 with SMTP id 4fb4d7f45d1cf-5c3dc780360mr10299416a12.2.1725984982426;
        Tue, 10 Sep 2024 09:16:22 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/3] x86/boot: Reduce assembly code
Date: Tue, 10 Sep 2024 17:16:09 +0100
Message-Id: <20240910161612.242702-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications
between boot code and rewriting part of code from assembly to C.
First 2 patches rework BIOS/PVH paths to reuse some code.
Third patch rewrites EFI code in pure C.

Frediano Ziglio (3):
  x86/boot: Initialise BSS as soon as possible
  x86/boot: Refactor BIOS/PVH start
  x86/boot: Rewrite EFI start part in C

 xen/arch/x86/boot/head.S      | 288 +++++++++++-----------------------
 xen/arch/x86/efi/Makefile     |   1 +
 xen/arch/x86/efi/parse-mbi2.c |  54 +++++++
 xen/arch/x86/efi/stub.c       |   3 +-
 4 files changed, 147 insertions(+), 199 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c

-- 
2.34.1


