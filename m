Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A862E874BF2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689724.1074957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAg7-0008Oa-0T; Thu, 07 Mar 2024 10:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689724.1074957; Thu, 07 Mar 2024 10:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAg6-0008Mx-T9; Thu, 07 Mar 2024 10:08:42 +0000
Received: by outflank-mailman (input) for mailman id 689724;
 Thu, 07 Mar 2024 10:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riAg5-0008Mr-CE
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:08:41 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab2ec8bc-dc6a-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 11:08:39 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so332366666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 02:08:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wp1-20020a170907060100b00a44ce0671b1sm6025741ejb.108.2024.03.07.02.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 02:08:38 -0800 (PST)
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
X-Inumbo-ID: ab2ec8bc-dc6a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709806119; x=1710410919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jy4yY8qzffNwpBmB6TvO9ZBFkChaWm7czzs2MCLfRnI=;
        b=E7vpgZEt/buqeyDMtKPY18fO+j4s9so2RIdhS1xd9p/3ZEVc7+rXuZoQo86PIDET/F
         3ZLheJRtEZklGAlCZnFh0pG5qH2fO5dgRokVx1xR2AVv3XlWbCdhJNNyLeo2KBIqcM+d
         wOfiEyeEeVIzu5vrePT/Ov+HTghWnJ0sqU5Q3MU4TvA74sKOV+l4bWvhC0US/N7hJFeV
         UjVdoo/av0mH8N9K0HHiNUnxM80yEnmhSndRkHQmh6ZPHkLa8kvYZkIYpy4eezieJi/Z
         C1uMHi64MPq4+/kCt9eojEUVpdz7KDz2OmYcMW/ylFL+2gTaP4+oB3GB39HMkgnttXhy
         uA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709806119; x=1710410919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jy4yY8qzffNwpBmB6TvO9ZBFkChaWm7czzs2MCLfRnI=;
        b=hkR8Pp6D1XLQGzcwvHvm5FbOub1H//2c4K+1ZnmBPlekpROHfqVJOz5SnUs9iS6NSe
         x5ZjSDkgeNEZATsNAPDUbsCOcbpQFMF9VN9KkvRWcwhDrsEYFgPbG7ALANMRSGHtWFel
         plKqkhhjplOtyFbsn3roZvA/PtkDzIYaESNO+QFPIn+ycOA3oE9A55y4PIPKjZ2aTUkK
         DS9ncsJAHB7NnqoCRQUZrk7/WvPFere/jJry7cl/zB/lza56cddJdQFFR2V46xExYQRw
         TeoaIry7JCgeIsiRMZLTGrXZi/zPLMaGgWwzSxQj4DgXrC6qntr2Nv3C97atcbX3dMRg
         WLmA==
X-Gm-Message-State: AOJu0Yx7slteStuS1TvJe1zCKGfA74FqBtako98CaryFhQIXx5gN33Xh
	EktcOs62yZuwDujqwfoEVjcFk98UFwJaE/2QHWSduW4GMdLUPSldLWH7YRikuw==
X-Google-Smtp-Source: AGHT+IGx5v/S6Rg5mrHSdNUfi3/pV9V/H/8NiW756G0g+UfkTPLRNhCjGLrUcmdgvR7a/943LfqlDw==
X-Received: by 2002:a17:906:894:b0:a43:acbd:db59 with SMTP id n20-20020a170906089400b00a43acbddb59mr941806eje.3.1709806118795;
        Thu, 07 Mar 2024 02:08:38 -0800 (PST)
Message-ID: <f6cbaf67-f5c7-4947-a07a-0f1d8f693462@suse.com>
Date: Thu, 7 Mar 2024 11:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86/pvh: Support relocating dom0 kernel
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <ZemQS-8a_a5pwzf-@macbook>
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
In-Reply-To: <ZemQS-8a_a5pwzf-@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 11:00, Roger Pau Monné wrote:
> On Wed, Mar 06, 2024 at 01:50:29PM -0500, Jason Andryuk wrote:
>> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
>> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
>> it can be configured.
>>
>> Unfortunately there exist firmwares that have reserved regions at this
>> address, so Xen fails to load the dom0 kernel since it's not RAM.
>>
>> The other issue is that the Linux PVH entry point is not
>> position-independent.  It expects to run at the compiled
>> CONFIG_PHYSICAL_ADDRESS.
>>
>> This patch set expands the PVH dom0 builder to try to relocate the
>> kernel if needed and possible.  XENFEAT_pvh_relocatable is added for
>> kernels to indicate they are relocatable.  However, we may want to
>> switch to an additional ELF note with the kernel alignment.  Linux
>> specifies a kernel alignment in the bzImage boot_params.setup_header,
>> but that is not present the ELF vmlinux file.
> 
> I wonder whether we need a pair of notes, to signal the min/max
> addresses the kernel supports being relocated to.

Plus, as per your other reply, a 3rd one to specify alignment needs.

Then again - a single note can have multiple values. So perhaps it
doesn't need to be more than one new notes (except if dealing with
multi-value ones is deemed too complicated).

Jan

