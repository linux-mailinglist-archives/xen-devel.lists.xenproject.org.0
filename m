Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960987141D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 04:06:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688569.1072870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhL7M-0004EK-SJ; Tue, 05 Mar 2024 03:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688569.1072870; Tue, 05 Mar 2024 03:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhL7M-0004Co-PJ; Tue, 05 Mar 2024 03:05:24 +0000
Received: by outflank-mailman (input) for mailman id 688569;
 Tue, 05 Mar 2024 03:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BjVz=KL=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rhL7L-0004Ci-AK
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 03:05:23 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 338b3410-da9d-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 04:05:21 +0100 (CET)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-21fa086008fso2129593fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 19:05:21 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::5:9426])
 by smtp.gmail.com with ESMTPSA id
 y15-20020aa7854f000000b006e5a99942c6sm6822695pfn.88.2024.03.04.19.05.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Mar 2024 19:05:19 -0800 (PST)
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
X-Inumbo-ID: 338b3410-da9d-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709607920; x=1710212720; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GO37OSQRQXlN2VGFyW6LzwjH/NpS/PSzwjkGcO70oKE=;
        b=bQnktXcuSynRg789+WgNB/k3JCU3EdOWVag3S7z4pUBxTxnoC0/7c1zCQKZ0bAYWTX
         AahY04IZolUXZyv/5oOLHvGAnFpdr1s1mwfDQ3vQV0mhzmFj+w89dA0EVfwIdzT2oHYa
         R2U9tviE/xyhwE6wTFS9SWEc/hX2zfhS46UxoT83X1I1U/XNttarPlV/ZUdd7ZoqZI4b
         m1Qb6CSWTOtC8bXTj6KlwcXuLQHMsgG10ZN3cq+CiFUKqnN7rmm+6cffZ33qL1zWlRxm
         dFgWr27N/xtHELoz+Sl5PghPtDCgGHE1IKKHF9Ud5UWjOqD0+JF/9RBKEBseO/oGrIoa
         jE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607920; x=1710212720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GO37OSQRQXlN2VGFyW6LzwjH/NpS/PSzwjkGcO70oKE=;
        b=LLBuW2g4LAD0i8cUE0UxImfJ3gJW6V0frbhqSllxtcE9DrP1nfZ4IXDPaUT/a+Qoe7
         uteDBmXYCCg0CD1wY/oqu5n2jnlxir3OTui2JqTNHaSFsqTAHrVJHj9lGGfkNMJNP3/s
         viRZumuVihhk5N6gyErrJgYRPaPBYU9LmSKTpZsnrKKwE530gPIQkTN6vRhtoMcuUlJ2
         97qiNV1geK1RoXwciIV6oAB338xzbDZr+m1D4TJGlhhJ5fL1MRuS3+6O1ZqnL78f892F
         AlCSADPh57XoY48TT3/4NpwzQ4gnUCPF72vtRwRiGHFRKbdml/B0ZslwJ7Z0VEnfKF3M
         lG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV49LNWGYd+7HN6ZPjvk2pT0PUaPtu+2c9XKJao9LyoGevF7HdTEdlny1nS8tvRmdFtpkSvge5onnRXG6FhvM5uj5jA7POb8nLtzYuvvzE=
X-Gm-Message-State: AOJu0YxTujz7O0XZ2EShSAFoulewQPllEU8obqZ/xFcnlkZL9lXXBCoj
	+Ijf+0JF2zwl3B8QQKcFNouV+hYMZwYsh22AqFuE66msF4KZjzGL
X-Google-Smtp-Source: AGHT+IF4DC0r95WIbRC/5og05/9WKTnTnsPpk3e37OmDlc5CQCogzBPB5agJQ7Ifv5VhRu3af2p6Pw==
X-Received: by 2002:a05:6870:898f:b0:220:99bf:c26d with SMTP id f15-20020a056870898f00b0022099bfc26dmr589777oaq.9.1709607919882;
        Mon, 04 Mar 2024 19:05:19 -0800 (PST)
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
	rppt@kernel.org,
	boris.ostrovsky@oracle.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	kernel-team@fb.com
Subject: [PATCH v4 bpf-next 0/2] mm: Enforce ioremap address space and introduce sparse vm_area
Date: Mon,  4 Mar 2024 19:05:14 -0800
Message-Id: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

v3 -> v4
- dropped VM_XEN patch for now. It will be in the follow up.
- fixed constant as pointed out by Mike

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

To clean this up a bit, enforce that ioremap_page_range() checks the range
and VM_IOREMAP flag.

In addition BPF would like to reserve regions of kernel virtual address
space and populate it lazily, similar to xen use cases.
For that reason, introduce VM_SPARSE flag and vm_area_[un]map_pages()
helpers to populate this sparse area.

In the end the /proc/vmallocinfo will show
"vmalloc"
"vmap"
"ioremap"
"sparse"
categories for different kinds of address regions.

ioremap, sparse will return zero when dumped through /proc/kcore

Alexei Starovoitov (2):
  mm: Enforce VM_IOREMAP flag and range in ioremap_page_range.
  mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().

 include/linux/vmalloc.h |  5 +++
 mm/vmalloc.c            | 72 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 2 deletions(-)

-- 
2.43.0


