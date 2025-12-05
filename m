Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC9CA9705
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 23:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179518.1503001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRdqc-0003cx-4y; Fri, 05 Dec 2025 22:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179518.1503001; Fri, 05 Dec 2025 22:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRdqc-0003aa-1Y; Fri, 05 Dec 2025 22:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1179518;
 Fri, 05 Dec 2025 22:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vRdqb-0003aH-0O
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 22:00:17 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7af2b1c-d225-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 23:00:15 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42e2cf93f7dso1860711f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 14:00:15 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9032sm10102264f8f.1.2025.12.05.14.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 14:00:14 -0800 (PST)
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
X-Inumbo-ID: c7af2b1c-d225-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764972014; x=1765576814; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7cWpm7fhqdpySlH/flHfO3tTWq/vZMmRpwJy2cV4P0=;
        b=pXwfzwwaTPSE/tiVUOPM40T6kNXHF87grwYmTq3+6wNrsXFgIzNGRthzvjK+7SJH2u
         kmSvJjb4TJS6fHjlg51o3n/GuvXiZACIDmYEuv4gNqUfcfMqjQKFYOxq3azBMc9llFxm
         5Dv0uscdXtxIcnG6tejZGhxoyVF2dRmemSMGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764972014; x=1765576814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7cWpm7fhqdpySlH/flHfO3tTWq/vZMmRpwJy2cV4P0=;
        b=PWw6RMeFPcn9MI3OdxCnSVPPUCr9/Zl9VbQRtLnosV+l4IgT+/eX/FxXCr3Lf4e8uq
         JAbcs7yFYGYRb/K2TnlXF1pWGoe/+Jur0AP+YtA2R2lUwZtgmNh7KMBqCCojnZ2Gey28
         MWmP0LUi1eqFCmaE21JhXRCEax1ubzaWuN2HD0od/y/+usKCQBYuqf5gZc73V4sYF+O7
         PK9pLEQlCKqxaEYg4nVw+Zywea1fQ7EMasesOCKGiuk1yLlJQIRk94r02DRfmc/QuYRV
         zKn6XToxP7mU68GaPYjNjD7g44IPaxnY+2GTnzazdGvqOmUglTmtbQR5PYRFszXcenCS
         +vQA==
X-Gm-Message-State: AOJu0Yx1DWCVDVm6N3nWI+w/qHuWA93POPwfsgpk4DAeG0DrQijLtlT0
	COQDh9OV4KwthbsfDgEXTAMs9t0BzUmxBtW6kprVdYcIUXTjAVCi1dnQfwJqBA4CfGySlch1jcL
	1nSgm
X-Gm-Gg: ASbGnctGu1tn44H6NQ2jpG08YuolBuxFWYbT+JXsPtd78U3I/jOwIDDAeLGFrPzwe6u
	rldlOeiwWeAndzu7FFaJp8goT0bmpbi2puTNA+bi1/tdzhf0p2glUkj7cQI5ISqlLU0Afl1b6np
	lliQHGgdXeicIRIMvmnNeyNi+6NcpHkQEPp78niAiFIVriMjZZfPowEQtpjJODTRAUyv9NHeqjB
	AA3zTjfHx3ej+D5qE4ktLWK2OXd3luZQPHZ6iuoeUkNWdqZZKImpW/cm8dJk57UKpGxZCl2daMl
	8XmLaW5nyvr+plNzlMdkuMIpobdXML4ofI6UwCS/+1lyNX3MSfoey/EaZsifCmM+YKIV3kZd9OS
	zY14kjEEV6DHLcYg7MzL2AIwftfLvOSPoxZyVJpVpC3FsenPcBZWlqyToL8SmE9ovTLmvc9Xdxx
	cGoS9nvVd8tGmTy399N4P758IxKaw5tXw4L1SXruWvZd8YkaEpdjk9GCZK96wDjw==
X-Google-Smtp-Source: AGHT+IHQNHpnsdaEA5dWLYqOlNK2kRWho8cCHBKJnXIjkw/8ef+PTslNx4oZZyH2S8nn2MkOipESLQ==
X-Received: by 2002:a05:6000:4282:b0:42b:2ee0:569f with SMTP id ffacd0b85a97d-42f89f47f19mr589127f8f.33.1764972014526;
        Fri, 05 Dec 2025 14:00:14 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] tools/sd-notify.h: Include string.h too
Date: Fri,  5 Dec 2025 22:00:12 +0000
Message-Id: <20251205220012.1976435-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Alpine Linux, when using --enable-systemd to get the init files, fails with:

  tools/include/xen-sd-notify.h:69:3: error: call to undeclared library
  function 'memcpy' with type 'void *(void *, const void *, unsigned long)';
  ISO C99 and later do not support implicit function declarations
  [-Wimplicit-function-declaration]
     69 |   memcpy(socket_addr.sun.sun_path, socket_path, path_length);
        |   ^

This will be down to using musl rather than glibc.  Include the appropriate
header.

Fixes: 78510f3a1522 ("tools: Import stand-alone sd_notify() implementation from systemd")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Example failure:
  https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/12336994239
---
 tools/include/xen-sd-notify.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/include/xen-sd-notify.h b/tools/include/xen-sd-notify.h
index 28c9b20f152d..20441d0ec9b8 100644
--- a/tools/include/xen-sd-notify.h
+++ b/tools/include/xen-sd-notify.h
@@ -20,6 +20,7 @@
 #include <errno.h>
 #include <stddef.h>
 #include <stdlib.h>
+#include <string.h>
 #include <sys/socket.h>
 #include <sys/un.h>
 #include <unistd.h>

base-commit: d430c0a66e102fb12baeec6a178c20da7864d5b5
prerequisite-patch-id: 3db642dd7c06f6988283444c764cd646982775bb
-- 
2.39.5


