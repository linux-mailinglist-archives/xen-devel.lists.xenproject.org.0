Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC4B0EACD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053289.1422033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTCx-0005Ti-Ag; Wed, 23 Jul 2025 06:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053289.1422033; Wed, 23 Jul 2025 06:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTCx-0005Qy-7Z; Wed, 23 Jul 2025 06:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1053289;
 Wed, 23 Jul 2025 06:44:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueTCv-0005OU-PB
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:44:05 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c828832-6790-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 08:44:04 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so305741f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 23:44:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b60eb0csm89586585ad.58.2025.07.22.23.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:44:03 -0700 (PDT)
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
X-Inumbo-ID: 6c828832-6790-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753253044; x=1753857844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DKACq5oz+u58vEjdJPs2pe2I9Uol5IbMUi4LjEkDBC8=;
        b=R3tQIn4lRPqNXWd7wYWmg+zQYsFX51Nxkki8nX7EDGcgf1oyw1VkeZWGq+qDr39dLc
         oDkWpA2vs/u6pkVsj3yIwhGdwTt5e0BkgeA+CZruSUb3wXLFtl56tY03mVvbR97dk+ax
         FNoCbowUmF9joBv/WygCCTe2+A3qEhtNSogzuy9K5uRBcKTje1K8c/YqVNiPr7knPrzM
         07bFHdTo7LHrbBkqdaEn23/ZZOj+7Blf/AJ0147i4INa5gVn9gw8RppWZ9rLE15987Sh
         vOa6fNor4jwcGGhXuslmTjx0NoulkUa3YRbh40tHGAxRHcI2idLzQC9lRci5M8vZCiI2
         o4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753253044; x=1753857844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKACq5oz+u58vEjdJPs2pe2I9Uol5IbMUi4LjEkDBC8=;
        b=OudjrjmUeeqv48npwEbamo3VvjkaV5cQ3KonePRheqsa/2B6+P6foDMSWxQq24JtSE
         0dV6Am8yfMsBB8s4GEN+Hvb12FESq6hBAwpB2Uj/CwoOKKa+2UQUkhA9QcqhBFOYjQAF
         nZ9spQrf4SbKLDZL9CbrclECj5v+O9xvTxIaL5TDHDdw+BC1sSx18czOLK++EImOkUMg
         oPpUJwmVFPnfw+HbkqXj3rZeTOXKiIg31G3SyYedAKMy7t2gZKRsR7S/IexUN5nDvcGo
         /O38Lli+P1xAbC21A7vYbp7/ZF/0kSZfM2OYQa+AWTZtbGE2/S5eaTo6CxKvA6xdYeck
         wMCw==
X-Forwarded-Encrypted: i=1; AJvYcCUT0QgEF3fg+HXpl1hVIwAefsgLv/93hpPUzVFel2/pDqmzRgbP2yA1ATcjko/jnwYPqnUbXQGXhXo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1a9RjGeZlBW5xf2Ow3TQasTIY8YLsfS38TZ0cF45f9lfbpge8
	kXxPjkezChMDIgKlSk2aV8pkB8MBFEnEEWYGstLSpFVPo5bo01SVVYmMb991CTA1Sw==
X-Gm-Gg: ASbGnct5O9x+vDwjNzDBnGGLwsZ/LR9zEgMR1vkEEtFSMvJ35tG24PVKO6qCWies0t5
	j6tAkjorYIqHOpbabZ8bIwQU3fbE/hj7ujhKiHLdeaGyuHp/ArlVJzjDMpjV+Ou/SwOc2PyPIuW
	J+MORp+Sq2Yw1JL+C9NX1brR+LKtCGMXclT560SIDmISX8te+iFkFMFO1dMo8SsqVRdU91Xu479
	zvx9o+iiFTar0DjmYCvbb/REkr4n6Q7ZsAD9KDsBtGL1Ls6oX3eriTs5I6LDk0ZW5OQmpiC7Swi
	kD8hz8H/OB41cLF8lb6YnP97guVkTtzpoGiCimkTrJLFy0hW1DeSpAFajmmIrQd302UmfTnnoxP
	xVineu5K5DAuaixFHbS8gFSmML8UA97hPt+pZHokiGl4Wi1942ju0XBI5Vw4ienbSNFmgIcpYSH
	jB4AQmaNE=
X-Google-Smtp-Source: AGHT+IH4Dl0969fgyVJn6rhYG2DysQHc8ZVZIs/eY2e6tw8nknRw6NcBZ/VbuLJA2WKBeH9niNsI2w==
X-Received: by 2002:a5d:5f8a:0:b0:3b6:cdd:a41f with SMTP id ffacd0b85a97d-3b7634856bdmr4100228f8f.4.1753253043588;
        Tue, 22 Jul 2025 23:44:03 -0700 (PDT)
Message-ID: <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
Date: Wed, 23 Jul 2025 08:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
 <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
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
In-Reply-To: <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 08:34, Jürgen Groß wrote:
> On 23.07.25 08:28, Jan Beulich wrote:
>> On 22.07.2025 02:19, Jason Andryuk wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -195,6 +195,14 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>>           info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>>       if ( d->is_dying == DOMDYING_dead )
>>>           info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
>>> +
>>> +    info->caps = 0;
>>> +    if ( is_control_domain(d) )
>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL;
>>> +    if ( is_hardware_domain(d) )
>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE;
>>> +    if ( is_xenstore_domain(d) )
>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE;
>>>       info->unique_id = d->unique_id;
>>>   }
>>
>> This being a stable sub-op, don't we need a way to indicate to the caller
>> _that_ this field has valid data now? When non-zero it's easy to tell, but
>> getting back zero is ambiguous.
> 
> The hypercall sub-op was introduced in this development cycle only, so
> there is no released Xen hypervisor without the capability setting.
> 
> In case this patch doesn't make it into 4.21, the case you are mentioning
> must be handled, of course.

Hmm, yes, this way it's on the edge. As a stable sub-op, someone could have
backported the change, though. IOW (and in general) I wonder whether for
stable sub-ops we shouldn't be pretty strict about functional extensions,
not tying their addition to releases at all.

Jan

