Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJtGEZ4DvGmurAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 15:09:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6292CC6E0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 15:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257263.1551696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3E3i-0002Tc-PF; Thu, 19 Mar 2026 14:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257263.1551696; Thu, 19 Mar 2026 14:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3E3i-0002Qx-MX; Thu, 19 Mar 2026 14:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1257263;
 Thu, 19 Mar 2026 14:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3E3i-0002Qr-8V
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 14:09:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3191f20f-239d-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 15:09:07 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4853fd7b59aso3781975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 07:09:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c4aa85sm54896415e9.12.2026.03.19.07.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 07:09:06 -0700 (PDT)
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
X-Inumbo-ID: 3191f20f-239d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773929347; x=1774534147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CthU106pZlXze4oqdAJUd+ebZ5CAgmWFoiAQeFPe5pY=;
        b=W0VzGYfs/mV7kffrGzLVa74LSevVTJnfgH+I5696xxyGcUAQdhoFdJf6HZRRZBxmLu
         IB/frioGOwhUv65+5xjntn8Mlw/wSbb3Mr4QoeIFLDMxtmPLHSix7x+5EILtqVLgoQ96
         VYjrz1gJKPpuZ7umwMtu0P6LGJdfyPp6rR92YJzw2w/MZoBXpb66B73wksoQpLqbQJAq
         d3muP+TeM/uHt9/YFjUK+nr6eYJ1d8bEOXWxzeFxybb8jhuWd5TztaB/L3vY/24rL9jS
         xjgwBSa151ObxPMj1O5k4zi3nfnQ66zs3DBrLB5rFUI1LVSwzm2VEYR8Dy3J8IkC5T12
         B2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929347; x=1774534147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CthU106pZlXze4oqdAJUd+ebZ5CAgmWFoiAQeFPe5pY=;
        b=UDAtuGKTnQsOk2BaoopX+Xh8PxrYGK+wV5SM2/87uK7DlwpNptR3AJVOL7v/5ULiGG
         buqWXLvTvgyk0D8m8ZQ1ZHx/bbGLro4m3XGbBeLwCvy9tlxb9qFJTywZ+XMU2h3b9nZt
         VkG8O0y4LtkPAbcEKfPkllHWgBZZ9zhQRvGocPf6o0dr+8rhqjmAaPsF0JnfS9XNLg7v
         /FMIP5iedA3lMiq7lnrJVws/4Ud/biuNWE+6xRvyypmaTtKpJl+hlnRSNeyHjsMxbDsH
         b3w/ptNoobulhrWv+nWN0V1pzj4MIaiF8nIRH0YMSBdbHjqwaRxeVls9lFUZmTX0mDed
         PlnA==
X-Forwarded-Encrypted: i=1; AJvYcCWvyx79ekbLyZcViWZhMPr0CrbSqanUmIbORq91/QNTpE0/h+j6wq0reaFY791QYVITYaXwA1ZiOc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ99bvXzuefXwWtuR0uQkiEEJGQDO5wmPCb2oYnq/Abnm0hfZk
	fbcOCdp7lkt0Ds/5id3vWY+utvAzN5/IVAS1emgnPqg21T1cJ5yNS0ZKGUhy1PvJGw==
X-Gm-Gg: ATEYQzxYS8Fe3mY4Yj2K28yYnqNnISUSKw1TefKLc1ET98VMYOpxAfQ6JqnYSI2RdAD
	NpR+qDF1IK4Gb+jHyl6mLQrYRPHhAHauct4HGxwlJn4gV6wL673Wl0rD0uWyc0fAdqQ7A5IQm+v
	x8VTvVcsDFz3sIoKJQ/ygMki1OuksBnublrq6GvFPQv4KHz8XKE4Vga4Sm/eyGzkXk9KAJUA9QO
	7Fwp0DD9duzOpNIMFIyL0AkTU+q0TMksudEnVEE+0//y6chnQGbx8RKc4kI97154n5prRm01i+0
	1ii+eJmdHH1ZoUCnVQpWo9EA7O9bf6FDLPjrfqBfkJwqsu9+b3YzVZpQl5J/BRgcwltTCLHa6Fu
	+4f75JK4ZQO+n1RCBiFZ4i+gvKUWSOLZbzOYD4ecvzsJo4RUgwTr9llbStoVaYKSaRmN3RONdUH
	ZDvXdiZPQhRU2oW3fiL3JsF/yBW2sYwckIDsMX8kRRQIahYxstO8X1CdW1+Vk6R8nEtuFL7elgB
	SpebTuRgrQAW98=
X-Received: by 2002:a05:600c:8486:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-486f445e320mr114469555e9.25.1773929346836;
        Thu, 19 Mar 2026 07:09:06 -0700 (PDT)
Message-ID: <0e2ce96e-b30d-48b4-965b-0880ff26b4d9@suse.com>
Date: Thu, 19 Mar 2026 15:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] install.sh: Preserve directory symlinks
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313172456.871518-1-thierry.escande@vates.tech>
 <7ee208c4-1f83-4bec-86db-bae22bd2040c@suse.com>
 <3bc905c5-a0e5-4ca0-96f4-eb6bb73b2361@vates.tech>
 <929c9e0e-c465-447d-ba65-30053051a88e@suse.com>
 <79295381-5d8a-4f78-95d2-fd67da25ccb2@vates.tech>
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
In-Reply-To: <79295381-5d8a-4f78-95d2-fd67da25ccb2@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9B6292CC6E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 14:59, Thierry Escande wrote:
> On 3/19/26 14:48, Jan Beulich wrote:
>> On 19.03.2026 14:26, Thierry Escande wrote:
>>> On 3/19/26 10:31, Jan Beulich wrote:
>>>> On 13.03.2026 18:25, Thierry Escande wrote:
>>>>> In various distros (i.e. Debian) some folders like /lib or /var/run are
>>>>> symlinks. Using the tar option --keep-directory-symlink preserves these
>>>>> symlinks.
>>>>>
>>>>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>>>>> ---
>>>>>  install.sh | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/install.sh b/install.sh
>>>>> index 3e11c4d46f..5d0b7a4933 100644
>>>>> --- a/install.sh
>>>>> +++ b/install.sh
>>>>> @@ -27,7 +27,7 @@ tmp="`mktemp -d`"
>>>>>  echo "Installing Xen from '$src' to '$dst'..."
>>>>>  (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
>>>>>  
>>>>> -(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
>>>>> +(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -
>>>>
>>>> How compatible (between flavors of tar as well as between versions of GNU
>>>> tar) is use of this option?
>>>
>>> It's supported by GNU tar since version 1.27 (from ~12 years ago) but it
>>> seems to be the only implementation that supports it. BSD and busybox
>>> don't support it. I didn't check for other implementations.
>>>
>>> I can add a flavor/version check if that makes sense.
>>
>> Possibly. One question then is what the behavior was prior to that option
>> having been introduced.
> 
> From the patch at [1] introducing the option, and more precisely the
> test done at [2], directory symlinks were simply overwritten.

Which makes it hard to suggest useful behavior when the option is unavailable:
Simply refusing to install isn't nice, but corrupting the installation is
perhaps even worse.

I take it that the (presumably) more standard -h doesn't help here?

Jan

> [1]
> https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=2c06a80918019471876956eef4ef22f05c9e0571
> [2]
> https://cgit.git.savannah.gnu.org/cgit/tar.git/tree/src/extract.c?id=2c06a80918019471876956eef4ef22f05c9e0571#n934
> 
> Regards,
> Thierry
> 
> 
> --
> Thierry Escande | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 


