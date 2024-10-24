Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9559AE5F4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825236.1239424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn6-0004Rr-Ao; Thu, 24 Oct 2024 13:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825236.1239424; Thu, 24 Oct 2024 13:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn6-0004NE-7E; Thu, 24 Oct 2024 13:22:16 +0000
Received: by outflank-mailman (input) for mailman id 825236;
 Thu, 24 Oct 2024 13:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3xn4-0004KA-Qf
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:22:14 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa885b71-920a-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 15:22:12 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9709c9b0cso1187339a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:22:12 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm618574766b.79.2024.10.24.06.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 06:22:09 -0700 (PDT)
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
X-Inumbo-ID: fa885b71-920a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729776130; x=1730380930; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykr42/7dHtTL2o2rYQkH4Jz9cqJm/SLAhBttv+V4jsg=;
        b=RgrdLOZfViECYrXlqNPIgVTOOJ8V6Mr8iXm0GQki9tXb3MB4fGMRcAgI7OhMpp9LMm
         r8tnm8J/n7POpLt5BxVMRm+V508R7gDEB2LTKGmsWbRthIYm7KOruMTqsBwV28I1j05s
         RKuY8mYOSLq44+aIuVwP9Uh+UOcUpo+62NczU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776130; x=1730380930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ykr42/7dHtTL2o2rYQkH4Jz9cqJm/SLAhBttv+V4jsg=;
        b=scnhcbGP9zd/Gmf3t77d/nVzZgcEdyPX5jSpBfrjb3YFoScGOwTbXWgQrC3pOvoCKj
         wMO+9uAMatdOw2KKzyalAVvkU6lfzsbGdArG7nOeuvqie+Nf8zSaQKN+0UgLOhqKcvA9
         g+4BJ5GpL6WER3+fRdfbGOoeXtA8lq1hWP2NcDuJsfLKnezV/fZ53IBbOL0Lb1SVN3lZ
         ZtHB5OdEQXNdaeY+FT0/hhiRe6AC0Uazv9EYArswyllFCbtlFmi7vfAlG2W7bA30QsVo
         8sJJ93HOlylH/lsHp7hpVlA+1n4F+ch/1Jue95BZM9a0B6lTqIAmFA52RDPx8b+IiDQB
         8Rrw==
X-Gm-Message-State: AOJu0Yx+dROZU0nw2MagYIgHZSM7/wof+sWZFJ5WCznoywKx4govF0/K
	FVCWEol/gaDrK5Y0zsDx4n7sH2lyoYS+C7O7gSms4sHJJVTjmBI6rB5C/I9E2lLRDGAhznEqH5c
	n
X-Google-Smtp-Source: AGHT+IEim2obKtTdkCnQF382TRS8GO1stC987JUn64dkgTVy8taPpJ3AarX5JK733jdbSEGrrMAC4g==
X-Received: by 2002:a17:907:ea0:b0:a99:4162:4e42 with SMTP id a640c23a62f3a-a9abf8ac2acmr487415566b.37.1729776130372;
        Thu, 24 Oct 2024 06:22:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/5] x86/ucode: Minor cleanup
Date: Thu, 24 Oct 2024 14:22:00 +0100
Message-Id: <20241024132205.987042-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Misc cleanup without functional change.  Mostly to improve clarity.

Andrew Cooper (5):
  x86/ucode: Rename hypercall-context functions
  x86/ucode: Drop the parse_blob() wrapper
  x86/ucode: Rename the cpu_request_microcode() hook to parse()
  x86/ucode: Rename the apply_microcode() hook to load()
  x86/ucode: Drop the match_reg[] field from AMD's microcode_patch

 xen/arch/x86/cpu/microcode/amd.c     | 11 ++---
 xen/arch/x86/cpu/microcode/core.c    | 72 +++++++++++++++-------------
 xen/arch/x86/cpu/microcode/intel.c   | 12 ++---
 xen/arch/x86/cpu/microcode/private.h |  9 ++--
 xen/arch/x86/include/asm/microcode.h |  4 +-
 xen/arch/x86/platform_hypercall.c    |  6 +--
 6 files changed, 59 insertions(+), 55 deletions(-)


base-commit: a974725a87a1afc8056b41c56dfe7fe272a7169c
-- 
2.39.5


