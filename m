Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1899AB995
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 00:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824296.1238399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXo-0002aO-5d; Tue, 22 Oct 2024 22:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824296.1238399; Tue, 22 Oct 2024 22:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXo-0002Wk-1M; Tue, 22 Oct 2024 22:40:04 +0000
Received: by outflank-mailman (input) for mailman id 824296;
 Tue, 22 Oct 2024 22:40:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3NXl-000277-Ol
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 22:40:01 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 919d20c4-90c6-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 00:39:59 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a68480164so605473966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 15:39:59 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913076f5sm396704066b.95.2024.10.22.15.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 15:39:57 -0700 (PDT)
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
X-Inumbo-ID: 919d20c4-90c6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729636798; x=1730241598; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXoDrdl3R364cbrAZXB/HWQMQodLF4ySjTDv8eTXJOE=;
        b=mwA2TLwks37I8Aj/GAhfSbga55L/oboEf6/G9de/nmRH9sHWwL6RRu8eoTBv1txiZ/
         CBOep70idLhF/xgPPfPbEjw91br00N+LTFjoZTI1qs9vsfLyLRcpA8qrhViwa1F4BilV
         E9Lg4Po7JSkgXdubw9dY+pzncTPnyiAnLrDkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729636798; x=1730241598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXoDrdl3R364cbrAZXB/HWQMQodLF4ySjTDv8eTXJOE=;
        b=S5rHX8mZa5FgEff44D+tJpZP3wkdbUkqJJT6llrFBaJTNIWCu7K/vLdBDZGBOEBhN7
         C2M5/w5msMvP755SyMLDUHRq+7oA7d3rZ/J5l09V+uzGxCFHQ5F+uOtvsAkF8JR7Nefl
         H9K/ERQH6VzTf6czs8947A2pYK66I+9+sOsoTLxbiD0k7Ib5tW065Ub+YwalnOQceoH5
         EHwlcSt+5rEEZia9LbuV4SvegiI/P6zmFMBbbU+Bor1CAyDJmTOzhpSPcCurLlNmm6hz
         KPfwCURGGnVoPTHRUxQ+TUxSneUyd0EVVBG3EoVDVb+BbtYZqGSQH3ObTWyQF3S4QhzU
         HSDA==
X-Gm-Message-State: AOJu0YwiWRpeadFHQIZuDzEZA1r3ORY5AaqcVklr3sm6s8T5hV5DXGnT
	K3Kl49djguVKish+8qwM9TfTFUGDspz0DPm+gn6hnKkU2hQXc6t1KsMuAc+S01WvodPY9xQnRbg
	A
X-Google-Smtp-Source: AGHT+IHfW4cHyOoHj0JGVIKr2XZ/kHgLKd5FBr1wc36x8UiLD+2B9V+6sGEuMJa3swgjs5bMuG6QIQ==
X-Received: by 2002:a17:906:6a24:b0:a99:e504:40c5 with SMTP id a640c23a62f3a-a9abf8ab8f2mr49266766b.39.1729636798012;
        Tue, 22 Oct 2024 15:39:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/3] x86/boot: Improvements to move_memory()
Date: Tue, 22 Oct 2024 23:39:51 +0100
Message-Id: <20241022223954.432554-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Strip module_t out of move_memory() and simplify the logic.

This is to allow yet-more cleanup with the hyperlaunch series.  See patch 1
for most of the discussion.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1507885241

Andrew Cooper (3):
  x86/boot: Convert move_memory() to use bootstrap_map_addr()
  x86/boot: Simplify address calculations in move_memory()
  x86/boot: Simplify size calculations in move_memory()

 xen/arch/x86/setup.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

-- 
2.39.5


