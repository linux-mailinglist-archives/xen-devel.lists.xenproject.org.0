Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F0A60D42
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914228.1320011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1K6-0001pv-MD; Fri, 14 Mar 2025 09:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914228.1320011; Fri, 14 Mar 2025 09:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1K6-0001oE-JO; Fri, 14 Mar 2025 09:27:22 +0000
Received: by outflank-mailman (input) for mailman id 914228;
 Fri, 14 Mar 2025 09:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt1K5-0001o8-Ua
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:27:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8768b7cf-00b6-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 10:27:20 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so12627985e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:27:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d200fae32sm11004635e9.31.2025.03.14.02.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:27:19 -0700 (PDT)
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
X-Inumbo-ID: 8768b7cf-00b6-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741944440; x=1742549240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZWvYCAzh1yX1DaJgu1fvFwOeD8btmo3VZhXUV0kWEA=;
        b=WGhLc0R16rtpZsOsXXH94pfKfc+2PP5mHuHcQqSOJmWW230udeaWTQJIJyHl9loZY3
         WZjr+YeFekGhnVqJ6/atuWZvz2W9YQI6TGBGtak4kvpcAsAKyovOEMUo8m4jkyygauHB
         ofs5xWXO1cfUpZxYeXyLtK/EvDCp9VQAcPqDGgmDK6hGUOxcwMyylswwL92bbo3JLf1s
         gfLmieliY7peDE83zqJWt0QguOCQaH54twXQz0hSoez+yqO+WjFUi+H+oLxoW5INeplX
         HZ4qWkw8YW3O2sCz1/qtVcTWNOj4z4WGs1q2Y8WrwizI9dipDarShFFjr5YwBF0PGApC
         Hfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944440; x=1742549240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZWvYCAzh1yX1DaJgu1fvFwOeD8btmo3VZhXUV0kWEA=;
        b=AHT1xAfKN0qTKd50c8iKIu5APJEvtOX/vCmGAwc09tmIKuPY4IQs2En6OhsIBI2mRu
         q4RddO9CHWUM/5AYmBewGV8UVrqgiNfj1liS19zwsyNRg+8rRMfR52rFYM9lQGBjYzU+
         gUZzMrav6d7k1R9w6e1tvCjHKE8iInZiC/mJmDvHM9yc3gC4BRZCV7h5+tx+NCr+0XuD
         CXQjuPVEjHh8Fvh72q/OBDdQOUguL/dVzkxDMNSo64KeARXgG8hI4lqOvF9amG1cDjEu
         lF02KkLjm6TmOt8Rl74DTwb5VQevAmydl6WbNaCO+3oKVyX+RtK7NEIH+g1Aanmk/rxi
         2ILA==
X-Forwarded-Encrypted: i=1; AJvYcCV2NAtSN2aR02/uqHVqE5oMU/B8p1sTKSR8GqGoqIqmcP94oFQW3p5TqeekMa+bd5lA42fst5Qf3sE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG36V0rH3rdIlvfeTyKID9Ap/cNOOadZVbNadQAzOpZynzHN9C
	k9/X61s9cXlm061Ay6wBiFtGkwdw9AclXsMyJXyFSzHAgOMXYDw8kC9Cz9U3UA==
X-Gm-Gg: ASbGncvLSwqG+QktcuVqiujs81MSVLNuab2yUsDSJPcVR4jf/Gy5JDYP7EI6/IackvZ
	oQixkhsIOw8chYimrR4+BeZzS/oN5UxY9DhlwL7bj4/CQflmqx9XD6prRnW/H6TGah5y4n0Bzy6
	zInGHI7HsrXUbl7lqB9CKEwX7Jj5k92EkVzqGe4ltfNsyYSO6rzsaCQQjC3Ct/h867lZZJm+rW/
	nYf2P7q02Qjr4s3rb/7ioyvlLj0N8aP6mVkdFU6XvibVsg8HYLSXDnZxih0TIIqI2bIWUsBYf8R
	4O3DnKL6W8tchjo9x5jMlOzitHOR0rc5HMnnN2iRo90NHENRjF+K2M4B8wzHYKpLGqqfLnibL0h
	Kz/YsKHNQuhIdm6uxy8nd2z20HUlwzQ==
X-Google-Smtp-Source: AGHT+IGTbFqJS0baiPZnJTVCVX4JN8Z7qyN+ToFu5qXaEEm4xlSSINu9axdsvtw1odepLepbPvN5cA==
X-Received: by 2002:a05:600c:5493:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-43d1ecb430cmr24775675e9.11.1741944439991;
        Fri, 14 Mar 2025 02:27:19 -0700 (PDT)
Message-ID: <b8e760b1-df5a-414e-862a-34fd66f957c3@suse.com>
Date: Fri, 14 Mar 2025 10:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/19] xen/sysctl: wrap around sysctl hypercall
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-20-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-20-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -69,7 +69,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
>  obj-y += monitor.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o

This wants to move back up then, into the main (alphabetically sorted)
list of objects.

> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -195,7 +195,9 @@ kexec_op(unsigned long op, void *uarg)
>  dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_SYSCTL
>  sysctl(xen_sysctl_t *u_sysctl)
> +#endif
>  domctl(xen_domctl_t *u_domctl)
>  paging_domctl_cont(xen_domctl_t *u_domctl)
>  platform_op(xen_platform_op_t *u_xenpf_op)
> @@ -274,7 +276,9 @@ physdev_op                         compat   do       hvm      hvm      do_arm
>  hvm_op                             do       do       do       do       do
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +#ifdef CONFIG_SYSCTL
>  sysctl                             do       do       do       do       do
> +#endif
>  domctl                             do       do       do       do       do
>  #endif
>  #ifdef CONFIG_KEXEC

As indicated earlier on, PV_SHIM_EXCLUSIVE likely wants / needs sorting as
a prereq anyway. Otherwise I think the new #ifdef-s better wouldn't end up
inside the PV_SHIM_EXCLUSIVE ones.

Jan

