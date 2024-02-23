Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE6861103
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684817.1064965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUK1-0007Cb-Sf; Fri, 23 Feb 2024 12:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684817.1064965; Fri, 23 Feb 2024 12:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUK1-00079y-PY; Fri, 23 Feb 2024 12:06:33 +0000
Received: by outflank-mailman (input) for mailman id 684817;
 Fri, 23 Feb 2024 12:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdUK0-0006xc-B7
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:06:32 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae8aaf4-d243-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 13:06:31 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51197ca63f5so1247513e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:06:30 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 kf3-20020a056214524300b0068fe3170b0esm88772qvb.11.2024.02.23.04.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 04:06:29 -0800 (PST)
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
X-Inumbo-ID: fae8aaf4-d243-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708689990; x=1709294790; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp86iadmfvDn3kY5s/NcHvROQQfc/eEcQpXnyfCy0t8=;
        b=KJhAtRRhazOY55NyMGHBOdbs6ygrXx1bV746XYR78n0cdBDHgF07du3mwcOZwQUBuq
         9KvFaOEe0Q8UDpIzflWzBScbmdrr0cOd3A7EVsrzIalnfzF5rUy/SaOdISVy+j4I+NVP
         gSaLTTUVF7M8Xj34OAPZMilwzOZIKCLEyoJU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689990; x=1709294790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp86iadmfvDn3kY5s/NcHvROQQfc/eEcQpXnyfCy0t8=;
        b=lgTvdhFV0PFsjXyhIXTy2hKZTmtGZ03/VUXVLFa7sHiCuLXWQ5RdDvzxSVcndrWiGF
         FJ5FPcID8sq2pmYXO7eoCjy5p4r83cXdKhqJSyd/wiySGMvgq5/PAfO7GdHPdlgL1BG4
         xA6vb+htrVyJE/t8LmvMqsPFfkasjxhaw0TZzazQyY4wE2Rb5ufqIHU5oarhUgHsELMq
         zyZNaLod5lIy1hSv0xs9NSH18aHpCHivHV+hTnnrpXiYEt4V+JXFoppPSGJ6zrcHmRXW
         PqH63gFbawCg/rYHZq1Q6OJwDR/EKizTqh0HE2vEoAiicjA8galM/w2WB5AYwCeGHLJf
         jNTg==
X-Gm-Message-State: AOJu0YxcuXItC0qoOPvsJMyTbdjVxaqc2xLFvKfF2s6ZObhyqAdxgc97
	iQNaqYw3NDzvZtY/q2eRrSSmX7wDL4jKFoA/6ZrNB4/ZNsob0VC+d4hvCITp4N6nw5KmAWKLs3y
	C
X-Google-Smtp-Source: AGHT+IGsFXYkQjVxuWz/a4tHq/rp5C8ES+MZ65o6SqjJB1Uhw3VOCrsFHqjMlvc4Rg8ZC/gh6YiWPw==
X-Received: by 2002:a05:6512:3194:b0:512:b90f:fc4e with SMTP id i20-20020a056512319400b00512b90ffc4emr1603543lfe.46.1708689990023;
        Fri, 23 Feb 2024 04:06:30 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] xen/cmdline: fix printf format specifier in no_config_param()
Date: Fri, 23 Feb 2024 13:06:14 +0100
Message-ID: <20240223120616.73503-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223120616.73503-1-roger.pau@citrix.com>
References: <20240223120616.73503-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'*' sets the width field, which is the minimum number of characters to output,
but what we want in no_config_param() is the precision instead, which is '.*'
as it imposes a maximum limit on the output.

Fixes: 68d757df8dd2 ('x86/pv: Options to disable and/or compile out 32bit PV support')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/include/xen/param.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 9170455cde5c..6442a92aff8e 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -191,7 +191,7 @@ static inline void no_config_param(const char *cfg, const char *param,
 {
     int len = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
 
-    printk(XENLOG_INFO "CONFIG_%s disabled - ignoring '%s=%*s' setting\n",
+    printk(XENLOG_INFO "CONFIG_%s disabled - ignoring '%s=%.*s' setting\n",
            cfg, param, len, s);
 }
 
-- 
2.43.0


