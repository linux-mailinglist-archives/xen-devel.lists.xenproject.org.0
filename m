Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF49824058
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661530.1031240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLe6-0003I3-Tv; Thu, 04 Jan 2024 11:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661530.1031240; Thu, 04 Jan 2024 11:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLe6-0003Fo-Pe; Thu, 04 Jan 2024 11:12:18 +0000
Received: by outflank-mailman (input) for mailman id 661530;
 Thu, 04 Jan 2024 11:12:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLLe5-0003Fd-21
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:12:17 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d48fa82-aaf2-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 12:12:15 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cd0c17e42bso4310461fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 03:12:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bo33-20020a056e02342100b003600705e58asm6456484ilb.48.2024.01.04.03.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 03:12:13 -0800 (PST)
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
X-Inumbo-ID: 1d48fa82-aaf2-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704366734; x=1704971534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aq5rkbQj2KpX16nl0ZcGOiVf5PhrMNV5nU2YySiLBBg=;
        b=McjU0ciBuXUy1FAbSrRvN/58ec1UjdSq/z6wid0ybaBpCQLzpbJMS8m/oWcFpksn0x
         tBv8f9jVD3uG/Dz8DTCzf0ImnPrs93V72cPGq3JEkBUtHaNFXMFTQqNY94+2+dRHZa89
         ruXiQ4OsyDt2BEy60gGzfJMtCxfU2kHeikEMHMq4OV/zUbBEmVDzmT5fN63Ki4N2DbNU
         lU4p1c5s7TV7/TnMeKz83vX9JYrnW7pqFq6tqfrI0iVxyfosSx+o2v8z2MO54/RFSdM8
         5pq5Tuk/p5b/nUuw+hhds9xUpL23J7jx+Aa5KznQ/79JFdedUl+KklMbXyNSiV+ol6x2
         z9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704366734; x=1704971534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aq5rkbQj2KpX16nl0ZcGOiVf5PhrMNV5nU2YySiLBBg=;
        b=q68hPaV83KwlOoLqtIPmV4r/TgnWqglUdzhDVjRfppCOVqbUyLbFaIgn/IWAvz8FDd
         b12SGSIHXYQhqSENnQ24E6fxxkSGGAog022LkCab9qXOkHkFN9wqt0z3SqIw2UxZ7agT
         0NUT7jyuxA2DfHYzxEPlO5n1ts4ELtnEJ0NEeVnqp+JtPpyGVW/l3IjGB+VXAyCuy6c4
         dYcRpkm3FyT2r3ARV1LZtlngIFO3Eo0g+wX9eKna3Q6DcPORiGWrwOv13zX7ilrl5bKI
         gEPSjSVmgNPSEOc/BwKTGZWf6r8m0uTY6er35auFTHT4FhTXRgARoT20SAxEbigA1xpG
         WLdg==
X-Gm-Message-State: AOJu0YzSfaJsib91PBWDjo7xFapuJ6b3nIcqpvG0/nAXIGP1Xd6qJPPr
	nyIoEn8W6P09NwoP6ipEF3ajzHrOASrG
X-Google-Smtp-Source: AGHT+IFE0NtE1Sj3EF1oWdOTx2QPP6WZh2Evo1Klhlp3fTU3agn/4wJQ6nMY4QhVUHdI5Bu8NqResg==
X-Received: by 2002:a05:651c:508:b0:2cd:1d5d:3240 with SMTP id o8-20020a05651c050800b002cd1d5d3240mr316200ljp.0.1704366734074;
        Thu, 04 Jan 2024 03:12:14 -0800 (PST)
Message-ID: <24b83048-7043-47a9-9fc9-3bb6cc849bad@suse.com>
Date: Thu, 4 Jan 2024 12:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: Disable relocating memory for qemu-xen in
 stubdomain too
Content-Language: en-US
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20231227023544.1253277-1-marmarek@invisiblethingslab.com>
 <dvzyuckd4w7vii3bytpsecdyyzizgbgxslyxiciobw3ac6wmlb@uolzr2buvi2k>
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
In-Reply-To: <dvzyuckd4w7vii3bytpsecdyyzizgbgxslyxiciobw3ac6wmlb@uolzr2buvi2k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.12.2023 17:54, Neowutran wrote:
> On 2023-12-27 03:12, Marek Marczykowski-Górecki wrote:
>> According to comments (and experiments) qemu-xen cannot handle memory
>> reolcation done by hvmloader. The code was already disabled when running
>> qemu-xen in dom0 (see libxl__spawn_local_dm()), but it was missed when
>> adding qemu-xen support to stubdomain. Adjust libxl__spawn_stub_dm() to
>> be consistent in this regard.
>>
>> Reported-by: Neowutran <xen@neowutran.ovh>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>>  tools/libs/light/libxl_dm.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
>> index 14b593110f7c..ed620a9d8e14 100644
>> --- a/tools/libs/light/libxl_dm.c
>> +++ b/tools/libs/light/libxl_dm.c
>> @@ -2432,6 +2432,16 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>>                          "%s",
>>                          libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
>>      }
>> +    /* Disable relocating memory to make the MMIO hole larger
>> +     * unless we're running qemu-traditional and vNUMA is not
>> +     * configured. */
>> +    libxl__xs_printf(gc, XBT_NULL,
>> +                     libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate",
>> +                                    libxl__xs_get_dompath(gc, guest_domid)),
>> +                     "%d",
>> +                     guest_config->b_info.device_model_version
>> +                        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
>> +                     !libxl__vnuma_configured(&guest_config->b_info));
>>      ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
>>      if (ret<0) {
>>          LOGED(ERROR, guest_domid, "setting target domain %d -> %d",
>> -- 
>> 2.41.0
> 
> Seems to work as expected

May we translate this to Tested-by: ?

Jan

