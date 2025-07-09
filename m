Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3DAFDF3F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037645.1410196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNOU-0001aq-7Q; Wed, 09 Jul 2025 05:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037645.1410196; Wed, 09 Jul 2025 05:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNOU-0001ZP-4h; Wed, 09 Jul 2025 05:30:58 +0000
Received: by outflank-mailman (input) for mailman id 1037645;
 Wed, 09 Jul 2025 05:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZNOS-0001ZH-Uv
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:30:56 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a6ec9a-5c85-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 07:30:55 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so4848328f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 22:30:55 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2be:e417:6234:73d2:3c23?
 (p200300cab711f2bee417623473d23c23.dip0.t-ipconnect.de.
 [2003:ca:b711:f2be:e417:6234:73d2:3c23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285c9f9sm14939926f8f.93.2025.07.08.22.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 22:30:54 -0700 (PDT)
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
X-Inumbo-ID: e2a6ec9a-5c85-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752039055; x=1752643855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fOF1L/vQ4BGZPDq/a9LqMhjFQOQWLvWIe0bLpTpYGGg=;
        b=IQ0+6nFI0fu1zbrr3igODCjz0dFCF1Ae/r1JI6izAYZFfgy67w/QLsMi/zO7jx3hez
         rFzsmm+ly1RS5JpgjWm3kmRCYzn/Re4RBR5qM7WgUCZ6beN5PlRulDkYnjYCQ1USpIMx
         S2DT/D1JnccHaGaFC5tT8swwo4eZFylAhFzN6YU+oJrHVuPRKjF/XhXm4w9s9LtM7TAo
         6BjJNKONKTpHbGtRO+m1SSkFpaAXJnOtANt9OFfSOM9A2fuDKCNBZp3YLoAE9sJ2iwIA
         +PJSIU5JKvSNBeR/Lt8qv/BkgxIto/xUwl+l1EMbOddfIH7aox2kLYRJgzamiBjo1Lqe
         6IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752039055; x=1752643855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOF1L/vQ4BGZPDq/a9LqMhjFQOQWLvWIe0bLpTpYGGg=;
        b=hYimEN3+Duub/f29nlJ4xaPNcI7JEwk7SLrdibMl9pR8+R9I004nfTJufyx0LdyHOk
         BhpM46mIACCI7pAX7a3aqqpCgdicBxN8kHMmhUrAUxPudPJ7AHM/UkhUkXsrQPDYVvkN
         i9TC+5EGD9QiWD5hJRVPENvBEjjjeLSrgWxErzS2IMx8HAcYzdQFwZX0u7dmGL/qTGI9
         s8bKiuAq3bWkPMwlqE6Ik7ieH0wqEyxY4STZ6U1RolXcL3o+t6sl0vRORtq1AOsVHKJE
         UxfcW5wzpR/LiUa3nqPtCC+D8x/pcrF+3bQGsmCB5RbDcFvaIfxCaa4pdevebQsBgdsS
         nQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzYkMeBm13/7NADLFf39VOdMkyATmmas5OHN693X5PD5PhjFsCT6Ow+4Lfkt+6bJQ8ZhsIxn+iUis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDfYNmmFDc6uDE7lGT+K9BbbagnGRgPbA/q7jjDSLlAsPn4WLG
	/wl1MPAG3Kb1dI3iwHe2w5y9anvgXdoZihq/k7JLEhDiqdseHeeJkdl1sYp/hxXJyQ==
X-Gm-Gg: ASbGncvu0qv5i/SeoDi6VVsyIMzDV8cqJDR06XRbpF7xpA9fk66F04N5EWhY0YZgWvm
	drqQ4hTcrrFOo2RU+VTbUr9GnxKgzmFgKwwZmH0/eLmU3MAmEog1Dh1gQ6CKnV1btTgBukNasHS
	Q9V2pBbUXhEsKmy4oqK4l0J3dzi3U6ypovcL9p9Y4Z51kJ37pehIMPxBb0sTWkQbpaTaX1djE3m
	gHSb5OIJVTtMaEAEjfO7g+nN98GlqkUUcCfF9q5MF0EGOGKe6W4u6D6RJLuWp0hFM3DkhyGaQFU
	N6WpM8HnOPDBmLQ8VHw/PuYu/KcNoeK7Dj4BUpgH8l3rQ9pAb8QF4ighC3KAfL76ZIy3Gl6lHrA
	ctxyqckl1HzkZxWhBv4ijWM9ynmnvsDUXArbsxrOrgx9qcrtHDWLvTG8NOk002dJ7eUjPjM5+nj
	2P7IC8+PdkAdbzen45E9cTVnCgMRn6UK8=
X-Google-Smtp-Source: AGHT+IGXr216DNlBwSI/gAvoBfUAPLVjDrqS2zAKscAJT27Ve0BSK0rk/15I7v0JOPkY4ssP4loqPA==
X-Received: by 2002:a5d:5e8c:0:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3b5e44e5f15mr574513f8f.17.1752039054580;
        Tue, 08 Jul 2025 22:30:54 -0700 (PDT)
Message-ID: <e425e0f6-a222-49b9-a74d-1b5bd43d5378@suse.com>
Date: Wed, 9 Jul 2025 07:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
 <662366f6-7442-4b36-81a6-90ddcad6e59d@suse.com> <aG1Tx5dYcOw8X7uw@mail-itl>
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
In-Reply-To: <aG1Tx5dYcOw8X7uw@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2025 19:22, Marek Marczykowski-Górecki wrote:
> On Tue, Jul 08, 2025 at 05:41:07PM +0200, Jan Beulich wrote:
>> On 08.07.2025 15:56, Frediano Ziglio wrote:
>>> EFI code path split options from EFI LoadOptions fields in 2
>>> pieces, first EFI options, second Xen options.
>>> "get_argv" function is called first to get the number of arguments
>>> in the LoadOptions, second, after allocating enough space, to
>>> fill some "argc"/"argv" variable. However the first parsing could
>>> be different from second as second is able to detect "--" argument
>>> separator. So it was possible that "argc" was bigger that the "argv"
>>> array leading to potential buffer overflows, in particular
>>> a string like "-- a b c" would lead to buffer overflow in "argv"
>>> resulting in crashes.
>>> Using EFI shell is possible to pass any kind of string in
>>> LoadOptions.
>>>
>>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>>
>> Have you convinced yourself that your change isn't a workaround for a
>> bug elsewhere? You said you repro-ed with grub's chainloader, but that
>> doesn't imply things are being got correct there. I can certainly
>> accept that I may have screwed up back then. But I'd like to understand
>> what the mistake was, and so far I don't see any. As before, being
>> passed just "-- a b c" looks like a bug in the code generating the
>> command line.
> 
> Even if that's invalid command line (is it? what if you want to pass
> only options to dom0, but not to xen itself?), it shouldn't result in a
> crash but in an error message.

This command line as written by the user isn't invalid. But what it is
transformed to when passed to the image entry point is bogus, at least
according to my understanding. It's not the user after all who should
add the image name as first component. The image name being first is
a very conventional thing in argc/argv land (which includes plain
command lines like in the Windows world, which in turn is what I
understand EFI derived from), after all, so it being like that may not
even need explicitly spelling out anywhere.

Jan

