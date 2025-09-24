Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D91B9A3C8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 16:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129440.1469395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1QRB-00086D-RA; Wed, 24 Sep 2025 14:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129440.1469395; Wed, 24 Sep 2025 14:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1QRB-00084b-OX; Wed, 24 Sep 2025 14:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1129440;
 Wed, 24 Sep 2025 14:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CQP=4D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1QRA-00084V-7r
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 14:25:40 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 573647d8-9952-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 16:25:38 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b2ee3c13aa4so424988766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 07:25:37 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b2636394de6sm1223271166b.39.2025.09.24.07.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 07:25:36 -0700 (PDT)
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
X-Inumbo-ID: 573647d8-9952-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758723937; x=1759328737; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KstcK8ZG6CA6t+q9gqOKzR7wqHg3pnJye8/K8xAI22U=;
        b=Z4Q5xBhB4sDofUxflAckYnNXjYeZQ4PKpLUKBHAjt4oikhhgcqlxdLEXr6mWVVS9GY
         IJCcS3q4JMnetLoVQccqBBlBLIn2O2gGH7HwXxMYJo41+CxMUH9b5wdJG/FWITqUzD/T
         5rjtQJ9lCgHaxY0LvYiVllVFJ78ZmLO4H69gb3VPTlzstgBTqtOd8oVVeDZNmx2vksrP
         u5hjU+fRzGE1bzTHDtG6uJW7hMLkCMaHLq4Fza/TPI2SzMCWmZwOE1MZkfrySr4oy6xv
         YePFf5+Q5RWy10aE3DGuR9l7+JHYR/SsCWJq7ySN6+ro+izEV+sWq0iCpMcUOnUqLfHU
         6T6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758723937; x=1759328737;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KstcK8ZG6CA6t+q9gqOKzR7wqHg3pnJye8/K8xAI22U=;
        b=H2CA4lMiwM8frqJd0brKltzDa37gR7va+npmiGxu3Jcv6Vi1hISZ/oSUn3ohc0vCM5
         KMwBDOxymUKlr0trAuu/fPaNYzOhSH9J/RpIz/QgMIs/3Kjt9Xce/SoEEfgzPh2GpOw9
         kk+LceTLlP0PqEsFGwPsCohFsYlkBNlRJqKeBO4JkU9enCjctu+xNKNxQwHoS0rJFt7E
         6b6WAQoja8XuuJPcVHkHrHPY73tJOTSFEIJbh8vwYT+RpLF0Q0iGPTSEAAjNagMS5+la
         2Bvbg9ii1NXZID/1KDmPhadzH2Q1X/oRfolowKJNECZBtUz47EviW+p8EoT/Ly6zJZq3
         aj8g==
X-Forwarded-Encrypted: i=1; AJvYcCWl9RM200SSGg6uOY8QRQunKl97FFsSLn3F4sKYD//JIs7MEaK0S0rjfVS3FafvLWfZqZtrFz5DmEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhWMDxhKM79KhLKqrVjKU30JXYHrl+zulOzO/00C+51QBQ4zVz
	1ko8YFLvU32u0e3IvJTdt0QoNyahMD6LtRQwr9DpudNfI78rjogsD5Fp
X-Gm-Gg: ASbGncsNNK5YmAQ8s4VxMD3YPDBmCOp+51W1zK8fiNZ9PLT0x7HSlusJUOnZweeJR/A
	T4d7TZW3qkczlbVZmPBf+vuR9HtvVa1dVHfCBj5Oe8YFK3o2EefiMvy7aSnKrp9XyXxADBEl6EF
	wd6MUOooRw2I1+YmVH4VeMFmx6B8WDECbKbHMN5pnwTTA2WKPdylEIcMfGQ5J7Owho9yyFGJdz7
	Q0LYp3mW5XX2lBUhPMFusohq0kEfbOHfNl5OnuayIpKtQnBGjQ/iz04wacQN3f+etWxVciZ3n+3
	D0wHKaTTrhVX+cpXtGDr7F+ra0tf5Tt8ikS/kZ/o0Z6a1dDzuhSmScDy7+pWTJWJsj+bH7qbSoo
	BFoPDQiEWLstEs04DbBKCmJC1i7nD0dKlJ2HSGTjtpEttxhpwBELNlOz2F7PPmDIhF+0eYHhs
X-Google-Smtp-Source: AGHT+IEq3qGGBqynw9iYKp7Zxm2ZZGeVftR1bzziQ4fPNmPhGYbWkaXK06UC9wwpE0FFUdjuMHb9xg==
X-Received: by 2002:a17:907:9447:b0:b30:880:8d50 with SMTP id a640c23a62f3a-b34bad22678mr2548966b.21.1758723937002;
        Wed, 24 Sep 2025 07:25:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------60CPG0me079SX3gr2E7yEmVM"
Message-ID: <1be98c7f-59ff-4808-957c-daa55d1f441d@gmail.com>
Date: Wed, 24 Sep 2025 16:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 02/18] xen/riscv: introduce VMID allocation and
 manegement
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <ee861e4d0e43917d230e0c31ee51ff0573fcf2bd.1758145428.git.oleksii.kurochko@gmail.com>
 <03c68390-fd9b-443b-a012-2846dda2a923@suse.com>
Content-Language: en-US
In-Reply-To: <03c68390-fd9b-443b-a012-2846dda2a923@suse.com>

This is a multi-part message in MIME format.
--------------60CPG0me079SX3gr2E7yEmVM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/19/25 11:26 PM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>> @@ -151,6 +152,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       gstage_mode_detect();
>>   
>> +    vmid_init();
> Like for the earlier patch, I'm not convinced this is a function good
> to call from the top-level start_xen(). The two functions sitting side
> by side actually demonstrates the scalability issue pretty well.

In the case of vmid_init(), it could be a good place to call it here since
vmid_init() is expected to be called once when a pCPU is booted. For the boot
CPU, all "setup" functions are called in start_xen(), so vmid_init() could
potentially be called there as well.

For other (non-boot) CPUs, vmid_init() could be called somewhere in the
__cpu_up() code or at the CPU’s entry point.

>> --- /dev/null
>> +++ b/xen/arch/riscv/vmid.c
>> @@ -0,0 +1,193 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/domain.h>
>> +#include <xen/init.h>
>> +#include <xen/sections.h>
>> +#include <xen/lib.h>
>> +#include <xen/param.h>
>> +#include <xen/percpu.h>
>> +
>> +#include <asm/atomic.h>
>> +#include <asm/csr.h>
>> +#include <asm/flushtlb.h>
>> +#include <asm/p2m.h>
>> +
>> +/* Xen command-line option to enable VMIDs */
>> +static bool __ro_after_init opt_vmid_use_enabled = true;
>> +boolean_param("vmid", opt_vmid_use_enabled);
> Is there a particular reason to not have the variable be simply opt_vmid,
> properly in sync with the command line option?

There is no a specific reason for that, just made it in sync with x86.
opt_vmid could be used instead. I will do s/opt_vmid_use_enabled/opt_vmid.

>> +void vcpu_vmid_flush_vcpu(struct vcpu *v)
> An reason to have two "vcpu" in the name?

The first "vcpu" should be really dropped.

Thanks.

~ Oleksii

--------------60CPG0me079SX3gr2E7yEmVM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/19/25 11:26 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:03c68390-fd9b-443b-a012-2846dda2a923@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -151,6 +152,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     gstage_mode_detect();
 
+    vmid_init();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Like for the earlier patch, I'm not convinced this is a function good
to call from the top-level start_xen(). The two functions sitting side
by side actually demonstrates the scalability issue pretty well.</pre>
    </blockquote>
    <pre>In the case of vmid_init(), it could be a good place to call it here since
vmid_init() is expected to be called once when a pCPU is booted. For the boot
CPU, all "setup" functions are called in start_xen(), so vmid_init() could
potentially be called there as well.

For other (non-boot) CPUs, vmid_init() could be called somewhere in the
__cpu_up() code or at the CPU’s entry point.

</pre>
    <blockquote type="cite"
      cite="mid:03c68390-fd9b-443b-a012-2846dda2a923@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/vmid.c
@@ -0,0 +1,193 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include &lt;xen/domain.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/sections.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/param.h&gt;
+#include &lt;xen/percpu.h&gt;
+
+#include &lt;asm/atomic.h&gt;
+#include &lt;asm/csr.h&gt;
+#include &lt;asm/flushtlb.h&gt;
+#include &lt;asm/p2m.h&gt;
+
+/* Xen command-line option to enable VMIDs */
+static bool __ro_after_init opt_vmid_use_enabled = true;
+boolean_param("vmid", opt_vmid_use_enabled);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Is there a particular reason to not have the variable be simply opt_vmid,
properly in sync with the command line option?</pre>
    </blockquote>
    <pre>There is no a specific reason for that, just made it in sync with x86.
opt_vmid could be used instead. I will do s/opt_vmid_use_enabled/opt_vmid.

</pre>
    <blockquote type="cite"
      cite="mid:03c68390-fd9b-443b-a012-2846dda2a923@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+void vcpu_vmid_flush_vcpu(struct vcpu *v)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">An reason to have two "vcpu" in the name?</pre>
    </blockquote>
    <pre>The first "vcpu" should be really dropped.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------60CPG0me079SX3gr2E7yEmVM--

