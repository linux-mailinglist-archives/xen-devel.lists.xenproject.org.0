Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A6EA2E719
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 09:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884438.1294140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPby-00083y-Ou; Mon, 10 Feb 2025 08:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884438.1294140; Mon, 10 Feb 2025 08:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPby-00081F-Lx; Mon, 10 Feb 2025 08:57:50 +0000
Received: by outflank-mailman (input) for mailman id 884438;
 Mon, 10 Feb 2025 08:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thPbx-000819-Oo
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 08:57:49 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 193f981c-e78d-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 09:57:47 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-308e3bd8286so13763441fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 00:57:47 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450c3d1922sm282993e87.3.2025.02.10.00.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:57:46 -0800 (PST)
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
X-Inumbo-ID: 193f981c-e78d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739177867; x=1739782667; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58hWoV17xvmWaMeA0pLKuCFSSAnJ6dG0u2Ce61gRp98=;
        b=kbPuWckNN+N396Qc5Yu91pyEb9cjkWY9b8o1zJe4dP3yPxmOS2VaQvld/wzThO5g2B
         rePv2VEv6CAuVfT8m5chNTTJITKzhMUKbTGV/I25ykwsbE5TyX9BBac0mdFjdI7aHEzN
         /sOPOcNvYYaFVP8M/9BPm8DP2QV4JsBwEhWEqURoA3ybS83xgM2Anrdcc5ZKLdKu72VT
         4jYqMVDVCrfbopl2WJbv9FBVSHaYh5DksMVhAx7QAul1/Mr03T0dywa9SI7XyRbH0K93
         xiAG2whEouNcRKH5mYLaDeXrq31rg8fmOXMmrmdw1y+riCjYnQ7Hyqhx0AYzxGTpVZ9Z
         LXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177867; x=1739782667;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58hWoV17xvmWaMeA0pLKuCFSSAnJ6dG0u2Ce61gRp98=;
        b=nFwGdj+uYFl4pQe7Kyie0JgSGkkDaDdZXSBu4OVXpHR+DaR+73eyh36FUOXth93JIa
         1d1JDrLZuC7aPwBzBNTi8JuxDvWd10idkNB/yYq+ENWGgRzeOdX1ug123/qmMZPp9kB2
         2wn+KuK9GMCgeQuiY72ARTTqbhMX+DkZRa9F1914nbEpdO9q72coemlh/Z+3pIjN+NTf
         /0lCFqfTehICMq+Q0j5vcbPr8RZptCRr9QmBWyTVubheUH3efPIoxBzrVTVPlek3wR7C
         9DWjJ+2CAiwIlGpZVdKWctw2lQQF94rqEfJdQEAjXZSr1LHFakll32gFDnjWmF51Wj8q
         3umg==
X-Forwarded-Encrypted: i=1; AJvYcCU+ZyZSAqHYXPbSyQC8sH81yApsTcCQFaVbYiQN8bOR/unZ7UoP7nveMTrIoW4co8Qyy9NKG9KjL0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweZfG/CXEuB9EDsNS9bGE7rAcnb7wyVEWH6xToZd7xXE1bmDVx
	AyDaizE0GhhcoDYbSaTIWXo6TGpJpp8v9KKTkitHGm0ovZ0sbc4i
X-Gm-Gg: ASbGncuMpMPCxtNXEib+ftcWO07YYBDASOO/A7xfDMZIJk+3+FvemKMIaTXtHc1z82w
	GzXI6Zqpo3t15ehlqQKhD5zKTmeUsadNqe/tRB3N0xYYKUTJdPp2nL9vSayIG7rtw16OMY2xS0Y
	b4H+UGVl9luoZNgWX2uauOMLeCTepPm+OX7vSFWga/kmrtMr1RFEsfHlsg0Op/Pt6WQP9Xy8UUS
	RT77sA4i8Acol1NIKR6wg4Pbkuahlar3Wzk1bDHnMEKH4pLMT0g2UBddtLDfpTjflP6hUsMiBnt
	fQXgStD2yhRgB9LdEvoZ4dgyZxc=
X-Google-Smtp-Source: AGHT+IG+NBHxolkPen+4+uAi6ZOGQiSneZ6egMG6xpL8Kb+tO93qYsGbIibSbLMjkCwrg+Y/h+iLfQ==
X-Received: by 2002:a05:6512:61:b0:545:158:1344 with SMTP id 2adb3069b0e04-54501581440mr2671906e87.49.1739177866502;
        Mon, 10 Feb 2025 00:57:46 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------18z603VALNf3V00LBwLxskvi"
Message-ID: <f434e5a7-756f-4d7b-8e0a-bcd5a924a285@gmail.com>
Date: Mon, 10 Feb 2025 09:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] RISCV/asm: Use CALL rather than JAL
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
 <20250207220122.380214-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250207220122.380214-3-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------18z603VALNf3V00LBwLxskvi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/7/25 11:01 PM, Andrew Cooper wrote:
> JAL has a maximium displacement of 2M.  To branch further, it needs pairing
> with an AUIPC instruction.  CALL is a pseudo-op which allows the linker to
> pick the appropriate sequence while processing relaxations.
>
> This avoids a build failure of the form:
>
>    prelink.o: in function `start':
>    xen/xen/arch/riscv/riscv64/head.S:28:(.text.header+0x2c):
>    relocation truncated to fit: R_RISCV_JAL against symbol `calc_phys_offset' defined in .init.text section in prelink.o
>    make[3]: *** [arch/riscv/Makefile:18: xen-syms] Error 1
>
> when Xen gets large enough, e.g. with CONFIG_UBSAN enabled.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> ---
>   xen/arch/riscv/entry.S        |  2 +-
>   xen/arch/riscv/riscv64/head.S | 12 ++++++------
>   2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
> index bf974655f8b3..4db818ba8d24 100644
> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -49,7 +49,7 @@ save_to_stack:
>           REG_S   t0, CPU_USER_REGS_SSTATUS(sp)
>   
>           mv      a0, sp
> -        jal     do_trap
> +        call    do_trap
>   
>   restore_registers:
>           /* Restore stack_cpu_regs */
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 2a1b3dad9191..9c40512e612e 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -28,7 +28,7 @@ FUNC(start)
>           add     t3, t3, __SIZEOF_POINTER__
>           bltu    t3, t4, .L_clear_bss
>   
> -        jal     reset_stack
> +        call    reset_stack
>   
>           /*
>            * save hart_id ( bootcpu_id ) and dtb_base as a0 and a1 register can
> @@ -37,16 +37,16 @@ FUNC(start)
>           mv      s0, a0
>           mv      s1, a1
>   
> -        jal     calc_phys_offset
> +        call    calc_phys_offset
>           mv      s2, a0
>   
> -        jal     setup_initial_pagetables
> +        call    setup_initial_pagetables
>   
>           /* Calculate proper VA after jump from 1:1 mapping */
>           la      a0, .L_primary_switched
>           sub     a0, a0, s2
>   
> -        jal     turn_on_mmu
> +        call    turn_on_mmu
>   
>   .L_primary_switched:
>           /*
> @@ -54,11 +54,11 @@ FUNC(start)
>            * recalculated after jump from 1:1 mapping world as 1:1 mapping
>            * will be removed soon in start_xen().
>            */
> -        jal     reset_stack
> +        call    reset_stack
>   
>           /* Xen's boot cpu id is equal to 0 so setup TP register for it */
>           li      a0, 0
> -        jal     setup_tp
> +        call    setup_tp
>   
>           /* restore hart_id ( bootcpu_id ) and dtb address */
>           mv      a0, s0
--------------18z603VALNf3V00LBwLxskvi
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
      cite="mid:20250207220122.380214-3-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">JAL has a maximium displacement of 2M.  To branch further, it needs pairing
with an AUIPC instruction.  CALL is a pseudo-op which allows the linker to
pick the appropriate sequence while processing relaxations.

This avoids a build failure of the form:

  prelink.o: in function `start':
  xen/xen/arch/riscv/riscv64/head.S:28:(.text.header+0x2c):
  relocation truncated to fit: R_RISCV_JAL against symbol `calc_phys_offset' defined in .init.text section in prelink.o
  make[3]: *** [arch/riscv/Makefile:18: xen-syms] Error 1

when Xen gets large enough, e.g. with CONFIG_UBSAN enabled.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a></pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250207220122.380214-3-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
---
 xen/arch/riscv/entry.S        |  2 +-
 xen/arch/riscv/riscv64/head.S | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
index bf974655f8b3..4db818ba8d24 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -49,7 +49,7 @@ save_to_stack:
         REG_S   t0, CPU_USER_REGS_SSTATUS(sp)
 
         mv      a0, sp
-        jal     do_trap
+        call    do_trap
 
 restore_registers:
         /* Restore stack_cpu_regs */
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 2a1b3dad9191..9c40512e612e 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -28,7 +28,7 @@ FUNC(start)
         add     t3, t3, __SIZEOF_POINTER__
         bltu    t3, t4, .L_clear_bss
 
-        jal     reset_stack
+        call    reset_stack
 
         /*
          * save hart_id ( bootcpu_id ) and dtb_base as a0 and a1 register can
@@ -37,16 +37,16 @@ FUNC(start)
         mv      s0, a0
         mv      s1, a1
 
-        jal     calc_phys_offset
+        call    calc_phys_offset
         mv      s2, a0
 
-        jal     setup_initial_pagetables
+        call    setup_initial_pagetables
 
         /* Calculate proper VA after jump from 1:1 mapping */
         la      a0, .L_primary_switched
         sub     a0, a0, s2
 
-        jal     turn_on_mmu
+        call    turn_on_mmu
 
 .L_primary_switched:
         /*
@@ -54,11 +54,11 @@ FUNC(start)
          * recalculated after jump from 1:1 mapping world as 1:1 mapping
          * will be removed soon in start_xen().
          */
-        jal     reset_stack
+        call    reset_stack
 
         /* Xen's boot cpu id is equal to 0 so setup TP register for it */
         li      a0, 0
-        jal     setup_tp
+        call    setup_tp
 
         /* restore hart_id ( bootcpu_id ) and dtb address */
         mv      a0, s0
</pre>
    </blockquote>
  </body>
</html>

--------------18z603VALNf3V00LBwLxskvi--

