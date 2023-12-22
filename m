Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2868E81C940
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 12:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659314.1028860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGdox-0001qv-JC; Fri, 22 Dec 2023 11:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659314.1028860; Fri, 22 Dec 2023 11:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGdox-0001p7-EQ; Fri, 22 Dec 2023 11:36:03 +0000
Received: by outflank-mailman (input) for mailman id 659314;
 Fri, 22 Dec 2023 11:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGdov-0001p1-TW
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 11:36:01 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 471ae044-a0be-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 12:35:59 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso185047f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 03:35:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cx1-20020a056000092100b00336598903e9sm4087308wrb.58.2023.12.22.03.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 03:35:58 -0800 (PST)
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
X-Inumbo-ID: 471ae044-a0be-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703244959; x=1703849759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPEn8NaGEBS7w2SAzSMTb5W4c8vY8VjRSDnLcvCr8PU=;
        b=gg78CQZW+czCsZe8QiBl5CUSHOtkwapLQl1tjzXh1B2v9eX1McoX27biAnUH7MbMTF
         s6t6V9saB3Z3sy2ZPoGO6wyoaADjGvyyBQs/JCxoj39AkZIrKyF25SRVdjFtBhi44Sz8
         BRNf3mMTaIFICrhS1rEA25ICcpdvHPtJsOITXhi7aUz28D2GoxogEm+rBm/5OHSBsQsV
         vIBzYKzaOugsRI1qqYGHVvfnrbKClNeOI3OKK/Qla+cHlxT8AqLOer80Xf8c7VmlYyk3
         5HZQbc+6ZkOM7/iSNxLet9FTp+FtrYR1GsnSaUYb1hZFRZhGNSrTKnqSdo+yUYCg3262
         cVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703244959; x=1703849759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPEn8NaGEBS7w2SAzSMTb5W4c8vY8VjRSDnLcvCr8PU=;
        b=RIK3pkt4W2ZLCKVMPvgvC/yZMUSnkQAOtFhO0BKQ30hkZZ2l+EVo4qgjD5MKDX/YRn
         D0l7x27goloQWSkKwgT+NAddxyxb4MtW4QIvBT2ILoB9sfIP66VTrFD1u4FpxifhsN9F
         FJqaM3D19pcQTPD+duccD/NHuGc1NgtuI9eG5gpMtjUvdvS/qdh4J6bXh+pao7pDaOU/
         oCi4kzh0WvabIwRHdWbFO1D6gYht6K4jeh2g/0H1IKiUasoJU+wIe4NRFU+56Nv2ixD3
         zmg8m6esA/hwo/ROZM22APVQZ+7fBJ+krOzs3ank3xQLvtOyj/9tSm4Iz0G6ncBy+sDG
         1LFg==
X-Gm-Message-State: AOJu0YyoJMYWyLTB7NqN4AQ/7Cnjc+C14jOsx5LFF2dtSi2JQkBENjjA
	M54XwyCkG6/Y7lVyPIub28VcuvQu+PNJ
X-Google-Smtp-Source: AGHT+IETeoc9U+HmYA5xhfq2wNmX6nYqd58/scBk3tmKbtojb0j6DeMZLzO71coFNUocw0z05tCV2w==
X-Received: by 2002:a5d:6484:0:b0:336:62c1:d0af with SMTP id o4-20020a5d6484000000b0033662c1d0afmr736074wri.60.1703244958728;
        Fri, 22 Dec 2023 03:35:58 -0800 (PST)
Message-ID: <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>
Date: Fri, 22 Dec 2023 12:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hvmloader - allow_memory_relocate overlaps
Content-Language: en-US
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Anthony Perard
 <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
 <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
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
In-Reply-To: <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.12.2023 19:08, Neowutran wrote:
> On 2023-12-19 17:12, Jan Beulich wrote:
>> On 16.12.2023 08:01, Neowutran wrote:
>>> I am wondering if the variable "allow_memory_relocate" is still
>>> relevant today and if its default value is still relevant. 
>>> Should it be defined to 0 by default instead of 1 (it seems to be a
>>> workaround for qemu-traditional, so maybe an outdated default value ? ) ? 
>>
>> So are you saying you use qemu-trad?
> No, I am using "qemu_xen" ( from  
> xenstore-read -> 'device-model =
> "qemu_xen"' 
> 
>> Otherwise isn't libxl suppressing this behavior anyway?
> If by "isn't libxl suppressing this behavior" you means if libxl is setting
> the value of "allow_memory_relocate", then the answer is no. 
> 
> Following this lead, I checked in what code path
> "allow_memory_relocate" could be defined. 
> 
> It is only defined in one code path, 
> 
> In the file "tools/libs/light/libxl_dm.c",
> in the function "void libxl__spawn_local_dm(libxl__egc *egc, libxl__dm_spawn_state *dmss)": 
> 
> '''
>  // ...
>     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
>  // ...
> 
>         libxl__xs_printf(gc, XBT_NULL,
>                          GCSPRINTF("%s/hvmloader/allow-memory-relocate", path),
>                          "%d",
>                          b_info->device_model_version==LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
>                          !libxl__vnuma_configured(b_info));
> // ...
> '''
> 
> However, on QubesOS (my system), "local_dm" is never used, "stub_dm"
> is always used. 
> 
> In the function "void lib 
> xl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)", 
> the value of "allow_memory_relocate" is never defined. 
> 
> I tried to patch the code to define "allow_memory_relocate" in
> "libxl__spawn_stub_dm": 
> 
> '''
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2431,6 +2431,10 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>                                         libxl__xs_get_dompath(gc, guest_domid)),
>                          "%s",
>                          libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
> +        libxl__xs_printf(gc, XBT_NULL,
> +                         libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate", libxl__xs_get_dompath(gc, guest_domid)),
> +                         "%d",
> +                         0);
>      }
>      ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
>      if (ret<0) {
> '''
> 
> And it is indeed another way to solve my issue. 
> However I do not understand the xen hypervisor enough to known i 
> f
> "allow-memory-relocate" should have been defined in
> "libxl__spawn_stub_dm" or if the real issue is somewhere else. 

I think it should be done the same no matter where qemu runs. Back at the
time iirc only qemu-trad could run in a stubdom, which may explain the
omission. Cc-ing the two guys who are likely in the best position to tell
for sure.

>>> Code extract: 
>>>
>>> tools/firmware/hvmloader/pci.c 
>>> "
>>>    /*
>>>      * Do we allow hvmloader to relocate guest memory in order to
>>>      * increase the size of the lowmem MMIO hole?  Defaulting to 1
>>>      * here will
>>>  mean that non-libxl toolstacks (including xend and
>>>      * home-grown ones) means that those using qemu-xen will still
>>>      * experience the memory relocation bug described below; but it
>>>      * also means that those using q 
>>> emu-traditional will *not*
>>>      * experience any change; and it also means that there is a
>>>      * work-around for those using qemu-xen, namely switching to
>>>      * qemu-traditional.
>>>      *
>>>      * If we defaulted to 0, and failing to resize the hole caused any
>>>      * problems with qemu-traditional, then there is no work-around.
>>>      *
>>>      * Since xend can 
>  only use qemu-traditional, I think this is the
>>>      * option that will have the least impact.
>>>      */
>>>     bool allow_memory_relocate = 1;
>>> "
>>>
>>> "
>>>         /*
>>>          * At the moment qemu-xen can't deal with relocated memory regions.
>>>          * It's too close to the release to make a proper fix; for now,
>>>          * only allow t
>>> he MMIO hole to grow large enough to move guest memory
>>>          * if we're running qemu-traditional.  Items that don't fit will be
>>>          * relocated into the 64-bit address space.
>>>          *
>>>          * This loop now does the following:
>>>          * - If allow_memory_relocate, increase the MMIO hole until it's
>>>          *   big enough, or  
>>> until it's 2GiB
>>>          * - If !allow_memory_relocate, increase the MMIO hole until it's
>>>          *   big enough, or until it's 2GiB, or until it overlaps guest
>>>          *   memory
>>>          */
>>>         while ( (mmio_total > (pci_mem_end - pci_mem_start))
>>>     
>              && ((pci_mem_start << 1) != 0)
>>>                 && (allow_memory_relocate
>>>                     || (((pci_mem_start << 1) >> PAGE_SHIFT)
>>>                         >= hvm_info->low_mem_pgend)) )
>>>             pci_mem_start <<= 1;
>>> "
>>>
>>> The issue it cause is documented in the source code: guest memory can
>>> be trashed by the hvmloader. 
>>>
>>> Due to this issue, it is impossible to passthrough a large PCI device to a HVM with a lot of ram.
>>> (https://github.com/QubesOS/qubes-issues/issues/4321). 
>>>
>>> (Forcing "allow_memory_relocate" to be 0 seems to solve the issue
>>> linked)
>>
>> What I don't understand here (and what I also can't find helpful logs for)
>> is: The code in hvmloader is in principle intended to work in both cases.
>> If there's suspected guest memory corruption, can we get to see the actual
>> results of the MMIO hole creation and its using for device ranges? If there
>> indeed is an overlap with guest RAM, that's a bug which wants fixing.
> 
> tools/firmware/ 
> hvmloader/pci.c, function "void pci_setup(void)"
> I added a log to print if the hvmloader would have tried to overlaps
> guest memory
> 
> '''
> 
> +        printf("NEOWUTRAN pci.c: pci_mem_end: %d\n",pci_mem_end);
> +        printf("NEOWUTRAN pci.c: pci_mem_start: %d\n",pci_mem_start);
> +        printf("NEOWUTRAN pci.c: allow_memory_relocate: %d\n",allow_memory_relocate);
> +        printf("NEOWUTRAN pci.c: hvm_info->low_mem_pgend: %d\n",hvm_info->low_mem_pgend);
> +
> +
>         while ( (mmio_total > (pci_mem_end - pci_mem_start))
>                 && ((pci_mem_start << 1) != 0)
>                 && (allow_memory_relocate
>                     || (((pci_mem_start << 1) >> PAGE_SHIFT)
>                         >= hvm_info->low_mem_pgend)) )
>             pci_mem_start <<= 1;
> 
> +         if ( (mmio_total > (pci_mem_end - pci_mem_start))
> +                && ((pci_mem_start << 1) != 0)
> +                && (1
> +                    || (((pci_mem_start << 1) >> PAGE_SHIFT)
> +                        >= hvm_info->low_mem_pgend)) ){
> +                
> printf("NEOWUTRAN pci.c: HVM_LOADER would have tried to relocate guest memory\n");
> +               printf("NEOWUTRAN pci.c: pci_mem_start: %d\n",pci_mem_start);
> +
> +        }
> '''
> 
> And the associated result is: 
> 
> (d22) NEOWUTRAN pci.c: pci_mem_end: -67108864
> (d22) NEOWUTRAN pci.c: pci_mem_start: -268435456
> (d22) NEOWUTRAN pci.c: allow_memory_relocate: 0
> (d22) NEOWUTRAN pci.c: hvm_info->low_mem_pgend: 983040
> (d22) NEOWUTRAN pci.c: HVM_LOADER would have tried to relocate guest memory
> (d22) NEOWUTRAN pci.c: pci_mem_start: -268435456
> 
> So if "allow_memory_relocate" was not defined to 0, the hvmloader
> would have tried to overlaps guest memory, and it seems that is
> something that qemu_xen cannot handle.

Well, memory addresses printed in decimal are pretty hard to work with.
But I'd like to ask anyway that you supply all of the log messages for
such a guest starting, to be able to correlate what you've added with
other items also logged.

Jan

