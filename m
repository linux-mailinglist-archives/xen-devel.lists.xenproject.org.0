Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A974971ACC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794471.1203432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneL5-0004KM-BT; Mon, 09 Sep 2024 13:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794471.1203432; Mon, 09 Sep 2024 13:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneL5-0004In-8q; Mon, 09 Sep 2024 13:21:55 +0000
Received: by outflank-mailman (input) for mailman id 794471;
 Mon, 09 Sep 2024 13:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sneL3-0004Ib-W9
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:21:53 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a943c59-6eae-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 15:21:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so562127366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:21:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d259528ecsm342921866b.67.2024.09.09.06.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:21:52 -0700 (PDT)
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
X-Inumbo-ID: 7a943c59-6eae-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725888113; x=1726492913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iFqySlVM8WadJSCoLXEWDy3NBepbwZpNDJ2fbLzHvLs=;
        b=Fqv5IWBi+z3lRgXpfdvfXjj3zT2kQCOGKpdWMCP5IN49TEwbujrtDiKaJ7y+v2IN8k
         exxwlbUIzEqt8Nk3xtuM31MRsZ2O+Y/12k9W3kkMt6pYw9ryQCrACyciXYy17l5dtFIB
         KPCr8/edh8Wc5pkoHH/rpm/5JV16WVhhVx2amsGnS/D2ZwoVHUwiU6Ce2tBy3BROvFD5
         VllRZwq7NKukVDXiZGRpgDPLkOx7W6wGG8sVXZ/JI9AkVRxQgQn5MFGnz/NrgZwwEg86
         WDb/P4gC3iqN7BfOzxPlpBW/YQxOke50EobmBGNa7AKBbVsCHQdsnBCairxnAFSflouY
         iuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725888113; x=1726492913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFqySlVM8WadJSCoLXEWDy3NBepbwZpNDJ2fbLzHvLs=;
        b=e46VSDsGwZPFBY/Iesu9GPnX2qtkCjKAQyntx5k9rg/lGpMqyJs2oSIlYuqH5Rnu+E
         1ey/PzDULCEc8zantNTZ8HziuHofIqmTeGG7K4zArzB+5sCCBhQxvi++yQ5L8tYMkkR8
         dkg3GCdb6QDDLrfZ/01mkk4u/e5wfWi0fO/YULYi46UZEmaPLjtynpmvmh1qM25ZQd5c
         N4YVN/+S9LPu1TLYydoB1ycw30iaS3MK6RNIqmQc1S6CZ3+dqRXeGBNde+u4ZVuwTbZr
         riMFMvWIQysfRuuzWcBQMh6C0iBDZv8F2CVkwLkVMIe20dTvFByP2ZNl3lTDHcODYzAu
         ijSg==
X-Forwarded-Encrypted: i=1; AJvYcCWese6pehEG4fk2RYuw4vW0dD3zVSyhC3N1knczAtxlJL0MP/d1cUlDW6evupmFbBlIojjt8JeJ3N8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCogMa4k4AItawSb8RyaMMh8xabeIuqp5TFzU7wGbWcuppTuTs
	PGv1c6jxPNBaJRq16IC9p/AELxLw7k9Q0vEiDP1TStLvaCABR+AE8V/csEqfOQ==
X-Google-Smtp-Source: AGHT+IERDHl9wYbyOfck2dn443KyOyFwyRDwLoCGzhobzLPHL9dTcVde+PvxOga71+j3SBjkoZ7deg==
X-Received: by 2002:a17:907:3687:b0:a8a:78b3:a291 with SMTP id a640c23a62f3a-a8a885bfdd5mr989967866b.7.1725888112519;
        Mon, 09 Sep 2024 06:21:52 -0700 (PDT)
Message-ID: <ef183e7c-7775-42fb-b826-20d97bb0a3ba@suse.com>
Date: Mon, 9 Sep 2024 15:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: Unify PRI_gfn and PRI_mfn macros
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
References: <20240909131419.127276-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240909131419.127276-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 15:14, Frediano Ziglio wrote:
> @@ -4334,7 +4334,7 @@ static void gnttab_usage_print(struct domain *rd)
>          first = 0;
>  
>          /*      [0xXXX]  ddddd 0xXXXXX 0xXXXXXXXX      ddddd 0xXXXXXX 0xXX */
> -        printk("[0x%03x]  %5d 0x%"PRI_mfn" 0x%08x      %5d 0x%06"PRIx64" 0x%02x\n",
> +        printk("[0x%03x]  %5d %"PRI_mfn" 0x%08x      %5d 0x%06"PRIx64" 0x%02x\n",
>                 ref, act->domid, mfn_x(act->mfn), act->pin,
>                 sha->domid, frame, status);

Sadly this is where things break: The columnar view will no longer be retained
even on systems with memory only below 4Gb. I have to admit I'm not sure in how
far we can deem this acceptable.

Jan

