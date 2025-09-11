Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F57B53085
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120024.1465129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfYn-0006ch-6N; Thu, 11 Sep 2025 11:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120024.1465129; Thu, 11 Sep 2025 11:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfYn-0006ai-3m; Thu, 11 Sep 2025 11:33:53 +0000
Received: by outflank-mailman (input) for mailman id 1120024;
 Thu, 11 Sep 2025 11:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwfYm-0006ac-8v
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:33:52 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3070dbb5-8f03-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 13:33:51 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b07883a5feeso105415666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 04:33:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da289sm114200166b.17.2025.09.11.04.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:33:50 -0700 (PDT)
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
X-Inumbo-ID: 3070dbb5-8f03-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757590430; x=1758195230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TeRftCh6CmvexS9+5z6TL7fW/ZDSwEmG+WJ1MAF1Li8=;
        b=CsD7WK3s9dTPNE1BMRHrsHWRVo7Gom8hLDkjeQ/Sj720iuF+1IrEk/8Kq9WVnou9zR
         VHk5xhVgkI+lCMrwnzyU8pUNWCaHrCmm2pXW25GqvT8Ulb3XY3b/LgprmdX+EuRHV3Te
         EXNUsNqdgw2NT83V6XmDy/awfWtD8sUd38u9EgmdPjCcrCWS+nhz6m0dhnxisoVsozVo
         vNZsg5kQhwITxbGNxQ1MMPkciANbWX1CqIG1OVLN/6pKu2u293BsRiBDvPuahXp47UOx
         UpgYBA5QKpUBM+ow11TYMIcK4c9hniSFSgcKeVvuYESP3NNqtRAuTJALaeAWiTyxigjg
         Tvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757590430; x=1758195230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeRftCh6CmvexS9+5z6TL7fW/ZDSwEmG+WJ1MAF1Li8=;
        b=YnaN43o/9RGOMoNjYEIYkIIkJRXpo4sWMa6ogQW9QIH5eV6FVaiKa0+6r564X5ChS6
         fTMjNb71yOhIoQX+rCUXXNNn0Pq3jaLrDeqrDlgJBM1mi3S8zpTLC9Z2gE7tzQO/g6Zl
         NCWxbd63YwD5bJUKmZ4W+H1MD4+m30iWtd+Phj0t41Fd0Q515nI0+Vc5IjxVdHhkqjq5
         phMTytutyN/qELdKc1SmMGvgVL9ZTUtPF7w4FcN2cW1BFxNK7SDV6AD+UKkzi4X2pzj1
         upG6SVuHLN9pdL7WckZxXlv8YlDT/5EohsPEV9n3hprFyd+n0q3w7a0d0XmWmiioU7u/
         nnOw==
X-Gm-Message-State: AOJu0YzBMUFWVrASzu6reZ7y8VInM158MJ1aQbTj3oXTVjwrY/CTlAo3
	k/S2sE5ySEPattum4R2sWB6M4wM4kcXWPsgfJbeUI+uQM5sz/ddlYrQFbp3ijATjjw==
X-Gm-Gg: ASbGncv9fvkwvwXLLGNsbvjw7X5AL2jEshSwURmmfNkoqTFHwM4H3R6yUYYaGLQsqfm
	NpK5rq1MzmVFhIc9aaCEMH+EJbgQGdrMWYEzYGFnsGlD4WK9wRhGcSPR6FJ8vy9PtbVMa1TA8+5
	1kAWsBMAcVuXOpJYNwNQAJwrO19r2wNB95exuD4Xz/+qY65Sqt2xvRQ5r5F/GKjnD8MnlORhjxf
	Co5MzPtjVijtuIR4HcpdCinKUE+0ue+25sMjC5A7i33Wv17K04JFe2QYU51FHWGXCR1gK0EBKz+
	3yYO2bCJbyYzlRPquaPhVtV9ZUc8Bstluo8QXx2uTLYiJgM2aHftKYI4oFvBErIM9s5KNqZeGnx
	UL4Z9FpS+KiO9Z+z39GC3T57jI0lnNYcXLs63huybiJC2oBizGqH2CFKXztkpIyGs+yY7Kkty6C
	MvX1JUqo0=
X-Google-Smtp-Source: AGHT+IEcd8/XntfiHd7x0vWf9fdavgBOdbJ3MF5Fl95o9WchJO93pj3zk+bLiwsOyTeIn0DyneqY6w==
X-Received: by 2002:a17:907:9612:b0:b04:70f8:d454 with SMTP id a640c23a62f3a-b04b167e38fmr1815371666b.51.1757590430318;
        Thu, 11 Sep 2025 04:33:50 -0700 (PDT)
Message-ID: <62c80f82-d85d-4d11-a7f2-4193bc882911@suse.com>
Date: Thu, 11 Sep 2025 13:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/26] xen/domctl: wrap xsm_set_target() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-18-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2509101937040.52703@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2509101937040.52703@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 04:37, Stefano Stabellini wrote:
> On Wed, 10 Sep 2025, Penny Zheng wrote:
>> Function xsm_set_target() is only invoked under XEN_DOMCTL_set_target
>> domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>> v1 -> v2:
>> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
>> ---
>>  xen/include/xsm/xsm.h | 6 +++++-
>>  xen/xsm/dummy.c       | 2 +-
>>  xen/xsm/flask/hooks.c | 4 ++--
>>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> No change to domctl.c ?

And xsm/dummy.h ?

>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -59,8 +59,8 @@ struct xsm_ops {
>>  #ifdef CONFIG_MGMT_HYPERCALLS
>>      int (*domctl_scheduler_op)(struct domain *d, int op);
>>      int (*sysctl_scheduler_op)(int op);
>> -#endif
>>      int (*set_target)(struct domain *d, struct domain *e);
>> +#endif
>>      int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
>>      int (*sysctl)(int cmd);
>>      int (*readconsole)(uint32_t clear);
>> @@ -258,7 +258,11 @@ static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
>>  static inline int xsm_set_target(
>>      xsm_default_t def, struct domain *d, struct domain *e)
>>  {
>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>      return alternative_call(xsm_ops.set_target, d, e);
>> +#else
>> +    return -EOPNOTSUPP;
>> +#endif
>>  }

Again I would have expected for this inline function to be wrapped as a whole;
the title says exactly that, imo.

Jan

