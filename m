Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780C96A36D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789407.1199030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVuC-0006QN-BY; Tue, 03 Sep 2024 15:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789407.1199030; Tue, 03 Sep 2024 15:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVuC-0006O1-8C; Tue, 03 Sep 2024 15:57:20 +0000
Received: by outflank-mailman (input) for mailman id 789407;
 Tue, 03 Sep 2024 15:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slVuA-0006Nv-S7
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:57:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32117a06-6a0d-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 17:57:18 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a868b8bb0feso667698566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 08:57:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb32asm697784666b.23.2024.09.03.08.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 08:57:17 -0700 (PDT)
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
X-Inumbo-ID: 32117a06-6a0d-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725379037; x=1725983837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LOUCON6nEGPlDwEBd12VjV3QBcEx9jbDgXkh8G9pyrA=;
        b=M5Jk/YjUdUhOIwRsi66Dhwe5+g8hRFOSbWf7QCiZWOH0m9uj3p+m24AibOLM+yCdq5
         2MQTvZTbLpQPpQQ2bdS7nBCdF/tbyClQyeIqGqdWsy+XwAmu+WsB6TxRaDmyV/yFcG3P
         U3CCAuzBPnHPtTCaJ700Yv5U9Yxu5b6yValXZ9FLhojz7vKK3SBvE8wJYpicZJainLmh
         h0rIR7XRa6YOC8ICKmw4EGJIdbSaU/fJt7AVifpNXyRIqfatoxkwu/4iDZooJyuEEajC
         OpZYAYouGbBTtxwTS3z9ot8BnvHTI44cbORLQkDiDxN3jSX6rq4mT4Xb5FHZuQODDxIg
         vFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725379037; x=1725983837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOUCON6nEGPlDwEBd12VjV3QBcEx9jbDgXkh8G9pyrA=;
        b=KoxYyXfmnKiOaMIEuz0V+bZnZcF7aSYbTR0aD6ZO77sNxG941Vkyp7wEphG2PpzyZo
         /b7AG1cM5xeTV77cqV0++FmcLLrqILPB9nfW5g3TmYaiBt/2Bd1RVgaE/dypHwOx+qk0
         HYsJpn3kz2fTCKWsFhSwpUM8YPpPwDfc4zVsLUIftY4Ghz9G3VLUf3Rv40TsSvmMgy16
         u5q3qfOrFrToWSSFgb73jWm1G+J6TozNCuCKN4Sblk3xxZUI2ZBdHDseEbruEYN3XKNS
         SiWbQTfwJ4+WqcDlHfPribeVGyCWbQQK2FJgtWhTRCLmsDS3x54U1U2XBXVAVyNoYSGP
         4JNQ==
X-Gm-Message-State: AOJu0YxnP2psHSYjhCv/CCWrxTZFCqOyDAsIzJp0AUYbAE26nVAC/6Y6
	9+RnUvBG01Il6KG7yn1uu+6jvsjIFc5YsnfF1DyC8RZiAvsRBe2ECtKu++8yew==
X-Google-Smtp-Source: AGHT+IHFzaMx/oyVyorOGFYHT9RdWzK63wFkIIfg/izBBShtaNl063O6TKf1IvnwxDIuJdndOGsEUQ==
X-Received: by 2002:a17:907:7248:b0:a86:7c6f:7cfa with SMTP id a640c23a62f3a-a89a36a2db4mr940285566b.37.1725379037299;
        Tue, 03 Sep 2024 08:57:17 -0700 (PDT)
Message-ID: <232f8936-db2b-49be-a6f6-31bd8bb34c7f@suse.com>
Date: Tue, 3 Sep 2024 17:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v14 4/5] tools: Add new function to get gsi from
 dev
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-5-Jiqian.Chen@amd.com> <ZtcwmSqeryBVjmlh@l14>
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
In-Reply-To: <ZtcwmSqeryBVjmlh@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 17:51, Anthony PERARD wrote:
> On Tue, Sep 03, 2024 at 03:04:23PM +0800, Jiqian Chen wrote:
>> --- a/tools/libs/ctrl/xc_linux.c
>> +++ b/tools/libs/ctrl/xc_linux.c
>> @@ -66,6 +66,26 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
>>      return ptr;
>>  }
>>  
>> +int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
>> +{
>> +    int ret;
>> +    privcmd_pcidev_get_gsi_t dev_gsi = {
>> +        .sbdf = sbdf,
>> +        .gsi = 0,
>> +    };
>> +
>> +    ret = ioctl(xencall_fd(xch->xcall),
>> +                IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
>> +
>> +    if (ret < 0) {
>> +        PERROR("Failed to get gsi from dev");
>> +    } else {
>> +        ret = dev_gsi.gsi;
> 
> I've just notice that this is mixing signed and unsigned int.
> We are storing a "__u32" into an "int" here. This isn't great as we are
> throwing way lots of potentially good value. (Even if I have no idea if
> they are possible.)

GSIs are numbered 0...N-1, with N being the number of lines all IO-APICs
in the system together have. Surely that's not going to go into the
millions, let alone billions. At least not any time soon, and there's
move away from using line interrupts anyway.

Jan

