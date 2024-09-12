Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A901D97692A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797425.1207383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiwZ-0007ZS-1G; Thu, 12 Sep 2024 12:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797425.1207383; Thu, 12 Sep 2024 12:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiwY-0007XM-Uh; Thu, 12 Sep 2024 12:29:02 +0000
Received: by outflank-mailman (input) for mailman id 797425;
 Thu, 12 Sep 2024 12:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cE1=QK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1soiwX-0007XG-7S
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:29:01 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9518d901-7102-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:28:58 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5dfaccba946so442624eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:28:58 -0700 (PDT)
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
X-Inumbo-ID: 9518d901-7102-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726144137; x=1726748937; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwUqVEweEsPOjpC/pL3zVMclgFUT3/kfnoJMAa0JaSg=;
        b=dd8EJ4cAlSQfLC/v7TOXk4GH9NhP5Tq5hfrx+3qsXl1U89fdR880FIrfY/PaBhbD9X
         0jnHHB5oK5xuZEUfeOWr9GCPhs8AA4HJGm3bsS9ZuEPpbDZ4AXeeFaIxnS022He/N2cU
         63M+DB0O5tntkxVhOBpIgoKFFSy0zeDVsaw7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726144137; x=1726748937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwUqVEweEsPOjpC/pL3zVMclgFUT3/kfnoJMAa0JaSg=;
        b=lYpmELFNfhcWm88fNnEG71TpIyL8yAScQvEuTNH3atYqb34/AVAeJHgvUNXxmDrGkR
         GyRvqh1Q21D5n2qrRZKUrgRKXw4FEU74Rth/cF33O5lLyFWNxWKEwJNUzSNqo3munfY5
         RfCeb/tgSwbK1xx2mui0wQg6UAuLJ742eI2ekNQtiycJWPDQQeXyiUq5BxYAQrANbuMR
         1FKnGXknhjjZAQkR5REJmSmkreXsoMjeD8ntM3gFST3roPulSSlHwPux7muJhBiJ/ww8
         +4+zlS980xIdVibpPdieF7Qe2CI1lolJlXOMF37e/ztuHXNsrc0z4fJ2hNC/ARY2o7/+
         Vmgw==
X-Gm-Message-State: AOJu0Yzuf4miZhqvwnclkkTx83OEXXAAXcNXO/5JONQPuu+fokXUfLOb
	kPefXcPmGx+Pq2tVqnTdka+sHDQ5BaOweMnFFqgmhd3Rh5kCtf7s5oGFeSsx1dG/zyZc+U2lFv9
	C1zCUp/G/AT+RG01c3jRe/pXEFG/BOp4+v6g5vw==
X-Google-Smtp-Source: AGHT+IGlKkcPm4qs609NNE8pt5r7OVAZIqWKviCLkdZAbHDsDuwLrBCaJZj4d7PEOIAb+jAijVC2TYO+CTWDlRhZK7c=
X-Received: by 2002:a05:6820:625:b0:5e1:eba9:8fee with SMTP id
 006d021491bc7-5e2012b62b1mr1276665eaf.1.1726144136950; Thu, 12 Sep 2024
 05:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <ab2d325e-0d91-4308-b4d1-06314ad5ba0c@suse.com> <a6126dc2-a10f-4a90-9d2f-80f6f32f1386@suse.com>
In-Reply-To: <a6126dc2-a10f-4a90-9d2f-80f6f32f1386@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 12 Sep 2024 13:28:45 +0100
Message-ID: <CACHz=Zgwy0XVuiXwWt+wZaE0SZkvYSp2tk-q6P9K_oqFbRkb8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] types: replace remaining uses of s64
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 1:20=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>

Minor for the subject, there are also some removal of u64 and u8, not only =
s64

> ... and move the type itself to linux-compat.h.
>
> While doing so
> - correct the type of union uu's uq field in lib/divmod.c,
> - switch a few adjacent types as well, for (a little bit of)
>   consistency.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Split off ubsan.[ch] adjustments. Re-base.
>
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -484,8 +484,8 @@ static const struct arm64_ftr_bits ftr_r
>         ARM64_FTR_END,
>  };
>
> -static u64 arm64_ftr_set_value(const struct arm64_ftr_bits *ftrp, s64 re=
g,
> -                              s64 ftr_val)
> +static uint64_t arm64_ftr_set_value(const struct arm64_ftr_bits *ftrp,
> +                                   int64_t reg, int64_t ftr_val)
>  {
>         u64 mask =3D arm64_ftr_mask(ftrp);
>
> @@ -494,10 +494,10 @@ static u64 arm64_ftr_set_value(const str
>         return reg;
>  }
>
> -static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 n=
ew,
> -                               s64 cur)
> +static int64_t arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp,
> +                                   int64_t new, int64_t cur)
>  {
> -       s64 ret =3D 0;
> +       int64_t ret =3D 0;
>
>         switch (ftrp->type) {
>         case FTR_EXACT:
> @@ -532,8 +532,8 @@ static void sanitize_reg(u64 *cur_reg, u
>
>         for (;ftrp->width !=3D 0;ftrp++)
>         {
> -               s64 cur_field =3D arm64_ftr_value(ftrp, *cur_reg);
> -               s64 new_field =3D arm64_ftr_value(ftrp, new_reg);
> +               int64_t cur_field =3D arm64_ftr_value(ftrp, *cur_reg);
> +               int64_t new_field =3D arm64_ftr_value(ftrp, new_reg);
>
>                 if (cur_field =3D=3D new_field)
>                         continue;
> --- a/xen/arch/arm/arm64/livepatch.c
> +++ b/xen/arch/arm/arm64/livepatch.c
> @@ -119,7 +119,7 @@ static u64 do_reloc(enum aarch64_reloc_o
>
>  static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len)
>  {
> -    s64 sval =3D do_reloc(op, place, val);
> +    int64_t sval =3D do_reloc(op, place, val);
>
>      switch ( len )
>      {
> @@ -136,7 +136,7 @@ static int reloc_data(enum aarch64_reloc
>          break;
>
>      case 64:
> -        *(s64 *)place =3D sval;
> +        *(int64_t *)place =3D sval;
>          break;
>
>      default:
> @@ -155,9 +155,9 @@ enum aarch64_insn_movw_imm_type {
>  static int reloc_insn_movw(enum aarch64_reloc_op op, void *dest, u64 val=
,
>                             int lsb, enum aarch64_insn_movw_imm_type imm_=
type)
>  {
> -    u64 imm;
> -    s64 sval;
> -    u32 insn =3D *(u32 *)dest;
> +    uint64_t imm;
> +    int64_t sval;
> +    uint32_t insn =3D *(uint32_t *)dest;
>
>      sval =3D do_reloc(op, dest, val);
>      imm =3D sval >> lsb;
> @@ -200,9 +200,9 @@ static int reloc_insn_movw(enum aarch64_
>  static int reloc_insn_imm(enum aarch64_reloc_op op, void *dest, u64 val,
>                            int lsb, int len, enum aarch64_insn_imm_type i=
mm_type)
>  {
> -    u64 imm, imm_mask;
> -    s64 sval;
> -    u32 insn =3D *(u32 *)dest;
> +    uint64_t imm, imm_mask;
> +    int64_t sval;
> +    uint32_t insn =3D *(uint32_t *)dest;
>
>      /* Calculate the relocation value. */
>      sval =3D do_reloc(op, dest, val);
> @@ -220,7 +220,7 @@ static int reloc_insn_imm(enum aarch64_r
>       * Extract the upper value bits (including the sign bit) and
>       * shift them to bit 0.
>       */
> -    sval =3D (s64)(sval & ~(imm_mask >> 1)) >> (len - 1);
> +    sval =3D (int64_t)(sval & ~(imm_mask >> 1)) >> (len - 1);
>
>      /*
>       * Overflow has occurred if the upper bits are not all equal to
> --- a/xen/arch/arm/include/asm/arm64/cpufeature.h
> +++ b/xen/arch/arm/include/asm/arm64/cpufeature.h
> @@ -39,15 +39,15 @@ struct arm64_ftr_bits {
>         bool            visible;
>         bool            strict; /* CPU Sanity check: strict matching requ=
ired ? */
>         enum ftr_type   type;
> -       u8              shift;
> -       u8              width;
> -       s64             safe_val; /* safe value for FTR_EXACT features */
> +       uint8_t         shift;
> +       uint8_t         width;
> +       int64_t         safe_val; /* safe value for FTR_EXACT features */
>  };
>
>  static inline int attr_const
>  cpuid_feature_extract_signed_field_width(u64 features, int field, int wi=
dth)
>  {
> -       return (s64)(features << (64 - width - field)) >> (64 - width);
> +       return (int64_t)(features << (64 - width - field)) >> (64 - width=
);
>  }
>
>  static inline int attr_const
> @@ -87,9 +87,12 @@ cpuid_feature_extract_field(u64 features
>         return cpuid_feature_extract_field_width(features, field, 4, sign=
);
>  }
>
> -static inline s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u64=
 val)
> +static inline int64_t arm64_ftr_value(const struct arm64_ftr_bits *ftrp,
> +                                      uint64_t val)
>  {
> -       return (s64)cpuid_feature_extract_field_width(val, ftrp->shift, f=
trp->width, ftrp->sign);
> +       return (int64_t)cpuid_feature_extract_field_width(val, ftrp->shif=
t,
> +                                                         ftrp->width,
> +                                                         ftrp->sign);
>  }
>
>  #endif /* _ASM_ARM_ARM64_CPUFEATURES_H */
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1208,7 +1208,7 @@ void vlapic_tdt_msr_set(struct vlapic *v
>      if ( value > guest_tsc )
>      {
>          uint64_t delta =3D gtsc_to_gtime(v->domain, value - guest_tsc);
> -        delta =3D max_t(s64, delta, 0);
> +        delta =3D max_t(int64_t, delta, 0);
>
>          HVM_DBG_LOG(DBG_LEVEL_VLAPIC_TIMER, "delta[0x%016"PRIx64"]", del=
ta);
>
> --- a/xen/arch/x86/include/asm/hvm/vcpu.h
> +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
> @@ -134,8 +134,8 @@ struct hvm_vcpu {
>      unsigned long       hw_cr[5];
>
>      struct vlapic       vlapic;
> -    s64                 cache_tsc_offset;
> -    u64                 guest_time;
> +    int64_t             cache_tsc_offset;
> +    uint64_t            guest_time;
>
>      /* Lock and list for virtual platform timers. */
>      spinlock_t          tm_lock;
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -66,10 +66,10 @@ struct cpu_time {
>  struct platform_timesource {
>      const char *id;
>      const char *name;
> -    u64 frequency;
> +    uint64_t frequency;
>      /* Post-init this hook may only be invoked via the read_counter() wr=
apper! */
> -    u64 (*read_counter)(void);
> -    s64 (*init)(struct platform_timesource *);
> +    uint64_t (*read_counter)(void);
> +    int64_t (*init)(struct platform_timesource *);
>      void (*resume)(struct platform_timesource *);
>      int counter_bits;
>  };
> @@ -368,7 +368,7 @@ static u64 cf_check read_pit_count(void)
>      return count32;
>  }
>
> -static s64 __init cf_check init_pit(struct platform_timesource *pts)
> +static int64_t __init cf_check init_pit(struct platform_timesource *pts)
>  {
>      u8 portb =3D inb(0x61);
>      u64 start, end;
> @@ -610,7 +610,7 @@ static u64 cf_check read_pmtimer_count(v
>      return inl(pmtmr_ioport);
>  }
>
> -static s64 __init cf_check init_pmtimer(struct platform_timesource *pts)
> +static int64_t __init cf_check init_pmtimer(struct platform_timesource *=
pts)
>  {
>      if ( !pmtmr_ioport || (pmtmr_width !=3D 24 && pmtmr_width !=3D 32) )
>          return 0;
> @@ -655,7 +655,7 @@ static unsigned int __initdata tsc_flags
>   * Called in verify_tsc_reliability() under reliable TSC conditions
>   * thus reusing all the checks already performed there.
>   */
> -static s64 __init cf_check init_tsc(struct platform_timesource *pts)
> +static int64_t __init cf_check init_tsc(struct platform_timesource *pts)
>  {
>      u64 ret =3D pts->frequency;
>
> @@ -1034,9 +1034,9 @@ static void __init reset_platform_timer(
>      spin_unlock_irq(&platform_timer_lock);
>  }
>
> -static s64 __init try_platform_timer(struct platform_timesource *pts)
> +static int64_t __init try_platform_timer(struct platform_timesource *pts=
)
>  {
> -    s64 rc =3D pts->init(pts);
> +    int64_t rc =3D pts->init(pts);
>
>      if ( rc <=3D 0 )
>          return rc;
> @@ -1070,7 +1070,7 @@ static u64 __init init_platform_timer(vo
>
>      struct platform_timesource *pts =3D NULL;
>      unsigned int i;
> -    s64 rc =3D -1;
> +    int64_t rc =3D -1;
>
>      /* clocksource=3Dtsc is initialized via __initcalls (when CPUs are u=
p). */
>      if ( (opt_clocksource[0] !=3D '\0') && strcmp(opt_clocksource, "tsc"=
) )
> @@ -1923,7 +1923,7 @@ static void cf_check local_time_calibrat
>       * Weirdness can happen if we lose sync with the platform timer.
>       * We could be smarter here: resync platform timer with local timer?
>       */
> -    if ( ((s64)stime_elapsed64 < (EPOCH / 2)) )
> +    if ( ((int64_t)stime_elapsed64 < (EPOCH / 2)) )
>          goto out;
>
>      /*
> @@ -2398,7 +2398,7 @@ static void __init tsc_check_writability
>
>          write_tsc(tsc | (1ULL << 32));
>          tmp =3D rdtsc();
> -        if ( ABS((s64)tmp - (s64)tmp2) < (1LL << 31) )
> +        if ( ABS((int64_t)tmp - (int64_t)tmp2) < (1LL << 31) )
>              what =3D "only partially";
>      }
>      else
> --- a/xen/drivers/acpi/apei/erst.c
> +++ b/xen/drivers/acpi/apei/erst.c
> @@ -105,7 +105,7 @@ static inline int erst_errno(int command
>
>  static int erst_timedout(u64 *t, u64 spin_unit)
>  {
> -       if ((s64)*t < spin_unit) {
> +       if ((int64_t)*t < spin_unit) {
>                 printk(XENLOG_WARNING "Firmware does not respond in time\=
n");
>                 return 1;
>         }
> --- a/xen/include/acpi/actypes.h
> +++ b/xen/include/acpi/actypes.h
> @@ -147,8 +147,8 @@ typedef int INT32;
>
>  /*! [End] no source code translation !*/
>
> -typedef u64 acpi_native_uint;
> -typedef s64 acpi_native_int;
> +typedef uint64_t acpi_native_uint;
> +typedef int64_t acpi_native_int;
>
>  typedef u64 acpi_io_address;
>  typedef u64 acpi_physical_address;
> --- a/xen/include/xen/linux-compat.h
> +++ b/xen/include/xen/linux-compat.h
> @@ -15,7 +15,7 @@ typedef int8_t  s8, __s8;
>  typedef uint8_t __u8;
>  typedef int16_t s16, __s16;
>  typedef int32_t s32, __s32;
> -typedef int64_t __s64;
> +typedef int64_t s64, __s64;
>
>  typedef paddr_t phys_addr_t;
>
> --- a/xen/include/xen/time.h
> +++ b/xen/include/xen/time.h
> @@ -29,7 +29,7 @@ struct vcpu;
>   * of real time into system time
>   */
>
> -typedef s64 s_time_t;
> +typedef int64_t s_time_t;
>  #define PRI_stime PRId64
>
>  s_time_t get_s_time_fixed(u64 at_tick);
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -8,7 +8,6 @@
>  typedef uint8_t u8;
>  typedef uint16_t u16, __u16;
>  typedef uint32_t u32, __u32;
> -typedef int64_t s64;
>  typedef uint64_t u64, __u64;
>
>  #include <asm/types.h>
> --- a/xen/lib/divmod.c
> +++ b/xen/lib/divmod.c
> @@ -46,8 +46,8 @@
>   * one or more of the following formats.
>   */
>  union uu {
> -    s64            q;              /* as a (signed) quad */
> -    s64            uq;             /* as an unsigned quad */
> +    int64_t        q;              /* as a (signed) quad */
> +    uint64_t       uq;             /* as an unsigned quad */
>      long           sl[2];          /* as two signed longs */
>      unsigned long  ul[2];          /* as two unsigned longs */
>  };
> @@ -72,7 +72,7 @@ union uu {
>   * and assembly.
>   */
>  #define CHAR_BIT        8               /* number of bits in a char */
> -#define QUAD_BITS       (sizeof(s64) * CHAR_BIT)
> +#define QUAD_BITS       (sizeof(int64_t) * CHAR_BIT)
>  #define LONG_BITS       (sizeof(long) * CHAR_BIT)
>  #define HALF_BITS       (sizeof(long) * CHAR_BIT / 2)
>
> @@ -324,7 +324,7 @@ u64 __qdivrem(u64 uq, u64 vq, u64 *arq)
>   * Divide two signed quads.
>   * Truncates towards zero, as required by C99.
>   */
> -s64 __divdi3(s64 a, s64 b)
> +int64_t __divdi3(int64_t a, int64_t b)
>  {
>      u64 ua, ub, uq;
>      int neg =3D (a < 0) ^ (b < 0);
> @@ -361,7 +361,7 @@ u64 __umoddi3(u64 a, u64 b)
>   *  11 % -5 =3D  1
>   * -11 % -5 =3D -1
>   */
> -s64 __moddi3(s64 a, s64 b)
> +int64_t __moddi3(int64_t a, int64_t b)
>  {
>      u64 ua, ub, urem;
>      int neg =3D (a < 0);
> @@ -374,7 +374,7 @@ s64 __moddi3(s64 a, s64 b)
>  /*
>   * Quotient and remainder of unsigned long long division
>   */
> -s64 __ldivmod_helper(s64 a, s64 b, s64 *r)
> +int64_t __ldivmod_helper(int64_t a, int64_t b, int64_t *r)
>  {
>      u64 ua, ub, rem, quot;
>

Frediano

