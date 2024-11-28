Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749769DB4ED
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 10:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845196.1260659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGb2l-00074t-QB; Thu, 28 Nov 2024 09:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845196.1260659; Thu, 28 Nov 2024 09:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGb2l-000724-Ml; Thu, 28 Nov 2024 09:42:39 +0000
Received: by outflank-mailman (input) for mailman id 845196;
 Thu, 28 Nov 2024 09:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGb2k-00071y-Db
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 09:42:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd1c19fa-ad6c-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 10:41:48 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cf9ef18ae9so2994029a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 01:41:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599953c51sm46614666b.179.2024.11.28.01.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 01:41:47 -0800 (PST)
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
X-Inumbo-ID: fd1c19fa-ad6c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZkMWMxOWZhLWFkNmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzg2OTA4LjgzMDkyMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732786908; x=1733391708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhs/ANWEzZ4nJQsyg5/tx9tFdOIT1gfEc6T6eyLlpxk=;
        b=FAthBl6FEbOi/s0YnVsQeVqeIGzB6dyucdRJ10m6+rTi0H/7cFc9s8HyuY9wbb+G/r
         Cr4R/xwdq2h5BmtntvQW93Ps/psP7N7B+TWyPxW1uJKs5Ps7V+k9lhpAzO304ypb2igb
         a6RWQglk7oSQEHubAmfpD3CrIUHWO1IZ4E147MpSvOt81rM3p+qkNfxLpIuOx0YF2WI9
         7/acQOkN+a39xkZLlCoa3lKeigGJiHJbSTDU96vJ1c99+IEujItfOLk/BLV/8BQ1jXdi
         sMeAA0kq9kpxTwjeQbNhS5dFCeXA/sjrB2Hl447fz6GpVKkfeW2hoA0LKH1ngj3kxrug
         vzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732786908; x=1733391708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhs/ANWEzZ4nJQsyg5/tx9tFdOIT1gfEc6T6eyLlpxk=;
        b=GM2xCdiCZFbqjcH4uC556Kq4pUqATWqPKTIHjvnhCiV+M1XCIJ6yBteoCb9SUlbybQ
         89ysrRiPYBYudOLt5REigdRuXcf0GRr/VNLnMJeNbu+bE2By+gbRz3eehRMFzP8SH4FT
         SzZUIagXmnxlx1NSpiYOa3nSmMpKAHGya6ZJN7jcCJXUS6jqwhF/GPsonYavzi2itJPH
         8+qt89dMPcKXkF5udAt14XwLPVnMug0ZejISdJirmQit1goYQXNBziGLrSkO71fkycl8
         Zlijt29iwix/KPGlUMGucUkRgla11ukHT0ZWGJ1jUtKw6ECSHhhVVb4glkbhyLEbKbXZ
         Lrnw==
X-Forwarded-Encrypted: i=1; AJvYcCVTOiApz82ibF9wV2C3Dw4naDVVQOqwvIallDTae9dnYqLm8S7/nCUll+iO29IzAfFVoaHgkX5QrnY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKeQwgsUJ3WeQ2F2tUf77A2v7Un0JxoiBbKMF6FV1w50HDTdIE
	GklJujwhHLEEaKuhFAD2lDe7Iki6vsHz0hUS1P46Pc5r8EenXV7gkyxub0sPSw==
X-Gm-Gg: ASbGncuFqYNqsBUyPkt2EIFFscThnKc3R+sZieqFc+Irgk+LA/a4MFIDxbgxuN+Mfbd
	Qj62pQDM0ctCiXFezJK8wO1TfL5IGchRp9B3sdxaFLrUSvUodlHq9wBecXExu78TiFtLixsZijZ
	/2YXIXejqqOq5qtpurYFki0GXRmUcz9FKuNzOCaVvDh734WpD7JDOG9HUWlQ17L4MVOeGAydpAq
	uJ4ydUxR/v73tdnDhSMOhANhdTIJ10IvJ5LknFC4VyULvg7Ia36wXyNbHlkLAAbuaQJTIPoPY9Q
	t3A9q5g3ETdwqD8Lvn+ZV2Tny7XnqzGz9dA=
X-Google-Smtp-Source: AGHT+IFadI43++CwhIw4XxwTXXvd+UktvMcrR0sVxQbx1l/qvgx0R2upKbUAktOM1UBAvTocVX7fSg==
X-Received: by 2002:a17:906:18aa:b0:aa5:438b:513e with SMTP id a640c23a62f3a-aa5946e70cbmr250670266b.30.1732786908205;
        Thu, 28 Nov 2024 01:41:48 -0800 (PST)
Message-ID: <7dc98504-9f0d-4d08-bfc7-8f7f96b3c8b5@suse.com>
Date: Thu, 28 Nov 2024 10:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Javi Merino <javi.merino@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
 <a2efdf6c-ab52-4ab6-931e-0801844b4875@suse.com>
 <912ba37b-f60f-4423-bb10-37c708382951@citrix.com>
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
In-Reply-To: <912ba37b-f60f-4423-bb10-37c708382951@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 19:01, Andrew Cooper wrote:
> On 27/11/2024 8:20 am, Jan Beulich wrote:
>> On 26.11.2024 21:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -422,7 +422,7 @@ void asmlinkage start_secondary(void *unused)
>>>  static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>>  {
>>>      unsigned long send_status = 0, accept_status = 0;
>>> -    int maxlvt, timeout, i;
>>> +    int timeout, i;
>>>  
>>>      /*
>>>       * Normal AP startup uses an INIT-SIPI-SIPI sequence.
>>> @@ -444,8 +444,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>>      /*
>>>       * Be paranoid about clearing APIC errors.
>>>       */
>>> -    apic_write(APIC_ESR, 0);
>>> -    apic_read(APIC_ESR);
>>> +    apic_read_esr();
>> ... the one here.
> 
> ... this one is still correct in place.

Oh, right.

> I almost had a second function called apic_clear_esr() which was just
> (void)apic_read_esr().
> 
> I could put that back in if you think it would be clearer ?

Nah, it's good as is.

Jan

