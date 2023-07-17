Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C91755CDA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564226.881661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIdf-0008K0-2M; Mon, 17 Jul 2023 07:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564226.881661; Mon, 17 Jul 2023 07:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIde-0008Ej-T7; Mon, 17 Jul 2023 07:27:22 +0000
Received: by outflank-mailman (input) for mailman id 564226;
 Mon, 17 Jul 2023 07:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIYI-0005A9-1f
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:50 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97329b86-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:47 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so6409522e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:47 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:46 -0700 (PDT)
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
X-Inumbo-ID: 97329b86-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578507; x=1692170507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R/D9gUszluJweN/TK1ixSj9VXkkPD7CMOFZ9iBZSkU=;
        b=jmZfVrIj+QUZCLiyE2qEXlSL28t1qMkLYpwIIaLz9UR7yy7hLGhHjgvVHhMQPPD9JL
         1AzAVR1DsldqPnYz5wrf6gfx4w5qmCLR26ACRBciMqRuovXXbLtiTTAhQw36Q0KNrPvQ
         ljunJnwWm7wWA6VzTzOtXm6iRPB5kZ5suueizfFNROrx8TbrJ9a/T61O+jypQeC13fPp
         4jEB5Qwr3z5/gFu03xieUb5JFYJMwAySq13tNHwU5Y8pg4JlJNSza0JbdLxSAiRjPJ6b
         OjfV/UKeh4kqE8LhzJcxUv2V/+nuEp5zMLC3yU+rF8fNfZfpNBuYXWnvldxtybmZs4o/
         DyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578507; x=1692170507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6R/D9gUszluJweN/TK1ixSj9VXkkPD7CMOFZ9iBZSkU=;
        b=eqvbaqqXjoVAh88FXj3ANBCqeRpJei9MEoLI3w/QC+umASwqBDavqGXr0gXLOLqNdD
         goq+xrPGwuiHQbz6NQfwhcj0JvQ5XskYzZTVJQOzB34efR6U78iZ7mu989JgKPQRHpzS
         FxMg/Ha9yiIdkHcAbMvldudrh1gz1dCcblaKvVPjnySBvSSWLTclPnj9Wmh1NHCKHJ/J
         EOlGlApD2utA0f6wvEdJl9RioPaopUNbeuYLolSkaKuKCK6o7XFIoVeSOmAS3elTMEaA
         iVYOebe/RzUq3D/wkxXKg2+GKv6dpKPTTslNRyLZgOpLk8dGImsLlw5EJoVrmzTMcPV3
         gMpQ==
X-Gm-Message-State: ABy/qLYf4eydZlUmq8SGtrZoXKh/iiBsVLgNQ4FjuwgvrDWSqd6cQCOS
	q45FzYZtD3+n/kinh+02KA3cUZfP7uv0zhhiPxQ=
X-Google-Smtp-Source: APBJJlFwaNpoPdQHYMdYEXeH8JXmjKyc6tgoT5FTuM4Y0j/Vr6j4jRRXBICYOe6jLqSDUVHSs94oDQ==
X-Received: by 2002:a19:a412:0:b0:4fb:cabd:2a66 with SMTP id q18-20020a19a412000000b004fbcabd2a66mr6762060lfc.21.1689578507058;
        Mon, 17 Jul 2023 00:21:47 -0700 (PDT)
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v10 24/24] docs: add Arm FF-A mediator
Date: Mon, 17 Jul 2023 09:21:07 +0200
Message-Id: <20230717072107.753304-25-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 SUPPORT.md               |  9 +++++++++
 docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 35a6249e03b2..fe512762cee7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -840,6 +840,15 @@ that covers the DMA of the device to be passed through.
 
 No support for QEMU backends in a 16K or 64K domain.
 
+### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
+
+    Status, Arm64: Tech Preview
+
+There are still some code paths where a vCPU may hog a pCPU longer than
+necessary. The FF-A mediator is not yet implemented for Arm32. Part of the
+FF-A specification is not supported, see the top comment in
+xen/arch/arm/tee/ffa.c for limitations.
+
 ### ARM: Guest Device Tree support
 
     Status: Supported
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3979be2a590a..911c3619ce32 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1648,6 +1648,21 @@ in OP-TEE.
 
 This feature is a B<technology preview>.
 
+=item B<ffa>
+
+B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
+(SP), default false.
+
+Currently only a small subset of the FF-A specification is supported. Just
+enough to communicate with OP-TEE. In general only direct messaging and
+sharing memory with one SP. More advanced use cases where memory might be
+shared or donated to multiple SPs are not supported.
+
+See L<https://developer.arm.com/documentation/den0077/latest> for more
+information about FF-A.
+
+This feature is a B<technology preview>.
+
 =back
 
 =back
-- 
2.34.1


