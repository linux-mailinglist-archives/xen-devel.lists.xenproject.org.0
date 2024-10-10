Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9746998BA7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816298.1230491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv83-0004eG-Bi; Thu, 10 Oct 2024 15:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816298.1230491; Thu, 10 Oct 2024 15:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv83-0004bD-94; Thu, 10 Oct 2024 15:31:03 +0000
Received: by outflank-mailman (input) for mailman id 816298;
 Thu, 10 Oct 2024 15:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irsw=RG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syv81-0004b2-VY
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:31:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7646527-871c-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 17:31:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a993f6916daso183131866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 08:31:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2593sm101640366b.215.2024.10.10.08.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 08:30:59 -0700 (PDT)
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
X-Inumbo-ID: a7646527-871c-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728574260; x=1729179060; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u/Ff4uhO76XfAiNx4bSouxAMZpkphs6/ww58X4Rg0g0=;
        b=SPwdH7heLfyQUAanumh993bZnKiFv2MfE9qk+IhZUhv4AmwfLng9LlSnGn8Q0gBNc2
         6HDKA4sYPs2/JlnAAgakcoxP3+QUikIFj7an1Q63YiSItkGF2APmU0gHDCfAJvYXF5/L
         PTAnTK9UQASBhLZC8bHWP8BOxzqUkFu3srRomQVVGH3D16oTCicJVvzWCuuzG/mBcjbX
         fcrZu3vx/IfPnoOWvW95R/ZY1om7/H0i+1Q1PzYEthuz/urmgEgBVNp3GKaUrpE4T1fQ
         He3VpXmhAia44qtMWz+hnnP0E+uQBm1tLtJ/4L6w0cxnFqG6fdQ/BMDLaL1DbwE1Vh52
         X4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574260; x=1729179060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/Ff4uhO76XfAiNx4bSouxAMZpkphs6/ww58X4Rg0g0=;
        b=U0IHrXtk8BxtoBrPTXTcDGxW4soIK9voE0YIkfiIZaPtIDONSFd12p7DMUShx6L9sR
         Ub8XZqZZmjhGdsa3G0D3Uy2RKQmPbmtdK93+LDsQ2NWZKbJ2wf8ptYgCeTa4Le1Pl+y/
         UZxnE5aJrPLTneuDcKMZX7sIJmCco4QpIZYKeJiVMLdbeKe25yw4Fczg+cpt7KHNpk4n
         7cziKKuWMrNtPnWaM/92S2ZzXlXnM5TAoFEvsvKNsxxeTwybgM+c4SAi8z8D48+SK9r5
         jcdAyBfIETVIppI97fTT7M4riFYXV2SmGeLSR1ZZgnclyRRCPi6qyeRu/cJ5Y8/NLLIj
         NgPw==
X-Gm-Message-State: AOJu0Yw2VageJUqIRCiYTJsloeKa5UPQ5qNDPexKQmWkRDoiZ9JqRlmn
	PzY1AiuM4MpX/W1qpdco1f7x3ymCwL3oEKCThWHuBo+Z2EncMzuFDyeZjg==
X-Google-Smtp-Source: AGHT+IGrGo8Ur+4r4LieF7Suxdi6KoSwOXw4SGwTOMI9D4z0SSx64TmvVsAjkDQSBmW0CTVw/W4X6w==
X-Received: by 2002:a17:907:9728:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a998cf4d7a3mr542202366b.0.1728574259786;
        Thu, 10 Oct 2024 08:30:59 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Parse and handle command line from dtb
Date: Thu, 10 Oct 2024 17:30:52 +0200
Message-ID: <cover.1728481578.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series initializes bootinfo from dtb and then parse and
handle command line from dtb.

---
Changes in v2:
 - Update the cover letter message: drop information about patch series
   dependency.
 - Add Acked-by for the patch 2 ( xen/riscv: parse and handle fdt command line )
 - Minor changes for patch 1 ( xen/riscv: initialize bootinfo from dtb ):
   - Drop local variable fdt_size as it is going to be used only once.
---

Oleksii Kurochko (2):
  xen/riscv: initialize bootinfo from dtb
  xen/riscv: parse and handle fdt command line

 xen/arch/riscv/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.46.2


