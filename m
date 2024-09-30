Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731C98A842
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807457.1218936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI5U-0006Cn-Fk; Mon, 30 Sep 2024 15:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807457.1218936; Mon, 30 Sep 2024 15:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI5U-0006BE-CR; Mon, 30 Sep 2024 15:13:24 +0000
Received: by outflank-mailman (input) for mailman id 807457;
 Mon, 30 Sep 2024 15:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svI5T-0006B5-ME
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:13:23 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88040624-7f3e-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:13:21 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5389e24a4d1so4096785e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:13:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5398fd3533asm677366e87.133.2024.09.30.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:13:20 -0700 (PDT)
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
X-Inumbo-ID: 88040624-7f3e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727709201; x=1728314001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bV27vGvI/N21dXSwfbo1urq3iu313VbE3qq9p0DF84=;
        b=U+gmvysChu0SC9ETUvqkF2LsiiR30pUbND91QoeEk0WIO3RkZiwLHK+VWkCcmzspBD
         XGN6aQtrVd1VjUsP4ENNiig/TSFaGppBvWpy41gxV74z2rULumys84r+Jc8AnKaL6MjY
         nEyKqagujGvCAKC8J97WzgqTpECcRGSxnnthzFfFNx2kajzrnmVg5cZER+SC9CBeT13D
         7c1zZ83CONaIoH/i1H7BGCV//Jk+0hVoylw68s6mvJHFNQPDyU4JfxhDUn4lVOlPjsfG
         19mrbQ0gOcYO78jka2Dyy8qwHovaf11NTbxZhrSco53o+sKRs/y6KMAEB22Z3qui/3qr
         NQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727709201; x=1728314001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bV27vGvI/N21dXSwfbo1urq3iu313VbE3qq9p0DF84=;
        b=BGr5wMImrzzYl3uGW8GjA2nvPPa60to52Vdnnb8Eu50vn23jwBn69coSfHNJFi60eh
         gwoIRD2HEsaKiCWAuTBmOWQg7vIXU8clI2zOME0lRCRs+AFpw1PyKXBsS8e0U83raCMQ
         CbzZY9fZhKcjZX+q33w55MSxLRCvh/j9Gvq1PlPol7A2Tk+JcRpr9gcg5RmEb7acWvxD
         GvOUBiHCeyDckf43pBVDWFohrIB6f6YpZwx/qV5BUnvPOf4H0GgsGb4Zr8ymTlumLs8l
         TkdB8XNRIovV+G34VHdrTi6NIvH0qVC14k0lKfSofSyF+hs8qccEtbJWQ2XJX34aqkeA
         BJYw==
X-Gm-Message-State: AOJu0YxVaVIgrch0McZ+2Ev8YbI/cWvtojElnwvojZcGv3VOmfYdHNTt
	FpYdk9hdvE1m2AYPKyAy0Iq8l7wcAua3D7Dd+BtAC2Op70tMH0G+fYIqpw==
X-Google-Smtp-Source: AGHT+IGYSfvUnLMmUfaprDpXe4w9cDSut2rIkRHwljq02HQZSm3NMtmIEuxd2N8InYOolgjRmPW6qA==
X-Received: by 2002:a05:6512:31d2:b0:539:8d67:1b1b with SMTP id 2adb3069b0e04-5398d671c9amr3231499e87.26.1727709200880;
        Mon, 30 Sep 2024 08:13:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/2] Parse and handle command line from dtb
Date: Mon, 30 Sep 2024 17:13:16 +0200
Message-ID: <cover.1727708956.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series initializes bootinfo from dtb and then parse and
handle command line from dtb.

This patch series is based on the patch series:
  "Register Xen's load address as a boot module" [1]

[1] https://lore.kernel.org/xen-devel/cover.1727708665.git.oleksii.kurochko@gmail.com/T/#t

Oleksii Kurochko (2):
  xen/riscv: initialize bootinfo from dtb
  xen/riscv: parse and handle fdt command line

 xen/arch/riscv/setup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.46.1


