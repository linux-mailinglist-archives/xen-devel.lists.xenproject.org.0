Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE84A6A0A6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 08:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921366.1325218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAYX-0004Rf-NC; Thu, 20 Mar 2025 07:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921366.1325218; Thu, 20 Mar 2025 07:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAYX-0004PJ-KD; Thu, 20 Mar 2025 07:43:09 +0000
Received: by outflank-mailman (input) for mailman id 921366;
 Thu, 20 Mar 2025 07:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvAYW-0004PD-PZ
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 07:43:08 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5ef3c6e-055e-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 08:43:06 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso2588495e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 00:43:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b09sm23388615f8f.57.2025.03.20.00.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 00:43:05 -0700 (PDT)
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
X-Inumbo-ID: f5ef3c6e-055e-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742456585; x=1743061385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cmLGjSgeYL1iUR0M1s/Z3ay7Cv0EHyr6gg6DdBhyZec=;
        b=bSIBXp8VcJgK+tqABVBKYo2nDiH8DgBf8glFOBwArQe8jgstJVy3+e8tXdnvD3UAIb
         18MGwfVkPWV5bg69NU0Mo5FlJlBiU4xrdaV8CyqNVBc//9TMns2dwTcWZrMPA+/W5K4T
         ceSYnFUz85kFbDCgvgkCrfazHpwNJeierwh9+8EZzKerC97zOD4Y2odlfDHVqRB3ib+f
         rbv/gmuOP1ivkJ/Vjd6JRXaLTaNuoGCUiBj22kliud+6A1E37K63GYkYuJF/Fr+ltfGQ
         vq20VvrC8b6zQHH2S84ywC2KUVt9pPo8Pa4txl03/TUjGGNNe1dOK245R9Zvz2h+8h+v
         80Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456585; x=1743061385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmLGjSgeYL1iUR0M1s/Z3ay7Cv0EHyr6gg6DdBhyZec=;
        b=AA1YOVaAaTitwuuvWqd8pxx2yvtzhDKo7OysLPOylDwgLpfWelRN1BBJWN1nf88F4f
         JEdKrFFM+9KFycFC3cLHuZx+9znNbkEIHTFL65S7RTxS6IhBrfBEw00Y+pc1uM25D+Ul
         iYDhxihnlM6qLLolJsCktYEPkmyG7vT7akO77R7AIfTrTrwEQsGJPNIkSQOCCMIqChV/
         aGPzsyVtMTtXAvCUXKygVBIsCj34gPwxfl+ayj8Hjgnsu/I0tCfE3/I3rcbSsAbFhcQR
         GJDHlvUdjzS0rGCkvVvAfd1ab2JMG73lkInn2+UlH/EmKyen+2d2kTr9Uj0fYd9lQS3g
         Zcdg==
X-Forwarded-Encrypted: i=1; AJvYcCVsd8Axw9wjOha9QBbOgVfVjAcltlBdyl6KduvJGOaUSuKDExelKLhtOPC//HnvYMXiJ5u/pQkR89g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCySolUjOIwSBrtrLo0hHQ5ZvYJqJsN0xLe1ys5KhhJnY5nNdt
	oLmfw8WP/5zBdrutsqUHdmpaBowjSKd8qdwLdpEFTfRLQo7Xmj242yPaxWQCPg==
X-Gm-Gg: ASbGncs6pAHP+KamtOCat68LMTsv5dEr6AiIXNutlykZ7SZsTjrVYyFDElChxdYaZu8
	I8sYsVfgNArwyk1IFlyTK44njM4ZZ71EiXUm2qh9bbBGpllkj6U+DQ2u8kbK9JmHza2Furt7kSz
	YsfDf80MB3TvOIHrZ8+LZ4nWf8EJttrU6SHGVYqu5VtWlwzOVcA0Y3GSTyGJd4J3gYitM/ZWLjT
	Y2XF4Z/lYlNPcwYmoUj0bzM38u8FatYc/wTfbZ/1nLYsQEY2CsIT30s2BFmHqFKM1n9K0rkRIwU
	dYquciyK+pXZ0OJifN8CMjL32dURod1LqxWmDtJ1uM+OkOfl+uu7YGWx4aCXbqHWysMdgxcnfW/
	GaoueHsdfQT5nvACYyCQZJP8/HS8pAw==
X-Google-Smtp-Source: AGHT+IFQntFpGqE5+NF/b1Tcx6fU/HoLCoozO3Wq3b4gFjYlEyxWPocVSKHUZpdMZ67rRVMmbNYmzA==
X-Received: by 2002:a05:600c:1d1b:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d4918747emr15976455e9.10.1742456585423;
        Thu, 20 Mar 2025 00:43:05 -0700 (PDT)
Message-ID: <ceea7a19-0df9-46ec-8a1b-45a85488d861@suse.com>
Date: Thu, 20 Mar 2025 08:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/riscv: implement basic aplic_preinit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <6e2212313a47772d6929ae76f5e4be0f365766e9.1741709885.git.oleksii.kurochko@gmail.com>
 <9187583f-a4d0-429e-a666-113c4f8aabaa@suse.com>
 <a17037ea-7a0f-4455-aa55-ac40ac58a93d@gmail.com>
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
In-Reply-To: <a17037ea-7a0f-4455-aa55-ac40ac58a93d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 17:58, Oleksii Kurochko wrote:
> 
> On 3/17/25 4:40 PM, Jan Beulich wrote:
>> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>>> Based on the code from [1] provided by Romain Caritey from Microchip
>>> with some minor changes():
>> "Based on", to me at least, suggests an import from some other project. The
>> reference looks to be to a Xen tree though. With that, a proper description
>> would then be needed here, rather than a list of differences.
> 
> Sorry, but I don't understand fully what kind of description is needed? Could
> you please give me some pointers?

Any patch introducing new functionality not taken from another project can
be used as reference. In a patch like this the description wants to say
what the patch does, and what - if anything - is specially noteworthy. The
patch here isn't very large, so it's not going to be much that needs saying.
Yet merely referring to elsewhere would mean the description of what is
being done can be found there (e.g. in the history of that other project's
file(s)). Which isn't the case here, afaict.

>>> +static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>>> +{
>>> +    if ( aplic_info.node )
>>> +    {
>>> +        printk("XEN doesn't support more than one S mode APLIC\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    /* don't process if APLIC node is not for S mode */
>>> +    if ( dt_get_property(node, "riscv,children", NULL) )
>>> +        return -ENODEV;
>>> +
>>> +    aplic_info.node = node;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct dt_device_match aplic_dt_match[] __initconst =
>>> +{
>>> +    DT_MATCH_COMPATIBLE("riscv,aplic"),
>> Iirc this requires use of __initconstrel, which would also be nice to
>> be put between type and identifier.
> 
> Could you please explain why do we need __initconstrel? Arm uses only __initconst
> for such definitions.

And perhaps wrongly so. The distinction may not be that crucial anymore these
days, but there was a range of gcc versions where not using the correct one
could lead to "section type conflict" warnings / errors. Which one to use
depends on whether any of the field initializers require a relocation. That
is, a pointer type field initialized to other than NULL would normally mean
__initconstrel needs using.

Jan

