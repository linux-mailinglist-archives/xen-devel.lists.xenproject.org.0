Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07529D23AA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839919.1255704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZP-0000ef-Ss; Tue, 19 Nov 2024 10:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839919.1255704; Tue, 19 Nov 2024 10:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZP-0000cn-Px; Tue, 19 Nov 2024 10:34:55 +0000
Received: by outflank-mailman (input) for mailman id 839919;
 Tue, 19 Nov 2024 10:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDLZO-0000aC-BI
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:34:54 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7ff7b4f-a661-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 11:34:50 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cef772621eso6748813a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 02:34:50 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfe03b9361sm543764a12.15.2024.11.19.02.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 02:34:49 -0800 (PST)
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
X-Inumbo-ID: e7ff7b4f-a661-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU3ZmY3YjRmLWE2NjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDEyNDkwLjc5NDM1OSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732012489; x=1732617289; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWIEaF0pIOGoMGuUwO2yTz5fJjNUFYhP2+XJD3Uj0QY=;
        b=TuFZMo33CjvkGr4/eljJAus42YbJh60xUjxo6ovx9R4NeX/A/uH0aaOErsbj42Yxc/
         Fgw9xGuUyFijesEc2vGb98XvbQF+5s59K9uvgq5GX5nxjwdhP3A8RH/Ruz5ePbC6ZcHG
         dnXxXSeuz7EY3Fg/PSIekTRLybTFqPhR5FqiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012489; x=1732617289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWIEaF0pIOGoMGuUwO2yTz5fJjNUFYhP2+XJD3Uj0QY=;
        b=Jfv2dDlNyDbIrnrcQfnVngkWrx+bvQcxuf5jM/FcMauIMaTrxn4CjJlIQD/rxI8xZq
         evxYTxTP/keM8kkuXxKLASQ8X5jc0lgg94VHo7l5pbnmwZFwrA45Y713/wXJfha8Zkbi
         1s4SZtsHln9At91llzEF0vU76ijqe3LAc6HIq8YJTsm7gBaXeczDByZ8NJSwiGb9H/tJ
         P2qMZk06nUCP3iO+hhZhAjN3HlyiM405liHmtBzF3giVVKk3nDgzYmWlGrzEr18dOANQ
         8QLo+zXX4Q/GRKJZGBASn5VCTtDjxS7mMhelUP6vHsnotk6evW7n4r+SLgD++iN9xPpL
         oOvw==
X-Gm-Message-State: AOJu0YzutMzeEdWAC6/49NHxUNVSAT9B4g+FZswLHcJlQuDPX/nkz1p9
	MpLZo/LMGmTglD+jTdbDfsSGHgsvgjcFKw8ICbBbQoQbbfV6dxXcrszwNMTDtVUd1hWDTyf8GqM
	A
X-Google-Smtp-Source: AGHT+IGoCxafmqm7nzSMJXgyGB1Y4iqllqiT9gxA119RwhYY+xc3nQo7PcxGx2C/UI+AMEi494L8tA==
X-Received: by 2002:a05:6402:135a:b0:5cf:b995:112c with SMTP id 4fb4d7f45d1cf-5cfb9951349mr6136286a12.31.1732012489487;
        Tue, 19 Nov 2024 02:34:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/4] x86/misra: fix remaining violations of rule 20.7
Date: Tue, 19 Nov 2024 11:34:40 +0100
Message-ID: <20241119103444.23296-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series attempts to fix the remaining violation for rules 20.7,
and as a result make it blocking on x86 also (as it's already the case
for ARM).

Thanks, Roger.

Roger Pau Monne (4):
  x8&/mm: fix IS_LnE_ALIGNED() to comply with Misra Rule 20.7
  x86/msi: fix Misra Rule 20.7 in msi.h
  x86/uaccess: rework user access speculative harden guards
  automation/eclair: make Misra rule 20.7 blocking for x86 also

 automation/eclair_analysis/ECLAIR/tagging.ecl |  3 +-
 xen/arch/x86/include/asm/msi.h                | 35 ++++++---------
 xen/arch/x86/include/asm/uaccess.h            | 45 +++++++++----------
 xen/arch/x86/mm.c                             |  2 +-
 xen/arch/x86/usercopy.c                       | 26 +++++------
 5 files changed, 52 insertions(+), 59 deletions(-)

-- 
2.46.0


