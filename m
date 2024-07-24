Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693993B100
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 14:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764177.1174521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbIu-0001sO-4S; Wed, 24 Jul 2024 12:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764177.1174521; Wed, 24 Jul 2024 12:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbIu-0001qX-12; Wed, 24 Jul 2024 12:41:12 +0000
Received: by outflank-mailman (input) for mailman id 764177;
 Wed, 24 Jul 2024 12:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWbIs-0001qQ-RZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 12:41:10 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b8f4c1-49ba-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 14:41:09 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5a22f09d976so1479519a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 05:41:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a7661b26c4sm5013485a12.26.2024.07.24.05.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 05:41:07 -0700 (PDT)
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
X-Inumbo-ID: 00b8f4c1-49ba-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721824869; x=1722429669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ll72TSk/Tmp5xvsxmqnNCtBoWv0yoPYAYGWyfGZq+1I=;
        b=UUPAkuoGo8sf4a2mNGBNeToJimCy+h5sB4xSn3dp5VfZ/4Wmraf9RK9351laTdvw7N
         Czb+NoG/VUS6+yhf3Msf9tsMjzMjt4ib9SP7VD7nraQyEFJ5bC4XAIL6KUcM9oakmpTd
         cKgdc0qIR8pyBg+ng91iiXCUl1KUA4Jq4+yPZqakkMQL1wCCoug0v1nCLL3SddlAbRUJ
         bVq006qsbOwqYy9yzlwFBP0JUT5G4krjwsVnHC3aIEmNyzvT+ECZR6IsMNmvHRpeYq1r
         UGmfQ3qmcpLM8j7OJ27tln/nxxzm7FoAwJ2ZZEwIkKTIzqnK4Y1QlJqcgcDj3L31GDz1
         pOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721824869; x=1722429669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ll72TSk/Tmp5xvsxmqnNCtBoWv0yoPYAYGWyfGZq+1I=;
        b=v2jKI77BFWntP6UnfFFmUyyHhF0UFy+FwhqBw2Ae0i/bNj2PRxVFnkMMNeCi9zTzKl
         eh3oWiww5LUgFdiLscp0ZuBFUkaSIAVeFarGg6iEgBI6g7Zuj34W9+v34ti6dXYidlJc
         tzDu/yfIX29aUftIL3ccK0IpcLoivic6fHpm9Kk45U+/+GcI1ZT6jaxW2PiVtJsZ4y1D
         iWd5vj3naI3tm9LUxbmdTgzn87or8NL0V1X7ZQ4mrnpSbqBz9S0a5WxbPSFZC+emu7DM
         qceoHdAfdEgTCieLxLyuAScHoDIN1j5JE/9DRj33AZIh1lFkmAWPvBwnaGyfwiMmBs/z
         DmGQ==
X-Gm-Message-State: AOJu0Yyq4j7cHyLWpVj+37ER5g3J7S7XSmG18a5T53hPMdGbYW3uHI1G
	DJuJpplQ8LRKJ3ghZfRU8lNlQoPDt28L/IHkLq2h6IixBiTWi7QFS2bucSlU0Q==
X-Google-Smtp-Source: AGHT+IGtcEp67XcFlau0eT0IK1XNiyviUHUt0g0VuccjJ662cDTu3GqAajpxLTqo9DLoXlYTkklIxA==
X-Received: by 2002:a05:6402:2689:b0:59f:9f59:b034 with SMTP id 4fb4d7f45d1cf-5ab1af79c28mr1922358a12.13.1721824868033;
        Wed, 24 Jul 2024 05:41:08 -0700 (PDT)
Message-ID: <e65e7307-7955-4427-9a10-7bfc1e1b7d59@suse.com>
Date: Wed, 24 Jul 2024 14:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20240715234631.4468-1-jandryuk@gmail.com> <Zp/GcCUVPX/d/7qx@l14>
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
In-Reply-To: <Zp/GcCUVPX/d/7qx@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 17:04, Anthony PERARD wrote:
> On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk wrote:
>> "$dev" needs to be set correctly for backendtype=phy as well as
>> backendtype=tap.  Move the setting into the conditional, so it can be
>> handled properly for each.
>>
>> (dev could be captured during tap-ctl allocate for blktap module, but it
>> would not be set properly for the find_device case.  The backendtype=tap
>> case would need to be handled regardless.)
>>
>> Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy compatibility")
> 
> Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy compatibility") ?

Which, when replacing it, made noticeable that the above and ...

>> Fixes: 76a484193d ("hotplug: Update block-tap")

... this hash also were too short. Please make sure you use 12 digits, as
indicated by docs/process/sending-patches.pandoc.

Jan

