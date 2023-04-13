Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE16E0789
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520466.808102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBQ-0003C7-D7; Thu, 13 Apr 2023 07:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520466.808102; Thu, 13 Apr 2023 07:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBQ-000347-0H; Thu, 13 Apr 2023 07:15:52 +0000
Received: by outflank-mailman (input) for mailman id 520466;
 Thu, 13 Apr 2023 07:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBN-0001gq-PK
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:49 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03ce63d4-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:48 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id a23so18385405lfk.4
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:48 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:47 -0700 (PDT)
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
X-Inumbo-ID: 03ce63d4-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370148; x=1683962148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4h8RYyh5bzZRCknS4UVtSZ4pAXzS4T4Tgcv5Vo44wYc=;
        b=A82X0qygBUotlb7DfIfBGFrNRMxjB6Hi05AXYcE8ng1UX27OkAmm6Q/PFJxKqveD7i
         EB7UqFSYK0P5TZDMiPSPv/ixIlCi6gshIcsvr7Dutopp5imfc1DZBqnTQNSSjN/WYMTp
         BIUVVW8yS8fksYfPJ78t6mQ2SCX1iQYa+vYfY6LH/TKAVAuWC4wzBbR+2A+OmxLuRZz6
         mxdz/AmtFt+RH4qdWt053i/mFucNmnjypNZTxu8RScA4pLwdig6WHhpbJGhtv5phInhY
         tiIlH6/Y1/KbHDIyudkgxuxvjt01vEIN8BXPdWTWTInkwAJQ+KiirwVJC39pozeRQLbi
         S94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370148; x=1683962148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h8RYyh5bzZRCknS4UVtSZ4pAXzS4T4Tgcv5Vo44wYc=;
        b=df8AFcW20vdiZnBhTQqquMjtlsaonyiNq1TYPBe6ua/B+JiNx5EP51xcBPj0YqL7ZX
         DkNT8s8taohm1rIaxRwGWohLS2El/Z/1RHLYd6rX5+f7WjfD83ZNeOaxDkJ8SRB7Ufib
         HbPZf9tb0LCqzQ0ixU1mVKIsIWXdQ/pjNIQN9ssdL3kjU5seflZFV0rcwoB/i4xNYz5X
         XHiWNwrDKKm26bZMwlbQYvTL2fbpJD6KdGoQnkWiKK8lE18PJk+oo6xto0G5qE/jlMVN
         Azw5MdoOyzk4DsFxvP7CBLAk/fnVfhGnwlgpinPGdbzHCPb/YZN2JUNEfAIurTxLJ9dz
         Bydg==
X-Gm-Message-State: AAQBX9e30JWBemLWUZBobmldPHaJmWeZDED+Tan5ma3DoIxHYHwpXtyK
	W2YAyIZvKl/tn4DnAdyjeg+0XMt3vHcPED1BOyE=
X-Google-Smtp-Source: AKy350beH+O+9f6FocX15Q6eI3oQwCr9xsNRMnzQDFyL45vH8snBqVe9+m1d9CZ9/Az5vOcXP12/uA==
X-Received: by 2002:a05:6512:3902:b0:4e8:45d5:53bf with SMTP id a2-20020a056512390200b004e845d553bfmr548369lfu.40.1681370147940;
        Thu, 13 Apr 2023 00:15:47 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v8 06/22] xen/arm: ffa: add defines for framework direct request/response messages
Date: Thu, 13 Apr 2023 09:14:08 +0200
Message-Id: <20230413071424.3273490-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds defines for framework direct request/response messages.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 72e7d0575de5..cf7b7545aa03 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -57,6 +57,19 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
+ * BIT(31): Framework or partition message
+ * BIT(7-0): Message type for frameworks messages
+ */
+#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
+#define FFA_MSG_TYPE_MASK               0xFFU;
+#define FFA_MSG_PSCI                    0x0U
+#define FFA_MSG_SEND_VM_CREATED         0x4U
+#define FFA_MSG_RESP_VM_CREATED         0x5U
+#define FFA_MSG_SEND_VM_DESTROYED       0x6U
+#define FFA_MSG_RESP_VM_DESTROYED       0x7U
+
 /*
  * Flags to determine partition properties in FFA_PARTITION_INFO_GET return
  * message:
-- 
2.34.1


