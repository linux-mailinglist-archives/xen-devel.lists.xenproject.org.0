Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B038AAB37B7
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 14:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981413.1367809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESbh-0003Uw-Vf; Mon, 12 May 2025 12:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981413.1367809; Mon, 12 May 2025 12:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESbh-0003T2-SZ; Mon, 12 May 2025 12:50:09 +0000
Received: by outflank-mailman (input) for mailman id 981413;
 Mon, 12 May 2025 12:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uESbf-0003Sw-VQ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 12:50:07 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f5d417a-2f2f-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 14:50:03 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so403770766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 05:50:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5feadd3957csm861144a12.67.2025.05.12.05.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:50:03 -0700 (PDT)
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
X-Inumbo-ID: 9f5d417a-2f2f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747054203; x=1747659003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S0ioB1iR1WhfTmkMqK6KLIKAn8Qei79H7hXjbIZsKLQ=;
        b=exkJeA+o/DpeKRwpLAO1rPtES7x9YcmPG6dH244MQ+kVmu5My2SKditxrMdBcMcHaQ
         UtcExnP2l62X8tDwKH0+n/GQMBaJEXNkVQOhTxCWqQ4qO0/5tAJD05Bl0N4jNR2VOKk/
         f8ktjVrfWN8tEwMjPl39BiT4+n70Rs1x6SRwDv362ObVTgBEv3Nj91EeVe2pzlsxbF5T
         wEjogCxF3ok8LvVu6EYNIfhdMmCIlqRQ/Z0Ahi+/4yinITU+EQB0wi9m5NXByuAPUzUZ
         UOtiepolJY/e9oVRS8hcDipQARwHRrskyEe1jmaZXWCoC2Gxv4U6f6bq7HnQmzAqa8GC
         u/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747054203; x=1747659003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0ioB1iR1WhfTmkMqK6KLIKAn8Qei79H7hXjbIZsKLQ=;
        b=hh8wYmBf9IlPmKBTps9LN/jhG8TdDZaroTDXGSQVIMRvJ2fc086InZgY2L0y7sYrzU
         N6SQT/cj92ksV7T24918UxWoSk0vcU3mKhrhDMPa++EcDEYAAxlTyvGnKjcvwqJEqa7R
         CkKLw+Fg7pkD3mAbt6WZoZU3EGX27DnWFoj33zz0qSinzm5gMK/2o/F5d27DFFCbfzdV
         OSJ4u8FXbJIRXqkLg+WxZNPuFTI9yNuq/ypy3Hxrhy0cLlafv9WTKPJd8av0jIx1FFCz
         /gBPLEd/DI70ICnnp3f85/j+dgci+UeysVGwI/3Nr8g619VFfrBPhG6daWom8rj9Uohl
         xYqg==
X-Forwarded-Encrypted: i=1; AJvYcCWA2c5zwnrr++J2vc788ULZPLfps8FKcdEsGeGe8EwC26utHTjtoaVL0ae/ExjYUCYkrmp1xegb+gQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVQYmyyeeC69SSx1hOk41zDLixpM6jmhjCayoW4njTwMQZauan
	xzNLmTFHLaFoygmF7n5PH/T0Qf8RHifDxaE/wdq4ue28mMP3iLhu3uLfbuXDUA==
X-Gm-Gg: ASbGnctgu63Y2DpdKAUOv4gUJ2ksh58Znb3t4Yu2I8mdg/YCBUV9tXRLizRxGQUBy9l
	ckgLY1R4Cs23tw4QONTWfCIHfLZp0xAA/dit5NWtL2uPsHG46dHt7kVwIwX4J3+pFcL+/+Zy1UH
	NtQyYAverfwdVN5U3ynoU4DLM3iYx8PZsXZhyGxYeKZq/qENOuP90KaB8gYrAKO+cnF919nUNcl
	eeOwlSR505OUw+C6IQldfpF0LQCB07wPIpzXPQPwZPjsJQNIgFVIHZuCmNU+rZRmLM70ym11His
	dfxAhZQeiBODZsMOl1C8GM2PNgAYfmY4mCe1yH99+bHQQzzQ7Rsn5waJSiyRmmtEVRsvTElitev
	fwJ+pI+Zo+A2C0Om8t70Q3sfsPgTsnVqGoZds
X-Google-Smtp-Source: AGHT+IGVbY5dubBblAP8L8MAyl12o4+2CKgR0f1CEHrXUUeHAOCdON8jlov9lv3EMiHcPzu4PdvX0w==
X-Received: by 2002:a17:907:8990:b0:ad2:2ba6:2012 with SMTP id a640c23a62f3a-ad22ba6342fmr857521766b.11.1747054203453;
        Mon, 12 May 2025 05:50:03 -0700 (PDT)
Message-ID: <edcea288-cd02-4bdd-aa64-33a0151fd790@suse.com>
Date: Mon, 12 May 2025 14:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] livepatch: Embed public key in Xen
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Kevin Lampis <klampis@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <20250506143218.1782603-4-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250506143218.1782603-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 16:32, Ross Lagerwall wrote:
> From: Kevin Lampis <klampis@cloud.com>
> 
> Make it possible to embed a public key in Xen to be used when verifying
> live patch payloads. Inclusion of the public key is optional.
> 
> To avoid needing to include a DER / X.509 parser in the hypervisor, the
> public key is unpacked at build time and included in a form that is
> convenient for the hypervisor to consume. This is different approach
> from that used by Linux which embeds the entire X.509 certificate and
> builds in a parser for it.
> 
> A suitable key can be created using openssl:
> 
> openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
>     -sha256 -days 3650 -nodes \
>     -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
> openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out crypto/signing_key.pem

According to this the .pem file isn't really a source one; how does ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -481,6 +481,24 @@ config LIVEPATCH
>  
>  	  If unsure, say Y.
>  
> +config PAYLOAD_SIGNING
> +	bool "Verify signed LivePatch payloads"
> +	depends on LIVEPATCH
> +	select CRYPTO
> +	help
> +	  Verify signed LivePatch payloads using an RSA public key built
> +	  into the Xen hypervisor. Selecting this option requires a
> +	  public key in PEM format to be available for embedding during
> +	  the build.
> +
> +config PAYLOAD_SIG_KEY
> +	string "File name of payload signing public key"
> +	default "signing_key.pem"

... this work in an out-of-tree build?

> +	depends on PAYLOAD_SIGNING

As to the name of this: According to its description, it's signature
verification, not signing. I think this wants reflecting in the name.

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -28,7 +28,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-$(CONFIG_VM_EVENT) += mem_access.o
>  obj-y += memory.o
> -obj-y += mpi.o
> +obj-$(CONFIG_PAYLOAD_SIGNING) += mpi.o

Looks like the Kconfig symbol then wants introducing in the earlier
patch, or as a prereq thereto.

> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -11,6 +11,8 @@
>  #include <xen/lib.h>
>  #include <xen/list.h>
>  #include <xen/mm.h>
> +#include <xen/mpi.h>
> +#include <xen/rsa.h>
>  #include <xen/sched.h>
>  #include <xen/smp.h>
>  #include <xen/softirq.h>
> @@ -73,6 +75,12 @@ static struct livepatch_work livepatch_work;
>  static DEFINE_PER_CPU(bool, work_to_do);
>  static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
>  
> +#ifdef CONFIG_PAYLOAD_SIGNING
> +/* The public key contained with Xen used to verify payload signatures. */
> +extern const uint8_t xen_livepatch_key_data[];

Iirc Misra demands that declarations appear in headers.

> +static struct rsa_public_key builtin_payload_key;
> +#endif
> +
>  static int get_name(const struct xen_livepatch_name *name, char *n)
>  {
>      if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
> @@ -2287,6 +2295,34 @@ static void cf_check livepatch_printall(unsigned char key)
>      spin_unlock(&payload_lock);
>  }
>  
> +#ifdef CONFIG_PAYLOAD_SIGNING

Nit: The #ifdef would better appear inside the function body, to
reduce redundancy.

> +static int __init load_builtin_payload_key(void)
> +{
> +    const uint8_t *ptr;
> +    uint32_t len;
> +
> +    rsa_public_key_init(&builtin_payload_key);
> +
> +    ptr = xen_livepatch_key_data;

This being the sole place where the array is used, ...

> @@ -2305,6 +2341,11 @@ static struct notifier_block cpu_nfb = {
>  static int __init cf_check livepatch_init(void)
>  {
>      unsigned int cpu;
> +    int err;
> +
> +    err = load_builtin_payload_key();
> +    if (err)

(Nit: style)

> --- a/xen/crypto/Makefile
> +++ b/xen/crypto/Makefile
> @@ -1,3 +1,15 @@
>  obj-y += rijndael.o
> -obj-y += rsa.o
> +obj-$(CONFIG_PAYLOAD_SIGNING) += rsa.o
>  obj-y += vmac.o
> +
> +obj-$(CONFIG_PAYLOAD_SIGNING) += builtin_payload_key.o
> +
> +ifeq ($(CONFIG_PAYLOAD_SIGNING),y)
> +key_path := $(srctree)/crypto/$(patsubst "%",%,$(CONFIG_PAYLOAD_SIG_KEY))
> +$(obj)/builtin_payload_key.bin: $(key_path) $(srctree)/tools/extract-key.py
> +	$(srctree)/tools/extract-key.py < $< > $@.new
> +	$(call move-if-changed,$@.new,$@)
> +
> +$(obj)/builtin_payload_key.S: $(srctree)/tools/binfile $(obj)/builtin_payload_key.bin FORCE
> +	$(call if_changed,binfile,$(obj)/builtin_payload_key.bin xen_livepatch_key_data)

... arrangements want making for the array to live ideally in .init.rodata,
but at least somewhere in .init.*. E.g. by passing -i to tools/binfile.

Jan

