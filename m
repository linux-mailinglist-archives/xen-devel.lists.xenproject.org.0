Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B639E962A9C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784927.1194351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJuP-0002Vk-Cd; Wed, 28 Aug 2024 14:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784927.1194351; Wed, 28 Aug 2024 14:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJuP-0002Tt-7c; Wed, 28 Aug 2024 14:44:29 +0000
Received: by outflank-mailman (input) for mailman id 784927;
 Wed, 28 Aug 2024 14:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjJuN-0002Sq-2A
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:44:27 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05130bc6-654c-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 16:44:26 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-709428a9469so5909267a34.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 07:44:25 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fe1967a3sm62331841cf.68.2024.08.28.07.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 07:44:23 -0700 (PDT)
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
X-Inumbo-ID: 05130bc6-654c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724856264; x=1725461064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1QCV+2b2ouHVeE/b0YtNxy3kRxwpySPvvxXVCsd9U14=;
        b=WsIkqXbIsdy4vHYkNDnUsiJvZa8zDSLyTAeexBmSiqHPbKEwH8cjy0lF77nC70vgCQ
         O5aSS7m3LJYecPDxbGsKLhg5qfOKMNETMqqGykbv6gvDOOn4YsxK+MWZqdMKNkJ6Z4w5
         3spS65uqo8F9SsCu8SToUnaNbU72QoNon5kgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724856264; x=1725461064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QCV+2b2ouHVeE/b0YtNxy3kRxwpySPvvxXVCsd9U14=;
        b=eKvwM9V1hMvzOv90MQ+8q4+zM5y69mrF55R+4FntumFnN408w4ASNpKsOr4pvbzEVE
         389Rxh2VqMD7mqH1ew5ccXihxW8/HMiowmyW3Klv0ymR7zfKO0gQfSi1TIhVj7/pNKUq
         yQe5u6XyHnboks65TiD/3oQTp23uTUOto0sLYJDjcSlyXN09AMEvhSxXT+mhyX6hH6Gz
         X254OAT91E5ZDaKs+LUEFK9vewUari2ibAF0vZWb9AiWtVwbDq5GqI0w34517gAUAnH1
         ShXtW4cvmy6m6JwbUn2TY5Vi9RNYfmTD/f+TmBE93uqCQ1Ct3GE/7VDD30hWbHE+hNP2
         ih8A==
X-Forwarded-Encrypted: i=1; AJvYcCW4YqWYpQp8zN+G7DTfGud0Ik0bQp+eUPJzhQaj6dZPq4Sccx6/xMCvyoCy1sajx5ZFy4e+VeqY5dA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIqZ/Ft1eAn6Ha62TKNWQTHLbtwsdvNk1eyZNfcBYnjqk38H2M
	ZZg6l+o3oXwmZuEQ4b19ognuV0+At8Vm5fJ112A7NA4v8CXePCeC51kmSY+3pNU=
X-Google-Smtp-Source: AGHT+IG2ofPpTNYMcB1E84LvSFh39mC/64iRd/LXo4ANMC3blm/Q9OctNkJY1KxoFfVELdrruRXOCA==
X-Received: by 2002:a05:6830:720d:b0:70f:3dd0:316c with SMTP id 46e09a7af769-70f3dd03473mr11658646a34.27.1724856264272;
        Wed, 28 Aug 2024 07:44:24 -0700 (PDT)
Message-ID: <8f34109f-1718-47e5-99c5-a6010d7ebe51@citrix.com>
Date: Wed, 28 Aug 2024 15:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-3-andrew.cooper3@citrix.com>
 <a92063db-fc28-4162-83bd-33617bbfcfbe@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a92063db-fc28-4162-83bd-33617bbfcfbe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2024 5:07 pm, Jan Beulich wrote:
> On 27.08.2024 15:57, Andrew Cooper wrote:
>> ... which is more consise than the opencoded form.
>>
>> Also, for production VMs, ~100% of emulations are simple MOVs, so it is likely
>> that there are no segments to write back.
>>
>> Furthermore, now that find_{first,next}_bit() are no longer in use, the
>> seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
>> they do need to remain unsigned int because of __set_bit() elsewhere.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Pulling current out into curr is good for code generation.  When using current
>> in the loop, GCC can't retain the calculation across the call to
>> hvm_set_segment_register() and is forced to re-read from the cpu_info block.
>>
>> However, if curr is initialised, it's calculated even in the likely path...
> That's a little odd, as I don't think I can spot what would force the compiler
> into doing so. As a wild guess, ...
>
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -2908,18 +2908,18 @@ void hvm_emulate_init_per_insn(
>>  void hvm_emulate_writeback(
>>      struct hvm_emulate_ctxt *hvmemul_ctxt)
>>  {
>> -    enum x86_segment seg;
>> +    struct vcpu *curr;
>> +    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
> ... is the order of these two possibly relevant? Yet of course it's not the
> end of the world whichever way it's done.

My general conclusion is that GCC doesn't try very hard to optimise
likely() early exits.

I suspect there's some reasonably low hanging fruit to be found there.

>
>> -    seg = find_first_bit(&hvmemul_ctxt->seg_reg_dirty,
>> -                         ARRAY_SIZE(hvmemul_ctxt->seg_reg));
>> +    if ( likely(!dirty) )
>> +        return;
>>  
>> -    while ( seg < ARRAY_SIZE(hvmemul_ctxt->seg_reg) )
>> -    {
>> -        hvm_set_segment_register(current, seg, &hvmemul_ctxt->seg_reg[seg]);
>> -        seg = find_next_bit(&hvmemul_ctxt->seg_reg_dirty,
>> -                            ARRAY_SIZE(hvmemul_ctxt->seg_reg),
>> -                            seg+1);
>> -    }
>> +    curr = current;
>> +
>> +    for_each_set_bit ( seg, dirty )
>> +        hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
>> +
>> +    hvmemul_ctxt->seg_reg_dirty = 0;
> Why is this suddenly appearing here? You don't mention it in the description,
> so it's not clear whether you found a (however minor) issue, or whether
> that's purely cosmetic (yet then it's still an extra store we could do
> without).

Oh, yes.  Nothing anywhere in Xen ever clears these segment dirty bits.

I suspect the worst that will go wrong is that we'll waste time
re-{VMWRITE,memcpy}-ing the segment registers into the VMCS/VMCB, but
the logic in Xen is definitely not right.

~Andrew

