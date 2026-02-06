Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bb5zDyNphWlqBQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 05:08:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD10F9E71
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 05:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222754.1530487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voD89-0006xs-Oc; Fri, 06 Feb 2026 04:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222754.1530487; Fri, 06 Feb 2026 04:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voD89-0006um-LH; Fri, 06 Feb 2026 04:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1222754;
 Fri, 06 Feb 2026 04:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiGI=AK=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1voD87-0006ug-SF
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 04:07:40 +0000
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com
 [2607:f8b0:4864:20::b131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f28f159-0311-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 05:07:38 +0100 (CET)
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-649e97f1e1eso1459069d50.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 20:07:37 -0800 (PST)
Received: from [10.138.34.110]
 (h69-131-216-100.cncrtn.broadband.dynamic.tds.net. [69.131.216.100])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-649f256c381sm1225562d50.21.2026.02.05.20.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 20:07:35 -0800 (PST)
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
X-Inumbo-ID: 5f28f159-0311-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770350856; x=1770955656; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wUJNgK2YBOAUeB8OyVaT75o0p+RsxXpAOArOU4GhI3s=;
        b=V9sWUvklXCAaME0YTN0hB+6KSWqTMvLgbsh/4GLX7yk6hDx0Ekgj3bT31NaunAQxjK
         pTEEp3D+pJeVqnwhW0ll4R1eAv/DUc3/tFclciz+Dq7I8TvVgBl2BtJ9756Mz3mb4Ddi
         pgzHy1i+Y5NMAFXLBlZpDe4KV5uf33vi1IH/y2P6McZtjQnu3woU2CjT4oKxBwQi0UVa
         1WYrlHZec9PHWTQPAOzWAIKHGiO0I6nEIzXVObRevtUQbA+CnB/5XUahvIUajJ+u8gEo
         TbZ+q4o9CUs7thWfCRCeCMbof3njm68l/5sch4PYIcrSDCkcaUVy7c/NicF0JT4EVR9x
         E+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770350856; x=1770955656;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUJNgK2YBOAUeB8OyVaT75o0p+RsxXpAOArOU4GhI3s=;
        b=BAUT7f/rt/ye1BvdqL6seEJM/KTq7kRf7of1NXag7k+81BMGe5chXuBN4vQliPgXDU
         s5kHfaDaw+bwwPRVe7sBt+wqVuzIQlnJ4/9ai6rFo3xRlsWQ+AllSEvj5RArU7jr9j6b
         7f2M8jMYTde56+nj/xL4W6nhM2k41oeo5Ic3rsBsXoSE0ongAg/tgH4PgytaQmOtbnFb
         XFvKxt02BDoOFyUl6EboLzt6H1VJFBqeT2Rpqm5NlyK6b/XIVh0mEZ7VieFX/Xqbe6p4
         i+IVsvNi9OYnWkmJvi12+CBxek4YfiiMTkkZN+xSQOPYb+yO+i+rA9FQrSAXzEnKR++4
         BG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf0A9mbrKdGMlY15gzDLE9BfzQv1mE+rFQPzSakJoXk8gqK27EoULGieEuaDCowhgZDkRuq3EQji4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxli1Xvnel75lv6mrhcAob1XwAKBllqCK7k0Sde0VdJbglf1qTM
	XmF3UkQzwh+pq6HpXM/FTpLtq6ip70HqOinalDHotLcuyvhwjx1XKE+v
X-Gm-Gg: AZuq6aJLhy/GCz6YuzvjqCNhBQz9CvE8MmnFJv/+KPK0VSDnbVEETnQslEer6UAJql7
	oZyqQ4aAwN3wcKM/Xalc0VHKU6QCc4w7dggA7UZPUcysVaDkp5uYfM/4pfGfQwXut8N0HjbzRVD
	8WMTuFSkSTXyDYrZuf6PMRI9xBfDjBbzQaWZT8+8azYdJ6qQY4GKAqFOkvQWqN5wkArWged0BJt
	dB/58j/Y1+kjmW38XqxgWv3jB9ajoMrZFUnVIPYgmTch18QmcKCFrP6XbUFIEQDqwYFIEyg7ntx
	iw5bR9Pq+KJuhLjHt2DbEgNCBf/rR/8xpejWgE2aNn5TrNvfSSeglsglWTmI/+afBSb1l8I051m
	mtchap+3TCWujwq+fjXQav1UIrhuS7tcC1xyPdRcdevDp6ylr9R2Kuopn8ihb/60TMU1uTE73Mj
	nY7+f+sgJoa7/Z3nINX5/YCJzLvACfeJYwXnPDgZtluYGiSlUGu94aMtfK6M8fJ19yjHkfFJuIA
	0hACDSioS8nTB/XY3/lHmkHEUz25A==
X-Received: by 2002:a05:690e:1901:b0:649:f272:4e71 with SMTP id 956f58d0204a3-649f2725468mr1294811d50.61.1770350856118;
        Thu, 05 Feb 2026 20:07:36 -0800 (PST)
Message-ID: <8899d013-3be7-4ffa-835c-bc3575439322@gmail.com>
Date: Thu, 5 Feb 2026 23:07:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jason.andryuk@amd.com, alejandro.garciavallejo@amd.com
References: <20260206015032.4159672-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260206015032.4159672-1-stefano.stabellini@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3hJUj1mq3NnE0FFYrRZNdcQK"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.18 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[demiobenour@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[demiobenour@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5CD10F9E71
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3hJUj1mq3NnE0FFYrRZNdcQK
Content-Type: multipart/mixed; boundary="------------v48DdQMR4cnFttR0UBVN0Ytc";
 protected-headers="v1"
Message-ID: <8899d013-3be7-4ffa-835c-bc3575439322@gmail.com>
Date: Thu, 5 Feb 2026 23:07:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jason.andryuk@amd.com, alejandro.garciavallejo@amd.com
References: <20260206015032.4159672-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260206015032.4159672-1-stefano.stabellini@amd.com>

--------------v48DdQMR4cnFttR0UBVN0Ytc
Content-Type: multipart/mixed; boundary="------------KMH2SnAkdI0syJl1OX08h0VV"

--------------KMH2SnAkdI0syJl1OX08h0VV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2/5/26 20:50, Stefano Stabellini wrote:
> Introduce CONFIG_NESTED_VIRT (default y, requires EXPERT to disable)
> to allow nested virtualization support to be disabled at build time.
> This is useful for embedded or safety-focused deployments where
> nested virtualization is not needed, reducing code size and attack
> surface.
>=20
> When CONFIG_NESTED_VIRT=3Dn, the following source files are excluded:
> - arch/x86/hvm/nestedhvm.c
> - arch/x86/hvm/svm/nestedsvm.c
> - arch/x86/hvm/vmx/vvmx.c
> - arch/x86/mm/nested.c
> - arch/x86/mm/hap/nested_hap.c
> - arch/x86/mm/hap/nested_ept.c
>=20
> Add inline stubs where needed in headers.
>=20
> No functional change when CONFIG_NESTED_VIRT=3Dy.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/x86/hvm/Kconfig                 | 10 ++++++
>  xen/arch/x86/hvm/Makefile                |  2 +-
>  xen/arch/x86/hvm/svm/Makefile            |  2 +-
>  xen/arch/x86/hvm/svm/nestedhvm.h         | 44 +++++++++++++++++++++---=

>  xen/arch/x86/hvm/svm/svm.c               |  6 ++++
>  xen/arch/x86/hvm/vmx/Makefile            |  2 +-
>  xen/arch/x86/hvm/vmx/vmx.c               | 10 ++++--
>  xen/arch/x86/include/asm/hvm/nestedhvm.h | 41 +++++++++++++++++-----
>  xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 30 ++++++++++++++++
>  xen/arch/x86/mm/Makefile                 |  2 +-
>  xen/arch/x86/mm/hap/Makefile             |  4 +--
>  xen/arch/x86/mm/p2m.h                    |  6 ++++
>  12 files changed, 137 insertions(+), 22 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index f32bf5cbb7..12b5df4710 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,14 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
> =20
> +config NESTED_VIRT
> +	bool "Nested virtualization support" if EXPERT
> +	depends on AMD_SVM || INTEL_VMX
> +	default y

Would it be possible to make this

	default n

instead?  If not, could the dependency on EXPERT be removed?

> +	help
> +	  Enable nested virtualization, allowing guests to run their own
> +	  hypervisors. This requires hardware support.
> +
> +	  If unsure, say Y.

I would go with:

	Xen's support is known to be buggy and insecure. If unsure, say N.

> +
>  endif
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index f34fb03934..b8a0a68624 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -18,7 +18,7 @@ obj-y +=3D irq.o
>  obj-y +=3D mmio.o
>  obj-$(CONFIG_VM_EVENT) +=3D monitor.o
>  obj-y +=3D mtrr.o
> -obj-y +=3D nestedhvm.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nestedhvm.o
>  obj-y +=3D pmtimer.o
>  obj-y +=3D quirks.o
>  obj-y +=3D rtc.o
> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makef=
ile
> index 8a072cafd5..92418e3444 100644
> --- a/xen/arch/x86/hvm/svm/Makefile
> +++ b/xen/arch/x86/hvm/svm/Makefile
> @@ -2,6 +2,6 @@ obj-y +=3D asid.o
>  obj-y +=3D emulate.o
>  obj-bin-y +=3D entry.o
>  obj-y +=3D intr.o
> -obj-y +=3D nestedsvm.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nestedsvm.o
>  obj-y +=3D svm.o
>  obj-y +=3D vmcb.o
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/ne=
stedhvm.h
> index 9bfed5ffd7..a102c076ea 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -26,6 +26,13 @@
>  #define nsvm_efer_svm_enabled(v) \
>      (!!((v)->arch.hvm.guest_efer & EFER_SVME))
> =20
> +#define NSVM_INTR_NOTHANDLED     3
> +#define NSVM_INTR_NOTINTERCEPTED 2
> +#define NSVM_INTR_FORCEVMEXIT    1
> +#define NSVM_INTR_MASKED         0
> +
> +#ifdef CONFIG_NESTED_VIRT
> +
>  int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
>  void nestedsvm_vmexit_defer(struct vcpu *v,
>      uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
> @@ -57,13 +64,40 @@ int cf_check nsvm_hap_walk_L1_p2m(
>      struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *pag=
e_order,
>      uint8_t *p2m_acc, struct npfec npfec);
> =20
> -#define NSVM_INTR_NOTHANDLED     3
> -#define NSVM_INTR_NOTINTERCEPTED 2
> -#define NSVM_INTR_FORCEVMEXIT    1
> -#define NSVM_INTR_MASKED         0
> -
>  int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack i=
ntack);
> =20
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr=
)
> +{
> +    return 0;
> +}
> +static inline void nestedsvm_vmexit_defer(struct vcpu *v,
> +    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2) { }
> +static inline enum nestedhvm_vmexits nestedsvm_vmexit_n2n1(struct vcpu=
 *v,
> +    struct cpu_user_regs *regs)
> +{
> +    return NESTEDHVM_VMEXIT_ERROR;
> +}
> +static inline enum nestedhvm_vmexits nestedsvm_check_intercepts(struct=
 vcpu *v,
> +    struct cpu_user_regs *regs, uint64_t exitcode)
> +{
> +    return NESTEDHVM_VMEXIT_ERROR;
> +}
> +static inline void svm_nested_features_on_efer_update(struct vcpu *v) =
{ }
> +static inline void svm_vmexit_do_clgi(struct cpu_user_regs *regs,
> +                                      struct vcpu *v) { }
> +static inline void svm_vmexit_do_stgi(struct cpu_user_regs *regs,
> +                                       struct vcpu *v) { }
> +static inline bool nestedsvm_gif_isset(struct vcpu *v) { return true; =
}
> +static inline int nestedsvm_vcpu_interrupt(struct vcpu *v,
> +                                           const struct hvm_intack int=
ack)
> +{
> +    return NSVM_INTR_NOTINTERCEPTED;
> +}
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
> =20
>  /*
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..0234b57afb 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -46,6 +46,10 @@
> =20
>  void noreturn svm_asm_do_resume(void);
> =20
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nsvm_vcpu_switch(void) { }
> +#endif
> +
>  u32 svm_feature_flags;
> =20
>  /*
> @@ -2465,6 +2469,7 @@ static struct hvm_function_table __initdata_cf_cl=
obber svm_function_table =3D {
>      .set_rdtsc_exiting    =3D svm_set_rdtsc_exiting,
>      .get_insn_bytes       =3D svm_get_insn_bytes,
> =20
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise =3D nsvm_vcpu_initialise,
>      .nhvm_vcpu_destroy =3D nsvm_vcpu_destroy,
>      .nhvm_vcpu_reset =3D nsvm_vcpu_reset,
> @@ -2474,6 +2479,7 @@ static struct hvm_function_table __initdata_cf_cl=
obber svm_function_table =3D {
>      .nhvm_vmcx_hap_enabled =3D nsvm_vmcb_hap_enabled,
>      .nhvm_intr_blocked =3D nsvm_intr_blocked,
>      .nhvm_hap_walk_L1_p2m =3D nsvm_hap_walk_L1_p2m,
> +#endif
> =20
>      .get_reg =3D svm_get_reg,
>      .set_reg =3D svm_set_reg,
> diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makef=
ile
> index 04a29ce59d..902564b3e2 100644
> --- a/xen/arch/x86/hvm/vmx/Makefile
> +++ b/xen/arch/x86/hvm/vmx/Makefile
> @@ -3,4 +3,4 @@ obj-y +=3D intr.o
>  obj-y +=3D realmode.o
>  obj-y +=3D vmcs.o
>  obj-y +=3D vmx.o
> -obj-y +=3D vvmx.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D vvmx.o
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 82c55f49ae..252f27322b 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -55,6 +55,10 @@
>  #include <public/hvm/save.h>
>  #include <public/sched.h>
> =20
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nvmx_switch_guest(void) { }
> +#endif
> +
>  static bool __initdata opt_force_ept;
>  boolean_param("force-ept", opt_force_ept);
> =20
> @@ -2033,7 +2037,7 @@ static void nvmx_enqueue_n2_exceptions(struct vcp=
u *v,
>                   nvmx->intr.intr_info, nvmx->intr.error_code);
>  }
> =20
> -static int cf_check nvmx_vmexit_event(
> +static int cf_check __maybe_unused nvmx_vmexit_event(
>      struct vcpu *v, const struct x86_event *event)
>  {
>      nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
> @@ -2933,6 +2937,7 @@ static struct hvm_function_table __initdata_cf_cl=
obber vmx_function_table =3D {
>      .handle_cd            =3D vmx_handle_cd,
>      .set_info_guest       =3D vmx_set_info_guest,
>      .set_rdtsc_exiting    =3D vmx_set_rdtsc_exiting,
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise =3D nvmx_vcpu_initialise,
>      .nhvm_vcpu_destroy    =3D nvmx_vcpu_destroy,
>      .nhvm_vcpu_reset      =3D nvmx_vcpu_reset,
> @@ -2942,8 +2947,9 @@ static struct hvm_function_table __initdata_cf_cl=
obber vmx_function_table =3D {
>      .nhvm_vcpu_vmexit_event =3D nvmx_vmexit_event,
>      .nhvm_intr_blocked    =3D nvmx_intr_blocked,
>      .nhvm_domain_relinquish_resources =3D nvmx_domain_relinquish_resou=
rces,
> -    .update_vlapic_mode =3D vmx_vlapic_msr_changed,
>      .nhvm_hap_walk_L1_p2m =3D nvmx_hap_walk_L1_p2m,
> +#endif
> +    .update_vlapic_mode =3D vmx_vlapic_msr_changed,
>  #ifdef CONFIG_VM_EVENT
>      .enable_msr_interception =3D vmx_enable_msr_interception,
>  #endif
> diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/in=
clude/asm/hvm/nestedhvm.h
> index ea2c1bc328..0372974b24 100644
> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
>  /* Nested HVM on/off per domain */
>  static inline bool nestedhvm_enabled(const struct domain *d)
>  {
> -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nest=
ed_virt);
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> +           (d->options & XEN_DOMCTL_CDF_nested_virt);
>  }
> =20
> +/* Nested paging */
> +#define NESTEDHVM_PAGEFAULT_DONE       0
> +#define NESTEDHVM_PAGEFAULT_INJECT     1
> +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> +#define NESTEDHVM_PAGEFAULT_MMIO       4
> +#define NESTEDHVM_PAGEFAULT_RETRY      5
> +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> +
> +#ifdef CONFIG_NESTED_VIRT
> +
>  /* Nested VCPU */
>  int nestedhvm_vcpu_initialise(struct vcpu *v);
>  void nestedhvm_vcpu_destroy(struct vcpu *v);
> @@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
>  #define nestedhvm_vcpu_exit_guestmode(v)  \
>      vcpu_nestedhvm(v).nv_guestmode =3D 0
> =20
> -/* Nested paging */
> -#define NESTEDHVM_PAGEFAULT_DONE       0
> -#define NESTEDHVM_PAGEFAULT_INJECT     1
> -#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> -#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> -#define NESTEDHVM_PAGEFAULT_MMIO       4
> -#define NESTEDHVM_PAGEFAULT_RETRY      5
> -#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
>  int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
>                                      struct npfec npfec);
> =20
> @@ -59,6 +63,25 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_=
80, bool ioport_ed);
> =20
>  void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
> =20
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline int nestedhvm_vcpu_initialise(struct vcpu *v) { return 0=
; }
> +static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }
> +static inline void nestedhvm_vcpu_reset(struct vcpu *v) { }
> +static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { retur=
n false; }
> +static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, padd=
r_t *L2_gpa,
> +                                                  struct npfec npfec)
> +{
> +    return NESTEDHVM_PAGEFAULT_L0_ERROR;
> +}
> +#define nestedhvm_vcpu_enter_guestmode(v) do { } while (0)
> +#define nestedhvm_vcpu_exit_guestmode(v)  do { } while (0)
> +#define nestedhvm_paging_mode_hap(v) false
> +#define nestedhvm_vmswitch_in_progress(v) false
> +static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m) { }=

> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  static inline bool nestedhvm_is_n2(struct vcpu *v)
>  {
>      if ( !nestedhvm_enabled(v->domain) ||
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/inc=
lude/asm/hvm/vmx/vvmx.h
> index da10d3fa96..8dc876a4c2 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> @@ -73,6 +73,8 @@ union vmx_inst_info {
>      u32 word;
>  };
> =20
> +#ifdef CONFIG_NESTED_VIRT
> +
>  int cf_check nvmx_vcpu_initialise(struct vcpu *v);
>  void cf_check nvmx_vcpu_destroy(struct vcpu *v);
>  int cf_check nvmx_vcpu_reset(struct vcpu *v);
> @@ -199,5 +201,33 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2=
ga,
>                          uint64_t *exit_qual, uint32_t *exit_reason);
>  int nvmx_cpu_up_prepare(unsigned int cpu);
>  void nvmx_cpu_dead(unsigned int cpu);
> +
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline void nvmx_update_exec_control(struct vcpu *v, u32 value)=
 { }
> +static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
> +                                                      unsigned long va=
lue) { }
> +static inline void nvmx_update_exception_bitmap(struct vcpu *v,
> +                                                unsigned long value) {=
 }
> +static inline u64 nvmx_get_tsc_offset(struct vcpu *v) { return 0; }
> +static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned in=
t cr) { }
> +static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned =
int vector,
> +                                             int error_code) { return =
false; }
> +static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
> +                                         unsigned int exit_reason) { r=
eturn 0; }
> +static inline void nvmx_idtv_handling(void) { }
> +static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_c=
ontent)
> +{
> +    return 0;
> +}
> +static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
> +                                       unsigned int exit_reason) { ret=
urn 0; }
> +static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
> +static inline void nvmx_cpu_dead(unsigned int cpu) { }
> +
> +#define get_vvmcs(vcpu, encoding) 0
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  #endif /* __ASM_X86_HVM_VVMX_H__ */
> =20
> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> index 960f6e8409..aa15811c2e 100644
> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -7,7 +7,7 @@ obj-$(CONFIG_SHADOW_PAGING) +=3D guest_walk_4.o
>  obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
>  obj-$(CONFIG_MEM_PAGING) +=3D mem_paging.o
>  obj-$(CONFIG_MEM_SHARING) +=3D mem_sharing.o
> -obj-$(CONFIG_HVM) +=3D nested.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nested.o
>  obj-$(CONFIG_HVM) +=3D p2m.o
>  obj-y +=3D p2m-basic.o
>  obj-$(CONFIG_INTEL_VMX) +=3D p2m-ept.o
> diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefil=
e
> index 67c29b2162..de1bb3abde 100644
> --- a/xen/arch/x86/mm/hap/Makefile
> +++ b/xen/arch/x86/mm/hap/Makefile
> @@ -2,5 +2,5 @@ obj-y +=3D hap.o
>  obj-y +=3D guest_walk_2.o
>  obj-y +=3D guest_walk_3.o
>  obj-y +=3D guest_walk_4.o
> -obj-y +=3D nested_hap.o
> -obj-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nested_hap.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nested_ept.o
> diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
> index 635f5a7f45..fa14e69fff 100644
> --- a/xen/arch/x86/mm/p2m.h
> +++ b/xen/arch/x86/mm/p2m.h
> @@ -25,9 +25,15 @@ void p2m_teardown_altp2m(struct domain *d);
>  void p2m_flush_table_locked(struct p2m_domain *p2m);
>  int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, m=
fn_t mfn,
>                                    unsigned int page_order);
> +#ifdef CONFIG_NESTED_VIRT
>  void p2m_nestedp2m_init(struct p2m_domain *p2m);
>  int p2m_init_nestedp2m(struct domain *d);
>  void p2m_teardown_nestedp2m(struct domain *d);
> +#else
> +static inline void p2m_nestedp2m_init(struct p2m_domain *p2m) {}
> +static inline int p2m_init_nestedp2m(struct domain *d) { return 0; }
> +static inline void p2m_teardown_nestedp2m(struct domain *d) {}
> +#endif
> =20
>  int ept_p2m_init(struct p2m_domain *p2m);
>  void ept_p2m_uninit(struct p2m_domain *p2m);


--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------KMH2SnAkdI0syJl1OX08h0VV
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

--------------KMH2SnAkdI0syJl1OX08h0VV--

--------------v48DdQMR4cnFttR0UBVN0Ytc--

--------------3hJUj1mq3NnE0FFYrRZNdcQK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmmFaQIACgkQszaHOrMp
8lMd3A/+KVfsztMeU2Ir8LY3A1KdA+79l8jSu8zvhrYnAdjzFv1tRmMSqRkaSAA7
8DSMp8bvlDwR3uIAsM3IncfHA9fWGUYuejwZL5UreIAfoIsAJaVYiDTTIuNp7fpt
rE2mbl5FwomQ/vVAnmJ6MfajXL9k5I39DuP2mGOqkjsOkrrFtiFfQDWMY/+dh1lE
Nu0cBDxLt32jmfzO75XVopXhUL16iwK1B8qrO6JmQ1I55VFOeDlPWxpPRLMvNkCq
13l99RZub4iBRDfI/ZkYJ3e5n6PvZCd/cVkr6lL8I1mKcI4Q0VZHF5LfI0WLThiC
qr2TDTtJyMu6CfabpKbkxG20yteExLqIr5GcHqcOgWU9S2SqPOUK9D0am1JFROkv
Ps5cAjKReMoIN5LGuephLj3/dkW5BwrAOGnkLwnxxk71cKgLEnpCurOs8e3oF2Gs
lW4joIC7otjBBOTPpu96r/q/WtYqcnym9PTsW2TQ/7vMl+FQmOrpR7Ta4BD0VvXz
y+qnb2UQAJHNOEvIxTBOayF3R880KxlugdId/PXcVJJ3F3QwIuYGN6XnWxPArn1l
mmLv0AYXUvgh2v4g05Z7aoTMyeommWVAzWqbrvJGkg06C/OFOYSMvWlxfkDRlhfO
1BjopWSsYUczy3crtAHbo1LKOEPxIX/hq95ZH8uySfM/xeonfAE=
=n5kT
-----END PGP SIGNATURE-----

--------------3hJUj1mq3NnE0FFYrRZNdcQK--

