Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95794A33AA4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 10:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887271.1296801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVBV-00038Y-2r; Thu, 13 Feb 2025 09:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887271.1296801; Thu, 13 Feb 2025 09:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVBU-00035M-Vl; Thu, 13 Feb 2025 09:07:00 +0000
Received: by outflank-mailman (input) for mailman id 887271;
 Thu, 13 Feb 2025 09:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=horU=VE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiVBT-0002u2-Tj
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 09:06:59 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0efd36a-e9e9-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 10:06:58 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-543d8badc30so703276e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 01:06:58 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10cb49sm113716e87.192.2025.02.13.01.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 01:06:56 -0800 (PST)
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
X-Inumbo-ID: e0efd36a-e9e9-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739437618; x=1740042418; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNPbML4e8QAK3S+gncpDaE3VL2AWEGbAev/N01B1Kj4=;
        b=JASKQyqwrTJ6H85QApbVaHVt7tonwVHhQlaTh4x8NvOPRKRDYkT55inkbE9yGjmqJj
         zSTGRVDqHbABrB0F/JzcAAwuTg9ESPEvT9XuxvtAxFzZvfRkvfXME8NIc6FN75oQyKij
         iDXMpag9uJa1vVI+s9LHGcCcBYNLBqrqAjQWu+cq3na2LVQr0zKA4HE2O/2eFhX3A1qV
         blNVxqHyUGgR0DdzweNaU7Fxg1+MqykPD8b0PR9xFqwUkw3rNECuPguTJI4Iy0HuUUAP
         ju8wasG/lDQ0p57b22vTkxc5yauVNbNh0DuS5ZmI5WQl2a2cv2/Jay2Wdi7Wvs6vuXn2
         +QKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437618; x=1740042418;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yNPbML4e8QAK3S+gncpDaE3VL2AWEGbAev/N01B1Kj4=;
        b=U/tCmMhRNBR285JA775iu3ys/tL/YEwEEz7GZZXtyH/tz6dLngjkYZr9Uo80dogAs3
         B5lvJ6l83GwDIUZTzbRnyPa+Y3fpO+MWS47Vy82SvflnEM1fUriVZGPSFt7zW5LG1BfT
         2zbXoemb2lK3lW/B9+BOzbzsAaGdhNT2amY8j1en7sWxSOGMAdJkK3VS8jy3SOMt6K+r
         uUiKwPtXYrL80LJvUF4gSNY2+2Nk3s1UvAJZawiljrhZc6Mks/fEd1to4EFuouXJ1YGr
         8AYxK4tLF3EZ5AzrwH/4uvxBL788FsCHvl+c6PrWMERebErpWZcfTTJwb2XTLAObr0o4
         vKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxL/Q/len+JCg9bgpThaM29F9CB9PTeaK+A4bMiDasvtn637JpxO7OjekI3KAJiA1+42POlB+rt4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTTMgQvfpnvGt2aD8LMw8Q0X7eQxxuC4+y6KS1dPzsg4ox9Oy6
	tLX0F/2SmkF3ILm4UpefTg6v1Ob4LH+nDXIg9x/E9y2vIiiMDqpm
X-Gm-Gg: ASbGncsDrbQFl5Qq8Wi4+GY8ePIpd2M4F5Bd5KtQWkO8W7cXDlcak6Sru34dLnk5nVz
	5FOs2EhNXPOmR8PPR4gNZ4f/30FDU50hLQ/I6UlEFcum6iculf1+2jHQGEkCx0OcwZuVE1pNJz1
	4gbNC6NCZTBwFhAUNXfVIDqyzk3MOtRVFoen3MChCSYhoxfmQiSc+VHwR67DIT8ltnJUFU04e8o
	ORcVhNDB7+LFKBGjCidxo6nMCt09K6ouK30AnABu7GCNttwnsVbBAeTQPnry7V4qhPdcmAhDr2i
	qK7WLVl1oo1tHC9T0oz6ezN9j74=
X-Google-Smtp-Source: AGHT+IFE/QzDeSLVToHqYp7ykbl2qd6HfVgSVzNRDJntEKMOFPZNlYrIFxSxAbobNvXONUg4bnIEuA==
X-Received: by 2002:a05:6512:33d0:b0:545:169b:9b51 with SMTP id 2adb3069b0e04-5451dd9e135mr899100e87.24.1739437617092;
        Thu, 13 Feb 2025 01:06:57 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------iSrqWeBpJmfK6BwSe1hJFII6"
Message-ID: <7f2e33f7-5f07-4d87-98cf-795142044f94@gmail.com>
Date: Thu, 13 Feb 2025 10:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2] ARM32/traps: Fix
 do_trap_undefined_instruction()'s detection of kernel text
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250211125445.451805-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250211125445.451805-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------iSrqWeBpJmfK6BwSe1hJFII6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/11/25 1:54 PM, Andrew Cooper wrote:
> While fixing some common/arch boundaries for UBSAN support on other
> architectures, the following debugging patch:
>
>    diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>    index c1f2d1b89d43..58d1d048d339 100644
>    --- a/xen/arch/arm/setup.c
>    +++ b/xen/arch/arm/setup.c
>    @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>
>         system_state = SYS_STATE_active;
>
>    +    dump_execution_state();
>    +
>         for_each_domain( d )
>             domain_unpause_by_systemcontroller(d);
>
> failed with:
>
>    (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>    (XEN) CPU0: Unexpected Trap: Undefined Instruction
>    (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
>    (XEN) CPU:    0
>    <snip>
>    (XEN)
>    (XEN) ****************************************
>    (XEN) Panic on CPU 0:
>    (XEN) CPU0: Unexpected Trap: Undefined Instruction
>    (XEN) ****************************************
>
> This is because the condition for init text is wrong.  While there's nothing
> interesting from that point onwards in start_xen(), it's also wrong for
> livepatches too.
>
> Use is_active_kernel_text() which is the correct test for this purpose, and is
> aware of init and livepatch regions as well as their lifetimes.
>
> Fixes: 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON")
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>

Release-Acked-by:Oleksii Kurochko <oleksii.kurochko@gmail.com> ~ Oleksii

> ---
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> v2:
>   * Split out change to dump_execution_state()
>
> Sample run going wrong:
>    https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570105
>
> Sample run with dump_execution_state() working:
>    https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9079185111
> ---
>   xen/arch/arm/arm32/traps.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index a2fc1c22cbc9..b88d41811b49 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -36,8 +36,7 @@ void do_trap_undefined_instruction(struct cpu_user_regs *regs)
>       uint32_t pc = regs->pc;
>       uint32_t instr;
>   
> -    if ( !is_kernel_text(pc) &&
> -         (system_state >= SYS_STATE_active || !is_kernel_inittext(pc)) )
> +    if ( !is_active_kernel_text(pc) )
>           goto die;
>   
>       /* PC should be always a multiple of 4, as Xen is using ARM instruction set */
--------------iSrqWeBpJmfK6BwSe1hJFII6
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
    <div class="moz-cite-prefix">On 2/11/25 1:54 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250211125445.451805-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">While fixing some common/arch boundaries for UBSAN support on other
architectures, the following debugging patch:

  diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
  index c1f2d1b89d43..58d1d048d339 100644
  --- a/xen/arch/arm/setup.c
  +++ b/xen/arch/arm/setup.c
  @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)

       system_state = SYS_STATE_active;

  +    dump_execution_state();
  +
       for_each_domain( d )
           domain_unpause_by_systemcontroller(d);

failed with:

  (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
  (XEN) CPU0: Unexpected Trap: Undefined Instruction
  (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
  (XEN) CPU:    0
  &lt;snip&gt;
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) CPU0: Unexpected Trap: Undefined Instruction
  (XEN) ****************************************

This is because the condition for init text is wrong.  While there's nothing
interesting from that point onwards in start_xen(), it's also wrong for
livepatches too.

Use is_active_kernel_text() which is the correct test for this purpose, and is
aware of init and livepatch regions as well as their lifetimes.

Fixes: 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: <span style="white-space: pre-wrap">Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</span></pre>
    <blockquote type="cite"
      cite="mid:20250211125445.451805-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

v2:
 * Split out change to dump_execution_state()

Sample run going wrong:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570105">https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570105</a>

Sample run with dump_execution_state() working:
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9079185111">https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9079185111</a>
---
 xen/arch/arm/arm32/traps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
index a2fc1c22cbc9..b88d41811b49 100644
--- a/xen/arch/arm/arm32/traps.c
+++ b/xen/arch/arm/arm32/traps.c
@@ -36,8 +36,7 @@ void do_trap_undefined_instruction(struct cpu_user_regs *regs)
     uint32_t pc = regs-&gt;pc;
     uint32_t instr;
 
-    if ( !is_kernel_text(pc) &amp;&amp;
-         (system_state &gt;= SYS_STATE_active || !is_kernel_inittext(pc)) )
+    if ( !is_active_kernel_text(pc) )
         goto die;
 
     /* PC should be always a multiple of 4, as Xen is using ARM instruction set */
</pre>
    </blockquote>
  </body>
</html>

--------------iSrqWeBpJmfK6BwSe1hJFII6--

