Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA1A5F3C2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 13:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912011.1318375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshJz-0003jj-So; Thu, 13 Mar 2025 12:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912011.1318375; Thu, 13 Mar 2025 12:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tshJz-0003h7-Q0; Thu, 13 Mar 2025 12:05:55 +0000
Received: by outflank-mailman (input) for mailman id 912011;
 Thu, 13 Mar 2025 12:05:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tshJx-0003gx-ND
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 12:05:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 821388c3-0003-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 13:05:51 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so5568575e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 05:05:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a10sm1933020f8f.36.2025.03.13.05.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:05:50 -0700 (PDT)
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
X-Inumbo-ID: 821388c3-0003-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741867551; x=1742472351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y/31HET881V19g1UiFX5jqvuUJoPCjT0+Q8wGO+mfo=;
        b=Rg+lw19kp54miPt/b7UhMJXOGBfrrV+bS1PqLWgbp+pvY/3WPoktRFawu8O/I1rDjR
         Z6kWqp67sSCcw8sQQS2xmBqtBAh0M/Aam3g4rr6igywHhE2MhVHyHEPYyScivx+OXKzg
         mbOK9ZF4nLsxMR89bCfxhYmVS9ncj+l5I4UHhubEDPuyPGOHPD2WDhZwXFVROz0gqBYl
         XbTtjcYfdnuLWJCAdjoCbTwXjC9OHoCM917WD1n+pvY6bzrNKOg9TtK4XEIoUWS6bD7O
         YL3arPR76WzxDdBnfiI1AsioGj8xhEV0r6DU5+7COBJt2ygW429d0HRcxcKeeldV1Iu8
         avWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741867551; x=1742472351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y/31HET881V19g1UiFX5jqvuUJoPCjT0+Q8wGO+mfo=;
        b=fPZRVgsTsT9t3V5MRcliiEbKOiXchkWTdQ3cmpu2IYE/HBRSBTwd49SBG4gdITj0Ck
         NhcLnxpoIeSQK91DdD6iCKCd6/DgW/n8ck9reizzAxLjtEQIQP2mv27wlnGnf9WVv4pj
         1fUBMtePT0euZM4PjcsAgJioyVDfIF54jU/FKeFAbNUo8xtDxJ7TvYp5hlDHcgM8tzaL
         3n3YYPuXofYSnK747WEjWQi498PHnqDLQisl2T2NEOJkYixIvH9TAJ12oZnM8ycgokzt
         Q7gdTtkKjKUbffD+3BAtV82V4tBHUflO8UoUT2sEZxdWaCEZfNTMmFKI5m5F7IL14SsT
         T+8A==
X-Forwarded-Encrypted: i=1; AJvYcCWua+sfnrXydjry9pEr/lSWEsjhHZeLP4ui4gXYCI3q7eMoJvmfQ+Gway4IoPn75foG9al070gVcl8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9GlGiTATrN17IaNoLqFSLreRdxTYZmyEtgaFHAePbREqpFKK0
	UYYHccsXFlL+YWPOBUaHj7fhCaqxCq20XI9Ty1yyxjIcWJyiI6hEddU1tkBWpg==
X-Gm-Gg: ASbGnctYG8CsYTo6enTxE61MaiFaxZYnUHOjqLoAtxy9MjVobulrYqzBXltHVTUPjvn
	z6NM0REjxQh9Avn657hh+pDGRv+QGKfoITj2cUb56mr4j7KqQlSijeNkHEexFv14u+IRhjFsr8x
	su0DadteWuiwhCqeN22RvUJGYqNJxo7ebiNefTiSFnRHBo6auV56qZMrg6LEQTwV0XDlni5bPSS
	82qJpsyRp4qFpzR8Lr+BTeGvgUlYGBh/VjzzSw6yVnsnAoDDbCINmJDLHsSNvk4bU3ZbK+vSd2W
	NLWYTYnAvkDUjEnnw6Ocl+envOYUvywN8/CPs7hLc3gxoC0hTKZyXJRF71XUfjYzkuiw7do9W8M
	vqWRk7UVu5J5o1EFUNBukRLwjxrxrbg==
X-Google-Smtp-Source: AGHT+IEKmatLl2d/0MncsGz6JKicHW7jmB68Q0EgthDyfNtEPcle+mKx91pWNYTzr3/pA3uypbYVCA==
X-Received: by 2002:a05:6000:1a8e:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-39132da110fmr18732483f8f.42.1741867551146;
        Thu, 13 Mar 2025 05:05:51 -0700 (PDT)
Message-ID: <34a1119f-62d4-4b73-b1e3-c8e945352829@suse.com>
Date: Thu, 13 Mar 2025 13:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/19] xen/xsm: wrap around xsm_sysctl with
 CONFIG_SYSCTL
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-3-Penny.Zheng@amd.com>
 <D8F41PA5JHTU.ABSSG427OH5@cloud.com>
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
In-Reply-To: <D8F41PA5JHTU.ABSSG427OH5@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 12:43, Alejandro Vallejo wrote:
> On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -180,11 +180,18 @@ static XSM_INLINE int cf_check xsm_domctl(
>>      }
>>  }
>>  
>> +#ifdef CONFIG_SYSCTL
>>  static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
>>  {
>>      XSM_ASSERT_ACTION(XSM_PRIV);
>>      return xsm_default_action(action, current->domain, NULL);
>>  }
>> +#else
>> +static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +#endif
> 
> Doesn't this need to be -ENOSYS instead?

There shouldn't be any ENOSYS outside of the top-level hypercall handlers.
Granted we have many violations thereof, some of them not very reasonable
to fix (for guests looking for the specific but wrong error code).

Jan

