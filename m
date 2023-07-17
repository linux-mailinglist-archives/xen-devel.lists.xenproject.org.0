Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F34755CAA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564182.881537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY2-0007b9-QN; Mon, 17 Jul 2023 07:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564182.881537; Mon, 17 Jul 2023 07:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY2-0007XZ-KU; Mon, 17 Jul 2023 07:21:34 +0000
Received: by outflank-mailman (input) for mailman id 564182;
 Mon, 17 Jul 2023 07:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIY0-0005A9-Lw
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:32 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d532846-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:31 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so6584845e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:31 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:29 -0700 (PDT)
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
X-Inumbo-ID: 8d532846-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578490; x=1692170490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0GAChav/BgZruQ3EPU8Qo2tQ1sDnkEZR3Mc3i3hmhg=;
        b=txMm7BRZi3w3XhLyh5bgmsFOQsVZjgRfBefc+vyxakV5NhNk+LSNEcPkpz7fOoObUU
         czB8NoKoVz4YiqNsRbMmUEPn7P37T+g38r5NQ7Jz8NFBmIux7k5kjBQUGgEK6Nh9Htn1
         iMqRlr0lgIt2Dii5jzsNGIG3/Mwpk7b8JnTR/si7Q9nCoASibE/WkIlXBDcGTs2biyPa
         IQxetarrR+nCe+va1ZK8WainU+78XrO76gg7NTGgMzAlMOxHM4Hi38p+avLmlT3zFhuj
         WJIOro/49k9L+ZiXopjimnR+zW0Nh6/VIq/o56Ev48Fbu3lKfrNxa9SegGU7wWXlb+S2
         1Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578490; x=1692170490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0GAChav/BgZruQ3EPU8Qo2tQ1sDnkEZR3Mc3i3hmhg=;
        b=LSwPPbdA0zuvuNNQZKiFEwpqIMPfnpziVzAI6bya8ej5QqzhJu3xSBGUoxGvhhJWZn
         ugJyyDu1uM7jRjpC0/JeiPC7HWDaNNuhofcaOlV6nye6vkPBMAV7M5G3iRpEwWKd3F0I
         UZRKeW+GQHvvMgawDtJlxoYl90GebBZX7hgevwp1BVz/MQFe+zCtwgEwYVvGpD3TCihY
         RiKIb1ofdmSz4ygGOR2BM6L1YjFPvTvsm9sb1KlmfEhYPZYtzKiheLIEVbGVJ5fEIJh5
         hvc99UkPnuF+IMJ4mmaMLMhT+Kl1kB4A3dX1yDfoNaf2qa7VDGHRzZg9B5pG1An/izO4
         PZdQ==
X-Gm-Message-State: ABy/qLb58uJMbuC4X8GMQUHeKu7AkvVe8Ig4xpwhqyyHBYIx2sJNhVJ0
	ywqb8zgQgH8AnR42d2MVl8Ww3vDN0rwCQ4hCSjA=
X-Google-Smtp-Source: APBJJlEYcEmYPKsb2mSNB4YPQUBU+JnlKnpd4CpGIP2ykpJd1mq1aL3xNfIX8swGMqEGnt6AS/vjhQ==
X-Received: by 2002:a05:6512:1146:b0:4fb:745e:dd01 with SMTP id m6-20020a056512114600b004fb745edd01mr7090531lfg.45.1689578490527;
        Mon, 17 Jul 2023 00:21:30 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v10 09/24] xen/arm: ffa: add support for FFA_ID_GET
Date: Mon, 17 Jul 2023 09:20:52 +0200
Message-Id: <20230717072107.753304-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the FF-A function FFA_ID_GET to return the ID of the
calling client.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f0a2715d4bbf..e157ed20ad8b 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -181,6 +181,12 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
+static uint16_t get_vm_id(const struct domain *d)
+{
+    /* +1 since 0 is reserved for the hypervisor in FF-A */
+    return d->domain_id + 1;
+}
+
 static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
                      register_t v2, register_t v3, register_t v4, register_t v5,
                      register_t v6, register_t v7)
@@ -195,6 +201,12 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
         set_user_reg(regs, 7, v7);
 }
 
+static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
+                             uint32_t w3)
+{
+    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
+}
+
 static void handle_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -224,6 +236,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_VERSION:
         handle_version(regs);
         return true;
+    case FFA_ID_GET:
+        set_regs_success(regs, get_vm_id(d), 0);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -237,6 +252,12 @@ static int ffa_domain_init(struct domain *d)
 
     if ( !ffa_version )
         return -ENODEV;
+     /*
+      * We can't use that last possible domain ID or get_vm_id() would cause
+      * an overflow.
+      */
+    if ( d->domain_id >= UINT16_MAX)
+        return -ERANGE;
 
     ctx = xzalloc(struct ffa_ctx);
     if ( !ctx )
-- 
2.34.1


