Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D567B3B8A0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 12:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101080.1454281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwEd-0004RO-S5; Fri, 29 Aug 2025 10:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101080.1454281; Fri, 29 Aug 2025 10:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwEd-0004Ot-PG; Fri, 29 Aug 2025 10:21:31 +0000
Received: by outflank-mailman (input) for mailman id 1101080;
 Fri, 29 Aug 2025 10:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urwEc-0004NE-BW
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 10:21:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecd7e1be-84c1-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 12:21:28 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so306483366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 03:21:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefc7ee972sm172636666b.1.2025.08.29.03.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 03:21:27 -0700 (PDT)
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
X-Inumbo-ID: ecd7e1be-84c1-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756462888; x=1757067688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3q87eWkgYhUKezb9YhLhAMj9qJDk07aaKZMNtfy04QE=;
        b=dHtAYAiF3VU8wmH1gwAWkFkToH4Hb9xoRAEAWVbvjaAvsmLLIg53gJ3u0YcyRRFfIs
         wF05ytpe5nH2DOHV5Wx1ba9tbHFczz6e8eiN2DoXPkhUm1lUfTIzmezac9BYSdMUGwPm
         zEQKLVhn3n6QDprqwFmbeQeYxWd2HPfsoVCghzm9n5lD8CeY2xLFLn1zLq0z79RKgVll
         Mw716k7nHRslaszNVBB5uvKwsMg4woOBMOfp45OkNtnuDTlC6mNqL3UdBCzvGuy1h2GB
         ksJp8/RbUXAs5Bk8xZNmP/iefVOPSFz71dCJqOuYcdalowGyvwZIeGM/k/s71izYF3po
         f8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462888; x=1757067688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3q87eWkgYhUKezb9YhLhAMj9qJDk07aaKZMNtfy04QE=;
        b=JDz5HV1Sqkvghyoj9JvKXtx6AymXgvLIZ6qY72WIE+SJuWL7XJAMXuhYWjni3su09w
         RGF9hCTyCxesf87MrCYTBimM5RaK94jaJHcmAYOtBcnwaDQjHYuw94BtqF5wYqkYyhd8
         JIzSfKQ3iOIwpGYkaIX3waIw9rUbReVwwN9tHgnWmwocTJ/y6CwdHbq/zAH5PcPoZ8OO
         bFRzprooGyh/sthlTxugUmC6TKIgTi5xi1FlB6YlBNP4EsVFeLh7mM/8lUwx1b2NVFPV
         xc/ypq3GNfy/Juh4OdihOyTW0nhR9zCSEIRBsR84FIFc5ExlXfj8FH9TGEEHvAIDU7B/
         0pMA==
X-Forwarded-Encrypted: i=1; AJvYcCWHH5EUgt1UcmTKjmFso4qnDpcrwJpKR76+yJB+sOw0cekPfeei0EGU/BDlBDTEYAbsFTTzMDLigtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHiQ5pm6eorYp1vTqPFgRyrtiogYm8qXdeS9jDvDkluIwDQ+7j
	lWA6mnIm7DaZ8Za+kadqUgpB66ezaZFL1IPeDutTnqDaMo/Ji5MZjX9Tz7/1wcCTAA==
X-Gm-Gg: ASbGnctjztFyzYzfWWSbmfZZz52LBOFc3nzJ7Ywrb2GNo3JYsVRLgeAcr4taeoIVBff
	Cm2dH3QJ/KQ/ITwqGOMUaGjoUd5TJgWBHo5sluRXIFRF2TRwwsPHY2pc10Ji8eO7NDAn3+Kt3Ne
	kjdphvsoG9X51JgSgrCoeAOEruUkROoftstEp50MGJNHweZC5xIcLImtnX7Km3Ovd9ajroJLqzv
	JC7B/vkJez/DPNrgiC0dAoXey/sHOSTE5z1y6PYKO+ewUjVIuFa546sGOaMS6+/UxV9e8EeLnk7
	uZhrtGW/t1wHvl0zjbJBoC3qbROhhDCISEz3QP2oX0LJUEbthSzqejB3GAW6K1M41AlEzUggbVZ
	DTwZB6YpDNCzErxhCGNyJkzGI0xFw3cn7r3qMzz7EQbndLr1kBawx8w6m8+lQauLdQNUs4NiDEh
	T4dCQdx/4=
X-Google-Smtp-Source: AGHT+IG3m9oq51SPQMkrp0f1KbE8uy8DtJT0VF9DRKEOUrDJWIGrXJb+hzGvVdiPByfa1c3SHleySg==
X-Received: by 2002:a17:907:849:b0:afe:74f1:dbf2 with SMTP id a640c23a62f3a-afe74f1df73mr1837509266b.30.1756462888085;
        Fri, 29 Aug 2025 03:21:28 -0700 (PDT)
Message-ID: <77299b94-43cd-4d55-891a-8e1209b4b669@suse.com>
Date: Fri, 29 Aug 2025 12:21:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pvshim: disable PDX compression in PV shim defconfig
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250829075154.48787-1-roger.pau@citrix.com>
 <e11d81c9-cb3b-4838-b25d-50545deba64b@suse.com> <aLFrLxdcb2nIkim6@Mac.lan>
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
In-Reply-To: <aLFrLxdcb2nIkim6@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 10:56, Roger Pau Monné wrote:
> On Fri, Aug 29, 2025 at 10:10:59AM +0200, Jan Beulich wrote:
>> On 29.08.2025 09:51, Roger Pau Monne wrote:
>>> There's no need for PDX compression given the memory map provided by Xen
>>> to guests is contiguous, turn off the feature by default in the PV shim
>>> defconfig.
>>>
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Fixes: c5c45bcbd6a1 ('pdx: introduce a new compression algorithm based on region offsets')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Not sure if a Fixes: tag is really appropriate here. The shim is working as
>> is, just carrying code which won't ever be used.
> 
> I was borderline also, but I felt it was important to notice that the
> change here should ideally had been part of that commit.  Do you have
> a recommendation of any other tag I could use for that purpose?

In rare cases I think I've used Amends: (not formally mentioned anywhere,
of course).

Jan

