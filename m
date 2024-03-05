Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2736787141B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 04:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688570.1072879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhL7Q-0004Tb-2z; Tue, 05 Mar 2024 03:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688570.1072879; Tue, 05 Mar 2024 03:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhL7Q-0004R5-03; Tue, 05 Mar 2024 03:05:28 +0000
Received: by outflank-mailman (input) for mailman id 688570;
 Tue, 05 Mar 2024 03:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BjVz=KL=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rhL7N-0004Ci-Od
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 03:05:25 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d542d6-da9d-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 04:05:25 +0100 (CET)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3c1ea5e54d3so1115863b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 19:05:25 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::5:9426])
 by smtp.gmail.com with ESMTPSA id
 i37-20020a635865000000b005dc5289c4edsm7941060pgm.64.2024.03.04.19.05.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Mar 2024 19:05:23 -0800 (PST)
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
X-Inumbo-ID: 35d542d6-da9d-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709607924; x=1710212724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvs1TetY/ywxZOqb7cu6/qS8FYbgNwju0ZDKmLnC7pk=;
        b=eV+hOtfVSSrB4hO7qKY1NLugmhUP6FxyBU4rEdTt/Hl2uH3eFaCs90N3luwjiDnhsj
         plbcMZrj2oObEWr6BiR7F/3Dvm4GHypSABu71vh1VB169m25fRp/6bLFMhoM5wxTLl2r
         RxBEBwIwQBiTqbecJN6znNh2sktouvMyYJoPBqhDLLs6xMtCgay6RYkiiF3VPxFe045O
         dPDY4gBmshVD13Dh/ehNNIuMm3OdXNBmdD1fjqd7nN1Ay4oSuIi4ZxJd9hRG9bohAfwI
         A7yZW1FU0zsqrAmeEni+sEjrgVB3AIPqpYrobiUprqB0cFJQlC5S0XK/hpv0WzMUD2Zm
         /JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607924; x=1710212724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lvs1TetY/ywxZOqb7cu6/qS8FYbgNwju0ZDKmLnC7pk=;
        b=IR9O7gsAgAEDpWxG6okLL6LAL4idXIXo1i/YM28yicGTR4WdFWab+AMjuhHtQ676nk
         DerO5auzcERS2+JWWPRcKUSUqfsIDvxqZYPSqMw0WAERevUSpQiC9dyg4TTETwM8HPQZ
         y3w61uvlXGT+FgEjGBBWLQrpqNiDGJadKWVW7NgJVX05iM9wBliUOTKb7w0yqd9mjJo7
         5Y7Aq+fBZPNfrgj/0TMrURf/mU9d/+ccDxEC5WDXKz2B8QoHrSnpuKIurEdeIvYximVJ
         QLYvTvEnYyHL+gp/rx/dzY87aDEsET+/rBB6Rav3ctp9Y6QsE0rR//mOcY452cqqKRpq
         E4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzjxPi4GqeKs/2eN4vHzL/ipZZ6O9LtAoYGnEwFAf5bRM9e8j+cFPxsKm9rFgVouR7EYx19zdc3697fBVqD9tEuvebc1YVmbCzjCfgZRI=
X-Gm-Message-State: AOJu0Yyo9EEMrlxTpD60P3yllNQHRxb5kTr4VyZsi/96ByGpHQMHayLa
	MW25V9PAPYqMDx2zFMtlzy9+G3fDBzX/Sds+lvBbovnyAHObZMZI
X-Google-Smtp-Source: AGHT+IFYfdb0wzVKskM65cSKwSSitCWQ5HIwpxCM5POpmVMYG5/Wx6Ndr8UyOlbODBpKZ1uFvI0VUw==
X-Received: by 2002:a05:6808:4c3:b0:3c2:c13:978c with SMTP id a3-20020a05680804c300b003c20c13978cmr597466oie.5.1709607923728;
        Mon, 04 Mar 2024 19:05:23 -0800 (PST)
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
Subject: [PATCH v4 bpf-next 1/2] mm: Enforce VM_IOREMAP flag and range in ioremap_page_range.
Date: Mon,  4 Mar 2024 19:05:15 -0800
Message-Id: <20240305030516.41519-2-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

There are various users of get_vm_area() + ioremap_page_range() APIs.
Enforce that get_vm_area() was requested as VM_IOREMAP type and range
passed to ioremap_page_range() matches created vm_area to avoid
accidentally ioremap-ing into wrong address range.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 mm/vmalloc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d12a17fc0c17..f42f98a127d5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -307,8 +307,21 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 int ioremap_page_range(unsigned long addr, unsigned long end,
 		phys_addr_t phys_addr, pgprot_t prot)
 {
+	struct vm_struct *area;
 	int err;
 
+	area = find_vm_area((void *)addr);
+	if (!area || !(area->flags & VM_IOREMAP)) {
+		WARN_ONCE(1, "vm_area at addr %lx is not marked as VM_IOREMAP\n", addr);
+		return -EINVAL;
+	}
+	if (addr != (unsigned long)area->addr ||
+	    (void *)end != area->addr + get_vm_area_size(area)) {
+		WARN_ONCE(1, "ioremap request [%lx,%lx) doesn't match vm_area [%lx, %lx)\n",
+			  addr, end, (long)area->addr,
+			  (long)area->addr + get_vm_area_size(area));
+		return -ERANGE;
+	}
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
 				 ioremap_max_page_shift);
 	flush_cache_vmap(addr, end);
-- 
2.43.0


