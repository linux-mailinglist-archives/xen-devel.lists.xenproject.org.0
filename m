Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7EA77BBD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934113.1335949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMT-0001E4-KR; Tue, 01 Apr 2025 13:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934113.1335949; Tue, 01 Apr 2025 13:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMT-0001AK-G9; Tue, 01 Apr 2025 13:09:01 +0000
Received: by outflank-mailman (input) for mailman id 934113;
 Tue, 01 Apr 2025 13:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMR-0000Od-9G
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:08:59 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78222bfe-0efa-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:08:57 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5eb92df4fcbso10046686a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:08:57 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5edc16aae9esm7227853a12.11.2025.04.01.06.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:55 -0700 (PDT)
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
X-Inumbo-ID: 78222bfe-0efa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512936; x=1744117736; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J5IWMe9fuG9cz0NbV8d3wevTadFVymZS2btgRyX9fc=;
        b=E1z28gwBLqGYK9HtjIdkgSxq5pBONngrJu1ubGuZsPiJlWs9XZlIRv9wHrHFRygPZ2
         LctCd+SsPSv2frdWb/3SYOZq2nbifRJZgRLnN19Ql6WsBBYRQ/MGkq8g2y4yuAEVkz4o
         N/UDrjwKl5BqxRFZaww11LJrboolLH8fBFhbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512936; x=1744117736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6J5IWMe9fuG9cz0NbV8d3wevTadFVymZS2btgRyX9fc=;
        b=Z6YNc/5SOCm9XSu2jiU6TofpDp/rxG4lX/wdvJn3637GjkFFaxiO0xeX+wmt6IO5ap
         7l4Q5HyuxU61MVmIqgsC57eg0g0TTfpJpy3pSKjHigMr5hZmKerQisr9hAi0PcsMPTlX
         2IdgRTHC7A1ag6RcuuJIJ1AArACA+1hT4Gi/ScqjOZqDSNafpemlC/yrA/iBCdfB8+L5
         yhwiKXA5P9fVy+W3ZjVT5Hn6fCCI860o6vRmk+lRU8ziEpAr2oeB2i/5gYxDFTWFcomJ
         2yp2SSGEHTrWMkvXtZGZv5N244NFTol6UYC+nBjrBFHD04+IlHTzRlej069cFQe+I1p7
         qIgg==
X-Gm-Message-State: AOJu0Yxfb3Anqsj0ku7C1TWo9dXw9YttheO4Wd+MC6iqR28yWAVwU4lq
	7sKxnBLx2DJaZSivBoLhnPSQAaJmym9D9U9rBCIpyHhRHmO8QbBYwJp46uwZhZLzJ3SbmGDaDum
	L
X-Gm-Gg: ASbGncsJmL4RlXPTbrj4zc1zaENzUyihkIlpX7uhS45vXHxJHIagwO5nPLG0dlyObxo
	fM94mK6dq/BnzyDbu2u0t4ocbF3qdAVVtDyH8VCvWYuLiZi/lhkKmz44DT8E6Kundi5x7hRVg2l
	XNRvBLN4qpStNRyi9wnpPses4m3eC8FG8Ul4UVDezRi7h3IP3SMDUsr9eAU++MGvrS39ODJO80i
	QY5kdgogeYl/sPvVA28Jv8dzj/k8c2lCSL9xPOtROXeJ0SJEMN4uEyw1KQmiVf+vjLCOzlADzZ1
	rYVIiY4mRDxTeTzvC3zwgfk06+oS/FCAf2/H+flTnoD8iLVW9OOhAusvepXX
X-Google-Smtp-Source: AGHT+IFlaBZQNfY0LTeE/fILoefvlfJB50Sqda8agd9IG5gVxT9iBNOHCfoQMcaMzWfevyEFGUdD9Q==
X-Received: by 2002:a05:6402:24a4:b0:5e7:8501:8c86 with SMTP id 4fb4d7f45d1cf-5edfd6fdbdemr12939174a12.22.1743512936181;
        Tue, 01 Apr 2025 06:08:56 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 04/11] x86/mkreloc: print the linear address of relocations to read-only sections
Date: Tue,  1 Apr 2025 15:08:33 +0200
Message-ID: <20250401130840.72119-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expand the warning message about relocations generated against read-only
sections, so it also contains the linear address of the offending
relocation, like:

Warning: relocation to r/o section .text:00000048 @ 0xffff82d040200048

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/efi/mkreloc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
index cc106bd875ba..fa50314ae945 100644
--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -270,8 +270,9 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
 
         if ( !(sec->flags & IMAGE_SCN_MEM_WRITE) )
             fprintf(stderr,
-                    "Warning: relocation to r/o section %s:%08" PRIxFAST32 "\n",
-                    get_name(sec->name), i - disp);
+                    "Warning: relocation to r/o section %s:%08" PRIxFAST32 " @ %p\n",
+                    get_name(sec->name), i - disp,
+                    (void *)(base + sec->rva + i - disp));
 
         printf("\t.word (%u << 12) | 0x%03" PRIxFAST32 "\n",
                reloc, sec->rva + i - disp - rva);
-- 
2.48.1


