Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B918A89A67
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952613.1348011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4def-0006XX-8u; Tue, 15 Apr 2025 10:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952613.1348011; Tue, 15 Apr 2025 10:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4def-0006VJ-61; Tue, 15 Apr 2025 10:36:37 +0000
Received: by outflank-mailman (input) for mailman id 952613;
 Tue, 15 Apr 2025 10:36:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCo=XB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4dee-0006VD-8p
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:36:36 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8114adde-19e5-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:36:35 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso11904379a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:36:35 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd1adsm1078152066b.145.2025.04.15.03.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:36:34 -0700 (PDT)
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
X-Inumbo-ID: 8114adde-19e5-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744713395; x=1745318195; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jypqxtRVX8BKAPKoCA6QODwtLQQaK9bwgEnU1HMYWbw=;
        b=EHwYOeiJix3jZTlpzfJZ6udFV5TMGIb24ETWKRDAfpah0GHlQ7E9fSqcdiX2f1v18S
         7gUyhRPvZq/jj65mHp/tYVdhwEHHByFRVZlsVsNrRYddb2O7DHRFPQ21ivU60stU+SiT
         RgN2pd1Wloje6F9vwUdqXo0vowYDdkMM44GvIlgKaaj0ADBP6UrrQB1EOAVv+FpXFF1N
         VVyAfj3rseg8TQKCrIq2sbc2NBqJkvsP2pfKFYPXVfMxx/hZxJ1rZE23091GkXy1W1TX
         AblD+exLgrkekRVg87phSqaofKULaiF62WsCp9j4H2QBWZp/wNsRgffdEDRVnBnBmxzU
         2PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713395; x=1745318195;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jypqxtRVX8BKAPKoCA6QODwtLQQaK9bwgEnU1HMYWbw=;
        b=uxwsgrbzdtJQanMAdP7NXD31MxczyOgR2Yq2NVXDfTypSPq17HFoJGlemCb+HhBRir
         aHykoivSDiPBPzxnZLGi9VKGffm9y1UxPWByWnAhAZzaOfcoxBq6hYUXNRsuSfvMXHYO
         7JKalkiQg3ia0sTpdcfvQsJP6qZEG27PVIy3fOBM7xlJN9cQrfW7Ft+AQp2d9ZCmLZDh
         +GPW2Uyv4ejhKUM7eRURKujnZnLIxjffKaepklJ8a6K8W/QKiR0sUHJxTHIl7VeWEPYB
         aYWtIPsU+2qGOWczJdKfj7or9g1sJJs3Xzg9l9hKw6CqhNe3B2IOwUtMIOfQ2gU7vnkt
         y4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUpBmEGh6O0TF/RI/0qC1TyE+r0e+c4Ic0c6JHkKc0f3HhKYAoCpNsVV7x9k/AlHEpsRbcq/5wgRVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT0ZSJZlvA0rqqJF9lBmJ7LTE4RVyn/ixIGbhhVUAXa07tLc8m
	fSv5s9nos+eP3QLRNVGcL0hKZVl5zvw+TgpgiLiz7p1MOWwepFwI
X-Gm-Gg: ASbGncvEP8DiXYNZhPXG1T1t/l+Ab822go90zBNdi1EycMkgLHB4QmRwN6DgRXOvAxR
	tHfTLgG3zBFQbH4vTNU+z/kEuLlcEwpL5C2deBvYwSqmAvc8/L7Di/pFIeNTUKfqGCS8TnQ/2wf
	MC4movLCIhranCYNYn9C8gFjqH8QCARgc++EgF7NPz2FNQ/162dFSg3bge9xtlFhomg8dnhKZEJ
	oGwmUtmKnCF9CYVtMTLvWfUEEVUhITTf10PHZQvUWp/LbNpHM8Va79dqbdUoJJUZh0CFIQY4sk7
	VZ5BZOYjZNjXCrL1uO8b0f9ZPyA1Z4xLZUxXoiyYdWkL4udk/4IJh6HLjPu0PadPEb1wewKazgc
	Z1GxGIosTAMyglRYE
X-Google-Smtp-Source: AGHT+IHhU0PW0oJeqobY4cmjhqnGrL4i/fSgX+jVwJB9eYjXsy0U8amwuHzLFAaew7yGxrPXrSm7Kw==
X-Received: by 2002:a17:906:9f8a:b0:ac6:f5b5:36e0 with SMTP id a640c23a62f3a-acb168aeeefmr269651466b.19.1744713394444;
        Tue, 15 Apr 2025 03:36:34 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Zc0EeoTIfgGOJP9ZlqxoOzHO"
Message-ID: <c307b7c1-3266-4916-a6ce-e5b34fcbf4fd@gmail.com>
Date: Tue, 15 Apr 2025 12:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/14] xen/riscv: introduce init_IRQ()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <dff8b0a4a83fbd2b84c3427093a63fcee8a7122f.1744126720.git.oleksii.kurochko@gmail.com>
 <f9e118ff-85fb-4bde-b313-740b1ea7ae4f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f9e118ff-85fb-4bde-b313-740b1ea7ae4f@suse.com>

This is a multi-part message in MIME format.
--------------Zc0EeoTIfgGOJP9ZlqxoOzHO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 5:25 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/irq.h
>> +++ b/xen/arch/riscv/include/asm/irq.h
>> @@ -3,6 +3,28 @@
>>   #define ASM__RISCV__IRQ_H
>>   
>>   #include <xen/bug.h>
>> +#include <xen/device_tree.h>
>> +
>> +#define NR_IRQS 1024
>> +
>> +/*
>> + * TODO: Should IRQ_TYPE_* be moved to xen/irq.h and wrapped into
>> + * #ifdef CONFIG_HAS_DEVICE_TREE?
>> + */
> Wouldn't that be more like asm-generic/dt-irq.h (or irq-dt.h)? The field where
> these values are stored is an arch-specific one, after all.

It would be much better. Thanks!

~ Oleksii

--------------Zc0EeoTIfgGOJP9ZlqxoOzHO
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
    <div class="moz-cite-prefix">On 4/10/25 5:25 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f9e118ff-85fb-4bde-b313-740b1ea7ae4f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -3,6 +3,28 @@
 #define ASM__RISCV__IRQ_H
 
 #include &lt;xen/bug.h&gt;
+#include &lt;xen/device_tree.h&gt;
+
+#define NR_IRQS 1024
+
+/*
+ * TODO: Should IRQ_TYPE_* be moved to xen/irq.h and wrapped into
+ * #ifdef CONFIG_HAS_DEVICE_TREE?
+ */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wouldn't that be more like asm-generic/dt-irq.h (or irq-dt.h)? The field where
these values are stored is an arch-specific one, after all.</pre>
    </blockquote>
    <pre>It would be much better. Thanks!

~ Oleksii
</pre>
  </body>
</html>

--------------Zc0EeoTIfgGOJP9ZlqxoOzHO--

