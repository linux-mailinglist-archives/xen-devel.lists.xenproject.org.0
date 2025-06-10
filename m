Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F547AD2E87
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 09:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010532.1388648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtJ4-0005Cp-Tu; Tue, 10 Jun 2025 07:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010532.1388648; Tue, 10 Jun 2025 07:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtJ4-0005A4-Ql; Tue, 10 Jun 2025 07:22:02 +0000
Received: by outflank-mailman (input) for mailman id 1010532;
 Tue, 10 Jun 2025 07:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOtJ2-00059y-S7
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 07:22:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f7e5653-45cb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 09:21:44 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4530921461aso17457035e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 00:21:50 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e055d2asm130494025e9.2.2025.06.10.00.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:21:49 -0700 (PDT)
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
X-Inumbo-ID: 8f7e5653-45cb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749540110; x=1750144910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dF4qeiSKDT2LrxQnWuh/h6J4KwRcj8Nih2XAVbl6g2A=;
        b=f3SOpypHVqeM0JHomDmbuwySSvbAL03bG53Jg8jG/Io4H/+2wrvgiFusc/8hWkZdxw
         jbwUuJXSQBwQK62of9X1BkxduDZblLolR5i22I8ovB98+z4AjkI3z4Rmcpb7ptCAxsGW
         3IDnzrsTZdKImE/hstCUHnacV8kMsMlZPwtC6xi7lCDENFIdPQcirHn1QHIByVhtchya
         w+Borb8/S9xqN76+a7qjcAs596KfJdp1RkOmvBajwzbLKnHHMCn8bw9fp2j2o3xWYnEU
         g1gSCtFSEWYnOChjFxSD/X97eVF09qFFKfYWTPfYc2/NIsxA+KFipYD+hf9kJN5ibpVq
         9WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540110; x=1750144910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4qeiSKDT2LrxQnWuh/h6J4KwRcj8Nih2XAVbl6g2A=;
        b=H4RBdd4Gyywz+isxPYKN+fDufAJaDR+UUVmLLEID6LwhtrjmVoqdc3NSXKdo1dnTy1
         qhaG0o59qrkq6V4cLrzVztmYp91yCstdrNygG/jilCVU+mBXZXHzeQtI+Fj0XDoVbxnU
         k2L1hAy+I6wbeLx7quPEGWPn8EpWoZ1D3lmWXTB8mZMb0jDiBzN4Cz6lu6k42r8CX6qd
         AzygD5ZK7q5TQIIQIep57CIIXSTrUnhg9MwTVCz1tXozXGDFVYrbRAkpKOdNYGaRQiTm
         Bh9HjJ3oxfvepNb6OQU71JOaUtsKmzZsECQuMveaWIfg8unO2UuW3g6LnN1yfKBS79AS
         YE9w==
X-Gm-Message-State: AOJu0Yyh6SKJYk0WwKbKbA/Hlz+TMIIxLnhDNGmpKn/pvBeNTeeDQfe5
	ONP/92PcxYg9vmNP6PaqEq386ntqAgCKNzkv/iy4TfKtUUfGgyA2CcY5UvK00D+Y4A==
X-Gm-Gg: ASbGnctzG49r1Pr8k1Q39fU61x+qcKULTtINUg5WPmqGU0c4QeydjOxQbal9MaozG6Z
	CpI5H7SAySwEF6w3nXcucW/3hWgCmfzq8Ftwe2bwgowUe5KSr5UaDkWkwaWz/HxvJxgyjBzR91h
	K/9HGctxebxp3olsZ3Cf3YNCdLvY6HHMft5XKCtgNv3ERJjXpII5Xlvzz+b7pdadXYlLVVx3fNt
	7RrsX23FzI+C0SPGSN/r5W4RVlIMxK0Vz6lgQj0l05t+Mh7jPvQ62c8f4WVlW3Ot+z3VCnL4mld
	eGEJCiBoESZdTMOPKfxlOpB6RtwAaKPkHymMkKNXuReUnPUVEdOJhhjav4v5y6r8FpTfmrwcjD9
	VtolJ4DSdvYQAuNJca7e1SgmF4SDDAnm/lN/YOyCseypqe4rvGGRwPziVE1Qyvt0Sf7pT1miFua
	H/c8RnONY9GJ7Rs3OAPww6
X-Google-Smtp-Source: AGHT+IHaWCC74IuCPGl8z1fMX9Vgvt8ppW13eeYx9ACp+uzz8Y23A9CkLjZgRqAVOeiJFcoTQn4JIg==
X-Received: by 2002:a05:6000:2305:b0:3a4:f722:f00b with SMTP id ffacd0b85a97d-3a53188a524mr12984625f8f.11.1749540109747;
        Tue, 10 Jun 2025 00:21:49 -0700 (PDT)
Message-ID: <c66d83c1-dda1-46c7-be3c-8bf0c018becb@suse.com>
Date: Tue, 10 Jun 2025 09:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: group pbuf under console field
To: dmkhn@proton.me, Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250606194937.2412579-1-dmukhin@ford.com>
 <00ffcc4b-b63e-4b4d-8b8f-8d02fb7ef234@vates.tech> <aEN0i6tD3humMN3a@kraken>
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
In-Reply-To: <aEN0i6tD3humMN3a@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.06.2025 01:06, dmkhn@proton.me wrote:
> On Fri, Jun 06, 2025 at 08:24:44PM +0000, Teddy Astie wrote:
>> Le 06/06/2025 à 21:51, dmkhn@proton.me a écrit :
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -769,22 +769,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>>>               } while ( --kcount > 0 );
>>>
>>>               *kout = '\0';
>>> -            spin_lock(&cd->pbuf_lock);
>>> +            spin_lock(&cd->console.pbuf_lock);
>>>               kcount = kin - kbuf;
>>>               if ( c != '\n' &&
>>> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
>>> +                 cd->console.pbuf_idx + kout - kbuf < DOMAIN_PBUF_SIZE - 1 )
>>
>> I don't think we want to drop the parentheses here.

I don't see any issue with doing so - they don't serve much of a purpose here.

> The line will will exceed 80 chars if I keep parentheses.
> 
> Will something like the following work:
> 
> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
> +                 (cd->console.pbuf_idx + (kout - kbuf) <
> +                    (DOMAIN_PBUF_SIZE - 1)) )
> 
> ?

Well, indentation of the latter of the two new lines is two too deep, as it
looks.

Jan

