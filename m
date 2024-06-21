Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB90911BCE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 08:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745049.1152182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKXnH-0004Hz-RG; Fri, 21 Jun 2024 06:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745049.1152182; Fri, 21 Jun 2024 06:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKXnH-0004FJ-Ng; Fri, 21 Jun 2024 06:30:43 +0000
Received: by outflank-mailman (input) for mailman id 745049;
 Fri, 21 Jun 2024 06:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKXnG-0004FD-Sq
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 06:30:42 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c84fce6a-2f97-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 08:30:41 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso18791291fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 23:30:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d51easm6610875ad.202.2024.06.20.23.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 23:30:40 -0700 (PDT)
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
X-Inumbo-ID: c84fce6a-2f97-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718951441; x=1719556241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Do55SX1Xtly8OcIn10bRIQgkWMrsF5SLlmDVtW8D6y0=;
        b=fCIv4zTRq/IP4BORhL/GRYnNWyIcPUCZxeY9kSFnZ0qUx0qXQtpD+Ek1MrrGeCess0
         y5W9TwehbcCJLC33yNASlQdejv7YR1o5g1azk8U8xnk6gABMXuScHB9zunEfWpK0IGLz
         g0nsDw9kQaRTTJmOnXcRjrwRLEmPhlZTUzeiPFLchFXQQlehF2wSOoRD2FePM2U5pz5U
         4iQF14MOxrjt3yIkInrWC80AET0TgtYiGa3l+8qbaxjYeFkj6XCVfBgtukU144qZREQL
         +kvfR8PK1QtyJY8E/p6kvC2R/vx4OzxERmgEny3Z9HG8+Qw601K9jkBC5rLu2/IvK2qG
         OArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951441; x=1719556241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do55SX1Xtly8OcIn10bRIQgkWMrsF5SLlmDVtW8D6y0=;
        b=OrH4TRDhu1AAKKXVx4WWltLwGPRDur2SHWyzeZjfQIfsxq/8OrZ+L+wJLrTUs40+0A
         6TrjTEvYytgHTNKlGp7fQ5KlZRZDvarGKLTthww4Of3iS2J103Ma0FCSlEw6Ggs1j0aF
         UDnakLAdo9RVSN1eSSW/dzh4L860gUNITnOBq9YksrGKYV0jksfxKJ+80U6N3iCCFmSu
         GRwPb+Ow3E9gikEHxw3NDYQLoVnHOna3f2w60gLbL4pPdkG8BljKf6I6WwHBDavR/FnA
         3sUVLmn2A5F25GjUgE0nTm74IJUH+Q/pzbqkv6tR2snUj7K5uVGVagwCAxyClho2CQbR
         AQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCUq/y84XRuGO6z0LQMKJJavttsa5zm+JaPJglsruddWJGWU8HeaUh/+I4FTLGVoBVhREwjvfiZzG2kXDwXS3A6Hf7phnpZn/YTDI+OkgSw=
X-Gm-Message-State: AOJu0YwuS2BjQGUSjwUJ4wCRpO199gWAjkOqhUQecoY5FbCJ2dKRl3uX
	2lFMaGe8iYsO3d76rGcSvpf/iHq/oc2FwF+XDEfQEFPeJBXGB/0AThqU0vfxww==
X-Google-Smtp-Source: AGHT+IHnAtC17luwHsZRMvQcl/dKMlDhBYwHhohXh9nkdd3HJuHyHFqWF3hcJmLWLwYGphMnkCrQUQ==
X-Received: by 2002:a2e:9acd:0:b0:2ec:4aac:8fd8 with SMTP id 38308e7fff4ca-2ec4aac9280mr14890471fa.1.1718951441373;
        Thu, 20 Jun 2024 23:30:41 -0700 (PDT)
Message-ID: <aa343c91-d705-457b-8e67-8924c8252e5c@suse.com>
Date: Fri, 21 Jun 2024 08:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] common/sched: address a violation of MISRA C Rule 8.8
To: victorm.lira@amd.com
Cc: sstabellini@kernel.org, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <5b6dfc7571bd76b5546d3881bd660a4e7a745409.1718928467.git.victorm.lira@amd.com>
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
In-Reply-To: <5b6dfc7571bd76b5546d3881bd660a4e7a745409.1718928467.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 02:20, victorm.lira@amd.com wrote:
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -1476,7 +1476,7 @@ static inline void runq_remove(struct csched2_unit *svc)
>      list_del_init(&svc->runq_elem);
>  }
>  
> -void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
> +static void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
>                    s_time_t now);

On top of Andrew's comment, please also obey to line length restrictions.
This thus needs re-wrapping, to either

static void burn_credits(struct csched2_runqueue_data *rqd,
                         struct csched2_unit *svc, s_time_t now);

(then matching the function definition) or

static void burn_credits(
    struct csched2_runqueue_data *rqd,
    struct csched2_unit *svc,
    s_time_t now);

Jan

