Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A2F862189
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 02:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684996.1065336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYN-0005lo-Uk; Sat, 24 Feb 2024 01:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684996.1065336; Sat, 24 Feb 2024 01:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYN-0005hH-Pe; Sat, 24 Feb 2024 01:10:11 +0000
Received: by outflank-mailman (input) for mailman id 684996;
 Fri, 23 Feb 2024 23:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFrk=KA=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rdfQ8-0005yy-AH
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 23:57:36 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fdbaf6e-d2a7-11ee-8a57-1f161083a0e0;
 Sat, 24 Feb 2024 00:57:34 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1dc1e7c0e29so5686935ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 15:57:34 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::4:45de])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a17090323d000b001d9edac54b1sm12313162plh.171.2024.02.23.15.57.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Feb 2024 15:57:31 -0800 (PST)
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
X-Inumbo-ID: 4fdbaf6e-d2a7-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708732653; x=1709337453; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSYW/f6ddyBB9WtPg1xLnsJlpquY1/ikpKTyYScqzh0=;
        b=DHZAR66PGWFk6Ya12h0SLjd5waoX7yF749XqIMC+0K8CcCpH0QvkpHHgKAvp4XHgLU
         HDXd6rDbYyvw6qmmhHtlmLGu5OiuRWR+LySPBfHHcCxL0SrELyswRj9+dXVHdB7kBCvc
         E1LvwrHb7SYMYmkOZHfIrBMLrvWRDiv60x+6gE6IXlLOgGgdt8g9QBmZiwsKrzKrLQ4E
         u8fykTFFMb5UMeNer0Q+szbztPsh+A+aRexxF9KObeRsbgFDB3pmEyQM7AxbGyugFMd1
         /HqPchRKVPeM+1reIpKA5c/SoCuaC9Smj9REGGEbvnDSdziYLz1fIcjcUTRk3zqviROv
         nfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708732653; x=1709337453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSYW/f6ddyBB9WtPg1xLnsJlpquY1/ikpKTyYScqzh0=;
        b=OTmHJo3ggs2kUP+36TJvG+9T/Ev5Xsc9KH8VLs83bc2EbXFsrw5OcPc4l7gguu3CHH
         2nFPZfumYNeWQm1tSYYN2VkCvKBZH74Ch1yWcyLwTCPO6ySQnvM5AXuMexNYKpfMas1h
         xBLKWOzzwBu4IBJ+8ikJN2Ks7WeuIjZ22vEcmNeiJ4gEVT832jQrwtf4FLA293GHr2Vj
         GXqhFWMCmY3zm41za+bLTvfnnwPDeeYmrRPMJRWp9LnloACsIEIMxqmKIZpiZQ+QIYLO
         cPcVukvxUml7nIgff/z1DLFBTp8OFdeUi5BT7xYKIjk3QewciDWrptMfQ0sMFlcz+b+A
         +y2A==
X-Forwarded-Encrypted: i=1; AJvYcCVskONynI8UeLrfM3OxesUG9POWCKG4DesZKyyDssMHS+/cyVbyjg0997FMGfibPsX8lk2cIsbc/cywbCS5mxC7Fa25uG2J/4dRMZrp/6A=
X-Gm-Message-State: AOJu0YxY1sIl5WdoGit3xDx1FoFQG9arLEB1dio0clPMSztG6qC3isPJ
	gAIQZeTe5vFREwb3QzQN372cektv2brMndTDc2EWB5eNyTGT8JfU
X-Google-Smtp-Source: AGHT+IF03Ip9HN7hOBgclqSMTFdHG7TNdTZF9AvtgtNN5+5+EnBr4r8zdxXO0SElDm498lBK65E9Ag==
X-Received: by 2002:a17:902:d2c4:b0:1db:5213:222 with SMTP id n4-20020a170902d2c400b001db52130222mr1899819plc.5.1708732652680;
        Fri, 23 Feb 2024 15:57:32 -0800 (PST)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	torvalds@linux-foundation.org,
	brho@google.com,
	hannes@cmpxchg.org,
	lstoakes@gmail.com,
	akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	boris.ostrovsky@oracle.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	kernel-team@fb.com
Subject: [PATCH v2 bpf-next 0/3] mm: Cleanup and identify various users of kernel virtual address space
Date: Fri, 23 Feb 2024 15:57:25 -0800
Message-Id: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

There are various users of kernel virtual address space: vmalloc, vmap, ioremap, xen.

- vmalloc use case dominates the usage. Such vm areas have VM_ALLOC flag
and these areas are treated differently by KASAN.

- the areas created by vmap() function should be tagged with VM_MAP
(as majority of the users do).

- ioremap areas are tagged with VM_IOREMAP and vm area start is aligned to size
of the area unlike vmalloc/vmap.

- there is also xen usage that is marked as VM_IOREMAP, but it doesn't
call ioremap_page_range() unlike all other VM_IOREMAP users.

To clean this up:
1. Enforce that ioremap_page_range() checks the range and VM_IOREMAP flag.
2. Introduce VM_XEN flag to separate xen us cases from ioremap.

In addition BPF would like to reserve regions of kernel virtual address
space and populate it lazily, similar to xen use cases.
For that reason, introduce VM_SPARSE flag and vm_area_[un]map_pages() helpers
to populate this sparse area.

In the end the /proc/vmallocinfo will show
"vmalloc"
"vmap"
"ioremap"
"xen"
"sparse"
categories for different kinds of address regions.

ioremap, xen, sparse will return zero when dumped through /proc/kcore

Alexei Starovoitov (3):
  mm: Enforce VM_IOREMAP flag and range in ioremap_page_range.
  mm, xen: Separate xen use cases from ioremap.
  mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().

 arch/x86/xen/grant-table.c         |  2 +-
 drivers/xen/xenbus/xenbus_client.c |  2 +-
 include/linux/vmalloc.h            |  5 +++
 mm/vmalloc.c                       | 71 +++++++++++++++++++++++++++++-
 4 files changed, 76 insertions(+), 4 deletions(-)

-- 
2.34.1


