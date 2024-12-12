Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A49EE544
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855847.1268648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhYw-0002xM-Ls; Thu, 12 Dec 2024 11:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855847.1268648; Thu, 12 Dec 2024 11:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhYw-0002um-II; Thu, 12 Dec 2024 11:40:58 +0000
Received: by outflank-mailman (input) for mailman id 855847;
 Thu, 12 Dec 2024 11:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhYv-0002tM-9Y
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:40:57 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efa1cf38-b87d-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 12:40:50 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa66ead88b3so89245866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:40:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa69964872asm473170166b.103.2024.12.12.03.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:40:54 -0800 (PST)
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
X-Inumbo-ID: efa1cf38-b87d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734003655; x=1734608455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UyND7wvYxn+7wf2otM9OxBX7OxZgEQuOpc+HEbYcvPs=;
        b=beDnIb1r0H0HNGV3m4cPislSmhVM3hZJlNz1LuhyOm3vA+sLDFIMUvWKK6tarBAEZl
         AfQ5cs8xhq67jwqqQ5wSjjVEpD3M3+iw7jbaWZFcfItdHbdfe41KDcVpHRGIkye9XJa2
         VmQ+GRw+EMrjW6vUJtI3SG4IEPQzh3sSzxCvyXbGEd4oxQaiaA2jFp5AUo50pyNwmwiH
         S3ZnNas71sQVj1x3XZsJKO/7POVM1c9Xy28eBtCk/5qnbyE+gtqGZkoOzMZgYj5HfN0z
         CwVS4m0HvTVbvEh1bGqkXGg0JfjboZNpzIfUvAIedGvYQNcaN6CR+dDVNa6jV+W+C4Ou
         L3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003655; x=1734608455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyND7wvYxn+7wf2otM9OxBX7OxZgEQuOpc+HEbYcvPs=;
        b=t0RgRoXLxt5don69qYn8zVUChuBN5KH7MWePr5u4aljrcM97T+/zzezp/m/eEmITj4
         yGAyXPwb65jVBRGYfDEW43RNati5GXqfOQYHS8SWeA+1TOGYNu2WURscnQO2i4bIz2Un
         uE4uzbUU5fSOg+9B1SdvJY7h4gF3/ANl83WObM5MLyQaOVTTIxjw3CSjptPb7W+AJNyN
         Hw0LNmTp2HJ9MA8LaeflGdJDngZZKhwIPfTCbXCnxJ2lTGiLjpIVYeDjM7D5V1iihFrK
         k4CpnjCqVMKZZSOR7cNnn4TlodjUaTMuM8aVGU8n6WXt3GtuQ/VY0qABiXju4SdrDhqK
         bTsg==
X-Forwarded-Encrypted: i=1; AJvYcCV9tl6/8JmXM7KMesHa7kue0m9genfOGE8xKKvC0ZzvXLrTRzsUu67Mp0S3siArVG73LHzhV1AZt+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrZOOyO5hkLAFRjVcczfi6+SOWXxA63D6z+G19dDupDnh98e2E
	GHPZNiUeupg+j8tu9YVg7cJdvipT56/WQeqZgqxfIcfvI8cg3M8cwAjAkkIFYg==
X-Gm-Gg: ASbGncuNKuSE5MkzEi2arjBpCS3J6NldDq6KAS3O//yzc4ANn+FpSb6XCBmWKvIssIe
	9Dpb1t1ywL9D0PGIo1q/7goup+CEp0X+AhbVRuNw+WQh8ylJ/BOrLMGXFQ1NIxWKaU1bIsRcA+p
	6N53idsCpUWB8BquZvS7Hu729s0LY7FzoFMffJHzEg8/OdHXTJ4ngs8z6SCttlUD1fWzU6PmePb
	mLwM47axEaDPsoaopF4tPzv3EmrW3eegEQYEfAnTqd3xiRvSuF2VQcP0Ckb1v6OHV9Sc5bFwUxo
	IDX03eWG9eT1uMPdmUSJimoViPK8a+N6X4gz2BJF0Q==
X-Google-Smtp-Source: AGHT+IELcESixDvtRT2iNcd4G5oTHZX4KSLaSAfq45ihdOSRfEJqq/4kayEdvirDe6JSJExuzfHPOA==
X-Received: by 2002:a17:906:3109:b0:aa6:9eac:4b86 with SMTP id a640c23a62f3a-aa6b1182374mr640790566b.16.1734003654786;
        Thu, 12 Dec 2024 03:40:54 -0800 (PST)
Message-ID: <6605c052-da20-49e4-8d7f-f9e870ca6b92@suse.com>
Date: Thu, 12 Dec 2024 12:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] x86/hyperlaunch: add capabilities to boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-16-dpsmith@apertussolutions.com>
 <84bc7854-7935-4f36-b574-d19dde775673@suse.com>
 <16a6944d-4ac5-4016-bafe-1bd8b6a4fa4d@apertussolutions.com>
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
In-Reply-To: <16a6944d-4ac5-4016-bafe-1bd8b6a4fa4d@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 20:56, Daniel P. Smith wrote:
> On 12/2/24 07:23, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/domain_builder/fdt.c
>>> +++ b/xen/arch/x86/domain_builder/fdt.c
>>> @@ -209,6 +209,19 @@ static int __init process_domain_node(
>>>               bd->max_vcpus = val;
>>>               printk("  max vcpus: %d\n", bd->max_vcpus);
>>>           }
>>> +        if ( match_fdt_property(fdt, prop, "capabilities" ) )
>>> +        {
>>> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
>>> +            {
>>> +                printk("  failed processing domain id for domain %s\n",
>>> +                       name == NULL ? "unknown" : name);
>>> +                return -EINVAL;
>>> +            }
>>> +            printk("  caps: ");
>>> +            if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>> +                printk("c");
>>> +            printk("\n");
>>> +        }
>>
>> What if any of the other bits is set?
> 
> I'm not sure what you are getting at, but there is another cap added 
> later for HARDWARE and it will print an 'h' next to the 'c' if set.

And that bit, when set, will likely have meaning beyond this mere printing?
If so, what's the effect on the domain when the bit is set, but the code
consuming the bit isn't there yet? Will the domain function correctly? IOW
shouldn't you reject any set bits that the code doesn't know how to handle?
And then perhaps report all unknown bits in a numeric value here?

Jan

