Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82085A7EB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683014.1062323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc60T-0005eG-II; Mon, 19 Feb 2024 15:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683014.1062323; Mon, 19 Feb 2024 15:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc60T-0005ck-F4; Mon, 19 Feb 2024 15:56:37 +0000
Received: by outflank-mailman (input) for mailman id 683014;
 Mon, 19 Feb 2024 15:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc60S-0005ce-9x
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 15:56:36 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74915824-cf3f-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 16:56:34 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d146737e6so2690509f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 07:56:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c3b8600b004126a6ee498sm1200844wms.12.2024.02.19.07.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 07:56:33 -0800 (PST)
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
X-Inumbo-ID: 74915824-cf3f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708358193; x=1708962993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhzIvAJMiSakWdcNe2qM/9a4+obUP4RnoEcDydP1UWE=;
        b=XlXxTiWHrkftE8QBcTsoqqA4prCH5ivFQFExEkRXkRnhhGFOeFCV4QwlI7pX1AjY1N
         yLr44TC7QowFGwRQouIQAOIjQX8tJR9VQAdB+LnZ1v+vHsgfmoyaJ+KO1WrZ7hJz4THh
         vFW7fXr3qoCZqru9hLngwszQhMLaTkmkBmPtvQUBeOk5AUahcrHSVGMLd7Krqz6MrJPn
         XvRE7YDOngmJN6bZL+rqLG/5TkThi/jA3T2n/wPwPWtGOiPqW2MriKbRKsYBZE2MzZeK
         Sks0zT4oJj0Gc5bji4aYGWoSKN35klQd8xRkAMzTjVOzPpRf11ATyiMLlwG7FYZlWBzd
         qhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708358193; x=1708962993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhzIvAJMiSakWdcNe2qM/9a4+obUP4RnoEcDydP1UWE=;
        b=DSx1LUTlnVVBk+uZ811g4ehynQ8UsB1sEeTIMf/bBrWo8AKHKnQWdS0SO0AGOmeoqS
         dAVF29ST8BEPOLB18rWt1sBIN92Fio0rNAKw8W2PwwQ0GGl1vDabZB2SwBuMHgt2Oses
         9vZXT00Htfd67MRCYnOebl0jtcdzsxRkQeiNw5ZHOonH+fdsQuW6YupWOYoB6WvWYjiD
         g+Dx3b0yhGQZ92syrLBqXOi4GqNcBEHcJENQJtzk3BRhIsKVBuKyfDt0eu02MxTYtEml
         dgkldlxNRfaCk7KLIiLJY7OCRh7rZhBAQfCNMciGzk4NR3x/DERs1BMZCcR1JleQEEtO
         5rkw==
X-Gm-Message-State: AOJu0Ywfl0WiZ8z1ug85Fdac3btYHYvWyAJ2oE5M5LuSJ1V1h7reQK6q
	7xplTwQH6oCKQ4l6P+rPYyX2d2NSXgrCOp9Wul3XltxFxgY/ePrJj1hwalVHIA==
X-Google-Smtp-Source: AGHT+IEKwQIuUouN3taz5um1itvhh1DN42BegZ52gZdb9Jmilkn2XmJUJtBdcdW21wMtIlw/ESms5Q==
X-Received: by 2002:adf:ec02:0:b0:33d:2b23:5c4f with SMTP id x2-20020adfec02000000b0033d2b235c4fmr5537380wrn.66.1708358193676;
        Mon, 19 Feb 2024 07:56:33 -0800 (PST)
Message-ID: <801618fe-73fe-4d15-8e17-dd02e115cdf8@suse.com>
Date: Mon, 19 Feb 2024 16:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] nestedsvm: Remove bogus debug message from
 nestedsvm_check_intercepts
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-6-george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20240206012051.3564035-6-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 02:20, George Dunlap wrote:
> Changeset ef3e8db8068 ("x86/hvm: Corrections and improvements to
> unhandled vmexit logging") introduced a printk to the default path of
> the switch statement in nestedsvm_check_intercepts(), complaining of
> an unknown exit reason.
> 
> Unfortunately, the "core" switch statement which is meant to handle
> all vmexit reasons is in nsvm_vmcb_guest_intercepts_exitcode(); the
> switch statement in nestedsvm_check_intercepts() is only meant to
> superimpose on top of that some special-casing for how to interaction
> between L1 and L0 vmexits.
> 
> Remove the printk, and add a comment to prevent future confusion.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder if a Fixes: tag is warranted here.

Jan

