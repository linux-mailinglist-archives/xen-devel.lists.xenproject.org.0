Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BAE69DF08
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498809.769729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR05-00017N-27; Tue, 21 Feb 2023 11:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498809.769729; Tue, 21 Feb 2023 11:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUR04-000140-VQ; Tue, 21 Feb 2023 11:40:00 +0000
Received: by outflank-mailman (input) for mailman id 498809;
 Tue, 21 Feb 2023 11:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RUos=6R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUR03-00013s-7X
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:39:59 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7789a0e6-b1dc-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 12:39:58 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id cy6so10441277edb.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 03:39:57 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.gmail.com with ESMTPSA id
 g13-20020a056402090d00b004acbda55f6bsm1121112edz.27.2023.02.21.03.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:39:56 -0800 (PST)
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
X-Inumbo-ID: 7789a0e6-b1dc-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqmPUovFgDUxQPlbJvg4n4NrDEAZoHu4pIIoXueWiLQ=;
        b=ic0ESN9hy+9m5eCfetPMrQato5/Hchj6QXy1L4bm+gIxTwnsZm1oM9+XpCPvRKq463
         cVbuFXI1kayqS2i4PvUTFlsKqQjz5AblOdJxhZoJQjTJZJwp5ywtEc7H8OiZj8ZaN/Kb
         5bG9BzNq6fiSPpfNHJcu+0/4g0OfwFiWNNjdwkQMus4Qgt5hDLHKYH37SjoEkpUOCfuz
         jAN6BvW9Q8osMaWfeqWUJHkmbFcJikozpTqCTBcw4F5DdECrjEXPqrhh5zAo4KrkjnvM
         z9DuMiu73GfgOpmjHXRrOaCWFvfzZtdtzDpMfT2dZL3F6AJrhaw4Vxq0NSDtMjNJsDyl
         uMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqmPUovFgDUxQPlbJvg4n4NrDEAZoHu4pIIoXueWiLQ=;
        b=yoP/g3ORSaAXM2/0yp3C0rb2/EH82/JG4KEjnpkHgLtr5XUNbj5mgGcRbSX61gPNpl
         gkYKyyBJikv4yh8EZX7CFNMzwKzaOAOY89EntLita6lUzWbMzUPXAvr3IxUbIAFn06mM
         PfjImLWHmn4Mmi7eTjWvyD6Sbp+bea+39rzB3XvFb7zPiHD5uIdBiIRd7DRfHCa8LEPV
         le2jyoDCcKgUPr2VX3jr+iDlitYtpcxBfKYA6RnMeAh5QY1OA6ebVLuZpgViXM0VJoNy
         YZ1tGG0dM2iVKM2EOHG/ajvUK26GLOTp4bPjdjtkoxF88J7wOEPKjxhLiij+6KmXGEam
         QAxA==
X-Gm-Message-State: AO0yUKWil1T4/9HRNfBOy21XyT51zhPZaKDb2D+zIUz0a4nEHz/V8boL
	YJ9YJVa86g3ecahNH/Mb2ECcLIZCQ/I=
X-Google-Smtp-Source: AK7set9nbuGdDG923HFAQfWNQHolDR23UOWU29Y3ntu3EBM7dTSkRXXYoP7OqXp9+0Yx0MRk+fh+4g==
X-Received: by 2002:aa7:c2c7:0:b0:4ac:d30d:c3a3 with SMTP id m7-20020aa7c2c7000000b004acd30dc3a3mr3117250edp.32.1676979597145;
        Tue, 21 Feb 2023 03:39:57 -0800 (PST)
Message-ID: <35502e08-6a59-63a9-be4e-4e0592dae61d@gmail.com>
Date: Tue, 21 Feb 2023 13:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] x86/vmx: cleanup vmx.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-5-burzalodowa@gmail.com>
 <236c784d-e128-c35c-3c95-9b4dda08804a@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <236c784d-e128-c35c-3c95-9b4dda08804a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/21/23 13:23, Jan Beulich wrote:
> On 17.02.2023 19:48, Xenia Ragiadakou wrote:
>> Do not include the headers:
>>    asm/i387.h
>>    asm/hvm/trace.h
>>    asm/processor.h
>>    asm/regs.h
>> because none of the declarations and macro definitions in them is used in
>> this file. Sort alphabetically the rest of the headers.
>> Fix build by including asm/i387.h in vmx.c, needed for vcpu_restore_fpu_lazy().
>>
>> Move the definition of GAS_VMX_OP just above the functions that use it and
>> undefine it after its usage.
>>
>> Move in vmcs.c the definitions of:
>>    ept_sync_all()
>>    __vmxoff()
>>    __vmxon()
>> because they are used only in this file. Take the opportunity to remove a
>> trailing white space.
> 
> While the latter two are probably fine to be moved, I think the first one
> wants to remain where it is, as new uses might appear.

Ok I will leave it where it is.

> 
>> Move in vmx.c the definitions of:
>>    pi_test_and_set_pir()
>>    pi_test_pir()
>>    pi_test_and_set_on()
>>    pi_set_on()
>>    pi_test_and_clear_on()
>>    pi_test_on()
>>    pi_get_pir()
>>    pi_test_sn()
>>    pi_set_sn()
>>    pi_clear_sn()
>>    vpid_sync_vcpu_gva()
>> because they are used only in this file.
> 
> I'm not fully convinced of such movement. As a general remark: We typically
> avoid "inline" for functions in .c files. Yet most if not all of the above
> are pretty good candidates for being explicitly marked "inline".

I could create a private header.

> 
>> Move in vmx.c the declarations of:
>>    ve_info_t
>>    ept_qual_t
>>    idt_or_gdt_instr_info_t
>>    ldt_or_tr_instr_info_t
>> because they are used only in this file.
> 
> I disagree with the movement of such types. Sooner or later they may want
> using by vvmx.c as well. If you want to move them, then to a private header
> under xen/arch/x86/hvm/vmx/.

Ok will do.

> 
> Finally I think at least the individual groups of what is being moved or
> adjusted want splitting into separate patches.

Ok.

> 
> Jan

-- 
Xenia

