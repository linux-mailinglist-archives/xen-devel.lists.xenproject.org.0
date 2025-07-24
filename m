Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CEB10B79
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 15:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056035.1424230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uew30-0007FB-44; Thu, 24 Jul 2025 13:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056035.1424230; Thu, 24 Jul 2025 13:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uew30-0007Ce-16; Thu, 24 Jul 2025 13:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1056035;
 Thu, 24 Jul 2025 13:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uew2z-0007CY-7b
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 13:31:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89d48558-6892-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 15:31:43 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso878337f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 06:31:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcad22asm2234248f8f.53.2025.07.24.06.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 06:31:42 -0700 (PDT)
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
X-Inumbo-ID: 89d48558-6892-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753363903; x=1753968703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N7fLIqo+ZXGkU0LB6fsNTeD/y3gnmPV3nnHS+h5QkA8=;
        b=YAm9B3R7BVpYv7pTOboJGhRB3YhsfoeP6/8g6XLDKI0lf3CkzBLq6f2B6G+txvBED/
         gsOkIgQncyTrixjFRwsVE6/e3wARyn/7NxzjdQMflek3dP/EfBhRMk8VnHwULh+RPAoJ
         VKA1Gl1ZuMxBo2h5szZhvw/acpDLWk07INrM5YS10s39bV4bk5tyuLsn+AoC3wfLkSr/
         Ulow5Yd0tqx7Ik+LjEkmDbpEi+zpSwJJkCciNC0ZHPB8w6fdptFyOINBE46vnhq4K2L9
         dxoJQOuRMif2lZ8wg1w+HRUaEjApOfuJZqDDH6O204uNJ4w0JoXJIFciqUjfZ4DTg3LY
         ZtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753363903; x=1753968703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7fLIqo+ZXGkU0LB6fsNTeD/y3gnmPV3nnHS+h5QkA8=;
        b=AP5BTRC9PhSnkiU0MbGwIc0uWFR6fFeR73zhemF2LSF1Q5ffIXgpkJB+dkrg+LVamv
         I09Hd3TPok5Fh1udnD4M9mjDupf3sdPBRoARlYuklNOOnyCqZ8bVEL6HEIZavwNlMOsb
         1V0TVLA+ZPA/r32zc/KOQqEPVy3kYxil5+/EIo35E5F11Re5b6mHhYEZN/umvv8wJxJD
         dzG8gY+zNfco4Db92qfIe4DxNIymAAvbQcAmXLEzCb/O1OwGjTvEcgxCfvreeHImPLOw
         8hMHrZyrfDlSOuECaKvHYSInS1DKF3ERsC6SEPyJ8BEYWCPbNG+jgqja609tXQAFnL2M
         SkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8sTtoPJz5VbVCXpRIwJ85Sa4oKLdIPejsk/3fnEne7YVh1fDTaCSYzPvmuhGXzPlYHQs96GNtXuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3Ee2DAqxUlj1wp6Id+HjeAdXY97nACskuaGWQ2wp6qWzwxRTI
	M7bVECP1lax49cde6sK/7pKSqvzozcIxAEz+CjbqC5LUYXsSckSSjeXTxh9jxF8KnA==
X-Gm-Gg: ASbGnctoym9+IQGi0baMmFDrcWi2wFXdelAYA0h4F42XnBAv0wUhLE/t1sVcrlMz2Ve
	uIYAY1pbL+qukGvs6QpJl38FmOuVJT2ZghA/RVQulJMt2kCgcov9yzS4VIDDPWXfXwTSfu4W8eu
	RuHlS+FdEQFPWMQooH4NpKh5Vh5IgGh+ogmZSp30y7hoLIT0Nwt4qGh4Xfwk1ON3k3wAW48+4LD
	XhOL5INtucbAynpotDqD1gr/gfEJaoCorOevJdnfGaJPH4wHj8HYJEijKSX8WJBFZgQcL1jd1Za
	sM8y7I8fEivk+SBycZJ+8xhAdjUuuSbF9SQY3HsuV0KYqUzuekV25F7JcrXwx6Myc4an/rDVdzB
	gSb6K1YKAVYqky5LPsnxG4EPvP36B6dj3CYf3NDTTco5/PxDYkYHdDhMogWBC4wsNq5wgcsHjbL
	jsfAFeTG4=
X-Google-Smtp-Source: AGHT+IGInqJJRAmBGGJW4RgOqh4mvrQ7AV7BxHHdSoBMLP3qs20S2C1tPA1/b8BdTjLXJ+hysYJ0Vg==
X-Received: by 2002:a05:6000:4210:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3b768f1601fmr4578968f8f.58.1753363903037;
        Thu, 24 Jul 2025 06:31:43 -0700 (PDT)
Message-ID: <87d9d5a1-39aa-46ca-9f2a-9169a2ef7a6c@suse.com>
Date: Thu, 24 Jul 2025 15:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/19] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-op
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-17-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-17-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:51, Penny Zheng wrote:
> In amd-cppc passive mode, it's Xen governor which is responsible for
> performance tuning, so governor and CPPC could co-exist. That is, both
> governor-info and CPPC-info need to be printed together via xenpm tool.
> 
> If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
> out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
> make xen_sysctl.u exceed 128 bytes.
> So we introduce a new sub-op GET_CPUFREQ_CPPC to specifically print
> CPPC-related para.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v4 -> v5:
> - new commit
> ---
> v5 -> v6:
> - remove the changes for get-cpufreq-para
> ---
>  tools/include/xenctrl.h     |  2 ++
>  tools/libs/ctrl/xc_pm.c     | 27 +++++++++++++++++++++
>  tools/misc/xenpm.c          | 47 +++++++++++++++++++++++++++++++++++++
>  xen/drivers/acpi/pm-op.c    |  4 ++++
>  xen/include/public/sysctl.h |  2 ++
>  5 files changed, 82 insertions(+)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 965d3b585a..699243c4df 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1953,6 +1953,8 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
>                          int ctrl_type, int ctrl_value);
>  int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
>                          xc_set_cppc_para_t *set_cppc);
> +int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
> +                     xc_cppc_para_t *cppc_para);
>  int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
>  
>  int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
> diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
> index 6fda973f1f..3f72152617 100644
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -366,6 +366,33 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
>      return ret;
>  }
>  
> +int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
> +                     xc_cppc_para_t *cppc_para)
> +{
> +    int ret;
> +    struct xen_sysctl sysctl = {};
> +    struct xen_get_cppc_para *sys_cppc_para = &sysctl.u.pm_op.u.get_cppc;
> +
> +    if ( !xch  || !cppc_para )
> +    {
> +        errno = EINVAL;
> +        return -1;
> +    }
> +
> +    sysctl.cmd = XEN_SYSCTL_pm_op;
> +    sysctl.u.pm_op.cmd = GET_CPUFREQ_CPPC;
> +    sysctl.u.pm_op.cpuid = cpuid;
> +
> +    ret = xc_sysctl(xch, &sysctl);
> +    if ( ret )
> +        return ret;
> +
> +    BUILD_BUG_ON(sizeof(*cppc_para) != sizeof(*sys_cppc_para));
> +    memcpy(cppc_para, sys_cppc_para, sizeof(*sys_cppc_para));
> +
> +    return ret;
> +}
> +
>  int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
>  {
>      int ret = 0;
> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> index 120e9eae22..bdc09f468a 100644
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -69,6 +69,7 @@ void show_help(void)
>              " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
>              "                                     set the C-State limitation (<num> >= 0) and\n"
>              "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
> +            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU <cpuid> or all\n"
>              " set-cpufreq-cppc      [cpuid] [balance|performance|powersave] <param:val>*\n"
>              "                                     set Hardware P-State (HWP) parameters\n"
>              "                                     on CPU <cpuid> or all if omitted.\n"
> @@ -996,6 +997,51 @@ void cpufreq_para_func(int argc, char *argv[])
>          show_cpufreq_para_by_cpuid(xc_handle, cpuid);
>  }
>  
> +/* show cpu cppc parameters information on CPU cpuid */
> +static int show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
> +{
> +    int ret;
> +    xc_cppc_para_t cppc_para;
> +
> +    ret = xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
> +    if ( !ret )
> +    {
> +        printf("cpu id               : %d\n", cpuid);
> +        print_cppc_para(cpuid, &cppc_para);
> +        printf("\n");
> +    }
> +    else if ( errno == ENODEV )
> +    {
> +        ret = -ENODEV;
> +        fprintf(stderr, "CPPC is not available!\n");
> +    }
> +    else
> +        fprintf(stderr, "[CPU%u] failed to get cppc parameter\n", cpuid);
> +
> +    return ret;
> +}
> +
> +static void cppc_para_func(int argc, char *argv[])
> +{
> +    int cpuid = -1;
> +
> +    if ( argc > 0 )
> +        parse_cpuid(argv[0], &cpuid);
> +
> +    if ( cpuid < 0 )
> +    {
> +        unsigned int i;
> +
> +        /* show cpu cppc information on all cpus */
> +        for ( i = 0; i < max_cpu_nr; i++ )
> +            /* Bail out only on unsupported platform */
> +            if ( show_cppc_para_by_cpuid(xc_handle, i) == -ENODEV )
> +                break;
> +    }
> +    else
> +        show_cppc_para_by_cpuid(xc_handle, cpuid);
> +}
> +
>  void scaling_max_freq_func(int argc, char *argv[])
>  {
>      int cpuid = -1, freq = -1;
> @@ -1576,6 +1622,7 @@ struct {
>      { "get-cpufreq-average", cpufreq_func },
>      { "start", start_gather_func },
>      { "get-cpufreq-para", cpufreq_para_func },
> +    { "get-cpufreq-cppc", cppc_para_func },

Didn't Jason also suggest that we would better not introduce a new command, but
rather make get-cpufreq-para invoke GET_CPUFREQ_CPPC as needed? Considering that
as per patch 15 the same information is already printed, I think I'm a little
lost with the need for this separate operation (and command), and then also with
the need for patch 15.

Jan

