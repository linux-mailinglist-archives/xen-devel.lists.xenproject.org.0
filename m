Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA7B19CE3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068865.1432729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipuj-0004Ez-UL; Mon, 04 Aug 2025 07:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068865.1432729; Mon, 04 Aug 2025 07:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipuj-0004Bx-RD; Mon, 04 Aug 2025 07:47:21 +0000
Received: by outflank-mailman (input) for mailman id 1068865;
 Mon, 04 Aug 2025 07:47:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipui-0004Br-CP
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:47:20 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ecc5728-7107-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 09:47:18 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-615756b1e99so4523361a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:47:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7c88sm6447496a12.41.2025.08.04.00.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:47:17 -0700 (PDT)
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
X-Inumbo-ID: 3ecc5728-7107-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754293638; x=1754898438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2UDRFzpvxKPEasMvNhqsQNQ/DiNWraBGrNUe11lrUM0=;
        b=Ru5m3aD1JhAjTk+IQsn8j2kARmEFXxC5TZCeNvxB7JzC90ZCPtuzyYeid/k5fT55PS
         Zz7sCF7yq64oL4patGfqnxlRExc4Iw3el6jRhM8TB0LhD3vSc1lnzSVRmqPKgJ4fUhyC
         5VGU5vuTKvQFIcMmfDSeqHzHBENAgv+DxupYXY+ifp2eWKDMHBzc5yRxipu3rV7R4Bxt
         /twg5MmaUUQzaJV9ny+XF6EXQO1KLBR+41oOOcD//hZcaHoKLDWnUoSTtCuBNk9/AdIA
         LiY0vUi1rdVMkv6dEjwdzL57DUy8qEtwv2wng+ddBuYnRGMZbCMlLPPedXExekFZAK2U
         64fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754293638; x=1754898438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UDRFzpvxKPEasMvNhqsQNQ/DiNWraBGrNUe11lrUM0=;
        b=n3d6Todybqxm/DTcgv+ufWd3NjYu52bm7Dao+5HAXNT/15D6cMxqKv2ZdSukqACdZm
         rtRKw1XB8awCFTJ2Y6VIPjeVWb3dbzUK8TvuKlw14+CCrhSvV4ktEoiU/8W1xvKDKjUx
         xBmYOCkB8WTO2jlYTOQee3pMz1EkP5ql4/Es/DaxX+mLSNdY/aFUtYeP+Aet1G0BT2Qm
         B5Baotphl6UuC5xeMQzdaZ7DTcYKH3l/0Sp4KbDnhSIaXCNcOYgnIRJ+1osYV34d6yJl
         wcKoUAKgKoxfIIlmbl3zAa/zUr7PublO8Y+7Jg5TsWgARwmftrZWP9d2IqbMcXyHsiQG
         JC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8Afa0ETzTuJvL/iiLHXhr57CHzlG8H3DC/+jh+mvpeql8MgCizehlk61+jfOUkCvuGJQD5evmdsU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsTaYTNSyO/gZrvZ0uwS00ER+YZlqcrnuM321LDV/dpwg8TlMa
	eYQKlRU2tZoYx9aG0eW8Ep/2DncIjkjF9aHA+CpkseD/YPSLjyEDAN9z9uhFmtggiQ==
X-Gm-Gg: ASbGncsF4TGb08rKLhkYm/Z32HiuvIGkYh6p8RYPgcAhtT4EkBP9w56XRHp+doL6q+E
	7F76GBm8mqI8mDfZPeDH+SYDl7eYVjzj5gWNS3f+10zOPM9FmgYTDBMFv9L3+z0i6pcLTfeSVou
	vIO/c33t+qWm5hPPzVwpyFZErg30NoECyKoETUXsixlJFQXDWx/1wjLjjVTK0TCsmSjOY5nk15/
	tJ83tZIJH2kH2emFFNGkDEcvF8ozbBOC3Ers45e2HMSgUm3tfQURnmZJbsBapgKP15aUm8CrJz+
	4rbrkjX6nZ0IhrKWNfPjD3Bj5GkFzhkJfn8msufkRTRkBY2Tid20jJLn0b7cCRv+jLyWKa0drcH
	E6Oc9E9v/fDPQuOijvP0VUGjSwO4OepUzYbJfdwQjHQe3zv5rhnVZSslnWOmuJtsWZHYS2zUUR+
	yhuw//VBQ=
X-Google-Smtp-Source: AGHT+IE/3GALxsfmNfanTZmRT4jJe7hkA6z7M38co6zKHyOgOCET50A5GDpsE5r/WJaKVl5/Uz8SCw==
X-Received: by 2002:a05:6402:90c:b0:615:6fae:d766 with SMTP id 4fb4d7f45d1cf-615e73889a3mr7269078a12.26.1754293637540;
        Mon, 04 Aug 2025 00:47:17 -0700 (PDT)
Message-ID: <bb42b0a4-30b7-4c10-8320-ecd21aad5c2e@suse.com>
Date: Mon, 4 Aug 2025 09:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/25] Introduce CONFIG_DOMCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Meng Xu <mengxu@cis.upenn.edu>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.08.2025 11:47, Penny Zheng wrote:
> It can be beneficial for some dom0less systems to further reduce Xen footprint
> via disabling some hypercalls handling code, which may not to be used &
> required in such systems. Each hypercall has a separate option to keep
> configuration flexible.
> 
> Options to disable hypercalls:
> - sysctl
> - domctl
> - hvm
> - physdev
> - platform
> 
> This patch serie is only focusing on introducing CONFIG_DOMCTL. Different
> options will be covered in different patch serie.
> 
> Features, like VM event, or paging log-dirty support, which fully rely on
> domctl op, will be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as
> much as possible.
> 
> It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
> disable hypercalls"(
> https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)
> 
> Penny Zheng (25):
>   xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
>   xen/x86: consolidate vram tracking support
>   xen/x86: complement PG_log_dirty wrapping
>   xen: consolidate CONFIG_VM_EVENT
>   xen: introduce CONFIG_DOMCTL
>   xen/domctl: provide stub for domctl_lock_{acquire,release}
>   xen/domctl: wrap around XEN_DOMCTL_pausedomain
>   xen/domctl: wrap around XEN_DOMCTL_soft_reset
>   xen/domctl: wrap around XEN_DOMCTL_destroydomain
>   xen/domctl: wrap around XEN_DOMCTL_setnodeaffinity
>   xen/domctl: wrap around XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity}
>   xen/domctl: wrap around XEN_DOMCTL_scheduler_op
>   xen/domctl: wrap around XEN_DOMCTL_getvcpucontext
>   xen/domctl: wrap around XEN_DOMCTL_{irq_permission,iomem_permission}
>   xen/domctl: wrap around XEN_DOMCTL_settimeoffset
>   xen/domctl: wrap around XEN_DOMCTL_set_target
>   xen: add stub for XEN_DOMCTL_getdomaininfo
>   xen/domctl: wrap around XEN_DOMCTL_set_access_required
>   xen: make CONFIG_VM_EVENT depend on DOMCTL
>   xen/domctl: wrap around XEN_DOMCTL_set_virq_handler
>   xen/domctl: wrap aound iommu-related domctl op
>   xen/domctl: wrap around XEN_DOMCTL_{get,set}_paging_mempool_size
>   xen/x86: make CONFIG_X86_PSR depend on SYSCTL || DOMCTL
>   xen/domctl: wrap around arch-specific domctl op
>   xen/domctl: wrap around domctl hypercall

Hmm, I should have remembered to Cc you on this [1] reply of mine to Jiqian.
It applies here as well.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01884.html

