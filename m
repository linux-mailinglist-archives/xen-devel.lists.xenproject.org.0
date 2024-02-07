Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D284CAE5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 13:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677523.1054137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXhNk-0007lQ-Bv; Wed, 07 Feb 2024 12:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677523.1054137; Wed, 07 Feb 2024 12:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXhNk-0007jN-9L; Wed, 07 Feb 2024 12:50:28 +0000
Received: by outflank-mailman (input) for mailman id 677523;
 Wed, 07 Feb 2024 12:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXhNj-0007jH-22
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 12:50:27 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 768d2301-c5b7-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 13:50:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4101d4c5772so1426225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 04:50:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b0040fdb17e66csm2043341wmo.4.2024.02.07.04.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 04:50:24 -0800 (PST)
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
X-Inumbo-ID: 768d2301-c5b7-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707310225; x=1707915025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ae0tUtHfV8laKYvxnKfLbizXF3IJHmTWSyh1XqNp3YA=;
        b=NAPrrJw5K6wrmczPDQvgHHktoy+mP1HYco+WYVurdRxAcUHOL1I0iIFoUtpUZTSoN4
         px4SAC654EvW/ys5MFpPVK1qi7bADGazlGzl+jHAbTiBJwJtTAygIxngA3uf0s3PG82k
         iLkCJimeqft2lBeroxMjX8VtoC55uD3LYfzfKhVEmhlc9uJ1DF4zdbr6n+mOjTXBXcmg
         22BuNCThPvUfiT/631jrAd+rTchF129hifzaTcXrPQZGZfUYV/LZYM81xa7Ji8DF4ybY
         2vNTv5PNPwKqBxxv5BP+wad94xvWCfN5mDjO+HLUiMdw2OpjgzNir0Z73H8MwWlZmn01
         QxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707310225; x=1707915025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ae0tUtHfV8laKYvxnKfLbizXF3IJHmTWSyh1XqNp3YA=;
        b=EKyZ5DgsaNUVy18B9EwsiNmGNxzrK7yuHMf8/srRxGHfta9lGiL7eD3F+fzztAXtA9
         CGnBlOFw0+aUn1g1kBMEyQIckdNfwM+Vjy6AuuKZGtGAC8n5p/sDFtlut4pcml3zSPKA
         LY+Np9CAw9D4Hhhpdgc/5UA1rMe01nlONXM+9v3Cj/miYomCx0KDZqLamrVqvkRlCQL3
         w1rx/FjoouOxCRmalwNdnBzYy1OJFg6jNLQDgq1Ae2lY2gBIfzPYo2TAiJN+JSCecaDO
         85EP2qgIiIBRK2DaVvaE8YUY+l3f2hS1Aft+d1PE9JqAQPxQbXzhD5QPrgvkJSZhzn3M
         ZCbQ==
X-Gm-Message-State: AOJu0YyXRBmrqEMljLdVpyKlAgrvOGWRYvHgGFqwkGUkc1Bqr6QEOB8z
	whAOC3SLx4iBOd4F4+B5jvPQdbRDuOlKu/iVZfjN1uTSHwhv3Yu5xjHZT/JZ1w==
X-Google-Smtp-Source: AGHT+IGPSsqy7RCQQISIiIhqdSOO7fwn8IPQMQ2jF1f7L8qTSHxw6KOI0LcLphgEByloK0csgEoaOQ==
X-Received: by 2002:a05:600c:1914:b0:40f:d0a7:3fdd with SMTP id j20-20020a05600c191400b0040fd0a73fddmr9635619wmq.6.1707310224933;
        Wed, 07 Feb 2024 04:50:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1CR6eF1nWeIBfrNvfN5o0i1JQupEMG8yAWVYGm05A1t0W4P583ZOmB4oBFSDjOcM+HV1MJPg3L2p/jmTTMnQygD8NI/mGO+R53By96fTjH+0DGCDX
Message-ID: <a0145f9d-654d-4336-b5bb-69883543b919@suse.com>
Date: Wed, 7 Feb 2024 13:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] block-common: Fix same_vm for no targets
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20240201183024.145424-1-jandryuk@gmail.com>
 <20240201183024.145424-2-jandryuk@gmail.com>
 <cd9e0194-5814-4735-bca4-df2577102c19@perard>
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
In-Reply-To: <cd9e0194-5814-4735-bca4-df2577102c19@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 12:45, Anthony PERARD wrote:
> On Thu, Feb 01, 2024 at 01:30:21PM -0500, Jason Andryuk wrote:
>> same_vm is broken when the two main domains do not have targets.  otvm
>> and targetvm are both missing, which means they get set to -1 and then
>> converted to empty strings:
>>
>> ++10697+ local targetvm=-1
>> ++10697+ local otvm=-1
>> ++10697+ otvm=
>> ++10697+ othervm=/vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4
>> ++10697+ targetvm=
>> ++10697+ local frontend_uuid=/vm/844dea4e-44f8-4e3e-8145-325132a31ca5
>>
>> The final comparison returns true since the two empty strings match:
>>
>> ++10697+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o '' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = '' -o '' = '' ']'
>>
>> Replace -1 with distinct strings indicating the lack of a value and
>> remove the collescing to empty stings.  The strings themselves will no
>> longer match, and that is correct.
>>
>> ++12364+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o 'No target' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = 'No other target' -o 'No target' = 'No other target' ']'
>>
>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

I've committed this, but I take the absence of a Fixes: tag as indication
that this doesn't want/need backporting.

Jan

