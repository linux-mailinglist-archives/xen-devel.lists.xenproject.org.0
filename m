Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51EA5FC9C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913109.1319256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslmv-0008KM-W2; Thu, 13 Mar 2025 16:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913109.1319256; Thu, 13 Mar 2025 16:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslmv-0008IO-T1; Thu, 13 Mar 2025 16:52:05 +0000
Received: by outflank-mailman (input) for mailman id 913109;
 Thu, 13 Mar 2025 16:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslds-0000Wn-Uq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:42:45 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d982e48-002a-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:42:41 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-224191d92e4so25669795ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:42:43 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371169c3desm1537504b3a.155.2025.03.13.09.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:42:41 -0700 (PDT)
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
X-Inumbo-ID: 2d982e48-002a-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741884162; x=1742488962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEeJf1jLjksxcxRMyFkwRUHHzj+nso1co+jY2XBogVQ=;
        b=PAGcD3QBwTpSz1d18aqAeBowNsSrTjlavQcZt9nYWUvswY9h/Y0cZm+cPSmmqs4CDV
         LYnBZsbf5fvI3opEqo6/gsoUeCzjQNNl4BimnM7lC36sdg6bacJUerz3k3NZDrox1wPM
         4kYZ7DXBPUmCOYdh0ZP7JnvPhxaxKZigt0AJn3z+MXtaJFBnhMQZ+CG4MwRTkwogziRT
         kdvr73nWQFlECKx5MzDP+SwylZmu3FsOY+25rsZP1D8JPlnK4lkM7KxqRgy6hu3+/PT2
         lv4jRwFX+Pj93XGPNdtScjFlBT0Sxya7QjC5OtMPDoRVhE/5sZq0dzO21v15KPtVO7+3
         tUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884162; x=1742488962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEeJf1jLjksxcxRMyFkwRUHHzj+nso1co+jY2XBogVQ=;
        b=cKxfdsrHWHlbOCoS4mrvCYM+PfO0lIZItbznOx+Ed4ZzVb2oTlmAtCSlS+WP/GQUgm
         y/MgRy1nBUEzoZ6y3JM/LXi6noxQj85X+d3skmqJkK90AVvR1FoLDezNcgnru8CK2Axj
         Mg8ye/0HlGDmRCoHuJi6eGcLh2hSL93og8Cd0KyiTHrr9IpNLCpO78aXQMoFDmdA/0FB
         i/jt5YVIeqxUE0E0Qm9eZneRl7F/DFDE4IZOidCxMcQRJ3k44E/kbMg1QehPNW3FYGGg
         RlUnZ02HeR0xuT/pUq+JUGZBFLDWvrpA2TQLxpC//yIXbuPrF+VPgi/yU3g5cdUSCKZG
         RW4w==
X-Forwarded-Encrypted: i=1; AJvYcCXnZ2KzwPtNKMePKCoR5kX5XQSSu3hYYN0kuOqVr1P1uvUlhDKbYXSJgnuYgetGkAKT6bpAI9ot+I0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN944OJLC9xLHySAPY59NBdIZR7CJMZzJ4l+HvTFKxML2yAVut
	SM9tsxEAl6BhWRKcjxrwY5dhXaa+DO6XapP5UBmfE7WQV71WVQVjHx0/lyV94zY=
X-Gm-Gg: ASbGncvvKV2HF2G9GezFni/Lpdjq/wJA9Q7pPp8vhLWC6OszvAZHoyXLPVQX496yuwN
	UHnqEZ6cdCAj8fgngVaOWXpdDfGvuiMeH8kEii+hPBHAYo6hkBEIm/RAN+DxeczFGLl2XVk1AIs
	NJbUx7Qx5vhM0TwfDD7Y5+zMBP7yscopYbxs5cMTU8gbNpTX5uSD8WLvGdvOJVpl3iSiRAiV32v
	WHWERO7axWzpuPGLlXg0N8a6ngR3s3W4/ZGwC7WC2SFKAuGFjdsZjk8Q5CdFGNr+EoYZda1Lwj8
	/hI7ZkWaTZa2zcXq7wDFB+n31Gg5sBkjY8SB7L0xqILuxhiEbgVJdMRAZg==
X-Google-Smtp-Source: AGHT+IEscFPBgwURkivERQ63uZlHCc12XioxFkzuW02QWXVxwQASklk7TdMNVKzsKRLZFS0yvJdJJg==
X-Received: by 2002:a05:6a00:1891:b0:736:a682:deb8 with SMTP id d2e1a72fcca58-7371f0d35cfmr310216b3a.8.1741884161761;
        Thu, 13 Mar 2025 09:42:41 -0700 (PDT)
Message-ID: <9cef5cb6-feea-4be7-ab08-e0b3a8caff9c@linaro.org>
Date: Thu, 13 Mar 2025 09:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] make system memory API available for common code
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

patch 12 (adding xen stubs, so would need someone from hw/xen) and 15 
are missing reviews.

Thanks,
Pierrick

On 3/13/25 09:38, Pierrick Bouvier wrote:
> The main goal of this series is to be able to call any memory ld/st function
> from code that is *not* target dependent. As a positive side effect, we can
> turn related system compilation units into common code.
> 
> The first 5 patches remove dependency of memory API to cpu headers and remove
> dependency to target specific code. This could be a series on its own, but it's
> great to be able to turn system memory compilation units into common code to
> make sure it can't regress, and prove it achieves the desired result.
> 
> The next patches remove more dependencies on cpu headers (exec-all,
> memory-internal, ram_addr).
> Then, we add access to a needed function from kvm, some xen stubs, and we
> finally can turn our compilation units into common code.
> 
> Every commit was tested to build correctly for all targets (on windows, linux,
> macos), and the series was fully tested by running all tests we have (linux,
> x86_64 host).
> 
> v2:
> - reorder first commits (tswap change first, so memory cached functions can use it)
> - move st/ld*_p functions to tswap instead of bswap
> - add define for target_words_bigendian when COMPILING_PER_TARGET, equals to
>    TARGET_BIG_ENDIAN (avoid overhead in target code)
> - rewrite devend_memop
> - remove useless exec-all.h in concerned patch
> - extract devend_big_endian function to reuse in system/memory.c
> - rewrite changes to system/memory.c
> 
> v3:
> - move devend functions to memory_internal.h
> - completed description for commits removing cpu.h dependency
> 
> v4:
> - rebase on top of master
>    * missing include in 'codebase: prepare to remove cpu.h from exec/exec-all.h'
>    * meson build conflict
> 
> Pierrick Bouvier (17):
>    exec/tswap: target code can use TARGET_BIG_ENDIAN instead of
>      target_words_bigendian()
>    exec/tswap: implement {ld,st}.*_p as functions instead of macros
>    exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
>    exec/memory_ldst_phys: extract memory_ldst_phys declarations from
>      cpu-all.h
>    exec/memory.h: make devend_memop "target defines" agnostic
>    codebase: prepare to remove cpu.h from exec/exec-all.h
>    exec/exec-all: remove dependency on cpu.h
>    exec/memory-internal: remove dependency on cpu.h
>    exec/ram_addr: remove dependency on cpu.h
>    system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for
>      common code
>    exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
>    hw/xen: add stubs for various functions
>    system/physmem: compilation unit is now common to all targets
>    include/exec/memory: extract devend_big_endian from devend_memop
>    include/exec/memory: move devend functions to memory-internal.h
>    system/memory: make compilation unit common
>    system/ioport: make compilation unit common
> 
>   include/exec/cpu-all.h              | 66 -----------------------
>   include/exec/exec-all.h             |  1 -
>   include/exec/memory-internal.h      | 21 +++++++-
>   include/exec/memory.h               | 30 ++++-------
>   include/exec/ram_addr.h             | 11 ++--
>   include/exec/tswap.h                | 81 +++++++++++++++++++++++++++--
>   include/system/kvm.h                |  6 +--
>   include/tcg/tcg-op.h                |  1 +
>   target/ppc/helper_regs.h            |  2 +
>   include/exec/memory_ldst.h.inc      |  4 --
>   include/exec/memory_ldst_phys.h.inc |  5 +-
>   cpu-target.c                        |  1 +
>   hw/ppc/spapr_nested.c               |  1 +
>   hw/sh4/sh7750.c                     |  1 +
>   hw/xen/xen_stubs.c                  | 56 ++++++++++++++++++++
>   page-vary-target.c                  |  2 +-
>   system/ioport.c                     |  1 -
>   system/memory.c                     | 17 ++----
>   target/ppc/tcg-excp_helper.c        |  1 +
>   target/riscv/bitmanip_helper.c      |  2 +-
>   hw/xen/meson.build                  |  3 ++
>   system/meson.build                  |  6 +--
>   22 files changed, 193 insertions(+), 126 deletions(-)
>   create mode 100644 hw/xen/xen_stubs.c
> 


