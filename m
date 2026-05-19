Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LkKKmFoDGpXggUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:40:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB6457FDBC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313027.1583211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKgM-0000Fl-WA; Tue, 19 May 2026 13:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313027.1583211; Tue, 19 May 2026 13:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKgM-0000E6-Sq; Tue, 19 May 2026 13:40:26 +0000
Received: by outflank-mailman (input) for mailman id 1313027;
 Tue, 19 May 2026 13:40:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPKgL-0000E0-1u
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:40:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKgJ-009eT0-VN
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:40:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c6838-5cb7-0a2a0a5109dd-0a2a45018074-44
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:40:23 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c6847-c1f2-0a2a45010019-d1558036d9cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:40:23 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so28661555e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 06:40:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe537ccf5sm322098845e9.14.2026.05.19.06.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 06:40:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1779198023; x=1779802823; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8v8u4LmD23Q0kqJA+cqSMyZ6VPpdKXupaYAqEm1/CIY=;
        b=IonWEe4N3c42zAjbRD3sHLGkOd0QsVBuTufalK/0CQ6rUFXQ2M8qepdGf0JcF4637I
         yP+gkM26Nc2g0My8tVs0/wrHpBTKEZwsMYBsCwj9zgfc6PsuB6j8/ZNh3ia2n2+K5ADx
         MMHfwY7xu3NGhFNbqm3XDYT1mSlqluQqX5vMLOVy7fghYCpi1Iee6r8CJa7YFs4yd0PB
         TniF1pY1nu5xketzfhoXMeDjTIDt9k/t5IXgCvadCaw9BUhsDJU6valolLffESdnaWXe
         Z7gU9XyPEIF1Y+XNzrcS65rGl3eLS811g1l97agn+xPJMsgs9qYn4tka4ZPjRypPqEuv
         RpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198023; x=1779802823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8v8u4LmD23Q0kqJA+cqSMyZ6VPpdKXupaYAqEm1/CIY=;
        b=hbRTo+FpZPBmFArhh8DgpXQlGnMBG04P0Z5blS8IeLvLOe4MA/MZ8PwYoAc6ubDZvg
         eCd6ik23bYtUmP03u0Y6IvmHMYgtt+HHCN6VGtXtKnyfSfpoV984+uXWZR99/Ti9piml
         St+9TgG2ksqUrh1DQXiB/8X84GYiyHOncfMacg/SwGbgbLtSyCihP754UfwuBw3/im8h
         rVxezK798jV4M44JKwSQnr6qxYfi944KOliqan5JYI/h9Ttej7Bv2pIOMISZt3wOCHiz
         yBEEEswzVGuOtS09EFra+rf4qjMtWrBNcKmErmkE4WGnUxsL7+Z9mplwZXX1XMgLpAfP
         ll7g==
X-Forwarded-Encrypted: i=1; AFNElJ9pUaDWnKMYOC6XljmJiyGbOxwJCbUaBfDs4YPvrVRi6F4yChNlFS4nSd4PgG48uNLTfvyDbdh9I/Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3E4Yk2mGwdBB/zUucPvzthJV+9/juRX7Icsm2R97DOX2Wipaf
	rqDVj27mepWly+cRzyj1jaMqB0XTme04kG+8wAUnxKX6E9SKv77MZVgqC5/v5SNVdw==
X-Gm-Gg: Acq92OFCLIkzLO/XXpYjgv13VcdLT72U5KygMe6VHn2J6GrW+1FVFRdasaj5ZCPy9xq
	xjaJQKhKQ4JfqWDrWCj2p0gVvkY1utoTU5fik3YYufysxgMxUZ40+AeW5jIUt4xuTmVpQjTAky4
	mbLYFyC1E7NsAJMs8FW75t6rLyRMMjLb2q0qdd2c9mawnVNiKYt+m+I3RPiFf1DU9E8mTXbtFH1
	3BvAc53pmSpJ9wGDGt8Y4nRTiWXApFtJYtOSNhcILq6AdvwCrdpBi8a6eQtDsJEtcADN/zDl6/o
	HA2pGTRzSfegsOBp48VXPmdIykf9wuHsTjEiCgntyeHXarbTuEzlv/ZYCmY9ieGxf+UMjx7UjaJ
	KSXmBDchz+kHJGgSyL7+jS9ngZGvo/4woz5R9C3bR8tWOf7S/fvjWfjoUROheSwBjQ8jpDVNBQH
	65wbhrkd9MpIYWWq9giLEVlWpohEhZabLU5rFHj4dGrTqRDXpxtO7WqHuSGhlGRi7Xn8qK4rkBy
	CIOw+5EpgxvhkXzRY08xe/acw==
X-Received: by 2002:a05:600c:35c6:b0:48f:dfe3:dae4 with SMTP id 5b1f17b1804b1-48fe60e9f8cmr338315225e9.13.1779198023001;
        Tue, 19 May 2026 06:40:23 -0700 (PDT)
Message-ID: <3d9e2a3a-6839-4909-b60f-28b4c1a02cdd@suse.com>
Date: Tue, 19 May 2026 15:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <fbd8b102-d495-4678-8226-a199554e266d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779198023-B7957FF4-45845DE1/0/0
X-purgate-type: clean
X-purgate-size: 3393
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1AB6457FDBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 15:24, Oleksii Kurochko wrote:
> 
> 
> On 5/19/26 2:12 PM, Jan Beulich wrote:
>> On 19.05.2026 13:59, Oleksii Kurochko wrote:
>>> On 5/18/26 5:51 PM, Jan Beulich wrote:
>>>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>>>>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>>>>> @@ -17,6 +17,8 @@
>>>>>     */
>>>>>    #define RISCV_ISA_EXT_BASE  26
>>>>>    
>>>>> +#define RISCV_GUEST_ISA_STR_MAX 256
>>>>
>>>> This looks like it won't be good for very long, seeing how long ISA strings can
>>>> get. I wonder anyway whether ...
>>>>
>>>>> @@ -94,6 +95,9 @@ struct arch_domain {
>>>>>        struct p2m_domain p2m;
>>>>>    
>>>>>        struct paging_domain paging;
>>>>> +
>>>>> +    DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
>>>>> +    char guest_isa_str[RISCV_GUEST_ISA_STR_MAX];
>>>>
>>>> ... a compile-time sized buffer is suitable here. Can't you allocate a buffer
>>>> just large enough to hold the string?
>>>
>>> It could be allocated dynamically.
>>>
>>> Does it make sense to evaluate in run-time what should be a buffer size?
>>> For this case I can't find analogue of realloc() in Xen.
>>
>> Hmm, I see xrealloc_array(), and surely we could gain xvrealloc_array()
>> which we'll need anyway once xrealloc_array() uses get converted. (I also
>> see x{,v}realloc_flex_struct(), but that's of no use here as it looks.)
> 
> Oh, I missed to turned off "full match" during search...
> 
>>
>>> Or it would be
>>> fine just to take something bigger as a const (lets say 2048) and use it
>>> for dynamic allocation?
>>
>> I'd rather not. Can't you determine how much space the string is going to
>> occupy?
> 
> I thought about two options as alternatives:
> 
> 1. Take as a length host RISC-V ISA string but theoretically we can 
> emulate some extensions which aren't mentioned in host RISC-V ISA string 
> so it could be longer. So not a good option.
> 
> 2. Having two walks in init_guest_isa():
>     Introduce the following function:
> static size_t guest_isa_str_len(const unsigned long *isa_bitmap)
> {
>      size_t len = 4; /* rvX prefix */
> 
>      for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>      {
>          const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
> 
>          if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>              continue;
> 
>          if ( ext->id >= RISCV_ISA_EXT_BASE )
>              len++; /* '_' separator */
> 
>          len += strlen(ext->name);
>      }
> 
>      return len + 1; /* NUL terminator */
> }
> 
>    and then:
> 
> int init_guest_isa(struct domain *d)
> {
>      bitmap_andnot(d->arch.guest_isa, riscv_isa, guest_unsupp,
>                    RISCV_ISA_EXT_MAX);
> 
>      size_t len = guest_isa_str_len(d->arch.guest_isa);
>      d->arch.guest_isa_str = xzalloc_array(char, len);
>      if ( !d->arch.guest_isa_str )
>          return -ENOMEM;
> 
>      /* ... existing snprintf + strlcat loop unchanged ... */
> }
> 
> If approach 2 is a good one I can follow it.

This might be yet better with only a single function. Otherwise the two are
always at risk of going out of sync. After all you can use snprintf() to
determine just the size needed; if you go look, there may even be an
example or two in the tree.

Jan

