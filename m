Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1A84DAD9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 08:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678006.1055005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXz71-0007xB-Rd; Thu, 08 Feb 2024 07:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678006.1055005; Thu, 08 Feb 2024 07:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXz71-0007ty-OT; Thu, 08 Feb 2024 07:46:23 +0000
Received: by outflank-mailman (input) for mailman id 678006;
 Thu, 08 Feb 2024 07:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXz6z-0007tb-Ue
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 07:46:21 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25714793-c656-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 08:46:19 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b13332ca7so843713f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 23:46:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g2-20020adff3c2000000b00337d5cd0d8asm3013827wrp.90.2024.02.07.23.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 23:46:18 -0800 (PST)
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
X-Inumbo-ID: 25714793-c656-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707378379; x=1707983179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lE1cibqb+0alDvGvEMZl/lOukYeRYjy3aGf4NS6gOCA=;
        b=e+oRRfv8ebbjYco8ACQODap7UB+WiWNDWbJ01hMTUqaAkuCVJ/01dz0+mHANhzdbe1
         or7cynyXRHzboorQfmxDi7AAkLAKi9wAvUPgBC0pmmEzSBRtQG75dsV+Hyu131PaXVXR
         l4konenl6bHwGJl3y+M1XlXufcXVvCswJClf6uelai/RejfBxHl5ZbH8tE5au8CsDlJ1
         YE+6Top/eekDU4zljSNbcmiL1E/WT3OIm0jcQFd2UKNNVvGBfLUBLn6xUkIOpMoTrOO8
         K6AqvFiit6ONfKHKbK6uO1ONKf1e8IDnaTtoNYDbPuPxuIgo2wbc08MJBDieHX1Hw5SE
         DUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707378379; x=1707983179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lE1cibqb+0alDvGvEMZl/lOukYeRYjy3aGf4NS6gOCA=;
        b=PSr374XSFv3bCDXfhvNsd9//moZFBNHNRCBRQxm2rFSGE8D+DcP12r5kHcfbqcEOnI
         SpZ6sHNGWABdCoq8fIoNLbnDAaM8B8F9U21lwT6o0iVUbPa/WfC+4LTWjjgk/u7pXByE
         oLFugHNIWiT0InMtiRCGMIsvjYClMudrQXs09WIyUEStyvbt19zZPVWJW+ElVBAOajX5
         vjocTIQf2HhWjbBPSrWSEHvOCEZvoT0pdhC1EJwX3iLeat6aVMyi2J4ufvF40ZyVcWcC
         KN0s04pKMbY90SX1763eGoh/O7xHjTmwSvSw2BFJVGSsx1wlOtYmCfEiWgM4PUBTJIxO
         7Eng==
X-Gm-Message-State: AOJu0YwBbZIR5SwAfyk+d6uKFko8HjMC1mIFbbO7LzuSZhCyhOWrrMsm
	1oPTJNcGXDNdTacbSzR5XRISXeCNTpQ763eKRKCDnk2Ux4BbZ5RkVB5wi7FGBA==
X-Google-Smtp-Source: AGHT+IF/K2UjwB5v7Rv/7I96J9LGiCChvsd/FYlS54QQ9sXjUKN/wpjVreWYDMjM3oM1rJIaUDXiqw==
X-Received: by 2002:adf:f38e:0:b0:33b:5a6c:330e with SMTP id m14-20020adff38e000000b0033b5a6c330emr398490wro.2.1707378378831;
        Wed, 07 Feb 2024 23:46:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEKzWUJd3q/faJ3daOkQLt525PoRO9hdfc+IPNiPuAhT2Tdlnf7L5HiduShtsolxur4oy3hv/dNPBiu4wNtQnOHmvBY1fCdgbKbv06I4B/jp6x1N+UP1B7Ppwu4mO1+bylOvlFjUSx21fFfgdlGp9tKkYa9YLBofjPhwCGvI2goIdzBylz+sdrRtk0nvHwOQzdqE4id1zA1xgwBYkaSSgA4dKozTk2nenZCGabQXmiokbqKmOIycsqA8mpROpii3eZcVZ68BTwmmwWMokivV5hGs+R5OBoRs4bX7PZB7X2xNR7y68mra43
Message-ID: <156f2693-e178-4553-b4b4-f671b0221dfc@suse.com>
Date: Thu, 8 Feb 2024 08:46:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor
 ap2m->default_access
To: George Dunlap <george.dunlap@cloud.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
 <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
 <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com>
 <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
 <CA+zSX=Zou19sjb8ToLTaMjLHLYmqptsMXCT50Y9MwGykOaTrZQ@mail.gmail.com>
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
In-Reply-To: <CA+zSX=Zou19sjb8ToLTaMjLHLYmqptsMXCT50Y9MwGykOaTrZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 05:32, George Dunlap wrote:
> Er, ok, just one more comment: this could allow an altp2m to have more
> permissions than the host; for example, the host p2m entry could be
> p2m_access_r, but if the altp2m's default_access were p2m_access_rw,
> it would override that.  Is that the behavior we want?  Or do we want
> to do some sort of intersection of permissions?
> 
> If the former, I'd propose the comment be adjusted thus:
> 
>  * If the entry is invalid, and the host entry was valid, propagate
>  * the host's entry to the altp2m, retaining page order but using the
>  * altp2m's default_access, and indicate that the caller should re-try
>  * the faulting instruction.

I find it highly questionable that such blind overriding should be taking
place.

Jan

