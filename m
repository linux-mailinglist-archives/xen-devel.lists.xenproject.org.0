Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F96E078B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520493.808224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrCH-0002HE-Lg; Thu, 13 Apr 2023 07:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520493.808224; Thu, 13 Apr 2023 07:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrCH-0002EB-HG; Thu, 13 Apr 2023 07:16:45 +0000
Received: by outflank-mailman (input) for mailman id 520493;
 Thu, 13 Apr 2023 07:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrCG-0001wd-6K
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:16:44 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ac74948-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:16:00 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id d7so28947048lfj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:16:00 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:59 -0700 (PDT)
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
X-Inumbo-ID: 0ac74948-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370159; x=1683962159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yodICrBL6WOIoQq7XouRka4JhH5GEeCWApa9x3I7zt0=;
        b=TQjlYR0eNL3PQqTubzL6FvZ4C8RV2/tVxlgPb2sFYtuNXlIpwOWCppcmvIe4zIe6VV
         h/id3+UsnHaa+wwPJh3Yk05O3O4PzFz2lywfhUvt3lH4hHwVNclytoMHsiGyTkYaTn1H
         JXhGyHGP/xcNp7ni5CCR8pVsHdhlTJcClMvRX8kCRpTaYs1/qgElR1ZG5z0TOXl39bUl
         k6p7C2DA/NAf4h/hJ/oKU4Ni18Y3e5VPe5J5M3rIzab0gFCACyYOuHsLvAzeEM6+RF25
         s/0kLV8cVrCWZcbYAZQO8Bzv8ZDC/7jG53JulrOjbCXDMjF32i15ivwz15XrQwF1uv/g
         uOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370159; x=1683962159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yodICrBL6WOIoQq7XouRka4JhH5GEeCWApa9x3I7zt0=;
        b=iS7TF9cZURWBlGkzHebP/LAchVAqlXqn/sbO9rJv7owncJ9y6JIAT561FDvcG2vYEt
         UALnF2JLPyYCJMcqTcBgwnfxDq4lcJh3aL9Wlm2wVUQvwDd57LbFWORu+CURc8OkC22o
         nsHezcBGt5itZ51FJqPGjsIzwkNSnZDHyjNPy5wCj00IU0JeMsKV2B5y8NE86WTQyXkX
         cVoQoBjJHWlw7O2FPfykYFMsrJw7z6eIx63sz3W7S9/9RK9aHvnb1DroBC/2CPSpbnae
         HKpSmwqTLfL7Xw58m/TzsVYPPgH4ILwLAYzuQxKlsrMdsp5nctko9O/B1VCbyP0X4EjR
         LLGw==
X-Gm-Message-State: AAQBX9dSJELDOQ4IQe6YDDM+aC8IUr/hdtPXMJVAk+s2SioqX5kPpmoI
	hI0fW/1Senkl3ESHzdaavf07eX4B5usxh4BXuRE=
X-Google-Smtp-Source: AKy350bdjDbsFWiQejACd34meF454MJsfUSzRAHwjvgKOixy0ULG2yl6IgQa9uz5wrrP2F/JvSeG9A==
X-Received: by 2002:ac2:5a1c:0:b0:4ca:98ec:7d9a with SMTP id q28-20020ac25a1c000000b004ca98ec7d9amr550426lfn.15.1681370159616;
        Thu, 13 Apr 2023 00:15:59 -0700 (PDT)
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
Subject: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
Date: Thu, 13 Apr 2023 09:14:23 +0200
Message-Id: <20230413071424.3273490-22-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a comments with a list of unsupported FF-A interfaces and
limitations in the implemented FF-A interfaces.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 0948cc636871..6424c222c885 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -13,6 +13,38 @@
  *                https://developer.arm.com/documentation/den0077/e
  * TEEC-1.0C: TEE Client API Specification version 1.0c available at
  *            https://globalplatform.org/specs-library/tee-client-api-specification/
+ *
+ * Notes on the the current implementstion.
+ *
+ * Unsupported FF-A interfaces:
+ * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
+ * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a VM
+ * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownership
+ *   or access of a memory readion
+ * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
+ * o FFA_MSG_YIELD
+ * o FFA_INTERRUPT - Used to report preemption
+ * o FFA_RUN
+ *
+ * Limitations in the implemented FF-A interfaces:
+ * o FFA_RXTX_MAP_*:
+ *   - Maps at most 32 4k pages large RX and TX buffers
+ *   - RT/TX buffers must be normal RAM
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


