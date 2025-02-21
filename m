Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631FA3FCA7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 18:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894529.1303236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlWQR-0007X5-6S; Fri, 21 Feb 2025 17:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894529.1303236; Fri, 21 Feb 2025 17:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlWQR-0007VQ-3N; Fri, 21 Feb 2025 17:02:55 +0000
Received: by outflank-mailman (input) for mailman id 894529;
 Fri, 21 Feb 2025 17:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jkcg=VM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlWQQ-0007VK-A8
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 17:02:54 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b062ef2a-f075-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 18:02:53 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-54527a7270eso2349397e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 09:02:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5462cb28b60sm1005199e87.153.2025.02.21.09.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:02:50 -0800 (PST)
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
X-Inumbo-ID: b062ef2a-f075-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740157372; x=1740762172; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSCir598LGNdv+E28EDZq8itwovdKCQa3YLBf5vzXcY=;
        b=hCUsRjMenYzyVtzdvE4pkcRrYEbCu6B/VkoXHPNwHTz3vw/FifjTfgb5IxCt6sQHed
         teUutptU6dxzMgpP1qkPjdwuNhgH7XvT0DA3CAvjVuve3IR7NZj0go+Q6+Gy+su0UGGo
         S90TydwaGL4/j/aJQWbaSAkaNe5TcznL2eehGhsENVk6V1hO2C0/9GWAQMAFdzb0/xq+
         cTaM192cn7sOciBayxh7BkUMk48u8Cyndn/2+TPgq2GQAw+qVuXnjmJXTsbdO9qMZmSk
         9ce6ELTnf1+J928qeRV1zi0WI5XdGXm7QfSOdYZoNkPreU9ojy0QLZLJov2h7MoBFrjd
         y0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157372; x=1740762172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSCir598LGNdv+E28EDZq8itwovdKCQa3YLBf5vzXcY=;
        b=XaLpD4xiatHTthmgSa0XIcATXCC4+NZKFUZaOs0oT9e8qns3/MGsS6bTBg3UuPgjtX
         qjdnobTd79N977y0tWQFmk1Yv94n7FNrhrzSnCcgqLdABXGU8Ve+CxxKS/gavkxY61ox
         ak85A349D3DDM77GuHdV1HWPpMeTTicUhjxn8iuGEvV2W5TRF1NGfEKNqmsIMGz4DEFt
         H+ISjLo6l20Y7TisDGlXAYt/ArmAngaHV1pLMuIg0tKvB/gm8biC1oqySFg8zNSTNte7
         lnLSrshkwF6sF6wem0CAbLU6CLNRg0HssylyUkNf/yyO1GJA0WfdeK1OV5xlEhOTiwRl
         232g==
X-Gm-Message-State: AOJu0YxerqWUy5I1VPqN1zNBkQHqm35MHQ62Hr5XAVlDm0A+ftRO04WZ
	rZV6eJLq0qXjh6XfcSNMhOvqwc7Ks8EFA92dYgdy3CTfz/GoVoppGOZS3A==
X-Gm-Gg: ASbGncs3R8F2FzFG4KhkTSAVj6hgONiigQSinMXNrrJzwg274mzWxxJSfsW0CgGwSCH
	P3PAfXyDSAJS4r13xVUam7lxjm1Xc5Sy9egaEAEqM6cGWLz4GoJhaYeG+XGIoDKcFTEfWfWGt0z
	QtpqDG9xIPVo6FGEoTo7r+foKw5N610QbNbCKi72pXwCxxCVOquv0kGIFeDDFbjx6qJ3F51OGmy
	kWs/6ALCAyzpMx4zNjXUtFsvvPKrnPYtMUc/MrtxqiRWHBDCyCmZFIYEPbIvgfyvrtCcMosuByJ
	hmnnCdTqqKUmyAykCgMqqvkrSMk=
X-Google-Smtp-Source: AGHT+IFhTf+TBWWEItH+P3OS5HLn+E0qrL5/W1w2O2Y9k56+2KFRWsGXLVFb3pBQfjokrk9I8EL1rA==
X-Received: by 2002:a05:6512:108c:b0:546:207c:1c59 with SMTP id 2adb3069b0e04-5483925982dmr1975899e87.34.1740157372091;
        Fri, 21 Feb 2025 09:02:52 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for 4.21 v7 0.5/4] xen/README: add compiler and binutils versions for RISCV-64
Date: Fri, 21 Feb 2025 18:02:45 +0100
Message-ID: <5d71d27f7393753d549c73ab2e5639acc2260df8.1740071755.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740071755.git.oleksii.kurochko@gmail.com>
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the baseline for the compiler and binutils to >=12.2 for GCC and
>=2.39 for GNU binutils, as Xen's GitLab CI will use the Debian 12
container for RISCV-64 testing. Therefore, these versions are expected
to be the minimum supported versions.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index 373885523c..9e401be4ac 100644
--- a/README
+++ b/README
@@ -48,6 +48,9 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.48.1


