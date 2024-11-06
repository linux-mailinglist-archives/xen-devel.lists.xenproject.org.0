Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E559BE90E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830875.1245972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAK-0004Mf-Gi; Wed, 06 Nov 2024 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830875.1245972; Wed, 06 Nov 2024 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAK-0004JJ-Da; Wed, 06 Nov 2024 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 830875;
 Wed, 06 Nov 2024 12:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8fAJ-0004J0-19
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:29:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c76def14-9c3a-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 13:29:34 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so147092966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:29:34 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16f8399sm271563566b.85.2024.11.06.04.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:29:32 -0800 (PST)
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
X-Inumbo-ID: c76def14-9c3a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM3NmRlZjE0LTljM2EtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODk2MTc0LjEzNzI3Nywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730896173; x=1731500973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzv3qzjRK3TQt/MOPcg4C+RPJUCLKq1ia0oWK3NTCE8=;
        b=VcaKk9LMmzTO7yV42i2sPix27/t7c5BfwZnzGIMTRAy6UrJ58wni5kbOxfguWSAhUD
         LbbYmcV1Wg0etyXI/S8slu1VCbVc6ghimIUkZqibPeqxwKHGeF+sg371Z2OE/WVpE246
         S3EAzPRtKfAQUI5n+eZuvVM+0rM3ddQf+yTy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896173; x=1731500973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzv3qzjRK3TQt/MOPcg4C+RPJUCLKq1ia0oWK3NTCE8=;
        b=eCclSEgwDw8g4bT6ukd9volF9PJsdSUByNcBjHv7MSB+kuMBePym0cgbfWWpT7vT+Y
         ft29jPFoAWHzi7jPu8Uhu/jTYmPt78r9FIQ4DA2G+cNptSS2QNjP3LyLTLFaXXN3GsXf
         Sj6TP7sJz2lKlRYi15tcmnpZMdWBkOqco8XBsizG8AUV8xY0J24hlKYW4nzH3fyO9yrp
         RKhgkpEkzSu2MXTdPizUHrsyabETBbJ/d33TclW2slWBa9gSZBN/fJ+iNO5adoxSAJuF
         WYWKGN/H3oy7C5tDRTMe04nh9QMgF4qTqdFqRNOb7DaGjLkO08I4KJ7YTxkdXsr7EwRQ
         DqYA==
X-Gm-Message-State: AOJu0YyrxRL/shroZuQwju+qhsPBMXK0o9+SktX4ygOlsQR1UDXRXoSQ
	emVxPJhDPBPK9Bjpr0o8AjiFFzWpJf0Aubo0BK7ulENWPAcJWeKXufw5InddZN6aF3g/1/+RA/p
	s
X-Google-Smtp-Source: AGHT+IFq6DsWTay2BzSCuFVumu9DQhOrwxyujN78Le9hWhsvdfB993gvs6ON92K5jXu0hJn3H3RHLA==
X-Received: by 2002:a17:907:ea8:b0:a99:fbb6:4972 with SMTP id a640c23a62f3a-a9ec665ac6cmr206268666b.25.1730896173150;
        Wed, 06 Nov 2024 04:29:33 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/4] x86/mm: miscellaneous fixes
Date: Wed,  6 Nov 2024 13:29:23 +0100
Message-ID: <20241106122927.26461-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The attempt to fix destroy_xen_mappings() so that L2 tables are
consistently freed uncovered some errors in the memory management code.
The following series attempts to fix them.

All patches except for 4/4 are new in v2, and 4/4 has no change from v1,
hence kept Jan's Reviewed-by tag in 4/4.

Thanks, Roger.

Roger Pau Monne (4):
  x86/mm: introduce helpers to detect super page alignment
  x86/mm: special case super page alignment detection for INVALID_MFN
  x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
  x86/mm: ensure L2 is always freed if empty

 xen/arch/x86/include/asm/page.h |  7 +++++++
 xen/arch/x86/mm.c               | 13 ++++---------
 xen/arch/x86/setup.c            |  4 +++-
 3 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.46.0


