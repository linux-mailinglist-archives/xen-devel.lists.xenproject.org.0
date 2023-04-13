Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799A6E077C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520464.808080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBO-0002XX-B9; Thu, 13 Apr 2023 07:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520464.808080; Thu, 13 Apr 2023 07:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBO-0002T7-3Q; Thu, 13 Apr 2023 07:15:50 +0000
Received: by outflank-mailman (input) for mailman id 520464;
 Thu, 13 Apr 2023 07:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBL-0001gq-Oz
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:47 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f5e23d-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:47 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id z8so19679192lfb.12
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:47 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:46 -0700 (PDT)
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
X-Inumbo-ID: 02f5e23d-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370146; x=1683962146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGRv/GDtKkNvjjvcwSxhfbYecPI7h/XXuKkIl9vhng4=;
        b=X7rve2g9D2aLGlQZAHVPmtlYVObpWW8EnmykiL2WKGnNOywY4Q7OFH9UXDFlEwRMMT
         NH7Qec7/QDvnggmptfJs7QyBetrWYrnNxAu32nF1Xxppf9sS/j2aCNReb3+aXew09pdi
         M8VBf3qKLuG9tVNafbEZmokeH28cZXT/d3H0h1Wk8lL91cL3Ajddyi4bSE7nbNk7ytOn
         dNol1rAilxv2tWFhxOZaH7pzeUxb9/BPN8zRTC+iSsBUFKOl3p0le9TNfNLFr5JIm2Jq
         b+CTrYLAl9OSg5jvg5C01cTx1i9PnvXt/xUA7xR7P99ElC2cPiTLm1KLUQXaBm5eir0Y
         tTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370146; x=1683962146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGRv/GDtKkNvjjvcwSxhfbYecPI7h/XXuKkIl9vhng4=;
        b=M9WlmdJkLX9R+ua6U0WrUWwJjeRlMkkr4qMJalUsEvkvIeex74lgDxUT9U2Xm7dTO+
         svm+TIzDbkHCsuEahQ0KWUn8pXOGgW9x6VnomM2FtooD8V8H19kn2CrXKJfi5nIuNLeZ
         Cwkp39wGp3XfG+q4zNgtyqcGkCMtNHvH3J0GLrPLlrzrDl/uLEYtxjFzsvDdiqY13zjR
         WdPZyMtq2+wQutIcpAgam6iIXTqMD9y8PEKVkt8InMSFVE/7nkawL5S2dEyWpWHmBWif
         ldlNv3miMTjQy8q6H7bY21hlUDzFllG8ntVSCjNRrSq5K7vxETddfLIu8YxBhkQ4DzBC
         1FQQ==
X-Gm-Message-State: AAQBX9dRRP6JkPOorjS/2b6hzMb6ZWUMvKPFTOGKmVo38QakBD9TYgTo
	c+Rnm7aon2IijxbWXBpqZcuTM4yeubij2OXoWgg=
X-Google-Smtp-Source: AKy350Y8rJotM9HbgaonmZirdkGyCcpi9jzouFQD7iz2ghgpp2OU5rPRMQUwThOKh97sZcboONDI2w==
X-Received: by 2002:a05:6512:11c6:b0:4ea:f526:5bee with SMTP id h6-20020a05651211c600b004eaf5265beemr456649lfr.11.1681370146419;
        Thu, 13 Apr 2023 00:15:46 -0700 (PDT)
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
Subject: [XEN PATCH v8 04/22] xen/arm: ffa: add remaining SMC function IDs
Date: Thu, 13 Apr 2023 09:14:06 +0200
Message-Id: <20230413071424.3273490-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the remaining SMC function IDs from FF-A 1.1 specification.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index aaf74c287aef..ba0942e76993 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -60,7 +60,41 @@
 /* Function IDs */
 #define FFA_ERROR                       0x84000060U
 #define FFA_SUCCESS_32                  0x84000061U
+#define FFA_SUCCESS_64                  0xC4000061U
+#define FFA_INTERRUPT                   0x84000062U
 #define FFA_VERSION                     0x84000063U
+#define FFA_FEATURES                    0x84000064U
+#define FFA_RX_ACQUIRE                  0x84000084U
+#define FFA_RX_RELEASE                  0x84000065U
+#define FFA_RXTX_MAP_32                 0x84000066U
+#define FFA_RXTX_MAP_64                 0xC4000066U
+#define FFA_RXTX_UNMAP                  0x84000067U
+#define FFA_PARTITION_INFO_GET          0x84000068U
+#define FFA_ID_GET                      0x84000069U
+#define FFA_SPM_ID_GET                  0x84000085U
+#define FFA_MSG_WAIT                    0x8400006BU
+#define FFA_MSG_YIELD                   0x8400006CU
+#define FFA_RUN                         0x8400006DU
+#define FFA_MSG_SEND2                   0x84000086U
+#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
+#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
+#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
+#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
+#define FFA_MEM_DONATE_32               0x84000071U
+#define FFA_MEM_DONATE_64               0xC4000071U
+#define FFA_MEM_LEND_32                 0x84000072U
+#define FFA_MEM_LEND_64                 0xC4000072U
+#define FFA_MEM_SHARE_32                0x84000073U
+#define FFA_MEM_SHARE_64                0xC4000073U
+#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
+#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
+#define FFA_MEM_RETRIEVE_RESP           0x84000075U
+#define FFA_MEM_RELINQUISH              0x84000076U
+#define FFA_MEM_RECLAIM                 0x84000077U
+#define FFA_MEM_FRAG_RX                 0x8400007AU
+#define FFA_MEM_FRAG_TX                 0x8400007BU
+#define FFA_MSG_SEND                    0x8400006EU
+#define FFA_MSG_POLL                    0x8400006AU
 
 struct ffa_ctx {
     /* FF-A version used by the guest */
-- 
2.34.1


