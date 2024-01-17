Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52978309E2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 16:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668520.1040773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ7zX-0000DO-9R; Wed, 17 Jan 2024 15:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668520.1040773; Wed, 17 Jan 2024 15:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ7zX-0000Bq-5j; Wed, 17 Jan 2024 15:38:11 +0000
Received: by outflank-mailman (input) for mailman id 668520;
 Wed, 17 Jan 2024 15:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zjLj=I3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rQ7zV-0000BO-P6
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 15:38:09 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 695cfbb2-b54e-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 16:38:07 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50ec948ad31so11250730e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 07:38:07 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a1709064bd900b00a28f54aacf1sm7929097ejv.185.2024.01.17.07.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 07:38:06 -0800 (PST)
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
X-Inumbo-ID: 695cfbb2-b54e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705505887; x=1706110687; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFS/3qL+yKn0NP9eT18tNMMi6NeJM2kpDdrVktzGmHM=;
        b=uaZ3i/xH6rvMq7OTlsyNl5EAsvDU7VqlqE7EBByun9tfagSVtZq8iGVN2QBAL8DW2K
         hQF2qlcibjx7pINuasB6FKvleWqgcFNy3aqTmOq6E1bpPLG6ChoDhv3XUsxczFH+vkAy
         TtRbQI0vFDJVJKhVq71JYSeM3D5hfyaxi03GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705505887; x=1706110687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFS/3qL+yKn0NP9eT18tNMMi6NeJM2kpDdrVktzGmHM=;
        b=D/IbTfc0i+0C7zH8U3tCvO5y92szcH85xQh6J/oWDOjCSonrUS3u0tuJk4QtKvPH9F
         bQpRPSAxcpCkY6eswJ4h/wMvkA7dzLOOuHf8+JF/ytao+zQN07GO+GPsgCtFD+jeS/o6
         gfg5/qQzb7iNzuTgpC1D/2hDrCNwYHaWv4PK5FMHspzEl00moHmzWKYcDG2R6w17NIke
         apJAVi0CUBc4mv/dJtZ2pctmpocQLs6CGqwLKxzhUOmc5I7Q5t8PHj5Gkp3J5l2VdCCB
         Q5GzBR1zkRFW+jeKhqHkWG/yEJjb/R7/1EXWbXoans+bk0HfUPMVl754WehZu8L+LXaR
         GIaw==
X-Gm-Message-State: AOJu0YzWTkO62axzM7FC1tC/Cteo/q1dvQ36+pDJTBb6Ep0Kq1Tg8ALm
	O+XaCyegnCrxQxqWjrIvV4u0czNOHQvhdQ==
X-Google-Smtp-Source: AGHT+IH7PyYb5jrwjPkiaxS+uIuZhoZ2bjMBmBmjY106nCfrwQcQSXaE6ucyPjLngHAA7bNitlrhnQ==
X-Received: by 2002:a05:6512:6c5:b0:50e:b265:be94 with SMTP id u5-20020a05651206c500b0050eb265be94mr5279023lff.118.1705505887092;
        Wed, 17 Jan 2024 07:38:07 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [MINIOS PATCH] x86/mm: add EXPORT_SYMBOL() for `pt_base`
Date: Wed, 17 Jan 2024 15:37:45 +0000
Message-Id: <20240117153745.29515-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without this, building "ioemu-stubdom" fails on Debian Buster or
Bookworm, with:

/home/osstest/build.184372.build-amd64/xen/stubdom/mini-os-x86_64-ioemu/mini-os.o: in function `xenfb_pv_display_init':
ungetc.c:(.text+0x43533): undefined reference to `pt_base'

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 arch/x86/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 767a5f0..be1cf0c 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -57,6 +57,7 @@
 unsigned long *phys_to_machine_mapping;
 unsigned long mfn_zero;
 pgentry_t *pt_base;
+EXPORT_SYMBOL(pt_base);
 static unsigned long first_free_pfn;
 static unsigned long last_free_pfn;
 static unsigned long virt_kernel_area_end = VIRT_KERNEL_AREA;
-- 
Anthony PERARD


