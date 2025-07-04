Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A148CAF96CE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 17:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033455.1406818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXiLh-0001ww-NS; Fri, 04 Jul 2025 15:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033455.1406818; Fri, 04 Jul 2025 15:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXiLh-0001u1-Kl; Fri, 04 Jul 2025 15:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1033455;
 Fri, 04 Jul 2025 15:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+0l=ZR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uXiLf-0001tv-NA
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 15:29:11 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1dc75db-58eb-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 17:29:10 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so179929166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 08:29:10 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b0279fsm189390766b.114.2025.07.04.08.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 08:29:09 -0700 (PDT)
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
X-Inumbo-ID: a1dc75db-58eb-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642950; x=1752247750; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhaASBdrygEOV1N7olV7ONAk6ehA2cKm/je++WKErjs=;
        b=g0foj3AoJ2+sLWdkaLYiBusmgM+zEzGZGLZeOQzf4/6KjRDGk2pt3YVs4cuGKLXecv
         okNYI9X8hHN1GAxoDw244Y2l5C9c0t1C61jgEJW4VEQFvLutoVJ/W8MVQ/OXxANrlsJi
         KMM5Y5kLwSOYHhFf5PmLJya6/xI7ZQD4/niveEhH5vVhVNHvz9kotiTIMbj+Z4XlG5fs
         imU8+CE6FCFP1tJCMw/W1tv0tS6sG1B3K6934fCNX+gvDensGAE25OdImNNgjDDQ34rC
         feIVQgka7bx6qBRAuAnuJUxs9zqiIWD0yoH2oEqktxtCMF5zO2oCowPySyZpTaZAyXfE
         wa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642950; x=1752247750;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhaASBdrygEOV1N7olV7ONAk6ehA2cKm/je++WKErjs=;
        b=lPnQHLsm7yOWGD4ZV98DZI+r0hjjPQdmxsOIG/r4wd6mPw5y/ss1NxTxRkhIhu++RA
         wrlYx9+Ku9siOQ2qYMdOrRWUHm80vxRT4iqDRxRWFfefoWtyNOaTS4PplHlnRHBawRn3
         NasA4qTr6zoj1wXJo9FL73VSX5y5rsbOT8OiJczf10Rne4L5CvfM8S6J/N4nmnxgwxWw
         m4AGR2N2trI5qiBBbQyZCLyVMSAjNJoGAfwgc8IqVUlifHRNuUkF4a7JzS3/FfOd0VR7
         68FD/rRz7QY7uyJgFhHoGH6afX6Ewny+WK5Q0r6/RBswpiWqyinB5GcihSeXzHQ6Yzxl
         goYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOVXifluzDPjUqnhjKRPh9XYSOHO0NAM7huM9bNoMJl7DbYS6yINwSALRmbVHoOTlRqKzP3RjljZg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyzLWkvzRFggLjE7xHGqa+gLaD+8zY5SW02VOUZxxXAiQr29gf
	n1O2Ww8PkZ3JGRd6HYhnhxVOoYTc4F4DX8GtOVLFkpDKlrOCHk8GpTxg
X-Gm-Gg: ASbGncs++6BK9H112OJXDaxgXYVqKslGG0m2C/kn4BV6trx6TrTlUwg6Ryh0SSRA6Fn
	ZlUsnZPCz8tau/1YGC604iAiStDdWMj6Yf67u+JhBBvbGepdhJkfciajgXj1PuPUUjt/1V0kVsn
	Z4g90LPm4xYbVh2IlVTCeKMyR+pwyofvGX5bOx73NWDiHjbuWOi715NxVGuLgQq3T8QuiI4Liqk
	sEk1poTqj3aZ7tCo++B7/Cvlx1siEeyhJ+LG8WirVCPYjFfFr3wUgr1Uk9+8Rbevvh49xNY8zm1
	btWuDdq/ZuRonM0/qiYCNY3PhNs4Twvj9iQE0zfN9cWCHiGOBJshU9NzZyYEQeYelQDl/wLR7G6
	ydJdnVgxF+nXOc0k8JzLz2czmpzZl43/7th24WbLfkTvL0Q==
X-Google-Smtp-Source: AGHT+IHBweFqfBYn6bGDukYvDIGbKI0erXNglmjs4vjQhKC1pcFcqBIM7U/xc7a3NrK6vEFNtEAIXQ==
X-Received: by 2002:a17:907:d92:b0:acb:b900:2bca with SMTP id a640c23a62f3a-ae3fe45821emr258221266b.0.1751642949673;
        Fri, 04 Jul 2025 08:29:09 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Ki8hVv2OTOGKFvQd6Vgo50y6"
Message-ID: <0064472c-39c0-4ce4-9a5e-725d8658d63e@gmail.com>
Date: Fri, 4 Jul 2025 17:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
 <0b366c5b7c8d34a98c8ec4bedf1f00b070a6fae1.1749825782.git.oleksii.kurochko@gmail.com>
 <2d06fcf9-0aa8-48d7-84bd-4dd700a22da8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2d06fcf9-0aa8-48d7-84bd-4dd700a22da8@suse.com>

This is a multi-part message in MIME format.
--------------Ki8hVv2OTOGKFvQd6Vgo50y6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 4:27 PM, Jan Beulich wrote:
>> --- a/xen/arch/riscv/include/asm/smp.h
>> +++ b/xen/arch/riscv/include/asm/smp.h
>> @@ -3,6 +3,7 @@
>>   #define ASM__RISCV__SMP_H
>>   
>>   #include <xen/cpumask.h>
>> +#include <xen/macros.h>
>>   #include <xen/percpu.h>
>>   
>>   #include <asm/current.h>
>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>       return pcpu_info[cpuid].hart_id;
>>   }
>>   
>> +static inline unsigned int hartid_to_cpuid(unsigned long hartid)
>> +{
>> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
> We had been there before, I think: Why "cpuid", not "cpu" (as we have it about
> everywhere else)?

To be in sync with other already merged functions, f.e. set_cpuid_to_hartid(cpuid, hartid).

~ Oleksii

--------------Ki8hVv2OTOGKFvQd6Vgo50y6
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
    <div class="moz-cite-prefix">On 6/30/25 4:27 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2d06fcf9-0aa8-48d7-84bd-4dd700a22da8@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -3,6 +3,7 @@
 #define ASM__RISCV__SMP_H
 
 #include &lt;xen/cpumask.h&gt;
+#include &lt;xen/macros.h&gt;
 #include &lt;xen/percpu.h&gt;
 
 #include &lt;asm/current.h&gt;
@@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
     return pcpu_info[cpuid].hart_id;
 }
 
+static inline unsigned int hartid_to_cpuid(unsigned long hartid)
+{
+    for ( unsigned int cpuid = 0; cpuid &lt; ARRAY_SIZE(pcpu_info); cpuid++ )
</pre></blockquote><pre wrap="" class="moz-quote-pre">We had been there before, I think: Why "cpuid", not "cpu" (as we have it about
everywhere else)?</pre></pre>
    </blockquote>
    <pre>To be in sync with other already merged functions, f.e. set_cpuid_to_hartid(cpuid, hartid).</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------Ki8hVv2OTOGKFvQd6Vgo50y6--

