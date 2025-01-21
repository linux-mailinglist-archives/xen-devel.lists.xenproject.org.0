Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A63A17EE3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 14:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875432.1285874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taELl-0007Nb-06; Tue, 21 Jan 2025 13:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875432.1285874; Tue, 21 Jan 2025 13:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taELk-0007KZ-SM; Tue, 21 Jan 2025 13:31:24 +0000
Received: by outflank-mailman (input) for mailman id 875432;
 Tue, 21 Jan 2025 13:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taELj-0007KT-UM
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 13:31:23 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00f38014-d7fc-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 14:31:22 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso39207775e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 05:31:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322a838sm13219048f8f.48.2025.01.21.05.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 05:31:21 -0800 (PST)
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
X-Inumbo-ID: 00f38014-d7fc-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737466281; x=1738071081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2fuCUTPp7zNUUkC9Vvp8PuqkVeIs8e/F37hznUw6Xjo=;
        b=BhNFVgVsQnitVgcuK5oVKfYKnUOwBUdyUjty/wSDPqXhukHdvW036iblmfBhKUlEtr
         4uPxifAklkBA9rcxbsMaUhMkuCL8M8SSg+DQoaQv4aVZYyqk7NI6JFFr19Bo8xtNN6Z9
         Ke2draVC5xwMFteldMoOADn06tMdOk5dfDAZgUO/S3BszdTD/mQTxWxmRLAu/Mb8sAjv
         wsv4fM+ZSLdC8QG1tT1tBsvLyDwoqq55izQu/SBfD615RnX1MIT2J348WIP3rM4FuVzt
         A+XPWJi5RXVsjmby/GW/5k+8MLxBptveZqFcVzrPBPqVqO1X/2c/oA6I52p0oweptCvD
         e7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737466281; x=1738071081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fuCUTPp7zNUUkC9Vvp8PuqkVeIs8e/F37hznUw6Xjo=;
        b=nXjk2Dg7jIRY8HqTG5DQnz4ypjQCliGtbNAwjM9Rje6hw35wFt9xTsbgYpbSGP0VmU
         QUi6Xt+arVlEacI8yEuTwtVtfZpSj+WprbKspsDI5t1z9/GdY3bzfUz6BJoEp2HVYrTo
         SyauU0f6dZrwJ1o1/u5ZkZO3FId7aUx9U7pTjj3a1jYCrZxDpvYKo6hgyOeK6eHuvvea
         Z1se6fJ6n5LueiA2fjcqQe1kSvf2h7a5NjTSsYUeA2GgYebHa8aZLxdTb4mtGAXUh7Mi
         LqCrwMAZzviJuK1TqrfhfwJcVYRoDkE42YZd9pq0nomsVNbgzm1bGFJ5EKR6Te8kiLht
         PIBw==
X-Forwarded-Encrypted: i=1; AJvYcCV9sYw3qLlbdNw8tOLzI6jevGEmhmADQX57FEwJizoRbnMMtAiZTn/GYwpaImE6kvjI3AbsU4Mid74=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVsk0EsOBj5SCd75iPVHNjGKkwoHh/bK7PBOl2nT0w8/M+75Ij
	XHqwXbBeBYxRBZWtgn10GIVLkhVtjF73sFk/ZSrpew9741gbeGwVty0o52vD5Q==
X-Gm-Gg: ASbGncvv7njRcSrUiwS4KvR7qzVWophRyr93Tkr9y1KGfhicEiEzGOShGgLtimHpBQ6
	tTC0tvrYAheSB4u/p7+O4r3UD1Hynn7zl7f//r3EKQ5xQ8z2TPtr9muWAA/Fo1FRJQP3Xhq2J/D
	uPZzUT6hQJoD1qC4CNes2JVGbjyf0wCRSn/FwxeSNC6EtLIos8jMeYqY4ss1aOjkrjve9EIP8Uc
	V04jf1ERa86hQSgmf9yuOp8S+UvLrksjqLDGhfFlmMUPqYsxE+sVRG696f39ujyjno2NuovJnBS
	zO47+eHXwC7zxswAb+oMXim7wUPu77sfvt/+IWEy5rDP99TilG/v+po=
X-Google-Smtp-Source: AGHT+IFQeYqRSIktfzxC33wPeR7Hf55ZTEYfZwB1+RFZjdlx7z8oqeGbCYnNWT6CmdcxedbLw0v6VA==
X-Received: by 2002:a05:6000:18a2:b0:385:f840:e613 with SMTP id ffacd0b85a97d-38bf57b6d9amr19394726f8f.51.1737466281444;
        Tue, 21 Jan 2025 05:31:21 -0800 (PST)
Message-ID: <b88cfbd0-b4f1-4f70-971f-574198eca830@suse.com>
Date: Tue, 21 Jan 2025 14:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: identify specific ISA supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0a6562ae1e22e3fe607054b33df3467c12d0b276.1736956861.git.oleksii.kurochko@gmail.com>
 <0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com>
 <59dd7cdd-b353-4463-966e-345266a7a54e@gmail.com>
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
In-Reply-To: <59dd7cdd-b353-4463-966e-345266a7a54e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 13:37, Oleksii Kurochko wrote:
> On 1/20/25 4:13 PM, Jan Beulich wrote:
>> On 15.01.2025 17:36, Oleksii Kurochko wrote:
>>> +#if defined(CONFIG_RISCV_32)
>>> +    if ( isa[2] != '3' && isa[3] != '2' )
>>> +        return -EINVAL;
>>> +#elif defined(CONFIG_RISCV_64)
>>> +    if ( isa[2] != '6' && isa[3] != '4' )
>>> +        return -EINVAL;
>>> +#else
>>> +    #error "unsupported RISC-V bitness"
>>> +#endif
>>> +
>>> +    isa += 4;
>>> +
>>> +    while ( *isa )
>>> +    {
>>> +        const char *ext = isa++;
>>> +        const char *ext_end = isa;
>>> +        bool ext_err = false;
>>> +
>>> +        switch ( *ext )
>>> +        {
>>> +        case 'x':
>>> +        case 'X':
>>> +            printk_once("Vendor extensions are ignored in riscv,isa."
>>> +                        "Use riscv,isa-extensions instead\n");
>> Interesting suggestion considering that doing so will end in a panic().
> 
> Do you think that "Use riscv,isa-extensions instead\n" would be better to add when "riscv,isa-extensions" handling
> will be ready?

Possibly (see also below). At the very least the code should be self-consistent.

>>> +static int __init riscv_fill_hwcap_from_ext_list(void)
>>> +{
>>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>>> +    const struct dt_device_node *cpu;
>>> +    int res = -EINVAL;
>>> +
>>> +    if ( !cpus )
>>> +    {
>>> +        printk("Missing /cpus node in the device tree?\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    dt_for_each_child_node(cpus, cpu)
>>> +    {
>>> +        const char *isa;
>>> +        int cpuid;
>>> +
>>> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
>>> +            continue;
>>> +
>>> +        cpuid = dt_get_cpuid_from_node(cpu);
>>> +        if ( cpuid < 0 )
>>> +            continue;
>>> +
>>> +        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
>>> +        {
>>> +            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
>>> +                   "for cpu%d\n", cpuid);
>> This is DT's number space for CPUs, isn't it? Any use of cpu%d (or CPU%d) or
>> alike generally suggests the number is Xen's. This may want disambiguating
>> here.
> 
> Yeah, the cpuid in this context is from the DT's namespace.
> 
> I'm not sure if we can get Xen's number at this stage, as only one CPU is used. We can only get
> the DT's cpuid for Xen's CPU0 as|set_cpuid_to_hartid|(0, bootcpuid) has been already called.
> For other CPUs, it depends on the order in which they are booted and the call to|set_cpuid_to_hartid()|.
> 
> I think that the best thing we can do is re-wording. I have two options:
> 1. "for DT's cpu%d node\n", cpuid);
> 2. "for hartid%d\n", cpuid); -> as based on the function name|set_cpuid_to_hartid|() we are using cpuid
>     for Xen's cpu id and hart id - for real cpu id.
> I prefer the first one option as it is more explicit and it doesn't require to know RISC-V specific terminology.

I'd be fine with either; all I care about is absence of ambiguity.

>>> +    if ( ret )
>>> +    {
>>> +        printk("Falling back to deprecated \"riscv,isa\"\n");
>>> +        riscv_fill_hwcap_from_isa_string();
>>> +    }
>> I continue to find it irritating that you first try a function you
>> know won't succeed (and will panic() if the DT item is actually there),
>> in order to the log yet another message about using something that's
>> deprecated. If this is deprecated, why don't we prefer (and hence
>> support) the mor modern approach?
> 
> Even though it is considered deprecated, I haven't seen any DTS files in the Linux kernel using|riscv,isa-extension|.
> Currently, Xen relies on the DTB generated by QEMU, which still uses|riscv,isa|. This is why, unfortunately, we still
> need to support the deprecated|riscv,isa|. (Although I would much prefer using|riscv,isa-extension| since it's easier
> to parse.)
> 
> Based on the fact that every source I checked doesn't use|riscv,isa-extension|, I decided to postpone adding support
> for it. However, this task is still on my TODO list.
> 
> I completely agree that this is a frustrating approach. But at the time of porting the code, it seemed like the
> best option. After you pointed it out, I think we could improve this part of the code in the following way:
>    -    int ret = riscv_fill_hwcap_from_ext_list();
>    -
>    -    if ( ret )
>    -    {
>    -        printk("Falling back to deprecated \"riscv,isa\"\n");
>    -        riscv_fill_hwcap_from_isa_string();
>    -    }
>    +    if ( riscv_fill_hwcap_from_isa_string() )
>    +        panic("HW capabilities parsing fro isa string failed\n");
> ( with dropping of riscv_fill_hwcap_from_ext_list() and adding of return value for riscv_fill_hwcap_from_isa_string() )

That's probably best indeed. The panic() message may then want conditionalizing
upon there actually being "riscv,isa-extension" in DT. If there is, you may want
to say that support for it needs implementing, in place of the above.

>>> +    for ( i = 0; i < req_extns_amount; i++ )
>>> +    {
>>> +        const struct riscv_isa_ext_data ext = required_extensions[i];
>>> +
>>> +        if ( !riscv_isa_extension_available(NULL, ext.id) )
>>> +        {
>>> +            printk("Xen requires extension: %s\n", ext.name);
>>> +            all_extns_available = false;
>>> +        }
>>> +    }
>>> +
>>> +    if ( !all_extns_available )
>>> +        panic("Look why the extensions above are needed in booting.txt\n");
>> Where's this booting.txt? I don't think people should be made hunt it
>> down ...
> 
> I will add ("...docs/misc/riscv/booting.txt\n").
> 
> As an other option I could paste here a link to booting.txt ( it will violate code string length but I think it is
> fine in the current case ):
>   panic("Look why the extensions above are needed inhttps://gitlab.com/xen-project/xen/-/blob/staging/docs/misc/riscv/booting.txt?ref_type=heads \n");

String length is of no real concern. What I'd recommend against though
is to reference anything other than the canonical tree (which lives on
xenbits, not at gitlab). Yet better might be to refer to the produced
documentation
(https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt)
rather than a file in a source tree / git repo.

Jan

