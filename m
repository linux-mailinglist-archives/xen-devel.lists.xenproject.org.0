Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGLSIm5b+GlStQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:40:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF74BA5CC
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 10:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299584.1574127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoqA-0003ZB-PX; Mon, 04 May 2026 08:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299584.1574127; Mon, 04 May 2026 08:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoqA-0003Xj-Mc; Mon, 04 May 2026 08:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1299584;
 Mon, 04 May 2026 08:39:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJoq9-0003Xd-BX
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:39:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJoq7-00Gi8z-5z
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:39:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f85b4c-bab6-0a2a0a5309dd-0a2a4501b3c4-20
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:39:44 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f85b50-c1f2-0a2a45010019-d1558034a5c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:39:44 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so24459525e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 01:39:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed6bafsm549494985e9.2.2026.05.04.01.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 01:39:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1777883984; x=1778488784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FBV20dI4JF5uAxpxygyU3MCASAakyVoRxUKszAD4B5w=;
        b=Oi61nxcZ28b1edwXZGD4UZj+a4mS17LnDnjw0zYcLFrnqhgY/shW8OFMlhBLbWeBWF
         3vOSbbf/66l7qBhlvYgZwDnSerMr5TaCcNSLPVl784aRukk1xpA3dK7h81ZaK/s96Tpl
         gRnZ7vZvC8wbppfoRRjGeLoBY0lo3KZIsuaPxKJIS4cAU/NDIgXuuc2PeMUYRY7bCYCe
         BpPd9zqqMSDbeEhKuUv1jdG3KhiBw7gF/n84/sp+V9VnpYZQaz1WxBliL1xI50+yr3mD
         Kqh69VUKuVexTjzWOzA8DwMXTcPYzBTbprG36KreZbW6W/3SKNmPSUfGnrEPYEE0DMg+
         iJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777883984; x=1778488784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBV20dI4JF5uAxpxygyU3MCASAakyVoRxUKszAD4B5w=;
        b=KiEvv3vHPWmCn1ZenanP8CxSO7eUa0oDU5vKoJO7KcjLTTh53HKDToJI7X+imCSvpo
         ArlVaqpqQwbmHI+Xmgv7izXj8OI1pJJqnTf+DJO4IsqcDwuDuo07Feq4onTQafZ7mLto
         2yWJF7PmcqxB+wsTBubRl1YRVojWGk7/rAZTjQwEltR2/0mrIZcV1gwCirLGmZTRlekR
         HLsfiDXVzUO16f0sjVgXVYp557NVEqnX9GKmLqJifhuk8x9v6eOO4DZRmWvMTbF9f4vQ
         uSaQhXWjb5rVc0WJ1AMinb50Iun5AdsEH2pzZW90uacDei8WrmaQJIRqMDYJq0D/su6k
         Rg7g==
X-Gm-Message-State: AOJu0YxdhdXq64A8gg3cpVyb7T+n1SBH/0pltLlkYpJC2qsfJRDG2A3O
	xTahDTeZTsDaPGgAT+bdN12XINheazup5MQ41+a8s1ef/GRYn8npy+cvhzsTzGVSeQ==
X-Gm-Gg: AeBDieuiNonmH3d02zU1XMIs4XbLLYepDSSrmaf+XhnnzbE2wZ9RuMy8Q24WEs6XegN
	22lwvDJPxlNlUxcELLZ0ZYjgRqZ3Db6kzzsLghmvaqG//3uHkLqtpUDO0iZfo+MZhoOeZud50KU
	qRRfAMVUjVOHU1iYVcwe/Trv4dEgumCwgTlP+IoVgQdD4flhkVX+EWRrTZHNcTyRPo/scTGZVDO
	deQW1FeXmbljw1Fe5KnDeYVt5dB1AnsG3HSE8uVf0UdOuCmqfzuSvXwG/R2foFEVCOd7eHdiiPd
	Lej/oSWBxcxScIfNWqNJMG4EyOjHHm1pi/PM4yJs3irkErR2plWRgtuGRD3KrLZijpOBjduvCTH
	8Cd05LAePe1mwTxTXio+vUDFwts1PTU0+O496mNTIXjWKxYgQi/kNAlEyhhdkotKeVajXl4WdjX
	ZjZkunvmGOBJq5t0S0bRvyZJy01bOrtPjroiGv9rM0052umz8eicuFzxW2KicnKf5mKUZoTedf8
	t6fa03aF25tLUjzAnFqI4x0Kw==
X-Received: by 2002:a05:600c:83ce:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a970eae79mr118564055e9.10.1777883984006;
        Mon, 04 May 2026 01:39:44 -0700 (PDT)
Message-ID: <eba10bd9-064b-437a-bf42-7a627fda464b@suse.com>
Date: Mon, 4 May 2026 10:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/shadow: VRAM last_dirty tagging
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
 <8559db88-5f1d-4ced-980c-e71c4e229c7c@suse.com>
 <ae8sMiXAWjeXI3o1@macbook.local>
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
In-Reply-To: <ae8sMiXAWjeXI3o1@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777883984-BEA61FF4-11056CE2/0/0
X-purgate-type: clean
X-purgate-size: 2888
X-Rspamd-Queue-Id: E3FF74BA5CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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

On 27.04.2026 11:28, Roger Pau Monné wrote:
> On Tue, Feb 03, 2026 at 05:49:55PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/shadow/hvm.c
>> +++ b/xen/arch/x86/mm/shadow/hvm.c
>> @@ -1087,18 +1087,18 @@ int shadow_track_dirty_vram(struct domai
>>          if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
>>              goto out_sl1ma;
>>  
>> -        dirty_vram->last_dirty = NOW();
>> +        dirty_vram->last_dirty = -1;
>>  
>>          /* Tell the caller that this time we could not track dirty bits. */
>>          rc = -ENODATA;
>>      }
>> -    else if ( dirty_vram->last_dirty == -1 )
>> -        /* still completely clean, just copy our empty bitmap */
>> -        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
>> -    else
>> +    /* Nothing to do when the bitmap is still completely clean. */
>> +    else if ( dirty_vram->last_dirty != -1 )
>>      {
>>          mfn_t map_mfn = INVALID_MFN;
>>          void *map_sl1p = NULL;
>> +        bool any_dirty = false;
>> +        s_time_t now;
>>  
>>          /* Iterate over VRAM to track dirty bits. */
>>          for ( i = 0; i < nr_frames; i++ )
>> @@ -1174,16 +1174,20 @@ int shadow_track_dirty_vram(struct domai
>>              if ( dirty )
>>              {
>>                  dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
>> -                dirty_vram->last_dirty = NOW();
>> +                any_dirty = true;
>>              }
>>          }
>>  
>> +        now = NOW();
>> +        if ( any_dirty )
>> +            dirty_vram->last_dirty = now;
> 
> I'm a bit confused with the setting of ->last_dirty here ...
> 
>> +
>>          if ( map_sl1p )
>>              unmap_domain_page(map_sl1p);
>>  
>>          memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
>>          memset(dirty_vram->dirty_bitmap, 0, dirty_size);
> 
> ... as here the bitmap is zeroed, and hence ->last_dirty should be set
> to -1?

That's not how I understand the field is used. Aiui it identifies "was
clean for more than 2 seconds". That's not the case here. Hence the
setting to -1 only conditionally a few lines down from here.

>> @@ -1216,6 +1220,7 @@ int shadow_track_dirty_vram(struct domai
>>          paging_lock(d);
>>          for ( i = 0; i < dirty_size; i++ )
>>              dirty_vram->dirty_bitmap[i] |= dirty_bitmap[i];
>> +        dirty_vram->last_dirty = NOW();
> 
> I think this is doesn't deserve a 'Fixes:' tag because the setting of
> ->last_dirty unconditionally to NOW() regardless of whether the bitmap
> is zeroed?

There was (and is) no unconditional setting of ->last_dirty. Technically
maybe a Fixes: tag might be appropriate, but this is an error path which
should never be taken (assuming a well behaved DM). Do you think I should
dig out the offending commit?

Jan

