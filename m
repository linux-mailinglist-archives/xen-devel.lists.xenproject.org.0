Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C26995F1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 14:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496548.767345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSeRd-00039O-Jf; Thu, 16 Feb 2023 13:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496548.767345; Thu, 16 Feb 2023 13:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSeRd-00036J-Gn; Thu, 16 Feb 2023 13:37:05 +0000
Received: by outflank-mailman (input) for mailman id 496548;
 Thu, 16 Feb 2023 13:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a2PR=6M=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pSeRc-00036D-9n
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 13:37:04 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fddbf613-adfe-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 14:37:01 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id fi26so2820495edb.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 05:37:01 -0800 (PST)
Received: from [192.168.1.93] (adsl-89.109.242.225.tellas.gr. [109.242.225.89])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a170906850200b0087873afb1b4sm832557ejx.41.2023.02.16.05.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 05:37:00 -0800 (PST)
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
X-Inumbo-ID: fddbf613-adfe-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=56Ah5tkV1nMq9hsMYCcEBUOF7S4X8K0Vn6aCDXSfJkg=;
        b=eRgpBGTjQjPW+stwcE/9IfPlb8D5+C8dn+S6Ds1SD77pNSFzLFqZtYc/p+ArtFg+cd
         kgUrhYo3HEY4T6KKL7v33Y5DaW4otYN92qkwcTJ4/xLMhGtsZtIRHa1W6N0PawSVqkpH
         rp8H+ZQ5D2x15IU0JW5tgBcU1zNID8Bj4TXBpAUrX+wiz3fBciRL4ANy5qlgOENSZgF8
         UstsZaNZmIxIML9gaUXUKpmQkRKDtmxxXjBeg2+Ze25UkpO9pBiA/Z1kjq0t9/jz76sS
         jxCdnoJVPvZZVJ+MQxEmmUhCAzi05vZLsHgf5efpAQg+b3dIloaZ3iXscxCSNWKKPVdw
         aiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56Ah5tkV1nMq9hsMYCcEBUOF7S4X8K0Vn6aCDXSfJkg=;
        b=lozvTIdYKymoIlPScxazUqiGdbKRCJS4UPm6xj6mg5pHWCoYMidhjLIAMApfWzmYJy
         gRkWvo6T3GrHZa7qY4HvOxfBHpZjjAunU/xxn5m/7gOkVNO1bSo8h9APYsPC1zExmpM5
         mTHfulRqbTWd/7wfuVoSpnCZnxTZrtqQosW02Lev8FG32uDQBRA2R6Ov+WmJzXmmu9XZ
         phcDtV/4AQnQrrMMm3FhcZxdDSQL/1bEX8LdW35t3Z3HEay31TYwZEyvd9G7vm2CB+61
         Ca/cFnSzHJmHoljCVsvSakJopWpWQNdwM/VF5ZaW8DG9PyXpL6L9Wcth2LpxBW22wpES
         Eeyw==
X-Gm-Message-State: AO0yUKWcKWaZXySbOgTTzfNEA2zhVZwbwMJeNnZvEwWd59BNV950nO/C
	t0FYS5lEBiT0rzBGxecbzuM=
X-Google-Smtp-Source: AK7set9pIDudcGGtDg23U6mhqY9mwbkG78skfnRmw3xuFO6b9pmlwtzolAJ64Ayj/8q095wHHMaYew==
X-Received: by 2002:a17:906:1014:b0:8b1:756c:1a30 with SMTP id 20-20020a170906101400b008b1756c1a30mr1014513ejm.59.1676554620618;
        Thu, 16 Feb 2023 05:37:00 -0800 (PST)
Message-ID: <91601284-d648-39bc-2c8f-8e739a44a038@gmail.com>
Date: Thu, 16 Feb 2023 15:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230213115017.902037-1-burzalodowa@gmail.com>
 <b6d1089a-f2e5-1441-2662-3f4974830586@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <b6d1089a-f2e5-1441-2662-3f4974830586@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 2/16/23 12:28, Andrew Cooper wrote:
> On 13/02/2023 11:50 am, Xenia Ragiadakou wrote:
>> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> index 234da4a7f4..97d6b810ec 100644
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -85,7 +85,7 @@ typedef enum {
>>   void vmx_asm_vmexit_handler(struct cpu_user_regs);
>>   void vmx_intr_assist(void);
>>   void noreturn cf_check vmx_do_resume(void);
>> -void vmx_vlapic_msr_changed(struct vcpu *v);
>> +void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
> 
> Hi,
> 
> I see this patch has been committed, but this public declaration should
> deleted, and vmx_vlapic_msr_changed() made static now that it's only
> referenced in vmx.c.

It is also used in vmcs.c

> 
> It needs a forward declaration in vmx.c because of its position relative
> to the vmx_function_table, but that's fine - we've got plenty of other
> examples like this.
> 
> Could I talk you into doing an incremental fix?
> 
> Alternatively, we could get better cleanup by forward declaring just
> {vmx,svm}_function_table, then moving the tables to the very bottom of
> {vmx,svm}.c at which point we can drop all the forward declarations.
> 
> Oh top of that, I suspect we have other public function definitions
> which can turn static, if you happen to spot any while doing this.

Sure I could try to cleanup {svm,vmx}.c and the corresponding headers.

> 
> Thanks,
> 
> ~Andrew

-- 
Xenia

