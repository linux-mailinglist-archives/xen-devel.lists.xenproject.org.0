Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4411396C285
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 17:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790495.1200307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzM-0004nR-8G; Wed, 04 Sep 2024 15:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790495.1200307; Wed, 04 Sep 2024 15:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrzM-0004ky-0n; Wed, 04 Sep 2024 15:32:08 +0000
Received: by outflank-mailman (input) for mailman id 790495;
 Wed, 04 Sep 2024 15:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slrzL-0003Vv-1c
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 15:32:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d78658b1-6ad2-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 17:32:06 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86c476f679so820004466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 08:32:06 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62038d4dsm6197966b.51.2024.09.04.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:32:05 -0700 (PDT)
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
X-Inumbo-ID: d78658b1-6ad2-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725463926; x=1726068726; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5xIEyShiXsG0uS8t4KpTmc8gXLGG9Loy1+FhdabqNM=;
        b=tItn/ACFd3uCkoIfLnmc3Rom9thQgySwBEzTgylso8w3UfolM+hsAbZ6eZ39UjJW86
         d+fuDvxUYX5Yxup1DJOHDFj8r3Gm6oseKDUdxIeIB2/bTeyXOWz0THlB48oEyUxIvm+h
         vWclBWZCAaiXeKxN/yeYqyVwFuNLZr7l+MUeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463926; x=1726068726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5xIEyShiXsG0uS8t4KpTmc8gXLGG9Loy1+FhdabqNM=;
        b=hjmKpHtWzXml7EPKELqTx6Lfh37nwCzjKkPg/+D61qukKHIJkQKApYFV+GzkP5P7Jd
         yWfGoU38TvmzfEpxgOLn07vC8+UMKYIEoibB+SOTwBMGXTWaHlMjAodI4JnhSqSulRAm
         rhqqBTShLvVwAb8OnnQsrZ1w+N0eLccF02PLhOa3VPDBeFnqrSGwKqYpEueD1iEFvQ7b
         YRTXzQe52V1pYSCDguI/gk4jflmpjIxfeyEC+EHP53tEOPX+6b43boAO/k5n83q6oQiK
         Za4ngpKolQNtySbZOgrrYAnMjm9y1oUQAbruEyhQAVX9U6kQHvC9odOno3twHbbWASJe
         iHtQ==
X-Gm-Message-State: AOJu0Yw2AUWxruBEfr6lq0JdiXsQggTQ3rFyjv2cPC/rDB76bNFBmMDu
	gq09xXxKPcrjPL8mcAxZn4XgLBdpGaVXaaqPM+gJltdUrCnt8sRh2GlgHkHlha6RwF1ksPwMpsY
	P
X-Google-Smtp-Source: AGHT+IHfdDFhhMzIZlyWzfqK0BBgBrqi/pDSrlmGyX8+0tnV19l/1qChJPdG3vaxKWvMuB/EQizN6A==
X-Received: by 2002:a17:907:9483:b0:a86:80ef:4fe5 with SMTP id a640c23a62f3a-a89b96f7106mr1073576066b.47.1725463925528;
        Wed, 04 Sep 2024 08:32:05 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 6/6] x86/time: prefer CMOS over EFI_GET_TIME
Date: Wed,  4 Sep 2024 17:31:51 +0200
Message-ID: <20240904153151.83995-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904153151.83995-1-roger.pau@citrix.com>
References: <20240904153151.83995-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The EFI_GET_TIME implementation is well known to be broken for many firmware
implementations, for Xen the result on such implementations are:

----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
[...]
Xen call trace:
   [<0000000062ccfa70>] R 0000000062ccfa70
   [<00000000732e9a3f>] S 00000000732e9a3f
   [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
   [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
   [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
   [<ffff82d040203334>] F __high_start+0x94/0xa0

Pagetable walk from 0000000062ccfa70:
 L4[0x000] = 000000207ef1c063 ffffffffffffffff
 L3[0x001] = 000000005d6c0063 ffffffffffffffff
 L2[0x116] = 8000000062c001e3 ffffffffffffffff (PSE)

****************************************
Panic on CPU 0:
FATAL PAGE FAULT
[error_code=0011]
Faulting linear address: 0000000062ccfa70
****************************************

Swap the preference to default to CMOS first, and EFI later, in an attempt to
use EFI_GET_TIME as a last resort option only.  Note that Linux for example
doesn't allow calling the get_time method, and instead provides a dummy handler
that unconditionally returns EFI_UNSUPPORTED on x86-64.

Such change in the preferences requires some re-arranging of the function
logic, so that panic messages with workaround suggestions are suitably printed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Updated to match previous changes.
---
 xen/arch/x86/time.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 52944b8fbfde..788a12d52fc3 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1592,14 +1592,14 @@ static void __init probe_wallclock(void)
         wallclock_source = WALLCLOCK_XEN;
         return;
     }
-    if ( efi_enabled(EFI_RS) && efi_get_time() )
+    if ( cmos_probe() )
     {
-        wallclock_source = WALLCLOCK_EFI;
+        wallclock_source = WALLCLOCK_CMOS;
         return;
     }
-    if ( cmos_probe() )
+    if ( efi_enabled(EFI_RS) && efi_get_time() )
     {
-        wallclock_source = WALLCLOCK_CMOS;
+        wallclock_source = WALLCLOCK_EFI;
         return;
     }
 
-- 
2.46.0


