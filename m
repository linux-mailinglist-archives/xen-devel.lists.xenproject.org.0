Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AEAC07A8
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993245.1376682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1cT-0005N5-Tu; Thu, 22 May 2025 08:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993245.1376682; Thu, 22 May 2025 08:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1cT-0005KP-R0; Thu, 22 May 2025 08:49:41 +0000
Received: by outflank-mailman (input) for mailman id 993245;
 Thu, 22 May 2025 08:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI1cS-0004UT-0c
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:49:40 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b257b596-36e9-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:49:39 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-445b11306abso31199355e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 01:49:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f38142f1sm96587395e9.31.2025.05.22.01.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 01:49:38 -0700 (PDT)
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
X-Inumbo-ID: b257b596-36e9-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747903779; x=1748508579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8l19uXgmUMdMBBrIbGU3wYkycmyZxvGhh4gllaGzig=;
        b=FLdMG6G8N6fXZd9bnKmA6m2/Whc4GlCDwf9e09ckoofsdPH6IncimUBuoiRXHqrYFn
         ZQ0MroMGS2eY8L0jwmi3fI/Rtw+lUJYVIqHGsu404W62HhiGE4OrEwnVtJ/CgmxJ+xi4
         zkXA4HTw4dDnvAowf1x+AOJAvHrJNWiNHMpr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903779; x=1748508579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8l19uXgmUMdMBBrIbGU3wYkycmyZxvGhh4gllaGzig=;
        b=PvgHe4vHTYmhbCad6G6tZA/R3F9WIHYslbqDl6GXFoqzkAKqKRkpwu/DkHkFr+T4TB
         Tx8dPRtZKC16vBO1YQ2Ust2QuXdWc+Yx6CDsPZp/QUuQf2Yw4jWbovq+oGj0u4cGCUfZ
         o+ltwx5hx5IAe4VU/kIj7yt8K38jx9IHTUL2V20CKBlPpjbLsARq8ezUxWB8uJOKOqkS
         1eUTuEJjO5VYZ+I5cJCraxvfX4MlLG4Z290/PcvzkJ+XyXns1ohHZJt3LCI2VSngJHJs
         IQFEvfgNUlqdJq3y06BGc1LBfX5cfjgtKsXFtB61AhV7X/58Dg75Z6KOFtYiqpriltiT
         RvAg==
X-Gm-Message-State: AOJu0YxI40V4Eo8Woh6pUjfIGN90Pzve7ngT8iUaAHhhcu42WJXtmdfS
	JFFRj79gs+y/zZYrVIMsBEAtNbHmlYm6NBh7tpTx4m3EVHNI1+dOdU5G/Q7wEeJOuCD530gP/OZ
	m+b71
X-Gm-Gg: ASbGncuMyvqZt2PNz5CY86ueyR54P0syQmT9wOilF9m7SHlrcs1gZ8vhGh/EUvqSTFQ
	2OYZ/vUge5mIgkLxnUzXYMAmcYNkm28Qvn+51vUq5Y0Vui5SgKEGf42h7adsD6I+gpEZmgEFKop
	qIZ+XoN4LC90AlNg1Fg7EzMRQ5t6B92imBxiNq3Nf7TLIu29U0Z/Ydo2sOlk095Qf9EgSbwzI6S
	xvN9YQEKO4flWW0mZYfnuKuy4+3zFCfPrdJ+O5THZDC+06i/KyEiAAopR8nbtvHstQCeBxwf/gg
	cV3xosQAmjKaCQU6ySRKov8kAvrS5RCgj3y9EREKLXx3QdrJoq+f6jNXo3XqxeF+YVKwHkAT/gd
	KFSgBjY8hejKMUl5RELoCq/4Snfu5vw==
X-Google-Smtp-Source: AGHT+IHQxmPOG+Q7hPlR1p2LjxFO0FsHwt+099+4SK7UkCbLXnu/l+afNQ84ip27Z8RzbRIjgQf97Q==
X-Received: by 2002:a05:600c:4e87:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-442ff032a90mr183097795e9.23.1747903778821;
        Thu, 22 May 2025 01:49:38 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] x86/numa: introduce per-node flush_lock
Date: Thu, 22 May 2025 10:48:13 +0200
Message-ID: <20250522084815.825-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

I've had this patches pending for quite some time, but never sent them.
Kind of RFC because I'm unsure whether the approach is the best, there's
however a need to split the flush_lock, as on hosts with a high number
of CUPs there's there's a non-trivial amount of contention around it.

First patch is a preparatory change to allow using per-NUMA node locks,
second patch introduces a per-node flush_lock.

Thanks, Roger.

Roger Pau Monne (2):
  x86/numa: add per-node lock profile objects
  x86/numa: introduce per-NUMA node flush locks

 tools/misc/xenlockprof.c               |  5 ++
 xen/arch/x86/include/asm/irq-vectors.h |  9 ++-
 xen/arch/x86/include/asm/numa.h        |  3 +
 xen/arch/x86/include/asm/smp.h         |  3 +
 xen/arch/x86/numa.c                    | 95 ++++++++++++++++++++++++++
 xen/arch/x86/smp.c                     | 16 +++--
 xen/arch/x86/smpboot.c                 |  3 +
 xen/common/numa.c                      | 23 +++++++
 xen/common/spinlock.c                  |  1 +
 xen/include/public/sysctl.h            |  3 +-
 xen/include/xen/numa.h                 | 13 ++++
 11 files changed, 168 insertions(+), 6 deletions(-)

-- 
2.49.0


