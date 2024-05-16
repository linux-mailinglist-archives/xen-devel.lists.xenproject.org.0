Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4CB8C72DD
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 10:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722896.1127289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7WVz-0005zD-JV; Thu, 16 May 2024 08:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722896.1127289; Thu, 16 May 2024 08:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7WVz-0005wz-GZ; Thu, 16 May 2024 08:31:03 +0000
Received: by outflank-mailman (input) for mailman id 722896;
 Thu, 16 May 2024 08:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7WVy-0005vF-OG
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 08:31:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0c052d0-135e-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 10:31:01 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso3372726a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 01:31:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfe87sm10168552a12.53.2024.05.16.01.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 01:31:01 -0700 (PDT)
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
X-Inumbo-ID: a0c052d0-135e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715848261; x=1716453061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d1IoVMqRJbAXFb72224xcMh9cMkSitNu9e/WI/HTkxo=;
        b=Bnpv2jy2HR87b9E9vdPoQ1EnMZmW5US9lBR/Ywe5Sy3LhTRy6HGSz2N808G542/T68
         6MGzAJMCKdQkq05rUxXdfz1/t0Q8kHHcQAo80ONjrs0SjUMq+5AFJ9XQ2hcDqUnhidwF
         sclAf6bKmrQn7yaiI9VyLE/dOWoNQrXd40o/0miFdRmeso5iY80lbzL/yWHmCn1/YbeP
         +Gw91EMGdQp/8PNFP8eNxCdW8/WpNIkx/50O+SxfdKclGUpjpYcK2/1yxxTtMd0JuY6Q
         xREwksdHoM5LvMkqncI3bMVkGwhdongJygpM8F5c+ru068OiakfSnM8L900WetTRXDva
         RWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715848261; x=1716453061;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1IoVMqRJbAXFb72224xcMh9cMkSitNu9e/WI/HTkxo=;
        b=Etkx+nFp13Mpwtxpf4WUBg8Rw53HiPhJv+SjNmGiaeSUiup9bLBZY8Fci9iK0lqzmh
         U/UxhfVLS7AklQUzSfy2MY4pwrRwbdUiFY9AM0EbOzS4C61CMijUVP37mu5n8QiVTLqu
         kiT7izqqSnVTh6vMmbbCgWniRtmDClcmMoVEeogX08XVdyAWgpOLZgzwSWMjov9drW69
         EqS2F93JrO7Qr9Uif0zFRqsFvGgMg8myZ8qEUMPST3NKuOK+kWBfScHGyfDUQQHRfVqD
         ASlSjE/PhUfzEhzUeC8VjY50JhijrvipGxjKaFAoJhTejYk7FhLfSIk31y6/c3Kvm+Vy
         QIVg==
X-Gm-Message-State: AOJu0Yy07UjftVeqfthx4JFtbrO7md86IQV+Hhw2wkAvg8fZyk8tiFhe
	82eG6J3QBc5Zninlgfh3siFdQGemIiu9p8viBN+Tzhq9DtaW6D62wMSnO1Lae6T8GwfjM01A3iA
	=
X-Google-Smtp-Source: AGHT+IHgkjlAr7Sa2xPuqTiLDfOw2PQ281z/X8UFlOghtzZ1Tk+UzPwI1hg8VDypTxkhL0i4VH+lBg==
X-Received: by 2002:a50:c311:0:b0:574:ebba:8f95 with SMTP id 4fb4d7f45d1cf-574ebba9061mr4427817a12.24.1715848261280;
        Thu, 16 May 2024 01:31:01 -0700 (PDT)
Message-ID: <209eb68a-6bd4-4969-bccc-94a1224cffa3@suse.com>
Date: Thu, 16 May 2024 10:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.17.4
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
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
In-Reply-To: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 13:23, Jan Beulich wrote:
> the release is due in two to three weeks. Please point out backports you find
> missing from the respective staging branch, but which you consider relevant.
> 
> Note that this is going to be the last Xen Project coordinated ordinary stable
> release from this branch; the branch will move into security-only support mode
> afterwards.

Noticing only now: This was premature; there ought to be a regular 4.17.5, as
full support extends up until early June. I have no idea where I was looking
when deciding to write the above.

Jan

