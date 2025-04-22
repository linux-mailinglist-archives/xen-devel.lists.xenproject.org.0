Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C9A969E3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 14:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962591.1353771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7CoU-0004Zq-QU; Tue, 22 Apr 2025 12:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962591.1353771; Tue, 22 Apr 2025 12:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7CoU-0004Xx-Ne; Tue, 22 Apr 2025 12:33:22 +0000
Received: by outflank-mailman (input) for mailman id 962591;
 Tue, 22 Apr 2025 12:33:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bndg=XI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1u7CoS-0004Xr-Sn
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 12:33:21 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87bac19-1f75-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 14:33:19 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3f6ab1b8fc1so3186999b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 05:33:19 -0700 (PDT)
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
X-Inumbo-ID: f87bac19-1f75-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1745325198; x=1745929998; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTvFDScCjV+mbpJI+xtXSigey/L5KQSx13qWlYT4oZY=;
        b=hLZovLjtZfTcfGzGJShSsr5Vj4l6NBSqC0riJvKHXzjcc96mF3dcAcw2mdyOBEd9YA
         clwwUlm7ySWThRUNQzDAoBdajriUfarf3JeFdqwIBqy2QPqGzpXkt5qbu32ciFaLCtW1
         dv/2MxK6Fz0HgDnh/3M4T5KYS8aHduiMBW2AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325198; x=1745929998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTvFDScCjV+mbpJI+xtXSigey/L5KQSx13qWlYT4oZY=;
        b=u7fvsc2U80617a5TymMVk74Lanc4Iji/y4CeA0bMLOTNfpP6uph64O3SbnB2jVUPXX
         6OsBCHwgKUpUzoEiXs92ZtCzRMt5KR9iuwLFYP5pvsm5OtxbgxZY67EEBsWygC0A98Y6
         ejApeLNDfFVwqm2qfAfDCJC/OguOuaBmD80HWBvZw8yn4G/0MevPyjdelf3NwuzrNRbW
         HmO8Ns/ZHscROHa7ImBXK1eSfWY86NhfzFOwoj/Oe1jjFMS11N+PWI6jP9NPzd9ecbwL
         JGDcHcD/CkORWxNaim4OPdSNDt5E6FX4Rc4FXJ2Q2dDnL2ddnymoImNuYykFnVsaOXDW
         8MDQ==
X-Gm-Message-State: AOJu0YyvK5uLlvvo3cjM8mpx91fxf24qcxg05i0DloSeMPwUXu4Hqt2n
	Xhm10by4+woXfSXwFharvP2XNGM29eEdzW3/c++FpVnF7CB8Fi8bnKBAf3HEZDIHUuUFw6bgpZi
	Ii5+0qDCfTDcOihCJLCWWddpRrsPzjYZnViQpWw==
X-Gm-Gg: ASbGncujnxCCUEZu4rwUmB8Gqd2xwWQ0iM56Uat2v8oHLXoeQgqZnWOCx6o0c9uOyhB
	8GPxFC3qV3yE/bXEiqzminN8/lrCpJdFz0v78IjQIhkblRIvkxCEHT51sqOU08l7GLRvp06Qkia
	Oa4+MYDUfp71uLkNtTnCPIoA==
X-Google-Smtp-Source: AGHT+IE6VOzA5MJbsyszsFSlfN4hLGUcbYbcUKIkXpnzLVRJxv1/gnebcUqvnT7vlnc4117Aoua8LmbxPtYAJ7vCXAw=
X-Received: by 2002:a05:6808:8107:b0:3fa:cf11:1493 with SMTP id
 5614622812f47-401c091fedamr8356149b6e.1.1745325198285; Tue, 22 Apr 2025
 05:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250422113957.1289290-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250422113957.1289290-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 22 Apr 2025 13:33:07 +0100
X-Gm-Features: ATxdqUGaJ0cqhdVuWi62ZpCctcRNVb2HCdIIz9HjyVGUcl4yHJFLiuftyqx6dSs
Message-ID: <CACHz=ZgJWAOFFBeKr81byA-H+rvqEDmHtUMTyon6vOTPt7UjOg@mail.gmail.com>
Subject: Re: [PATCH] xen: Use asm inline when available for alternatives
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 12:40=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> Compilers estimate the size of an asm() block for inlining purposes.
>
> Constructs such as ALTERNATIVE appear large due to the metadata, depsite =
often
> only being a handful of instructions.  asm inline() overrides the estimat=
ion
> to identify the block as being small.
>
> This has a substantial impact on inlining decisions, expected to be for t=
he
> better given that the compiler has a more accurate picture to work with.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/Kconfig                               |  4 +++
>  xen/arch/arm/include/asm/alternative.h    |  4 +--
>  xen/arch/arm/include/asm/arm64/flushtlb.h |  4 +--
>  xen/arch/arm/include/asm/arm64/io.h       | 43 ++++++++++++++---------
>  xen/arch/arm/include/asm/cpuerrata.h      |  8 ++---
>  xen/arch/arm/include/asm/cpufeature.h     |  8 ++---
>  xen/arch/arm/include/asm/page.h           | 12 ++++---
>  xen/arch/arm/include/asm/processor.h      |  7 ++--
>  xen/arch/arm/include/asm/sysregs.h        | 10 +++---
>  xen/arch/arm/mmu/p2m.c                    |  3 +-
>  xen/arch/x86/include/asm/alternative.h    | 36 ++++++++++---------
>  xen/include/xen/compiler.h                | 14 ++++++++
>  12 files changed, 95 insertions(+), 58 deletions(-)
>
> diff --git a/xen/Kconfig b/xen/Kconfig
> index ae1c401a981e..ab4ab42ae987 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -29,6 +29,10 @@ config LD_IS_GNU
>  config LD_IS_LLVM
>         def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
>
> +config CC_HAS_ASM_INLINE
> +       # GCC >=3D 9, Clang >=3D 11
> +       def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $=
(CC) -x c - -c -o /dev/null)
> +

Why not check for "asm __inline" instead of "asm inline" ? The
asm_inline macro below uses "asm __inline".
They are mainly synonyms but it would look more coherent.

>  # Use -f{function,data}-sections compiler parameters
>  config CC_SPLIT_SECTIONS
>         bool
> diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/includ=
e/asm/alternative.h
> index 22477d9497a3..1563f03a0f5a 100644
> --- a/xen/arch/arm/include/asm/alternative.h
> +++ b/xen/arch/arm/include/asm/alternative.h
> @@ -209,9 +209,9 @@ alternative_endif
>  #endif  /*  __ASSEMBLY__  */
>
>  /*
> - * Usage: asm(ALTERNATIVE(oldinstr, newinstr, feature));
> + * Usage: asm_inline (ALTERNATIVE(oldinstr, newinstr, feature));
>   *
> - * Usage: asm(ALTERNATIVE(oldinstr, newinstr, feature, CONFIG_FOO));
> + * Usage: asm_inline (ALTERNATIVE(oldinstr, newinstr, feature, CONFIG_FO=
O));
>   * N.B. If CONFIG_FOO is specified, but not selected, the whole block
>   *      will be omitted, including oldinstr.
>   */
> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/inc=
lude/asm/arm64/flushtlb.h
> index 45642201d147..3b99c11b50d1 100644
> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
> @@ -31,7 +31,7 @@
>  #define TLB_HELPER(name, tlbop, sh)              \
>  static inline void name(void)                    \
>  {                                                \
> -    asm volatile(                                \
> +    asm_inline volatile (                        \
>          "dsb  "  # sh  "st;"                     \
>          "tlbi "  # tlbop  ";"                    \
>          ALTERNATIVE(                             \
> @@ -55,7 +55,7 @@ static inline void name(void)                    \
>  #define TLB_HELPER_VA(name, tlbop)               \
>  static inline void name(vaddr_t va)              \
>  {                                                \
> -    asm volatile(                                \
> +    asm_inline volatile (                        \
>          "tlbi "  # tlbop  ", %0;"                \
>          ALTERNATIVE(                             \
>              "nop; nop;",                         \
> diff --git a/xen/arch/arm/include/asm/arm64/io.h b/xen/arch/arm/include/a=
sm/arm64/io.h
> index 7d5959877759..ac90b729c44d 100644
> --- a/xen/arch/arm/include/asm/arm64/io.h
> +++ b/xen/arch/arm/include/asm/arm64/io.h
> @@ -51,40 +51,51 @@ static inline void __raw_writeq(u64 val, volatile voi=
d __iomem *addr)
>  static inline u8 __raw_readb(const volatile void __iomem *addr)
>  {
>          u8 val;
> -        asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
> -                                 "ldarb %w0, [%1]",
> -                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> -                     : "=3Dr" (val) : "r" (addr));
> +
> +        asm_inline volatile (
> +            ALTERNATIVE("ldrb %w0, [%1]",
> +                        "ldarb %w0, [%1]",
> +                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> +            : "=3Dr" (val) : "r" (addr) );
> +
>          return val;
>  }
>
>  static inline u16 __raw_readw(const volatile void __iomem *addr)
>  {
>          u16 val;
> -        asm volatile(ALTERNATIVE("ldrh %w0, [%1]",
> -                                 "ldarh %w0, [%1]",
> -                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> -                     : "=3Dr" (val) : "r" (addr));
> +        asm_inline volatile (
> +            ALTERNATIVE("ldrh %w0, [%1]",
> +                        "ldarh %w0, [%1]",
> +                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> +            : "=3Dr" (val) : "r" (addr) );
> +
>          return val;
>  }
>
>  static inline u32 __raw_readl(const volatile void __iomem *addr)
>  {
>          u32 val;
> -        asm volatile(ALTERNATIVE("ldr %w0, [%1]",
> -                                 "ldar %w0, [%1]",
> -                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> -                     : "=3Dr" (val) : "r" (addr));
> +
> +        asm_inline volatile (
> +            ALTERNATIVE("ldr %w0, [%1]",
> +                        "ldar %w0, [%1]",
> +                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> +            : "=3Dr" (val) : "r" (addr) );
> +
>          return val;
>  }
>
>  static inline u64 __raw_readq(const volatile void __iomem *addr)
>  {
>          u64 val;
> -        asm volatile(ALTERNATIVE("ldr %0, [%1]",
> -                                 "ldar %0, [%1]",
> -                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> -                     : "=3Dr" (val) : "r" (addr));
> +
> +        asm_inline volatile (
> +            ALTERNATIVE("ldr %0, [%1]",
> +                        "ldar %0, [%1]",
> +                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
> +            : "=3Dr" (val) : "r" (addr) );
> +
>          return val;
>  }
>
> diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/=
asm/cpuerrata.h
> index 8d7e7b9375bd..1799a16d7e7f 100644
> --- a/xen/arch/arm/include/asm/cpuerrata.h
> +++ b/xen/arch/arm/include/asm/cpuerrata.h
> @@ -16,10 +16,10 @@ static inline bool check_workaround_##erratum(void)  =
           \
>      {                                                           \
>          register_t ret;                                         \
>                                                                  \
> -        asm volatile (ALTERNATIVE("mov %0, #0",                 \
> -                                  "mov %0, #1",                 \
> -                                  feature)                      \
> -                      : "=3Dr" (ret));                            \
> +        asm_inline volatile (                                   \
> +            ALTERNATIVE("mov %0, #0",                           \
> +                        "mov %0, #1", feature)                  \
> +            : "=3Dr" (ret) );                                     \
>                                                                  \
>          return unlikely(ret);                                   \
>      }                                                           \
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include=
/asm/cpufeature.h
> index 50297e53d90e..b6df18801166 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -102,10 +102,10 @@ static inline bool cpus_have_cap(unsigned int num)
>  #define cpus_have_const_cap(num) ({                 \
>          register_t __ret;                           \
>                                                      \
> -        asm volatile (ALTERNATIVE("mov %0, #0",     \
> -                                  "mov %0, #1",     \
> -                                  num)              \
> -                      : "=3Dr" (__ret));              \
> +        asm_inline volatile (                       \
> +            ALTERNATIVE("mov %0, #0",               \
> +                        "mov %0, #1", num)          \
> +            : "=3Dr" (__ret) );                       \
>                                                      \
>          unlikely(__ret);                            \
>          })
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/p=
age.h
> index 69f817d1e68a..27bc96b9f401 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -176,7 +176,8 @@ static inline int invalidate_dcache_va_range(const vo=
id *p, unsigned long size)
>      {
>          size -=3D dcache_line_bytes - ((uintptr_t)p & cacheline_mask);
>          p =3D (void *)((uintptr_t)p & ~cacheline_mask);
> -        asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p));
> +        asm_inline volatile (
> +            __clean_and_invalidate_dcache_one(0) :: "r" (p) );
>          p +=3D dcache_line_bytes;
>      }
>
> @@ -185,7 +186,8 @@ static inline int invalidate_dcache_va_range(const vo=
id *p, unsigned long size)
>          asm volatile (__invalidate_dcache_one(0) : : "r" (p + idx));
>
>      if ( size > 0 )
> -        asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p + =
idx));
> +        asm_inline volatile (
> +            __clean_and_invalidate_dcache_one(0) :: "r" (p + idx) );
>
>      dsb(sy);           /* So we know the flushes happen before continuin=
g */
>
> @@ -209,7 +211,7 @@ static inline int clean_dcache_va_range(const void *p=
, unsigned long size)
>      p =3D (void *)((uintptr_t)p & ~cacheline_mask);
>      for ( ; size >=3D dcache_line_bytes;
>              idx +=3D dcache_line_bytes, size -=3D dcache_line_bytes )
> -        asm volatile (__clean_dcache_one(0) : : "r" (p + idx));
> +        asm_inline volatile ( __clean_dcache_one(0) : : "r" (p + idx) );
>      dsb(sy);           /* So we know the flushes happen before continuin=
g */
>      /* ARM callers assume that dcache_* functions cannot fail. */
>      return 0;
> @@ -247,7 +249,7 @@ static inline int clean_and_invalidate_dcache_va_rang=
e
>      if ( sizeof(x) > MIN_CACHELINE_BYTES || sizeof(x) > alignof(x) )    =
\
>          clean_dcache_va_range(_p, sizeof(x));                           =
\
>      else                                                                =
\
> -        asm volatile (                                                  =
\
> +        asm_inline volatile (                                           =
\
>              "dsb sy;"   /* Finish all earlier writes */                 =
\
>              __clean_dcache_one(0)                                       =
\
>              "dsb sy;"   /* Finish flush before continuing */            =
\
> @@ -259,7 +261,7 @@ static inline int clean_and_invalidate_dcache_va_rang=
e
>      if ( sizeof(x) > MIN_CACHELINE_BYTES || sizeof(x) > alignof(x) )    =
\
>          clean_and_invalidate_dcache_va_range(_p, sizeof(x));            =
\
>      else                                                                =
\
> -        asm volatile (                                                  =
\
> +        asm_inline volatile (                                           =
\
>              "dsb sy;"   /* Finish all earlier writes */                 =
\
>              __clean_and_invalidate_dcache_one(0)                        =
\
>              "dsb sy;"   /* Finish flush before continuing */            =
\
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/=
asm/processor.h
> index 60b587db697f..9cbc4f911061 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -607,9 +607,10 @@ register_t get_default_cptr_flags(void);
>  #define SYNCHRONIZE_SERROR(feat)                                  \
>      do {                                                          \
>          ASSERT(local_abort_is_enabled());                         \
> -        asm volatile(ALTERNATIVE("dsb sy; isb",                   \
> -                                 "nop; nop", feat)                \
> -                                 : : : "memory");                 \
> +        asm_inline volatile (                                     \
> +            ALTERNATIVE("dsb sy; isb",                            \
> +                        "nop; nop", feat)                         \
> +            ::: "memory" );                                       \
>      } while (0)
>
>  /*
> diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/as=
m/sysregs.h
> index 61e30c9e517c..5c2d362be3d8 100644
> --- a/xen/arch/arm/include/asm/sysregs.h
> +++ b/xen/arch/arm/include/asm/sysregs.h
> @@ -22,11 +22,13 @@ static inline register_t read_sysreg_par(void)
>       * DMB SY before and after accessing it, as part of the workaround f=
or the
>       * errata 1508412.
>       */
> -    asm volatile(ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
> -                 CONFIG_ARM64_ERRATUM_1508412));
> +    asm_inline volatile (
> +        ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
> +                    CONFIG_ARM64_ERRATUM_1508412) );
>      par_el1 =3D READ_SYSREG64(PAR_EL1);
> -    asm volatile(ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
> -                 CONFIG_ARM64_ERRATUM_1508412));
> +    asm_inline volatile (
> +        ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
> +                    CONFIG_ARM64_ERRATUM_1508412) );
>
>      return par_el1;
>  }
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 7642dbc7c55b..d96078f547d5 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -228,7 +228,8 @@ void p2m_restore_state(struct vcpu *n)
>       * registers associated to EL1/EL0 translations regime have been
>       * synchronized.
>       */
> -    asm volatile(ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_AT_SPECULATE=
));
> +    asm_inline volatile (
> +        ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_AT_SPECULATE) );
>      WRITE_SYSREG64(p2m->vttbr, VTTBR_EL2);
>
>      last_vcpu_ran =3D &p2m->last_vcpu_ran[smp_processor_id()];
> diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/includ=
e/asm/alternative.h
> index 38472fb58e2d..4c8be51d0e23 100644
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -116,12 +116,13 @@ extern void alternative_branches(void);
>   * without volatile and memory clobber.
>   */
>  #define alternative(oldinstr, newinstr, feature)                        =
\
> -        asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : : : "me=
mory")
> +    asm_inline volatile ( ALTERNATIVE(oldinstr, newinstr, feature)      =
\
> +                          ::: "memory" )
>
>  #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2=
) \
> -       asm volatile (ALTERNATIVE_2(oldinstr, newinstr1, feature1,      \
> -                                   newinstr2, feature2)                \
> -                     : : : "memory")
> +    asm_inline volatile ( ALTERNATIVE_2(oldinstr, newinstr1, feature1,  =
\
> +                                        newinstr2, feature2)            =
\
> +                          ::: "memory" )
>
>  /*
>   * Alternative inline assembly with input.
> @@ -133,14 +134,14 @@ extern void alternative_branches(void);
>   * If you use variable sized constraints like "m" or "g" in the
>   * replacement make sure to pad to the worst case length.
>   */
> -#define alternative_input(oldinstr, newinstr, feature, input...)       \
> -       asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)          \
> -                     : : input)
> +#define alternative_input(oldinstr, newinstr, feature, input...)        =
\
> +    asm_inline volatile ( ALTERNATIVE(oldinstr, newinstr, feature)      =
\
> +                          :: input )
>
>  /* Like alternative_input, but with a single output argument */
> -#define alternative_io(oldinstr, newinstr, feature, output, input...)  \
> -       asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)          \
> -                     : output : input)
> +#define alternative_io(oldinstr, newinstr, feature, output, input...)   =
\
> +    asm_inline volatile ( ALTERNATIVE(oldinstr, newinstr, feature)      =
\
> +                          : output : input )
>
>  /*
>   * This is similar to alternative_io. But it has two features and
> @@ -150,11 +151,11 @@ extern void alternative_branches(void);
>   * Otherwise, if CPU has feature1, newinstr1 is used.
>   * Otherwise, oldinstr is used.
>   */
> -#define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,     \
> -                        feature2, output, input...)                    \
> -       asm volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1,       \
> -                                  newinstr2, feature2)                 \
> -                    : output : input)
> +#define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,      =
\
> +                         feature2, output, input...)                    =
\
> +    asm_inline volatile ( ALTERNATIVE_2(oldinstr, newinstr1, feature1,  =
\
> +                                        newinstr2, feature2)            =
\
> +                          : output : input )
>
>  /* Use this macro(s) if you need more than one output parameter. */
>  #define ASM_OUTPUT2(a...) a
> @@ -234,8 +235,9 @@ extern void alternative_branches(void);
>      rettype ret_;                                                  \
>      register unsigned long r10_ asm("r10");                        \
>      register unsigned long r11_ asm("r11");                        \
> -    asm volatile (ALTERNATIVE("call *%c[addr](%%rip)", "call .",   \
> -                              X86_FEATURE_ALWAYS)                  \
> +    asm_inline volatile (                                          \
> +        ALTERNATIVE("call *%c[addr](%%rip)", "call .",             \
> +                    X86_FEATURE_ALWAYS)                            \
>                    : ALT_CALL ## n ## _OUT, "=3Da" (ret_),            \
>                      "=3Dr" (r10_), "=3Dr" (r11_) ASM_CALL_CONSTRAINT   \
>                    : [addr] "i" (&(func)), "g" (func)               \
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index c68fab189154..d9b133016bb6 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -53,6 +53,20 @@
>  #define unreachable() __builtin_unreachable()
>  #endif
>
> +/*
> + * Compilers estimate the size of an asm() block for inlining purposes.
> + * Constructs such as ALTERNATIVE appear large due to the metadata, deps=
ite
> + * often only being a handful of instructions.  asm inline() overrides t=
he
> + * estimation to identify the block as being small.
> + *
> + * Note: __inline is needed to avoid getting caught up in INIT_SECTIONS_=
ONLY.
> + */
> +#if CONFIG_CC_HAS_ASM_INLINE
> +# define asm_inline asm __inline

Here ^^^

> +#else
> +# define asm_inline asm
> +#endif
> +
>  /*
>   * Add the pseudo keyword 'fallthrough' so case statement blocks
>   * must end with any of these keywords:

Frediano

