Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127ECB6849
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 17:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184410.1506867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjiu-0008Hw-MU; Thu, 11 Dec 2025 16:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184410.1506867; Thu, 11 Dec 2025 16:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjiu-0008F0-JK; Thu, 11 Dec 2025 16:41:00 +0000
Received: by outflank-mailman (input) for mailman id 1184410;
 Thu, 11 Dec 2025 16:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTjit-0008Eu-4L
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 16:40:59 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a7c206f-d6b0-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 17:40:56 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42e29739ff1so169652f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 08:40:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b96c70sm6556469f8f.37.2025.12.11.08.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 08:40:55 -0800 (PST)
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
X-Inumbo-ID: 2a7c206f-d6b0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765471256; x=1766076056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5KaDoxCSvdmlDJoT8nuQcfuXyWRNtWx1TF5sV5St6yE=;
        b=KiSWNnmQOqRbRIeqvvqQS47IE31iDp8+UcTrt7GEgy7ySzjYM9OVBvdm+3/Ye6kTvo
         XZAn99WPntTiWnpW+oOYbdLDNC+e2MRgYT0NzNYemd/vslT8iXFgZdocScAbAlSpZ2Hf
         8/b9EXGJ1F1RB9VxEB/acf1mYvmekUiTCaoJFRAHbQUSMA173myz0RjHykM3Rxgse1my
         DSBSRfyyE/etooSbSnzd3F8taSG/5Mv0i8s5tXzU34/HHRrBIcKpuPKF3RM9MElDDWN6
         9TGjr1hUmGgXy66MsjiR4c0e+V9069+1wNaFhHyqJ93xST6IAStLjIDa2CwylFUA1wCL
         UHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765471256; x=1766076056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KaDoxCSvdmlDJoT8nuQcfuXyWRNtWx1TF5sV5St6yE=;
        b=FOdP++NxNE/5bpuuJcDbqC15vYR2raeb90F9tixudhbZ7uRAT7nIJex+L5ohq1rpvg
         bwZ77G6Y2+M3L0BKuyRsYtGWgquICz5lXg/DpIzM00RRW5YDcb/Ho0rG/GCW4I5jDjRr
         zreqlWZUraKCY3IA2TEsFLWpIvVNmryhP+JtyWjhkHRltRB857X8mi9B1/UDPtNrZpDc
         KKX3HmLrBVjw/FYZSa8XMeQyTGwVXvwz0laA2/unrI3EfiPUobwcpHlLR0M62AszzENi
         nH1cLhla76yGiH7ooA3X0KrPFyxXNj129lQFvoVCT4jxdMqcQlIBtSmPIDGNf+0/ajVC
         x6yw==
X-Gm-Message-State: AOJu0Yw0Wv/06cfVEKBMenfXOf05QeIjH6rUK+KJS+oJtVmsybwUeoeB
	+xNMAhe0UiRPYdACaAz3RCWHo8wE+pHfu0YTmyOEHyZ36UPtV1L8TaNW3k8iJNY+lw==
X-Gm-Gg: AY/fxX43axvL/uek0yeekzIrhPPHlrwLERfGYsTjmZ9JuoHEBiBQNVhfKEKD4wyDD4X
	+4MH5Q9Kceckj6+rako3TEN33/t4qIwfSJbtHhlrmEL0ePyLWag3NMJgz6bhvjjvvHt8027Z43v
	k1vhBvpCzPvv/TUaje+Fg5IrXxwZBUfguP/BCcLhnzM3UCzuFk9/JwnEhU4YLFo+gvHoUnmYnQA
	WQtzNiXS2or9o7yvV4b82bIpb2BC306aJ/kHm8gSFr9Sjh4h4IOgG6jP0rnFEzNibnP+3301ApY
	0WbapYmxz4Tpo9MoSDOW+XtQ5sjKXUkxQgJRgSH3+70RhOjQcw88cxRD4vmKKRUat1MnEwqRoXw
	YKp3J8cwcyODcrmuSJAyD7/nuDoLRzDwYR4QcHq46hOP/eFsDyg4wNQ/K/e0RUSWfypgWVftjx5
	sLmOdXcvNTAJWEhpb/i61Ah9OHQH7bvXqAvCZbwgPlrFJ6rQx0KJclO0XV1sGUE5gDxlFIAdmOF
	nA=
X-Google-Smtp-Source: AGHT+IGWlB0L8bWSzwJmNiqJQnOy9IYrPSHX9HEIT09Osb5L4l/pRFz4u7vbODrteyUqZeKcSB4tGQ==
X-Received: by 2002:a05:6000:2211:b0:42b:3108:5671 with SMTP id ffacd0b85a97d-42fab285061mr3013198f8f.29.1765471256148;
        Thu, 11 Dec 2025 08:40:56 -0800 (PST)
Message-ID: <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com>
Date: Thu, 11 Dec 2025 17:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
 <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
 <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com>
 <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2025 17:30, Mykola Kvach wrote:
> I have now attached the corresponding build log.

Okay, so indeed not a table size change issue here. Then I fear some instrumenting
will be needed to at least know what exactly is going wrong. Alternatively you could
arrange for the intermediate binaries to not be deleted, and make them available
somehow / somewhere for me to see whether by inspection I can gain some clue.

Jan

