Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F226C8B76F6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 15:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714890.1116267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nUK-0002D9-2p; Tue, 30 Apr 2024 13:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714890.1116267; Tue, 30 Apr 2024 13:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nUK-0002Ab-00; Tue, 30 Apr 2024 13:25:40 +0000
Received: by outflank-mailman (input) for mailman id 714890;
 Tue, 30 Apr 2024 13:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1nUI-0001ln-Ig
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 13:25:38 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21de41a8-06f5-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 15:25:37 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34a32ba1962so4546148f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 06:25:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e14-20020adfa44e000000b0034cba8cabfdsm8061632wra.107.2024.04.30.06.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:25:37 -0700 (PDT)
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
X-Inumbo-ID: 21de41a8-06f5-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714483537; x=1715088337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLCSqdXZnPMy/Tv7qxCQInIA3Cv79/j+2BUz73ARD/8=;
        b=GJeB00rHM+EyqkwOFHJOqSK698edH3d/MG8uiOmp5dY0DeQr/u7m2IqCrD63+Ktq8Q
         c+pi63/PvHQFkQ9/u8YELngPoLJFyXA3LooZowPLQHEPNKGCs26qwFoXRJs61y4rCMFW
         d29jT4Yerhs2GI3k3NgKuGT+NYTTgJvjGqaXq6LQ72nSbloUD/8qIpqCY+aq0EXLLeP0
         Bf2BG4iS5sep0Dax3OeCLzOWdn3cmwdea7OZqmc89nc5cfiorIX4OZRmUUcpT/BDrGps
         jYdje0yxc1tDXVuOMnKux0iWRFK1pzOkFWnomhMq/VtgTQWg2o19MvKYrTGellsI9+3X
         C8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714483537; x=1715088337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLCSqdXZnPMy/Tv7qxCQInIA3Cv79/j+2BUz73ARD/8=;
        b=RM96KFPD77h0Hn0rYq6qTrDwjyu2jC3LjwQlTjpvmdSKNTmM5P3MjE3r57RbXbKFBG
         QBO2U5/YuAqwW9gNlxQjX7tFyT31NYFh2jls0shafcxVGaAS455n9RIdpz9dNELOTJXn
         HpirYxiiIPDbMwFfaThr+jJehVwey3ylpyt2Fx265Z/HykcS1fLjauLOjalgeRb48u7c
         I27aBDkFf25VTPbmIrbfQewh0SX1ZsUCu14X0sD2nvCVVHzX5rbGocfMTaQKfPK1Per/
         exGZhvrUdlWqAMrfirggIKuuFJJHl66fHTGlVnvi0kZBA24fzetgpPbqzX9vPhDeEdsN
         DMBA==
X-Forwarded-Encrypted: i=1; AJvYcCVPBcmrq2T/y66BsxNKXSWoZrxlXOsmPCbgFgWL6ttoJ/rVARIH91ZU9t5pcqUigPQKzmHv17/prW71pZjlI5rcvJsUaZhuljY0pBQ1shE=
X-Gm-Message-State: AOJu0YwMa/Ircp5cyVCbgESXiSkptQ8nJe6MngP2BWYCLvrPyQVsvc6s
	ea05mujQpARNWD7UmqvqK80B8SD/es84Koe8EepuUO7QID8WScwsTAs+CM3u+A==
X-Google-Smtp-Source: AGHT+IGymM0VGpetOfOU93sz02OTkZZuJPS1JZ1sRPFadc7ZjXHrebgTSfkZv1YIuJWpp3BZrhn55Q==
X-Received: by 2002:a5d:42cd:0:b0:34d:a25c:2077 with SMTP id t13-20020a5d42cd000000b0034da25c2077mr710488wrr.16.1714483537232;
        Tue, 30 Apr 2024 06:25:37 -0700 (PDT)
Message-ID: <8e5cd297-ef1c-4f6c-b8e4-5d7135fbf78f@suse.com>
Date: Tue, 30 Apr 2024 15:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/svm: Switch SVM features over normal cpu_has_*
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrei Semenov <andrei.semenov@vates.fr>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429151625.977884-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 17:16, Andrew Cooper wrote:
> @@ -2493,38 +2491,14 @@ const struct hvm_function_table * __init start_svm(void)
>  
>      setup_vmcb_dump();
>  
> -    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
> -        svm_feature_flags = cpuid_edx(0x8000000aU);
> -
> -    printk("SVM: Supported advanced features:\n");
> -
>      /* DecodeAssists fast paths assume nextrip is valid for fast rIP update. */
> -    if ( !cpu_has_svm_nrips )
> -        __clear_bit(SVM_FEATURE_DECODEASSISTS, &svm_feature_flags);
> +    if ( !cpu_has_nrips )
> +        setup_clear_cpu_cap(X86_FEATURE_DECODE_ASSIST);

Should we grow any alternatives patching based on this feature (or any
other which someone might later add clearing of next to here as well),
this is too late: alternative_instructions() runs a bit earlier than
do_presmp_initcalls(). If this is to be kept, a comment towards the
possible pitfall is imo required.

Jan

