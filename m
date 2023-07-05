Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF54748122
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558926.873538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyyt-0007Oi-4L; Wed, 05 Jul 2023 09:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558926.873538; Wed, 05 Jul 2023 09:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyyt-0007Nb-04; Wed, 05 Jul 2023 09:39:27 +0000
Received: by outflank-mailman (input) for mailman id 558926;
 Wed, 05 Jul 2023 09:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyvI-0005bC-I6
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:44 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f0d355d-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:42 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso105699081fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:42 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:40 -0700 (PDT)
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
X-Inumbo-ID: 4f0d355d-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549741; x=1691141741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0XHslbV1muN4VtuaM4zruuvudWXBg6/E8tWHxT1G2w=;
        b=f899ZIKOky2C3a7sro1D/PW5bsGIsjNat/XajNAkKNjim/maYyRXaufJNUm8Khzrer
         H90b+A+uxSsw4GWLkTMWL/FxYHSseZQVqgxYjBaxFpPFXnY3F0TNmwbMB6EyA9lQrtc/
         QbftdMNWM4Tg8EOyZNgKnTvMDZq5p3ssHk7W7aOTqwyGr0TNrwrEYg01Jc8vkPNWBGQ/
         spsbGgAg1NkBG1epHMEeBvR1/GEsW1eW6cb1pt5jql9/B5lZYYYwOQf/oZ9Dfl16udxR
         fQ7lL8cAbPXMWM5bsgtMMu5VmhCpbMtP6igz9C45WOxw6kuy9HoQt20YawlDmZfW9tyJ
         77TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549741; x=1691141741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0XHslbV1muN4VtuaM4zruuvudWXBg6/E8tWHxT1G2w=;
        b=JVkwM4o1DAs6YWzYHGLunDyqZ6uavsMbq/jSK1Wc2Cbcngmxjg7PeEjcA7IqL4Jy00
         qmmOLEA4TmsgMwDo0FMIGVqdxWozUHch5GHxpo47PgpSjMXwIaBLGkUJ2C4KEBrdzncM
         whJ6tRWaHtUq5RJiBjsykyEBQDvVTuI1pDFkjbfjd/Gkk3ZfOrggSF1dHL5C1aHoAscR
         W1BwMJiViyxkKecVEgRuVMrc0u8H5jtOw4FqaomHLwU2pOUl2y8mJCsxCL1n9IqdLf16
         dx3l/F6G0X9OnCNHJJZ+jB5cntfv0uBTv3uCDvonVMM+fsA5Xg9WHS/II+Mi5bPOL+Kq
         VeBA==
X-Gm-Message-State: ABy/qLYBJMsieuda4tS0qek+MpQlBd5CMye1Y5NynXAr2yzcA5ssTt1k
	belSFwQ9mgEebs6NZcoNRnkeffra3bBZVuGuJFg=
X-Google-Smtp-Source: APBJJlFz3GD2LUh6Zwr7QSCWB/3NRAG6M/UVX+8FWJ/vvSRXnWpckZNZca5gXfWOTtmlF8Ihw5rOuA==
X-Received: by 2002:a2e:800b:0:b0:2b6:cd40:21ad with SMTP id j11-20020a2e800b000000b002b6cd4021admr10535462ljg.37.1688549741363;
        Wed, 05 Jul 2023 02:35:41 -0700 (PDT)
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
Subject: [XEN PATCH v9 22/24] xen/arm: ffa: list current limitations
Date: Wed,  5 Jul 2023 11:34:31 +0200
Message-Id: <20230705093433.2514898-23-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
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


