Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14458B969F3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 17:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128512.1468846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v155y-0006Gb-6q; Tue, 23 Sep 2025 15:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128512.1468846; Tue, 23 Sep 2025 15:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v155y-0006Ev-2T; Tue, 23 Sep 2025 15:38:22 +0000
Received: by outflank-mailman (input) for mailman id 1128512;
 Tue, 23 Sep 2025 15:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v155w-0006Ep-KT
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 15:38:20 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539eb33c-9893-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 17:38:18 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso8325f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 08:38:18 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77dfbab0d7dsm14027525b3a.60.2025.09.23.08.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 08:38:16 -0700 (PDT)
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
X-Inumbo-ID: 539eb33c-9893-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758641897; x=1759246697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkpa050QiuFYPeSbtJ50+R6ZAITj31cmBB1nCQNZsfI=;
        b=AyZLhsb9/DKQn8kTi+y91gkIBJxRzz8hdsvWwBULqbqrfZV8oi62JgbYCRi4S7i9Vg
         yGkFFd0KhTJCkZAJyrTX2C+UdVPpQ1FIMhEtpKKzCjtluk5Bdf72KzdYPGAxk1r9GUjA
         SlOZKps4hzMiwW52KG9C5ONgIbhHvbK98mDK/I+cVzoMRQYdLq20gP0bWCLirRnblwrq
         BDPh/FR5NLA0GQXS2daZrSgXbAfMXikapWKci/kr8XxkOpJFWtsDG08RFKHGlSHwKTW3
         2ZNiFP/4+/dOOCuBNZWAG2EgaK6U9Ve/uiWO4KZZNi9zw4u2vJgj7fv5qDW50kyeLYKZ
         GT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758641897; x=1759246697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkpa050QiuFYPeSbtJ50+R6ZAITj31cmBB1nCQNZsfI=;
        b=WI/qCCuFIlsUbqV6qGGP8ls84bE2YIrIbIIR7OzA49bUSQsNMLovcQgvSiiPB2XgZO
         PDrQg86lUhJqRfEEimHNe56WuHwjxzpRG8PfcadMVqmTXeE+H6+i0jDpEi03Wg4JhI2z
         gvBMDGIOsjCn4OM4LWw9iLr5AMvpqsGNaBFqGxGC7/Hnu4EY7nxihxuB2ZnDk1YbTSA5
         F0peAWiHmE7NdqqnOCob52AUx7IXOzuXa0YnzsPaxwpMiZh2kr+lbF2hIWeZmjL4ycNK
         0wIgQFcx+xVF0BLCv/V0mTiPtNcBNe2C43BpyJ0tdZpHFT7qt1ynshHv+2TkSd+TM7Gn
         XRNw==
X-Forwarded-Encrypted: i=1; AJvYcCVi9XTt8lPKOX+bKp/G7oVBBnriKqM9eVNDFFrFw/aEY70k9fjvDNXAl20JlwxGV1PJTFko+i1w29k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNTXSVnqBdu/IyeFFPQPZW3s1frgc0bcw8JQoipYF0PnF2T79l
	ANi7tAHdkqdyiCDEvH8SETb5f2/1hg+tbXeuSqF7w0eFjaR9dSP9XQOgMZEYv4LQpA==
X-Gm-Gg: ASbGncvHdp/j0ftjhsk/DZT5jyvwS0ooNTZEYuCqtQhfs6eROfNDkqXnOybIc/zaVeK
	SavFEa6L2ONOlxbe089yR3j+0QYxi2oxdp3FiBT3n2s6JjHWqVkk4DkMehrBT2MLz7FzTP1fIeI
	y3+Bc6iONyeqxzwXvkwM69+SsVuP5aUFzlGZS9O/9bEd9KRLYdtqeqaxBIzQTmhcIe1QLXeVjO3
	BBT1sSt7l92qr993Sg1VaF1UR516R6akOPj90UcpR4XfJ87bQdpdkQj6iQYtJU2lXJ29V9DS18C
	32t2BB1FPxKQP/aZSDM5lDGLpTVCegJeMJ0BHeNk+zi8CtQ9cUwyrmDdFY8NG0QIiNKq0tJb08e
	a87ZLfHBJQTPmr+EqJqq7lXHhmCZHUTVEnPft+m1EE3Y=
X-Google-Smtp-Source: AGHT+IFuZOw5+Sw+/gOiO5oP+KbpRlNGoJIXK7Lt06PWhToG3M/JX3V3sqXQkyTiNamM0l9u023UBg==
X-Received: by 2002:a05:6000:18a5:b0:3ec:42f9:953e with SMTP id ffacd0b85a97d-405cb1fbf3fmr3039734f8f.7.1758641897376;
        Tue, 23 Sep 2025 08:38:17 -0700 (PDT)
Message-ID: <5a2e887f-d6da-42e2-aff0-efe55b041749@suse.com>
Date: Tue, 23 Sep 2025 17:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-8-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250923043826.3831957-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 06:38, Penny Zheng wrote:
> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      else
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
> +    /*
> +     * In CPPC active mode, we are borrowing governor field to indicate
> +     * policy info.
> +     */
> +    if ( policy->governor->name[0] )

amd_cppc_prepare_policy() may leave ->governor set to NULL afaics, so I
think you need to add a NULL check here alongside with pulling this out
of ...

> +        strlcpy(op->u.get_para.s.scaling_governor,
> +                policy->governor->name, CPUFREQ_NAME_LEN);
> +    else
> +        strlcpy(op->u.get_para.s.scaling_governor, "Unknown",
> +                CPUFREQ_NAME_LEN);
> +
>      if ( !cpufreq_is_governorless(op->cpuid) )
>      {

... this conditional.

The description also continues to not mention the effect for HWP. I'm
actually somewhat confused, I suppose (Jason, question mainly to you):
HWP falls in the governor-less category, iirc. Yet it doesn't supply
a .setpolicy hook, hence __cpufreq_set_policy() goes through the normal
governor setting logic. What's the deal here? The answer may affect
whether I'd deem the pulling out of the conditional correct (or at least
benign) here as to HWP.

Jan

> @@ -178,13 +191,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>          op->u.get_para.s.scaling_max_freq = policy->max;
>          op->u.get_para.s.scaling_min_freq = policy->min;
>  
> -        if ( policy->governor->name[0] )
> -            strlcpy(op->u.get_para.s.scaling_governor,
> -                    policy->governor->name, CPUFREQ_NAME_LEN);
> -        else
> -            strlcpy(op->u.get_para.s.scaling_governor, "Unknown",
> -                    CPUFREQ_NAME_LEN);
> -
>          /* governor specific para */
>          if ( !strncasecmp(op->u.get_para.s.scaling_governor,
>                            "userspace", CPUFREQ_NAME_LEN) )

