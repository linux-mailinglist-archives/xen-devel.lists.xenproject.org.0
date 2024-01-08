Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C348269BC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 09:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663225.1033080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlHo-0007da-Cj; Mon, 08 Jan 2024 08:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663225.1033080; Mon, 08 Jan 2024 08:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlHo-0007c1-9O; Mon, 08 Jan 2024 08:47:08 +0000
Received: by outflank-mailman (input) for mailman id 663225;
 Mon, 08 Jan 2024 08:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMlHn-0007Yg-1p
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 08:47:07 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f9545de-ae02-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 09:47:05 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd46e7ae8fso12662411fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 00:47:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 6-20020a056e020ca600b00360039199cesm2385053ilg.3.2024.01.08.00.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 00:47:04 -0800 (PST)
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
X-Inumbo-ID: 7f9545de-ae02-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704703624; x=1705308424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23SIozuRFcdxuTmn/9ayH7irJdmJq3+AJNjBt8lsocI=;
        b=HcmzkQZQl2kqNe5E1w9h1RmojXe4/1Fg5XObgGyazn0O3VltfRqar51d+qbOWO8meV
         zIBgvie8xhGz5QOjSnfhjPJRPr0wh8pQdz4XIpRJcdlDD2dsZCewtQ9HJJyxogctlAd3
         e+0qH0xzogI1d2NnrroO0zjlvezTlvRtBVjQFzwRcJ42ZqT3FFRCJ6IhMpOYyfIp6wZi
         iLrFQx0nJa9i/BSlWELungGEhNVY0SVWIpTlyxXoPFm5/GXnmsH8vXIIDDYbKV2P22QW
         YKwxWq5SWAOlKmR6viyY2ucQ9KrmnVY0w17Hps1+mTtz7PoHWpdx0eD4vRjHHaR/YnE1
         NlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704703624; x=1705308424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23SIozuRFcdxuTmn/9ayH7irJdmJq3+AJNjBt8lsocI=;
        b=ZopodJAh8rakbFmaFrSYPRq+XfE7fLBc35UJJDoDvxg0W8QY2dP9ljQXaryAggO/l/
         0UK2s0YfnNWeQ1ntfQq+ZSZgoCtQ9IHvXWLXYri/N3gIzCof4b+0ybrARXKfKO+hagFl
         86feB9k1CsjJNWFR21T7xDVgSYrPTpORoznx5uuSTK0LE15wjqAaDro53XY8GjuRCbuA
         wWIPEiVBd2YiOzT+3KbkSTUv1yRC9O2087zujiSGmiSUb8yLXVPLWAApONGc9bfEB6Nn
         ejtVLsjkYOtjJmZyvjEvGOCz5qpFNc5xGSfaSCmOyXxcKSjoRP7c2z3k+TQdNqDmE7Y3
         FXtA==
X-Gm-Message-State: AOJu0YztoGegr3KPN8pd//gzndxWoq7rJWXybzWCYhMdMazzVFDEFDqY
	SU/LqeDtDeyq0XzRNwHT74ZJ5+JPxe1V
X-Google-Smtp-Source: AGHT+IH6ugZiTdpg8qD/44VBqbP5ZhOyMcTykCOrVQYeAbKpk9QvPjZ8yUlSztskPf5BfQjRIvvbGQ==
X-Received: by 2002:a05:6512:10c5:b0:50e:44c9:b839 with SMTP id k5-20020a05651210c500b0050e44c9b839mr870598lfg.47.1704703624483;
        Mon, 08 Jan 2024 00:47:04 -0800 (PST)
Message-ID: <242dbf1f-ef3e-42cc-906e-5c5bb01d8e31@suse.com>
Date: Mon, 8 Jan 2024 09:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller
 isn't DOMID_SELF
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-3-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051639240.3675@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2401051639240.3675@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2024 01:46, Stefano Stabellini wrote:
> On Fri, 5 Jan 2024, Jiqian Chen wrote:
>> @@ -72,8 +73,30 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  
>>      switch ( cmd )
>>      {
>> -    case PHYSDEVOP_map_pirq:
>> -    case PHYSDEVOP_unmap_pirq:
>> +    case PHYSDEVOP_map_pirq: {
>> +        physdev_map_pirq_t map;
>> +
>> +        if ( copy_from_guest(&map, arg, 1) != 0 )
>> +            return -EFAULT;
>> +
>> +        if ( !has_pirq(currd) && map.domid == DOMID_SELF )
>> +            return -ENOSYS;
> 
> This looks OK to me although there is already another copy_from_guest in
> do_physdev_op, but I don't see an easy way to make it better.

How can double reads of hypercall args ever be okay? The new check clearly
needs to be inserted in the code path where the structure is being read
already anyway.

Jan

