Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89380755CB0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564180.881522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY0-00075j-DG; Mon, 17 Jul 2023 07:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564180.881522; Mon, 17 Jul 2023 07:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY0-0006zH-84; Mon, 17 Jul 2023 07:21:32 +0000
Received: by outflank-mailman (input) for mailman id 564180;
 Mon, 17 Jul 2023 07:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXy-0005A3-FO
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:30 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb7ab25-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:30 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb7373dd35so6646286e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:30 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:28 -0700 (PDT)
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
X-Inumbo-ID: 8cb7ab25-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578489; x=1692170489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuV8RapENruJ9yIpnO0p4qSE4ssdvVfnP6i34l3RXw0=;
        b=xaRC7zfu3nwRG0g9KqOu4hYbFrxWD5cKBOkdZh+AZOaPYSuznqtQ+0HOauj9iavEbu
         JbSF/VqlvIoR8MVkJt6tOwMqupN1d/kGmr3IKneKPpgt9CBNZ6jXvcQDKbw9MbiyX9xk
         YXyrGJJYALbaRjptdvPv3ObZKKeT0lQ3HmaDfIFAFjOOh94qI7izgr1spgDUKdjNF4nQ
         SLvh8YlZlxZ/uM/NqxRzfyY4GDZSUK9PvBIwKfBkPvcWF1cGRSBLEO8CmuhD9LuPh0+t
         vX2WSgmpK5PaAtj398pz2Jp6BpF0/mfCUBUPMDC1OC1gDds/VD0Vsffyf0ytk8AwYTmu
         mJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578489; x=1692170489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuV8RapENruJ9yIpnO0p4qSE4ssdvVfnP6i34l3RXw0=;
        b=DmGf9FFY0dBTrJHlXCiDb92RQ3RxFgrD3/BqPmj6Gt803RUSs/hJ7W3WAJeH6r0F14
         GhaTjtlWKT1ZFizhx3QXZrINs0sP6Y/BZ9vfCgwXQYP2nmPb7/Fj6nCqj1D1xq86xaQ/
         GyyaUsrX1ciZcX1Z9CFUAwNrlrCUJEOglbN5k0j3SUcjvat3ZBnPfyrLtbwoi/SQCiyL
         qYzNkEAhEWSKhZ2s/RKZPVo6UwLpek79quH4wqYEg14JI6AfblID7gsWKEYtlA3TmfWI
         4aBSFZ28fDVAScMywM9UfH4cM6+POrrsXLYp8JfN0IAza8eutE5btcVuuHX1GQescS0U
         8laA==
X-Gm-Message-State: ABy/qLaTr0ncAtj4tIlKMgwEcGIeROBrutGppOD9TE3NTpXmBZQI70Cd
	5swoPGczOoXfWAFP/ILPd1R+ZyBWZiSVefFoamE=
X-Google-Smtp-Source: APBJJlG/vrwn0VQlvci45eWYHtneEcIHChEHUySN/ceSE3SZZJjWrV7JOQpGtbYA8p8mjpjqp0fuGA==
X-Received: by 2002:a05:6512:202d:b0:4f8:6253:540 with SMTP id s13-20020a056512202d00b004f862530540mr2938837lfs.19.1689578489348;
        Mon, 17 Jul 2023 00:21:29 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v10 08/24] xen/arm: ffa: enforce dependency on 4k pages
Date: Mon, 17 Jul 2023 09:20:51 +0200
Message-Id: <20230717072107.753304-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
mediator since the current implementation only works if Xen page size is
the same as the FFA page size.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 56a0a10c1e99..f0a2715d4bbf 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -57,6 +57,16 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * The FF-A specification explicitly works with 4K pages as a measure of
+ * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX page
+ * count" which is the number of contiguous 4K pages allocated. Xen may use
+ * a different page size depending on the configuration to avoid confusion
+ * with PAGE_SIZE use a special define when it's a page size as in the FF-A
+ * specification.
+ */
+#define FFA_PAGE_SIZE                   SZ_4K
+
 /*
  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
  * BIT(31): Framework or partition message
@@ -261,6 +271,17 @@ static bool ffa_probe(void)
     unsigned int major_vers;
     unsigned int minor_vers;
 
+    /*
+     * FF-A often works in units of 4K pages and currently it's assumed
+     * that we can map memory using that granularity. See also the comment
+     * above the FFA_PAGE_SIZE define.
+     *
+     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
+     * until that is fully handled in this code make sure that we only use
+     * 4K page sizes.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
+
     /*
      * psci_init_smccc() updates this value with what's reported by EL-3
      * or secure world.
-- 
2.34.1


