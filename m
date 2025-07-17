Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF9B08DE1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046881.1417285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOO3-0000Nq-Ev; Thu, 17 Jul 2025 13:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046881.1417285; Thu, 17 Jul 2025 13:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOO3-0000Kj-CB; Thu, 17 Jul 2025 13:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1046881;
 Thu, 17 Jul 2025 13:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucOO2-0000K8-5E
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:10:58 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79f7b91d-630f-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 15:10:57 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so792297f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 06:10:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4341d13sm145992215ad.182.2025.07.17.06.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 06:10:53 -0700 (PDT)
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
X-Inumbo-ID: 79f7b91d-630f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752757856; x=1753362656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vJvfQDdVOhmqtFK/N/nDmliu4xuqv4EIsKvKASpOAdU=;
        b=RNWsT0EtVPv9PjQ7dLczwi0hk9icQKxpV28tHakhhG8XZFmZIyhlLu8YARbbNyPiHu
         fvP7YYyZssjZ48TZlwI2hJE8iIx1/srRxip38fndWd4sYfNPk46MBM0PJsc4gga+Mgxf
         GNEGqBAbtC3lkjk/Ir0nQSQtDpBWSKGaAHFSAb5odHhRG8l7NrM/wqqpU/5RSSDePWDD
         8jpICPbh1n8xr/u3+2Mq2iVL6OcqzUw0gzeRqwfG0WXOhZN7KGdjGWpqXb8K++cRRhKT
         586vdtlumlzyqSJaARXaOSkq6hSuouD2bVn1lPsxGZMLKaX7JeBXImz4X+7qArFQksvB
         fvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757856; x=1753362656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJvfQDdVOhmqtFK/N/nDmliu4xuqv4EIsKvKASpOAdU=;
        b=FAf7j0h/dq8ywepgmQ44iLmVs0UuCbEljnb0spg738E0YLyfytrQ33vtZr+1BRAmY2
         zMrBZisqvWbkgsNkbcE8ryv+nrv1FLl+2ivVAi6Pxojko8UbDy5pMxOTn1TknNXZvJk1
         M5s61ih1DiTar7HFtrEUSzJV/2u+TDbwCQBblCKAz8HQi4qnYsi73RiHSHNk3AC9muGa
         wKwoucu3KP4HDnayf5hAXep9cBQhm5IzggVxM3Wq0gFrajyeajslmVlVVFUc/DVJiQ/Z
         DVt7JvCEcByTCu8nNx2YbB2O0eK94TtRwmHHSm27c1Sz7RlyE/XyjPo0ZrsuUYbMo5IF
         H1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVplu9pc2HmmBsKxq0hIRJkAkoNBkhdqtoHR+YeB8qdl2IflYN8IA/VTEOnp82iSIQhEt6IQBoE9FQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeoeMw2ogVCpgCFQ62/aOs2uWb1T1c81H4+TCsbgL/zSBitBlw
	qjvSG1LG8x1gD8eNIyejcYFoCe+micoxm29AAe2VaN8F81cjl1nQejEyfxXi/DG3ig==
X-Gm-Gg: ASbGnctAYNyEB0iKDkaZZjg9vdT/+U3+l3nvUYprRGqQ7hNlKKT8+Xo8AX7d6Rf2pdc
	gXKFasII8FQfdtm6N2qD243xYHc3ai2hdr1qSBiqrS5bxQe5W0ecn2Sl2NsFdBgzR8zpi5xk5/I
	xGw27BUCEp4XQO02hshfKXKVPlLDoGQZLo+v6qqHNsSxw5g3hC8qo08HhP5h1vsNZv81BP+PAXb
	VLlTn6wJdnclBycuuiyRny5Ub1HsiVdOSsUJCv9erdRc2MUIUU0ziWGtXH53l87NolWwMVwUHaW
	Lp2579qayYnAc9OBw5kZI5SDd6hU0eEqWEtri70GrpLYuIrMcIQNY7XPVFJ4DCngWBtCjJyUXr4
	LKPBeeVW7cb+leWD8M28vabb11WJEDuCBlAveMUiy6zjBhcslvDBWk3Ge94nT0Jfo0GH7rfMlPm
	RtCogT2aY=
X-Google-Smtp-Source: AGHT+IGvUb5HupG40yaD2HyMKQmlcZWvKqNuxzlQC+QAGV9E1cxLuxZ1E5Ye2c38dGhwBjz+XfESPQ==
X-Received: by 2002:a05:6000:3107:b0:3a5:8c27:8644 with SMTP id ffacd0b85a97d-3b60e4ca2dcmr5481989f8f.24.1752757856498;
        Thu, 17 Jul 2025 06:10:56 -0700 (PDT)
Message-ID: <d8778c57-c934-46d5-a600-dcdb2ca5ec26@suse.com>
Date: Thu, 17 Jul 2025 15:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250717130147.2842159-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20250717130147.2842159-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 15:01, Grygorii Strashko wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -975,6 +975,9 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
>      int port;
>      struct evtchn *chn;
>  
> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
> +        return;
> +
>      /*
>       * PV guests: It should not be possible to race with __evtchn_close(). The
>       *     caller of this function must synchronise with pirq_guest_unbind().

Isn't this function unreachable on Arm, and hence a Misra rule 2.1 violation,
requiring #ifdef around the entire function to address?

> @@ -1710,10 +1713,15 @@ void evtchn_destroy_final(struct domain *d)
>  void evtchn_move_pirqs(struct vcpu *v)
>  {
>      struct domain *d = v->domain;
> -    const cpumask_t *mask = cpumask_of(v->processor);
> +    const cpumask_t *mask;

This change shouldn't be necessary; compilers ought to be able to DCE the
code.

>      unsigned int port;
>      struct evtchn *chn;
>  
> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))

Nit (style): Missing blanks (see other nearby if()-s).

I wonder though whether we wouldn't better have x86'es arch_move_irqs()
invoke this function, and then #ifdef it out here altogether as well.

Jan

