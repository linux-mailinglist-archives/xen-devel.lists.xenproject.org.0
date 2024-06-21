Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8769912F09
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 22:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745566.1152695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlKg-0005lx-H2; Fri, 21 Jun 2024 20:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745566.1152695; Fri, 21 Jun 2024 20:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlKg-0005j7-Ds; Fri, 21 Jun 2024 20:58:06 +0000
Received: by outflank-mailman (input) for mailman id 745566;
 Fri, 21 Jun 2024 20:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKlKf-0005j1-UG
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 20:58:05 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3ae7ebb-3010-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 22:58:03 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57d1782679fso2875778a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 13:58:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042d509sm1440011a12.43.2024.06.21.13.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:58:02 -0700 (PDT)
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
X-Inumbo-ID: f3ae7ebb-3010-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719003483; x=1719608283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Lzo3JDUF518si0KUt6/S/krRvZgmKUoFzznxiBo0cw=;
        b=H5WAJJ8I9+CK85Efws9INeRgP8ZByChnk36YYMA5qdF0UR4NN7h4te8hY9soZ/jVar
         xo9oU8XorpvSqaEcAbsUU7RbwEgMjLvtlRX8Jve3tUOVBlhUoAXMoNQDaH94nEt+XUzX
         AlYYJVdE9M9ieg0XwPCRFVQWZNN/02BGBQQkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719003483; x=1719608283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Lzo3JDUF518si0KUt6/S/krRvZgmKUoFzznxiBo0cw=;
        b=Wew6e48ZeTkd4bglva6qnKHhX5is7UI0maFlfnAc9ngDTL3T2/IOlTajZtcTdv8K0x
         EbCaDyqmrFPibPEuT6pXwmtEm07aNLUSZlvbIh/GtJhtHn+NEQ82LYtdj1YjCP0xzOR+
         V5APGebSr4kd1DmeJsLvvuM6Sy5UgdPpJp+Ft1F+Qppv3TVJYnwYyZ0vIUbTvineU8BP
         tJFZ/AIPpkwiV0T9OIIRg8o1LtiCmibiu4jUgYpOJkIZe30nupaJQAWJnaZEAKCEeK9g
         XmiyalfAwMC69cV9PG12MWbFLh2aPP9TvOoYX6w7ebD4Kp0h7nAp1x5OB8/T8a7eUhr/
         0h8w==
X-Gm-Message-State: AOJu0YyrwiMZxtDDbrgkvKrqaS1VSnpRit1Y3DPSQj1LhUBrabZzuvN2
	q25Rzq4m41QwZxcCFy0i33ZeyA/vJCZvkpqAdWWp1rXM+/PVRqMQNG7g/KkSHEjVe8HSd5Hbhmi
	Samk=
X-Google-Smtp-Source: AGHT+IEqP6gWYL+pJI8eWgZrb14yjcaQKCCUMGwvzUu4l5FTKxFmFCmDwrUToqzZHEl19UuNmy3XZw==
X-Received: by 2002:a50:d707:0:b0:578:56e1:7ba3 with SMTP id 4fb4d7f45d1cf-57d07ebf183mr6586536a12.38.1719003482733;
        Fri, 21 Jun 2024 13:58:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 0/2] Xen: Final MISRA R8.3 fixes
Date: Fri, 21 Jun 2024 21:57:58 +0100
Message-Id: <20240621205800.329230-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This gets Xen clean to R8.3 and marks it as blocking in Gitlab.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342755199

Andrew Cooper (2):
  x86/pagewalk: Address MISRA R8.3 violation in guest_walk_tables()
  xen/multicall: Change nr_calls to uniformly be unsigned long

 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
 xen/arch/x86/include/asm/guest_pt.h           | 2 +-
 xen/common/multicall.c                        | 4 ++--
 xen/include/hypercall-defs.c                  | 4 ++--
 xen/include/public/xen.h                      | 2 +-
 5 files changed, 7 insertions(+), 6 deletions(-)


base-commit: 9e7c26ad8532c3efda174dee5ab8bdbeef1e4f6d
-- 
2.39.2


