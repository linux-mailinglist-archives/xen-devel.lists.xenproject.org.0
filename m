Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89734B2F355
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 11:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088262.1446025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1HG-0006dt-O8; Thu, 21 Aug 2025 09:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088262.1446025; Thu, 21 Aug 2025 09:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1HG-0006al-Km; Thu, 21 Aug 2025 09:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1088262;
 Thu, 21 Aug 2025 09:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up1HF-0006af-28
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 09:08:09 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a646c38-7e6e-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 11:08:07 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6188b7550c0so1146173a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 02:08:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a758bedf1sm4756282a12.52.2025.08.21.02.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 02:08:06 -0700 (PDT)
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
X-Inumbo-ID: 5a646c38-7e6e-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755767287; x=1756372087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hSAGfWHiSTq6a2buNbs69CsavGFojiL0rmGC11x6+cg=;
        b=UwXAEkeCAlgfqbPM++iAvESGCf/JbAx++nU+SuFa2I/1+EIo9nOd+KUOA4Pmvflo3g
         ktP2baNhxemqrQbL2a+5wIoGbZo/QIeJyya1+HXJndH8h+fIi7Qkn8fjC1TtC71Rrlbb
         Bt35sA21Bdy9fgQznnnx/5A/auGIs+EaH0jNVPvXKneo73QgDR1oVcEfeCOe1Hamhodd
         +9FESHm1xYmZXtPjVryLxOI7koBltQsRchTAWJ6o86swT5sami2OWXp+sjczx89eZU+t
         TOnH2jBmpTbApi/5XDRZ8wGg90T7g1Ikq2KYibq5VwZlD6D8Y2cCc1eik5zU1kivSO+4
         P+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755767287; x=1756372087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSAGfWHiSTq6a2buNbs69CsavGFojiL0rmGC11x6+cg=;
        b=fxEP0BDpxCGlZEGml+8vNjr1og6orUqtKQ0+uinhXURdcNhSF+VZfofWISZS2OufPP
         MsVVeG+IjWEIk7wek98jsaOfDFp0eRoe9P1nJ1fcermdVKkNt54uhtNGma1UcMYo4X9W
         4wtGnqJI5gMHFZKyvyuSNiW6lg8DUFy+LT9QG215y4Fu/s8QehT4PHOdIbNbLdNtXnJp
         QHfRfbwLa0L0D+SrqSeDhIwCQjLjPgfl4WZflhnPm07aneYc9P77lvdm6FlwZ6N8TXUZ
         fhI9X9fInwVtRj7hgGXTXqyzhfMnk2sW8PwyglI0tPZERDzSZHYVRJUd4FShWh19SmM8
         o5/w==
X-Forwarded-Encrypted: i=1; AJvYcCVuBB/iNzde0LVdAagq12Gw6PPTSQNlH9zqdSgwjIcHLC2cHMDtFr9EMpTZv113Ytgn12ZMS4B+Dvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBGzY/viWatVX/hBj3eqO5RRlSaO7zDDf4GZ3OSbvJ+u/doAUe
	gEIgkevsPSkeE2BmNDBhhF1E4tBu1+cTPriG5eINyJvUf2H5StWCV8LI5jrNBZobsg==
X-Gm-Gg: ASbGncu6zVuhufvXMoqmw3nxwJYNNmQ0at+Ryt9l8WoZfKSqtm4OVODUTFRvesxNFFI
	CKlJon1Qr+T0fDELrDWdzG9bQfAaGZYYaymYcLVvWCfguf0kZmb1caz4eGoFuhLnSOJuegL+LpN
	qCnBg7Bv/jUoQqzwG1ufzERKi5AJQg5XHIdj+f5wUmsyGP2+jPLjQFZrjXcR8NDca1A/MT4oFNP
	jMmeCMy2ROUlgVJnC/gQnuW+mSYd4dA+XcQdWOEzepYe8IoS1PDQRNX9o8B+2b7xk114s07g5cg
	p73McFzvNFYsUcSmjJNu2Xi+q+MbBfczln6buys6KM8GwyGXWvckARPXEblJJVUNO3a0TIj582b
	GnPhetOH/WYn7ZDVaWfTzVDH/VZtc0IuHfoWVcywKe9OJuMqErNWheQl9gDwuN4enGthReroYeu
	MNs4u0SCYXd+DvZdMVwSxaT4mmEylk
X-Google-Smtp-Source: AGHT+IGM/hm3s9vS1+Hszm9PhpkIJIY/xzFTS/1zS6ETSaY+Exdg4sahhw8IVA5hszSye6IAmfdrBw==
X-Received: by 2002:a05:6402:3590:b0:617:b2aa:576a with SMTP id 4fb4d7f45d1cf-61bf86deb27mr1524852a12.3.1755767287116;
        Thu, 21 Aug 2025 02:08:07 -0700 (PDT)
Message-ID: <26bad9fb-3c4b-4423-a443-3406d07d56e0@suse.com>
Date: Thu, 21 Aug 2025 11:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/pci: add discovered PCI device at boot
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1755683961.git.mykyta_poturai@epam.com>
 <bb2589996131b0e7e645c0af281b9862e2e0f4cb.1755683961.git.mykyta_poturai@epam.com>
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
In-Reply-To: <bb2589996131b0e7e645c0af281b9862e2e0f4cb.1755683961.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2025 14:28, Mykyta Poturai wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> In dom0less mode, there is no dom0 that can call PCI physdev ops to
> register PCI devices to iommu, so it needs to be done by Xen.
> pci_add_device requires some default domain, we don't have hwdom, and
> the guests are not yet created during the PCI init phase, so use dom_io
> as a temporary sentinel before devices are assigned to their target
> domains.
> 
> Rename setup_hwdom_pci_devices to setup_pci_devices and add dom0less
> handling to it.
> 
> In pci_add_device there is a call to xsm that doesn't consider the
> requester of the function to be Xen itself, so add a check to skip
> the call if the owner domain is dom_io, since it means the call is
> coming directly from Xen.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> (cherry picked from commit eff51e50021b75f5a50533f7de681b2ce044f5bd from
>  the downstream branch poc/pci-passthrough from
>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> 
> v1->v2:
> * integrate add_discovered_pci_devices into existing routines
> * better explain the need for dom_io

What I continue to miss is an explanation of why devices can't go to their
ultimate "destination" domain right away (once those have been created),
i.e. why the dom_io intermediary is necessary in the first place.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -35,6 +35,7 @@
>  #include <xen/msi.h>
>  #include <xsm/xsm.h>
>  #include "ats.h"
> +#include "xen/dom0less-build.h"

No, please don't, at the very least not this way (using quotes rather than
angle brackets). I may guess that it's for is_dom0less_mode(), but even
then I wonder whether that declaration wouldn't better move elsewhere. It
simply feels somewhat wrong to include this header here.

> @@ -1181,19 +1185,21 @@ int __init scan_pci_devices(void)
>      return ret;
>  }
>  
> -struct setup_hwdom {
> +struct setup_ctxt {
>      struct domain *d;
>      int (*handler)(uint8_t devfn, struct pci_dev *pdev);
>  };
>  
> -static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
> +static void __hwdom_init setup_one_pci_device(const struct setup_ctxt *ctxt,
>                                                  struct pci_dev *pdev)

Nit: Indentation then also needds to change on this following line.

>  {
>      u8 devfn = pdev->devfn;
> -    int err;
> +    int err = 0;

This doesn't suffice, as ...

>      do {
> -        err = ctxt->handler(devfn, pdev);
> +        if ( ctxt->handler )
> +            err = ctxt->handler(devfn, pdev);
> +
>          if ( err )
>          {
>              printk(XENLOG_ERR "setup %pp for d%d failed (%d)\n",

... below here we may continue the loop even if we got an error. "err"
needs setting unconditionally in the loop body, and hence maybe better
with a conditional expression.

> @@ -1229,18 +1235,26 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>              if ( !pdev )
>                  continue;
>  
> +            if ( is_dom0less_mode() ) {

We're in a __hwdom_init function. You can't call an __init one from here.

Also nit (style): Brace placement.

> +                int ret = pci_add_device(pdev->seg, pdev->bus, pdev->devfn, NULL,
> +                                         NUMA_NO_NODE, ctxt->d);
> +                if (ret)

Nit (style): Missing blanks.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -220,9 +220,8 @@ int scan_pci_devices(void);
>  enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
>  int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
>  
> -void setup_hwdom_pci_devices(struct domain *d,
> -                             int (*handler)(uint8_t devfn,
> -                                            struct pci_dev *pdev));
> +void setup_pci_devices(struct domain *d, int (*handler)(uint8_t devfn,
> +                                                        struct pci_dev *pdev));

I think in this case the 2nd parameter would better remain on the following
line, to limit overall indentation.

Jan

