Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15486D7FD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 00:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687469.1070986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3n-00038M-Nq; Thu, 29 Feb 2024 23:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687469.1070986; Thu, 29 Feb 2024 23:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3n-00035k-Kv; Thu, 29 Feb 2024 23:43:31 +0000
Received: by outflank-mailman (input) for mailman id 687469;
 Thu, 29 Feb 2024 23:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnTJ=KG=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rfq3l-00034g-R7
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 23:43:29 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5612cf85-d75c-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 00:43:28 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1dcd6a3da83so11311245ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 15:43:28 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::5:8f17])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a17090301cc00b001d90a67e10bsm2081312plh.109.2024.02.29.15.43.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Feb 2024 15:43:24 -0800 (PST)
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
X-Inumbo-ID: 5612cf85-d75c-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709250207; x=1709855007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYaENkYQ4G5HZw66zLSCBAz4c9QdNSpOW86RMIeSYNk=;
        b=HbvU+1D2788D3v57L/qKiGhMpnoULiHi2FjuIvjPkv/xH6oSvlJvdcmrwJo2wIKAE9
         ANFTbBV+CWnZS94fTdWXmmFPjSZqDQuGpns0hhl3ia6q2REvpm0EFzx1edd9PPCdp8zG
         DwITDRQOJ3XC5x8V/eTys3D4Y8rSF6Ilq1TLoUCLSi71sUeinHP1WY/SjunUp92KHV2t
         cHOi1SpGxdxhR0iWuGhK78b/O8yGWyGJ1ZUbIRSdkuks7ic4oZJQY/dfOlhDJU0aiXC+
         4U0F6efzrC69YNx4xGFvHg/R39HnoMynaySNAbl6KObRnVJyyAzQJpEMwNL2gz8oIXdM
         u0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709250207; x=1709855007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYaENkYQ4G5HZw66zLSCBAz4c9QdNSpOW86RMIeSYNk=;
        b=k4CL4EaSPCxnYqPIuytArkRV0vmIUlG/aOV6WxIyuWFhXr8ZHVEoE0UTYXrPRER4af
         XWOiAmKizd5o1z9lbuyhwjmFk+bAVSa+pyC+v7uE5Y3V0ywWk9Kaibd+N65x55DW0viK
         CuiBvxJrfLNwJQuvctXeaocGpy3kMz+fkc8KkioQ6OgcFCUfGCSYf5+62qiOjlbTkAvq
         gH0ZUZA1BAhlvWmXHWb43WOn4ax0kpXzr3q37/YKt2tDb8TcmYlOwc34M2fdc3f5yIA0
         MZI9Dm6YOAt9/Ka7n832rXQ4O3hvG6ZDJpvkF6LBATQCzYOa6nOtjRq/sA23yDOQ+Gj1
         OUEA==
X-Forwarded-Encrypted: i=1; AJvYcCWD0sl9aT8m7eHjJq3Eu7Tad5orfvJadv08t36VKU3pmvTU+aHEpAU13L0xEAiK8FohtIi5IEe17hWa+B4rpFGtJN/J7gPsjLRcOX2NMPY=
X-Gm-Message-State: AOJu0Yw9YhT6ygvfZrrSUxGR6mbu+zpfONPV+kfZwLU7rjc4dL2VyeC3
	YttQxTM/VvLr794T1hNcPC6oxXcz7FoHpe1Lefknwgtz/sejluqH
X-Google-Smtp-Source: AGHT+IGkWYefSAJiD6V3UAHJP4h3dcMjAtD7ol2bRxxY1LAVjzWJTomMlC/1P8AOvCsvxgL62Mpd0g==
X-Received: by 2002:a17:902:6847:b0:1dc:8790:6824 with SMTP id f7-20020a170902684700b001dc87906824mr50051pln.15.1709250204830;
        Thu, 29 Feb 2024 15:43:24 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 1/3] mm: Enforce VM_IOREMAP flag and range in ioremap_page_range.
Date: Thu, 29 Feb 2024 15:43:14 -0800
Message-Id: <20240229234316.44409-2-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240229234316.44409-1-alexei.starovoitov@gmail.com>
References: <20240229234316.44409-1-alexei.starovoitov@gmail.com>
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
2.34.1


