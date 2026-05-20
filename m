Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHF1OW3EDWql3AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:25:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B858F907
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314023.1584039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhrd-00084u-Qu; Wed, 20 May 2026 14:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314023.1584039; Wed, 20 May 2026 14:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhrd-000832-Ni; Wed, 20 May 2026 14:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1314023;
 Wed, 20 May 2026 14:25:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPhrc-00082w-U3
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:25:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPhrc-00HRyn-AE
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:25:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc451-e002-0a2a0a5209dd-0a2a450ce4ba-32
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:25:36 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc45f-62f1-0a2a450c0019-d155dd30a81b-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:25:35 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so4051856f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 07:25:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4900c16c744sm237312445e9.3.2026.05.20.07.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 07:25:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779287135; x=1779891935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ac32WCr+Ihzp1gBe7Qmdq78cZVdv0dfRb6ezXTBUVNA=;
        b=OJL2ybJWBmQMA7TtdJPwxN9p2LFSTIRwbrNG7A4ccjNvCY/9lXmvhZKoa+oUSEkuPb
         FO8iy+y5UKDEFADL3FnKzvbOpun7dMrPBa8haXjGNwKHu9gliyCJmgxl1tR4RH3yuwtn
         gvTVwvPwDDjpwgS2j9QlbspeM4zgTvxke/G8UVlk8PmCfghhHfmJSFM/46VWdrTR9Wju
         VkQuRtJaJt8o3hXyf9hebUNXuzls2Wupaf549lH/vY9FC1NLCYbnRH1U0g3xBBdDCpG9
         Hb0jueTT9W/4T5rgUM8CYgRX62rWzztwUlT9lCcMzwYpSQ5DWCBnkD9OwFonRDXiihhC
         RK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287135; x=1779891935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac32WCr+Ihzp1gBe7Qmdq78cZVdv0dfRb6ezXTBUVNA=;
        b=gevIgKpjk2UVPxZCxKwo38G6i2RzpPCUBj/vEMBuNQJN/u8rCAWA/qDHHPCRTKhQU7
         MbndmV76e0AIb/KgYNyYwlNAh96KOx2crWopfgBRPP17/yuT2+qPnRODL+BQQ5jzYLWo
         p9FpWYqfvMgfeqllbFA8XbiDgHLmrPiryab50QnFp+NZFuVVKnvGc6ILYexfDUJHyFdB
         32Os6gFpFNonGCeHnAtj+mAZzkpwcVdf2l05NI3zHeVpZHEgmdUWac0ZMtOS3apLIqCE
         vl9cOE6hPE+7yj5ophpWsMUJfL4qKagm9haQZ6fauVeO/44QqeSrKsGf3FIY+Oh+EUlX
         kIBw==
X-Gm-Message-State: AOJu0YziE/rVetbJ+bZ1shh/aej7G5icSrMdTwg23lRuW/W/2Lcp4Ewq
	2izNISMXrqZ64gvXri8gQ59lZN0yjkQcy5VoBCsHYcZ1vkN+dKSVfYWjk31WFzVKIg==
X-Gm-Gg: Acq92OFg7g6otHLW5GN+5C+L4wrcQRN9f2WKSbC7sNTMWpRXIG5spjUQRF9n0Hc38Do
	u1/81/7j3OuVZgGekQHCtKC2SYrUTQ8E7PF4HYIBia8uRLZxrsaq/V2lhN0dS9gy7NnPSVLso+3
	+cXCX1pK7x0v5RqYWvQHJSNJoiUA4EKUpaYEq8ar7iEk2mCFGXyFgs/D0/qf95G8aPGwHzSBqzd
	gvgKQpkNY7TtQonxPSLWOBA2NJlPDCd3GvsPub4DH2IupQTAxgoRQe8J27+gnbYOH1Zk6X/60dL
	f33DOQYPV0+EKoAFjndwYQmKB17Hk5BjMdnTqCL6CsXjobiQx9UUCySCdFDYxQUdHfuuaCi+TYS
	MiD4Nb7XxCq+sjRVGuV+ySXtB+6k7F9yZbIeBueWGxRk18xJ9clL+w8KdXOjLPG1WAcyWd6T9Rf
	FAMJ8GiTToT6ytCRjsk1z4U1sbB85hIsTUFviwZ11oSpGGE9viy25sLUX7uG8e1GmKejXS5rgmE
	tL2kyki+y+r1+g=
X-Received: by 2002:a05:600c:3493:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48fe4cae12dmr366407745e9.1.1779287135334;
        Wed, 20 May 2026 07:25:35 -0700 (PDT)
Message-ID: <c2bc17e2-9446-411e-8bfe-c1641a10a85b@suse.com>
Date: Wed, 20 May 2026 16:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/shadow: VRAM last_dirty tagging
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
 <8559db88-5f1d-4ced-980c-e71c4e229c7c@suse.com>
 <ae8sMiXAWjeXI3o1@macbook.local>
 <eba10bd9-064b-437a-bf42-7a627fda464b@suse.com>
 <ag29KOzxOyU47mFM@macbook.local>
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
In-Reply-To: <ag29KOzxOyU47mFM@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779287135-DBF7ACF5-534AB3F1/0/0
X-purgate-type: clean
X-purgate-size: 2997
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 532B858F907
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 15:54, Roger Pau Monné wrote:
> On Mon, May 04, 2026 at 10:39:53AM +0200, Jan Beulich wrote:
>> On 27.04.2026 11:28, Roger Pau Monné wrote:
>>> On Tue, Feb 03, 2026 at 05:49:55PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm/shadow/hvm.c
>>>> +++ b/xen/arch/x86/mm/shadow/hvm.c
>>>> @@ -1087,18 +1087,18 @@ int shadow_track_dirty_vram(struct domai
>>>>          if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
>>>>              goto out_sl1ma;
>>>>  
>>>> -        dirty_vram->last_dirty = NOW();
>>>> +        dirty_vram->last_dirty = -1;
>>>>  
>>>>          /* Tell the caller that this time we could not track dirty bits. */
>>>>          rc = -ENODATA;
>>>>      }
>>>> -    else if ( dirty_vram->last_dirty == -1 )
>>>> -        /* still completely clean, just copy our empty bitmap */
>>>> -        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
>>>> -    else
>>>> +    /* Nothing to do when the bitmap is still completely clean. */
>>>> +    else if ( dirty_vram->last_dirty != -1 )
>>>>      {
>>>>          mfn_t map_mfn = INVALID_MFN;
>>>>          void *map_sl1p = NULL;
>>>> +        bool any_dirty = false;
>>>> +        s_time_t now;
>>>>  
>>>>          /* Iterate over VRAM to track dirty bits. */
>>>>          for ( i = 0; i < nr_frames; i++ )
>>>> @@ -1174,16 +1174,20 @@ int shadow_track_dirty_vram(struct domai
>>>>              if ( dirty )
>>>>              {
>>>>                  dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
>>>> -                dirty_vram->last_dirty = NOW();
>>>> +                any_dirty = true;
>>>>              }
>>>>          }
>>>>  
>>>> +        now = NOW();
>>>> +        if ( any_dirty )
>>>> +            dirty_vram->last_dirty = now;
>>>
>>> I'm a bit confused with the setting of ->last_dirty here ...
>>>
>>>> +
>>>>          if ( map_sl1p )
>>>>              unmap_domain_page(map_sl1p);
>>>>  
>>>>          memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
>>>>          memset(dirty_vram->dirty_bitmap, 0, dirty_size);
>>>
>>> ... as here the bitmap is zeroed, and hence ->last_dirty should be set
>>> to -1?
>>
>> That's not how I understand the field is used. Aiui it identifies "was
>> clean for more than 2 seconds". That's not the case here. Hence the
>> setting to -1 only conditionally a few lines down from here.
> 
> Hm, OK, it seems like a very complicated way to signal this.  Won't it
> be easier to unconditionally store the last write time in
> ->last_dirty, and let the consumer decide whether it's been more than
> 2s or not?
> 
> Maybe you could write a comment next to the field in the struct
> declaration?

Maybe (in a separate patch), but then how I understand the field is used
may still not be quite correct. I.e. by adding a comment I may further
confuse things.

> Either way:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

