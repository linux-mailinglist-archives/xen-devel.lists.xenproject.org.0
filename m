Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94340A5F94E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912444.1318696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskEg-00087a-Qb; Thu, 13 Mar 2025 15:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912444.1318696; Thu, 13 Mar 2025 15:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskEg-00084Z-Nb; Thu, 13 Mar 2025 15:12:38 +0000
Received: by outflank-mailman (input) for mailman id 912444;
 Thu, 13 Mar 2025 15:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tskEf-00084T-8e
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:12:37 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9608dbb5-001d-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:12:32 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so14183995e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:12:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b74b0sm23078215e9.15.2025.03.13.08.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:12:31 -0700 (PDT)
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
X-Inumbo-ID: 9608dbb5-001d-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741878751; x=1742483551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xswvuqI4925Zu2z6tJL/W6tD726VoNpqtQ7PpnvAriI=;
        b=C0rvngOkAipFqy25ovIDVfJYPFYLfrx2ilyGWWwo+rufQAbqeFQYkS9D/W6DZ1xuyV
         H0VdsP4Nvuvq2GXXH6hTHL3Pqc+8+x8qdNqalHxyVNdys70JImM9mTv6iGmQRBo9j29A
         XDGYtA6I5mGvBQ17mg48zPPeK4sSrNqVBvOI7BKWXxaTbtl0Y9PrsTeLTYNzkuOQ6Esk
         MoQIaEWPPKJE7pLB2xvSDZdg6GSlddLyl76g+ViQ+hh8tJlpEKslREuHB/3wz2oHQZs5
         L2mR99TtlVCED857A/4IX1HdSZEwqCerBFTMIygVSY51WOEeZc07Wsko4yQvOfquygw3
         t1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741878751; x=1742483551;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xswvuqI4925Zu2z6tJL/W6tD726VoNpqtQ7PpnvAriI=;
        b=r9fX7P7bQ661UvHJj7qawhMUH/d0aRamdNDwfM3M7mp49P5NaUVZhimiahqk8CWDBa
         kL4XFshnhfQ+EIRpHYAYbo2zPDklySSuADXrIbTjrT6nihc0YsCK7xGort6pCld0zrmW
         w7PnWGXfPqvVGylvsUpcUg+kuRE4F2Xqur1YvtWB/An+ByqZwCUmK4v7l9e0dz4b+Pyx
         e19EcBsTGki7Pv9VD2841KVOvGFjDJUFw0zd+t8KgpDqhc+1zV/VOd0d3527T/c8JuzO
         XDUKUJlKH2v/kil46mvbqrlu842fGApqVLtKjFDNhE6Is6OMEJlXqHn/0aKNa8emWgFh
         9XUw==
X-Forwarded-Encrypted: i=1; AJvYcCXAtswrjm1AJB45Tc5I7VUEe7//SAPDUDraiEB/UNdFcWvS0tHBT0LpEWge/W2yszAWXxC68qRt5i0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynFmlCW2UQtKAJVHrqz33uJgmBNxOrjQwMKUXIGxgf6ZS3i3D6
	6R6pKjFAwTu5zjVjKPgHWH0/g071YkCV9PmHJJF1RwRjoqkZVNKJ4mhCAhwaBg==
X-Gm-Gg: ASbGncu81CkWsPwqv5sEh9srrloTwcbN68y2YYJ0cZ5CBuSmPJplrTWltw3TMG/+qY2
	MYyIe9kpr+n3qfp7h1VoVIEjXMsprPrtkb4b+7wtaXUCcIHQ6+H7GURU70S6NnnxrqoyXwaP2vl
	2lj8iqZvkYJ9dpXpcLcspJkG6KqAMnnPf76WolWx3u073r5SLiJa5E0ghnlX0fjE7pgtn0bvpxS
	SBigBEo4Ch2eMsqqv+5m0ivmZQBPcp7dcTupNxqosELAJg7oKJSqb/xDuDatuHoOZ+XlFraodbS
	kOwxpJqOgccLaomwjE0bXhu0hH1WK08TwXOZjsx74DAiWi8rnYYhKY5Ze1kb2fVWua7VOKRoqrb
	SEWLpikpTmQzxXsnbpYG80a+nmrsuUw==
X-Google-Smtp-Source: AGHT+IFDF0LIN4r0fl9yK1K0GG9UJm3PmEFU1LcuH/hTnA+neD8qM3xkHNRcSJGpJ+DZU4347rW66g==
X-Received: by 2002:a5d:59a3:0:b0:390:e904:63ee with SMTP id ffacd0b85a97d-395b954eb3fmr2447775f8f.17.1741878751598;
        Thu, 13 Mar 2025 08:12:31 -0700 (PDT)
Message-ID: <1ecd92f6-ab92-4d9d-acad-b1fa96908984@suse.com>
Date: Thu, 13 Mar 2025 16:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/19] xen/page: fix return type of online_page()
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-11-Penny.Zheng@amd.com>
 <9f75fb88-c050-48ec-881f-b963607e89f5@suse.com>
Content-Language: en-US
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
In-Reply-To: <9f75fb88-c050-48ec-881f-b963607e89f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 09:30, Jan Beulich wrote:
> On 12.03.2025 05:06, Penny Zheng wrote:
>> This commit fixes return type of online_page(), which shall be int
>> to include correct error value.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> While the patch can certainly be taken as-is, ...
> 
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1764,7 +1764,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
>>   *   The caller should make sure end_pfn <= max_page,
>>   *   if not, expand_pages() should be called prior to online_page().
>>   */
>> -unsigned int online_page(mfn_t mfn, uint32_t *status)
>> +int online_page(mfn_t mfn, uint32_t *status)
>>  {
>>      unsigned long x, nx, y;
>>      struct page_info *pg;
> 
> ... below here we have
> 
>         ret = *status = 0;
> 
> which aiui will need splitting for Misra anyway. Perhaps a good opportunity
> to do so right here? (I wouldn't mind doing the extra change while committing.
> Yet I can also see that this may be deemed too orthogonal to the main purpose
> of the change here.)

Actually, having thought about this some more, let's just put it in as is.

Jan

