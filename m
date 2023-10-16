Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CA7CA029
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 09:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617261.959734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlX-0002WB-LQ; Mon, 16 Oct 2023 07:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617261.959734; Mon, 16 Oct 2023 07:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlX-0002Pl-HN; Mon, 16 Oct 2023 07:11:51 +0000
Received: by outflank-mailman (input) for mailman id 617261;
 Mon, 16 Oct 2023 07:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqiJ=F6=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qsHlV-00027t-MD
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 07:11:49 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 458c391b-6bf3-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 09:11:49 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6b77ab73c6fso1465181b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 00:11:49 -0700 (PDT)
Received: from localhost ([122.172.80.14]) by smtp.gmail.com with ESMTPSA id
 4-20020aa79104000000b0069305627491sm17212825pfh.159.2023.10.16.00.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 00:11:47 -0700 (PDT)
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
X-Inumbo-ID: 458c391b-6bf3-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697440308; x=1698045108; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/E6/GLx6ZozVsglJmVw75Y9W/GS8DVZN69OPx54uAk=;
        b=Of6WYEJyFGhwPjKURhPqofzOduV/V1G344mR+1L5MDhbsaGaNIRvlVqcVXTFZGtlFF
         TGNn2ZAalRIgpnGcPzCb2f9+EYHg5q2yo89sLD17Mpk5gR67Tolt8BSoSPgaYhztvNoQ
         YPyV2zhLCoZnRom9Fv+uV30xKECk8l5NkHoU6V+iXw2i+G/wqd9c0eqCbbLGdf70iA6r
         4tOwQ/QsM/skzffC1AaYh2PuxPmQztT/pyuPLYNhnz7k+SnpbvOgGnRfZqskJSdmUFHK
         uyJNWMaG84CFlbZemmBW3cOHeDYeKbR6bsfg5KhweECXkXSqTfQIqrEo6gtDlGRsBG9S
         vKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440308; x=1698045108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/E6/GLx6ZozVsglJmVw75Y9W/GS8DVZN69OPx54uAk=;
        b=L2OI0x0/+w6VaJ46ppcINUQeRQ+btvF5j+DbQaedWPixtqexnTOIKhtrjjmB41bgOX
         KzXsrEeKh0wJhVk9dRQugSNNhnrGk9mLKCtif2Jw6AMi1J7l+4ScntHh/QnEMYuOxR6k
         2hG565wvDpgodlJSLGTmLeaPS3XGrms5BC4qUi7TRbrjfdVTxGTeb/GlwLBw27Cm8L5/
         iITOBoY/ggSR7H3ugKvINc7odPs2e6AUVLu9Un4fhJ4041l1DP/NiUgczn3r1sECg6L6
         2fHc5rsaMfJUQN8s/shwByDo7443Ux237c7R7JiPFdTObKSELoJAmidGrpDHQi3+rXUl
         SZhg==
X-Gm-Message-State: AOJu0YzUvusDcUfqcRBtGmYX1NnkiTHE2klWemUFBh8HfXWgLEu9SGeK
	RM9+XwUUv4EpLI67NNh3+ulNUA==
X-Google-Smtp-Source: AGHT+IE4MLkjnBefAElzY+bdBEEt2z+P5us27ZF3QfmSrVEbRNd3DDmAZ96JnRzreQ+qrlXMVJ0vpw==
X-Received: by 2002:a05:6a00:1819:b0:68f:d44c:22f8 with SMTP id y25-20020a056a00181900b0068fd44c22f8mr10614696pfa.1.1697440307784;
        Mon, 16 Oct 2023 00:11:47 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 2/4] xen: irqfd: Use _IOW instead of the internal _IOC() macro
Date: Mon, 16 Oct 2023 12:41:25 +0530
Message-Id: <599ca6f1b9dd2f0e6247ea37bee3ea6827404b6d.1697439990.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1697439990.git.viresh.kumar@linaro.org>
References: <cover.1697439990.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_IOC() an internal helper that we should not use in driver code.  In
particular, we got the data direction wrong here, which breaks a number
of tools, as having "_IOC_NONE" should never be paired with a nonzero
size.

Use _IOW() instead.

Fixes: f8941e6c4c71 ("xen: privcmd: Add support for irqfd")
Reported-by: Arnd Bergmann <arnd@kernel.org>
Closes: https://lore.kernel.org/all/268a2031-63b8-4c7d-b1e5-8ab83ca80b4a@app.fastmail.com/
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/uapi/xen/privcmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index b143fafce84d..e145bca5105c 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -138,6 +138,6 @@ struct privcmd_irqfd {
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(struct privcmd_mmap_resource))
 #define IOCTL_PRIVCMD_IRQFD					\
-	_IOC(_IOC_NONE, 'P', 8, sizeof(struct privcmd_irqfd))
+	_IOW('P', 8, struct privcmd_irqfd)
 
 #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
-- 
2.31.1.272.g89b43f80a514


