Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BEB996EC5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814717.1228334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY4A-0005DC-SW; Wed, 09 Oct 2024 14:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814717.1228334; Wed, 09 Oct 2024 14:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY4A-0005BP-PM; Wed, 09 Oct 2024 14:53:30 +0000
Received: by outflank-mailman (input) for mailman id 814717;
 Wed, 09 Oct 2024 14:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syY49-00058O-RM
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:53:29 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dcd7571-864e-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:53:27 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c91a7141b8so1507189a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:53:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994205dc60sm575767566b.87.2024.10.09.07.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:53:26 -0700 (PDT)
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
X-Inumbo-ID: 3dcd7571-864e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728485607; x=1729090407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9P1cDNBQclLOGOZUk43Glw+KrzAlUg5+fRnWA9w6CVw=;
        b=WJD9TW1juab3zgSaMEtmpvJBT3iBxP0zL1dLSbka6bsM7SaJmjQzV2LvM4JlcYBSNj
         uEeqtVF0TNfiztAH9nB7G0n9x/qqXEhB3stF2BUSAtH4MzHEqJa3tcecu2ZbfHwoFOK/
         rKHMnRp4a1FeokmgyXxPoFNZVUctZwvls+YGB4LobWcQ9+bp1tCUEHxiv9UL5TlUEeS0
         a9nvMvl2dgym3jaVRwwRTkFUYyfFF21XljkfgDF2WYdM337GO3YFwkZEwjMOyPBvS0FF
         s3EIIkBZUgQenrdtSt22ilh7lqZZmyhkqrudO98BEYUwIyONCgt1CW6pcnmfkyClGig6
         PE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728485607; x=1729090407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P1cDNBQclLOGOZUk43Glw+KrzAlUg5+fRnWA9w6CVw=;
        b=iChXNCP++MvJ5KOHIJ/+6mFZlc6VyQnZi4ZNDA/n1NET0C4xf8K+2+LB7nRqSo469O
         uJapeRgTpZBJFxGne0IS78aazqypFiZgiO3wwcaSsMyPW2tbmVbGB6Mf2QO4BxfM6+/6
         DNLEMNLlPMsz5Z1EvyGYeFeBY+Ll/rzkppbHuWZBwaJsd/kdPMakb4YSlRQGJpwecsp0
         zzuyuM+azFXRAgzo7zyuXVjyF5oHWZqIMbSGHVXRbrbQDVABzejAeG1xuvgFUCs4n+vy
         2uznFQr2NyO1ueVhhQ53VFC4Y6HZL0K89TrEZmbkmdRxi22wTFI1tHLR23wQK+TOD2xM
         n42A==
X-Forwarded-Encrypted: i=1; AJvYcCVIESsV+vKM8CB5OEhHVo4bqRQ4uHWJE2OZwMEbA3glOEtKSnSXP7U7+1x7gjQ7mpsbWA5hxZt9swU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVC+4LntqdHIEZ7+VAv2EWLgDcnYfryeNhT2YqMFew3goaK1GE
	5jPKiVznMF3Sp2WvvROX0dJkJ+3ydmwQ+bYF7K01XXInlGFt84SHnVBgUiN04g==
X-Google-Smtp-Source: AGHT+IEtiNwi8Z+QHFvE3tGWU2rQCuElh2e19o9OwH2pAJmsl3fu4sTN8xxRFykwxW6z0bZL+vWPiw==
X-Received: by 2002:a17:907:c899:b0:a99:56e1:bd30 with SMTP id a640c23a62f3a-a998d313b3amr249260466b.42.1728485606892;
        Wed, 09 Oct 2024 07:53:26 -0700 (PDT)
Message-ID: <56fc2b5e-54c6-46df-a044-de6efcc427d4@suse.com>
Date: Wed, 9 Oct 2024 16:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/11] xen/x86: Derive topologically correct x2APIC IDs
 from the policy
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-10-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-10-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:38, Alejandro Vallejo wrote:
> Implements the helper for mapping vcpu_id to x2apic_id given a valid
> topology in a policy. The algo is written with the intention of
> extending it to leaves 0x1f and extended 0x26 in the future.
> 
> Toolstack doesn't set leaf 0xb and the HVM default policy has it
> cleared, so the leaf is not implemented. In that case, the new helper
> just returns the legacy mapping.

Is the first sentence of this latter paragraph missing an "If" or "When"
at the beginning? As written I'm afraid I can't really make sense of it.

Jan

