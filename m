Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CEC841F01
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673240.1047525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC1-0004kt-Qx; Tue, 30 Jan 2024 09:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673240.1047525; Tue, 30 Jan 2024 09:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC1-0004iq-NR; Tue, 30 Jan 2024 09:14:09 +0000
Received: by outflank-mailman (input) for mailman id 673240;
 Tue, 30 Jan 2024 09:14:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUkC1-0003rb-1g
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:14:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebc5820d-bf4f-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 10:14:07 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ae6dfa923so1503781f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 01:14:07 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 d15-20020adfa34f000000b0033ae9f1fb82sm5906697wrb.48.2024.01.30.01.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 01:14:06 -0800 (PST)
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
X-Inumbo-ID: ebc5820d-bf4f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706606046; x=1707210846; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtnI0ArNNGn8mHTAN4YpKUsNgliWeQS0TTFhgfGDasM=;
        b=acnxfckmt750nphCfdgPkmUygPEYvFVsyIV0tTq2xN50BhtXYLcChBT3Yl/JB0h8iA
         6J6BmMmgVVVM3TmmczhFuSVSAd4Wd4w0RKLr+jt+03jfJpB0O815d8uqI593gMzz/wI9
         wvQv8nm9rf7TvZGAqIprr6vPHGRj2sVYvkL8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606046; x=1707210846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtnI0ArNNGn8mHTAN4YpKUsNgliWeQS0TTFhgfGDasM=;
        b=Um9U1R1L6gVRDYI9sD1b/yyzhOcJbdMbDHZqbbEq1PZBBQxTMPE19yDmgpsO+bJpx6
         q5nBVCtFZIjAwZ4JUnIQJCsBd5Huc/SSUkzE1D34MX7iZJDb9ha0awN+39gT1R0wHL3U
         5B1zknlrMSgtDR+EhrVsxU5Pc6AgjQm845NfYZFJpNSnvF2Q0BDjAbN8okoMkw2JSkFm
         YRaUa9t7G2GVrTlFokG8vHlLYVKV7UBUErr5GZsngyMB9YxGhL8xq0Idhk0AfOp9GRyP
         4o3EEBRcnoN+TCYj4IyayXT60Roqa3iJvX/CNJTdwuLMLNSwU8VtW+Ya82y70m7c4F+d
         JYfw==
X-Gm-Message-State: AOJu0YwrAD6SH3wLP/a4PshcgcYlVheW7mhafIhG0oP3UNAiIM01DdG/
	txkXNdy6sHv5rJyrpxkD95HQTgKXa+QEAEbXsHFBKsq5qzaVYtTxiXsI4GkVa2QVFNTXiRFf0GR
	6
X-Google-Smtp-Source: AGHT+IHXz0XaYWdQ21zHsY5e1MK/7zapZHtYNFoAX8Y/98yxOBt2TekyhLpNMJX1RalpAd4wZy0ZsQ==
X-Received: by 2002:adf:eacd:0:b0:336:654a:bff2 with SMTP id o13-20020adfeacd000000b00336654abff2mr5193754wrn.10.1706606046350;
        Tue, 30 Jan 2024 01:14:06 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] x86/intel: expose additional SPEC_CTRL MSR controls
Date: Tue, 30 Jan 2024 10:13:57 +0100
Message-ID: <20240130091400.50622-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Introduce support for exposing {IPRED,RRSBA,BHI}_CTRL feature bits and
allow setting the corresponding SPEC_CTRL MSR fields.

The bits are documented in:

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/branch-history-injection.html

Xen doesn't use the bits itself.

Thanks, Roger.

Roger Pau Monne (3):
  x86/intel: expose IPRED_CTRL to guests
  x86/intel: expose RRSBA_CTRL to guests
  x86/intel: expose BHI_CTRL to guests

 xen/arch/x86/msr.c                          | 7 +++++++
 xen/include/public/arch-x86/cpufeatureset.h | 6 +++---
 xen/tools/gen-cpuid.py                      | 3 ++-
 3 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.43.0


