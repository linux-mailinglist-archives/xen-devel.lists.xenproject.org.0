Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF29945954
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770280.1181229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZn8N-0002H5-1G; Fri, 02 Aug 2024 07:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770280.1181229; Fri, 02 Aug 2024 07:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZn8M-0002EA-UG; Fri, 02 Aug 2024 07:55:30 +0000
Received: by outflank-mailman (input) for mailman id 770280;
 Fri, 02 Aug 2024 07:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZn8L-0002E4-Tf
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:55:29 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94ef3c37-50a4-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 09:55:27 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5a15692b6f6so11633174a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 00:55:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83960f308sm769528a12.4.2024.08.02.00.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 00:55:26 -0700 (PDT)
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
X-Inumbo-ID: 94ef3c37-50a4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722585327; x=1723190127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iiLa95PkjLGr8EZW8pWxLPDawc+bvhxIuWW8rxxnntM=;
        b=HPzom/RFXK1skYrwXZuIJ4BoXe6MoouOHdHxXXA4hhr7mbbxge2Lhp/1nI0mVjw13i
         6coSQxw8AjxePKva1SeeS2s43lbjrJt4Ts4rKo20CxBJwlOzynjyM0+e8QyY3L39CuHH
         Gn/WsXyZiKeV9pRb7LkdbUmR9uswLit/EYEg46dy+1xV5TNC9DoUVCfP6Hsh7N+Z8Rb6
         RXd6HJoq9ieV2KSoq7VoTljhEgSS8gifEGGHw303zwY1Ql5p9fVTWZm/ajhGYRRwvhqT
         b5AJ+Krmx21kFw6dE6LD1TTRfFiqhriJBh1zpgsPIUfKx9a9AGwKnKQ886V+H4TPLuXA
         w/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722585327; x=1723190127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiLa95PkjLGr8EZW8pWxLPDawc+bvhxIuWW8rxxnntM=;
        b=TenRbboEsrAJvgh3i30EOmjcyuDH0h/t0wjlMsJ+Ty52qECGh5WPcFcS+rx6De5kZY
         fTloqkVWTHY1RVay4THG9qBetP3xJxHWrbPVTbLIVQcc9akVX/kkS8pkwSS+RhqFf9uk
         9/M31EyADfTpkfCAoRZSaTXtxEAzFD4D23RdGetX1nE6V5IdQSS/4NiiGbGKTshTpEEP
         pawhAdLbjaPd90DsJWD0iDhSHwO9SMwZPUpMEujMT0wBGGB2hsy86psHSB81UxnCu6Ei
         jBjHLJ3/PL2kD+prlXLubeTIChUG3gRlOGIUPZrb+5UwTKlghDyGgsPB0HiAyoaYFNSb
         GK9w==
X-Forwarded-Encrypted: i=1; AJvYcCU57fvKnXE9soiP43Q53sfuFWd9bpT65SabHYHaUYrjdnHpu/GMDaDJP5IcZQZBpqcE64VegXNew/r1rqcpX7IUmBRPClHe6KansHnzoAc=
X-Gm-Message-State: AOJu0YxcdF8I4EMUdBDFWNZ9Sgt4YrsqZAVGRGcTD+BC3IUin7ThQyPL
	pYBFdvjwtrkM/ffeReUZZPIwvaSR5KBVXfiMaLU9+MNm8084YlsDRwIvY6XmAQ==
X-Google-Smtp-Source: AGHT+IErj1BTA7Zf5HTsmj2a2xYL6sNOpfrm5LD7weo/NvZUOwCyxwCGdR9FFwJ/S72/wyxivZAkXQ==
X-Received: by 2002:a05:6402:40c:b0:5a0:c709:aa0b with SMTP id 4fb4d7f45d1cf-5b7f56fd439mr2051010a12.24.1722585326916;
        Fri, 02 Aug 2024 00:55:26 -0700 (PDT)
Message-ID: <ac57dec1-68a3-471d-8f4c-c87fd9dca619@suse.com>
Date: Fri, 2 Aug 2024 09:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kexec failure with Xen 4.19-rc4 and 4.20-dev on linux host
To: A Kundu <avikalpa@yahoo.com>
Cc: kexec@lists.infradead.org, horms@verge.net.au,
 xen-devel@lists.xenproject.org, Baoquan He <bhe@redhat.com>
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
 <cebc7800-df78-4f90-9f8e-82e3f9120b6e@yahoo.com>
 <ZqxUMgcEHakeFPaU@MiWiFi-R3L-srv>
 <abaceb99-4b80-49d7-ab7f-b190f73e858d@yahoo.com>
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
In-Reply-To: <abaceb99-4b80-49d7-ab7f-b190f73e858d@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 09:28, A Kundu wrote:
> On 8/2/24 09:06, Baoquan He wrote:
>> On 07/31/24 at 06:34pm, A Kundu wrote:
>>> I am experiencing issues using kexec to load Xen 4.17(debian's apt version),
>>> Xen 4.19-rc4 (compiled from source) and 4.20-dev (compiled from source) on a
>>> debian host.
>> You should CC this to XEN dev list so that XEN dev knows this and may
>> provide help. Not everyone is interested in and knows XEN.
>>
>>> System information:
>>> $ uname -a
>>> Linux host 6.9.10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.9.10-1 (2024-07-19)
>>> x86_64 GNU/Linux
>>>
>>> $ kexec --version # compiled from source tarball with ./configure --with-xen
>>> kexec-tools 2.0.29
>>>
>>> Steps to reproduce:
>>>
>>> 1. Set variables:
>>>
>>> XEN_HYPERVISOR="/boot/xen.gz"
>>> XEN_CMD="dom0_mem=6G dom0_max_vcpus=6 dom0_vcpus_pin cpufreq=xen"
>>>
>>> 2. Attempt to load Xen 4.19-rc4:
>>>
>>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
>>> Could not find a free area of memory of 0x3b6001 bytes...
>>> elf_exec_build_load_relocatable: ELF exec load failed
>>>
>>> 3. Attempt to load Xen 4.20-dev:
>>>
>>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
>>> Could not find a free area of memory of 0x3f8001 bytes...
>>> elf_exec_build_load_relocatable: ELF exec load failed
>>>
>>> 4. Attempt to load Xen 4.17 (from debian rrepositories):
>>> # kexec -l /boot/xen-4.17-amd64.gz --command-line="$XEN_CMD"
>>> Could not find a free area of memory of 0x3b4001 bytes...
>>> elf_exec_build_load_relocatable: ELF exec load failed

And with all of them saying effectively the same, did you verify you
actually have a sufficiently large area reserved? The obvious
place for you to look at is Xen's boot log (obtained via serial
console or "xl dmesg" immediately after booting the system). If you
find everything as expected there, ...

>>> If you need any further information to investigate this problem,
>>> please let me know.

... please provide that boot log.

Jan

