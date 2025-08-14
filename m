Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E8B2592C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 03:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080522.1440891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMtv-0007CI-Bu; Thu, 14 Aug 2025 01:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080522.1440891; Thu, 14 Aug 2025 01:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMtv-00079H-92; Thu, 14 Aug 2025 01:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1080522;
 Thu, 14 Aug 2025 01:37:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7ku=22=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1umMtt-0006vN-OJ
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 01:37:05 +0000
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [2607:f8b0:4864:20::d2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e87a667-78af-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 03:37:05 +0200 (CEST)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-88432e654caso536739f.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 18:37:05 -0700 (PDT)
Received: from kf-m2g5.. ([2607:fb91:1183:972:ee53:76c5:e875:9619])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-883f198db02sm467297239f.16.2025.08.13.18.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 18:37:03 -0700 (PDT)
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
X-Inumbo-ID: 2e87a667-78af-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755135424; x=1755740224; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/SZRhE3SJCIr0OIIkYzLukWKambTVoB6JuSm57Cvgc=;
        b=UA8v+xcLn5ttoMZX+aPH4niQsMFoERdsLrWU6DclESEnLzAJwyUSjy2a+WEl7c0qz3
         fd9So9ujRcR6NGlDGz74xy2GR3AWTJOS2gtZ0YcJaT7oxkUdNW8Vg8+el8u1wMzn3RJk
         0YTWOr68p3RGw0hZGhvJlTBs8Du4ioX7c/kAOGNoQL4GuWgmWl3TwhnqbaV3C+Prb+2b
         qGQGv2hqBafNDZLYoCwsW17DOHlfbsPVz21OSZGgxnEWH8CHU2mqoqd7odhkEhR41s92
         Mxak6uL35oZFrjZnVVWaExyryHcyCaYnCAige/uSL9fIdjcLzAxMBKYJc3eKEe5sZeF5
         tH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755135424; x=1755740224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/SZRhE3SJCIr0OIIkYzLukWKambTVoB6JuSm57Cvgc=;
        b=dkEgP9UCJUU+SdJhdwec01vo9GpQSj6idkMo0eCBdFKvDxoQ3PFN08GwUDASEXWHYB
         LtVqNoaGEuvJAJz+4JkFRDjEf6BWhcDQ+myOuHjKnK5U8uPeYpPCFByUTKcDB/6ZCYuC
         sXhS5QkSbKWQQ9NCzEOYq6IwPs7ra4dVZN4wQmQFDOTQxrf4TM9Ho+e632JpMzrmboTB
         zI6FBGr2HC2NUcERELtyLbDBf29TcpPWTrntpAyigdkh9MaA44HDsfO2ktYNwcoTQfcO
         hn28VZ6tONRUYSBrTbj+/gYe7jaSEQdqNNMlxLy6L7tgfjgPfXwvD4cPyG96paHGWKUL
         7sxA==
X-Forwarded-Encrypted: i=1; AJvYcCXA8lw2TC/sX+S/n//BzveIVwcYIIvWpXF61PM2EI1YKPkDnK8zwB1Jl5e3e7A7o9/KwN2kULVcEkw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD3uWVlJrmRhTYZwZMdr/2JGvaTuJzb0WrPYI3+AOcDBSOwzmr
	h8/P7TzIzT8y/ghNi8hGoktHnFHFHva84ksTmKXWa/dsp5SC5pMOBjXy
X-Gm-Gg: ASbGncswPewemgbtVz3EbaN0ChslfuFa3Z3Z4Oqicpq9PE4R2wyvHbtRlU/ukmRBS+I
	dNTbS3XwvjdNSaxAM4mmUk/uoGmmBAOe2b+wBJboTaQueVPACVclDXhjOOUx4P9ZUcclKolD0St
	IfqXRTmm/xXuxLjb35bAwQXc5UTJv3lQcMMYDy9+IFJ3YfxAC/mJoY5gYGs/KZIbjE++utW09SP
	QySgOqfU+2BpHgYj3JXbywkp15iVc/trfKfVrwRznWHzMy6W+ruwSWMw5zaRppqDxdkMmXuT3BB
	9njHXR35Fo8G67R25Af9s6R/ASeX1WSGPzJLWUMV74p33l3ZakjeuMROxBua+amtqglB33lDLLA
	69Bx9H7UJQEHeou8/ZO10YQ==
X-Google-Smtp-Source: AGHT+IFkBFufD9NJLEGIm53oPkL0BcTN2+qjfbO0wMlwwfydkYk1JI7gRnf0MbVB7D9whEElxmF6Kg==
X-Received: by 2002:a05:6602:1584:b0:881:982b:994b with SMTP id ca18e2360f4ac-884337e10b5mr76340639f.1.1755135423756;
        Wed, 13 Aug 2025 18:37:03 -0700 (PDT)
From: arraybolt3@gmail.com
To: grub-devel@gnu.org,
	xen-devel@lists.xenproject.org
Cc: Aaron Rainbolt <arraybolt3@gmail.com>
Subject: [PATCH v5 1/3] include/xen: Rename MAX_GUEST_CMDLINE to GRUB_XEN_MAX_GUEST_CMDLINE
Date: Wed, 13 Aug 2025 20:36:43 -0500
Message-ID: <20250814013645.2488043-2-arraybolt3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814013645.2488043-1-arraybolt3@gmail.com>
References: <20250814013645.2488043-1-arraybolt3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aaron Rainbolt <arraybolt3@gmail.com>

The xen.h header was using an overly generic name to refer to the
maximum length of the command line passed from Xen to a guest. Rename it
to avoid confusion or conflicts in the future.

Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
---
 include/xen/xen.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/xen/xen.h b/include/xen/xen.h
index 692f97a..fdf0fc4 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -823,8 +823,8 @@ struct start_info {
                                 /* (PFN of pre-loaded module if           */
                                 /*  SIF_MOD_START_PFN set in flags).      */
     unsigned long mod_len;      /* Size (bytes) of pre-loaded module.     */
-#define MAX_GUEST_CMDLINE 1024
-    int8_t cmd_line[MAX_GUEST_CMDLINE];
+#define GRUB_XEN_MAX_GUEST_CMDLINE 1024
+    int8_t cmd_line[GRUB_XEN_MAX_GUEST_CMDLINE];
     /* The pfn range here covers both page table and p->m table frames.   */
     unsigned long first_p2m_pfn;/* 1st pfn forming initial P->M table.    */
     unsigned long nr_p2m_frames;/* # of pfns forming initial P->M table.  */
-- 
2.50.1


