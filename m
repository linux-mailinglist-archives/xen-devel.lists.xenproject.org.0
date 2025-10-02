Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF8BB385D
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 11:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135642.1472682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4G0c-00043J-Dp; Thu, 02 Oct 2025 09:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135642.1472682; Thu, 02 Oct 2025 09:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4G0c-00040g-AG; Thu, 02 Oct 2025 09:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1135642;
 Thu, 02 Oct 2025 09:53:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wm6k=4L=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4G0a-00040a-Hi
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 09:53:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b54e6bfa-9f75-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 11:53:55 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso432183f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 02:53:55 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9762sm2894361f8f.38.2025.10.02.02.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 02:53:53 -0700 (PDT)
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
X-Inumbo-ID: b54e6bfa-9f75-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759398834; x=1760003634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZJjs6fAxeuAtL3rJXqYG4c1PTX4AGpZJ9DbJI++E5c=;
        b=m6Gv5bcTc6cpV1tVDPQICjeLdPMO//afYjMHakB+3U+PDbm3aawunVBptSQZrL00ds
         zowZz7sG7GhuuFLuwSr+vvuz2IawDqgfK8BhmMBgq8yvnrchND9/OivAMR3o3hWZESHZ
         lgzBUypNYQ2ePyfbJRcDe7t+asLesWTTdvUMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759398834; x=1760003634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZJjs6fAxeuAtL3rJXqYG4c1PTX4AGpZJ9DbJI++E5c=;
        b=ZuEJSVKRPaf3Sl78p2VNXFUdYiiwM9qm6w3EGOnM6osxyzBgzlNmnw4z4hwbq/hROO
         gPzD6doJrWEXQ/7ZoDQoPFN9tPHsgbuC7nfBY44gL4cxfLJVNUhoE3E+dzxVxw2R4dt6
         tjDwnkTNRTtQboeRAeAB1Mv2NFEAhI36w4m/9kgKNaG41uoRAj9XBK2WgnTgp66PsMFz
         V2U+ERecGeOtkfUfoAn8irDfIhCI0Gpptx/lCEwp9kJWtxhZx2heD/lTv2SZ8AUqR3Us
         iQuRK/rhGIHydMoTEyLkQn6sk9eu7X5VF/jJF+6x96l3ZT7ZRcVuUBK9AniO0LVW3aSu
         sE/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXItVgIGIM+A21UaGi26JrZqm4KSO0A1XA33rx6+NeLwByXd3pghFdl+9nY0LoU0yK+EP7rYTxXxIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4plETaBvLdoInAsvBEimmLyz+TFPQAlO/oMQIKdMRDRUfwVa1
	+qxMiYC1HuZnNjyvefGbhc561RUZULqQ99/D0XRLgC7uK9tm2Ujf6oh4BIUgwZdRrXE=
X-Gm-Gg: ASbGnctoeC8peDgC0knR+fts5ZoBPVAMtC7WcUp3jDBGo+4WHKyafpdP8TtTV/XRSDw
	cxEHjzThMOEdeF3h2mfFxDEU42ZkKBjgLZhahFKXRiMwhBBIMbSBKsOkBJzp8PFGWGlNJPJlKK2
	viE/keNtlQ/OIZq/WVkynHGD1yaovObszgtzxvOq/93SWQg57ydf4Ylg/Snol3rNp8Ye9aVINyN
	DURrvE7YTFMK3EursnGRBQ7LtXCdNi65mkAmBYCE/E/cHngM+RvmG/6PskNQF84CIOJxaZQRk2D
	P1nyhqPmFW5ROPD/3S0+3PkvYFwxn9RE76rqQvDYZj4noSNjJDfxnLFAHtIilqWDruQwSXy7s5d
	9oxbmGZQFdtCksYe7gkGmG+Q/z6IF6qPbX/+W0ef8uOWaoBXRhZPG/j9s8Y39fI7bOsOPDEQZj7
	NGy1U4Q9CqCzbgzVdA5UmrslWmwxoyGThT1A==
X-Google-Smtp-Source: AGHT+IEIorgxc++YloOBsMTad5CHY1DvBC5lrmjrCyPg1mltGdSkdYJ9fXtBDuRtY9mzo0ryVApLkw==
X-Received: by 2002:a05:6000:2901:b0:3ec:d740:a71b with SMTP id ffacd0b85a97d-4255780c039mr4580116f8f.31.1759398834466;
        Thu, 02 Oct 2025 02:53:54 -0700 (PDT)
Message-ID: <2c1c305b-a7c2-4da5-be96-3895e284032b@citrix.com>
Date: Thu, 2 Oct 2025 10:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Support LLVM raw profile versions 8, 9, and 10
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
 <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/10/2025 11:09 pm, Saman Dehghan wrote:
> This change enables compatibility for measuring code coverage
> with Clang versions 14 through 20 by supporting their
> respective raw profile formats.
>
> 1- Add support for LLVM raw profile versions 8, 9, and 10
> 2- Initialized llvm_profile_header for all versions based on llvm source code in 
>    `compiler-rt/include/profile/InstrProfData.inc` for each version.
> 3- We tested this patch for all clang versions from 14 through 20 on both ARM and X86 platform
>
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>

CC-ing Oleksii.  This should be considered for 4.21 at this point.

Coverage is an optional feature, off-by-default, but Xen does support
GCC and Clang (older Clang at least), and right now newer Clang simply
malfunctions.

I guess I should update
https://xenbits.xen.org/docs/latest/hypervisor-guide/code-coverage.html
given the new toolchain baselines.

> ---
>  xen/common/coverage/llvm.c | 78 +++++++++++++++++++++++++++-----------
>  xen/include/xen/types.h    |  1 +
>  2 files changed, 57 insertions(+), 22 deletions(-)
>
> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> index 517b2aa8c2..f92f10654c 100644
> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -44,27 +44,55 @@
>      ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
>  #endif
>  
> -#define LLVM_PROFILE_VERSION    4
> +#if __clang_major__ >= 19
> +#define LLVM_PROFILE_VERSION    10
> +#define LLVM_PROFILE_NUM_KINDS  3
> +#elif __clang_major__ == 18
> +#define LLVM_PROFILE_VERSION    9
>  #define LLVM_PROFILE_NUM_KINDS  2
> +#elif __clang_major__ >= 14
> +#define LLVM_PROFILE_VERSION    8
> +#define LLVM_PROFILE_NUM_KINDS  2
> +#else
> +#error "Unsupported Clang version"
> +#endif

Does this exclude Clang 13?

Our baseline is 11 or later.  How hard would it be to support those too?

>  
>  struct llvm_profile_data {
>      uint64_t name_ref;
>      uint64_t function_hash;
> -    void *counter;
> -    void *function;
> -    void *values;
> +    intptr_t *relative_counter;
> +#if __clang_major__ >= 18
> +    intptr_t *relative_bitmap;
> +#endif
> +    intptr_t *function;
> +    intptr_t *values;
>      uint32_t nr_counters;
>      uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
> +#if __clang_major__ >= 18
> +    uint32_t numbitmap_bytes;
> +#endif
>  };
>  
>  struct llvm_profile_header {
>      uint64_t magic;
>      uint64_t version;
> -    uint64_t data_size;
> -    uint64_t counters_size;
> +    uint64_t binary_ids_size;
> +    uint64_t num_data;
> +    uint64_t padding_bytes_before_counters;
> +    uint64_t num_counters;
> +    uint64_t padding_bytes_after_counters;
> +    uint64_t num_bitmap_bytes;
> +    uint64_t padding_bytes_after_bitmap_bytes;
>      uint64_t names_size;
> +#if __clang_major__ >= 18
>      uint64_t counters_delta;
> +    uint64_t bitmap_delta;
> +#endif
>      uint64_t names_delta;
> +#if __clang_major__ >= 19
> +    uint64_t num_vtables;
> +    uint64_t vnames_size;
> +#endif
>      uint64_t value_kind_last;
>  };
>  
> @@ -76,19 +104,20 @@ struct llvm_profile_header {
>   */
>  int __llvm_profile_runtime;
>  
> -extern const struct llvm_profile_data __start___llvm_prf_data[];
> -extern const struct llvm_profile_data __stop___llvm_prf_data[];
> -extern const char __start___llvm_prf_names[];
> -extern const char __stop___llvm_prf_names[];
> -extern uint64_t __start___llvm_prf_cnts[];
> -extern uint64_t __stop___llvm_prf_cnts[];
> +extern char __start___llvm_prf_data[];
> +extern char __stop___llvm_prf_data[];
> +extern char __start___llvm_prf_names[];
> +extern char __stop___llvm_prf_names[];
> +extern char __start___llvm_prf_cnts[];
> +extern char __stop___llvm_prf_cnts[];
> +
> +#define START_DATA      ((const char *)__start___llvm_prf_data)
> +#define END_DATA        ((const char *)__stop___llvm_prf_data)
> +#define START_NAMES     ((const char *)__start___llvm_prf_names)
> +#define END_NAMES       ((const char *)__stop___llvm_prf_names)
> +#define START_COUNTERS  ((char *)__start___llvm_prf_cnts)
> +#define END_COUNTERS    ((char *)__stop___llvm_prf_cnts)
>  
> -#define START_DATA      ((const void *)__start___llvm_prf_data)
> -#define END_DATA        ((const void *)__stop___llvm_prf_data)
> -#define START_NAMES     ((const void *)__start___llvm_prf_names)
> -#define END_NAMES       ((const void *)__stop___llvm_prf_names)
> -#define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
> -#define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)

Why change these from char to void ?

>  
>  static void cf_check reset_counters(void)
>  {
> @@ -107,10 +136,15 @@ static int cf_check dump(
>      struct llvm_profile_header header = {
>          .magic = LLVM_PROFILE_MAGIC,
>          .version = LLVM_PROFILE_VERSION,
> -        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
> -        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
> -        .names_size = END_NAMES - START_NAMES,
> -        .counters_delta = (uintptr_t)START_COUNTERS,
> +        .binary_ids_size = 0,
> +        .num_data = (((intptr_t)END_DATA + sizeof(struct llvm_profile_data) - 1)
> +                - (intptr_t)START_DATA) / sizeof(struct llvm_profile_data),

I can see why we might want to round-down END, but this doesn't need
casting to intptr_t irrespective of char vs void.

> +        .padding_bytes_before_counters = 0,
> +        .num_counters = (((intptr_t)END_COUNTERS + sizeof(uint64_t) - 1)
> +                - (intptr_t)START_COUNTERS) / sizeof(uint64_t),
> +        .padding_bytes_after_counters = 0,
> +        .names_size = (END_NAMES - START_NAMES) * sizeof(char),

sizeof(char) is by definition 1.

> +        .counters_delta = (uintptr_t)START_COUNTERS - (uintptr_t)START_DATA,
>          .names_delta = (uintptr_t)START_NAMES,
>          .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
>      };
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 73ddccbbd5..799bfe0b95 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -18,6 +18,7 @@ typedef signed long ssize_t;
>  
>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>  typedef __UINTPTR_TYPE__ uintptr_t;
> +typedef __INTPTR_TYPE__ intptr_t;
>  
>  /*
>   * Users of this macro are expected to pass a positive value.


