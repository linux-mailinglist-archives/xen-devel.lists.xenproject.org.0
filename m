Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C28B3A42
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712863.1113738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mms-0002fy-7E; Fri, 26 Apr 2024 14:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712863.1113738; Fri, 26 Apr 2024 14:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mms-0002df-4P; Fri, 26 Apr 2024 14:42:54 +0000
Received: by outflank-mailman (input) for mailman id 712863;
 Fri, 26 Apr 2024 14:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duI6=L7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s0Mmq-0002dZ-VI
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:42:52 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41cfc509-03db-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 16:42:52 +0200 (CEST)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3c74b27179dso1245471b6e.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:42:52 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 wx37-20020a05620a5a6500b0078eebee6a49sm6391956qkn.85.2024.04.26.07.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:42:50 -0700 (PDT)
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
X-Inumbo-ID: 41cfc509-03db-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714142570; x=1714747370; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOMN5jlc7T8BPQOIYB0DyVqcZeoBCaWIXTmwTpfNHUI=;
        b=DrDGBZIqWqzY742io31PYast7mCe38i0pKD00kyPfoPJIOnc2E8tzN18X68QD1IYCC
         QeaJNxHQIUD92tjyGY8nKj2EXYfbqp6gDCMWHS5jc1C3afJcOdjsv5J1BOS+sGCJOSEf
         Z5ftInF8BGg4YXyER5MiLcx3rV/PrN7fTqVJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714142570; x=1714747370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOMN5jlc7T8BPQOIYB0DyVqcZeoBCaWIXTmwTpfNHUI=;
        b=EG6zZX7mkOT06DWS9DlaZ+c0FftLA4f0Mz4TkQSu6295rZomNM3p2r+9fXKyC3PBXw
         Xyy4mmEVwtvUxZtD3t24r7CbEAHT+MXEQbKq5Kqqr8sSQdspCc7foqsao84aTY8DQ3e0
         EAQuLyZSaKCp5cZF4pUs1J9TXNbDlkPf93yEn96cPCPqiOaJZ9WQx7DiTqrzn86pLe1e
         RfRt8mITGdF5WQnd7f8oluP05y5G/xKy03jMWnlW6jg/Tj8dWV0rN2XnbNRdGz1+/1oW
         7R0jaNm0xmYj1dYK3nAzHkJWEAgsS+GDcRnoOw+4Nu+ueVigekjKRGshaFP1U+Awl/SE
         n2dg==
X-Gm-Message-State: AOJu0YxcrPKrVR1kIytqKe6bGW8OnHVVsvwOPkw5lxMdI3eI6oZUX7lA
	+d19RymSFociMzt+qR9X3mGGYkTWMz9ERgUi9m2a4BXSeSAMtFyp8wcr1FyU6/TOT/Csw5xHKP+
	b
X-Google-Smtp-Source: AGHT+IFwYLyt9OY/a8VOmY3F+ewt+MIk8/Z0jhRoXekHWZ9wmfsITCydef2q0mXdPDMIEAFIpUFKzw==
X-Received: by 2002:a05:6808:23c5:b0:3c8:4bd0:6478 with SMTP id bq5-20020a05680823c500b003c84bd06478mr3641502oib.25.1714142570281;
        Fri, 26 Apr 2024 07:42:50 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH 0/3] Further trace improvements
Date: Fri, 26 Apr 2024 15:32:28 +0100
Message-Id: <20240426143231.4007671-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some further trace improvements:

 - Remove the need to specify `--svm-mode` every time running xenalyze
   on a trace generated on an AMD box.

 - Get rid of warnings due to unhandled HVM_EMUL traces

 - Completely remove obsolete xentrace_format

This series is meant to be applied on top of Andy's series "xen/trace:
Treewide API cleanup":

https://lore.kernel.org/xen-devel/20240318163552.3808695-1-andrew.cooper3@citrix.com/

George Dunlap (3):
  x86/hvm/trace: Use a different trace type for AMD processors
  tools/xenalyze: Ignore HVM_EMUL events harder
  tools/xentrace: Remove xentrace_format

 docs/man/xentrace.8.pod        |   5 +-
 docs/man/xentrace_format.1.pod |  46 ------
 tools/xentrace/Makefile        |   3 -
 tools/xentrace/formats         | 229 ----------------------------
 tools/xentrace/xenalyze.c      |  50 ++++---
 tools/xentrace/xentrace.c      |   2 +-
 tools/xentrace/xentrace_format | 264 ---------------------------------
 xen/arch/x86/hvm/svm/svm.c     |   4 +-
 xen/arch/x86/hvm/vmx/vmx.c     |   4 +-
 xen/include/public/trace.h     |   6 +-
 10 files changed, 41 insertions(+), 572 deletions(-)
 delete mode 100644 docs/man/xentrace_format.1.pod
 delete mode 100644 tools/xentrace/formats
 delete mode 100644 tools/xentrace/xentrace_format

-- 
2.25.1


