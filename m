Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A587C8A49E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172945.1498051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGOn-00061h-A6; Wed, 26 Nov 2025 14:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172945.1498051; Wed, 26 Nov 2025 14:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGOn-0005z9-7Q; Wed, 26 Nov 2025 14:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1172945;
 Wed, 26 Nov 2025 14:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOGOm-0005xk-4j
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:21:36 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364232c9-cad3-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:21:34 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so45120225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 06:21:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479040bd209sm45580175e9.3.2025.11.26.06.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 06:21:33 -0800 (PST)
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
X-Inumbo-ID: 364232c9-cad3-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764166894; x=1764771694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YO4eTL+C31yjawiXcmtfWsOCMoReZA0ETxcYHO1pxWY=;
        b=X2KCbFjNi55BjzNY2LLl2cncX7XTVwFXSsUtuHzMLcYzYDA8VVRy0X2gEPekZjuL69
         7OATKstSkCyYpgRL3AyOmN2NjLQsnCihM9ktsnWfaGelJyE/Rv35mDNSLpruCmF29mmj
         WHboZhi3FDtRc4povwl0zLB20el1cQR/GV1Jykap4OsAtBSGdJktkePBUh/uk/bODuq/
         dgGp/6nATwZYeNOxXYANb9Bha43NT44rt35FVGI6xnh7ibCODuGVXKgvTAGzIgOZGDcg
         h4ZMptyUA7jdMli8xqihGRTr3cvfX3xg1jY0Q2POVCQCxcGXf7s6lH22mt/TYr8aWBSQ
         o0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166894; x=1764771694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO4eTL+C31yjawiXcmtfWsOCMoReZA0ETxcYHO1pxWY=;
        b=nIihOAS/h2Crbhu9Pu/rztDKd5qQ37zVLmk7RRApHHdoAt5QrGPJERj2VbWYuTVme/
         8I4JhDGI2EIiKqmdZUPgLMuYofTBJpxWihjrN3l5VNr0o5ThOx+mF5tztA9+BmAkqJq6
         QNzwHe+0E8n7azlWL6I43WKiIk5ZlBPJwX4hgv/uNrj0nErhDFW7C+DcnVxAuftOyll9
         ONqtU2vSOtvJ0vSq1g1U1svpdraRnSgmsSWEoujS09BPs1FWDLIiJY+bHSF8uB3AM2L4
         Nybm/rp+31CWJltBxM4joZHh8xPe0Ix4m3pmQaHBMP/H8hVHex+6b38UfS39ELVNlGUj
         RxxQ==
X-Gm-Message-State: AOJu0Yxwa+oK8fZ8QpBVoH+xIz2vpQzvce8OqqvzqPwOzzIo6nhlafvc
	DZq8QzlthMWAVayQZ+YHvSHBQ64TiSK3gli5FZlbV8YFB41v85NbrI2Oku3b3X5TIg==
X-Gm-Gg: ASbGncsmVuc69EQ1b6E23KoHp3kLqUX58yMef261Z67+JVtOINXYLIxc/mUJ323xplD
	vsOHnrnwSp8o0nhhZ7mBpWIzTHaYk+R5rLz2rZY+gTC6o07u+MkfFsuBR6AEH6vwEdJBGSvQjDT
	gSE1SvWsA10JWAxx0iuD0zj0ugLT0hhU2AebtCaDANmqZPmRjZ/Mb24D6T9B2cUSgApbA+Vpydt
	eZLEdzp3HGZ17BVUFWP9DRxU8BHcbOMOT9MSUVq6IlFpjPJH4rq4wLXS4CZLrPh6V1sK3dIiLw1
	AsYI/j1XNcBkYMclbugO+DI1A7XaiH3E00F82BYlTIyz30eryu5WwhFChX2oIMmZTVgw5cfrKZ2
	OmyIK+CKY1s79pqgx3baB2quG8FC5+tdS7iJqznNMI4S6J6+einaQDBwIhEV/+OX5HEI7ks5Bga
	H3cNj8gXld/AA5S06lqupB7eBQfxP4g2CIZpIMfGn4393SYa6lHcYADTYi+K4DiAQ0PxhSDfgbO
	kmImitYFutYAQ==
X-Google-Smtp-Source: AGHT+IGKFSUmiWnmOqoOmdrLamdowuhWgq45/k9GWez0S3tRzROSagkv+jsHjABkT5Pn72Mn+gFRJw==
X-Received: by 2002:a05:600c:4746:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-477c01e2521mr214170625e9.30.1764166894093;
        Wed, 26 Nov 2025 06:21:34 -0800 (PST)
Message-ID: <6de82773-c084-49e6-b4b4-466a35583ed8@suse.com>
Date: Wed, 26 Nov 2025 15:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] symbols/ppc: re-number intermediate files
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <b915451d-62c9-4128-807a-42b908dbaef4@suse.com>
 <1755986020.127148.1764166039180.JavaMail.zimbra@raptorengineeringinc.com>
 <fdfe411d-0710-4439-85f3-a77ba71b8afb@suse.com>
 <1213078822.127214.1764166453810.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <1213078822.127214.1764166453810.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 15:14, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Jan Beulich" <jbeulich@suse.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> 
>> On 26.11.2025 15:07, Timothy Pearson wrote:
>>> ----- Original Message -----
>>>> From: "Jan Beulich" <jbeulich@suse.com>
>>>> To: "xen-devel" <xen-devel@lists.xenproject.org>
>>>
>>>> In preparation to do away with symbols-dummy, re-number the assembly and
>>>> object files used, for the numbers to match the next passes real output.
>>>> This is to make 0 available to use for what now is handled by
>>>> symbols-dummy.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Looks good to me.
>>>
>>> Acked-by: Timothy Pearson <tpearson@raptorengineering.com>
>>
>> Thanks, but for clarification: This doesn't mean very much unless provided
>> by a maintainer (M: in ./MAINTAINERS). As a reviewer, you'd use Reviewed-by:
>> to fulfill the purpose set forth in the textual part of that file. Provided
>> of course you actually did a review.
> 
> Understood, and yes, the patches were in fact reviewed.  I will use the
> alternate string in the future.

Then still for the ones here: May I flip them to R-b, meaning the patches can
in fact go in without anyone else's (i.e. a REST maintainer's) ack?

Jan

