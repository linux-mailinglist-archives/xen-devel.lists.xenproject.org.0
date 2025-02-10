Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7727EA2E792
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 10:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884477.1294181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQ0V-0006BV-9q; Mon, 10 Feb 2025 09:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884477.1294181; Mon, 10 Feb 2025 09:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQ0V-00069W-6b; Mon, 10 Feb 2025 09:23:11 +0000
Received: by outflank-mailman (input) for mailman id 884477;
 Mon, 10 Feb 2025 09:23:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thQ0T-00069H-GZ
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 09:23:09 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2db36a4-e790-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 10:23:06 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54508b026d1so1021510e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 01:23:06 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545004c07d7sm774125e87.84.2025.02.10.01.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 01:23:05 -0800 (PST)
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
X-Inumbo-ID: a2db36a4-e790-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739179386; x=1739784186; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dZZELp3FT8itXCZjhguUJhrDewyL5mUA6UXiWo2g1I=;
        b=Y4aFrpoGp20NA3AQVyB3T3+ClaKpnrsfYe0duG8N83fOvLKiw2W4MNt9LLWolfV8RW
         mPqv7BqGAhdZsSV/xTh1TbTn2fkzjTv2QjeQfBUY/1ZG3ZesPhGtrAsictPHYS0sBxyZ
         deZ5zHl9DeiXsoJ7uBeiI0zQ9seV8muTVQ5brKFteQqEklX+jXKjIKUrobawckHtrvBc
         V5fSNEokyYz/7F9L/qGCaQ+14QM/X5wHKCkpsE8TU/kulVBeeZcq1Qws5CYcUpvzyd5l
         8xjkJvnkSpolObZSVvd7By/7GqbOI2hUQgznqS0hUl4YdxWOI9RLm7gsFj1paWkbZy22
         3BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179386; x=1739784186;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6dZZELp3FT8itXCZjhguUJhrDewyL5mUA6UXiWo2g1I=;
        b=Iu6FZhpP2ur23Yl772Qr/nrYgOPjFbSIpCinEON9Xyf2j6ENyoCiMwe7lTXatNvk+X
         VSVl9P3E9tcmgZOye/QN6t6jwmqVZGdA3oEE/wpkJKy8cgVrjM9exG8vjuGZmogkeIJL
         wvL38Zp2LD/zlVJrO/JFoeQxI242/cbgPQvaGjnmR1AmFVmNO3edwnLkcLqrjjTFTh5R
         LbTrpBAlPDEtWBHVxdafjRXpB4CxkdkFOUAFWt2DwV141r67SdkLc54Y5QqVW5IggGio
         tkP/GnJ95w0Sg4eCsyIIJr0ej+0pMStP5tHu3qH8hv84kSzlAvsCoe7sWh/QitBadaXM
         NrQw==
X-Forwarded-Encrypted: i=1; AJvYcCXJZBZgQkqbgiOdlhVl2BdKssHmFq+FPbkmop0zMDzL20piHN9/+pReUnOdoEWUfF05Ly9Zqs0J50Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTqVjpPvtWT1jeAnX0FtiVlZkgU0raug7SDzIy6S05ycgR63PD
	Gpm1yn57OXtrCt9C0mV27AJnz7Tzz2loSl/5MZzne0jmMeId+emo
X-Gm-Gg: ASbGncuFU/q4WHzfQgRRef9hsz/tViN8dGRPypoyri/sopn7rLC7uv4GS9KME6Vrk+q
	3vRBHQ2PjzostXzE7CpwJJXmXeJtqT0/4P27ZNy88z+xBxiMUqE5J3AdoZvTcTY4kLrq78EobQp
	gNpiU7lb8et/8bWOUJPm67989n3+UVt3zI5kdVQQBOMCvEVqL4SUzCkpM8pzdAw3RcE555ttK2Z
	XDx7y2/8NyhApS6AyCO8mRHBRXUsZO/2Fk1/cO9IhgxdGcvtCzV7hAscxz3BzP7PulKwvz05V4A
	VHGbeNhLks/BOgbU0LfupkVYu4M=
X-Google-Smtp-Source: AGHT+IEDGrtr1KJf8TSu1CKBrCkceZHALoYFZ1h4Uawuo3OCrjisaDJ9ErNqBTOm3Tb3R3t5BUOsCg==
X-Received: by 2002:a05:6512:3f6:b0:545:a1a:556b with SMTP id 2adb3069b0e04-5450a1a586amr1008326e87.0.1739179385823;
        Mon, 10 Feb 2025 01:23:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------x0xced3X6o0Ztvjs03JVNd4i"
Message-ID: <f4dc7fe4-e0ff-40c9-8677-c81a261b6641@gmail.com>
Date: Mon, 10 Feb 2025 10:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen: Centralise the declaration of
 dump_execution_state()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250208000256.431883-4-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------x0xced3X6o0Ztvjs03JVNd4i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/8/25 1:02 AM, Andrew Cooper wrote:
> Three architectures have an identical dump_execution_state(), and PPC has a
> stub for show_execution_state() that just isn't wired up yet.
>
> show_execution_state() is declared in a common header, meaning that
> dump_execution_state() really ought to be too.  Move them both into xen/bug.h
> as they're tightly tied to run_in_exception_handler().  Drop the include of
> xen/kernel.h from ubsan.c which was required reviously for RISC-V to compile.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
> ---
>   xen/arch/arm/include/asm/processor.h   | 2 --
>   xen/arch/riscv/include/asm/processor.h | 2 --

Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>.

Thanks.

~ Oleksii

>   xen/arch/x86/include/asm/processor.h   | 1 -
>   xen/common/ubsan/ubsan.c               | 1 -
>   xen/include/xen/bug.h                  | 3 +++
>   xen/include/xen/kernel.h               | 2 --
>   6 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index d80d44aeaa8f..f2c4d990c71c 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -577,8 +577,6 @@ void panic_PAR(uint64_t par);
>   void show_registers(const struct cpu_user_regs *regs);
>   void show_stack(const struct cpu_user_regs *regs);
>   
> -#define dump_execution_state() run_in_exception_handler(show_execution_state)
> -
>   #define cpu_relax() barrier() /* Could yield? */
>   
>   /* All a bit UP for the moment */
> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
> index 39696fb58dc6..90b800956303 100644
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -91,8 +91,6 @@ static inline void sfence_vma(void)
>       asm volatile ( "sfence.vma" ::: "memory" );
>   }
>   
> -#define dump_execution_state() run_in_exception_handler(show_execution_state)
> -
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* ASM__RISCV__PROCESSOR_H */
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
> index d247ef8dd226..c2eafaecfd40 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -405,7 +405,6 @@ static always_inline void rep_nop(void)
>   void show_code(const struct cpu_user_regs *regs);
>   void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
>   void show_registers(const struct cpu_user_regs *regs);
> -#define dump_execution_state() run_in_exception_handler(show_execution_state)
>   void show_page_walk(unsigned long addr);
>   void noreturn fatal_trap(const struct cpu_user_regs *regs, bool show_remote);
>   
> diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
> index e99370322b44..a96153c08078 100644
> --- a/xen/common/ubsan/ubsan.c
> +++ b/xen/common/ubsan/ubsan.c
> @@ -11,7 +11,6 @@
>    */
>   
>   #include <xen/bitops.h>
> -#include <xen/kernel.h>
>   #include <xen/lib.h>
>   #include <xen/percpu.h>
>   #include <xen/spinlock.h>
> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> index 99814c4bef36..2325a46e7f61 100644
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -155,6 +155,9 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
>   
>   #endif /* CONFIG_GENERIC_BUG_FRAME */
>   
> +void cf_check show_execution_state(const struct cpu_user_regs *regs);
> +#define dump_execution_state() run_in_exception_handler(show_execution_state)
> +
>   #endif /* !__ASSEMBLY__ */
>   
>   #endif /* __XEN_BUG_H__ */
> diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
> index c5b6cc977772..57a1ef4e17b7 100644
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -94,10 +94,8 @@ bool is_active_kernel_text(unsigned long addr);
>   extern const char xen_config_data[];
>   extern const unsigned int xen_config_data_size;
>   
> -struct cpu_user_regs;
>   struct vcpu;
>   
> -void cf_check show_execution_state(const struct cpu_user_regs *regs);
>   void vcpu_show_execution_state(struct vcpu *v);
>   
>   #endif /* _LINUX_KERNEL_H */
--------------x0xced3X6o0Ztvjs03JVNd4i
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
    <div class="moz-cite-prefix">On 2/8/25 1:02 AM, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250208000256.431883-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Three architectures have an identical dump_execution_state(), and PPC has a
stub for show_execution_state() that just isn't wired up yet.

show_execution_state() is declared in a common header, meaning that
dump_execution_state() really ought to be too.  Move them both into xen/bug.h
as they're tightly tied to run_in_exception_handler().  Drop the include of
xen/kernel.h from ubsan.c which was required reviously for RISC-V to compile.

No functional change.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
---
 xen/arch/arm/include/asm/processor.h   | 2 --
 xen/arch/riscv/include/asm/processor.h | 2 --</pre>
    </blockquote>
    <pre>Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250208000256.431883-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 xen/arch/x86/include/asm/processor.h   | 1 -
 xen/common/ubsan/ubsan.c               | 1 -
 xen/include/xen/bug.h                  | 3 +++
 xen/include/xen/kernel.h               | 2 --
 6 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index d80d44aeaa8f..f2c4d990c71c 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -577,8 +577,6 @@ void panic_PAR(uint64_t par);
 void show_registers(const struct cpu_user_regs *regs);
 void show_stack(const struct cpu_user_regs *regs);
 
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
-
 #define cpu_relax() barrier() /* Could yield? */
 
 /* All a bit UP for the moment */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 39696fb58dc6..90b800956303 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -91,8 +91,6 @@ static inline void sfence_vma(void)
     asm volatile ( "sfence.vma" ::: "memory" );
 }
 
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PROCESSOR_H */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index d247ef8dd226..c2eafaecfd40 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -405,7 +405,6 @@ static always_inline void rep_nop(void)
 void show_code(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
 void show_page_walk(unsigned long addr);
 void noreturn fatal_trap(const struct cpu_user_regs *regs, bool show_remote);
 
diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index e99370322b44..a96153c08078 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -11,7 +11,6 @@
  */
 
 #include &lt;xen/bitops.h&gt;
-#include &lt;xen/kernel.h&gt;
 #include &lt;xen/lib.h&gt;
 #include &lt;xen/percpu.h&gt;
 #include &lt;xen/spinlock.h&gt;
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 99814c4bef36..2325a46e7f61 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -155,6 +155,9 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
 
 #endif /* CONFIG_GENERIC_BUG_FRAME */
 
+void cf_check show_execution_state(const struct cpu_user_regs *regs);
+#define dump_execution_state() run_in_exception_handler(show_execution_state)
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __XEN_BUG_H__ */
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index c5b6cc977772..57a1ef4e17b7 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -94,10 +94,8 @@ bool is_active_kernel_text(unsigned long addr);
 extern const char xen_config_data[];
 extern const unsigned int xen_config_data_size;
 
-struct cpu_user_regs;
 struct vcpu;
 
-void cf_check show_execution_state(const struct cpu_user_regs *regs);
 void vcpu_show_execution_state(struct vcpu *v);
 
 #endif /* _LINUX_KERNEL_H */
</pre>
    </blockquote>
  </body>
</html>

--------------x0xced3X6o0Ztvjs03JVNd4i--

