Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42D862187
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 02:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684998.1065342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYO-0005pR-5W; Sat, 24 Feb 2024 01:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684998.1065342; Sat, 24 Feb 2024 01:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYO-0005lI-0J; Sat, 24 Feb 2024 01:10:12 +0000
Received: by outflank-mailman (input) for mailman id 684998;
 Fri, 23 Feb 2024 23:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFrk=KA=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rdfQC-0005zS-Ux
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 23:57:40 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51dfb343-d2a7-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 00:57:38 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-29a378040daso1051030a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 15:57:38 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::4:45de])
 by smtp.gmail.com with ESMTPSA id
 si4-20020a17090b528400b002963cab9e2asm2161658pjb.2.2024.02.23.15.57.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Feb 2024 15:57:36 -0800 (PST)
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
X-Inumbo-ID: 51dfb343-d2a7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708732656; x=1709337456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7v8QcQGKEfLwaJltNJW0mYz5w9KdmkVXr/8REE7aG4=;
        b=Ua9UR9Nkf7947Ao70UBTRIPhKLlen+kIXRvptVzPvLoTuHUqQVZLd8bXtCwwMMaVe7
         /sWEgWotLBNsj47oWGbK31kCqIq5JCYIgDkygRNIWCbqQFLd6Xbnc44dgpl3Lz6LYyln
         tcBAFtS97aC5TD+MTFrW9F+rOeZbL2WLU7lecXImmAbln6pvvosAd18yWtOhD6r3kmjC
         fPJiKHO196k6q6cbEMMavAF0o1dMGTZI+Z007iqCvmVvr3or9TRfYVobc+ge/Fui6boG
         fW3TlTZfxEQpY459mWBzm2MmeUcBYtyYFcKQFCfX8pFnEAW1ztcgNdwoxE/VgXkvmT7a
         7z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708732656; x=1709337456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7v8QcQGKEfLwaJltNJW0mYz5w9KdmkVXr/8REE7aG4=;
        b=LnnTHZEG6MlJ52DWwAu2qqvnj3L2OVqIYHfWqg6JLRDc6UTdSV46t3GLL84F00Jid6
         BbTYCN+SFYKDsPcAYARlHNxzkSFcAEv91ZVu89BHp9IOKlKBk8n8pCCbv8Sccb5QzB3T
         NjBU2w2P3FVhErTQ9ge9OamUmCJS8OMviOszOhYRrxqsR0Tsn3WnqoVwprmY8I4QdcqD
         NFmirRT7nGojPYreO31PisusORg++1sQd2NPnEOY88i4AluW4jCu3H/RhXt7rXZWMh07
         cQ0/MU59lISZpYYY7rBQmBKCiyZurt7V+YP/ZHLH7thgTR9vrjzX173he444HtmlbQnd
         zcFA==
X-Forwarded-Encrypted: i=1; AJvYcCW/n37LmpjHxmzzrTgwGOKIST1rU8GUraVvF7xrVNZTVBEQyNTcX+T5E7BX1I+KTzYXopH4E8ZqndhuoQvsN/WYyiMq9UxBvKBdeGaFutg=
X-Gm-Message-State: AOJu0Yz8BrfmkGVXQepVEPXsB+2aHZ3ZvcLEf4yF8naYDIuOoW3vKiqe
	2SM7A1kHw0qCSjfV6PRvl3FPaivWs5Z8vMSyXqDVgFWxyNM7oJQr
X-Google-Smtp-Source: AGHT+IHG/DO/OVIktjtp11/4CHtLMBPBSMQzb2KGZX31cgPqxxDf+7H9BLoJUXmr0UjElOG7XOtMJQ==
X-Received: by 2002:a17:90b:1050:b0:29a:9ba0:8a5b with SMTP id gq16-20020a17090b105000b0029a9ba08a5bmr411918pjb.5.1708732656476;
        Fri, 23 Feb 2024 15:57:36 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 1/3] mm: Enforce VM_IOREMAP flag and range in ioremap_page_range.
Date: Fri, 23 Feb 2024 15:57:26 -0800
Message-Id: <20240223235728.13981-2-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

There are various users of get_vm_area() + ioremap_page_range() APIs.
Enforce that get_vm_area() was requested as VM_IOREMAP type and range passed to
ioremap_page_range() matches created vm_area to avoid accidentally ioremap-ing
into wrong address range.

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


