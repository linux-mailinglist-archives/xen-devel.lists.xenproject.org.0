Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0758BA89409
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952048.1347616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZwP-0005Dr-L6; Tue, 15 Apr 2025 06:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952048.1347616; Tue, 15 Apr 2025 06:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZwP-0005BR-IB; Tue, 15 Apr 2025 06:38:41 +0000
Received: by outflank-mailman (input) for mailman id 952048;
 Tue, 15 Apr 2025 06:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ZwN-0005BL-Rn
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:38:39 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4356cb8d-19c4-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 08:38:38 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso4121320f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:38:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963f2bsm13465826f8f.18.2025.04.14.23.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:38:37 -0700 (PDT)
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
X-Inumbo-ID: 4356cb8d-19c4-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744699118; x=1745303918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QGsc9ohzQ+jFOw1phaOx5A5zWdCF/Jc01ofBHhvwoBE=;
        b=KH/N6NChmcFPNpRFW5zASyj56PE/4nJQ+Xb/1ONLmhnIJSElfVj1ppcW/SmnKTAwTn
         Aw1zHwX7kP3guk5vnoFFZusd2mVlxVrqMzk+vfcK36CUkGsGOiJAeC09oZXJTkDcIETo
         Q7uzmDvTkUj2my0ELB3rhSqg5B7F4nI3vIxOYS6bl4FcN4SSBd/9NVuaXbgEvkFOMN/4
         dY7xMcZSVIPWLx2rbQONu9y+DIr2CESB7rtZNBnwTFdMEPkIiOdkgqp3KgSuRUVbpXeM
         fuiH9Mb48IxHuOrH5/MW5RWFnc5MIabEM8EqOV9xMggGItW3PbUre30ckBooYALb/ASe
         PHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744699118; x=1745303918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGsc9ohzQ+jFOw1phaOx5A5zWdCF/Jc01ofBHhvwoBE=;
        b=Og0W3nyuNhf9LqmcKjzb3HKBwn23vHG7ChKPU8Ga9Pa5PPM6GrrOymnwets+WJq256
         ibA8iLoLHoymz7W7Oht0Nr+CYwD698b8S1COZB8CMK7whSLTKrZvT+s32x6Ug8P/5UN2
         wFXUq+/bcdqCim/ZnkLVb0gfJjj/c+F73PHaSzq0XvMDqmKyeHyEfumCAf0mt2qYz80l
         wrp3FhJnCFU5joUWOAuL5LWUggqt5YUxUyLHX8F/70COg5l+n4SKGO+fcGOVgY1xZ33A
         P0ZtT/+pdyLFmGYd3pvVJWNukHt5wxtTrn1VGs5cUOgnuwkZCJ8XZTo/cGspTmiHowof
         8udA==
X-Forwarded-Encrypted: i=1; AJvYcCUv6L9HJgGmjRJQVQlxwrnFsN8/MYcvV16i2v8iVJJxKkdDwSkXWa6rjGfjb2V3AOuxQKOj8rD2iRU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyLvRC9OKV2R2yTL/9EnI75+PVykZVit2lcN7WEdTF2GSPklFd
	PlNUdIAGEfgtJjw5Dxbc3DZ4lJolRrW5iW99Z7UQKVRkDov0hVeHvy1LVwrjGg==
X-Gm-Gg: ASbGncv6+drhyw61Iwdb5jCFVLKXv+8Wt8MPw9Gua2mTan6gbT3v7lNsWI2Li1/4lbO
	dcb2GoLg6qWmKVlX78hd2NsjlVXPgkrj+nrt8Qu7XQVf3Y1Y26ux5eRwjC9F7KV1qedBvlderMp
	5LYGAJrW4MKt4iZqUTbmuoyjqQdunM420g8J1aDkkraG8GMviDVcvR2w9KJvVGYysTt4Dw1M26A
	4GMmmFu3QFSl5Q7wsLtIW7+l5OHH37oUusR9Qsc/C0jNcupLH1Rw6K7bJ2TF6nShhaAyR+9UPfj
	z7xCyL7m2UxVg3sYvOXZxu/CQkiUYfGXB+UQXdiWhtotquZOcnu2Ls6ULHA2jJKwBmDx1sXBh/F
	Xv7CSzBgcua2qtMYf3uJCQmCEZw==
X-Google-Smtp-Source: AGHT+IEVulrVV7MX/X3UqpvXBeR2h/phekkl0kt6skWmkULPWJEctiexPJeH2p7TQdEuxiEAqCnJiQ==
X-Received: by 2002:a5d:47cb:0:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-39edc30c5bbmr1559381f8f.13.1744699117761;
        Mon, 14 Apr 2025 23:38:37 -0700 (PDT)
Message-ID: <2b269381-d002-4aa5-bad4-8c677b8a4b0d@suse.com>
Date: Tue, 15 Apr 2025 08:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-17-agarciav@amd.com>
 <93bad6aa-57a8-427d-a0f6-924f03f0db34@suse.com>
 <D96M14WZ37ZW.D7AAHJ3RMV9D@amd.com>
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
In-Reply-To: <D96M14WZ37ZW.D7AAHJ3RMV9D@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 21:31, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 1:18 PM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/domain-builder/fdt.c
>>> +++ b/xen/arch/x86/domain-builder/fdt.c
>>> @@ -257,6 +257,18 @@ static int __init process_domain_node(
>>>              bd->max_vcpus = val;
>>>              printk("  max vcpus: %d\n", bd->max_vcpus);
>>>          }
>>> +        else if ( strncmp(prop_name, "capabilities", name_len) == 0 )
>>> +        {
>>> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
>>> +            {
>>> +                printk("  failed processing domain id for domain %s\n", name);
>>> +                return -EINVAL;
>>> +            }
>>> +            printk("  caps: ");
>>> +            if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>> +                printk("c");
>>> +            printk("\n");
>>> +        }
>>
>> Like for the other patch: What about other bits being set in the value read?
> 
> I take it that the non-worded suggestion is to have a mask of reserved
> bits for each case and check they are not set (giving a warning if they are)?

Whether a warning is sufficient I can't tell. I would have expected such to be
outright rejected.

>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1006,6 +1006,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>  {
>>>      char *cmdline = NULL;
>>>      size_t cmdline_size;
>>> +    unsigned int create_flags = 0;
>>>      struct xen_domctl_createdomain dom0_cfg = {
>>>          .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>>>          .max_evtchn_port = -1,
>>> @@ -1037,7 +1038,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>      if ( bd->domid == DOMID_INVALID )
>>>          /* Create initial domain.  Not d0 for pvshim. */
>>>          bd->domid = get_initial_domain_id();
>>> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>> +        create_flags |= CDF_privileged;
>>
>> Seeing that builder_init() in the non-DT case sets the new bit unconditionally,
>> isn't the shim's only domain suddenly getting CDF_privileged set this way? Oh,
>> no, you then ...
>>
>>> +    d = domain_create(bd->domid, &dom0_cfg,
>>> +                      pv_shim ? 0 : create_flags);
>>
>> ... hide the flag here. Any reason to have the intermediate variable in the
>> first place
> 
> Well, the logic would end up fairly convoluted otherwise. As things
> stand this can be encoded in an if-else fashion with 2 calls, but
> there's 2 capability flags coming that need integrating together.
> 
> This is just avoiding further code motion down the line.

Is it?

-    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    d = domain_create(bd->domid, &dom0_cfg,
+                      ((bd->capabilities & BUILD_CAPS_CONTROL) && !pv_shim
+                       ? CDF_privileged : 0));

isn't really worse (imo), but is highlighting the problem more clearly: Why
would the shim have BUILD_CAPS_CONTROL set in the first place? Without that
the statement would remain pretty similar to what it was before.

Jan

