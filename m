Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3805A9D949E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 10:36:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843437.1259067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFryx-00067W-AG; Tue, 26 Nov 2024 09:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843437.1259067; Tue, 26 Nov 2024 09:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFryx-000612-5j; Tue, 26 Nov 2024 09:35:43 +0000
Received: by outflank-mailman (input) for mailman id 843437;
 Tue, 26 Nov 2024 09:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvg=SV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tFryv-0005lG-FT
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 09:35:41 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb3afd48-abd9-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 10:35:37 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa53ebdf3caso389061866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 01:35:37 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28dd59sm572637066b.7.2024.11.26.01.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 01:35:36 -0800 (PST)
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
X-Inumbo-ID: cb3afd48-abd9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNiM2FmZDQ4LWFiZDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjEzNzM3LjkyODM3NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732613737; x=1733218537; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd/pSca3c8YVeGWHqsOZkWQWRTsWpJ5XvtvSkIxglfY=;
        b=UdLx4rzA/UvNNIIBLAAIjbymKndGL+/c5lVz7xGwbuV1o8PPQcNwpYaL1X2BHH0KrG
         xYvQ75LfD+eXbiHm3kc75kTz0iov0b5FetGict0ygQW6Wh7c9E0aPDVNZGFYOjbJdVk1
         Xy4divp9OnV8eRobc7AcK8s3e8Ar11HjEchFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732613737; x=1733218537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd/pSca3c8YVeGWHqsOZkWQWRTsWpJ5XvtvSkIxglfY=;
        b=CLCq5GpTfvRAcpJ21Rjdmgz45P20/sQbF90S4euAWrpuSfkmI7XepJ6v2La/iDA6LF
         NfxcPCrx7SjKX7nusLbCmKbbNRFwJMqFS3wY6Wf97DhHF8wX7CZ6i96dNZWiwCrPnt7n
         B3qEZtbwCJTJfvLn7gsReOHBodJi0o5vxkJt1mzaJM7K5O4xncAXuC8/ebT9UCvFf0ph
         5C+FVfmTDVWS42ykUdVBPHZp7TW5IQCNGpLx6GhDmPFvzcGuWToH6V2i3dH/EDrjzBqV
         vQPwpMz6Ozp4CXJn2k/Qalm/XL1aPGl5mVPQO32QEv7ff5AS5lPQFLNJnUplGX+gJjb6
         V4/w==
X-Gm-Message-State: AOJu0YxXYpp+/FKtvR7agsuMo9ZGm+nL2navHsSzdS8KuPIaMpB3WQ9G
	rWQDVayeSuZZ40HJVkawD+5FiQjUKynjbAJHQPhbPQg/j77sMuEcr+isy++AhCS+puh/6rrPiI1
	e
X-Gm-Gg: ASbGncuxUm5NHs+MF9NfQZMzTCXGIhO7PMVa/+pzxhL7IWpFNtKK00WzqyYb68RP64z
	sOOtYV2W9/P9URdj7gzfmZ/tAaET1rI4XgtL5ELndfjORjI4mZmZHwCuwmi7IY50LoPdfd4kE8C
	dceVQAFwYr9MtgeKSUhASjA6Sb4qZ4y3X+kbOcN4ZiwaGZmS3bWS3K9VATiuTovadbYEQKsSPbF
	3qCYeoxhcrk06FstJlxfLtEwkN2NVPwNkgl9Okm5JKh6nAn1bj2aiGEWR0=
X-Google-Smtp-Source: AGHT+IEFe3B88klOATrIN9OwQuazzsoDRPdcbMo9zghMvOH6qVdvk9bb9nJV0b4ZYRu/CsjkSX455g==
X-Received: by 2002:a17:906:cc9:b0:aa5:4ea6:fcae with SMTP id a640c23a62f3a-aa54ea6fec2mr583648366b.28.1732613737089;
        Tue, 26 Nov 2024 01:35:37 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/2] automation/eclair: make Misra rule 20.7 blocking for x86 also
Date: Tue, 26 Nov 2024 10:35:08 +0100
Message-ID: <20241126093508.6966-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241126093508.6966-1-roger.pau@citrix.com>
References: <20241126093508.6966-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no violations left, make the rule globally blocking for both x86 and
ARM.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 755ea3271fc9..cb4e233e838d 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -80,6 +80,7 @@ MC3R1.R20.2||
 MC3R1.R20.3||
 MC3R1.R20.4||
 MC3R1.R20.6||
+MC3R1.R20.7||
 MC3R1.R20.9||
 MC3R1.R20.11||
 MC3R1.R20.12||
@@ -116,7 +117,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
+    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
-- 
2.46.0


