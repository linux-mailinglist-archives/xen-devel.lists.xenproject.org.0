Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BD86D7FE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 00:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687468.1070978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3i-0002sq-D7; Thu, 29 Feb 2024 23:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687468.1070978; Thu, 29 Feb 2024 23:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3i-0002pg-AB; Thu, 29 Feb 2024 23:43:26 +0000
Received: by outflank-mailman (input) for mailman id 687468;
 Thu, 29 Feb 2024 23:43:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnTJ=KG=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rfq3g-0002pa-SX
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 23:43:24 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52aea4a3-d75c-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 00:43:22 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1dc29f1956cso13542095ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 15:43:22 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::5:8f17])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a170903120800b001dcc129cc2esm2079055plh.60.2024.02.29.15.43.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Feb 2024 15:43:20 -0800 (PST)
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
X-Inumbo-ID: 52aea4a3-d75c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709250201; x=1709855001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzHHSXtSLrv/NknHpxtBThbqiIeWhWk4Z2HCRi70who=;
        b=l1lskIJHOW0Pdc6x9Gyl366e03Us3X105se85FCYIUEcI0JVQBBFtCPB/PQHh0YXQz
         7u95N7iylLxQmjsPvHOVIqrbtoZkZGxdHJgrXBUnywkrV7dv8KKzmJylbFuuX99bCVxV
         3BcyeizhrTCKjT8/lCCxuMzdCrewX9Khy3p66uu2gcwiFLB5T38U1jGdxSTt2E9CEhsN
         wBH9KfRniTbGhUPJ+j/JsxXNPtzMEznhyUK6eyhmmNs4C/nRf7jWR1kv0ZnRXEN+QMep
         ubQPphSHBst3oYGmCVMbXVPXh4Ezj7snzIxzRsrsrjpzgWhKtT3LaKVdadLf3xz71Xj8
         0ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709250201; x=1709855001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzHHSXtSLrv/NknHpxtBThbqiIeWhWk4Z2HCRi70who=;
        b=dCq9jaSYqpZKTaxLs2KZwEUcSAPI4ugfiVRTP10V+CUBrcw86FhVNT7EDTepjZOKsp
         XmYpc6qws6o15RrPf/bjqa0CneUjvxcf6bt745C3DeLMe0Jy+mx+fYl+sP70KbKw3fRO
         ljHMeRWOtU00bKf/cVUKHTFzvJLKJMQquse2MACuuDUWF+QbRKf3DJ2pbw+QRedAi/QE
         Vk8M4dxf2nToUW4ifi3seVQYx4rmD9DCuq6kaTYalig4yYh62KOthBStDX5yO9ZCIPSg
         A3T1vPy0jXpRks43PNFkmBYwzWAsB3gf0PMrdKPN91YccJzhV6x1tVj+ZhZCTLY4zImb
         50Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUrkjqzn9D72wUMgGZ7/EL56gyWzgSdylxOTjDAqMyEZG6bvC79XXm25Or8MU5oQEh1q2okE/slw1JsIwxeb+p5uZM9c5yO5b/L5aSXxRw=
X-Gm-Message-State: AOJu0Yyi70JzwqDroHIJ5xLBcQUE+RNQgbTkKQqgUyvK7AYQsut+8Xu9
	bI2wLdw8+kzHOUgiT+PUnG/iUF57yp8ynmXY8MvRFy2FOCrA+Mdc
X-Google-Smtp-Source: AGHT+IGfl0YdKr5QO4H+FovdTc3eTEo8Q94QPX7tglxTnGBDlmv4twi/rgWyLSio1iEhhbNejBslzA==
X-Received: by 2002:a17:902:d511:b0:1db:be69:d037 with SMTP id b17-20020a170902d51100b001dbbe69d037mr22315plg.46.1709250201120;
        Thu, 29 Feb 2024 15:43:21 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 0/3] mm: Cleanup and identify various users of kernel virtual address space
Date: Thu, 29 Feb 2024 15:43:13 -0800
Message-Id: <20240229234316.44409-1-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

v2 -> v3
- added Christoph's reviewed-by to patch 1
- cap commit log lines to 75 chars
- factored out common checks in patch 3 into helper
- made vm_area_unmap_pages() return void

There are various users of kernel virtual address space:
vmalloc, vmap, ioremap, xen.

- vmalloc use case dominates the usage. Such vm areas have VM_ALLOC flag
and these areas are treated differently by KASAN.

- the areas created by vmap() function should be tagged with VM_MAP
(as majority of the users do).

- ioremap areas are tagged with VM_IOREMAP and vm area start is aligned
to size of the area unlike vmalloc/vmap.

- there is also xen usage that is marked as VM_IOREMAP, but it doesn't
call ioremap_page_range() unlike all other VM_IOREMAP users.

To clean this up:
1. Enforce that ioremap_page_range() checks the range and VM_IOREMAP flag
2. Introduce VM_XEN flag to separate xen us cases from ioremap

In addition BPF would like to reserve regions of kernel virtual address
space and populate it lazily, similar to xen use cases.
For that reason, introduce VM_SPARSE flag and vm_area_[un]map_pages()
helpers to populate this sparse area.

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
 include/linux/vmalloc.h            |  6 +++
 mm/vmalloc.c                       | 75 +++++++++++++++++++++++++++++-
 4 files changed, 81 insertions(+), 4 deletions(-)

-- 
2.34.1


