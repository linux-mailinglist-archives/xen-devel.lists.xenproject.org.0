Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79776BBABD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 18:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510153.787372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp3-0005Op-H9; Wed, 15 Mar 2023 17:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510153.787372; Wed, 15 Mar 2023 17:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp3-0005Mh-Dz; Wed, 15 Mar 2023 17:21:57 +0000
Received: by outflank-mailman (input) for mailman id 510153;
 Wed, 15 Mar 2023 17:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux93=7H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcUp1-0004sk-OA
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 17:21:55 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1f2544e-c355-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 18:21:54 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id w9so7610686edc.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 10:21:54 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 d20-20020a50cd54000000b004fd1ee3f723sm2736315edj.67.2023.03.15.10.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:21:54 -0700 (PDT)
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
X-Inumbo-ID: e1f2544e-c355-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678900914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WC6E7SasOar4lE8BhKkBYbyPqiR5X0PW7WQ9O6r1Ljc=;
        b=LHyrFKjWXK4MaJ31pF6YPL9VA5V8tn+jwVfDd2/ep/Ved1WfP2CcLvh1n8z4vpTTUF
         3K3ghpyh7vyJkjC9/nyRSwIzsVJuS7rL1um9LuhOrcCyjgafiZHzyFF9dMDtVR7Cwp7t
         V3QyuFE7zc+NtVqyTcIL1wuYA9d7mr3/ceUVVkdJd6fcmLb+JnJtKiJqmCL+PVhrJ5P1
         4NDWrXsYEfrT2LsipvfEE3TafI/49NmH0RgFV6G7mF42KKEi4J4LE/Tf9hGThg1xAAGL
         wmGcX5+loPq3jdXSLZNlK2GHNZL2/DdG/6E4AMnoYIt2mMLcMhNsx9mxhUIPspYma0fV
         ND1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678900914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC6E7SasOar4lE8BhKkBYbyPqiR5X0PW7WQ9O6r1Ljc=;
        b=7J6UId6Go9fscZTa7fYaXsFQCEs12xLQ1hTUO8n552bNL99vBWfhx5jUK1e8/EeALr
         Y+3+VIBSE+dm60r+KaBzQzYWDZ4PBTZXvZYJOYjRWLxFOMOMiVf/e+3p/61K5K8cOH9z
         sND9PUcVDdZZ2N39VySVefugSSr7RDy6sb3DKbDjg8zIzwB+NhsE0piztR7I2qmCEyk8
         V8NFX2eYGjGPhlOkoAHNO6o4LJV9sIYItitbaBgDuCLp4qpGJibPWDlFrPCHx/4UhqNV
         WHa7cNFbpFvLdeIQYQINkkKwQwm9i5J4w/fZlIAhHphk7lT+j0s8S9igPtDYADdWHWA9
         01Yw==
X-Gm-Message-State: AO0yUKWsK909zZTazVH09RjXacD3qq6ShYyEoJxiomcw48Yh5IsYTR1F
	WRWHcKaIwMSmBtJaMghtxNwpgGl/ghk=
X-Google-Smtp-Source: AK7set9eRnkC+n/SqCo+CPk+xf/Sl2KPM+XpMuXT6aG3kRzVav03I+Wf494+u9rrgcS7XklbE0l3ug==
X-Received: by 2002:a50:ee1a:0:b0:4fe:9555:3a57 with SMTP id g26-20020a50ee1a000000b004fe95553a57mr3474467eds.16.1678900914287;
        Wed, 15 Mar 2023 10:21:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 2/5] xen/arm: remove unused defines in <asm/bug.h>
Date: Wed, 15 Mar 2023 19:21:44 +0200
Message-Id: <2f44d41ac31d71c150cd9170e62750a387ae48d4.1678900513.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678900513.git.oleksii.kurochko@gmail.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH,
BUG_LINE_HI_WIDTH aren't used in ARM so could be purged
as unused.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V8:
 * Update the commit message with Requested-by and Reviewed-by
---
 xen/arch/arm/include/asm/bug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..d6c98505bf 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -9,10 +9,6 @@
 # error "unknown ARM variant"
 #endif
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
-
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
     signed int file_disp;   /* Relative address to the filename */
-- 
2.39.2


