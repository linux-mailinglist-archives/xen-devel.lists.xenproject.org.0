Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E4CCED76
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 08:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190462.1510908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVEi-00036d-Vk; Fri, 19 Dec 2025 07:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190462.1510908; Fri, 19 Dec 2025 07:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVEi-00034T-T7; Fri, 19 Dec 2025 07:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1190462;
 Fri, 19 Dec 2025 07:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWVEh-00034N-A6
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 07:49:15 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36066046-dcaf-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 08:49:13 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43246af170aso800548f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 23:49:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm3472962f8f.22.2025.12.18.23.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 23:49:12 -0800 (PST)
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
X-Inumbo-ID: 36066046-dcaf-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766130553; x=1766735353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XdxpJ4Wmyzzs+t7AiPTwm6XrCxm5MKLnB+2tL2YQ16Y=;
        b=MheIvioBYTM8Y16SazqHEgOWI7u7NSq4vaikuHO1jpZZJ2I6Qz3viv3JR4lK2TRcrc
         uKJlwUd8ENEttH568eCjEFPEh21vXntQnZaPZSPxZnVlBTLlMRYPZ1x8xccMFwFIzmP9
         W6bmT/LXfCtpaprlOslrvE6H2Dtl8zCht1IvMdqOKq+bnk5wE9gJ1nJCGT/4/LOjB5n0
         wZMKZdCGPFSCUcu9ZOoZlu1zVhHpl8pgE+HRGjTQu0UaLhfoivPEqx6VaN/PQSpU2/e0
         svZus5bWSfEniqdnyxLPUFn6gu9KaUzVQ38Wjp5NG1Tn+h6SIwtyCLbviv49Uz5K0aLh
         pSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130553; x=1766735353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdxpJ4Wmyzzs+t7AiPTwm6XrCxm5MKLnB+2tL2YQ16Y=;
        b=AGLaEEmTT7l7YaadUh4U35QZEkm3/qEPOhXVpnGLcyOG3kG9KS3sYb2HVCyQic5p73
         BsXAzgPEufrFcFS5C26C2e7Yz7GpNmPecVjkmZ/15dkxkb7NMDIw5IAUudszCA0WNiBL
         lvRdl9qZS61vJerWWrrpBD36m0LRXlCt+Wny/ZP4amXia8I/1wY920Cn1y8+0xrQ+96J
         g0PaO/4o2+qJbNtlE4tQz5uKUbnThOZ3ofCqEDMO0w1nAwlj+vy6bDcZ2ys3NXQYmePF
         yV7ouQYCUgb4BcSoXo6TWSW36eTYFyzF+n3Mw/MrbSTZb1T08TK7DX3v3k0ZHMv5JWWx
         hGQw==
X-Forwarded-Encrypted: i=1; AJvYcCW5wM4ZVOgKERaY6xnr6Pf0UaUbb2BBqCNOne4/jztTkZtBUsRr5fY9+4Ze80MKArwjfH53aJIHOow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrAwtb5VsRPMzntmE47NgB3saw7XZHx0Wj9RQzXF2AHcecAFYO
	n+vH97tFLOSJl4JzHOVV66J6B4obT9BZCcZY40K3Hvom+lPhtwFJj7gLlq/ALCAXJQ==
X-Gm-Gg: AY/fxX75PRDT4Qy6v0yzkgxJHJyeg9Vemc/AfJsgmwwmdBzZWIhHQJfF3ADsRKVdHdC
	uxCMcA/+foAvenLh8y+G1TSW2Lr+DYXzPuqgqa3pkXK2xJu+VUr1UiNm6Jw8GhDgoPbj6MjM3gb
	spk219COtvsaik+hjiN9egHGseF5qn9GiSo43CUyCs/Mkg1Sf6DP+/4R02XECJqPzPsGiSdL9ft
	iOMkKY+opksSo/aFBiH13g785LRWYZxS6XlOVptXSUVJkKWz4ZbXcflagbUspt1rnzGRyKPuRsk
	3cD2Xbc6vips7s4GJurrTKA+AGFtIV3ltaqdaWbgGGNrunCuLjtdFWH9LUbUzQmbrWGau/mRpHv
	pd28ri24ajLBmB37hrrfJlN+sfKKHA1HRkwzWg2jww62EH4SKsHTb35OYmgxG7kPGpzyzLT/sHS
	qwNY69uFwCVoXsxDSO4tw1Cdpqep19V7vT0aJp2Gi81AeZLYTBSfzIzgV9HwHQ+s5dq5k2K7dKy
	YM=
X-Google-Smtp-Source: AGHT+IE+AUy/Xm3RV9adEMlCXNlw2IB3O5S2kGyzoe3ho7XnJXQhSzcfY47vOj79pFC3jcLv7ncRCg==
X-Received: by 2002:a5d:584e:0:b0:430:c76b:facc with SMTP id ffacd0b85a97d-4324e42e792mr1908813f8f.20.1766130552707;
        Thu, 18 Dec 2025 23:49:12 -0800 (PST)
Message-ID: <ff89e74a-c4bf-4023-b839-cf9430d55a48@suse.com>
Date: Fri, 19 Dec 2025 08:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen: move alloc/free_vcpu_struct() to common code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <099753603c18bbba0db702746d394c2e77e15a4d.1766053253.git.oleksii.kurochko@gmail.com>
 <803b31e0-c696-48fc-bed6-3d62ed4563fc@citrix.com>
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
In-Reply-To: <803b31e0-c696-48fc-bed6-3d62ed4563fc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 19:34, Andrew Cooper wrote:
> On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -392,6 +392,26 @@ static int vcpu_teardown(struct vcpu *v)
>>      return 0;
>>  }
>>  
>> +static struct vcpu *alloc_vcpu_struct(const struct domain *d)
>> +{
>> +#ifndef arch_vcpu_struct_memflags
>> +# define arch_vcpu_struct_memflags(d) 0
> 
> ((void)d, 0)

Nit: ((void)(d), 0)

Jan

