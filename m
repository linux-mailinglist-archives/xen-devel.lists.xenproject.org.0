Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C2A2E725
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 10:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884447.1294151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPhO-0001Xe-9w; Mon, 10 Feb 2025 09:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884447.1294151; Mon, 10 Feb 2025 09:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPhO-0001Vf-6u; Mon, 10 Feb 2025 09:03:26 +0000
Received: by outflank-mailman (input) for mailman id 884447;
 Mon, 10 Feb 2025 09:03:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thPhM-0001VZ-Ml
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 09:03:24 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1e625b7-e78d-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 10:03:23 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-308f141518cso4809401fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 01:03:23 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de1a6531sm11525061fa.45.2025.02.10.01.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 01:03:22 -0800 (PST)
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
X-Inumbo-ID: e1e625b7-e78d-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739178203; x=1739783003; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKXv3NkJ2Z3iZ0c1l1qvFMr4KzT8F4T03floCXMYS4U=;
        b=nYELHgk6BeCdM/hrcEfAhb3w/A8ByrDFft/F4Sqe9fVx/KlMcR1dPNqzc2AYRAUnWU
         R6sLtqiOFi27IKXq6LGD0MKWXFakfnUUwLOqYVgZ+CENQNm9kSFEAhqZ4crJ0laJjWS0
         VZKsDXxeQUVy8aE2HGdourpOwR3WHJQcZ4PX7OpMePDeCcJRO6YWUlUPNN+2GqOkAEZM
         Z2EvgBuTyYtyvn5jXKH0AiUPfB8yrEY3dJqwE4LPQab+fJd//274fmEo9ZqGuL5ixNqm
         XAe/N60Pafw+vdQGyr48xuPilrFx9Ml/vrIiXzVLd7EH3RlEcLPLcMR7XQr0NZUTPAw9
         u8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739178203; x=1739783003;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QKXv3NkJ2Z3iZ0c1l1qvFMr4KzT8F4T03floCXMYS4U=;
        b=Z0A/6qgmtTBUyOzmMMreF95pJ3ww1hyCF78ggQS1jN/MtiDtz/pV29bZlLzkz+cPwV
         ezeRy6CeSB+SxJcjBT23drBPsZ9yeh6/vFNuIUI4pjOKmAWDvczAG5HrWLV50eN8lT37
         KKBTiC9I7tgQni9QT6wnS0xa3u58nzCy8U1Pm37vf1F4n6T2ksy9Bs46ylDCyIUBbUUn
         Gv9oJvvHOvv/C2yBx1tPbUb1rM/lub979U3LoBDqOcEzFRW5TsS1yYt8GxCsYGK9Y6gs
         gSWifn/LyCRas4ECbsHp9ODPFwcp2zCB9Z/DQ/TuXOHud8Q+RHmMj+IFARSlZG3xnE6s
         gdvA==
X-Forwarded-Encrypted: i=1; AJvYcCXCGLO/oLScic/ExGnfPc6kv9yyNMfXYUyzN14OLXtRn6fcXSH9Nv53xJJ6FmLl9V/Y3kEUVmdkObI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE6mvjUawjNhVwavnkcnwFpwiw9tLUvkQXplZVRzGixW9ch+Ej
	VtmLI7D/1r2xzQ3gVOKpLlmRKkNeKgEXRIIdlpWyY040pmL3IeHB
X-Gm-Gg: ASbGncvmVElXmH7whPmxX9slhSHBKMHE4GGQDb9+qWus90l62gBMVZ7aTQaaq1Hl3xK
	PjBWhrw05H6KXJpV7JACS+dMMfb6pnbo8oZFf7DuJNaO811vojqkxs6g1URrjWc8xMiNkRLfYJe
	3oAfe9ADUX7yS6Voe2f7gu7KSGEEwPV/FyxDx+yfgyoA2MmcLswYCw3VTrKsVNn2NOXpvcO29lt
	Y+YDZoVXfstVmPcA86ePb7CuknnLim+HyX0gNCuBDtCsjLr0KeLALZhVemJZnaZhoo8XNoUKu/p
	0LOBcls4E4tjzB7V3WqorSYbJ8M=
X-Google-Smtp-Source: AGHT+IHiRrDSQFSBKh34OpQZQwWvVV/CrRHuJ88IEPMfB+jyuMPvJhPQBGGpLqgw/wQ//NIz8db6rg==
X-Received: by 2002:a2e:bd02:0:b0:2ff:c3a2:f408 with SMTP id 38308e7fff4ca-307e5801dd0mr39277381fa.12.1739178202971;
        Mon, 10 Feb 2025 01:03:22 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------xppFEAuQqZNZe0N00miO0MNU"
Message-ID: <00c5784f-3202-4301-a6ad-5840d84908cd@gmail.com>
Date: Mon, 10 Feb 2025 10:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 3/3] RISCV: Activate UBSAN in testing
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
 <20250207220122.380214-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250207220122.380214-4-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------xppFEAuQqZNZe0N00miO0MNU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/7/25 11:01 PM, Andrew Cooper wrote:
> RISC-V has less complicated headers, so update ubsan.c to pull in everything
> it needs.  Provide dump_execution_state(), and update the printk() message to
> make it more obvious that it's an outstanding task.
>
> As with commit 8ef2ac727e21 ("automation: enable UBSAN for debug tests"),
> enable UBSAN in RISC-V testing too.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
>
> Testing of this series:
>    https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078817715
>
> Sample run with an intentional UBSAN failure:
>    https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570135
> ---
>   automation/gitlab-ci/build.yaml        | 3 +++
>   xen/arch/riscv/Kconfig                 | 1 +
>   xen/arch/riscv/include/asm/processor.h | 2 ++
>   xen/arch/riscv/traps.c                 | 2 +-
>   xen/common/ubsan/ubsan.c               | 5 ++++-
>   5 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index fb55d4ce5568..35e224366f62 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -359,6 +359,9 @@ debian-12-riscv64-gcc-debug:
>       CONTAINER: debian:12-riscv64
>       KBUILD_DEFCONFIG: tiny64_defconfig
>       HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_UBSAN=y
> +      CONFIG_UBSAN_FATAL=y
>   
>   # Arm32 cross-build
>   
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index 00f329054c94..fa95cd0a4213 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -4,6 +4,7 @@ config RISCV
>   	select GENERIC_BUG_FRAME
>   	select HAS_DEVICE_TREE
>   	select HAS_PMAP
> +	select HAS_UBSAN
>   	select HAS_VMAP
>   
>   config RISCV_64
> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
> index 90b800956303..39696fb58dc6 100644
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -91,6 +91,8 @@ static inline void sfence_vma(void)
>       asm volatile ( "sfence.vma" ::: "memory" );
>   }
>   
> +#define dump_execution_state() run_in_exception_handler(show_execution_state)
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* ASM__RISCV__PROCESSOR_H */
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index d55a4a827b8c..ea3638a54fed 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -140,7 +140,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>   
>   void show_execution_state(const struct cpu_user_regs *regs)
>   {
> -    printk("implement show_execution_state(regs)\n");
> +    printk("TODO: Implement show_execution_state(regs)\n");
>   }
>   
>   void arch_hypercall_tasklet_result(struct vcpu *v, long res)
> diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
> index 7f73f94759db..e99370322b44 100644
> --- a/xen/common/ubsan/ubsan.c
> +++ b/xen/common/ubsan/ubsan.c
> @@ -10,8 +10,11 @@
>    *
>    */
>   
> -#include <xen/spinlock.h>
> +#include <xen/bitops.h>
> +#include <xen/kernel.h>
> +#include <xen/lib.h>
>   #include <xen/percpu.h>
> +#include <xen/spinlock.h>

I am not insisting on to have these changes in a separate patch, but they don't really
look as RISC-V specific.

Anyway, changes look good to me, so:
  Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>   
>   #define __noreturn    noreturn
>   #define pr_err(...) printk(XENLOG_ERR __VA_ARGS__)
--------------xppFEAuQqZNZe0N00miO0MNU
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
    <div class="moz-cite-prefix">On 2/7/25 11:01 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250207220122.380214-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">RISC-V has less complicated headers, so update ubsan.c to pull in everything
it needs.  Provide dump_execution_state(), and update the printk() message to
make it more obvious that it's an outstanding task.

As with commit 8ef2ac727e21 ("automation: enable UBSAN for debug tests"),
enable UBSAN in RISC-V testing too.

No functional change.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>

Testing of this series:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078817715">https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078817715</a>

Sample run with an intentional UBSAN failure:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570135">https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570135</a>
---
 automation/gitlab-ci/build.yaml        | 3 +++
 xen/arch/riscv/Kconfig                 | 1 +
 xen/arch/riscv/include/asm/processor.h | 2 ++
 xen/arch/riscv/traps.c                 | 2 +-
 xen/common/ubsan/ubsan.c               | 5 ++++-
 5 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index fb55d4ce5568..35e224366f62 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -359,6 +359,9 @@ debian-12-riscv64-gcc-debug:
     CONTAINER: debian:12-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UBSAN=y
+      CONFIG_UBSAN_FATAL=y
 
 # Arm32 cross-build
 
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 00f329054c94..fa95cd0a4213 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -4,6 +4,7 @@ config RISCV
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
 	select HAS_PMAP
+	select HAS_UBSAN
 	select HAS_VMAP
 
 config RISCV_64
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 90b800956303..39696fb58dc6 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -91,6 +91,8 @@ static inline void sfence_vma(void)
     asm volatile ( "sfence.vma" ::: "memory" );
 }
 
+#define dump_execution_state() run_in_exception_handler(show_execution_state)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PROCESSOR_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index d55a4a827b8c..ea3638a54fed 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -140,7 +140,7 @@ void vcpu_show_execution_state(struct vcpu *v)
 
 void show_execution_state(const struct cpu_user_regs *regs)
 {
-    printk("implement show_execution_state(regs)\n");
+    printk("TODO: Implement show_execution_state(regs)\n");
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index 7f73f94759db..e99370322b44 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -10,8 +10,11 @@
  *
  */
 
-#include &lt;xen/spinlock.h&gt;
+#include &lt;xen/bitops.h&gt;
+#include &lt;xen/kernel.h&gt;
+#include &lt;xen/lib.h&gt;
 #include &lt;xen/percpu.h&gt;
+#include &lt;xen/spinlock.h&gt;</pre>
    </blockquote>
    <pre>I am not insisting on to have these changes in a separate patch, but they don't really
look as RISC-V specific.

Anyway, changes look good to me, so:
 Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20250207220122.380214-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre"> 
 #define __noreturn    noreturn
 #define pr_err(...) printk(XENLOG_ERR __VA_ARGS__)
</pre>
    </blockquote>
  </body>
</html>

--------------xppFEAuQqZNZe0N00miO0MNU--

