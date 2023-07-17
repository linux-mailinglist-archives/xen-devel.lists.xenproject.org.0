Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4AC755CD8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564232.881676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIdg-0000NW-BN; Mon, 17 Jul 2023 07:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564232.881676; Mon, 17 Jul 2023 07:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIdg-0000Kn-5l; Mon, 17 Jul 2023 07:27:24 +0000
Received: by outflank-mailman (input) for mailman id 564232;
 Mon, 17 Jul 2023 07:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIYD-0005A3-UM
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:45 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95f2c897-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:45 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso6589832e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:45 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:44 -0700 (PDT)
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
X-Inumbo-ID: 95f2c897-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578505; x=1692170505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0XHslbV1muN4VtuaM4zruuvudWXBg6/E8tWHxT1G2w=;
        b=hiG84lTsXnpWA8832BeIlP5biJIxxFZGvsCb47rD851/2OJmcSUHcx2eTdOGALNIAZ
         ZzBJwzIF2ePJoYqe6c5P/S/cMFaJ0tpW45II1w6K6rGN9R89XUaUvLbCwFt+j8d1TcUO
         K3VJXCsWY/omGqq+JrAFsWY62ybuezttDg6BwX3GoXYAy2Vxqais679qISdAG3Ym91vi
         1v9PuvRs7lRUAaFsb76GEjUEEbmBBgk/DMLJYkZwxr0uLfo6IAXxDqGWRyFMDx+Rs0rS
         eDGXcCW7ilLhHd+nZOa1Upvu9BqWXsLk3YO+eBEfD3V9wDYOaC8MYVfmpRUbrsp1Ptc/
         dRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578505; x=1692170505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0XHslbV1muN4VtuaM4zruuvudWXBg6/E8tWHxT1G2w=;
        b=g6GUV6xRuTD71jItQPGvdLI0/1g6eWBIluOW+dmAncHFI7puFwJxMDfMkncsjuLHBB
         9JxzzAuxUeR3clri2KzMQJ0PRYV4Buthb2RALH4OSAjO45nbp+dnqBixMPEF5hKnnihC
         ys+na9uGFlmtIVz2jN88Z14xyE1jwTYeAo3Qg3DGE67bzlJVbNegd6i+DkWIemAyKPEb
         NQ/C4fXQkC5Okzw2jda5qIfL9c/o/GyAQ2ztdalwdkdRg/ecTei+APzGpX0eQHQzzg2e
         Va4Bf/uvSefnVvfbbIpFqEtKVO8bPlOfJ0KYSWXQ8h55mJroUDhi6kHNndu6PAgM8Lrq
         WSIg==
X-Gm-Message-State: ABy/qLbdTiZmxlEplAIa/ekLFclppiLhWaFwRGJa6T6HhUWpidROezHs
	T/c8PAv98mGSMZmVVzfRNKl7DrpoB/AuSNNaKLM=
X-Google-Smtp-Source: APBJJlEOh5SPXNKa85tFB6sPM9pLXdtn7UKxhIc8ARWr7g9LVIriG2dG3J8xIQ0EyfNmCKDFFpfeng==
X-Received: by 2002:ac2:4e05:0:b0:4f8:7513:8cac with SMTP id e5-20020ac24e05000000b004f875138cacmr7916587lfr.48.1689578504865;
        Mon, 17 Jul 2023 00:21:44 -0700 (PDT)
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
Subject: [XEN PATCH v10 22/24] xen/arm: ffa: list current limitations
Date: Mon, 17 Jul 2023 09:21:05 +0200
Message-Id: <20230717072107.753304-23-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds comments with a list of unsupported FF-A interfaces and limitations
in the implemented FF-A interfaces.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 59832f73c2be..0fbaf7e1bb8f 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -13,6 +13,37 @@
  *                https://developer.arm.com/documentation/den0077/e
  * TEEC-1.0C: TEE Client API Specification version 1.0c available at
  *            https://globalplatform.org/specs-library/tee-client-api-specification/
+ *
+ * Notes on the the current implementation.
+ *
+ * Unsupported FF-A interfaces:
+ * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
+ * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a VM
+ * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownership
+ *   or access of a memory region
+ * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
+ * o FFA_MSG_YIELD
+ * o FFA_INTERRUPT - Used to report preemption
+ * o FFA_RUN
+ *
+ * Limitations in the implemented FF-A interfaces:
+ * o FFA_RXTX_MAP_*:
+ *   - Maps only one 4k page as RX and TX buffers
+ *   - Doesn't support forwarding this call on behalf of an endpoint
+ * o FFA_MEM_SHARE_*: only supports sharing
+ *   - from a VM to an SP
+ *   - with one borrower
+ *   - with the memory transaction descriptor in the RX/TX buffer
+ *   - normal memory
+ *   - at most 512 kB large memory regions
+ *   - at most 32 shared memory regions per guest
+ * o FFA_MSG_SEND_DIRECT_REQ:
+ *   - only supported from a VM to an SP
+ *
+ * There are some large locked sections with ffa_tx_buffer_lock and
+ * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
+ * around share_shm() is a very large locked section which can let one VM
+ * affect another VM.
  */
 
 #include <xen/bitops.h>
-- 
2.34.1


