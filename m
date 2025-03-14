Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949FA6177C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914866.1320492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8mu-0003Yq-38; Fri, 14 Mar 2025 17:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914866.1320492; Fri, 14 Mar 2025 17:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8mt-0003Wc-VW; Fri, 14 Mar 2025 17:25:35 +0000
Received: by outflank-mailman (input) for mailman id 914866;
 Fri, 14 Mar 2025 17:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8mt-0003WI-Dg
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:25:35 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55cd188f-00f9-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:25:33 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso411397566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:25:33 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:25:32 -0700 (PDT)
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
X-Inumbo-ID: 55cd188f-00f9-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973133; x=1742577933; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D88teVB8QraJI8UkkRbNWyapnCrKK4Sforaz0HF/IhM=;
        b=YtkYHTz0O6kd9sAc0a9JIH8KckLarfRGMhY/Y55TRx4qTe90cFyYWE2xkr7peYMRc1
         bRTjhfA0nN0hHdaxCtwj5qD16JgUh5PtOH7ZQeD9IxsEZ4Qxkqie3c0icL0Vs/Jz3huV
         hW/rl8vovw04rxiODzVOUaVhAs1lUnk9sGnz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973133; x=1742577933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D88teVB8QraJI8UkkRbNWyapnCrKK4Sforaz0HF/IhM=;
        b=SPvsDOcYrCAVbo9PAhvNxuuT5aoqNwiroBHgNGe0IjIJDCeN9wUYbseN3IcylPrYxr
         EkEQ0VR3bgGjLmYELhLaMLHkNkmn08f/Tmu5C+ZYAqFdpGPcDtNO/xN8gQyxgy2zfJHS
         W6cZbtLQcgY7+7PcxmY72fv74AJuIF0+gwUKFms8HYp1JiErJoET7OJRd9W33LXGM/tN
         YnPU/tfWU+VuKc6Dv68kQnKpU1bupNib0dvAQ6lAT1iz5O0na8TBSpvmOMS97lbqvrNJ
         KTk0u/45iNvf//akYus6ArjH6WOqX3eNqu30UPX1EWsjWfZneSdzGw3dPT3ChjBLmt+4
         O9HA==
X-Gm-Message-State: AOJu0YyGPJLO0lv8XfF8+D5FGyyreDRTjMVguLaIoBRSWxbdWaMlcAyX
	kdbZiqoRso8vpaQg568xvLZydk4olbhuhjzoA6nd5Eu2VVzZUKt45NTvCnZmrNVxcd4YF+//Jaj
	e
X-Gm-Gg: ASbGncueeobaSPZsU9seKso+cHGaQ4N5QnD6ibLrsvunG7YnLW8XQ4O5KfzSZAUXcAJ
	cSBSsN9KsW9P3c7/hDT1c902n/v6KZp551rSJRtaErCE2ObsL8PwEqapQsYHrT4KJeVQDMdVOBV
	bSKreJwHlFZBbfJGiYew5spV3ag9G+7J6C0aP08uueEor1h2mtE693g9le5E+bv3UJ9uv6OvXPZ
	3sMdxGrlHx9uTE2Qlliz0lk3QX2qnQ0hNAaSw/QxJLXoIE56UEFiWofwWIldjSSF51ZzItbANh+
	n5DxJIDT83XvWBuXSw/E38c4pvRNFI+Ek4ixqAzujoLxGgxV5VZJQlM5e8+/lh1vCkk=
X-Google-Smtp-Source: AGHT+IHF+okTXpoKk3F3RN6+H/q9LDUWzo3CUgJjnS2eIVHjtz6xVjONzkwXnSSZJAQyrsQrJwTsJA==
X-Received: by 2002:a17:907:9485:b0:ac3:2a77:cb4e with SMTP id a640c23a62f3a-ac330189240mr367576266b.13.1741973132888;
        Fri, 14 Mar 2025 10:25:32 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 01/11] xen/memory: Mask XENMEMF_node() to 8 bits
Date: Fri, 14 Mar 2025 17:24:52 +0000
Message-ID: <20250314172502.53498-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it is, it's incredibly easy for a buggy call to XENMEMF_node() to
unintentionally overflow into bit 17 and beyond. Prevent it by masking,
just like MEMF_* does.

While at it, turn "x" into "n" and "f" to better indicate whether the
macro takes nodes or mem_flags (just like their MEMF_* counterparts).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/include/public/memory.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b5297..077eef48c60d 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -32,8 +32,9 @@
 #define XENMEMF_address_bits(x)     (x)
 #define XENMEMF_get_address_bits(x) ((x) & 0xffu)
 /* NUMA node to allocate from. */
-#define XENMEMF_node(x)     (((x) + 1) << 8)
-#define XENMEMF_get_node(x) ((((x) >> 8) - 1) & 0xffu)
+#define XENMEMF_node_mask   (0xffu)
+#define XENMEMF_node(n)     ((((n) + 1) & XENMEMF_node_mask) << 8)
+#define XENMEMF_get_node(f) ((((f) >> 8) - 1) & XENMEMF_node_mask)
 /* Flag to populate physmap with populate-on-demand entries */
 #define XENMEMF_populate_on_demand (1<<16)
 /* Flag to request allocation only from the node specified */
-- 
2.48.1


