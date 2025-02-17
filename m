Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCDAA385BF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 15:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890510.1299664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1vI-000835-Je; Mon, 17 Feb 2025 14:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890510.1299664; Mon, 17 Feb 2025 14:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1vI-000800-Fw; Mon, 17 Feb 2025 14:16:36 +0000
Received: by outflank-mailman (input) for mailman id 890510;
 Mon, 17 Feb 2025 14:16:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glRE=VI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tk1vH-0007zu-Qg
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 14:16:35 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca3c21a6-ed39-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 15:16:34 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2fc1c80cdc8so5903895a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 06:16:34 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fc13ba60c1sm8243906a91.44.2025.02.17.06.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:16:30 -0800 (PST)
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
X-Inumbo-ID: ca3c21a6-ed39-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739801792; x=1740406592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wByqNnvVG31ZP7jvKCUm2WQ/5WB9xBfuuuTySIB4jyo=;
        b=kMeJyWcfML+xjisjsRqSPk2ry0JSRx0s+Df5hKKa1c3uPOJyyBaFdv+ObzVM3O60PK
         RfFE8+btD/zEyNVyAzCjfn8M7qD/9YlBib/P2HlZbcnRXF+gldRG2veWfnHN+kI2z2Na
         tPx4HyRdgescPdySSvTEY5FQaxHguzBf1EwUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801792; x=1740406592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wByqNnvVG31ZP7jvKCUm2WQ/5WB9xBfuuuTySIB4jyo=;
        b=v+XjdZfK+WxINFjFE4IWjqlKbJXqNy7s7i1FLegJbJ4UuQzq3sk4X801eK8dQ122DD
         WLNjop6fr0DD9B7OKbUv9OGet6LvMjsTEM/wyBKcc/HL+nJQGyn1HFrBIZTM+yctWBjy
         jMHHvIZLTDQK0OHKpd1fwBlNVmX72sKVPHmMqQbsxYWdR1K9JCpY7r37WeJ0B/zGLRSu
         nLI6ARjEpBSOXOYU7gKu+O5ayUIP1juqyfv/tUZglD01ujCv5focDNh12mPqYwz8k5ac
         qLbH5E1RqlnO5wNL6hz/VyGQUf20gPsSTVqS/dC00DdfPN1T7n/DycPnqWOh93p4qo0y
         ldvw==
X-Gm-Message-State: AOJu0YwL0Aocn8gqQ8Zx5L0jAnWgyZLVLk/+4/3nQjPwZOu7zlTn7nlh
	maN06RvVwgonE5Oqv7mwmHo3wI4A2tVGtcHiuDVey4k8PPRffQcZ4UojW9kItOjhmlAbR3pP9wE
	w
X-Gm-Gg: ASbGncuBZlXfitnUXX6RMPwHm1bl+osdwywmU8bMs03Sf5g9OjtoIqz6TUEeSyTOq+8
	jauqIh8WFEjYceCzabu3RuwcgxqwjzDTryotvN+DWFGqlU9IXe91Djzq+5ZFsdacqqgQrFM+JsX
	9jhFcHHFMwb2hfOGI3+TXUNBVFPjuNhiYvVIWZurwrd+FjDcRUX79XGuWWalK1vaUwF8+WGH1Rx
	C7mFOVfglM8y9Y2LCONISDHzCMGxb/yuC5pTtEVMOxRsVfdhM0DOGBjNxA26et5BT/bfdFxru0b
	bsHLFGjyQ2UhOcwDE2fv
X-Google-Smtp-Source: AGHT+IEiMagyPrIGj1Wmnx+vKUIRbcnAmXaj2O5BchuW9ijUUeOe04ZPB8FWPWzSGXfcDXxas8j5kA==
X-Received: by 2002:a17:90a:d604:b0:2f2:a664:df19 with SMTP id 98e67ed59e1d1-2fc40d13ed9mr17078216a91.7.1739801790863;
        Mon, 17 Feb 2025 06:16:30 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/2] x86/dom0: be less restrictive with the Interrupt Address Range
Date: Mon, 17 Feb 2025 15:16:00 +0100
Message-ID: <20250217141602.64014-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch is a preparatory change to reduce the changes required in
patch 2.  I would have wanted those to go in 4.20 to fix the issues on
Lenovo Thinkpads, but it's too late now.

Thanks, Roger.

Roger Pau Monne (2):
  x86/iommu: account for IOMEM caps when populating dom0 IOMMU
    page-tables
  x86/dom0: be less restrictive with the Interrupt Address Range

 xen/arch/x86/dom0_build.c           | 23 ++++++++---
 xen/arch/x86/hvm/io.c               | 16 --------
 xen/arch/x86/include/asm/hvm/io.h   |  3 --
 xen/drivers/passthrough/x86/iommu.c | 61 +++++++++++++----------------
 4 files changed, 45 insertions(+), 58 deletions(-)

-- 
2.46.0


