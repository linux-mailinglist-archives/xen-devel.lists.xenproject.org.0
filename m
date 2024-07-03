Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DC1925959
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 12:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752891.1161145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS3-0004HR-AK; Wed, 03 Jul 2024 10:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752891.1161145; Wed, 03 Jul 2024 10:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxS3-0004Fl-6p; Wed, 03 Jul 2024 10:43:03 +0000
Received: by outflank-mailman (input) for mailman id 752891;
 Wed, 03 Jul 2024 10:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOxS1-0003zy-0H
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 10:43:01 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0391a4ad-3929-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 12:42:59 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a70c0349b64so684727366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 03:42:58 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b92985desm414590066b.78.2024.07.03.03.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:42:57 -0700 (PDT)
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
X-Inumbo-ID: 0391a4ad-3929-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720003378; x=1720608178; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G/A7NPWRh6mPuP+ZzOUK2A1wKjvppqVXw3/IEnVJxs=;
        b=ak0tmmX/ZQjBL43Gvuil5z1AQUKmCbHBd+EiPiJGmMW+rD2czkAm1kBE2H8LE6mo9O
         IcroTJ2MA9ni0HdxvZBzsp54pw+XllDChjw1guzTAytis3iFxwlEaYmCd+7Dw0s31KQW
         uGxpkHCD9GxAzLrro75gzeS6GxeCvb5fdm4vbQMLK7O0As9Ceq80W+KOap4tL1HJrXCL
         dtMVcYaUQ1dYGd5+KaIsNdb2M7GCTiHRDLZQGvjTJg0yyhuwKbv0VqrU+2WBZ6LhmUix
         tUMSnT9DHPQf1W7sha7Vm7n76pSmaN9eaytxsYzILRoDzbMrDhXX9FDiuQlJThpBJeLW
         zaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003378; x=1720608178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G/A7NPWRh6mPuP+ZzOUK2A1wKjvppqVXw3/IEnVJxs=;
        b=qfRYYmUQP7jJwFnpTJdBZMeIR43NjoTsDAFt/fVJ+8wX7UgfFNmD7SX2/EDZJygxZI
         W+DOsy0yE8QA7c44mgp6pGTiQJuZWSNOpqYnNNpf8JUjBGkstYQjz4CYV0kdZ8UFwfJc
         XTJgcNYMBXeA5cdp2+YtPAuXibln1wWA4S3WiYLZFhXx4c7yG8OA3V0LJxY9o9Piypql
         /EBCfi8cZAILuDEOO5+yCiahBAKwmbShDKyaLu6BuWUe5425wmIFL2ERpjLBiffktVEQ
         qHzBnU4SZuxqSPs4AzpOGwU8DmlN+oJwpaKX/b4F8wL8U4A55YOxfPG1CaFZP90F68He
         hRxQ==
X-Gm-Message-State: AOJu0YzTqR3LEqHrLr0eyAhysexhjSF/1AHOuRkbvurpHau0STCJQ0B/
	QdY/wIRVPBbY81aD5vcGty/1J5aLJRWtxrGE/W/i7LUXPHrWZ85kt4SKIQXK
X-Google-Smtp-Source: AGHT+IF0e8OlBOffvF4PdyITNIFA1vPC47T7cI8Tz6isT4NspLNQ0rQK8izoqHNJIJNzCDw7uMtKsw==
X-Received: by 2002:a17:907:6e9f:b0:a72:7d5c:ace0 with SMTP id a640c23a62f3a-a751440bbaemr799692866b.11.1720003377862;
        Wed, 03 Jul 2024 03:42:57 -0700 (PDT)
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
Subject: [PATCH v1 3/5] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
Date: Wed,  3 Jul 2024 12:42:49 +0200
Message-ID: <8861be6624f50c927a8dadbcf056aff2dc0576ab.1720002425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720002425.git.oleksii.kurochko@gmail.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 74ad019fe7..1863a5d117 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -5,6 +5,7 @@ config RISCV
 config RISCV_64
 	def_bool y
 	select 64BIT
+	select HAS_DEVICE_TREE
 	select GENERIC_BUG_FRAME
 
 config ARCH_DEFCONFIG
-- 
2.45.2


