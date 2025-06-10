Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922CAAD3968
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010937.1389192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOz9M-0005Qj-DG; Tue, 10 Jun 2025 13:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010937.1389192; Tue, 10 Jun 2025 13:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOz9M-0005Od-A4; Tue, 10 Jun 2025 13:36:24 +0000
Received: by outflank-mailman (input) for mailman id 1010937;
 Tue, 10 Jun 2025 13:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOz9L-0005OX-DW
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:36:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4f1d5c4-45ff-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:36:21 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450cfb6a794so35436055e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:36:21 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730c747dsm142209705e9.31.2025.06.10.06.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:36:20 -0700 (PDT)
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
X-Inumbo-ID: e4f1d5c4-45ff-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749562580; x=1750167380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SDc6edZ/0ZDSzo+ysXzu+qN2+U9pkk+T+u8rLZm76Zg=;
        b=YNSQVs/5YFOGyhJ7o+qemq7x6qwDSzByyTSpuwgnNgk7ynLOc5EO8z2zpFa6RmBCRc
         /r2BpCrSUr16MwIHef9iPSBPU+bo7GGNbViqO3OdUH9LCoUtlufVWO75r/Ik+DEFucKY
         WHq+Cu0eQWIYQDd8eEsmnuD7argq1LY9EJp6w5cXPVEBoJ7tMKhHmAQAcQhArEVUvLn+
         RUva2YX5zpDTHvWrjP7udfOJ/fMzlNUsBGW5iNaqq58GkcahRZgvqVW2nUsvOQ3CQmb3
         TOXSMrT1JF4/H43UiL4LFTVaFHe+uhDXe61l+XJanvxvozuxlgS+/gqDS3Hxd4JhVgID
         6HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562580; x=1750167380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDc6edZ/0ZDSzo+ysXzu+qN2+U9pkk+T+u8rLZm76Zg=;
        b=CrlDcEOs2mW36RRm2pL+cIrbkJQrMSHb79oFJziHkOKHH2EuTV45jdV+jVIIk+Gaik
         bFzN4kQ/l/TDh2T9NZukOQSKEuO9ozZzspesbt+9TXO+UJR6rkpeBCw+c4ydnI3c2hNm
         PBDzIRCaaeVwpUYQ/0StKxkMLeUvx02qH815Sj1nU3Z6yxKP860is6qvQ09+ctbR9mM5
         wPptKCYsWmQJYuHLMSoDGDGtTRrBqI5bERj7kVQbEYF1pzUl4Pi1rPh+eTJwHm/L0LVa
         SO+e2+Gam509QzUoK5WZb7AtxxRdJensRel/xk4HFgXhEhmr4P/vSf2Y8lTYiQcWKT83
         cPsw==
X-Forwarded-Encrypted: i=1; AJvYcCX3s1hG/MKeuNcHuXlqo7PmOLKLmGdW+x87JWu/8fVyrKGfmlThkC/vx3moTCne4cydKOIjDux81hU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEs6PZzS8NtNSq1bcmwEPAAovKOlAM+U1pa8m9aFkxCpCwVnul
	OP250lHDrdG+2FxvKWbKV1aSt5urAUDgFofPLcojAvTO4dsi29MeOcpRHHub41z6qA==
X-Gm-Gg: ASbGncsm2z4RNTlF5QCICW77HO3CqnaF05miukIOjMpibIoeFtQ41cm6wcDHi8kY02t
	6GmLUZyXanNps16h4Yv1koAozFYRoYFC8QRBuZqxS+rJwzaE8n5VpMCuVCFZWbX+1K4XphH6t6d
	+eEWE13cmsCB0nzNNEXakczW3pb/TA+opalWaazSdwsAMNKAp3dDsIxNYLJJ1ot5GmxstpofYM1
	pOjRk0URA02zL0eUR2FA5q+M3Di1N/ojgCFepw/TcCagm/2PlrcS5gQ9JTgTszDZCe07Mq3nbEM
	HJRp0JI+KXO/RzDxuh/qQ2J0LY9CRszleJNEQDsdKICYQ5tUgFXVaoSQYzDk8H9RFjGApFBVprB
	fmnJvRaylpvyTdSCjASbcoFViqmhIHrmg+oTeMQtBznezpituI3/Hyg8KTIFqPMeoHxlcgHRMrL
	v8xo17d2ccy+1+/K+ICf8X
X-Google-Smtp-Source: AGHT+IEP101sT+jxIgMU+htN2retiEVArRJKQFf6YF9j4SYC8mf82NqNVSdqZ7l3nRGmMltuvAEirA==
X-Received: by 2002:a05:600c:444c:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-4531dea653emr21603115e9.32.1749562580335;
        Tue, 10 Jun 2025 06:36:20 -0700 (PDT)
Message-ID: <8226eeb6-1b19-41cf-9ffd-6440c1641e07@suse.com>
Date: Tue, 10 Jun 2025 15:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/20] xen: introduce CONFIG_SYSCTL
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
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:16, Penny Zheng wrote:
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
> It is based on Stefano Stabellini's commit "xen: introduce kconfig options to
> disable hypercalls"(
> https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

"Based on" can have two meanings - another series is a prereq, or your work
is derived from earlier work. Would be nice to be unambiguous, as in the
former case it would be unclear at what point (parts of) this series can go
in. You also will want to see about chasing acks for some of the patches
which are otherwise ready (or perhaps merely depend on a final version of
patch 04).

Jan

> Penny Zheng (18):
>   xen/pmstat: consolidate code into pmstat.c
>   xen: make avail_domheap_pages() inlined into get_outstanding_claims()
>   xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
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
> 
> Stefano Stabellini (2):
>   xen: introduce CONFIG_SYSCTL
>   xen/sysctl: wrap around sysctl hypercall
> 
>  xen/Kconfig.debug                            |   2 +-
>  xen/arch/arm/Kconfig                         |   1 +
>  xen/arch/arm/Makefile                        |   2 +-
>  xen/arch/riscv/stubs.c                       |   2 +
>  xen/arch/x86/Kconfig                         |   6 +-
>  xen/arch/x86/Makefile                        |   2 +-
>  xen/arch/x86/acpi/cpu_idle.c                 |   2 +
>  xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
>  xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
>  xen/arch/x86/configs/pvshim_defconfig        |   6 +
>  xen/arch/x86/hvm/Kconfig                     |   1 -
>  xen/arch/x86/psr.c                           |  18 +
>  xen/common/Kconfig                           |  29 +-
>  xen/common/Makefile                          |   2 +-
>  xen/common/page_alloc.c                      |  55 +-
>  xen/common/perfc.c                           |   2 +
>  xen/common/sched/arinc653.c                  |   6 +
>  xen/common/sched/core.c                      |   4 +
>  xen/common/sched/cpupool.c                   |   8 +
>  xen/common/sched/credit.c                    |   4 +
>  xen/common/sched/credit2.c                   |   4 +
>  xen/common/sched/private.h                   |   4 +
>  xen/common/spinlock.c                        |   2 +
>  xen/common/sysctl.c                          |   4 +-
>  xen/drivers/acpi/Makefile                    |   3 +-
>  xen/drivers/acpi/pm-op.c                     | 397 +++++++++++++
>  xen/drivers/acpi/pmstat.c                    | 559 ++++++-------------
>  xen/drivers/char/console.c                   |   2 +
>  xen/drivers/cpufreq/cpufreq.c                |  31 +
>  xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
>  xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
>  xen/drivers/cpufreq/utility.c                | 204 -------
>  xen/drivers/video/Kconfig                    |   4 +-
>  xen/include/acpi/cpufreq/cpufreq.h           |   5 -
>  xen/include/acpi/cpufreq/processor_perf.h    |  14 +-
>  xen/include/hypercall-defs.c                 |   8 +-
>  xen/include/xen/mm.h                         |   1 -
>  xen/include/xsm/xsm.h                        |  18 +
>  xen/xsm/dummy.c                              |   6 +
>  xen/xsm/flask/hooks.c                        |  14 +
>  40 files changed, 798 insertions(+), 648 deletions(-)
>  create mode 100644 xen/drivers/acpi/pm-op.c
> 


