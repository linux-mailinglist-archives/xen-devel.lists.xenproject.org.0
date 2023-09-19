Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89DA7A5972
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 07:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604333.941640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTRk-0001Cy-1B; Tue, 19 Sep 2023 05:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604333.941640; Tue, 19 Sep 2023 05:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTRj-0001AS-Tc; Tue, 19 Sep 2023 05:38:51 +0000
Received: by outflank-mailman (input) for mailman id 604333;
 Tue, 19 Sep 2023 05:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cwwf=FD=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qiTRi-0001AM-5C
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 05:38:50 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccc9f1b1-56ae-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 07:38:46 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c572c9c852so12564945ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 22:38:46 -0700 (PDT)
Received: from toolbox.wdc.com
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a170902ee0400b001b88da737c6sm3706068plb.54.2023.09.18.22.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 22:38:43 -0700 (PDT)
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
X-Inumbo-ID: ccc9f1b1-56ae-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695101924; x=1695706724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJbB0gVGUy3t9KnX0VZPhoiQSqpeinwYceuzWEOZmpk=;
        b=JWPMD4xoMZVwPRaaiPiYidslkNY3PAYK/sA8nhemx6SCkGM2c5T5U7obf8d/MOCjCW
         WEfSmxGPf6q+dq8JUOSUPUdO+iKppjt6DYduGpgSzfThpR3w8aXa6rJIf2+CtkFwrLrD
         GktaaaLR9inl/10mXkUncNvoCh+nfei3DaWCMRRN7mETHHy/R53sY77Rx340aPxqPqe6
         TkMZ6J3O7L8DoQp2G79BNP+UaA5zs/TF60Ow+M6rNQ/iEHtfEZzQNCgArDgK1mqkbE6r
         bNkdIHc2pVzXhUuKYOQrL8BfTh9tjGQnKFK3eCHxWFdcOe6w778RBoC/vgB92/TN0zBv
         yVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695101924; x=1695706724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJbB0gVGUy3t9KnX0VZPhoiQSqpeinwYceuzWEOZmpk=;
        b=XimeyuXDTarueLQ1wE2T7sJHIY0C4T9cgP5twt5H+zSL2HlTUIhOEy7lNUhRkFfxqm
         aJrmO7ScK7966bc5w6BBPTAQztnLD9K1p6cHtseHJQlFuCLnFwlBaAIL3zydxsZeWt/5
         r5Dj9NcquTJTLSV4HZpCwGHLHs58Fo0tNSoiWlwDzlN3Kk8mjthz0zZ+n1qd4XnBTVly
         /3Vxtgw5esz9QeH+qDm+DmJogBL22kdsA7suyPlGv4SC3bNWduQXkG7ani6VssurUDSx
         /2c71faByYtY8d6w9AyoTmCUcv61snfATns7BQT02VWJV+IckcS5k538a6RrvX78Dc1m
         c72Q==
X-Gm-Message-State: AOJu0YwDdXFJpd/3FP1RS1FYV0Tq+xelMwlXC0ikDnqwI8x+9WIPRGRs
	E6Z6iKzpt/HMZEwM6YIb6mYXNdljzYjZ0a9p
X-Google-Smtp-Source: AGHT+IFgz1J+/C5AR3J+ESj8eMEq0Xf+KtFm+akNHeCBCge++mVPUkzlHcIPl+lDI9juJ4w+z/fBCw==
X-Received: by 2002:a17:903:2581:b0:1c4:5de0:4bb with SMTP id jb1-20020a170903258100b001c45de004bbmr5498248plb.36.1695101924357;
        Mon, 18 Sep 2023 22:38:44 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: xen-devel@lists.xenproject.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] MAINTAINERS: Remove myself as RISC-V maintainer
Date: Tue, 19 Sep 2023 15:38:33 +1000
Message-ID: <20230919053833.1410609-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I unfortunately don't have time to be a Xen maintainer, so remove myself
as the maintainer.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f227a2f5d..22034bf6e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -500,7 +500,7 @@ F:	tools/hotplug/Linux/block-drbd-probe
 
 RISCV
 M:	Bob Eshleman <bobbyeshleman@gmail.com>
-M:	Alistair Francis <alistair.francis@wdc.com>
+R:	Alistair Francis <alistair.francis@wdc.com>
 R:	Connor Davis <connojdavis@gmail.com>
 S:	Supported
 F:	config/riscv64.mk
-- 
2.41.0


