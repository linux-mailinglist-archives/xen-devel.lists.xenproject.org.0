Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDDAB3566
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981265.1367669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQrw-0005Cd-6z; Mon, 12 May 2025 10:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981265.1367669; Mon, 12 May 2025 10:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQrw-00059c-41; Mon, 12 May 2025 10:58:48 +0000
Received: by outflank-mailman (input) for mailman id 981265;
 Mon, 12 May 2025 10:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQru-00058c-3U
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:58:46 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1316e348-2f20-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 12:58:45 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5faaddb09feso8583489a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:58:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d710549sm5523822a12.76.2025.05.12.03.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:58:44 -0700 (PDT)
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
X-Inumbo-ID: 1316e348-2f20-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747047525; x=1747652325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PIr9ru3uBaMG5TqjteH4QmSYT4w5JsZLcfPm/fOk++Y=;
        b=Yzpe/ZvGpARolD/0PfcqrFU29EBiyWIXu01hQxsymC6RF9sf6AduMmTroLC68giIhW
         BsKmL1cRr+Xz1So5GyOXhnIJ5b9fwuBwtxJvJXOS4xCMdvFM/CrV9m1JNGRdqKrFPavi
         YnaATKhNne37Yz7QrSKGS+fej3aKPJpVvWZiMQXqkElDku71FNyT6PjQrVCVgs6HIY66
         JoY2PPtVhb/JtK0MJy17CE+DKjIEEDffg8/AHTfNTOu7RKEvy07iMH4Evkp0pIRDGhA3
         76WLVL2GDYHVNHIbvPuPsF2+a9X88QsYVUE01VG0MwmzniCZfKqLPaPDOgP1N4cK4cd/
         DaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047525; x=1747652325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIr9ru3uBaMG5TqjteH4QmSYT4w5JsZLcfPm/fOk++Y=;
        b=KZReElTsnsTfRhRy2sZcQLyepq+pph03l1iaiio+pesdf4Kw2vgPLuTjin6owaLcv6
         oO0JGFaCNx1GIgvoxL2sOLfLFMCTS8mtUPX162BsB6/+RCsh6ifmbuJvEeiWxkyKoXqP
         29+u/Z43fMNCHc46WyWCyvPkz7uEDn8cl5QlLsRtW9BQEUvABsdWQJHG+ypX0t8k32Wn
         shPALbZZqcIOpRcU4NRln7S2GuTpRdSoYuWyB8ogJfrgzuQ3doPxjC9uG1B7gehAvHj0
         nzIl0lRIjORomg/26YJNclt5i9cH5Fdak7vFxZG5L8aW78EGMNAEULI9omNqf8kjZOTt
         F5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXAIDPA6ixNAefxUQfNknNA2C5IPTVvPlCyD04Slb4xy1y6d3rOzvcpAuWocvLa34fsEXADlt9Uxb0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvKEsKhOuThEp0muFA5l2j6kobeP0YD6l/t8dB9S9RlQXKHNjz
	pmU2CGzag1pQaVGjjaUknges17gNqGoZDsdJvMYfRaBgVunAKvpTjoEDKMg9a8h1ZMjGgZpGR6E
	=
X-Gm-Gg: ASbGncv1rF95GaNuj6FHm8wvC9Ac+ioRMyFNAMSS8szQjWZBNxyP4VicCh6YYSLHH/S
	aziuQJzFQMpkL/2Xphk1InhyEmzzx4N4JloqSysDvFf8xDNmXYhCFf0C23GAQEw07nwPm8cWUEf
	Qqx5VyZMADmfO63JVFP7bt2rXQm7qtKKkxJ/KQr+MG0KNdUct03UtRvbzMV/ealtNnLnAjIxl8Z
	6d1/flwz2NJrdq3tcd6Re+UDNodXF3WA9HpAoZqbuEmiaWYugCY6QrnwxjB9maNIKjyzSL9DpSC
	6XaFwqn93lmZLugdPgbrph3GEttYfE6jdhINFJIK/YpSxd0LWWnTjCTWiwrfW++DzWuhrGhMt25
	47Mc3erC1kerzxLDZqCPUAU4/f9SBuhGGnd5q
X-Google-Smtp-Source: AGHT+IEkAcNh92M4Dvid3pqmtdIwiS4lraMB5PUWsD9Cmz2OBessHJEOrniS35MJOtJjOmIGvWy3rA==
X-Received: by 2002:a05:6402:3507:b0:5f6:c638:c72d with SMTP id 4fb4d7f45d1cf-5fca0730831mr11703568a12.7.1747047524989;
        Mon, 12 May 2025 03:58:44 -0700 (PDT)
Message-ID: <4b492493-5390-4759-98f9-859fe43bb7e0@suse.com>
Date: Mon, 12 May 2025 12:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] livepatch: Pass buffer size to list sysctl
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250508170156.558291-1-ross.lagerwall@citrix.com>
 <e9f0e66c-a05d-4e95-9446-435d9ca51753@suse.com>
 <aCHTaXClFFRUX2tv@macbook.lan>
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
In-Reply-To: <aCHTaXClFFRUX2tv@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.05.2025 12:54, Roger Pau Monné wrote:
> On Mon, May 12, 2025 at 11:51:35AM +0200, Jan Beulich wrote:
>> On 08.05.2025 19:01, Ross Lagerwall wrote:
>>> @@ -1328,10 +1327,15 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
>>>              status.rc = data->rc;
>>>  
>>>              name_len = strlen(data->name) + 1;
>>> -            list->name_total_size += name_len;
>>> -
>>>              metadata_len = data->metadata.len;
>>> -            list->metadata_total_size += metadata_len;
>>> +
>>> +            if ( (name_total_copied + name_len) > list->name_total_size ||
>>> +                 (metadata_total_copied + metadata_len) >
>>> +                 list->metadata_total_size )
>>> +            {
>>> +                rc = -ENOMEM;
>>
>> -ENOBUFS or maybe -ENOSPC, but certainly not -ENOMEM.
> 
> Jan, are you fine if I replace with -ENOBUFS on commit?

Yes.

Jan


