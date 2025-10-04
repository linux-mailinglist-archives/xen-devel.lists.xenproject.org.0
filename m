Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC1BB8716
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 02:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137170.1473534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4psa-0001Lw-Sz; Sat, 04 Oct 2025 00:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137170.1473534; Sat, 04 Oct 2025 00:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4psa-0001Ji-PZ; Sat, 04 Oct 2025 00:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1137170;
 Sat, 04 Oct 2025 00:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nOMw=4N=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1v4psY-0001Jc-SC
 for xen-devel@lists.xenproject.org; Sat, 04 Oct 2025 00:12:03 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfa0d112-a0b6-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 02:12:01 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-71d5fe46572so39818077b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 17:12:01 -0700 (PDT)
Received: from [10.138.34.110]
 (h96-60-249-169.cncrtn.broadband.dynamic.tds.net. [96.60.249.169])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77f81e3bf58sm22424327b3.58.2025.10.03.17.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 17:11:59 -0700 (PDT)
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
X-Inumbo-ID: bfa0d112-a0b6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759536720; x=1760141520; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gDMNou3YU4mY3NvENKciXzq0Q/gBiopuddgWQvvYINk=;
        b=cvHAves2V8C7TgLSRHXDkSNyHdQI6qDbgMcydFHg17SjI6GZRHyHSCKi2nTxfncSsl
         2Cs1JQevIhIEgZHrpeLUccgQFf1bm1KO3e4Z5SeU8zLTw01ZGJt8sOg47MVqUAPOdAo1
         KpjB0A7JCy6PlH+PWOFbY1ALV2kufoE8HFzyJjj+69hIDJmQm4k2SRI5YUZtJnLQwtIs
         8WYutxovXBcn2p2MsC6n73zxOBcxa4ysKdDvFtCQ5+IdLjLgEBWcaUiWNJRV+i5FPkR0
         JmBt0kDiBJ4xJloEyXvUo+Q4AdTHZsQPwOQpzyaPaRb+Klu+dDZNxACXr+FqHDwBX9HV
         TQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759536720; x=1760141520;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gDMNou3YU4mY3NvENKciXzq0Q/gBiopuddgWQvvYINk=;
        b=vA5NGBJMDYUqxeWJvfDWzDRaFRxkadm+qyo9VPAUimCNFouZPEX0B7mICy3Qim2NGR
         WV0sBhlyuuTnPM+DBhtFJwyov1fyB1Q9H7mfYmwzjhlqk3WaYHCvknHir26ASFPEe8SB
         3RwV833Zp9Kvd/o6r7zz/Bp+Zs69XhkYZgsl+AVwrIUdgN2wW5ilVtiW+vKykbWER41J
         KmqhDuC6ZT4iiXbmjsx8ypxItKrlGBS5NjaeQ4FEq2GvL3Yrfd2INHVMmjHyoFBbQ7wk
         0ZZFF3+MVY68C7pbeM97DeodrTdbHrLh2MMXXpyAJDilqRD2B00VDpngFZOl+3pzNYl4
         9nYg==
X-Forwarded-Encrypted: i=1; AJvYcCXJK1rORskPAV7MjgviqsTFzyl7dSoXoHK/ZgaPiuD9kXkc8qw6Qp6XO4cn77+I8qHTDsGHGrphdyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmDrqJY7/s49u0mCaKugcDumxdwbE4fZI9XwD0RhN4/G6+/2Tg
	rlpKRv0Y19oTe4f3pWk/bNoWU01A/I93x6R5aL7P3HYtrGrsYzWVkxlw
X-Gm-Gg: ASbGncv5/BGA9+NnsELiSvgPFd563w1o1600EbcdUCqb/FgpjwJjJTEYVoaQwOf0USO
	7Ld2hX6ZI0N5b31UksdjKd53ignwdql0KTQrYGvMmJqcqRb2R3TbilCiMIdqlMdKdUTt/7x2DA0
	1w4OJSv+kD2b7oswJRw+uQRlk9jpfm6ej8p9S8zvEBoFTNYci6AEe7lnAzDf+5X7/FsbQBJtBqv
	LUw5rAyzA8V58vuBrmY+hXg7qggTuofMhktO0mByw49j/iz8T76mc+v1JMddbuIdl1+1GGZ5Pqc
	piA4mlK8RNvD6UoeSyfSq4KBpJrjr5AAuC5d4C/BpfYhjdOyVHHqT0ZpoH5E/PEqxVLKt4rSIzX
	qD6t92y+2Q+rx+WrEWOd9DA81byJj9FQHJ/0L6LTUEaOmJ5wFKSWn2hjmSRodWFAb3Ep915r1p2
	Vsm3PYXmlSNSy554wt5ZZvskvstIi3zcEOaTi8MCZJhxGAr4pNMrUGKBtMmYAAChdMEr72EQ==
X-Google-Smtp-Source: AGHT+IHDINXuPn93t6NHNJj9EJzEIOYa6T1aeQSFSreC5uu1a9RdVAWTJCzrDhbEfGvuV93ogmYdCQ==
X-Received: by 2002:a05:690c:fca:b0:731:1bc7:782d with SMTP id 00721157ae682-77f94b6b414mr65413707b3.18.1759536720128;
        Fri, 03 Oct 2025 17:12:00 -0700 (PDT)
Message-ID: <753f726e-baa8-44ab-92ed-df3cf8e89db1@gmail.com>
Date: Fri, 3 Oct 2025 20:11:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] x86/msr: Change wrmsr() to take a single
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20251003225334.2123667-3-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gpJMwcgBI6i5BNzcvbYQVm50"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gpJMwcgBI6i5BNzcvbYQVm50
Content-Type: multipart/mixed; boundary="------------OWbsGXA7JUj9X3NMPYhOqZD4";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <753f726e-baa8-44ab-92ed-df3cf8e89db1@gmail.com>
Subject: Re: [PATCH v3 02/22] x86/msr: Change wrmsr() to take a single
 parameter
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-3-andrew.cooper3@citrix.com>
In-Reply-To: <20251003225334.2123667-3-andrew.cooper3@citrix.com>

--------------OWbsGXA7JUj9X3NMPYhOqZD4
Content-Type: multipart/mixed; boundary="------------e0EMJUM0jZZ2fClrue7wQcv9"

--------------e0EMJUM0jZZ2fClrue7wQcv9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/3/25 18:53, Andrew Cooper wrote:
> Mirroring the cleanup to rdmsr(), do the same to wrmsr().  It now has t=
he same
> API as wrmsrl(), but we'll want to drop that wrapper in due course.
>=20
> It's telling that almost all remaining users pass in 0.  Most are conve=
rted
> directly to WRMSRNS, but a few are not.
>=20
> MSR_VIRT_SPEC_CTRL is unconditionally intercepted is orders of magnitud=
e more

"is unconditionally intercepted is" is this a typo?

> expensive than just serialising.  In disable_lapic_nmi_watchdog(), the =
P4 case
> won't run on hardware which has anything more than plain WRMSR.
>=20
> For CTR_WRITE() in op_model_athlon.c there is a logical change in behav=
iour,
> but it's fixing a bug.  Peformance counters typically get written to -(=
count)
> as they generate an interrupt on overflow.  The performance counters ev=
en in
> the K8 were 48 bits wide, and this wrmsr() not being a wrmsrl() appears=
 to
> have been an oversight in commit b5103d692aa7 ("x86 oprofile: use
> rdmsrl/wrmsrl") which converted all other users, and appears to be the =
last
> time there was an attempt to unify the MSR APIs.
>=20
> No practical change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> v3:
>  * Swap to wrmsrns() in setup_k7_watchdog()
>  * Reinstate correct bracketing in op_model_athlon.c's CTR_WRITE(), dro=
p
>    useless do{}while().
> ---
>  xen/arch/x86/cpu/amd.c                  |  2 +-
>  xen/arch/x86/hvm/vmx/vmcs.c             |  2 +-
>  xen/arch/x86/include/asm/msr.h          | 20 ++++++++++----------
>  xen/arch/x86/nmi.c                      | 18 +++++++++---------
>  xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
>  5 files changed, 22 insertions(+), 22 deletions(-)
>=20
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 43481daa8e26..9b02e1ba675c 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -934,7 +934,7 @@ void amd_set_legacy_ssbd(bool enable)
>  		return;
> =20
>  	if (cpu_has_virt_ssbd)
> -		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
> +		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0);
>  	else if (amd_legacy_ssbd)
>  		core_set_legacy_ssbd(enable);
>  	else
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index b639818b6ea6..cd5ac8a5f0e3 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -754,7 +754,7 @@ static int _vmx_cpu_up(bool bsp)
>          eax |=3D IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
>          if ( test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) =
)
>              eax |=3D IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX;
> -        wrmsr(MSR_IA32_FEATURE_CONTROL, eax, 0);
> +        wrmsrns(MSR_IA32_FEATURE_CONTROL, eax);
>      }
> =20
>      if ( (rc =3D vmx_init_vmcs_config(bsp)) !=3D 0 )
> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/=
msr.h
> index 188a50f9cea4..941a7612f4ba 100644
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -15,13 +15,17 @@
>   *   uint64_t foo =3D rdmsr(MSR_BAR);
>   *   wrmsrns(MSR_BAR, foo);
>   *
> + * and, if architectural serialisaition is necessary, or there are oth=
er
> + * reasons that WRMSRNS is inapplicable, then:
> + *
> + *   wrmsr(MSR_BAR, foo);
> + *
>   * In addition, *_safe() wrappers exist to cope gracefully with a #GP.=

>   *
>   *
>   * All legacy forms are to be phased out:
>   *
>   *  rdmsrl(MSR_FOO, val);
> - *  wrmsr(MSR_FOO, lo, hi);
>   *  wrmsrl(MSR_FOO, val);
>   */
> =20
> @@ -43,17 +47,13 @@ static always_inline uint64_t rdmsr(unsigned int ms=
r)
>         val =3D a__ | ((u64)b__<<32); \
>  } while(0)
> =20
> -#define wrmsr(msr,val1,val2) \
> -     __asm__ __volatile__("wrmsr" \
> -			  : /* no outputs */ \
> -			  : "c" (msr), "a" (val1), "d" (val2))
> -
> -static inline void wrmsrl(unsigned int msr, uint64_t val)
> +static inline void wrmsr(unsigned int msr, uint64_t val)
>  {
> -        uint32_t lo =3D val, hi =3D val >> 32;
> +    uint32_t lo =3D val, hi =3D val >> 32;
> =20
> -        wrmsr(msr, lo, hi);
> +    asm volatile ( "wrmsr" :: "a" (lo), "d" (hi), "c" (msr) );
>  }
> +#define wrmsrl(msr, val) wrmsr(msr, val)
> =20
>  /* Non-serialising WRMSR, when available.  Falls back to a serialising=
 WRMSR. */
>  static inline void wrmsrns(uint32_t msr, uint64_t val)
> @@ -150,7 +150,7 @@ static inline void wrmsr_tsc_aux(uint32_t val)
> =20
>      if ( *this_tsc_aux !=3D val )
>      {
> -        wrmsr(MSR_TSC_AUX, val, 0);
> +        wrmsrns(MSR_TSC_AUX, val);
>          *this_tsc_aux =3D val;
>      }
>  }
> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> index 9793fa23168d..a0c9194ff032 100644
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -218,16 +218,16 @@ void disable_lapic_nmi_watchdog(void)
>          return;
>      switch (boot_cpu_data.x86_vendor) {
>      case X86_VENDOR_AMD:
> -        wrmsr(MSR_K7_EVNTSEL0, 0, 0);
> +        wrmsrns(MSR_K7_EVNTSEL0, 0);
>          break;
>      case X86_VENDOR_INTEL:
>          switch (boot_cpu_data.x86) {
>          case 6:
> -            wrmsr(MSR_P6_EVNTSEL(0), 0, 0);
> +            wrmsrns(MSR_P6_EVNTSEL(0), 0);
>              break;
>          case 15:
> -            wrmsr(MSR_P4_IQ_CCCR0, 0, 0);
> -            wrmsr(MSR_P4_CRU_ESCR0, 0, 0);
> +            wrmsr(MSR_P4_IQ_CCCR0, 0);
> +            wrmsr(MSR_P4_CRU_ESCR0, 0);
>              break;
>          }
>          break;
> @@ -282,7 +282,7 @@ static void clear_msr_range(unsigned int base, unsi=
gned int n)
>      unsigned int i;
> =20
>      for (i =3D 0; i < n; i++)
> -        wrmsr(base+i, 0, 0);
> +        wrmsrns(base + i, 0);
>  }
> =20
>  static inline void write_watchdog_counter(const char *descr)
> @@ -308,11 +308,11 @@ static void setup_k7_watchdog(void)
>          | K7_EVNTSEL_USR
>          | K7_NMI_EVENT;
> =20
> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
> +    wrmsrns(MSR_K7_EVNTSEL0, evntsel);
>      write_watchdog_counter("K7_PERFCTR0");
>      apic_write(APIC_LVTPC, APIC_DM_NMI);
>      evntsel |=3D K7_EVNTSEL_ENABLE;
> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
> +    wrmsrns(MSR_K7_EVNTSEL0, evntsel);
>  }
> =20
>  static void setup_p6_watchdog(unsigned counter)
> @@ -338,11 +338,11 @@ static void setup_p6_watchdog(unsigned counter)
>          | P6_EVNTSEL_USR
>          | counter;
> =20
> -    wrmsr(MSR_P6_EVNTSEL(0), evntsel, 0);
> +    wrmsrns(MSR_P6_EVNTSEL(0), evntsel);
>      write_watchdog_counter("P6_PERFCTR0");
>      apic_write(APIC_LVTPC, APIC_DM_NMI);
>      evntsel |=3D P6_EVNTSEL0_ENABLE;
> -    wrmsr(MSR_P6_EVNTSEL(0), evntsel, 0);
> +    wrmsrns(MSR_P6_EVNTSEL(0), evntsel);
>  }
> =20
>  static void setup_p4_watchdog(void)
> diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/opr=
ofile/op_model_athlon.c
> index bf897a4b6328..4c016624a69b 100644
> --- a/xen/arch/x86/oprofile/op_model_athlon.c
> +++ b/xen/arch/x86/oprofile/op_model_athlon.c
> @@ -34,7 +34,7 @@
>  #define MAX_COUNTERS FAM15H_NUM_COUNTERS
> =20
>  #define CTR_READ(msr_content,msrs,c) do {rdmsrl(msrs->counters[(c)].ad=
dr, (msr_content));} while (0)
> -#define CTR_WRITE(l,msrs,c) do {wrmsr(msrs->counters[(c)].addr, -(unsi=
gned int)(l), -1);} while (0)
> +#define CTR_WRITE(l,msrs,c) wrmsr(msrs->counters[(c)].addr, -(l))
>  #define CTR_OVERFLOWED(n) (!((n) & (1ULL<<31)))
> =20
>  #define CTRL_READ(msr_content,msrs,c) do {rdmsrl(msrs->controls[(c)].a=
ddr, (msr_content));} while (0)


--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------e0EMJUM0jZZ2fClrue7wQcv9
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------e0EMJUM0jZZ2fClrue7wQcv9--

--------------OWbsGXA7JUj9X3NMPYhOqZD4--

--------------gpJMwcgBI6i5BNzcvbYQVm50
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmjgZkwACgkQszaHOrMp
8lPzIRAAovkptIwxqfvHPxYaIut7GzqONnaFlPhlJuRbIkodbMrQKmdEDgdfExwl
4GeUsfbhCorXSbemF3WUVh8CqaR6lAs0CM9VO6mzyYFDKmdsmji2lzQVnTQzNyPs
9dooUuVmagLiLSu878wHDkR/F1xxP4jHakxLVIOkR4ifbjsR1X/BkMz1+nL98AVl
IIVwzqU0Zq55PrSdPX4zubZdzHcNWvU6MemVtg+B4MTSRj02gJV2ENCM0MoY2i8M
oTm2aSqlXQF+zVh8+nn2b1Jrx9Arsdnbxz7QPRM+FMSwyPpTU1gt/jqLL7SZQ2BX
VtedZfmJScLs18lkirq2ZL5xbnzVoyN8AXVAR0kd7DH0QGXHdNGBEZT7cHyKGCf7
uT5x71uCKpYxbdmasCtRutN1gNzN6cOdoZxAUXCyoIC/NRjCS79Sb7wclVu0G6xy
O4b3Odu1IKVtiV6r9T2hFbWHBcb47s+WVnylSYybdR28y8SteBbXZJkBu6ousQSL
lrd9huLlOsGnyN0VzslvJyhYlZHen/XSximoguvBi4a1FsWRpvuLwAL+/BrHJLiu
nqhpw7zTn9PKktUnQzBAnqB1gspOXp/ObUHdPNkyopap66eoUH1mvcKU7wFft0wQ
o7l2U4Zr/+HO9lxJY9Y/mLv27b9HCNKFqZ8Hi4n7U9NIJVe40pY=
=uiBl
-----END PGP SIGNATURE-----

--------------gpJMwcgBI6i5BNzcvbYQVm50--

