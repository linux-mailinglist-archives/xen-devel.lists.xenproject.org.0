Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A43A170DA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 17:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875028.1285380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3D-0006BG-70; Mon, 20 Jan 2025 16:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875028.1285380; Mon, 20 Jan 2025 16:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3D-00067w-4B; Mon, 20 Jan 2025 16:54:59 +0000
Received: by outflank-mailman (input) for mailman id 875028;
 Mon, 20 Jan 2025 16:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xfr=UM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tZv3C-0005fM-2d
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 16:54:58 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46f996f7-d74f-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 17:54:56 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-305d843d925so40162631fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 08:54:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35aec4sm16581501fa.56.2025.01.20.08.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 08:54:55 -0800 (PST)
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
X-Inumbo-ID: 46f996f7-d74f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392096; x=1737996896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXq8oJNFxqFqbhkJfspIF9HTbKUSA1pwy167cwYkY18=;
        b=SoxvpOZwRY0kgsrDtA96pC4HCJtvIOkWZ8+bnldF/K3FhoE9FlsNB4kFhfiCvacE9R
         ILKFgGvidmEk+JcAYB9tTP/jGw1p0Ss7/N/nWvAVwcLPdwsGQLI/hIZR/7gy3dSHUle4
         5GqB3zKXrbXle0lKbNBpYp0iblyJIC3ybvfx0IkktLhIoJp4hHQjiTq6gW+7pPRVetyp
         iS+VkLBV7wbLJ8rqBQCZvqWcp/9iQSNo02uqkcHpHWWFoDmxoy6+7DSsoVXgtyIPWXy7
         vmrvxTMXtCbntnqlJclglGreSu0isaaLxHjf0iBwhF/Edu3GTDtmrbQmjNKOTZZqXm8s
         zguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392096; x=1737996896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXq8oJNFxqFqbhkJfspIF9HTbKUSA1pwy167cwYkY18=;
        b=t9TX38jjqHdol/bU1VMp7tPgS8AdVThDDOo0mc95JMfWoAc9h6QrY9TAFjHSr5XWRX
         yRer7Rdkkp0V0CZ/zLTz38E0k8Dl73PiIv1edg7lI0Mct1nCZgXzrjt+8L7gw1P+865q
         agiAS1IzIPxfvukByYjQTuhfl51E+EVwzO9H5cSiBHIVIkmxWvVob27aRaImK2m12t7+
         ZWtH7FDy10A9wv8iiwPge5cGS1y4PDfL4zWbd3MOivMI0O03Bzp+C/4D1qfsOpC8J8+p
         t98qM3xOP2b4e0p/NByYgnlvHAarLJ8cXTul8AjJoYE2QheXlaelrm1JSlHLIur7QS/y
         A9bw==
X-Gm-Message-State: AOJu0YwOLUamRN5RneR+PX6FohU4LKh+S3cI9UnvDOQF7ozsvzbNSbZt
	yNU7lC3Oop3NavzKDH0p9IDX9HAmQK36O0huJxk4S2/BK8Klij2p/2YAcQ==
X-Gm-Gg: ASbGncsn13tHXRIvuweRx0k1YnCzhnAnJk7UY/skR43PCig36OGHlGAw6Ao5yDhMJze
	mFe+Wlugoo/BIXBn8I/DhwfBPcsdfdl6jd7gGi/4y6kPtHvmMny9owCyltuuD6vZUQcArkuG0eV
	Dy++UezcAGuguUWcxuDc6yYcpIRjJUGwBuErgqOSLs0GK72ZVyJQ2b22ulRS9geaGX58fAuoqk6
	snyuscNuFBV+cbzt5unrtATcPQvujhCskAChA6Q1ZUtBw71uArYCpEqDaRh8SvaEXIrMh8=
X-Google-Smtp-Source: AGHT+IG+yeo267gkP4ELBuOOmKSTVwh7M1OX0XAwHuYDvtkxZzwBI37tWNfMYNAWGF0DAjQMih51bA==
X-Received: by 2002:a2e:a54a:0:b0:300:3a15:8f19 with SMTP id 38308e7fff4ca-3072cb3c7a9mr56218221fa.32.1737392095702;
        Mon, 20 Jan 2025 08:54:55 -0800 (PST)
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
Subject: [PATCH v1 2/3] xen/riscv: update defintion of vmap_to_mfn()
Date: Mon, 20 Jan 2025 17:54:48 +0100
Message-ID: <bf85f6987c2a2f3374ad47fc0bf1513d69372b1f.1737391102.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737391102.git.oleksii.kurochko@gmail.com>
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
either the direct map region or Xen's linkage region (XEN_VIRT_START).
An assertion will occur if it is used with other regions, in particular for
the VMAP region.

Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
a PA (as Arm does, for example), software page table walking (pt_walk()) is
used for the VMAP region to obtain the PA.

Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index d46018c132..528e1e257f 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -25,7 +25,7 @@ paddr_t pt_walk(vaddr_t va);
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
 #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
-#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
+#define vmap_to_mfn(va)     maddr_to_mfn(pt_walk((vaddr_t)(va)))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 static inline void *maddr_to_virt(paddr_t ma)
-- 
2.48.1


