Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCe3N7F4DGoSiQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:50:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627E580E5E
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313132.1583353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPLli-0007TG-VT; Tue, 19 May 2026 14:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313132.1583353; Tue, 19 May 2026 14:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPLli-0007PL-SV; Tue, 19 May 2026 14:50:02 +0000
Received: by outflank-mailman (input) for mailman id 1313132;
 Tue, 19 May 2026 14:50:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPLlh-0007DV-6x
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:50:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPLlg-000xE3-Io
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:50:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c7887-e002-0a2a0a5209dd-0a2a45038e60-34
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:50:00 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c7898-672d-0a2a45030019-d155d036e937-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:50:00 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-67c2b4809baso8323862a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 07:50:00 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-684744d13aesm4062050a12.18.2026.05.19.07.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 07:49:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779202200; x=1779807000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+s3QJ934ow7XOzVh4Rq3bRp7OPLgnNHbqN1My81cY8=;
        b=lPGKleIbYhAdiXQ3ewmbEk//RPRiM8buWtpxHOBLaaJ1EqhL2CEjJJ5T2G0731l33c
         oJdMNoNFbEv8HOVavBJ4QbJrO0OfU+hUR8UZz2ngjWewJ3O+vWsYdVv/E0Z4XScVavwf
         As0IAY0NK0Iubpjq/CB0jmk/+0UJBd0E9On2Co1TRdnx8xXMm5O1N9IVS0CX0zL7Cdo8
         4YdQqxAaNnivvTAFp7GRkgIGkSCuCoo3kNDKGI1L3Dk8e8pHIV4I09FtccJbXX6YKReM
         KcekjvXfpBsRic28OCesE0H8/B0hnKiNL1Bgz9OkQimId0exRsY1JVbJCTzy5O3uxvJ+
         KyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202200; x=1779807000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+s3QJ934ow7XOzVh4Rq3bRp7OPLgnNHbqN1My81cY8=;
        b=b1TafxrM69CzEJtoC2I7BjHK9G0efuZzCr3tg+EnThEs+/nPh+ZGBa/eSh1avURZVP
         luSIc81dGv7J9BmKjh2vIdB2Hqr1Ycr0uCoOtdNHhKjurNzeQAzlviFPx3s6jRu7Aktj
         c3Rkeiq1lMQtYNvRJY0GrTQAE5VAs1Z/FxJVBeOXh3P+YIDdxjoGpFaPEzpgBYbgscG1
         hIOsvIRGyPCmNa/C0EzoUoVpYIl28eeTPsFJ4hEO8XdLwIvDnxymWDD8XgmbA6/puRRI
         gKQd1n854p5XnzbcM0CKjVn01srDMTJlz/oFQAWEWq5lcIWWrq7+a18FYWhhBRiVleX/
         vMcg==
X-Forwarded-Encrypted: i=1; AFNElJ/9UophePRgF91gubgUav46Yp6NLpXBx6+BstpJ2DDt3f9O1TA/tGR9olQcHjfm1gmP9X2RYYfFBJI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJpLv1LDHfSLlAtUtdUxGx8MSip3hfyMlmkX34GmfxxaDZ54hy
	7fmosWFxrf19G9zHW7iQ0OVPWLx9PeQ+Lfo4Y57+ektFoK2kk7CFZGTO
X-Gm-Gg: Acq92OHunPCp0sTKkLL+I0KpSBScS1RNyH1DpT4mLQmLAISivviQ4tCIH0eFTJ3HNq6
	LSDAQHFScnTa2bCxTm1oWE6+y36KFcRsXrBgwtG0XNE+jV/tIFGOxsXDZlevr03M/nXtE1L+VZS
	/RHSNsrWOXgZFCRwusnIgUI7IBLpEotkAJ6J2awgFALOQZ6XpWv5nfgOO9WlfFSEYti96BdzR3A
	fCctnNTVIPx/zE7veZtzDB6EHTLJfM0WHfZmW8pJ9De1X2bFKHnSxjI6mYxw7TO8OI3IlmYIzN8
	ZRYWhHScgHZIBA5vj9zYoZMwY1Yr5r4tCbSAMcjYZ6+stWrr96m5oFC3eTWjJWH76P3VyTHBJSz
	Bel4X2gEITe5S5i51op73GRfmQIWzPtz7Zm8CazMt47l+TaRS0Y8JCGb2e8JrV3oP5dRedJp2n3
	EVh6s9i1LIUVEGL7k1vkf/NXfs4hKOjrTYv5p5aioQ4Dj8TDMNKTOc20Hxjiz0fNFSDFw0i1BK5
	ok=
X-Received: by 2002:a05:6402:3494:b0:683:c72:44c9 with SMTP id 4fb4d7f45d1cf-683bc8ac2f4mr12552686a12.11.1779202199769;
        Tue, 19 May 2026 07:49:59 -0700 (PDT)
Message-ID: <fa617f4f-7057-4b59-8f28-5a014b0c423a@gmail.com>
Date: Tue, 19 May 2026 16:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <b2d4f3f7f049837a25bc00bfb1d3da8b984a8b5a.1778250616.git.oleksii.kurochko@gmail.com>
 <364abd6e-4fff-437a-90c8-bb4489f0c51d@suse.com>
 <f032149e-aa99-4976-8012-39bd01d4a653@gmail.com>
 <23e8de1e-b792-4863-bd99-f529642fb963@suse.com>
 <fbd8b102-d495-4678-8226-a199554e266d@gmail.com>
 <3d9e2a3a-6839-4909-b60f-28b4c1a02cdd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3d9e2a3a-6839-4909-b60f-28b4c1a02cdd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779202200-40E68938-9ED97FED/10/73395122804
X-purgate-type: spam
X-purgate-size: 5069
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3627E580E5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 3:40 PM, Jan Beulich wrote:
> On 19.05.2026 15:24, Oleksii Kurochko wrote:
>>
>>
>> On 5/19/26 2:12 PM, Jan Beulich wrote:
>>> On 19.05.2026 13:59, Oleksii Kurochko wrote:
>>>> On 5/18/26 5:51 PM, Jan Beulich wrote:
>>>>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>>>>>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>>>>>> @@ -17,6 +17,8 @@
>>>>>>      */
>>>>>>     #define RISCV_ISA_EXT_BASE  26
>>>>>>     
>>>>>> +#define RISCV_GUEST_ISA_STR_MAX 256
>>>>>
>>>>> This looks like it won't be good for very long, seeing how long ISA strings can
>>>>> get. I wonder anyway whether ...
>>>>>
>>>>>> @@ -94,6 +95,9 @@ struct arch_domain {
>>>>>>         struct p2m_domain p2m;
>>>>>>     
>>>>>>         struct paging_domain paging;
>>>>>> +
>>>>>> +    DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
>>>>>> +    char guest_isa_str[RISCV_GUEST_ISA_STR_MAX];
>>>>>
>>>>> ... a compile-time sized buffer is suitable here. Can't you allocate a buffer
>>>>> just large enough to hold the string?
>>>>
>>>> It could be allocated dynamically.
>>>>
>>>> Does it make sense to evaluate in run-time what should be a buffer size?
>>>> For this case I can't find analogue of realloc() in Xen.
>>>
>>> Hmm, I see xrealloc_array(), and surely we could gain xvrealloc_array()
>>> which we'll need anyway once xrealloc_array() uses get converted. (I also
>>> see x{,v}realloc_flex_struct(), but that's of no use here as it looks.)
>>
>> Oh, I missed to turned off "full match" during search...
>>
>>>
>>>> Or it would be
>>>> fine just to take something bigger as a const (lets say 2048) and use it
>>>> for dynamic allocation?
>>>
>>> I'd rather not. Can't you determine how much space the string is going to
>>> occupy?
>>
>> I thought about two options as alternatives:
>>
>> 1. Take as a length host RISC-V ISA string but theoretically we can
>> emulate some extensions which aren't mentioned in host RISC-V ISA string
>> so it could be longer. So not a good option.
>>
>> 2. Having two walks in init_guest_isa():
>>      Introduce the following function:
>> static size_t guest_isa_str_len(const unsigned long *isa_bitmap)
>> {
>>       size_t len = 4; /* rvX prefix */
>>
>>       for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>>       {
>>           const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>>
>>           if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>>               continue;
>>
>>           if ( ext->id >= RISCV_ISA_EXT_BASE )
>>               len++; /* '_' separator */
>>
>>           len += strlen(ext->name);
>>       }
>>
>>       return len + 1; /* NUL terminator */
>> }
>>
>>     and then:
>>
>> int init_guest_isa(struct domain *d)
>> {
>>       bitmap_andnot(d->arch.guest_isa, riscv_isa, guest_unsupp,
>>                     RISCV_ISA_EXT_MAX);
>>
>>       size_t len = guest_isa_str_len(d->arch.guest_isa);
>>       d->arch.guest_isa_str = xzalloc_array(char, len);
>>       if ( !d->arch.guest_isa_str )
>>           return -ENOMEM;
>>
>>       /* ... existing snprintf + strlcat loop unchanged ... */
>> }
>>
>> If approach 2 is a good one I can follow it.
> 
> This might be yet better with only a single function. Otherwise the two are
> always at risk of going out of sync. After all you can use snprintf() to
> determine just the size needed; if you go look, there may even be an
> example or two in the tree.

I will do than in the following way:

static int build_guest_isa_str(char *buf, size_t size,
                                const unsigned long *isa_bitmap)
{
     int total = 0;
     int ret;

#if defined(CONFIG_RISCV_32)
     ret = snprintf(buf, size, "rv32");
#elif defined(CONFIG_RISCV_64)
     ret = snprintf(buf, size, "rv64");
#else
#   error "Unsupported RISC-V bitness"
#endif
     if ( ret < 0 )
         return ret;
     total += ret;

     for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
     {
         const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];

         if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
             continue;

         ret = snprintf(buf ? buf + total : NULL,
                        buf ? size - total : 0, "%s%s",
                        ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
                        ext->name);
         if ( ret < 0 )
             return ret;
         total += ret;
     }

     return total;
}

int init_guest_isa(struct domain *d)
{
     int len;

     bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
                   RISCV_ISA_EXT_MAX);

     len = build_guest_isa_str(NULL, 0, d->arch.isa);
     if ( len < 0 )
         return len;

     d->arch.isa_str = xmalloc_array(char, len + 1);
     if ( !d->arch.isa_str )
         return -ENOMEM;

     build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa);

     return 0;
}

Thanks for suggestion.

~ Oleksii

