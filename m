Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DD7F9F67
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642039.1001106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7aYu-0001XG-8O; Mon, 27 Nov 2023 12:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642039.1001106; Mon, 27 Nov 2023 12:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7aYu-0001Ur-4v; Mon, 27 Nov 2023 12:18:04 +0000
Received: by outflank-mailman (input) for mailman id 642039;
 Mon, 27 Nov 2023 12:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhMp=HI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r7aYs-0001Uh-Ow
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:18:02 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01a66482-8d1f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 13:18:00 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c873cf9f74so52816081fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 04:18:00 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b004063ea92492sm13767380wmb.22.2023.11.27.04.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 04:17:59 -0800 (PST)
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
X-Inumbo-ID: 01a66482-8d1f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701087480; x=1701692280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hLgFVm3RCc87BIHvz0t9JohJ7QeYZhEaMrXKFcoAxQ=;
        b=N/ksU7EXXNmdri16RKht7M16oW2KB24nggT8RAF2hT09w6ho4Bi0oxdXuXRR9XcBKc
         C6ONcakQkv1gCybHQ6t1w2SYtlvt2P5k6AH9WWFuPa4lts/6DYqFVRzQiSkzNQuDq/Vl
         A7l6G7eibYKsSNtvQwmET4THHGXfkO/OEX5fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701087480; x=1701692280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hLgFVm3RCc87BIHvz0t9JohJ7QeYZhEaMrXKFcoAxQ=;
        b=GVu+6vOAEhvoFNKn4GVVZQgTTRcdpfHIOXBzpvD6yOAq4cvJ6rgYUY7YO5L4uQHFKY
         AM1RWl3eLIT6od6U2y4OJsufAvPpzWkQ8B6Kj9Txy3K/GLfhEer1ggzbTXY0AcXbS0c8
         2gEXzzW/4y9Asa9DLETcLMsfQ5xVDRGaSmU9KhwGFzrBTlifGu0x+C1b2sRCQy9sEm+u
         aNh2jO/gD5S7bVEzJY6RHxZJTFDoU7ybkXINzyjKqun5OXVHv8mNqvATRt03OGSicXVz
         nVicj/WfgkdZUTsSKiZVviBwgPQGeMbXZsJ/AjddU9mNGuqKZiNbtWDefxQgMRH0Uo0X
         MiFQ==
X-Gm-Message-State: AOJu0YwrxOoFfyd/p7qUlG3s7/EhI39BTVWfqbPuccqj8qoE7kigeZb5
	3XJF6+mWOCKxRRPK7W+HJbrChg==
X-Google-Smtp-Source: AGHT+IHCPDjJzlSbQrM9iN9v/c127Wg0A5HH2c0hzq+HG/eTVD245yi163S6VbQm0SXldkmgdFhGgg==
X-Received: by 2002:a2e:87cd:0:b0:2bf:7fad:229b with SMTP id v13-20020a2e87cd000000b002bf7fad229bmr7674255ljj.37.1701087480220;
        Mon, 27 Nov 2023 04:18:00 -0800 (PST)
Message-ID: <71a22900-6167-490f-9d33-fe924bb96c5c@cloud.com>
Date: Mon, 27 Nov 2023 12:17:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
 <2fedb7c1-5742-46d7-9882-d2ec336beece@suse.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <2fedb7c1-5742-46d7-9882-d2ec336beece@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2023 08:40, Jan Beulich wrote:
> On 23.11.2023 18:30, Alejandro Vallejo wrote:
>> @@ -1498,27 +1511,36 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>>    */
>>   static void lapic_load_fixup(struct vlapic *vlapic)
>>   {
>> -    uint32_t id = vlapic->loaded.id;
>> +    uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>>   
>> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
>> -    {
>> +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>> +    if ( !vlapic_x2apic_mode(vlapic) ||
>> +         (vlapic->loaded.ldr == good_ldr) )
>> +        return;
>> +
>> +    if ( vlapic->loaded.ldr == 1 )
>> +       /*
>> +        * Xen <= 4.4 may have a bug by which all the APICs configured in
>> +        * x2APIC mode got LDR = 1. We can't leave it as-is because it
>> +        * assigned the same LDR to every CPU.  We'll fix fix the bug now
>> +        * and assign an LDR value consistent with the APIC ID.
>> +        */
> 
> Just one comment on top of Andrew's: Is the double "fix" really intended
> here? (I could see it might be, but then "fix the bug fix" would read
> slightly more smoothly to me as a non-native speaker.)

It's not intended indeed. s/fix fix/fix/

> 
> Another aspect here is what exactly the comment states (and does not
> state). Original comments made explicit that LDR == 1 contradicts ID == 0.
> In the new comment you only emphasize that all CPUs cannot have that same
> LDR. But the value of 1 being bogus in the first place doesn't become clear
> anymore.
> 
> Jan

1 is bogus for id!=0, but so would be 3, 7 or 42. In particular we have
ID==2 contradicting LDR=2, and we're allowing it. The reason why we must
fix this other case is because all LDRs are equal, otherwise it would
get the same treatment as the other bug.

Cheers,
Alejandro

