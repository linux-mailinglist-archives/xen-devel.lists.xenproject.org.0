Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE421567927
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361534.591084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgf-0003d0-5L; Tue, 05 Jul 2022 21:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361534.591084; Tue, 05 Jul 2022 21:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgf-0003bD-1s; Tue, 05 Jul 2022 21:02:25 +0000
Received: by outflank-mailman (input) for mailman id 361534;
 Tue, 05 Jul 2022 21:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8pgd-0003b1-RL
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:02:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c385edb9-fca5-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 23:02:22 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so7926303wmb.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 14:02:22 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 l26-20020a1ced1a000000b003a03ae64f57sm2897401wmh.8.2022.07.05.14.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:02:21 -0700 (PDT)
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
X-Inumbo-ID: c385edb9-fca5-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fShJyLsuEBJvmB+AxoM45kGpo7E54ZlICruQClfnbYQ=;
        b=lN/RlgPdxLosRgl/RUNehMS+zBujbjqZeIquKP7n+dgLl9r2vzJBVBmaq866sW8rz/
         xioMPEXn3gvtZBlQUKZmIRx8CO6gZT+gfbkwMiI1gVAzXFsksnMvkX41zpxH++0kM25b
         mzOFPWS2jbnUy9doUan1B/0bNJPIqBYVGwqL4qJYr5WeYzDUnIPZTcEiA864BkVAjdwE
         5A6GqmZL57kWuoRdPIVwDyYTMETk7OBFgxmnKsVDF6LDNG6jXfTxWyRaPW8iBg1x2W1F
         GyW+/LZBy84IQGhcDjVdhSebMlNndJak1FdYJuYLgCSjMS06MtaX0Sis14Fg6nlsOY1r
         5+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fShJyLsuEBJvmB+AxoM45kGpo7E54ZlICruQClfnbYQ=;
        b=6T1TEaBvapE6tsvjcApidUnVBKQBJ3NWkYqIiknQpuSFH2WNS5/DEI/zxt4Wk8sDNA
         tKO3d+/5s7WsmdPUKHlMsRnZFND5uZQ1I/p9d5rWNX8rrq7CnjYzB9D/gcxiJlEpkwur
         A65InwCKw45Bypec79xG0/MIbfnRpZyCrAmv4kLul7UzfaFNclnMHTc5qGFaNSxMneoJ
         h8hp8liZ5yAOea3sfaH5VEMU+q9FPd1u1w5xzzTUcreeweE/CQXIWTdX2cOBP/DtRnZS
         IV+OiDy24B07JLnJYssOLa+OLTahm8+tPu9RCdUfMmn9dgM9Wy4U1a8pRYR+f51AAnfR
         MDew==
X-Gm-Message-State: AJIora9pLtJa8217ul9v+1Rr3L3cQMX4HZV8zuF1H8FenISPB7cu3xX3
	wmEVobLQCillxYNAUy7Xwnf3sxllUTI=
X-Google-Smtp-Source: AGRyM1sdv5WuHFDy3B7P/CrdXFDQZJ/oOpxLP4iIGhi466AXlXHQKk+H+s6HACjE3FidvC7Su0IK3g==
X-Received: by 2002:a05:600c:4149:b0:3a0:4728:60e7 with SMTP id h9-20020a05600c414900b003a0472860e7mr37583366wmm.10.1657054941594;
        Tue, 05 Jul 2022 14:02:21 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/4] Fix MISRA C 2012 violations
Date: Wed,  6 Jul 2022 00:02:14 +0300
Message-Id: <20220705210218.483854-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve MISRA C 2012 Rule 8.4 violation warnings.

Xenia Ragiadakou (4):
  xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violations
  xen/common: time: Fix MISRA C 2012 Rule 8.7 violation
  xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
  xen/char: pv_console: Fix MISRA C 2012 Rule 8.4 violation

 xen/arch/arm/domain.c                |  2 +-
 xen/arch/arm/include/asm/processor.h | 14 ++++++++++++++
 xen/common/time.c                    |  2 +-
 xen/include/xen/pv_console.h         |  2 +-
 4 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.34.1


