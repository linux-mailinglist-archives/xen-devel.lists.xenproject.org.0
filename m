Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6BC819A57
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657423.1026231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFroD-0003qL-92; Wed, 20 Dec 2023 08:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657423.1026231; Wed, 20 Dec 2023 08:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFroD-0003lZ-6S; Wed, 20 Dec 2023 08:20:05 +0000
Received: by outflank-mailman (input) for mailman id 657423;
 Wed, 20 Dec 2023 08:20:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFroC-0003aq-9d
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:20:04 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92e34b9a-9f10-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 09:20:02 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33677fb38a3so747831f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 00:20:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d1-20020adff841000000b003367e35abd4sm208000wrq.71.2023.12.20.00.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 00:20:01 -0800 (PST)
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
X-Inumbo-ID: 92e34b9a-9f10-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703060402; x=1703665202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5kcUoFOCl/7HUBCzY35pY/7e6551efSmfsmRlZ8820=;
        b=FcbBhKxQwuB9VO2DD54sAy3PuQW1Si7wlfgQA1ICia4+ftKKCvCIv6K1T3QiS2VYCz
         lONyHf7RaznZULsuBr+kXRdn3WxadGhzyN1zQbZhLJO4zhDdLsstCWIRUjjx39fesRJB
         DoA3oLQsqBKfuj2bRiX/jMWEHZZ2ETrjtc0tZajVqPu86D+4abDpCtgXpBeNb2RlqQY6
         WC6reWHeRJLMoS28ofgGqTWl9WCmQzCAQJ2O+Z6fax7F7yVVVHWXReBJ3tlqQQdgXX+0
         puP2VrmBCqqvU/1BE/MNQhA4R3IS9zeJ2nym91wrEOIt/zvuyM09n1PMwPOcQhwb8HVR
         zaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703060402; x=1703665202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5kcUoFOCl/7HUBCzY35pY/7e6551efSmfsmRlZ8820=;
        b=DOhEEyuZK3GPRpc8WDnNgDelmZ/1pW61fkysvriJyMcFv5ifSF48tLmIpnZBxcpSI1
         VCqVNgl4wUnB+gC/pkOgZ9FO8wmCcsQfd9AX6XJoOJNx/d2ItqnlOAY/brs8kwzVWEqe
         R2xJs8ENOeKTNh6eulBrZOcbqHL3PBhYfLExuwl+FBACzLG3aAwhmpIRuqnXUj1ONOsG
         8dg9z2PbYjr8vjv9Xs1xcgTKoF03mnz08WfBkeh9LiJ0uQVUqnFW1KXVdvhZzytywNLx
         kaBbKbylf4p/r14AsVV8M8M/x9dzCyXicSUqy5q6Eot8SBQF3duqkb+4XyLIw93Xj+uo
         zRNA==
X-Gm-Message-State: AOJu0YxXbiv2GxW1Uxm1O3HFpmOTTKZHyrMshIzhV3KVB1+vhh26Dj2+
	iOOemevx8vLrE81UUJNZVyNa
X-Google-Smtp-Source: AGHT+IGu7XmWcQrL7lXirknx+xj2CBcUkpRykSPdP5hKQoWk7r0myCmqbxBMbR2U6cCLnStg+KQX4Q==
X-Received: by 2002:adf:e7d2:0:b0:336:774d:a8b2 with SMTP id e18-20020adfe7d2000000b00336774da8b2mr785287wrn.135.1703060402272;
        Wed, 20 Dec 2023 00:20:02 -0800 (PST)
Message-ID: <67805b7a-b597-41ba-9d90-2aec573d2dea@suse.com>
Date: Wed, 20 Dec 2023 09:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform: tidy do_platform_op() a little
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <c12f20a3-407c-4914-b6a0-1690962fd72c@suse.com>
 <alpine.DEB.2.22.394.2312191626530.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312191626530.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 01:30, Stefano Stabellini wrote:
> On Tue, 19 Dec 2023, Jan Beulich wrote:
>> The function has a few stray scopes and inconsistent use (indentation)
>> of break statements. Drop the stray braces and bring all the break-s in
>> line with one another. This in particular means dropping a redundant
>> break from XENPF_cpu_offline handling, pleasing Misra C:2012 rule 2.1.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is an alternative proposal to
>> https://lists.xen.org/archives/html/xen-devel/2023-12/msg01540.html.
>>
>> A few more scopes could be eliminated if the various "cpu" variables
>> were consolidated to switch() of function scope.
>>
>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -258,7 +258,6 @@ ret_t do_platform_op(
>>          break;
>>  
>>      case XENPF_add_memtype:
>> -    {
>>          ret = mtrr_add_page(
>>              op->u.add_memtype.mfn,
>>              op->u.add_memtype.nr_mfns,
>> @@ -273,11 +272,9 @@ ret_t do_platform_op(
>>              if ( ret != 0 )
>>                  mtrr_del_page(ret, 0, 0);
>>          }
>> -    }
>> -    break;
>> +        break;
>>  
>>      case XENPF_del_memtype:
>> -    {
>>          if (op->u.del_memtype.handle == 0
>>              /* mtrr/main.c otherwise does a lookup */
>>              && (int)op->u.del_memtype.reg >= 0)
>> @@ -288,8 +285,7 @@ ret_t do_platform_op(
>>          }
>>          else
>>              ret = -EINVAL;
>> -    }
>> -    break;
>> +        break;
>>  
>>      case XENPF_read_memtype:
>>      {
>> @@ -306,8 +302,8 @@ ret_t do_platform_op(
>>              ret = __copy_field_to_guest(u_xenpf_op, op, u.read_memtype)
>>                    ? -EFAULT : 0;
>>          }
>> +        break;
>>      }
>> -    break;
>>  
>>      case XENPF_microcode_update:
>>      {
>> @@ -316,8 +312,8 @@ ret_t do_platform_op(
>>          guest_from_compat_handle(data, op->u.microcode.data);
>>  
>>          ret = microcode_update(data, op->u.microcode.length);
>> +        break;
>>      }
>> -    break;
>>  
>>      case XENPF_platform_quirk:
>>      {
>> @@ -340,8 +336,8 @@ ret_t do_platform_op(
>>              ret = -EINVAL;
>>              break;
>>          }
>> +        break;
>>      }
>> -    break;
> 
> I think you should be able to remove this break completely?
> And also in XENPF_set_processor_pminfo. That's because the is a switch
> with a default label and a break.

Not really, no - those would then end up falling through to
XENPF_firmware_info (here) or XENPF_get_cpuinfo (there), as the break-s
I'm moving are for the outer switch(), sitting past the inner switch()'s
body's final brace.

I notice though that I missed at least one inconsistent break in an
inner switch(), so I guess I'll make a v2.

> Everything else checks out. Given that this is already a good
> improvement as it is:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, but as said, I think a v2 is warranted.

Jan

