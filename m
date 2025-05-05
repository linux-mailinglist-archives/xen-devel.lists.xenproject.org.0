Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F26AA8E17
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 10:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975902.1363193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBr3L-00052h-Am; Mon, 05 May 2025 08:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975902.1363193; Mon, 05 May 2025 08:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBr3L-00050W-7i; Mon, 05 May 2025 08:19:55 +0000
Received: by outflank-mailman (input) for mailman id 975902;
 Mon, 05 May 2025 08:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBr3K-00050Q-5h
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 08:19:54 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7b84f3a-2989-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 10:19:51 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so6348893a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 01:19:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa7781d7d9sm5132185a12.47.2025.05.05.01.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 01:19:50 -0700 (PDT)
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
X-Inumbo-ID: b7b84f3a-2989-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746433191; x=1747037991; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T3o1odibACp4jPCY5sRhwjv8yfLCgCSt05xTQK87+8=;
        b=hQt1gqCeAzNgaJUog7UNu4yFihHb8It6akTVlLOOktljvUKiT1w9j3wnmJOSEmt6gz
         8GFZ+4PR1x7NAb3ZoAYEW/eSWGapF4eF4Gr2QRZ8G36OeVpfhcQPPtooJNMshuDkB3bi
         5kYvqPmEKf9n1niO8ki2ru2giawxR9LkB4Ik9RA9VuyWx/UoF6CGOb7a9ePnnllaRgFv
         uZ6sycOvvZoB3UeFe41SYEDyGwPZXkOuOlP4yxVVtCPq4Xo7Z7c29gqtd1Qbv6faBH0+
         HTyh8nzowF0YdXsQlFMNL2cUfxJ0DTbalBxn+AXOIE9TGbAVZmWgGGAyH1l2rkaJHE0W
         wP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433191; x=1747037991;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2T3o1odibACp4jPCY5sRhwjv8yfLCgCSt05xTQK87+8=;
        b=LmtB6Qlv8XDWPkXDcNe4MDbrXsxq0uwQT5gGp4XL4F1TKjxsGwzeoaOSWdJp2fiVNF
         6ojI6SXHzSKPCudMVlGvZkG3k/Wx8XUwLsjH2rBw9s5Kq2l1F7Q3K/ULz6rfDNaX9RAK
         izuWYfMqGqezpgEmaXBCq0wq45nczeqDH1YlxRW/dSWJAirqiyfAnkFIa91RPeUhWvX1
         guGcRjmXMCepkKee3uLjjEAHsJJdVsZnWDVuTAGFCjxo/aCyhql/6sCoLs46T45U9EJB
         Y72xJt4vxRIR5lVQpDo+t9SsBZteLVT97XIsIZ12vPri6uaSCw+fn9G3TxueYHrn8HA4
         zUdg==
X-Gm-Message-State: AOJu0YwZAOcsugG/1iBhHPVe7PLGbL5BIcbRPqAm1yIBVq3HQgwfo/ZV
	EWjX596GphyXgNTk7OffP2hzpnjHNhGWMqzUvQzUMbPb+ITt3SNX
X-Gm-Gg: ASbGnctmx/8K1RcCGMBEXGbs506/vKxI2szsQNIt5Dl9Fohzi7Pq0kt+nY2rQWYvZlL
	5gG+NgrzBxeEGCJTlFsGc4jSlatxjjO5eTwxqX6HLzU8KtsLNoAsyYop/p6C9qz0e5SjgcZe2x5
	5zyf9YzipVF6Ufh5GNt1RV0i69OV1U0jSaPHMP0LKGmXp4GlzF7SsOfkNdg7lJwZgm+oPbkt9LY
	WCSbqrtHJQNUhWXEevq2ABtrO7lFbZSnCl487aOdM2QVJ4U1DymYXAWr3wcLrcdfI5l7VPeldVR
	yikdf+VNv9IRyOUc0gTlkbYzkXoVZIWIEPDuDoE6CGCr8x0kycm5Ufc8y1YAw9Jj+ht2Hg/DsSo
	J05yyNYSMpt+L9Xrr
X-Google-Smtp-Source: AGHT+IEiKdMUY0ooP4LJiPqc4ZkuDFLgfvOTzH43MNbYCfyySrOXB/Bo4UGOfmOmVNjRp9LsSb2emw==
X-Received: by 2002:a05:6402:2347:b0:5ed:2a1b:fd7d with SMTP id 4fb4d7f45d1cf-5fa780612dcmr9418510a12.19.1746433191102;
        Mon, 05 May 2025 01:19:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------NCkU60cuk7PbQbE7VufFRdZ5"
Message-ID: <16f1e5e5-da28-4a0d-aa3c-b1eea6b8003c@gmail.com>
Date: Mon, 5 May 2025 10:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] arm/static-shmem.h: drop inclusion of asm/setup.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <5e02dc75f4f396d054e9b9206b9305889cadb1a5.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021213280.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2505021213280.3879245@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------NCkU60cuk7PbQbE7VufFRdZ5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/2/25 9:13 PM, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>> Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
>> asm/setup.h is droped.
> Actually, this patch is not currently dropping any inclusions

Lost dropping during one of the rebase. I'll return it back.

Thanks.

~ Oleksii

>
>
>> After this drop the following compilation error related to impicit declaration
>> of the following functions device_tree_get_reg and map_device_irqs_to_domain,
>> device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
>> declared in asm/setup.h ).
>>
>> Add inclusion of <asm/setup.h> in dt-overlay.c as it is using handle_device()
>> declared in <asm/setup.h>.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V2-3:
>>   - Nothing changed. Only rebase.
>> ---
>>   xen/arch/arm/dom0less-build.c       | 1 +
>>   xen/common/device-tree/dt-overlay.c | 2 ++
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index c0634dd61e..7eecd06d44 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -20,6 +20,7 @@
>>   #include <asm/dom0less-build.h>
>>   #include <asm/domain_build.h>
>>   #include <asm/grant_table.h>
>> +#include <asm/setup.h>
>>   #include <asm/static-memory.h>
>>   #include <asm/static-shmem.h>
>>   
>> diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
>> index 81107cb48d..d184186c01 100644
>> --- a/xen/common/device-tree/dt-overlay.c
>> +++ b/xen/common/device-tree/dt-overlay.c
>> @@ -13,6 +13,8 @@
>>   #include <xen/libfdt/libfdt.h>
>>   #include <xen/xmalloc.h>
>>   
>> +#include <asm/setup.h>
>> +
>>   #define DT_OVERLAY_MAX_SIZE KB(500)
>>   
>>   static LIST_HEAD(overlay_tracker);
>> -- 
>> 2.49.0
>>
--------------NCkU60cuk7PbQbE7VufFRdZ5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/2/25 9:13 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021213280.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Fri, 2 May 2025, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
asm/setup.h is droped.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Actually, this patch is not currently dropping any inclusions</pre>
    </blockquote>
    <pre>Lost dropping during one of the rebase. I'll return it back.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021213280.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">After this drop the following compilation error related to impicit declaration
of the following functions device_tree_get_reg and map_device_irqs_to_domain,
device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
declared in asm/setup.h ).

Add inclusion of &lt;asm/setup.h&gt; in dt-overlay.c as it is using handle_device()
declared in &lt;asm/setup.h&gt;.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V2-3:
 - Nothing changed. Only rebase.
---
 xen/arch/arm/dom0less-build.c       | 1 +
 xen/common/device-tree/dt-overlay.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c0634dd61e..7eecd06d44 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -20,6 +20,7 @@
 #include &lt;asm/dom0less-build.h&gt;
 #include &lt;asm/domain_build.h&gt;
 #include &lt;asm/grant_table.h&gt;
+#include &lt;asm/setup.h&gt;
 #include &lt;asm/static-memory.h&gt;
 #include &lt;asm/static-shmem.h&gt;
 
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 81107cb48d..d184186c01 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -13,6 +13,8 @@
 #include &lt;xen/libfdt/libfdt.h&gt;
 #include &lt;xen/xmalloc.h&gt;
 
+#include &lt;asm/setup.h&gt;
+
 #define DT_OVERLAY_MAX_SIZE KB(500)
 
 static LIST_HEAD(overlay_tracker);
-- 
2.49.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------NCkU60cuk7PbQbE7VufFRdZ5--

