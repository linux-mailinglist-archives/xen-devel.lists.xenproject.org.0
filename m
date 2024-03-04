Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588A86FABE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 08:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688160.1072024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2lW-0002UQ-Cx; Mon, 04 Mar 2024 07:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688160.1072024; Mon, 04 Mar 2024 07:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2lW-0002RG-8o; Mon, 04 Mar 2024 07:29:38 +0000
Received: by outflank-mailman (input) for mailman id 688160;
 Mon, 04 Mar 2024 07:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh2lV-0002R5-36
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 07:29:37 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f31aa2e4-d9f8-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 08:29:35 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a44cf608a39so162494966b.0
 for <xen-devel@lists.xenproject.org>; Sun, 03 Mar 2024 23:29:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gt25-20020a170906f21900b00a3ec216ec6csm4390230ejb.45.2024.03.03.23.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 23:29:34 -0800 (PST)
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
X-Inumbo-ID: f31aa2e4-d9f8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709537374; x=1710142174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L1okNdYKKWc+5ObUqf2slTpzoSiSxY3lpzPn4YnJEsk=;
        b=UMHUDJIFLhwbpyvYG2TsxxZd6iIG0ayVehrP2YMOQqjsviJ02Tx8p19KQrOM+N3VzN
         zYx9ebzWnsU7fSRoZrM71N5oPUl2swuOQs6PbF7xzNkU6jllUc81/xD9Co3E3yYqffUC
         5/polJ6OoqR0V+GExayGALqiDB7IM5vGvpYo+7/1PsgV1NOfkw8kKdZ7h67+mSlVvAXJ
         tFElsXDK8XFg/r2Jze75ODf3jRnXvLq7I6UPRgN8uYuWEfRZ0IZCx/K+anlsitbJ+4Wu
         r4JJ3nJySev6IQmqH2tsRz/fClkEKWHG7UQGWmtzOWA5i+YgoezSNGZjZUDYqVlqY7US
         CF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709537374; x=1710142174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1okNdYKKWc+5ObUqf2slTpzoSiSxY3lpzPn4YnJEsk=;
        b=cJrw4mIyYtaWeJdMb6CbLkak/fSnDklgpKqkZhuPIAanFcYIpkr9kQpi9gFiq4toJf
         CcjvPTQbDz6C/3DJA/0yDYtwuUjXJbVI+NBm7i9eXeXbAjZAl1bn/ZZvA238gTTkL/et
         lCeD20uDW+43ZKeoZDBmIcVrDcqBNs4lTK4ZY4lCw0eR5/kvevrM9B2XJjoYQ1V7F3nh
         lV4AYns4HFCYvsNTrqqWHDiY/jlD/IHUtsEk2s2I4Sy8wDOdBU4llMxw7jOJWiqnN02/
         8mzKHlKeF3GVKMl6ing7kIRBjCZdfOyL1OrKzmVw8ubHVYx9pwGKj7PUDpi6jWN3rr1g
         TxTw==
X-Gm-Message-State: AOJu0YyZrQD1lKLONP33IuoIQ4G7leYN1hNFzOf+tA8OUgODTpV1tx1m
	oTvVqy1VLNST8xl/17iImtxqZHazE0hEjOKcot+T3M/IqrxSDnrGiEawxKqrHQ==
X-Google-Smtp-Source: AGHT+IFhmrSbg+iWaY6sIHRO5JN1W+QkZZ/aiYTZNMJ/kmhQ/2xzfhobcu0k5o41iC40VaPdbqjVTA==
X-Received: by 2002:a17:906:e285:b0:a45:2d35:39b2 with SMTP id gg5-20020a170906e28500b00a452d3539b2mr1601919ejb.22.1709537374477;
        Sun, 03 Mar 2024 23:29:34 -0800 (PST)
Message-ID: <a3c32c20-ddd0-4acb-946c-be5e8bba26c9@suse.com>
Date: Mon, 4 Mar 2024 08:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hvmloader - allow_memory_relocate overlaps
Content-Language: en-US
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Anthony Perard
 <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
 <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
 <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>
 <7lhrvh2ad46gjke5kvy4pbvrhstv7ihwm64suqrkle4v43tos6@oktohrjfupkc>
 <6db70696-4b40-46d2-b19c-881820338ba4@suse.com>
 <56c24b5b-42a0-4022-bb14-f90a3881fdc1@suse.com>
 <qlc7q5dm2o5jeaodayvxpokhm6f3idjkh5pgmca3gy7jgurmnl@gwttnbtl32lr>
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
In-Reply-To: <qlc7q5dm2o5jeaodayvxpokhm6f3idjkh5pgmca3gy7jgurmnl@gwttnbtl32lr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 21:24, Neowutran wrote:
> On 2024-02-07 16:02, Jan Beulich wrote:
>> Could you give the patch below a try? I don't have a device with large
>> enough a BAR that I could sensibly pass through to a guest, so I was
>> only able to build-test the change.
> 
> Hi and thanks,
> I just tested it, it indeed work well when the GPU have bar > 1Go. 
> 
> ------------
> Setup: 
> I removed my patch 
> (
> 
> 
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2431,6 +2431,10 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>                                         libxl__xs_get_dompath(gc, guest_domid)),
>                          "%s",
>                          libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
> +        libxl__xs_printf(gc, XBT_NULL,
> +                         libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate", libxl__xs_get_dompath(gc, guest_domid)),
> +                         "%d",
> +                         0);
>      }
>      ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
>      if (ret<0) {
> 
> 
> )
> and applied your suggested "skip huge BARs" patch. 
> My GPU: nvidia 4080
> -------------
> 
> When the option "Resizable BAR support" is activated in my bios,
> the BAR1 size of my gpu is reported to be 16GB. With this patch, gpu
> passthrough work. 

Good. I guess I should properly post that patch then, no matter that ...

> When the option "Resizable BAR support" is desactivated in my bios,
> the BAR1 size of my gpu is reported to be 256MB. With this patch,
> gpu passthrough doesn't work (same crash as before)

... this clearly requires further work then. 256Mb isn't all that large;
could you post a log file (fragment) for this very case?

> ( note: the option "Resizable BAR support" may or may not exist
> depending on the motherboard model, on some it is 'hardcoded' to
> activated, on some it is 'hardcoded' to desactivated)

Resizable BARs is yet another thing on my (and maybe also Roger's) todo
list. I'm a little uncomfortable doing any work there without having a
system where I could actually test it ...

Jan

