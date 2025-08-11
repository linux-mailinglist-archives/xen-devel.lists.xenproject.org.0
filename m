Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A650CB207A1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077386.1438495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg4-0007Qe-TR; Mon, 11 Aug 2025 11:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077386.1438495; Mon, 11 Aug 2025 11:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg4-0007NK-P4; Mon, 11 Aug 2025 11:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1077386;
 Mon, 11 Aug 2025 11:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQg3-000725-K8
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14892cdd-76a6-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:26:54 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Kyeru32TNf-OLIcXhsSyrw-1; Mon, 11 Aug 2025 07:26:51 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-459d7da3647so36284065e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:51 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm40408983f8f.27.2025.08.11.04.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:48 -0700 (PDT)
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
X-Inumbo-ID: 14892cdd-76a6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJDg4sW92zbLWKqBjb1tVZssT9gBBixv5gdvUlii8Zs=;
	b=Dw7hYDSn4ECdNdnpa6TzGzoX5SH1fo2SKgFssJItHmYvklx91CAYj5o+2ABXjcY/u4gWDD
	d6CQLcHShyJgVUl9k0eMRfsfMmliaFqWdYBFuyf75U07P62r875NBLQI2a1KovrvpTdNHg
	zexyAy+1g/yo9F4j1QYoIm34b+RnVVE=
X-MC-Unique: Kyeru32TNf-OLIcXhsSyrw-1
X-Mimecast-MFC-AGG-ID: Kyeru32TNf-OLIcXhsSyrw_1754911610
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911610; x=1755516410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJDg4sW92zbLWKqBjb1tVZssT9gBBixv5gdvUlii8Zs=;
        b=tamhXQvB/1CwSZ2Ihn7u372K1VjCqeSoEAj4VspftRE/kSFXv0v7bsBo60gTquZXHs
         SfTJxvQT1jfIVRx2dq9jGM2yvIuyqro12OrXfqNEpqhqJM9oG12VTmP7MgBGhq+3r9TP
         QJlFJMnIq6Yhpm9SayTSrW+CRWxOWuVDTi1i3oH/Fk+RmtJ0LJNzKyKHxI5fcd1Tmx8K
         Ygav1R+/CIrc3mtQlEjnmsj3ZMfaRGR/pjo+PZ13q/66SgPOxOF/pFHkYF8qOcP1cdHF
         TdfdqSIvA0nKnig25oFcszVd+1YhDaPl2LZRsWSFRxBh8Rvk38+ngEn5JAPGvkbHEeim
         gKxw==
X-Forwarded-Encrypted: i=1; AJvYcCV7C3O6pXhHHlSCjT4jD+hezaUAT5LQ4dTX1pReEgiuIxIO7hwnEi0CUy01POSLzijXtPZmlUtEGW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOJCPux44KbJa7vSakCy0cDO8fT9aYYSTHI7JFxTUBG+Ho3tFX
	Gzw13VbmUA0CuZpxIVKiEJYhiT1nyDg4v9GUhDrLLvZ1J9XVikj2KXuXjCA3ie7lj+UJ5QeaooS
	r9P5x5qkVnLib8PgQ1JnfW41MHhnnNNzlisPxzsd6MFCeMsCmPlWQ8tfFsn054X5yEv/+
X-Gm-Gg: ASbGncsxaqoJKWYiH85pfQQc2rlhWMeAGcpCD7dNMuIYjdYHE2G0iTP/y0ggpUoslYA
	L6d2B6SrZnvAB74AwwbJkLZQVJB/HWUI/TRShIudW+R3eWpHlktFrw11K8i/+TwsPjKeLZ0iHhT
	OpD0Q+vc4wjRwkmbSQo0SAAxooYUfLaCvVNK6kO5E1edl6ofjFSXTd8ZWvVbrJ2l2EMvhpm12iM
	gX90+iy7svk9m+y4nhdPab+8x5r8VADu/0Sa4NpRNRuc+T61iyErRbgL9PgxzoRMi9U+u6u+7Uj
	CQz3YxSQl5lrGs1+idb934gpaXqlrMvaikgpSmDhv5CPba/x+d+ZVRukmsHkPOLQpOXQytPwXhP
	DZPkaX6DHu3LZ1U7TsKtZQBXp
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3b900b83ce4mr10356616f8f.51.1754911610053;
        Mon, 11 Aug 2025 04:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH28XXBuV6P4eMmACbygagN9E2w90dcNlvtCQwFebmNkdYsSnJof6QrfGHsOh8VfCIdvok2gg==
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3b900b83ce4mr10356583f8f.51.1754911609552;
        Mon, 11 Aug 2025 04:26:49 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level" to "struct ptdump_pglevel"
Date: Mon, 11 Aug 2025 13:26:26 +0200
Message-ID: <20250811112631.759341-7-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jASotZICgm03kaWSxHZduxhtEllZrMuzIZw-n2P_1uQ_1754911610
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

We want to make use of "pgtable_level" for an enum in core-mm. Other
architectures seem to call "struct pgtable_level" either:
* "struct pg_level" when not exposed in a header (riscv, arm)
* "struct ptdump_pg_level" when expose in a header (arm64)

So let's follow what arm64 does.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/ptdump/8xx.c      | 2 +-
 arch/powerpc/mm/ptdump/book3s64.c | 2 +-
 arch/powerpc/mm/ptdump/ptdump.h   | 4 ++--
 arch/powerpc/mm/ptdump/shared.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index b5c79b11ea3c2..4ca9cf7a90c9e 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -69,7 +69,7 @@ static const struct flag_info flag_array[] = {
 	}
 };
 
-struct pgtable_level pg_level[5] = {
+struct ptdump_pg_level pg_level[5] = {
 	{ /* pgd */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
index 5ad92d9dc5d10..6b2da9241d4c4 100644
--- a/arch/powerpc/mm/ptdump/book3s64.c
+++ b/arch/powerpc/mm/ptdump/book3s64.c
@@ -102,7 +102,7 @@ static const struct flag_info flag_array[] = {
 	}
 };
 
-struct pgtable_level pg_level[5] = {
+struct ptdump_pg_level pg_level[5] = {
 	{ /* pgd */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
index 154efae96ae09..4232aa4b57eae 100644
--- a/arch/powerpc/mm/ptdump/ptdump.h
+++ b/arch/powerpc/mm/ptdump/ptdump.h
@@ -11,12 +11,12 @@ struct flag_info {
 	int		shift;
 };
 
-struct pgtable_level {
+struct ptdump_pg_level {
 	const struct flag_info *flag;
 	size_t num;
 	u64 mask;
 };
 
-extern struct pgtable_level pg_level[5];
+extern struct ptdump_pg_level pg_level[5];
 
 void pt_dump_size(struct seq_file *m, unsigned long delta);
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index 39c30c62b7ea7..58998960eb9a4 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -67,7 +67,7 @@ static const struct flag_info flag_array[] = {
 	}
 };
 
-struct pgtable_level pg_level[5] = {
+struct ptdump_pg_level pg_level[5] = {
 	{ /* pgd */
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
-- 
2.50.1


