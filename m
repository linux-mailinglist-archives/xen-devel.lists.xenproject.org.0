Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38DA07940
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 15:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868446.1279950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtYQ-000056-Pk; Thu, 09 Jan 2025 14:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868446.1279950; Thu, 09 Jan 2025 14:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtYQ-0008UZ-Mh; Thu, 09 Jan 2025 14:30:34 +0000
Received: by outflank-mailman (input) for mailman id 868446;
 Thu, 09 Jan 2025 14:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29Hz=UB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVtYP-0008Sz-9T
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 14:30:33 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47b1898e-ce96-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 15:30:31 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so1054630e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 06:30:31 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4a029sm213034e87.54.2025.01.09.06.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:30:30 -0800 (PST)
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
X-Inumbo-ID: 47b1898e-ce96-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736433031; x=1737037831; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8o3sLdrSQmSEZfwyq7x3Be1EQVU7A/CoBvMhpf1ArCI=;
        b=eZgTTexm86URc36roisY6M5jn/DgtiSTXSFZEXpTeW0Gqg7USzXwaUG7yVbZb2bSaN
         CXFGZ0lDNq2mbRPsgRJRu6a+Rk2kbpO0UAf/4oV7oxtvYlI1FfC1WFjz7LK+AikUjuyH
         5f2zjo99/C9VGWARCiosAaBcZNk40p8TFWjZqKAhrcwDE9pz2z9jFM5h2yXL4IQchv30
         a8Xrxp47Awj2vnYIamm7MrSfzmbZv6bzwczdrfrYYZloaNdXVSKD8vjWY99bPE00nqpb
         7C9bqPN014Up88K6f2ojZ25b7kve+6pbrPWfTh0zVlHYmInJjC4Q5essvcT6Tokh3oHc
         yc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736433031; x=1737037831;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8o3sLdrSQmSEZfwyq7x3Be1EQVU7A/CoBvMhpf1ArCI=;
        b=aE31p3jGjAudvSTJRQg3RwCH9v+s/S5dwU1Nyv7pN9n6ThxxrN9PSgvfFcyx3I3k/O
         M65s+6I2s4ucEbDgLkaORpLAUKkMbJBo9YIVCpEHG/71Xgf271+9f7wu9Rv8jGpt+rbZ
         BdAIbnDzbfsZTge6TgRy+N6Qe2XDte221Xq/f7FDkPzOWRZvZg58rXQWQ6VxvZ1YCEwE
         0k1L3KGfzULxqSY4BUfzVxbkhehoLt44k6OjaOp1Nd1XLDA5nzZwaVleKEElSYoNBjNo
         bc1daqabszbXhtq8EklPBV4Sp9oIJeHPuORbulXcrcLd3TuaTYmrCBQvBrLEmXXiYJ9u
         Jquw==
X-Forwarded-Encrypted: i=1; AJvYcCVmr68REJ3kk176GolFm5h6Kix+iMvyg7NQcaFyJ8nc1Y2QAv18ov/R5JMPGFElsr9zM+JG2YFSW+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRpFweKbOfwU6EUm2GmqPxPMQP+npnQ+vxJjlzy5Z2ZaadYEXE
	ba884Ob3gpXU7VCJlvNbMFRXcmmL7RvdEJljlOxuKgpPQL6EfYPh
X-Gm-Gg: ASbGncvM2yDRcHSkemBJ8Lymtk7laK9U9xpsuiid4CxbQtT0Mb2c6Q20q5E0xQjmx4P
	SXbbmdW5fLqFxuIGaFxEszHM8+NN9lRKXH0te6BT8JSzheIzXfYKBVITIV5ITtD2anPnTjliSr1
	oI12evSNgek3mxbEfeAQAuQQlJMqxOmgB7rQIk9ErH9/ij6cmnp8MhCsO/mY7NtvMjGPX5rtXKY
	8lu9uNFsk2BIRCeatuCq1Z19N2RQGAejsh9THRKrgTGQphHi44M2GXCA8NtGMAdXXeWdg==
X-Google-Smtp-Source: AGHT+IFHigQORXkLujkGRP2Ut+BSL155Fn5/j2ohvlUwLZAOkhNc7gwIK5Gr1lF3JxP32FeAwFyRDA==
X-Received: by 2002:a05:6512:220b:b0:53e:389d:8ce6 with SMTP id 2adb3069b0e04-542845d1dbamr2181163e87.28.1736433030738;
        Thu, 09 Jan 2025 06:30:30 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------XB0QNu0dROnMFJsesAT8yNW2"
Message-ID: <4eea61a2-cf56-4ff5-8c43-58f5a20c9cb1@gmail.com>
Date: Thu, 9 Jan 2025 15:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1735837806.git.w1benny@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1735837806.git.w1benny@gmail.com>

This is a multi-part message in MIME format.
--------------XB0QNu0dROnMFJsesAT8yNW2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/2/25 6:13 PM, Petr Beneš wrote:
> From: Petr Beneš<w1benny@gmail.com>
>
> Changes since v2:
> - Reset entry->pw in all cases in p2m_set_entry, except for p2m_access_r_pw
>
> Changes since v1:
> - Added signed-off-by tags
>
> This patch introduces a new XENMEM_access_r_pw permission. Functionally, it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permits the CPU to write to the page during guest page-table walks (e.g., updating A/D bits) without triggering an EPT violation.
>
> This behavior works by both enabling the EPT paging-write feature and setting the EPT paging-write flag in the EPT leaf entry.
>
> This feature provides a significant performance boost for introspection tools that monitor guest page-table updates. Previously, every page-table modification by the guest—including routine updates like setting A/D bits—triggered an EPT violation, adding unnecessary overhead. The new XENMEM_access_r_pw permission allows these "uninteresting" updates to occur without EPT violations, improving efficiency.

Considering that this feature provides a significant performance boost 
for introspection tools probably we could consider to take it to current 
release.

I see that the patch series was acked-by "Acked-by: Tamas K Lengyel 
<tamas@tklengyel.com>" but based on the change log it is not clear when 
exactly

before Feature freeze date or not. ( and I don't see any reply from Tamas ).

Thanks.

~ Oleksii

>
> Additionally, this feature simplifies the handling of race conditions in scenarios where an introspection tool:
>
> - Sets an "invisible breakpoint" in the altp2m view for a function F
> - Monitors guest page-table updates to track whether the page containing F is paged out
> - Encounters a cleared Access (A) bit on the page containing F while the guest is about to execute the breakpoint
>
> In the current implementation:
>
> - If xc_monitor_inguest_pagefault() is enabled, the introspection tool must emulate both the breakpoint and the setting of the Access bit.
> - If xc_monitor_inguest_pagefault() is disabled, Xen handles the EPT violation without notifying the introspection tool, setting the Access bit and emulating the instruction. However, Xen fetches the instruction from the default view instead of the altp2m view, potentially causing the breakpoint to be missed.
>
> With this patch, setting XENMEM_access_r_pw for monitored guest page-tables prevents EPT violations in these cases. This change enhances performance and reduces complexity for introspection tools, ensuring seamless breakpoint handling while tracking guest page-table updates.
>
>
> Petr Beneš (2):
>    x86: Rename _rsvd field to pw and move it to the bit 58
>    x86: Add Support for Paging-Write Feature
>
>   xen/arch/arm/mem_access.c               |  4 ++++
>   xen/arch/arm/mmu/p2m.c                  |  1 +
>   xen/arch/x86/hvm/hvm.c                  |  1 +
>   xen/arch/x86/hvm/monitor.c              |  1 +
>   xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
>   xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
>   xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  4 ++--
>   xen/arch/x86/include/asm/p2m.h          |  1 +
>   xen/arch/x86/mm/hap/nested_hap.c        |  3 +++
>   xen/arch/x86/mm/mem_access.c            |  3 +++
>   xen/arch/x86/mm/p2m-ept.c               | 12 ++++++++++++
>   xen/include/public/memory.h             |  9 +++++++++
>   xen/include/xen/mem_access.h            |  6 ++++++
>   13 files changed, 49 insertions(+), 3 deletions(-)
>
--------------XB0QNu0dROnMFJsesAT8yNW2
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
    <div class="moz-cite-prefix">On 1/2/25 6:13 PM, Petr Beneš wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cover.1735837806.git.w1benny@gmail.com">
      <pre wrap="" class="moz-quote-pre">From: Petr Beneš <a class="moz-txt-link-rfc2396E" href="mailto:w1benny@gmail.com">&lt;w1benny@gmail.com&gt;</a></pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:cover.1735837806.git.w1benny@gmail.com">
      <pre wrap="" class="moz-quote-pre">

Changes since v2:
- Reset entry-&gt;pw in all cases in p2m_set_entry, except for p2m_access_r_pw

Changes since v1:
- Added signed-off-by tags</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:cover.1735837806.git.w1benny@gmail.com">
      <pre wrap="" class="moz-quote-pre">

This patch introduces a new XENMEM_access_r_pw permission. Functionally, it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permits the CPU to write to the page during guest page-table walks (e.g., updating A/D bits) without triggering an EPT violation.

This behavior works by both enabling the EPT paging-write feature and setting the EPT paging-write flag in the EPT leaf entry.

This feature provides a significant performance boost for introspection tools that monitor guest page-table updates. Previously, every page-table modification by the guest—including routine updates like setting A/D bits—triggered an EPT violation, adding unnecessary overhead. The new XENMEM_access_r_pw permission allows these "uninteresting" updates to occur without EPT violations, improving efficiency.</pre>
    </blockquote>
    <pre><font face="monospace">Considering that this feature provides a significant performance boost for introspection tools probably we could consider to take it to current release.</font></pre>
    <pre><font face="monospace">I see that the patch series was acked-by "<span
    style="white-space: pre-wrap">Acked-by: Tamas K Lengyel <a
    class="moz-txt-link-rfc2396E" href="mailto:tamas@tklengyel.com">&lt;tamas@tklengyel.com&gt;</a>" but based on the change log it is not clear when exactly</span></font></pre>
    <pre><font face="monospace"><span style="white-space: pre-wrap">before Feature freeze date or not. ( and I don't see any reply from Tamas ).</span></font></pre>
    <pre><font face="monospace"><span style="white-space: pre-wrap">


Thanks.

</span></font></pre>
    <pre><font face="monospace">~ Oleksii</font>
</pre>
    <blockquote type="cite"
      cite="mid:cover.1735837806.git.w1benny@gmail.com">
      <pre wrap="" class="moz-quote-pre">

Additionally, this feature simplifies the handling of race conditions in scenarios where an introspection tool:

- Sets an "invisible breakpoint" in the altp2m view for a function F
- Monitors guest page-table updates to track whether the page containing F is paged out
- Encounters a cleared Access (A) bit on the page containing F while the guest is about to execute the breakpoint

In the current implementation:

- If xc_monitor_inguest_pagefault() is enabled, the introspection tool must emulate both the breakpoint and the setting of the Access bit.
- If xc_monitor_inguest_pagefault() is disabled, Xen handles the EPT violation without notifying the introspection tool, setting the Access bit and emulating the instruction. However, Xen fetches the instruction from the default view instead of the altp2m view, potentially causing the breakpoint to be missed.

With this patch, setting XENMEM_access_r_pw for monitored guest page-tables prevents EPT violations in these cases. This change enhances performance and reduces complexity for introspection tools, ensuring seamless breakpoint handling while tracking guest page-table updates.


Petr Beneš (2):
  x86: Rename _rsvd field to pw and move it to the bit 58
  x86: Add Support for Paging-Write Feature

 xen/arch/arm/mem_access.c               |  4 ++++
 xen/arch/arm/mmu/p2m.c                  |  1 +
 xen/arch/x86/hvm/hvm.c                  |  1 +
 xen/arch/x86/hvm/monitor.c              |  1 +
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  4 ++--
 xen/arch/x86/include/asm/p2m.h          |  1 +
 xen/arch/x86/mm/hap/nested_hap.c        |  3 +++
 xen/arch/x86/mm/mem_access.c            |  3 +++
 xen/arch/x86/mm/p2m-ept.c               | 12 ++++++++++++
 xen/include/public/memory.h             |  9 +++++++++
 xen/include/xen/mem_access.h            |  6 ++++++
 13 files changed, 49 insertions(+), 3 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------XB0QNu0dROnMFJsesAT8yNW2--

