Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF7A079F0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 15:58:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868498.1280003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtzV-0005ND-Pk; Thu, 09 Jan 2025 14:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868498.1280003; Thu, 09 Jan 2025 14:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtzV-0005LC-MG; Thu, 09 Jan 2025 14:58:33 +0000
Received: by outflank-mailman (input) for mailman id 868498;
 Thu, 09 Jan 2025 14:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl7y=UB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVtzU-0005Ka-Jh
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 14:58:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3107f575-ce9a-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 15:58:31 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436202dd730so8127335e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 06:58:31 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b81a4sm2074055f8f.68.2025.01.09.06.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:58:30 -0800 (PST)
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
X-Inumbo-ID: 3107f575-ce9a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736434711; x=1737039511; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIHtCee8g74rYH44CdFX4zt4/GVSLWGVRC0fcWc0PGM=;
        b=BxObF20Uynyv8OCz8Qip66c/JZ4S1ztocE1ELAvdwfOzlhO6UY8yC7JOTncyz5VS4Y
         pau9g++RvCO2wOmu72/01ITe8IKNU2o8ifajw9noJBzUcwZlGk7KAuxYPrvlV+OGVOdG
         d1zucIMrUadHEhTwLxuCQHpMLvOKuQe2+BAQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736434711; x=1737039511;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wIHtCee8g74rYH44CdFX4zt4/GVSLWGVRC0fcWc0PGM=;
        b=C8TTdqeykTLt1fuKuwl0nMChtkl8fOH18mSW/YtUwh6Xg6ynjQnG+7h0DBF7IzZkdz
         KhwHqCAE2tvJvHOs2Mb9Hh585McoS/UWGCFd9h6DqLfYy6viMhYCg+uOVhr+Cmv3ze3G
         9ihw+WYQqTJG+D/FRRg4KZuqzgQ+3FuIGx9KwXE6PFK4OBeDjYlwPLAJpxLN4utiUf+i
         yTZzxo2WzvWjKPocosSlRt/ofTvLj9bD8KXPrCNYfQSPQsdX7ZODQLghLt6dkF9MfpMs
         OQuQmz9YUfXbWITrfsLRMOk/NwMAfxhw5ujqdqpCJvr5HB6U9sevvpSqda5RaQPqB2Y1
         ggfg==
X-Forwarded-Encrypted: i=1; AJvYcCX1+dS3TZwm69TUEnEwhtIL2Wg2OI6rlFKpJr8vR3hGtxZijDhkP3aHK26mPEgV1omnGHGuZEsqXCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyECJKhgw+WBifrNvVxvhomRu/RCK50bQqzgwJCy2d0EJxItXvO
	CxgFIQGqXsLF5QoHqjQbK9Ey9TNSkZznh1dVkp9Su0/Nntcl7ClXlFvGToOEJRc=
X-Gm-Gg: ASbGncsR3vjySuAyQLK10GH15DNCaGrJ+gXVsqaDSgdp4bu7jR34No223GA1uZTKKew
	GMNwq/d4E+N7JtdOZa25n40R0kjS2VIBT4PSyZDPVIxWsEq5F804+c9w1sfNhDH+QOAfv1l2n0M
	qSx/RXrCU9m9eUXkRWliqO2zQsKvoCPAmmuWWU1poQXC9n7OEfg74iZOdSI78fQnXnah7PrpzyQ
	d3iCl+/jeT9F3veB7sS96P+gL+ipB8zvwuWjdDBjVIFJT6AdDJX7rLIZP6+mx4=
X-Google-Smtp-Source: AGHT+IHeLofrEONqwfSXz84WNyTBj7fulmWfkKJdK9d3DutVFytCqx8AUo/ouTN2xB5jqPb44r2CgQ==
X-Received: by 2002:a05:6000:1a8d:b0:385:ed1e:2105 with SMTP id ffacd0b85a97d-38a8730ae10mr6407064f8f.26.1736434710999;
        Thu, 09 Jan 2025 06:58:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 14:58:29 +0000
Message-Id: <D6XMQD34DXRE.24L7RC2WUI298@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 13/18] x86/spec-ctrl: introduce Address Space
 Isolation command line option
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-14-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-14-roger.pau@citrix.com>

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> No functional change, as the option is not used.
>
> Introduced new so newly added functionality is keyed on the option being
> enabled, even if the feature is non-functional.
>
> When ASI is enabled for PV domains, printing the usage of XPTI might be
> omitted if it must be uniformly disabled given the usage of ASI.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Improve comments and documentation about what ASI provides.
>  - Do not print the XPTI information if ASI is used for pv domUs and dom0=
 is
>    PVH, or if ASI is used for both domU and dom0.
>
> FWIW, I would print the state of XPTI uniformly, as otherwise I find the =
output
> might be confusing for user expecting to assert the state of XPTI.
> ---
>  docs/misc/xen-command-line.pandoc    |  19 +++++
>  xen/arch/x86/include/asm/domain.h    |   3 +
>  xen/arch/x86/include/asm/spec_ctrl.h |   2 +
>  xen/arch/x86/spec_ctrl.c             | 115 +++++++++++++++++++++++++--
>  4 files changed, 133 insertions(+), 6 deletions(-)
>
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 08b0053f9ced..3c1ad7b5fe7d 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -202,6 +202,25 @@ to appropriate auditing by Xen.  Argo is disabled by=
 default.
>      This option is disabled by default, to protect domains from a DoS by=
 a
>      buggy or malicious other domain spamming the ring.
> =20
> +### asi (x86)
> +> `=3D List of [ <bool>, {pv,hvm}=3D<bool>,
> +               {vcpu-pt}=3D<bool>|{pv,hvm}=3D<bool> ]`

nit: While this grows later, the braces around vcpu-pt aren't strictly need=
ed here.

> +
> +Offers control over whether the hypervisor will engage in Address Space
> +Isolation, by not having potentially sensitive information permanently m=
apped
> +in the VMM page-tables.  Using this option might avoid the need to apply
> +mitigations for certain speculative related attacks, at the cost of mapp=
ing
> +sensitive information on-demand.

Might be worth mentioning that this provides some defense in depth against
unmitigated attacks too.

> +
> +* `pv=3D` and `hvm=3D` sub-options allow enabling for specific guest typ=
es.
> +
> +**WARNING: manual de-selection of enabled options will invalidate any
> +protection offered by the feature.  The fine grained options provided be=
low are
> +meant to be used for debugging purposes only.**
> +
> +* `vcpu-pt` ensure each vCPU uses a unique top-level page-table and setu=
p a
> +  virtual address space region to map memory on a per-vCPU basis.
> +
>  ### asid (x86)
>  > `=3D <boolean>`
> =20
> diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> index ced84750015c..9463a8624701 100644
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -2075,6 +2165,19 @@ void __init init_speculation_mitigations(void)
>           hw_smt_enabled && default_xen_spec_ctrl )
>          setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
> =20
> +    /* Disable all ASI options by default until feature is finished. */
> +    if ( opt_vcpu_pt_pv =3D=3D -1 )
> +        opt_vcpu_pt_pv =3D 0;
> +    if ( opt_vcpu_pt_hwdom =3D=3D -1 )
> +        opt_vcpu_pt_hwdom =3D 0;
> +    if ( opt_vcpu_pt_hvm =3D=3D -1 )
> +        opt_vcpu_pt_hvm =3D 0;

Why not preinitialise them to zero instead in the static declarations?

> +
> +    if ( opt_vcpu_pt_pv || opt_vcpu_pt_hvm )
> +        warning_add(
> +            "Address Space Isolation is not functional, this option is\n=
"
> +            "intended to be used only for development purposes.\n");
> +
>      xpti_init_default();
> =20
>      l1tf_calculations();

Cheers,
Alejandro

