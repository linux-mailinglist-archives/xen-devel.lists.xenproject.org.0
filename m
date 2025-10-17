Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D990CBE8D3D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 15:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145190.1478303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9kRo-0000Zv-O3; Fri, 17 Oct 2025 13:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145190.1478303; Fri, 17 Oct 2025 13:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9kRo-0000XM-LH; Fri, 17 Oct 2025 13:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1145190;
 Fri, 17 Oct 2025 13:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vay5=42=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v9kRm-0000XG-Qr
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 13:24:42 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3622f4f-ab5c-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 15:24:41 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-634a3327ff7so3613262a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 06:24:41 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb965d7d8sm826044766b.18.2025.10.17.06.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 06:24:40 -0700 (PDT)
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
X-Inumbo-ID: a3622f4f-ab5c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760707481; x=1761312281; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2zcZjyQUhkAxzl5BhQ8Wm5EqbJdanVG18YFXfLDoRs=;
        b=egQIca1TQCF2omOlQGfmq3HTQ1Z19pn6aG1vl7diFreyRB+St3sNvJ9861fdjvNOtV
         YwtEjOmfBNFd5FCZ4+oH/k0oRSH9ZxT49BDrKu3CCGK1RFfacmXXpBsYGojC5cECH56E
         CnzmOXQbP6tnZ3QYmaI3nAbfj+Y1lcRe3MtLZ78RYfJX0u9NhYYtE61dHMYb7GxYbN40
         FRimhZIVD8b4Qc57RoYD3Na8FsnSglptJk0NlXZGThPzUeXRKBzTKGhsmRUznIPU8DdM
         ar4t5gICkuqGY02jViBTY5trJ9cpJsz0FW7QX6sxsndrVUr1FGBgiIy4h4Gg/cg6ZcvZ
         /Skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707481; x=1761312281;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a2zcZjyQUhkAxzl5BhQ8Wm5EqbJdanVG18YFXfLDoRs=;
        b=XI502P+9WzX6qmMKkOOUqdmnCDDC9PF1XWPzFTFkkzUJAoURSIJTi45KVuU+ZyJErQ
         npO86Axvxhwds4OopeOEpEDNxr1lKR1M+MAnwmlH/eCx1O0nKeZpL+jlxcBgd5fwMEuC
         rqy6GFLTMudLd9WuBA1EbJV1p8EGJsD9+IFGJ6Ji7mgxhnqZFZkjprTXhPElr7AaqKjT
         TSY+c1+P/U1vFt3+4Pf/WkdN7ufd7iGlLFbp0+gO4P615Jn41w9zdvqYEKcP4b00s9Rc
         K4MlTpxBARmoTnjYW8v0m8LHL8J3y0OKj1+Rkb5+NQ6CK4RYrgqC7FKyYEkTJoQG1KJi
         g7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUSUoBhhblTeQerZTXRZ9NYBFCh4ZZ5DUmjlvC2Iubo+6gsnzRXdybSLR+NgN0rrL9MDbSa7twoImQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQZ9VtVWaZuZaVOCGjq6Rf1xP0+L6bK+8EBoTdxjWR71Kqw+RG
	RdExZ178+TeeWGjjdFsZ1HmneW1PbyWfz+hqge4Xq+y8x34K5R8Gp4uc
X-Gm-Gg: ASbGncv5daLhfdEeOUBE0Av+MlYnFVvcPn5IZYC00QTLN2DJR0pABya/JNkzqXJAOGU
	Ey5+17u+I3GsHRpBizDtRICt2jC/PethWXf0lJH227vwUevT5nlNJE8DIEjbvF0WHgOSe4QzbAX
	E+luJiKUuH+GPca6eqFt09OLuBiZXPSCo+Z5xZQ2ki7ZtwsXLwaaj8tj/yL1c/vlHeyV9w5u0pg
	b8N0tMVaUJ2FtygtIHQ/Wqo5631d1LIhoCkazBvSVC4iIBpY7Rh2uJKADEsbPnZA05enyA3hhNn
	ffPX9ayI/LkhKOAstItPRQo9PlTCV7pYj3abtunehWgZQpd6/bW3b9ahijPdaQY92M9iavf19LA
	6mz+2JifxLD4q2j1lj8rNVMaIOHFi2pkxGhutVYOK+QwPt1JK1JQp7uFvJ/vJon2RlyIucGqHuw
	0VzeptEn4NFF9mQS1dhLPXpndyVOMdQGUhdM3AQd2Fu4N3MSszJDbPgtl+SsQa+jmQNJM=
X-Google-Smtp-Source: AGHT+IF44VPIo9f2fNuffFyZDCvz6pw1pWwenGxkCKZJGxMcrxPrvNxeOlG+qwSojm+gc2JrkFdHqQ==
X-Received: by 2002:a17:906:a44d:b0:b65:8f09:ee35 with SMTP id a640c23a62f3a-b658f193194mr86098266b.44.1760707480650;
        Fri, 17 Oct 2025 06:24:40 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6NelGKQmckhJ4Hy25AWljPV0"
Message-ID: <33a9716e-d721-48c7-b8a0-6fe9d44e31d6@gmail.com>
Date: Fri, 17 Oct 2025 15:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.21 00/22] x86: FRED support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------6NelGKQmckhJ4Hy25AWljPV0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/4/25 12:53 AM, Andrew Cooper wrote:
> This is the combined MSR cleanup and FRED series.  Some patches of both v2's
> have already been committed.
>
> I have moved the MSR_IMM patch out.  It's not strictly needed for FRED, and
> really needs to go behind Jan's patch to use mergable sections for
> altinstructions which is definitely not making 4.21 at this point.
>
> I almost got access to a piece of real hardware in time, but that fell through
> at the last minute.
>
> In terms of timing, I know we're getting very tight for 4.21, but there has
> been an awful lot of disruption with travel and holidays recently.  Half the
> patches are already acked/reviewed, but can't easily go in due to logical
> dependencies (I suspect patches 15-17 could be committed right away as they're
> pretty independent.)
>
> Therefore I'd like to ask Oleksii whether the nominal release ack still
> stands.

If you're asking about patch 15-17, then it could be still merged now:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

>
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2079705485

Btw, is it expected that some tests failed?

Thanks.

~ Oleksii

>
> Andrew Cooper (22):
>    x86/msr: Change rdmsr() to have normal API
>    x86/msr: Change wrmsr() to take a single parameter
>    x86/fsgsbase: Split out __{rd,wr}gs_shadow() helpers
>    x86/fsgsbase: Update fs/gs helpers to use wrmsrns()
>    x86/fsgsbase: Improve code generation in read_registers()
>    x86/boot: Use RSTORSSP to establish SSP
>    x86/traps: Alter switch_stack_and_jump() for FRED mode
>    x86/traps: Skip Supervisor Shadow Stack tokens in FRED mode
>    x86/traps: Make an IDT-specific #DB helper
>    x86/traps: Make an IDT-specific #PF helper
>    x86/fsgsbase: Make gskern accesses safe under FRED
>    x86/traps: Introduce FRED entrypoints
>    x86/traps: Enable FRED when requested
>    x86/pv: Deduplicate is_canonical_address() in do_set_segment_base()
>    x86/entry: Alter how IRET faults are recognised
>    x86/entry: Drop the pre exception table infrastructure
>    x86/entry: Rework the comment about SYSCALL and DF
>    x86/pv: Adjust GS handling for FRED mode
>    x86/pv: Guest exception handling in FRED mode
>    x86/pv: ERETU error handling
>    x86/pv: System call handling in FRED mode
>    x86: Clamp reserved bits in eflags more aggressively
>
>   xen/arch/x86/acpi/cpufreq/powernow.c    |  12 +-
>   xen/arch/x86/boot/x86_64.S              |  23 +-
>   xen/arch/x86/cpu/amd.c                  |   8 +-
>   xen/arch/x86/cpu/common.c               |  20 +-
>   xen/arch/x86/cpu/intel.c                |  30 +-
>   xen/arch/x86/domain.c                   |  34 +-
>   xen/arch/x86/extable.c                  |  14 -
>   xen/arch/x86/genapic/x2apic.c           |   5 +-
>   xen/arch/x86/hvm/domain.c               |   4 +-
>   xen/arch/x86/hvm/vmx/vmcs.c             |  32 +-
>   xen/arch/x86/hvm/vmx/vmx.c              |   4 +-
>   xen/arch/x86/include/asm/asm_defns.h    |  76 +++-
>   xen/arch/x86/include/asm/current.h      |   9 +-
>   xen/arch/x86/include/asm/domain.h       |   2 +
>   xen/arch/x86/include/asm/fsgsbase.h     |  66 +--
>   xen/arch/x86/include/asm/hypercall.h    |   2 -
>   xen/arch/x86/include/asm/msr.h          |  48 ++-
>   xen/arch/x86/include/asm/prot-key.h     |   6 +-
>   xen/arch/x86/include/asm/traps.h        |   2 +
>   xen/arch/x86/include/asm/uaccess.h      |   2 -
>   xen/arch/x86/include/asm/x86-defns.h    |   7 +
>   xen/arch/x86/mm.c                       |  12 +-
>   xen/arch/x86/nmi.c                      |  18 +-
>   xen/arch/x86/oprofile/op_model_athlon.c |   2 +-
>   xen/arch/x86/pv/dom0_build.c            |   2 +-
>   xen/arch/x86/pv/domain.c                |  22 +-
>   xen/arch/x86/pv/iret.c                  |   8 +-
>   xen/arch/x86/pv/misc-hypercalls.c       |  42 +-
>   xen/arch/x86/pv/traps.c                 |  39 ++
>   xen/arch/x86/setup.c                    |  33 +-
>   xen/arch/x86/traps-setup.c              |  83 +++-
>   xen/arch/x86/traps.c                    | 519 ++++++++++++++++++++++--
>   xen/arch/x86/tsx.c                      |  27 +-
>   xen/arch/x86/x86_64/Makefile            |   1 +
>   xen/arch/x86/x86_64/compat/entry.S      |   3 +-
>   xen/arch/x86/x86_64/entry-fred.S        |  57 +++
>   xen/arch/x86/x86_64/entry.S             |  46 ++-
>   xen/arch/x86/xen.lds.S                  |   5 -
>   38 files changed, 1076 insertions(+), 249 deletions(-)
>   create mode 100644 xen/arch/x86/x86_64/entry-fred.S
>
--------------6NelGKQmckhJ4Hy25AWljPV0
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
    <div class="moz-cite-prefix">On 10/4/25 12:53 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251003225334.2123667-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">This is the combined MSR cleanup and FRED series.  Some patches of both v2's
have already been committed.

I have moved the MSR_IMM patch out.  It's not strictly needed for FRED, and
really needs to go behind Jan's patch to use mergable sections for
altinstructions which is definitely not making 4.21 at this point.

I almost got access to a piece of real hardware in time, but that fell through
at the last minute.

In terms of timing, I know we're getting very tight for 4.21, but there has
been an awful lot of disruption with travel and holidays recently.  Half the
patches are already acked/reviewed, but can't easily go in due to logical
dependencies (I suspect patches 15-17 could be committed right away as they're
pretty independent.)

Therefore I'd like to ask Oleksii whether the nominal release ack still
stands.</pre>
    </blockquote>
    <pre>If you're asking about patch 15-17, then it could be still merged now:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

</pre>
    <blockquote type="cite"
      cite="mid:20251003225334.2123667-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2079705485">https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2079705485</a></pre>
    </blockquote>
    <pre>Btw, is it expected that some tests failed?

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251003225334.2123667-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Andrew Cooper (22):
  x86/msr: Change rdmsr() to have normal API
  x86/msr: Change wrmsr() to take a single parameter
  x86/fsgsbase: Split out __{rd,wr}gs_shadow() helpers
  x86/fsgsbase: Update fs/gs helpers to use wrmsrns()
  x86/fsgsbase: Improve code generation in read_registers()
  x86/boot: Use RSTORSSP to establish SSP
  x86/traps: Alter switch_stack_and_jump() for FRED mode
  x86/traps: Skip Supervisor Shadow Stack tokens in FRED mode
  x86/traps: Make an IDT-specific #DB helper
  x86/traps: Make an IDT-specific #PF helper
  x86/fsgsbase: Make gskern accesses safe under FRED
  x86/traps: Introduce FRED entrypoints
  x86/traps: Enable FRED when requested
  x86/pv: Deduplicate is_canonical_address() in do_set_segment_base()
  x86/entry: Alter how IRET faults are recognised
  x86/entry: Drop the pre exception table infrastructure
  x86/entry: Rework the comment about SYSCALL and DF
  x86/pv: Adjust GS handling for FRED mode
  x86/pv: Guest exception handling in FRED mode
  x86/pv: ERETU error handling
  x86/pv: System call handling in FRED mode
  x86: Clamp reserved bits in eflags more aggressively

 xen/arch/x86/acpi/cpufreq/powernow.c    |  12 +-
 xen/arch/x86/boot/x86_64.S              |  23 +-
 xen/arch/x86/cpu/amd.c                  |   8 +-
 xen/arch/x86/cpu/common.c               |  20 +-
 xen/arch/x86/cpu/intel.c                |  30 +-
 xen/arch/x86/domain.c                   |  34 +-
 xen/arch/x86/extable.c                  |  14 -
 xen/arch/x86/genapic/x2apic.c           |   5 +-
 xen/arch/x86/hvm/domain.c               |   4 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |  32 +-
 xen/arch/x86/hvm/vmx/vmx.c              |   4 +-
 xen/arch/x86/include/asm/asm_defns.h    |  76 +++-
 xen/arch/x86/include/asm/current.h      |   9 +-
 xen/arch/x86/include/asm/domain.h       |   2 +
 xen/arch/x86/include/asm/fsgsbase.h     |  66 +--
 xen/arch/x86/include/asm/hypercall.h    |   2 -
 xen/arch/x86/include/asm/msr.h          |  48 ++-
 xen/arch/x86/include/asm/prot-key.h     |   6 +-
 xen/arch/x86/include/asm/traps.h        |   2 +
 xen/arch/x86/include/asm/uaccess.h      |   2 -
 xen/arch/x86/include/asm/x86-defns.h    |   7 +
 xen/arch/x86/mm.c                       |  12 +-
 xen/arch/x86/nmi.c                      |  18 +-
 xen/arch/x86/oprofile/op_model_athlon.c |   2 +-
 xen/arch/x86/pv/dom0_build.c            |   2 +-
 xen/arch/x86/pv/domain.c                |  22 +-
 xen/arch/x86/pv/iret.c                  |   8 +-
 xen/arch/x86/pv/misc-hypercalls.c       |  42 +-
 xen/arch/x86/pv/traps.c                 |  39 ++
 xen/arch/x86/setup.c                    |  33 +-
 xen/arch/x86/traps-setup.c              |  83 +++-
 xen/arch/x86/traps.c                    | 519 ++++++++++++++++++++++--
 xen/arch/x86/tsx.c                      |  27 +-
 xen/arch/x86/x86_64/Makefile            |   1 +
 xen/arch/x86/x86_64/compat/entry.S      |   3 +-
 xen/arch/x86/x86_64/entry-fred.S        |  57 +++
 xen/arch/x86/x86_64/entry.S             |  46 ++-
 xen/arch/x86/xen.lds.S                  |   5 -
 38 files changed, 1076 insertions(+), 249 deletions(-)
 create mode 100644 xen/arch/x86/x86_64/entry-fred.S

</pre>
    </blockquote>
  </body>
</html>

--------------6NelGKQmckhJ4Hy25AWljPV0--

