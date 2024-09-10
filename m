Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE22973AC1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795777.1205283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2Kj-0005NW-FM; Tue, 10 Sep 2024 14:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795777.1205283; Tue, 10 Sep 2024 14:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2Kj-0005M1-B1; Tue, 10 Sep 2024 14:59:09 +0000
Received: by outflank-mailman (input) for mailman id 795777;
 Tue, 10 Sep 2024 14:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so2Kh-0005Lq-TR
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:59:07 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39412074-6f85-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:59:05 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so9084995e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:59:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41c7dsm4347692a12.13.2024.09.10.07.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:59:05 -0700 (PDT)
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
X-Inumbo-ID: 39412074-6f85-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725980345; x=1726585145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5u64wSYcwm0xNLSFUe8rrIKM2QoKou2slUJHGtTG1Tc=;
        b=ISbzjBDfVEuAsGddhbzDohhN7Hb8seuAa1f6UGXcfvtQOkebA4/Wply9uctM1RqI5S
         VVTM6OMhrVpiFG+fuGI3l0rdQPurcF6KCw9kD52P6Tx4J/u33Nr36yo+ZSEJ0wGNGLDf
         SfMatk7jQXp5YGo9ZbXnzpWan1P9U6tLa01Bl6YRKcbN/kN6Hle8FwMXgZF8O0TqKur0
         2WGUHHKTCEhp5E7yFgGonMoa1p6V6Rc6owGPxsKLYHeHNaa/zf1TnnSaXma6LVyiiJKg
         7qDa9zVf3zohH2wxiy0vryYBSveGPYHg72SDhlEXjke4U2oM57PRnNRsXvb3x+pz8lG0
         NvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980345; x=1726585145;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5u64wSYcwm0xNLSFUe8rrIKM2QoKou2slUJHGtTG1Tc=;
        b=R+VLDb1G4z0sqVFOZZ4bjPEoXcqFaxgjip5CtM/aL387lQWuqo7Dc0rf/iNZ+iG2gi
         YNiuoqQVJDyL/RJQLvavqNkA6EDGR/6V1Ob6rdgeQUsjsRN+m+XfY/SbBN6CbJl/msSC
         DhlWf1esyPfn9jOM7MM84S+u4MRZ9fUz4SYPDofL6cuxjKAGvMwQmz4NBOE+MVsqxwkA
         kVOLPx1+YqHpXi4FNqwIimNd2EE48UVvw7J7rtaeVpOi3gluHWDPBhPI3BAh4bPxRwus
         p35n59sHFR1lNC8JIFkfuBwa60tMp7OCNiEzJ7mwGi95Uryb5/rtJ/qDNUfNtPxP1XiH
         Qrxw==
X-Forwarded-Encrypted: i=1; AJvYcCXr8S9Mg89TUvRPhtS25bNiYnfihotgi+gPEpbXfzXCnS6+WGJRuja6vFgynIXJd+U31DwiXt4fSN8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywFQo4A68PpwzNcudjaQ7Mszzn5ZVwbhJl1b3cliiROvMOwNyU
	IcyDL4PW8kPQy2/BkOV0BK8h+G8c1UJF61Xg7Kv5M4Q/DlyHw06CIOw5I9BVgg==
X-Google-Smtp-Source: AGHT+IHCt6iKBr8VDLd01rFi0QLXUoWfCDIRYElUCGAf5peofOIN39EbhDu4g0Hh9gyRhk7ChbkSQA==
X-Received: by 2002:adf:f34c:0:b0:367:9d05:cf1f with SMTP id ffacd0b85a97d-378895cafc0mr8912422f8f.14.1725980345331;
        Tue, 10 Sep 2024 07:59:05 -0700 (PDT)
Message-ID: <1d808a8f-1aa1-4bff-bfe2-09b39a48f96d@suse.com>
Date: Tue, 10 Sep 2024 16:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 12/12] xen/pci: address a violation of MISRA C Rule
 16.3
From: Jan Beulich <jbeulich@suse.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <fd3bb0369cc1666a6c4ad79c54ee8772c1e561c2.1725958417.git.federico.serafini@bugseng.com>
 <e37247e7-3ffd-4c95-8b05-10662728724a@suse.com>
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
In-Reply-To: <e37247e7-3ffd-4c95-8b05-10662728724a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 16:57, Jan Beulich wrote:
> On 10.09.2024 12:09, Federico Serafini wrote:
>> Address violations of MISRA C:2012 Rule 16.3:
>> "An unconditional `break' statement shall terminate every
>> switch-clause".
> 
> Since in our interpretation "return" is okay too, why is not sufficient to
> simply ...
> 
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
>>      {
>>      case 1: case 2: case 4:
>>          if ( *s )
>> -    default:
>>              return -EINVAL;
>> +        break;
> 
> ... insert just this one line here?

I guess the problem is with the description: It's un-annotated fall-through
in this case, not so much the lack of a break (or alike).

Jan

>> +    default:
>> +        return -EINVAL;
>>      }
>>  
>>      phantom_devs[nr_phantom_devs++] = phantom;
> 


