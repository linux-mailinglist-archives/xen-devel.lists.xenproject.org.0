Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B790B387
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 17:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742463.1149271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJE0E-0000Wj-KY; Mon, 17 Jun 2024 15:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742463.1149271; Mon, 17 Jun 2024 15:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJE0E-0000UW-HG; Mon, 17 Jun 2024 15:10:38 +0000
Received: by outflank-mailman (input) for mailman id 742463;
 Mon, 17 Jun 2024 15:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJE0C-0000UO-GN
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 15:10:36 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf50c465-2cbb-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 17:10:35 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so4550625a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 08:10:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da790sm6525691a12.35.2024.06.17.08.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 08:10:34 -0700 (PDT)
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
X-Inumbo-ID: bf50c465-2cbb-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718637035; x=1719241835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t2zsxTeXKA4vIeerirtdfv0KCg0uCuxRjr/Gi/36UOE=;
        b=Uad1Hv1+jE4VnM1cQZxUHG0Nkdiv2pDJI/AishzPk99no1IPD59Ww4Vt0NUXAA1gbp
         OgRppdTSdBseTWswWeMcK7JXsXBRTwbGPQIMad2clxtV1QA60kz5UTsIPo7JaRQgPJGi
         8NsZdX1aNmmJP48DcaoOuW8zMXETOlq4zS3AWPw26DqsnjShVbYXPtO48+ySI6WmCy17
         dR2++nHs/M1b2seAqKO+cvOmjuhYYgmds1RnrVQ2s6yqxOafHIxn1XyUtP16wijUg6Ku
         4kdYdCJVYfb/10aPENlmKed/sr6+LCBD8yHHQw9tbe/tPCWDjsVlkeJMObvQK4rrNuBb
         FRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718637035; x=1719241835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2zsxTeXKA4vIeerirtdfv0KCg0uCuxRjr/Gi/36UOE=;
        b=Hv0xC618DoASaPFPdT7I+sb+UxB94KWi4YIzVo8KqACxppvYM3uDAxoO/D7Uf5n+Os
         UyG73K7AW9tPzUnMSkOq4R8RjFM6L8fQTxq+0hQTrGq4XixlBLs67uKCA6T+Dl/w9XJ0
         EJgC3IyLdRgFxb3WVpKwzgi0TKmuht2oE0MPwzWMHrPpWrjDwE1aVplEeNvbDy8XeFIJ
         ewfD6PSSE/oHvgRudbagaG7jHpdoA17fgndz5V8LfOf20UYQ6bUx7ZCr5n92cHtoaOc0
         DWQllws+LldoLMXhFE+nCvFzLDdruqMDvqlm60Ea/4+GWKIBS6zIA9nS98dh7T96z791
         Zx+w==
X-Forwarded-Encrypted: i=1; AJvYcCXNIK2aHiwW08f6MQcaCjWAXSkRoSNOP9/tsYF4OeJzFkkvfGSgTal4b6xdngklG0pPituA6MfaL6XAmgVFUkJcZFljXO+y5bJ1InKVXyU=
X-Gm-Message-State: AOJu0YxYBkaEXlV40HiBG46rR1iR9J0so7xgwWzDcI6NUOh6L1cU9hH4
	t36yfGhrrN2F0WytI3NIQB7vS64PWBK/hBLeCTHb/JODcl2KXB1/5Bge3Q1jGQ==
X-Google-Smtp-Source: AGHT+IGfEAbpawAR0GiW7E9D6iKEGn4mumolRoVN8odrjpiI4CJZQopL3e7i75xvPYJxOBte7DfFzA==
X-Received: by 2002:a05:6402:2293:b0:57c:c125:d638 with SMTP id 4fb4d7f45d1cf-57cc125dc2fmr7346644a12.39.1718637034743;
        Mon, 17 Jun 2024 08:10:34 -0700 (PDT)
Message-ID: <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
Date: Mon, 17 Jun 2024 17:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-5-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240617090035.839640-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 11:00, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> irq number is alloced from small to large, but the applying
> gsi number is not, may gsi 38 comes before gsi 28, that
> causes the irq number is not equal with the gsi number.

Hmm, see my earlier explanations on patch 5: GSI and IRQ generally aren't
the same anyway. Therefore this part of the description, while not wrong,
is at least at risk of misleading people.

> --- a/tools/include/xen-sys/Linux/privcmd.h
> +++ b/tools/include/xen-sys/Linux/privcmd.h
> @@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
>  	__u64 addr;
>  } privcmd_mmap_resource_t;
>  
> +typedef struct privcmd_gsi_from_dev {
> +	__u32 sbdf;

That's PCI-centric, without struct and IOCTL names reflecting this fact.

> +	int gsi;

Is "int" legitimate to use here? Doesn't this want to similarly be __u32?

> --- a/tools/include/xencall.h
> +++ b/tools/include/xencall.h
> @@ -113,6 +113,8 @@ int xencall5(xencall_handle *xcall, unsigned int op,
>               uint64_t arg1, uint64_t arg2, uint64_t arg3,
>               uint64_t arg4, uint64_t arg5);
>  
> +int xen_oscall_gsi_from_dev(xencall_handle *xcall, unsigned int sbdf);

Hmm, something (by name at least) OS-specific being in the public header
and ...

> --- a/tools/libs/call/libxencall.map
> +++ b/tools/libs/call/libxencall.map
> @@ -10,6 +10,8 @@ VERS_1.0 {
>  		xencall4;
>  		xencall5;
>  
> +		xen_oscall_gsi_from_dev;

... map file. I'm not sure things are intended to be this way.

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1406,6 +1406,12 @@ static bool pci_supp_legacy_irq(void)
>  #endif
>  }
>  
> +#define PCI_DEVID(bus, devfn)\
> +            ((((uint16_t)(bus)) << 8) | ((devfn) & 0xff))
> +
> +#define PCI_SBDF(seg, bus, devfn) \
> +            ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))

I'm not a maintainer of this file; if I were, I'd ask that for readability's
sake all excess parentheses be dropped from these.

> @@ -1486,6 +1496,18 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +#ifdef CONFIG_X86
> +        sbdf = PCI_SBDF(pci->domain, pci->bus,
> +                        (PCI_DEVFN(pci->dev, pci->func)));
> +        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
> +        /*
> +         * Old kernel version may not support this function,

Just kernel?

> +         * so if fail, keep using irq; if success, use gsi
> +         */
> +        if (gsi > 0) {
> +            irq = gsi;

I'm still puzzled by this, when by now I think we've sufficiently clarified
that IRQs and GSIs use two distinct numbering spaces.

Also, as previously indicated, you call this for PV Dom0 as well. Aiui on
the assumption that it'll fail. What if we decide to make the functionality
available there, too (if only for informational purposes, or for
consistency)? Suddenly you're fallback logic wouldn't work anymore, and
you'd call ...

> +        }
> +#endif
>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);

... the function with a GSI when a pIRQ is meant. Imo, as suggested before,
you strictly want to avoid the call on PV Dom0.

Also for PVH Dom0: I don't think I've seen changes to the hypercall
handling, yet. How can that be when GSI and IRQ aren't the same, and hence
incoming GSI would need translating to IRQ somewhere? I can once again only
assume all your testing was done with IRQs whose numbers happened to match
their GSI numbers. (The difference, imo, would also need calling out in the
public header, where the respective interface struct(s) is/are defined.)

Jan

