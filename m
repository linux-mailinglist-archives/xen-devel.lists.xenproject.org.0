Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7C826D12
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663433.1033358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMo2t-0005XT-E1; Mon, 08 Jan 2024 11:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663433.1033358; Mon, 08 Jan 2024 11:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMo2t-0005Ue-Ax; Mon, 08 Jan 2024 11:43:55 +0000
Received: by outflank-mailman (input) for mailman id 663433;
 Mon, 08 Jan 2024 11:43:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMo2s-0005UY-7m
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:43:54 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329c1936-ae1b-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 12:43:53 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cd2f472665so17022051fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:43:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bf16-20020a056e02309000b003608dcfeaa2sm751970ilb.23.2024.01.08.03.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 03:43:52 -0800 (PST)
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
X-Inumbo-ID: 329c1936-ae1b-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704714233; x=1705319033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fn7DQ3qWbOAFPrGrJjW0q1yf+FMonlgeCeaopcvOBS4=;
        b=E2C7BASlhEBIPnpQSEVlz4NfDB/dVchZrLXbzqph9xa2FEY6lmuecNWDj5Z1JP29cd
         1tDlxjKRELjm68qsrMMlgnKx7i9Lid9wcwMnaMIA4JwNk2fWSfkZn7Y/i25jRp6eDwWq
         7NBL8nN5mstNExSRRe7ryn+YqKgRBXPmfQTKoyFZ8dACLIuEf7BtDkz/dySzU3OT8g5w
         lSnq35GlBQiwtiGR3PCgvP1R1C3+5+axcr3l8ekp6YZIuJKMhxaZ8EcCazoU/7enwBUs
         wpKJ+YOxUIDXpscrul1fLu6v5OFUvI0P7jp3x1ThuRRtEUKcHMoFcBy4+lhsAEVP+kqm
         jqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704714233; x=1705319033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn7DQ3qWbOAFPrGrJjW0q1yf+FMonlgeCeaopcvOBS4=;
        b=aUT957+u0RTv7QKvYBuczgxSfYgYeEKMn/R/msvOT3iZpqGbaddRs3O9KcLXw4DyAl
         yyv0Uwbwe2VHbvJkrHqFriGl5Yb+RH3quIQw/+rQQ9oVWQc4Hfhh094zIBQbF3c1TiiP
         6B8JIoLI43SSy2Dbmd/vq91Y1H3+L/e9cwt8HzDVIjAsIJ5uV/D6bNtUfkplOg7iOudS
         m0vaQLEsdTQ3uHXmBKyYm9uMKXk96VncvRbV2mCYirVO++wSkBEJErHE570SHX1P8oEx
         e0C5FrXt2xyxYb88ZeYRRlXAAlUwFMgbdDUj9m40exj+7iJY2dnV2/wYgn17SOmrB4Ce
         G3oA==
X-Gm-Message-State: AOJu0Yzv7r32AZT5oDaaje5TMYwpeXyP9JpHDM1TuBgbQwLS83x7o6qW
	a2Ck4TqOzwvmz2iFsAvmhnQOv2O22zg3
X-Google-Smtp-Source: AGHT+IFepgoej3Sl2+/6K7Lqq9irgQ5orRIHKvgD1WA+JVJuX35UalH4zbKUJbpzdqW1m6AQyoan4Q==
X-Received: by 2002:a2e:9d13:0:b0:2cc:cd36:fb32 with SMTP id t19-20020a2e9d13000000b002cccd36fb32mr1251256lji.48.1704714232782;
        Mon, 08 Jan 2024 03:43:52 -0800 (PST)
Message-ID: <0872306a-fefb-424b-b27a-b67ba21828c7@suse.com>
Date: Mon, 8 Jan 2024 12:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: limit first_valid_mfn exposure
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <224db25e-bd4c-4415-aff8-6ff3e84343d8@suse.com>
 <a99d9d1a-2395-4771-95f3-5dab64e10ce7@xen.org>
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
In-Reply-To: <a99d9d1a-2395-4771-95f3-5dab64e10ce7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2024 12:37, Julien Grall wrote:
> On 08/01/2024 11:31, Jan Beulich wrote:
>> Address the TODO regarding first_valid_mfn by making the variable static
>> when NUMA=y, thus also addressing a Misra C:2012 rule 8.4 concern (on
>> x86).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Julien suggests something like
>>
>> STATIC_IF(CONFIG_NUMA) unsigned long first_valid_mfn;
>>
>> but I view this as non-scalable (or at least I can't see how to
>> implement such in a scalabale way) and hence undesirable to introduce.
> 
> I don't really see the scalability problem. Can you explain a bit more?

Well, when seeing your original suggestion, I first considered it quite
reasonable. But when thinking how to implement it, I couldn't see what

#define STATIC_IF(cfg)

should expand to. That's simply because a macro body cannot itself have
pre-processor directives. Hence all I could think of was

#ifdef CONFIG_NUMA
# define static_if_CONFIG_NUMA static
#else
# define static_if_CONFIG_NUMA
#endif
#define STATIC_IF(cfg) static_if_ ## cfg

And I think it is easy to see how this wouldn't scale across CONFIG_xyz.
Plus that that point STATIC_IF() itself would be pretty much redundant.
But maybe I'm simply overlooking the obvious ...

Jan

