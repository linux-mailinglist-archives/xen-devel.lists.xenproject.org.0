Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB9AF8F0A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033230.1406697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd2Y-0002ud-Ag; Fri, 04 Jul 2025 09:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033230.1406697; Fri, 04 Jul 2025 09:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXd2Y-0002sI-7r; Fri, 04 Jul 2025 09:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1033230;
 Fri, 04 Jul 2025 09:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXd2W-0002sC-U9
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:49:04 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14c41638-58bc-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:48:47 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so601609f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 02:48:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee74cf48sm1615628a12.77.2025.07.04.02.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 02:48:46 -0700 (PDT)
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
X-Inumbo-ID: 14c41638-58bc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751622527; x=1752227327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+TqimM+YaS3aEnRK3KKzv+iwHsYD9cFG+JiLZT4wrts=;
        b=UZomoCANLHKaSCurG0WfeJCBM94oxkkTNL+1O4+CZdiH01wXkzJs4Jyt7ihzzCwRZ2
         tXYOTALzKCxBj7RdjmVj9qSYBW8XCDuB2IEr//oo8vZWUNkLzp1CpafOAvW+A1nPJIdR
         LTx3gbp3j4xflr6U7uVUn7RNVt1N3tC2T91NqC6h9UsbxhQ/g1E+ReLN8Q6uLEeBIGcz
         LfZ93glOnIgGplSHHOdoGEY7lq28aCLVvMRdlGIzjOgeWoahN9hHhJHJUAlP8F8f/EEd
         tgMnqln8x0qkY8Fc0OGe8U2YB1vpE72vUYDLR84OLePFeUSrMvM0eKW7O/C+DLdM3LH4
         8I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751622527; x=1752227327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TqimM+YaS3aEnRK3KKzv+iwHsYD9cFG+JiLZT4wrts=;
        b=nGsKZpAb2RhIgLTbyCOXi3UUw9Fu0/+kitlpXwCwJorkD+VwVDfkCcvowDdkejUEcD
         vlCQeIY6RK89CyX+wDg67lmme8H3kbqrV5263ZQkOf0nNFNHaTTvzI0HMOh16VUDULIl
         39cY2N0aj0DiqoFyZ9YCgEhrtE8nz+v2zE7+XMIkSSvxUo8XLBedgyrAfyeg3cV44Axr
         C+izx6IhG47oGfwMxzVAM+lcdt5VHUxlVR3tpsFl4WA33iWTUp6q2KHiNWdgDJApZh9b
         cZDXAZ3uitIKBdoZBbjRwa5srjBGPQaf9yWp+lEildXZYl3bSMNeown8Y5YTAYEklVdX
         WxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHjTzKCR8K4X+9mpzEwY2b15HAgLU96yXkysp17nUv4WbnA/He5FiVW+VUbKD6to6Nc7gg93Dljw4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxsjrf4cigAnwBcntHBxRSysIHEZNnDzk53CpNBu4YhctO+f7fY
	qHvuDjqUyqnEkad2V/KvBokUdk33yN3fMdr/78pL4fy1Wsmp3u7Ilidq1tjlCTyESQ==
X-Gm-Gg: ASbGncvaUukvCVO1PFwhyBo+25h+AQBCnzw464+qISdRNyWdDSC/hUYAHsHYuYjVuCv
	a9P+Rc3EXgZr0k47G3Oo7YSHOb1NPDPaTZCJ2KHKQqIUpsEAx/1O7y1CugzqDHHhD5gSK+9iq7A
	hRPrTTlOdnfLG5QXNccgtemEIc7fN0bkzC4q+pJjImhl3a7zCSVL8IVuwHSwDiM+DGZrJZkUSXw
	UaNY38Ygp5856mgmEmCV7wW8zekL9JBWOR3fTNLKL/MJHhBT2PqnMcXItOO8ANW461AqSdpP7/q
	/9QMTn3S40I4HEQ2axSmUTDmKZ8oos5KXdP8mSq9sqw3qpAqRbUmKOV1LpiyslLEk/2OYPqniEa
	zHaeZxs1d0o29Zs7Y8M0Z1pvA28KrdviPeShljesIb21qxL0=
X-Google-Smtp-Source: AGHT+IGDMwZ6Q5/7dxDvtZXPDVvljbxWQsK8lKNtO0SLtUkuX6sc507wQm7zQALP9BrZJRso8uWMoQ==
X-Received: by 2002:a05:6000:1a88:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b4966267b8mr1556688f8f.52.1751622526870;
        Fri, 04 Jul 2025 02:48:46 -0700 (PDT)
Message-ID: <41925877-dc7b-46d7-abc4-01b18de27cb6@suse.com>
Date: Fri, 4 Jul 2025 11:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/18] xen: introduce CONFIG_SYSCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, xen-devel@dornerworks.com
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 11:29, Penny Zheng wrote:
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
> This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
> options will be covered in different patch serie.
> 
> Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, will
> be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as much as possible.
> 
> It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
> disable hypercalls"(
> https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)
> 
> ---
> Commit "xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"" and commit "
> xen/sysctl: wrap around sysctl hypercall" shall be commited together.
> ---
> Penny Zheng (16):
>   xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
>   xen/sysctl: wrap around XEN_SYSCTL_readconsole
>   xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
>   xen/sysctl: wrap around XEN_SYSCTL_sched_id
>   xen/sysctl: wrap around XEN_SYSCTL_perfc_op
>   xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
>   xen/pmstat: introduce CONFIG_PM_OP
>   xen/sysctl: introduce CONFIG_PM_STATS
>   xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
>   xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
>   xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
>   xen/sysctl: wrap around XEN_SYSCTL_physinfo
>   xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
>   xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
>   xen/sysctl: wrap around arch-specific arch_do_sysctl
>   xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
> 
> Stefano Stabellini (2):
>   xen: introduce CONFIG_SYSCTL
>   xen/sysctl: wrap around sysctl hypercall

This doesn't look to be based on latest staging, where some of the changes above
are already present. I specifically tried to get some of the stuff in so that
the next re-posting wouldn't be as large.

Jan

