Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264FE947505
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 08:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771768.1182205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saqmo-0003fL-K7; Mon, 05 Aug 2024 06:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771768.1182205; Mon, 05 Aug 2024 06:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saqmo-0003dH-HY; Mon, 05 Aug 2024 06:01:38 +0000
Received: by outflank-mailman (input) for mailman id 771768;
 Mon, 05 Aug 2024 06:01:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1saqmn-0003dB-07
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 06:01:37 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bc3247d-52f0-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 08:01:35 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5af51684d52so11801180a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2024 23:01:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839c24084sm4432996a12.30.2024.08.04.23.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Aug 2024 23:01:34 -0700 (PDT)
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
X-Inumbo-ID: 2bc3247d-52f0-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722837695; x=1723442495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lED7dYRCywCuRbUhwJdEA2o6RkCdCtgphXCI+gOxtf4=;
        b=Zd/LVREMN17dcovo6sf6Z1RYPgMvdh8I9i280wYvTbg7RSpJktBezOGgQyGSvBRjvV
         6UrMnmpS3CS0eVOGTiwGqoRIaK+qPp3yeCA95e1irP244V8kJVkqdsYuDZJ+kEswaRhX
         8mNn0XNtUSqbAKS8CyolDtMcLUKm643V8csClM8QbUymAXy7xKaGrqGJlqHrOjpu0YYK
         XL/6Sx321TOMM+zWZQoyPOrc7KGZfpMLDUy0znjgyTYXFu2lzVvlcrfLlIp8+4BqdYWa
         GkNvRe2ofc606wIlipvuw0oIIP8HjX48GZ4MTeTqByewMp5S+5zqikrT0CLOD1DFOLct
         J9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722837695; x=1723442495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lED7dYRCywCuRbUhwJdEA2o6RkCdCtgphXCI+gOxtf4=;
        b=LdxEWTPWiKcOIydQHfgXFD0B6d1Sposwp50RAloqN2Pujo7JkD1FF0Bqmv9KEUlydb
         Y+rVi3Y8TD3fRwsEhI1HEMeO5dpt5+kpLzOvct/MmidBgYnfzImsFhEzjRQDciApSOt0
         jViT2pALdfPHTyZOjMmjazpVH9JoQa80w4DHzTZ2JKegSZA+jCRAoP8dV1oCQx9bjGMg
         he/77vf2NgXIlMtgSgJa0vE40gLzA7bPrZn4vccFl5LnvPXn1qNgyX5+brbuMZAW4OMc
         xiO1tdRndX3JdyR+fThAq5WcRSqfZOscP58ahQzPtb8MZQU3A2IXTAE9Z+4jqy+otuGx
         5EDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZHTPji9fIVP+7KuCy7ItKJ3LWLUSZbf/iBNxi2rCWT7aFczN5Ple06E2Y7SUIqMSDQt9jvwkBpfalZpo38EHXlENnQ+2/ypXYD7B0uJI=
X-Gm-Message-State: AOJu0YyKey1AALdxAGxD1AIixEGkAJ0F/3pX6KRgFAvWZPh42G/uWwrF
	aY++SsQ4RneMG1OUqDOSKeEWapPkbIWdl74JRdFkEvD/096uWWH88VawrwzTcA==
X-Google-Smtp-Source: AGHT+IF/MuyBawxYvRAf2/TBrWgfmNs447RfTFJwEQ0MmP6J7PKNna0mpxrB9khI+C1oUahtt2JhwQ==
X-Received: by 2002:a05:6402:2689:b0:5b9:462d:c539 with SMTP id 4fb4d7f45d1cf-5b9462dcb76mr6299336a12.3.1722837694547;
        Sun, 04 Aug 2024 23:01:34 -0700 (PDT)
Message-ID: <18032298-e535-4405-890e-6ab9d54cf7e3@suse.com>
Date: Mon, 5 Aug 2024 08:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kexec failure with Xen 4.19-rc4 and 4.20-dev on linux host
To: A Kundu <avikalpa@yahoo.com>
Cc: kexec@lists.infradead.org, horms@verge.net.au,
 xen-devel@lists.xenproject.org, Baoquan He <bhe@redhat.com>,
 andrew.cooper3@citrix.com
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
 <cebc7800-df78-4f90-9f8e-82e3f9120b6e@yahoo.com>
 <ZqxUMgcEHakeFPaU@MiWiFi-R3L-srv>
 <abaceb99-4b80-49d7-ab7f-b190f73e858d@yahoo.com>
 <ac57dec1-68a3-471d-8f4c-c87fd9dca619@suse.com>
 <dc5c9dff-6bee-493a-8315-b2eee48bd802@yahoo.com>
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
In-Reply-To: <dc5c9dff-6bee-493a-8315-b2eee48bd802@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2024 15:17, A Kundu wrote:
> On 8/2/24 13:25, Jan Beulich wrote:
>  > On 02.08.2024 09:28, A Kundu wrote:
>  >> On 8/2/24 09:06, Baoquan He wrote:
>  >>> On 07/31/24 at 06:34pm, A Kundu wrote:
>  >>>> I am experiencing issues using kexec to load Xen 4.17(debian's apt 
> version),
>  >>>> Xen 4.19-rc4 (compiled from source) and 4.20-dev (compiled from 
> source) on a
>  >>>> debian host.
>  >>> You should CC this to XEN dev list so that XEN dev knows this and may
>  >>> provide help. Not everyone is interested in and knows XEN.
>  >>>
>  >>>> System information:
>  >>>> $ uname -a
>  >>>> Linux host 6.9.10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.9.10-1 
> (2024-07-19)
>  >>>> x86_64 GNU/Linux
>  >>>>
>  >>>> $ kexec --version # compiled from source tarball with ./configure 
> --with-xen
>  >>>> kexec-tools 2.0.29
>  >>>>
>  >>>> Steps to reproduce:
>  >>>>
>  >>>> 1. Set variables:
>  >>>>
>  >>>> XEN_HYPERVISOR="/boot/xen.gz"
>  >>>> XEN_CMD="dom0_mem=6G dom0_max_vcpus=6 dom0_vcpus_pin cpufreq=xen"
>  >>>>
>  >>>> 2. Attempt to load Xen 4.19-rc4:
>  >>>>
>  >>>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
>  >>>> Could not find a free area of memory of 0x3b6001 bytes...
>  >>>> elf_exec_build_load_relocatable: ELF exec load failed
>  >>>>
>  >>>> 3. Attempt to load Xen 4.20-dev:
>  >>>>
>  >>>> # kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
>  >>>> Could not find a free area of memory of 0x3f8001 bytes...
>  >>>> elf_exec_build_load_relocatable: ELF exec load failed
>  >>>>
>  >>>> 4. Attempt to load Xen 4.17 (from debian rrepositories):
>  >>>> # kexec -l /boot/xen-4.17-amd64.gz --command-line="$XEN_CMD"
>  >>>> Could not find a free area of memory of 0x3b4001 bytes...
>  >>>> elf_exec_build_load_relocatable: ELF exec load failed
>  >
>  > And with all of them saying effectively the same, did you verify you
>  > actually have a sufficiently large area reserved? The obvious
>  > place for you to look at is Xen's boot log (obtained via serial
>  > console or "xl dmesg" immediately after booting the system). If you
>  > find everything as expected there, ...
>  >
>  >>>> If you need any further information to investigate this problem,
>  >>>> please let me know.
>  >
>  > ... please provide that boot log.
> 
> I have also followed up on your suggestion to check the Xen boot log
> using "xl dmesg", but unfortunately, I received the following error:
> 
> xencall: error: Could not obtain handle on privileged command interface: 
> No such file or directory
> libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No 
> such file or directory
> cannot init xl context
> 
> This indicates that Xen did not boot successfully, so there are no logs
> available.

The fact that you have Dom0 up makes clear that Xen booted okay(ish). The
fact that you get "No such file or directory" from xencall suggests you
either didn't load the xen-privcmd driver (normally arrangements are made
by distros for this to happen automatically), or you didn't even build it.

>  > And with all of them saying effectively the same, did you verify you
>  > actually have a sufficiently large area reserved? The obvious
>  > place for you to look at is Xen's boot log (obtained via serial
>  > console or "xl dmesg" immediately after booting the system). If you
>  > find everything as expected there, ...
>  >
> 
> In an attempt to resolve the memory allocation issue, I have tried the
> following:
> 
> Added a crashkernel=<size>@<offset> parameter to the host kernel command
> line to reserve a dedicated memory region for kexec, and attempted to
> load Xen into that area.

That was a remote guess of mine. This command line option is meaningless
when running under Xen. The reservation needs to be done in Xen.

Overall for the moment I'm inclined to say that xen-devel@ isn't the right
forum here. xen-users@ might be quite a bit more appropriate until you
actually run into issues with Xen itself, not with its (correct) use.

Jan

