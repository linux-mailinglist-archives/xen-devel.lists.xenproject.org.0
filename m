Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51D694386
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 11:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494347.764381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWTp-0007Se-Sd; Mon, 13 Feb 2023 10:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494347.764381; Mon, 13 Feb 2023 10:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWTp-0007Pd-PY; Mon, 13 Feb 2023 10:54:41 +0000
Received: by outflank-mailman (input) for mailman id 494347;
 Mon, 13 Feb 2023 10:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRWTo-0007PW-CI
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 10:54:40 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf6cbae0-ab8c-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 11:54:38 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id c26so26010595ejz.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 02:54:38 -0800 (PST)
Received: from [192.168.1.93] ([188.73.238.161])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a50c3c8000000b004a23558f01fsm6473647edf.43.2023.02.13.02.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 02:54:37 -0800 (PST)
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
X-Inumbo-ID: cf6cbae0-ab8c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3gB7d3G2ApKRswibo/Uz2hUF5llYjZhxvF3E5z791M=;
        b=DmbOUTjoPk/Ul3TZLeDB7PRELyx5VS5W40Kd/1gde9Cl1audOD3WwspXLO9qQz/u5l
         vgouu+dx4VKMcS/qMf4ugrn/6THfl1k8SIpO5u4TUnhpH3zIXrRbFzBR25m6By6PH9fE
         SNgGrBrQ75Q8g4bIF4NMTCHPmW2kMYcOUVqS9EHPDXhnMaiYlI2aH+Jv+SYQi+Y5bnJq
         Xbc3gMSTzmC2PlbHeZLef3VvBTHuSFo0q2dAjyo+DM3CbFSzTABcajbWkt5ZVDqKjvoD
         bPWQMWe4dewVdWa2+/2LOLxyb2EUmsHysoONLarUx7JMxr+FeXpLPZOeM3mEgOiTA9Oj
         azCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3gB7d3G2ApKRswibo/Uz2hUF5llYjZhxvF3E5z791M=;
        b=0EXDMin1MuBBU9eXxADcn2KzI3nuSr6zij/SmxZuKuaaTgP6kijkfiyBvTFITAAAJI
         H1zc8bm/nKryJ/wk8wQcnGMTa8D6+ZaWenK+7NQaKV0/DSJ5cEvaNyqBIxgthp1s+b2u
         7DEB/ZOeiQa/f3dapLvXINMgqG70k6wfOTpYNePG7UEXNQsxNvHlfkfmm/dFA5TwCDyW
         SekDilNCKFiuh+gmcKek3F1Ynd6/i92x4GA4iMfQfbdCFUp0rkzkPTnibUiiUHyKf5te
         6CjgupPbh5/5puRKTxTUH4uBiaD0SZljpX7bX3BKOonULzjmOuRLvQCjkr4Z3sexE3ZP
         Wv8w==
X-Gm-Message-State: AO0yUKXlR+8hJsjPWpo5cZhsQYauDkppU7bWfVeN8ndeC19P35TIkfRV
	/z01luoJQsK/IIHENkO4/Sw=
X-Google-Smtp-Source: AK7set89DwrJipKQ+DiT3rxJGwYdanLkMtBPM6aOkRHQLtq8boGe+N+Vvv/kWI0Kezh+4aMfMOu+uQ==
X-Received: by 2002:a17:906:2297:b0:887:74b2:811 with SMTP id p23-20020a170906229700b0088774b20811mr22676423eja.74.1676285677837;
        Mon, 13 Feb 2023 02:54:37 -0800 (PST)
Message-ID: <c3d5f342-5897-5dbc-22ff-4f52885b3a6d@gmail.com>
Date: Mon, 13 Feb 2023 12:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230207094347.1059376-1-burzalodowa@gmail.com>
 <a1fbb69f-3fb0-3a80-cafe-94b0fdba5a2b@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <a1fbb69f-3fb0-3a80-cafe-94b0fdba5a2b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/13/23 12:09, Jan Beulich wrote:
> On 07.02.2023 10:43, Xenia Ragiadakou wrote:
>> APIC virtualization support is currently implemented only for Intel VT-x.
>> To aid future work on separating AMD-V from Intel VT-x code, instead of
>> calling directly vmx_vlapic_msr_changed() from common hvm code, add a stub
>> to the hvm_function_table, named update_vlapic_mode, and create a wrapper
>> function, called hvm_update_vlapic_mode(), to be used by common hvm code.
>>
>> After the change above, do not include header asm/hvm/vmx/vmx.h as it is
>> not required anymore and resolve subsequent build errors for implicit
>> declaration of functions ‘TRACE_2_LONG_3D’ and ‘TRC_PAR_LONG’ by including
>> missing asm/hvm/trace.h header.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>
>> Changes in v2:
>>    - rename set_virtual_apic_mode to update_vlapic_mode, suggested by Andrew
>>    - in hvm_update_vlapic_mode(), call the stub only if available, otherwise
>>      a BUG() will be triggered every time an svm guest writes the APIC_BASE MSR,
>>      bug reported by Andrew
>>    - initialize the stub for vmx unconditionally to maintain current behavior
>>      since no functional change is intended, bug reported by Andrew (here, I
>>      decided to place the initialization in start_vmx to be closer to the
>>      initializations of the other stubs that are relevant to apic virtualization)
> 
> I disagree with this - unconditional hooks are better put in place right
> in vmx_function_table's initializer.

Ok. I will fix it.

> 
> Also now that you use the function as a callback, vmx_vlapic_msr_changed()
> will need to have cf_check added (on both declaration and definition, 

Ok will do.

albeit
> I keep forgetting why putting it on just the declaration isn't sufficient; I
> guess a short comment to that effect next to cf_check's definition in
> compiler.h would help).

Yes, that would help. I don't know why it is not sufficient placing it 
just in the declaration.

> 
> Jan

-- 
Xenia

