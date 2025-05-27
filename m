Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E3AC51FF
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998560.1379302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCa-00016k-2y; Tue, 27 May 2025 15:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998560.1379302; Tue, 27 May 2025 15:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCZ-00013D-Vo; Tue, 27 May 2025 15:26:51 +0000
Received: by outflank-mailman (input) for mailman id 998560;
 Tue, 27 May 2025 15:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzHE=YL=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uJwCY-0000Yz-8P
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:26:50 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 024560e4-3b0f-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 17:26:49 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-604bf67b515so3630672a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:26:49 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6049d482cc7sm3442712a12.19.2025.05.27.08.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:26:48 -0700 (PDT)
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
X-Inumbo-ID: 024560e4-3b0f-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748359609; x=1748964409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAAB6Ax8rjWfGs7QV2koFNVF7HO+1ITwf906wvazW68=;
        b=dZ4Awufab2w/KJq4Rdzh1jIMy+U/lig1k9ldY0Jj0Qm/k/78tu7YyydLTNjVTsJADw
         wZpoIiTtpmdauBmwloznPR7VkkDrGNqavPlRzjuO4vu3ZfB3CoytM1cAS3vNaThYi5Ll
         WFEP/lI4O12hgp9RjNYP2Sza+RuYpUnHe0Hto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359609; x=1748964409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAAB6Ax8rjWfGs7QV2koFNVF7HO+1ITwf906wvazW68=;
        b=rvw7vzvN3vTNGl48sfo5skcJ/1cZ2Kxsec1R0RB9B/vwOWuMB0hrAFIZf9Ulv0GMSF
         Jy+ZhFcq0XW/Ym/N8Tx7C8FHg3naC1M2uiZe9JObzvIeB28XqLxjhCWGXw/B9cvqB1db
         1HQm2KKpcMuJxTnC1MyzztFpXQllct823uJahb/vVZlU3eGtaL23RNVfvCmdbKwqoBGX
         hdeXvlrR7c7qVOlsCj1qcXwn7GOfu8W44BqoJwICP+nVo0TcCe6zv5stewUyVPs6WZCH
         AwN4T6e+zgjqRCi58EkeghpMITxbQDVfAruNazLQjCzP3IrXmYUYn22Cof6oI7632RTo
         UjmA==
X-Gm-Message-State: AOJu0YzB/8oI7tx7TiUvxm1QU1yvyKYWEUuVm25P9uCMF7Pj2JnAiww2
	4szIcXAccHqKPoWMwX6xI3ckxTLElX2HAn1ZCHKgcJgy1qpI3ceQye/XUoPmRbTRjYjkfjBrkg9
	xGos=
X-Gm-Gg: ASbGnctSb9GGO2yzY/nK7JSQBqY3sKfN1vJbSBZiDHadpvXlMyc1DUTCyE3py2mmVNh
	0fxwBjnJ9TUH2G+BZmfOfyVfSROh81L+GfSoBLfwFgaj/QYYtipq+sDP2+u4WNR7N+JNjtka5+Q
	6r7BIkHxPG8kzsBKr2dcy54li2xV4lxtNFn+9O7Ye4yKHTCzyVzsD9HE7Tj399wZGGr0yZ7MKDx
	sIaCpfKftnUrNyLMx9IIcAaAbnoFXQW+1eOxRCFI5orX5xV+WA71hNKZt0to7ELxw1XliD8r/1a
	sHk6REzbedLq1Iv97zJu9E5mkeh0bE0sDZKKnIoNOTxTXTo72zaRjtgiiWr+fx7N9LDXJgUY4Zo
	=
X-Google-Smtp-Source: AGHT+IF6W+B3q07a3sgflbxcPGboBeFgqOuctbLzCA5Hi8E3OAZoFx+1iizjtjmFdXDygdJOzzIA0w==
X-Received: by 2002:aa7:ccd6:0:b0:601:8335:e96b with SMTP id 4fb4d7f45d1cf-602da8dde90mr8762324a12.34.1748359608950;
        Tue, 27 May 2025 08:26:48 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 3/5] cpufreq: Avoid potential buffer overrun and leak
Date: Tue, 27 May 2025 16:26:33 +0100
Message-ID: <20250527152635.2451449-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If set_px_pminfo is called a second time with a larger state_count than
the first call, calls to PMSTAT_get_pxstat will read beyond the end of
the pt and trans_pt buffers allocated in cpufreq_statistic_init() since
they would have been allocated with the original state_count.

Secondly, the states array leaks on each subsequent call of
set_px_pminfo.

Fix both these issues by ignoring subsequent calls to set_px_pminfo if
it completed successfully previously. Return success rather than an
error to avoid errors in the dom0 kernel log when reloading the
xen_acpi_processor module.

At the same time, fix a leak of the states array on error.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

* Return success rather than an error when called a second time
* Use XFREE
 xen/drivers/cpufreq/cpufreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 19e29923356a..635f6e8c61a5 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -517,7 +517,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
         }
     }
 
-    if ( perf->flags & XEN_PX_PSS )
+    if ( perf->flags & XEN_PX_PSS && !pxpt->states )
     {
         /* capability check */
         if ( perf->state_count <= 1 )
@@ -534,6 +534,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
         }
         if ( copy_from_guest(pxpt->states, perf->states, perf->state_count) )
         {
+            XFREE(pxpt->states);
             ret = -EFAULT;
             goto out;
         }
-- 
2.49.0


