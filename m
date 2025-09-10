Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB5B51C80
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118551.1464294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwN7X-0000Bg-AM; Wed, 10 Sep 2025 15:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118551.1464294; Wed, 10 Sep 2025 15:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwN7X-00009c-7k; Wed, 10 Sep 2025 15:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1118551;
 Wed, 10 Sep 2025 15:52:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwN7W-00009W-0W
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:52:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25720856-8e5e-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 17:52:25 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b0787fa12e2so159161066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 08:52:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b078304793csm189909466b.3.2025.09.10.08.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:52:24 -0700 (PDT)
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
X-Inumbo-ID: 25720856-8e5e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757519545; x=1758124345; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KteYudVUBAYXnP0aIwiiCDvHDtysBL6DUl4cB16YF8g=;
        b=RQn7aTTcsLtqr1JFmiikZl8NB3etmuWneto79PkL5Zg35dG0/RRQh7qLulfnOBzbyc
         qIHRkJT3p+c4WiM3QvPurRtadXmLYeVVYZrDXC6+lrmzEyH3KwPBlwgY3/TD9R76cF4A
         FyWmHwFazrk5UOpzC6ejia80S4mRnFWzRGkoxTCfZKvvxenc7poi1G1XVCxAUJyx/w02
         IqJC/2ZlRffb0FD6Jqf7P9YlJNcePzEB36k/ndZgaTmrQBSAm+a9YigdEozFwT+k14Cu
         sIEnoaeoc22pU1KfIpU+CmmIMRsTrJrlwk8qRcoj7Ds5cfoSgirc39lu+2pwdsTi1CCk
         7J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757519545; x=1758124345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KteYudVUBAYXnP0aIwiiCDvHDtysBL6DUl4cB16YF8g=;
        b=OB5GwBWpQdfcWWLLmiaUH4tU16L+LGW7iAXpaYsR8fZojDVOl4g72SufVpI6Ei1kc5
         u5Jusxz0b6A9yRcJO5QJUaLlGJC/0jYpqQkWk1zpt2Rw9xy/0eBL/tPl+PdU5uCqilex
         zSKhOkFd2KlDO2PKiEkT1e8OGxS3Us8EKXWeaVz6gpkgMxnOLuWjjsH/UmiL/h2OsXTR
         6wREssbV4rvYXh7VuHdHgsFV82eBbwim9QPVbOB+jIr/EBkQ+WyKUOjNA6WFKKuj5QAb
         JNgcsaz9I2rocKx0tWrhysOlwUXLeK7G8ozhrCCeQm5fXNgcm3AU8HdFZIxEY4IN9Y/x
         k6qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWANMonRKReK5bRgbprFFwNrWfusqUiMd7tJKP21+fGXc4r5h5N350Vr+SCFD3u37+PfJtqnrv4Muw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytnoVTskLRA9UfvlbGbUOGEex8xlodfDt/xqkfme3P277ExIFJ
	6DGgQVP+FVPV1mGV0zaMfXC9VrinZcv1w23hmMnkdII7HydQFNwpiD7EQRasUTlQgw==
X-Gm-Gg: ASbGnct6lay318s/jqdqJX7BiX4QkI11jF7GFN1K5iwH7KgFnrSBRG0ZJ9uRXuIqGEB
	fHKM3zX+kKcoYRGOaHDI5rYyVQyUAx9rJ7j6W7hdbmISWUEE0swdNS6IGQP7z0QVjPOHCJy09iZ
	DzTmzJs9LnVUl6EArZDq276df0vyQQqfb4uVDXJtkcss+/hPKbkxfWd02u4Ju6k9ZwjF5L0ltFZ
	ks0/x99sPFL5Fhji1rJv0ba3iaO7GQULifwa1iD5JxiKqaf7Ub1VQ7rUd3xXyTpvZF+ZU5S+U79
	QhdERezzQMvaPJO5LibWZsAu2wmt1C3v/Zb+8SpbdUDPuv1mPCAJn6ZBLYwXwiuHE1Ceiu+07hd
	4wd+basuQar8WNkROdnN5rG22V5VbSVqfS8QktN3/6o8GLS2E3cyeYpIOH1D8N51pttWaVWoRGX
	gTXQjEp+GgmtwpCtvzGA==
X-Google-Smtp-Source: AGHT+IHFcfHyz3XjGpe3MaRZBARPqkWNLnc/UGEkZH9UwsNBjlG1MQCITSwGb3fx7zU6GexcQ2LdhQ==
X-Received: by 2002:a17:907:8688:b0:b07:653d:56a8 with SMTP id a640c23a62f3a-b07653d5843mr743781066b.5.1757519544971;
        Wed, 10 Sep 2025 08:52:24 -0700 (PDT)
Message-ID: <b892d18a-7a5c-41d8-8a9f-927e772f3719@suse.com>
Date: Wed, 10 Sep 2025 17:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/26] xen/domctl: wrap vcpu_affinity_domctl() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1402,10 +1402,12 @@ int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity)
>      return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_hard_affinity);
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int vcpu_set_soft_affinity(struct vcpu *v, const cpumask_t *affinity)
>  {
>      return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_soft_affinity);
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */

Again preferable to get away with just a single #ifdef (i.e. ...

> @@ -1693,6 +1695,7 @@ int vcpuaffinity_params_invalid(const struct xen_domctl_vcpuaffinity *vcpuaff)
>              guest_handle_is_null(vcpuaff->cpumap_soft.bitmap));
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS

... this one) here. In fact I question the value of the helper: It has
a single caller, so what the helper does could easily be expanded at
the sole call site ...

>  int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>                           struct xen_domctl_vcpuaffinity *vcpuaff)
>  {

... below from here.

Jan

