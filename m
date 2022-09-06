Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7D5AF6FC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400107.641745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHf-0006bf-92; Tue, 06 Sep 2022 21:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400107.641745; Tue, 06 Sep 2022 21:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHf-0006Yo-0b; Tue, 06 Sep 2022 21:39:03 +0000
Received: by outflank-mailman (input) for mailman id 400107;
 Tue, 06 Sep 2022 21:39:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCHN=ZJ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVgGd-0000Cs-G2
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dee2aff-2dd7-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 13:31:20 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id lz22so1644213ejb.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 04:31:20 -0700 (PDT)
Received: from leoy-yangtze.lan (n058152048222.netvigator.com. [58.152.48.222])
 by smtp.gmail.com with ESMTPSA id
 gk3-20020a17090790c300b0076f0a723f6bsm782752ejb.58.2022.09.06.04.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 04:31:19 -0700 (PDT)
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
X-Inumbo-ID: 6dee2aff-2dd7-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=u1lE6IuDeB5I0S1Xvxbo8D+JPrxouKQRMpg3Oo16TQ4=;
        b=s2NPyyRkBPiN/qGw85S06CQztG4mMVk/mX9w8QrnNYh9NrfGGz5pRElk7U+osZP7AU
         SaWbgZRWR0PwVlcrXqt2w2ZFzF/Jk/Mik5bZ8KdC3UH2/D5gUbpjLIEVLcGfII53GsY8
         QtN5hy4VgPcaZ799AKjEl/RDLkjx5wMIaxDh8QTwkwy2hi7nlDP1xZViDczo7EmBe8t6
         vPv42rJqlrBL59Pay7f1XN91QLiUQ04I1VRZiFxtHsyz/WgQ1n4vLMO1kowpZahgaQHK
         RcWDYz6SMdIaP2a5ksSsPHLfaLrGpWfTQVBVfgiJ5PelEmMZwFi04XQLL0EbVDmVZ0ts
         UdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=u1lE6IuDeB5I0S1Xvxbo8D+JPrxouKQRMpg3Oo16TQ4=;
        b=j14Cmg6/wrMwPhm5kj4ARUdhjNfLoX9+JvXHKVFY2zToTZUQVLhIHXnPsW32JWPfgc
         B3sFKGyub8snkB38z5YWNoRYS+2gHqdjH/0WliY4YCqfAFmMjOEBcCtcblowglc1+6AF
         KziBVlzR2ZNFx77cEIakN2S1JBVveaXLHdTxXq6w3eCE0mu3th+dCBZm09bwXoTDF/6U
         92Koo/7SU9+gJMwJMj3eBq3cAKqve06MJIXlzxav6qPhaXq1LJgYlRUUk2h8YWQ1PXG5
         GxRqv+6nEiczZFk4hfdwJ1qZullCEcKc25FU31JVpiwdX9dFZ4XM8euW32V8CLbEoRc2
         NjPQ==
X-Gm-Message-State: ACgBeo2FvqHWbGcC/a8lyvK3MJwAczohq7wcuWKXfFG5uYOYiORKeht0
	sfuvJfUTPyZGqB1oX1JzJ/YRIg==
X-Google-Smtp-Source: AA6agR5vL4G0ofH226R7BMWLaaJ7Afuu5Iu3WJag+usCmj1pYjafbXi9JlLomiHiC4GmBTaLhiGdUg==
X-Received: by 2002:a17:906:5a4c:b0:76f:3e98:b453 with SMTP id my12-20020a1709065a4c00b0076f3e98b453mr1268994ejc.509.1662463879954;
        Tue, 06 Sep 2022 04:31:19 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] xen/arm: acpi: Include header file for version number
Date: Tue,  6 Sep 2022 19:31:12 +0800
Message-Id: <20220906113112.106995-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Arm64 Linux kernel prints log for Xen version number:

  [    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found

Because the header file "xen/compile.h" is missed, XEN_VERSION and
XEN_SUBVERSION are not defined, thus compiler directly uses the
string "XEN_VERSION" and "XEN_SUBVERSION" in the compatible string.

This patch includes the header "xen/compile.h" which defines macros for
XEN_VERSION and XEN_SUBVERSION, thus Xen can pass the version number via
hypervisor node.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/acpi/domain_build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index bbdc90f92c..2649e11fd4 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -9,6 +9,7 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/compile.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/acpi.h>
-- 
2.34.1


