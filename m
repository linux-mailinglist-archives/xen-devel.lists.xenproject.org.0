Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E6A1D3DB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 10:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877538.1287668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLmE-00034H-Jj; Mon, 27 Jan 2025 09:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877538.1287668; Mon, 27 Jan 2025 09:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLmE-00031C-GX; Mon, 27 Jan 2025 09:51:30 +0000
Received: by outflank-mailman (input) for mailman id 877538;
 Mon, 27 Jan 2025 09:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcLmD-000314-Ob
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 09:51:29 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46df4ce6-dc94-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 10:51:27 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so756286366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 01:51:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e653d1sm561965966b.68.2025.01.27.01.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 01:51:26 -0800 (PST)
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
X-Inumbo-ID: 46df4ce6-dc94-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737971487; x=1738576287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lrBbF5qHfbmKyavcLCgu8dtq45YUT36r9UYamUvvmlM=;
        b=F6W5HKtRU11XGyGyWSn35TegbTBZzbfOH16hGrbo+C5Wrx5Un7mIHlMxU1uV4pBdD/
         7Q9/GSU6qXL4u4rXbMOJooujH7o6VS78B81D0ri3u7+EKpJjalkbOeBFeo6amqwGEVDT
         IlXql+ozhEpPopCL1li9YiIghb21vEvSdLAkGETHKeL6Ogu4XexWpNemrgoHri1bq1wh
         DbDeMQaojyXjrw7YZQEEKFhyQFppdwfJNbxje0AuQeZtcyBxm1Hm3RVK63eaevHbDrGd
         sgTgu00t57fKEJ9Nt+8TX+UYxd3+V4jRWRqQ8otFsuo2aBctHzLK162gH5RSX6PqMeJQ
         MceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971487; x=1738576287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrBbF5qHfbmKyavcLCgu8dtq45YUT36r9UYamUvvmlM=;
        b=UlgX9xnvvulVZkCNbiiIWuCHARQbDcu0DUvEDzWmXXp1xdB0ZJHxnAm8rGCIi7jjar
         orMM/tuDupJxr2GOKx9tainVIbEyPKwq7UggnDWMb5P9ALKXbYTdgZcNPCQSc2OK2TCW
         egLJseZz7/qVibsnsdgVQB96cI6OeJ4bjN9T5erYxEvFXVnIoVfbEt3YSakdBqejBqs8
         pnZvqCzTTD8J1mkLMt53cc3uwnS2oSbwzbmLZaWKalNH3qxyXz1AmxSXAPg6YiaKHxLo
         Ib4UEycjPoxITuRv4dLd/KqRNB0/CPNyAkzGvtmnc12gYO1s7hCv6z7Fi7MOnFiMmexg
         WOuA==
X-Forwarded-Encrypted: i=1; AJvYcCXeYlcJEiJqk22ea02Ihd0+/fDMog4l8gtHVj2PhOQxL0YrdduKdBuMAC2dyqo3nvbOlfWns2wGMc0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtfGhnO9ZpbKZJz6C1MvEHymt2e2iemUDkslGSg71Dvh7dC1ao
	9kP+GvfVf2pUIVbZ+MAppxBuEyvUw4gn6XrwqpmUusp6Nxmh61+FnvJUG667dg==
X-Gm-Gg: ASbGncu8s9uSb2f98CW2YQVvjWgWqxtQyaqTZ04h1zUgsEqKxNIJ5jfu0/4kiq4uFX8
	D59SYGtMUwk/eZf3wFhviFx9U+4FKl3prbT4AgLyfbWGuSzXkswuH3fpwxBc0gw+Pr8rHGaWgWp
	Hrn7iegssgeAs4+2Kni75F3wJ3zZbHLGzJpQg/6RCb6mUxJIWj0IplM+MqHfmzxciKOol4a/qio
	Y4sQv0Ef7C7hkPru3FO9vqN6hvWU3k7VcXO2EpswiIgDtwBCKy1B/fJfq9CaRlYkUCpTHdGcou2
	0gMlKxrArxSypdPgCVtIQQ0niqQTQuKonzrUpVYGR2vCnjDwA6XHnIoRyBe7OIftrw==
X-Google-Smtp-Source: AGHT+IH5B+oFKNQRoW8fUPl/+ONhqLRW2+Gvif/SdN9KvVL5/xj+i9PoyogZIsz+6lvmllnjDiajBg==
X-Received: by 2002:a17:906:7314:b0:ab2:f5cb:c039 with SMTP id a640c23a62f3a-ab38b48ae9amr3656137466b.54.1737971486882;
        Mon, 27 Jan 2025 01:51:26 -0800 (PST)
Message-ID: <ef73e2fd-69ae-4cf0-a8d2-785a2b248d63@suse.com>
Date: Mon, 27 Jan 2025 10:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/iommu: check for CMPXCHG16B when enabling
 IOMMU
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250124120112.56678-1-roger.pau@citrix.com>
 <20250124120112.56678-2-roger.pau@citrix.com>
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
In-Reply-To: <20250124120112.56678-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.01.2025 13:01, Roger Pau Monne wrote:
> From: Teddy Astie <teddy.astie@vates.tech>
> 
> All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
> initialisation time, and remove the effectively-dead logic for the
> non-cx16 case.

Nit: There's nothing being removed here, so I expect the 2nd half of the
sentence wants dropping.

Jan

> If the local APICs support x2APIC mode the IOMMU support for interrupt
> remapping will be checked earlier using a specific helper.  If no support
> for CX16 is detected by that earlier hook disable the IOMMU at that point
> and prevent further poking for CX16 later in the boot process, which would
> also fail.
> 
> There's a possible corner case when running virtualized, and the underlying
> hypervisor exposing an IOMMU but no CMPXCHG16B support.  In which case
> ignoring the IOMMU is fine, albeit the most natural would be for the
> underlying hypervisor to also expose CMPXCHG16B support if an IOMMU is
> available to the VM.
> 
> Note this change only introduces the checks, but doesn't remove the now
> stale checks for CX16 support sprinkled in the IOMMU code.  Further changes
> will take care of that.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since pickup:
>  - Unify all CX16 checks into a single patch.
> ---
>  xen/drivers/passthrough/amd/iommu_intr.c    | 13 +++++++++++++
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++++++
>  xen/drivers/passthrough/vtd/intremap.c      | 13 +++++++++++++
>  xen/drivers/passthrough/vtd/iommu.c         |  7 +++++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
> index 7fc796dec25b..f07fd9e3d970 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -649,6 +649,19 @@ bool __init cf_check iov_supports_xt(void)
>      if ( !iommu_enable || !iommu_intremap )
>          return false;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        AMD_IOMMU_ERROR("no CMPXCHG16B support, disabling IOMMU\n");
> +        /*
> +         * Disable IOMMU support at once: there's no reason to check for CX16
> +         * yet again when attempting to initialize IOMMU DMA remapping
> +         * functionality or interrupt remapping without x2APIC support.
> +         */
> +        iommu_enable = false;
> +        iommu_intremap = iommu_intremap_off;
> +        return false;
> +    }
> +
>      if ( amd_iommu_prepare(true) )
>          return false;
>  
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 73dcc4a2dd0c..f96f59440bcc 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -309,6 +309,12 @@ static int __init cf_check iov_detect(void)
>      if ( !iommu_enable && !iommu_intremap )
>          return 0;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        AMD_IOMMU_ERROR("no CMPXCHG16B support, disabling IOMMU\n");
> +        return -ENODEV;
> +    }
> +
>      if ( (init_done ? amd_iommu_init_late()
>                      : amd_iommu_init(false)) != 0 )
>      {
> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
> index c504852eb818..233db5cb64de 100644
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -150,6 +150,19 @@ bool __init cf_check intel_iommu_supports_eim(void)
>      if ( !iommu_qinval || !iommu_intremap || list_empty(&acpi_drhd_units) )
>          return false;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        printk(XENLOG_ERR VTDPREFIX "no CMPXCHG16B support, disabling IOMMU\n");
> +        /*
> +         * Disable IOMMU support at once: there's no reason to check for CX16
> +         * yet again when attempting to initialize IOMMU DMA remapping
> +         * functionality or interrupt remapping without x2APIC support.
> +         */
> +        iommu_enable = false;
> +        iommu_intremap = iommu_intremap_off;
> +        return false;
> +    }
> +
>      /* We MUST have a DRHD unit for each IOAPIC. */
>      for ( apic = 0; apic < nr_ioapics; apic++ )
>          if ( !ioapic_to_drhd(IO_APIC_ID(apic)) )
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index 27a4d1640189..3daedc4f5593 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2633,6 +2633,13 @@ static int __init cf_check vtd_setup(void)
>      int ret;
>      bool reg_inval_supported = true;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        printk(XENLOG_ERR VTDPREFIX "no CMPXCHG16B support, disabling IOMMU\n");
> +        ret = -ENODEV;
> +        goto error;
> +    }
> +
>      if ( list_empty(&acpi_drhd_units) )
>      {
>          ret = -ENODEV;


