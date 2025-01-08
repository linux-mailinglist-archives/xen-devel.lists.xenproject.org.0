Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7EA05FE7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867496.1279125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq4-0003LB-4L; Wed, 08 Jan 2025 15:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867496.1279125; Wed, 08 Jan 2025 15:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXq3-00037b-NR; Wed, 08 Jan 2025 15:19:19 +0000
Received: by outflank-mailman (input) for mailman id 867496;
 Wed, 08 Jan 2025 15:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXq1-0008Ue-2k
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:17 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0bb7f6-cdd3-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:19:15 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so395569a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:15 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:14 -0800 (PST)
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
X-Inumbo-ID: ec0bb7f6-cdd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349555; x=1736954355; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC/g8x4OedY7trloFSvWpnFUkcUT8czZLIGCqOW++Ak=;
        b=ZMH4rZ5n/W52oYgp1tkLEVCeBzzJWq7QFWI2CSKUE9u337bxBbx4XQffWax71gQv+S
         1L5uinKZa68Y0XWmDHO9pOG0dr5bJVSovlnoRw6XWWkqnBHGs+E6zNHk8hYenb9/ReGF
         UbyqZ7uv922V4HetHW1khkjajK81LlJGPvSDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349555; x=1736954355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LC/g8x4OedY7trloFSvWpnFUkcUT8czZLIGCqOW++Ak=;
        b=iCx/+mYxicilCDAmCCxM+GLx9G6e29a+Yp7hYrajwf3QJ0TMSK3J615Eax9yszpDeD
         39ZEq2Uijf6R56Z3MdMf21xK3VdXz/cPSV8KSmqXdrtqGpOa77NOVUn+QE1CpWzHQNzr
         kLw5D6ETy/adigkyzS6C9hiA7DTvP3hv25aYws0nxlgRV/tKEL/Hb4tMyptyQ4Pqbrf6
         RR7oiKhSdy4OxJzn2r8/iwOlCFMy3MyRj30zT4ew37fBea+b6mlckQJIT3b+bnwP20oE
         G0pbqAYQTQiK1I9jibxb7jsP7c4jUMyt1z2ocouignBGLPcxp7RfoXibvNCkUGKsd9I1
         BvlA==
X-Gm-Message-State: AOJu0YxVZ+ZHO01U22dXywOGSpaIXwZcgdD46NyhqRV0mVLgA9LRGZry
	s96pp00aLbiz/wsrzg28Tra3DD3w9/bbNkMn2ci11IbR7FfUTaHL0X232Jzizho/JhdGQvb3pw8
	VU3VNNQ==
X-Gm-Gg: ASbGncsboEhwv5a7Lx6imknQjPkoiNh3IrEDvf+jq8mc/bsRuUUV+2AxH+hVfQBv8kK
	nxvuoYZih0geYpJVh8Pkg4zPTW8fPQECd8TbnqvTCDPOhp7VWR1mdS3d1tMRaMzSQruXyPEKt5i
	fpKzUUVN1Ik2KVGz9HbzKSTGpdeLkBRuheF/1L9b8tP7vLv86RSD8IQCHmwnQ6WCVaeCrDQNaKm
	+Q2oT6gyqF8/Q4uq/k8+F7KsFuY/zSlcSO9u+E6phDJ/0DP8sXOBmAqwAOdZDhUXgl8PLxhyDGL
	uQk=
X-Google-Smtp-Source: AGHT+IFgF0QSUh74KgWW/mU+J3nBtJOl0SmmwvnWpBL0fo639DqkdvXF9jxD0MEjJF6UsgiJnul6MQ==
X-Received: by 2002:a05:6402:354c:b0:5d3:ba42:e9d6 with SMTP id 4fb4d7f45d1cf-5d972e14828mr3116152a12.17.1736349554733;
        Wed, 08 Jan 2025 07:19:14 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 13/15] xen/arm32: Hardwire zeroeth_table_offset to 0 on ARM_32
Date: Wed,  8 Jan 2025 15:18:20 +0000
Message-ID: <20250108151822.16030-14-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include arm32 in 7c72147baa22("xen/arm: Restrict zeroeth_table_offset
for ARM_64"). Otherwise `va` overflows on shift in DECLARE_OFFSETS().

Fixes: 7c72147baa22("xen/arm: Restrict zeroeth_table_offset for ARM_64")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/arm/include/asm/lpae.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 4a1679cb3334..d07456ffc8e3 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -259,7 +259,7 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
 #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
-#ifdef CONFIG_PHYS_ADDR_T_32
+#if defined(CONFIG_PHYS_ADDR_T_32) || defined(CONFIG_ARM_32)
 #define zeroeth_table_offset(va)  0
 #else
 #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
-- 
2.47.1


