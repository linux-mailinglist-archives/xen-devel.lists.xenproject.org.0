Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B25B37C9E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 09:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095645.1450570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urB3D-0008OY-O6; Wed, 27 Aug 2025 07:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095645.1450570; Wed, 27 Aug 2025 07:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urB3D-0008MK-Ky; Wed, 27 Aug 2025 07:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1095645;
 Wed, 27 Aug 2025 07:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urB3B-0008M5-Ue
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 07:58:33 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ff7fdd7-831b-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 09:58:32 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afebb6d4093so146994866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 00:58:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe7fd59b00sm601815466b.106.2025.08.27.00.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 00:58:30 -0700 (PDT)
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
X-Inumbo-ID: 9ff7fdd7-831b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756281511; x=1756886311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P78y0ZAf9K2ANlf9uB4nNjETFBHLWK9P8L0nxlKFXN4=;
        b=IKggm+3/S2/yJQDoG5nt1ynbgo5ubI+Xa2Qa4gcnzIStTEGvIM2YRiqWeHBzdZsSrm
         IusLTXSfsOJu68Z7R0/ncmYkBW1q0RHscSyv/gEiyNOWs8P6UDovDKdpMNzRlflFyl5j
         2CvQulIEg4pjDt+sJt8KuPKZVVfqbIFGsVOvb3LuapFrG2U2REIU7qegQtZwXu/T2yvK
         oyhWxN5Ygx/DPqBAC4BeP2o4BWsfCfBzAE1OA6lSr22Z4ThbVD14pkkoajbNTTReKHGc
         7/Yr+bh3AYTBdvEBgBtz2uK8XnZF/w9yLIUQLi+XSKXRAWNG/edNjZQNnk2sAn8rglUZ
         RXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756281511; x=1756886311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P78y0ZAf9K2ANlf9uB4nNjETFBHLWK9P8L0nxlKFXN4=;
        b=blSnGNoIux8FRo7y7+6biXMD6qzpCxivJTVHlbH20SCBVRS/n/veogsLTKl+WVmmwR
         R20vgXiVuSzVv6JbbqAWnCWbbangzRtyZHhpigRJyDlKGFIxvsn3722kGv7NtpjMFOmN
         uDYazUsqEPLiGPGPVjZ3PYQV1A8FWgoO+mTtIdiOztChb0qTJdXo1hzINW6oKEQr50T6
         62L44n4IvhjVmv5kOMOLYjtYdu6QMauFq/WdSBHYOVk7vMDZey+ct81X/bn3qhaCOL42
         md5PMALUkpbDuFkdFkEYQno9F3QqIeTrDKxrjKGsm2UiJif9hZ1AgLMz3BSeEnyrgBf2
         uO0g==
X-Forwarded-Encrypted: i=1; AJvYcCWLsm72OcXGlIhBA+quOkFDiW7iFIdz5gsyRXQMgSjCQgXj89TI62FzRBhGhrZ40rPcJiz1J6gfmyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxM9bfcEdMHh7k79mfpnTzcmV93xmsu6zKNfxpegAlfYpt4xFk
	78X2ZnLH8mTfC/nxSrYvLBVdZtX7NzcNlImy2zRsXqFRHLgK5yMalhkL2D/UvLuY9A==
X-Gm-Gg: ASbGncsOIEI9uPu+n1nZIgFSeSe1Hijq6z9uWvgwssjp8FHICvkIWbviwt6b/UkVUgd
	VV2L3tKuxR37eyO7mjs5Nz51xl98bPxpp3O/bnSb3aaX81zRNwxwmObeAaM2Cuesn53UBDchEPo
	T5TLCIHpLSlHZ5Ufom9Mj/trDBZChholP8FKnDlFL1OI0l6R1djdqI0fs0QKOOZmKVRPcN/CAXk
	A0C5NJTo2wjMMrSVYBk4UDaNFpoBi6EniOBH7TZEQ/SoGaidnb9qjUfwH4ukwzGstWHoVdZOXTI
	HZjgI5DCBbZnFM0cyP9HlnwvqcWKZXBG7lqFxqFtKwSBadyAbaY1KRbRT1U8n8W7Pngm4x0k4bk
	wuKBlhn8X+7mmFZpjlEvs6gbOckx+1LCdUjRwXNBuRJZseuXU90vhpkavm67PzA+/hFPUU60Rqz
	yiBM3nkvQH98rGbv88KQ==
X-Google-Smtp-Source: AGHT+IFd5sT8nD9z3rOyxDBvq5JhYfEQAgwBSHFNfNqUqTpjCKhGtD/UGuQC4wphqd2Ph/qfBdPD1A==
X-Received: by 2002:a17:907:7203:b0:afe:ae1b:bf17 with SMTP id a640c23a62f3a-afeae1bd560mr443120266b.3.1756281511281;
        Wed, 27 Aug 2025 00:58:31 -0700 (PDT)
Message-ID: <609d686e-a41c-47f4-9e5d-3733e9ec7723@suse.com>
Date: Wed, 27 Aug 2025 09:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] xen/dom0less: store xenstore event channel in page
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250826210847.126015-1-jason.andryuk@amd.com>
 <20250826210847.126015-9-jason.andryuk@amd.com>
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
In-Reply-To: <20250826210847.126015-9-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2025 23:08, Jason Andryuk wrote:
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -26,6 +26,7 @@
>  #include <public/event_channel.h>
>  #include <public/io/xs_wire.h>
>  
> +#include <asm/guest_access.h>
>  #include <asm/setup.h>
>  
>  #include <xen/static-memory.h>
> @@ -120,8 +121,14 @@ static void __init initialize_domU_xenstore(void)
>  
>          if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
>          {
> +            evtchn_port_t port = d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
> +            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
> +                offsetof(struct xenstore_domain_interface, evtchn_port);
> +
>              ASSERT(gfn < UINT32_MAX);
>              gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
> +            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, sizeof(port),
> +                                       true /* is_write */);

Isn't the use of an arch-specific function going to pose yet another issue
for making this code usable on x86? Can't you use copy_to_guest_phys() here?
Which may in turn need to be passed in by the caller, see e.g. dtb_load()
and initrd_load() (i.e. cache flushing may also be necessary for Arm).

Jan

