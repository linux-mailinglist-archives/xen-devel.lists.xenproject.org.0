Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB7A810EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942518.1341744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKX-0007r0-W1; Tue, 08 Apr 2025 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942518.1341744; Tue, 08 Apr 2025 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKX-0007m9-Oa; Tue, 08 Apr 2025 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 942518;
 Tue, 08 Apr 2025 15:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKW-0004Yr-Bg
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:40 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32c6d9b1-1492-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:57:39 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abf3d64849dso966404066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:39 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:38 -0700 (PDT)
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
X-Inumbo-ID: 32c6d9b1-1492-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127859; x=1744732659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djYLrDbV3Sis/iPRVwSs6nFPPnaLACZd6b32FO8Ddv4=;
        b=e99EAUQMB96qMZM4OshldwerdebfSRtZuNXVInGTT8Q2YOmbrOocbYVqox6r+pVdYo
         qg9EZCbcc7B0ylqB11dkWVmLh6DlTr/omenlE5VCT7glJ3vLhLbkKC4i+7IADRPGAozf
         mMDc//PDwGacYR6UfnmnoPdxolhcM8P59FDNTq2POmvcbpfIrK8TEfNLsk4aweRekL5x
         jl4KTAOKQfQMCAnwijh521cm+8VI09BzNLGbUKSV7koE0Ezhe0mPabrcJxcJ1XdGVDTm
         4knAep1LYEcgCZ+WvU+/UMJT+LClDne1zaaPxspzDwA66MR2Q7GVAygX+yBToes95LyJ
         sjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127859; x=1744732659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djYLrDbV3Sis/iPRVwSs6nFPPnaLACZd6b32FO8Ddv4=;
        b=cNcI7vrVYrIECvjHpV1ZywFhDBdmF0w+58TmJcX+6fmpMZTwW3gJtZfGL40t6Ltz0T
         dUA0T97saKcbNVpQXbSpKT4vVFJbkfjIQeHsaAsn7Cqh7xpJ0z4F8gdOyam2u/BQ1hqG
         l3PPbo0xZsvQ+m1iDh33zMOisQ4PZ5aoOHiN5jgbNwyVVn8vsPmmYINzUsrKK/v3eU3z
         +yUI1JC7hULjFQD88MB9sIQZ0EFvt93tLWGZil8nE5oXEKHJ00FbwZyyUobns0adrxJG
         6fkeEu52A5t7KCf3PdaSt2B4YpMbbIZaUkr5iMZdCyDjDQ0L/N8psN11BMYKMVo8MrFJ
         AMPw==
X-Gm-Message-State: AOJu0YyZBY6A0EUqeSCR4JbGdEMq6J0OwTiUnF/eihlCsuf+yPjUWE60
	wnAI1N3lkx4VmOD667wcnCkzg+899EAttce5VnBXdhbh+0kYWLM0iBO54Q==
X-Gm-Gg: ASbGncthMVKPFQdhna3/Qq0GoKHr89PSstl7rRKHcFnUzEn9RnIr35fL7mihIlEUGEs
	JUFjTLK+xWfv8Nws5kV+MDJMAJbv3vobrd6ec32s5xYE0CZw/HMFtkLhOP3F+nNBp/bRuTLtRk9
	KUUG73MO1S/5x726dxxWusetIJgGicRp3eiaXmUnSAJa/FRpdOmdYrQEFwyHy47/u3Px/5z4OjB
	WatTmy1qZoPJy3DhbK9jtO+QiF7D3lw/XQ6TeulOz/kgWSBta5CLy+1cDV6Q61OiFxFqcDon9wl
	gdChUjpqNLP4a9MG9eG7d7Tj0S4rG+geZC9BJ9YrWVLMdh7iclyPhgX8ky94I98CuZxIgiPSI1G
	tg/GOAkZxfKJpag==
X-Google-Smtp-Source: AGHT+IGlCWgNLUjvfhdxskHtyKm9S34QszbzTs9mkA7u0dJWC4KssD3nKAgYHWVPpw3zEEsUdSybIw==
X-Received: by 2002:a17:907:1b08:b0:ac7:7e3e:6d3c with SMTP id a640c23a62f3a-ac7d19f50a0mr1887575666b.55.1744127859045;
        Tue, 08 Apr 2025 08:57:39 -0700 (PDT)
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
Subject: [PATCH v1 13/14] xen/riscv: initialize interrupt controller
Date: Tue,  8 Apr 2025 17:57:18 +0200
Message-ID: <cb730a1293f14dd7fd58f98f5ecda4e2523b2d90.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call intc_init() to do basic initialization steps for APLIC and IMISC.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a3189697da..9765bcbb08 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    intc_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.49.0


