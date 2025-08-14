Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8FB25CCE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080864.1441038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS8y-0004jM-I2; Thu, 14 Aug 2025 07:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080864.1441038; Thu, 14 Aug 2025 07:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS8y-0004hO-Ex; Thu, 14 Aug 2025 07:13:00 +0000
Received: by outflank-mailman (input) for mailman id 1080864;
 Thu, 14 Aug 2025 07:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umS8x-0004QM-Ke
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:12:59 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b97c399-78de-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 09:12:59 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7a0442bso105649966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:12:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2533375466b.27.2025.08.14.00.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:12:58 -0700 (PDT)
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
X-Inumbo-ID: 1b97c399-78de-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755155578; x=1755760378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ynZvE0cqlRzThffUyAuit6EjSdqa6JGjdb/vm/hMs7M=;
        b=VKrHKphaUpSYJha7G3rLRZrZDH04zZhxEGpM8RkSnhXTuKiz3IdnPOv44iQpuSEyJG
         MJzby8jBw2Vmugts58N3Zm2Q+pH0RSKytU7Mw94Fe/AEzwWpVxo/PsHj20KbmIV3e7JH
         X8A4Jp5Nujo0jTpSrpAbJIFqFouzyWrEZ6kNkmWWX6GR/aHjRc764QVtAKl+sLiQc4+1
         JZjP232huFTueLMgoWSFZUl4nXF+pCw8AhKPrZ9d4oXOSycQmavOBNm07ni34EPCS5xY
         PqcqkYuOOR5YLwmkbYE5y3gZQDfYbF4B5qJGfKYiF5ZXC9MPuEAolK+CxNwIHkiol9Hf
         dgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155578; x=1755760378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynZvE0cqlRzThffUyAuit6EjSdqa6JGjdb/vm/hMs7M=;
        b=uOkkZU5naWOVUi2YQGQo2tSsak2wYoU9JtSAbADK30UcSD/IArqgaCW5RFHIZGEE2I
         bfFi0waUbZeA8XSg51Ytn8MWATWXM8hK+DzU/KY/f06qacQrODAL0Z1yCg/tzHyw2xhy
         r6y9u9RKQLuAznQdLPKslZgwEf8FFyUXGtYpk8d8mXz+d2VyV9/TOFcqtTLXS/wDtz1h
         FwOrWEpPXZLh8aLbwHouvyOc4OzaznUwEjqoNI7mN7uKniJkJZgdkuvGh5E+B0GFKgpH
         skwdwr++T1DT95tkIR4ByJOfIfyo2EjU9d6k6sOwt6aeyQ5U6TXVE6Ea4Ac+dfNdalaI
         iHPg==
X-Gm-Message-State: AOJu0Yy+lGkRNbRtLJsvM09K9U7/vjhnKwgDjmHZz7O6zXbzfYz0oygL
	7LcucSU56V0QefYoV0C+5NIrF8kgm2/xpJZOsg6VP6ujJGK7wDE3+uzMFuRqsIERpw==
X-Gm-Gg: ASbGnct2FTmP8peGo1hSI02xuW8LW9bCFuZLA1zPHKZYzR3cP77wMQHr/AZVZocye+o
	8q4vp0a5lenMKBwBAJTytx9MIcMfi3zQjG0oIm6upPkldvPRTHsw4p9CVASWpwxPLlg4F3KOcwH
	7qjG8JN1GT00lDaPG8VTBEznlWfciS14ZgkyDjcdh5iuqyq/9dVRsBXoHvbdUoDsfK/lJ66+4oD
	+iGk9vnlzhT+Fc58/jDBrddzzS8Ez6Bj5yeHa0FkLL7zYvJok/dzXcvxdQzSlQxgyr1dg1qMS1K
	OsfE0FjoQJlEFhcDBHOsvbcdqt4qv9mJ4RJ5HA28T35CbAueG1GhxABC9luLQpgu02rJXLJwRE/
	bY4MOKBPQWW8YJuEQY9/J24oelgMzvEqVvhltoDC7sash6o7Op94o8lnetZ+2YAhTjWwAUWZoAQ
	WArvVOftB5QsU5T4l6/g==
X-Google-Smtp-Source: AGHT+IGGoCCmryVviq0BEczHVbDDC0igGavBICSFSJJ1CYqitvN0Z2D/OGlb+nuA7HRXdHxsxHztAA==
X-Received: by 2002:a17:907:9490:b0:af9:414d:7bb1 with SMTP id a640c23a62f3a-afcb98c1626mr171454066b.33.1755155578472;
        Thu, 14 Aug 2025 00:12:58 -0700 (PDT)
Message-ID: <bfbd315a-4a23-4d52-b87d-d22aa7df13f2@suse.com>
Date: Thu, 14 Aug 2025 09:12:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Coverity complaint] Re: [PATCH v5] pdx: introduce a new
 compression algorithm based on region offsets
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250812150624.64898-1-roger.pau@citrix.com>
 <f3e57860-d4db-43c5-8cb2-29eac2163c1d@citrix.com>
 <aJyH3kb93k3HpF-A@macbook.local>
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
In-Reply-To: <aJyH3kb93k3HpF-A@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.08.2025 14:41, Roger Pau Monné wrote:
> On Wed, Aug 13, 2025 at 12:47:37PM +0100, Andrew Cooper wrote:
>> On 12/08/2025 4:06 pm, Roger Pau Monne wrote:
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Not this patch, but this is probably the best place to report it.
>>
>> https://scan5.scan.coverity.com/#/project-view/30554/10426?selectedIssue=1662707
>>
>> Something you did in the series made enough changes in
>> pfn_pdx_compression_setup() for Coverity to start reporting an issue in
>> some decade-old code.
>>
>> The complaint is on line:
>>
>> 277    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
>> CID 1662707: (#1 of 1): Bad bit shift operation (BAD_SHIFT)
>>
>> 34. large_shift: In expression 0x1000 << bottom_shift, left shifting by more than 31 bits
>> has undefined behavior. The shift amount, bottom_shift, is as much as 63.
>>
>>
>> The relevant part of earlier analysis seems to be the "i >=
>> BITS_PER_LONG" check in the order loop, causing Coverity to think that i
>> can be up to 63.
> 
> Yes, I've also got the email.  This is existing code, so the issue
> wasn't introduced by the previous patches, it's probably result of
> the code movement that Coverity picked it up.
> 
> I will send a patch to fix this.

Isn't it simply because this file is now also built for a toolstack side
test?

Jan

