Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC437F63A3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639825.997519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CFq-0002x6-Ve; Thu, 23 Nov 2023 16:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639825.997519; Thu, 23 Nov 2023 16:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CFq-0002qf-RG; Thu, 23 Nov 2023 16:08:38 +0000
Received: by outflank-mailman (input) for mailman id 639825;
 Thu, 23 Nov 2023 16:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r6CFp-0002oi-Ho
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:08:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e75e311-8a1a-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 17:08:36 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-332e3ad436cso415973f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:08:36 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 q14-20020adff78e000000b0031c52e81490sm1994948wrp.72.2023.11.23.08.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 08:08:34 -0800 (PST)
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
X-Inumbo-ID: 8e75e311-8a1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700755715; x=1701360515; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMkauDFn+qAfuR/oZAOw0ra8gHEXx3ErgUZ/htH3VG0=;
        b=dQ2EjVj0qsCz/FdrqNhZXb5Jw0inDEuecf5HiXvCT2iHClnBtVbFAlfa4v4pZ0sgLK
         6PK62G8SollWfE5zIhs65JXi+FMT1LU5m6TkbidyQnomVo6qUNRzZ6/feeHhQlX6TdG8
         0q4lzljSdH/67EVYK7ZrnsaFA9mczWSIXi9MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755715; x=1701360515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMkauDFn+qAfuR/oZAOw0ra8gHEXx3ErgUZ/htH3VG0=;
        b=jB7tWBnByb3/pIke4ds8rB5QA2BCMG87Fijbd4zKDJSqN4dGtsNVeKNgFWIf0Et1aP
         g2gALmcWduMv+VbmwKy1JdeH7cCAYQfIYBVbEDKE9xM/txpYsL3HivlSHEcl6/dZ9+2G
         +1i+ewGBPG66DfztcOl0z2z84ctC7sB6tYfebdtg+dtVFzXbopdhqsCtdP4JRDAIeNLL
         hMJ5kFEFGrhAO4FdDJbJQRtM4aoGMY//K3Ss9Y/gFfK40IB5N9G6MO9m+aIin4TpMQu4
         uAN1SSi1GsaT28aSViFdf0SldaT7fNmqOf6Ige99lJcyTMVuW5HD0cr1nbXaAchrV8i+
         ujrA==
X-Gm-Message-State: AOJu0YwdfSGkMIitnZ5BB/pLSNdgLQ5OZHYB5WKxSkFmnX3M1FbA4gCR
	ba2a8XEKWG3S6dCBCmRsI0FdC7/WVicFuJT2NVI=
X-Google-Smtp-Source: AGHT+IHJaU8zC+nXolQBUc96aBO3NKFRA31Z/rp8UDlbKGxszXv7kGob8xzwyqCzkQa/ZwAGJVQ8jg==
X-Received: by 2002:adf:ec4e:0:b0:332:c5bd:1d9e with SMTP id w14-20020adfec4e000000b00332c5bd1d9emr3794889wrn.4.1700755714811;
        Thu, 23 Nov 2023 08:08:34 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/2] livepatch-build-tools: remove usage of gawk
Date: Thu, 23 Nov 2023 17:05:34 +0100
Message-ID: <20231123160535.18658-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123160535.18658-1-roger.pau@citrix.com>
References: <20231123160535.18658-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

And instead use plain awk.

There's no need to use the --non-decimal-data option for gawk, since the
numbers that we want to print are already prefixed with '0x', and so plain awk
will do the conversion from hexadecimal to decimal just fine.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/livepatch-build b/livepatch-build
index 91d203bda0eb..26c88a2ed2c3 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -422,7 +422,7 @@ if [ "${SKIP}" != "build" ]; then
     echo "Reading special section data"
     # Using xen-syms built in the previous step by build_full().
     SPECIAL_VARS=$(readelf -wi "$OUTPUT/xen-syms" |
-               gawk --non-decimal-data '
+               awk '
                BEGIN { a = b = e = 0 }
                a == 0 && /DW_AT_name.* alt_instr/ {a = 1; next}
                b == 0 && /DW_AT_name.* bug_frame/ {b = 1; next}

base-commit: e588b7914e7afa3abb64b15a32fc2fdb57ded341
-- 
2.43.0


