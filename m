Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589EC7D81C3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623724.971842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvySi-0005YS-EP; Thu, 26 Oct 2023 11:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623724.971842; Thu, 26 Oct 2023 11:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvySi-0005Vb-Bn; Thu, 26 Oct 2023 11:23:40 +0000
Received: by outflank-mailman (input) for mailman id 623724;
 Thu, 26 Oct 2023 11:23:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziZY=GI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qvySg-0005VV-Tb
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:23:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b7b355b-73f2-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 13:23:37 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so113937566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 04:23:37 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 pw17-20020a17090720b100b009bd9ac83a9fsm11409804ejb.152.2023.10.26.04.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 04:23:36 -0700 (PDT)
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
X-Inumbo-ID: 1b7b355b-73f2-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698319417; x=1698924217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=in9UqRrtUf0hXu3rOWDiYw+C4Y6e7RNrzYYUDAii0Cg=;
        b=L4TlpbNYPE4RmofaJ8EmPtBEUresj+rTUkKiC3mi1c80E83zXgeMh5SuuLsAMxgD9a
         tP+O6dJZ0/YX/hgc9HTYhU48xJl06nTKFalut+5AP6h1jiEu0pWbpUDKOf/6gFwT1nw/
         VRwhuYNeP7DCeHEFhVF6LtwHGAB1A5wWw+Jtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319417; x=1698924217;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=in9UqRrtUf0hXu3rOWDiYw+C4Y6e7RNrzYYUDAii0Cg=;
        b=EVY/r9b9OaLkC4qNLT99PG+r8yuAiOXdh3Z0/bDOTFXgWYm5h8mcgN41ShY6MpiBHL
         JipYLI1ikcvtS+QoQ83wct900zqpqrLOE+fwkrbipgWPF03ujC59u3LIbNG9Mgz4KTwK
         mZoLOyjFZDU/Kh34eGEkxe0hj1CjpK1TOsWd3zMs0B4L4oapJBeJWHkoB1NU6Buzhq5L
         0kxi0D8pE2ebSkYpewuETb5TDLeCPewJFJf0gYA2bog1FK6Ysf6e96HyY03zLihEPeIx
         sI+tJG/eaNH29dE9Vof2GoDgjOp+sOxhs9Vds3sQ/Ov8YhrQrnRgP0U1YcwjURYge/mv
         o8Qg==
X-Gm-Message-State: AOJu0YwGAcMqH/0lFtQbHqwmStBiwC9LiWmhU/bbfVfv+GXbuJzEHsTz
	OcF4sp0JZA1LHdSsR9fIL0C0MA==
X-Google-Smtp-Source: AGHT+IF5VyuLccSVyWGtELgkal0AoYKWP6Sw4b+B7ffLyCq41IgprhvZnfgqeCpmBZTM+iz7AeeE7A==
X-Received: by 2002:a17:907:3188:b0:9c7:4d3e:1e50 with SMTP id xe8-20020a170907318800b009c74d3e1e50mr14370806ejb.76.1698319417186;
        Thu, 26 Oct 2023 04:23:37 -0700 (PDT)
Message-ID: <0be81644-fe8d-486e-8e79-1316b87911c3@citrix.com>
Date: Thu, 26 Oct 2023 12:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/ucode: Move vendor specifics back out of
 early_microcode_init()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
 <20231025180630.3230010-2-andrew.cooper3@citrix.com>
 <af70a4b6-0bdf-e6d2-80ae-822a273573f9@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <af70a4b6-0bdf-e6d2-80ae-822a273573f9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/10/2023 8:45 am, Jan Beulich wrote:
> On 25.10.2023 20:06, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -847,25 +847,19 @@ int __init early_microcode_init(unsigned long *module_map,
>>  {
>>      const struct cpuinfo_x86 *c = &boot_cpu_data;
>>      int rc = 0;
>> -    bool can_load = false;
>>  
>>      switch ( c->x86_vendor )
>>      {
>>      case X86_VENDOR_AMD:
>> -        if ( c->x86 >= 0x10 )
>> -        {
>> -            ucode_ops = amd_ucode_ops;
>> -            can_load = true;
>> -        }
>> +        ucode_probe_amd(&ucode_ops);
>>          break;
>>  
>>      case X86_VENDOR_INTEL:
>> -        ucode_ops = intel_ucode_ops;
>> -        can_load = intel_can_load_microcode();
>> +        ucode_probe_intel(&ucode_ops);
>>          break;
>>      }
>>  
>> -    if ( !ucode_ops.apply_microcode )
>> +    if ( !ucode_ops.collect_cpu_info )
>>      {
>>          printk(XENLOG_INFO "Microcode loading not available\n");
>>          return -ENODEV;
>> @@ -882,10 +876,10 @@ int __init early_microcode_init(unsigned long *module_map,
>>       *
>>       * Take the hint in either case and ignore the microcode interface.
>>       */
>> -    if ( this_cpu(cpu_sig).rev == ~0 || !can_load )
>> +    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
> Here ucode_ops.apply_microcode simply replaces can_load, as expected.
>
>>      {
>>          printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
>> -               can_load ? "rev = ~0" : "HW toggle");
>> +               ucode_ops.apply_microcode ? "HW toggle" : "rev = ~0");
> Here, otoh, you invert sense, which I don't think is right. With 2nd
> and 3rd operands swapped back
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oh, right.  This did get adjusted several times.  I'll fix.

It's a weird construct anyway, and it gets cleaned up differently by
some of my later work.

>
>> @@ -398,9 +398,17 @@ bool __init intel_can_load_microcode(void)
>>      return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
>>  }
>>  
>> -const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
>> +static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
>>      .cpu_request_microcode            = cpu_request_microcode,
>>      .collect_cpu_info                 = collect_cpu_info,
>>      .apply_microcode                  = apply_microcode,
>>      .compare_patch                    = compare_patch,
>>  };
>> +
>> +void __init ucode_probe_intel(struct microcode_ops *ops)
>> +{
>> +    *ops = intel_ucode_ops;
>> +
>> +    if ( !can_load_microcode() )
>> +        ops->apply_microcode = NULL;
>> +}
> I was wondering why you didn't use the return value to supply the pointer
> to the caller, but this override explains it.

Yes.  The other option was to export (in private.h at least) the root
ucode_ops, which I decided against in the end.

I also toyed with the idea of having the probe functions return int, so
we could get EOPNOTSUPP or so in the compiled-out case, but that's
almost completely redundant with clobbering the hook, and it's added
complexity for somethign that only randconfig is going to care about.

The only thing I'm not entirely happy about is the volume of the
ifdefary for these ucode_probe() functions in the following patch, but
it's the least invasive option overall IMO.

~Andrew

