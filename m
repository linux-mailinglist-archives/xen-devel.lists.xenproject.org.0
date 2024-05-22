Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE08CC409
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 17:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727775.1132445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9np8-0007Bt-Py; Wed, 22 May 2024 15:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727775.1132445; Wed, 22 May 2024 15:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9np8-0007A1-NI; Wed, 22 May 2024 15:24:14 +0000
Received: by outflank-mailman (input) for mailman id 727775;
 Wed, 22 May 2024 15:24:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEN6=MZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s9np6-00079t-UK
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 15:24:12 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57444265-184f-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 17:24:11 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4202c1d19d5so41020775e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 08:24:11 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42012d08bb9sm396493725e9.48.2024.05.22.08.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 08:24:10 -0700 (PDT)
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
X-Inumbo-ID: 57444265-184f-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716391451; x=1716996251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rf6xDJDdpe8kGsUFH2ndT9iUcGdRT3pfNMBT0dZE4Ao=;
        b=iwlp+Ziz2qb3MF0xUR2FO5GbG0zGWETpOxOqM9QXFbQBF6/R9tEeUhjQAFWLubWNkj
         xkWB0sEXoY+Y8gnX4t0vkMjpkGCjqDs2iv8LvvF/8eL0m5I5v3rsi1KF4UFfZ+nj5cZ5
         oFtq7lPdNdWoEznsBg7Xrb3xki0AkLdyUwNto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391451; x=1716996251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf6xDJDdpe8kGsUFH2ndT9iUcGdRT3pfNMBT0dZE4Ao=;
        b=Inzbr1AyX9ef4UmLmPsMNNKSq10g7M1zPhKgEswaB6ujM76zS0iMcPHhpHQGngWHCC
         mahVc7xpzpWhy1mlyTITr5gWSx4rFAi7E/YN34O8iTeoqbx+BYn4OM9bCYuSq5nOSFf6
         COHnIC2ZGpAIiOxaBLgToDSmENCbSp64NtnUMzcnGSa545X2sAE3birVm5mrUg6rU8qK
         67QHOzahITdge/w/gJzZodHPY8iAaw30EKGW2GoO5EUtPD7v3Yk/GggHMJ9RrXjWN0Ka
         xqJBP4POOB7f7vr/7ml0FKYetO3y8EoQowhnHRsCmgyeDPfmzNtvgVVUiWq9Xy6QrY3R
         Bi7A==
X-Forwarded-Encrypted: i=1; AJvYcCXb4RNG+UPg8a9bTwtSV+nQ72tDqo+XcN83KX2izmBY39Xsd4wg19vAsOEFI3MSYukaFZK5BBvtHs5oPO4vnGsrM1ou1X1HCO4WY11lEsk=
X-Gm-Message-State: AOJu0Ywx1KOpJmTJmXUSIn9C7YlZAq9fbU505vY/NorEBhdGMTwCp3oa
	Kz4K/BoFRgdT3uzwOw65s6QS90O0aHE2/6ko2By+sMBZJj6+JC9rJO4DfAU7WJU=
X-Google-Smtp-Source: AGHT+IGntyWFU40ojQ5knSm1Bci7f+tmdftoursU7vfJURfGcaN01SPt1bpaXkRtT/LoTrIj/rvCNA==
X-Received: by 2002:a7b:cb42:0:b0:420:2986:ccee with SMTP id 5b1f17b1804b1-420fd34f1eemr21738355e9.30.1716391451329;
        Wed, 22 May 2024 08:24:11 -0700 (PDT)
Message-ID: <48f1b4e2-015b-4a2e-a17e-567aa442a455@cloud.com>
Date: Wed, 22 May 2024 16:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] xen/x86: Simplify header dependencies in x86/hvm
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>
 <6a21a57f-e0fa-43af-a7ea-d813e4b2976d@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <6a21a57f-e0fa-43af-a7ea-d813e4b2976d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2024 10:33, Jan Beulich wrote:
> On 08.05.2024 14:39, Alejandro Vallejo wrote:
>> Otherwise it's not possible to call functions described in hvm/vlapic.h from the
>> inline functions of hvm/hvm.h.
>>
>> This is because a static inline in vlapic.h depends on hvm.h, and pulls it
>> transitively through vpt.h. The ultimate cause is having hvm.h included in any
>> of the "v*.h" headers, so break the cycle moving the guilty inline into hvm.h.
>>
>> No functional change.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> In principle:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> But see below for one possible adjustment.
> 
>> ---
>> v2:
>>   * New patch. Prereq to moving vlapic_cpu_policy_changed() onto hvm.h
> 
> That hook invocation living outside of hvm/hvm.h was an outlier anyway,
> so even without the planned further work this is probably a good move.
> 
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -798,6 +798,12 @@ static inline void hvm_update_vlapic_mode(struct vcpu *v)
>>          alternative_vcall(hvm_funcs.update_vlapic_mode, v);
>>  }
>>  
>> +static inline void hvm_vlapic_sync_pir_to_irr(struct vcpu *v)
>> +{
>> +    if ( hvm_funcs.sync_pir_to_irr )
>> +        alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
>> +}
> 
> The hook doesn't have "vlapic" in its name. Therefore instead or prepending
> hvm_ to the original name or the wrapper, how about replacing the vlapic_
> that was there. That would then also fit better with the naming scheme used
> for other hooks and their wrappers. Happy to adjust while committing, so
> long as you don't disagree.
> 
> Jan

Sounds reasonable. I wasn't sure whether vlapic was adding anything more
than a namespace prefix to the function name. Are you happy to adjust
that on commit?

If so, I'm good with it in the form you propose.

Cheers,
Alejandro

