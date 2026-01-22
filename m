Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN/PLjgdcmnrbwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:51:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B26466DD8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210940.1522521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viu9I-0003L3-Ae; Thu, 22 Jan 2026 12:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210940.1522521; Thu, 22 Jan 2026 12:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viu9I-0003IR-77; Thu, 22 Jan 2026 12:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1210940;
 Thu, 22 Jan 2026 12:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viu9H-0002yV-DC
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 12:50:55 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd5387bf-f790-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 13:50:54 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43596062728so1356469f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 04:50:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997eb2asm45168641f8f.37.2026.01.22.04.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 04:50:53 -0800 (PST)
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
X-Inumbo-ID: fd5387bf-f790-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769086254; x=1769691054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UO7uZjZYmc1bcmXjhuWQh0Sc+e0WOSN2fGwCuajDxzk=;
        b=FDnIDg8AtT6cWo0dgpxjulZkzi8uogPzwZ+MFKE9B12xoVT6vLH3bLxMRrOrggpoKm
         MMAwuzjnA0JydNaTGCfNlpmBlUvRqfZAqZdH8NkWWqVC0s0Wi6Ow2WAClzae2H5dWGqZ
         rQjJS3wsr8wZ3OI7vgn2uMhBRZ6Z66JA12IVaMyK5LVvt0pXXilZ855LlnS/yeD7t+S4
         6EPZeGuxHXzNOao/f32+KsyZ8gZqdMI6lQqRuYMLKinyYqaq8E5RoFNe4u8vXyhIT24c
         lYDPvpkGgEsamKnB1Gw9E4eR0Jt18kW9BtfQ/R9d0dANHq1mH7g7XJT5DNSt4KvKj4X3
         KCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769086254; x=1769691054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO7uZjZYmc1bcmXjhuWQh0Sc+e0WOSN2fGwCuajDxzk=;
        b=SAO+JL9I8+DcjYHoEd+LpLYiikFhFXB+brTzOJ0VDW+QG+vEMZ4+xt8fUsy9Qip1az
         xXVcqN8S3FphThgGAEEv2aF92ONh6ZWpETBi1cqx4r39Xae+/gMF014HM+bkWVC3fV6x
         Y7LfW3jRCq4eobl6qjrgz8FossVYuyIuzjOx95O4txwTS9vezpJtciLpow9oF0iPKauv
         ASilKn0rHXNPzjPb+GuW/QSSaPat4FurT+HoFgI4oGqJXYj131xO4soDWXlT9fIRFDie
         O3bBeIyDX4vIpOJiZcDTFv/kvL4UFClWs0nBui/qlB2dxH4wLqDv85AM7gvnKqrB1Hvu
         a1zQ==
X-Gm-Message-State: AOJu0Ywx1/q2+tMvt/tL60ZSplMH/vZaevrk2+3zeyfPxE7qUoSFfeVW
	AYKHoUmSg4dduJvT4xO32jHD3IMIWi6Ct4+wInbuw7MrOlgn37H4R0YJm7+hfMdX0A==
X-Gm-Gg: AZuq6aKQGsLYlpdpLDhWLgTuUR0xTENmQBZazKZHg6yJ1eaYJ860XOILEnFwBTYIeXV
	TuiIrfZdiq3TQi3Nwq6NkLoD6Wh9/bOl5nXYf8ic58BjMv5rFcgGM+h+Zt5AfHCOy0IYIjiPP+p
	5pj94rCcM7r1aRzjsnu7Xp0T6Noor4Jq0BVYoRHyDTqa5jjmhzbS7hbH467y/ik+nLLlpJoI4Tg
	kBZHfpFQxfFJGT1oyTP0hRZ6qf2j5DDHttznWxs4v3rVFo+foqRK3AMBTb8xUicq7IenBIaWkKC
	gwAPE6ODsI/lQKGhFPc+yMLLgQvM+dhzynopRMvwdQ1i24zxADp+tqHzVbSJvCr2WcQeXn4gEPF
	bKjNWfJV28uXjG1wdwrgOxEh5p+FN7xANAfTIajDnTCM703HgHpcLshKsxnZwrw1uB/JifVNSxd
	ANO0yjEfXbdJrEgn8fGjJ/R+WCti081xBiJ0zU5jwXmfUEDIrtwqk43PZweXRtMTp/WaYeu8MPZ
	80=
X-Received: by 2002:a05:6000:1869:b0:435:a43b:2dde with SMTP id ffacd0b85a97d-435a5f755femr5701456f8f.15.1769086254053;
        Thu, 22 Jan 2026 04:50:54 -0800 (PST)
Message-ID: <a16f4dc1-7685-4b99-a7d0-c36c2df95176@suse.com>
Date: Thu, 22 Jan 2026 13:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] x86/HPET: simplify "expire" check a little in
 reprogram_hpet_evt_channel()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <0bc920e2-2e32-4b3d-9ed0-a2c2b34e9591@suse.com> <aXHrgwifS3PDzdfa@Mac.lan>
 <f87d523c-def4-408f-9626-a268c636e582@suse.com> <aXH3nocF6a8z3ZHn@Mac.lan>
 <73daede9-d7ac-44bf-a018-b76d39b3eeb4@suse.com> <aXIKWwYYXf9UgplM@Mac.lan>
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
In-Reply-To: <aXIKWwYYXf9UgplM@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4B26466DD8
X-Rspamd-Action: no action

On 22.01.2026 12:30, Roger Pau Monné wrote:
> On Thu, Jan 22, 2026 at 11:15:49AM +0100, Jan Beulich wrote:
>> On 22.01.2026 11:10, Roger Pau Monné wrote:
>>> On Thu, Jan 22, 2026 at 10:28:51AM +0100, Jan Beulich wrote:
>>>> On 22.01.2026 10:18, Roger Pau Monné wrote:
>>>>> On Mon, Nov 17, 2025 at 03:39:30PM +0100, Jan Beulich wrote:
>>>>>> When this was added, the log message was updated correctly, but the zero
>>>>>> case was needlessly checked separately: hpet_broadcast_enter() had a zero
>>>>>> check added at the same time, while handle_hpet_broadcast() can't possibly
>>>>>> pass 0 here anyway.
>>>>>>
>>>>>> Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Thanks.
>>>>
>>>>> Similar to the previous commit, I wonder whether it would make sense
>>>>> to add an ASSERT_UNREACHABLE() if that error path is not reachable
>>>>> given the logic in the callers.
>>>>
>>>> That would mean
>>>>
>>>>     if ( unlikely(expire < 0) )
>>>>     {
>>>>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
>>>>         return -ETIME;
>>>>     }
>>>>
>>>>     if ( unlikely(expire == 0) )
>>>>     {
>>>>         ASSERT_UNREACHABLE();
>>>>         return -ETIME;
>>>>     }
>>>>
>>>> which I fear I don't like (for going too far). Even
>>>>
>>>>     if ( unlikely(expire <= 0) )
>>>>     {
>>>>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
>>>>         ASSERT(expire);
>>>>         return -ETIME;
>>>>     }
>>>>
>>>> I'd be uncertain about, as that needlessly gives 0 a meaning that isn't
>>>> required anymore in this function.
>>>
>>> Hm, OK, I was under the impression that both < 0 and 0 should never be
>>> passed by the callers.  If expire == 0 is a possible input then I
>>> don't think the ASSERT() is that helpful.
>>
>> Oh, so you were after
>>
>>     if ( unlikely(expire <= 0) )
>>     {
>>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
>>         ASSERT_UNREACHABLE();
>>         return -ETIME;
>>     }
>>
>> (perhaps even with the printk() dropped)? That I could buy off on, as NOW()
>> is expected to only ever return valid (positive) s_time_t values.
> 
> Yes, that's what I was thinking off, but your previous reply made me
> think there are possible cases where expire < 0 gets passed to the
> function?

No, I don't think there are any.

> If that's not the case, adding the ASSERT_UNREACHABLE() would be my
> preference.

Okay, that's what I'll commit then.

Jan

