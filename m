Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12531808E25
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 18:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650046.1015298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHma-0000iU-RS; Thu, 07 Dec 2023 17:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650046.1015298; Thu, 07 Dec 2023 17:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHma-0000gl-OB; Thu, 07 Dec 2023 17:03:28 +0000
Received: by outflank-mailman (input) for mailman id 650046;
 Thu, 07 Dec 2023 17:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBHmZ-0000Rv-MB
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 17:03:27 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f638a7-9522-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 18:03:25 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bffb64178so1172654e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 09:03:25 -0800 (PST)
Received: from fedora.. (public-gprs375370.centertel.pl. [37.47.97.139])
 by smtp.gmail.com with ESMTPSA id
 br4-20020a056512400400b0050c1520f783sm213780lfb.303.2023.12.07.09.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 09:03:23 -0800 (PST)
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
X-Inumbo-ID: 88f638a7-9522-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701968604; x=1702573404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvegsqgPj/JQ+zfxb37FWfk92AemUm2jMAtVEkvF/Nc=;
        b=CAUPsnD6ARTTC+lGsObqLENDEby9BJv+6kOEGD6GVWFJx4Ps+oz4RSZsDefJsRA9cz
         EEEjO9sUl2Vuluxoa7MHlJzIltV2wH8UG+1IcE1aV4SIPw3qsU/ucjQPYxroxQFtppQh
         sq8Vxt58OBBsivuw1Y/22eyc5j5bHrEGPBbZuOsb8sGOWW7SKcRkHuADdgEgkzzv0h58
         XbunfxHydDM1VwGpTvJlgCzBAB8Ql4bEWjNV6m9VIxMLDprqn5TRbvfgRc1cwn6R+XbH
         Rxz3iJpJvoIh5nJZaFXeKU0diMpKeWbtXXRdVMxsdm2VxfAIO7lrRkLI1mRtzHlQzB0R
         Fl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701968604; x=1702573404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvegsqgPj/JQ+zfxb37FWfk92AemUm2jMAtVEkvF/Nc=;
        b=h6RLz/0sbVSScMnLd11MWqIQCt2I4QixlIA+Q7S3CK/iYA7H8NKPIm7wjFUCaFMEbq
         7I4PbLLOhrDKvau7h5UOBfBh2kbi7jgksU3f02mpikR117f5ucujCsuh3tRiXBb+7KCY
         kj0Xj7u0nXnUJuP8+8Yj6Qp5BEw+ITAl8P6gfXdteYQzvHhvS3cxHNH37DXQe70UZzeA
         xVTmh2orNfmzPxhB5mhK6wzfj+ZUXfxCZLASvi7oBbRhUrrqNWYPLhtZVARM16RDrZiw
         AQ8R/beDGa5FObpfLDR3/9cEskgVXCLrcNp8L6WNcAGYg5ARGESNTbXBNajbKsT8rcAs
         teQg==
X-Gm-Message-State: AOJu0Yz1BbwrM3sE63pghb0xA3UC7wXi63McqSkK+FYQe8rtDQDM3QER
	//ntvU7YoRoZtQO0vHXORQYOvWi1QBQ=
X-Google-Smtp-Source: AGHT+IHyC3zQabe/f038LIeTKXmHOwubcefzsliresQ68Zf567w2NaWLlPXL6ajOnuFYZfOUKiLLRg==
X-Received: by 2002:a05:6512:3583:b0:50b:f792:3265 with SMTP id m3-20020a056512358300b0050bf7923265mr1619676lfr.123.1701968604101;
        Thu, 07 Dec 2023 09:03:24 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG for randconfig
Date: Thu,  7 Dec 2023 19:03:19 +0200
Message-ID: <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701966261.git.oleksii.kurochko@gmail.com>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARCH_FIXED_CONFIG is required in the case of randconfig
and CI for configs that aren't ready or are not
supposed to be implemented for specific architecture.
These configs should always be disabled to prevent randconfig
related tests from failing.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index ca571103c8..8ae8fe1480 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -336,11 +336,14 @@ ifeq ($(config-build),y)
 # *config targets only - make sure prerequisites are updated, and descend
 # in tools/kconfig to make the *config target
 
+ARCH_FORCED_CONFIG := $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
+
 # Create a file for KCONFIG_ALLCONFIG which depends on the environment.
 # This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
 filechk_kconfig_allconfig = \
     $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_POLICY=n';) \
-    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
+    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
+    $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat $(ARCH_FORCED_CONFIG);) ) \
     :
 
 .allconfig.tmp: FORCE
-- 
2.43.0


