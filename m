Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ImMA94ci2nSPwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:56:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CBC11A731
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226333.1532879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpmLJ-0000as-AI; Tue, 10 Feb 2026 11:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226333.1532879; Tue, 10 Feb 2026 11:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpmLJ-0000YB-7T; Tue, 10 Feb 2026 11:55:45 +0000
Received: by outflank-mailman (input) for mailman id 1226333;
 Tue, 10 Feb 2026 11:55:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpmLH-0000Y5-Hs
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 11:55:43 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c379a01-0677-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 12:55:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-481188b7760so39321495e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 03:55:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7d6f3esm49150105e9.9.2026.02.10.03.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 03:55:40 -0800 (PST)
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
X-Inumbo-ID: 6c379a01-0677-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770724541; x=1771329341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uCHdn05De+Ja3bVZEpQ+mQshmsiuK4zlWvBTJkJGEjA=;
        b=cDT30Gq3zo5A2BeVYLQX8n8STvkC//NIX8214XHC8AGl5egj9FR8Gxb7/UH3tJMiJM
         W2hzxOUpJdSQ2A4HgpaOZRAmIlnhWAr/sMJkXppdTErZBjFwPko70GAgxw1dMT5ESZj+
         +lsP9lP51H31yX4eKWmAyDVH23TmWMzDes7ZfTrzonqVBgIYj9eqkXapeyHyPNA8zYcs
         QRPXBij0AL1KaXQc5J8gF1WZpVM77WuSLiVvpRYD6wRuoGqtv5O+OrUXBnT7P2gGwbjB
         SxsEn0ko899X+ebBBS18lBNW8YV8xsger/1x5dxPnci+WAk4j7oc1GLrKjcOCfpIR33s
         Bbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770724541; x=1771329341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCHdn05De+Ja3bVZEpQ+mQshmsiuK4zlWvBTJkJGEjA=;
        b=dXVdNbmHoh021zo1f92ki7dccM+y7BdiNvR9kvBqaIP/qiXP3efIzbnHJlIWGa+NKK
         5Hb8Gvajvi2j/WBpiaPB8PBb5K3m5GjgCVRw9U+fJ+qMSE80I9N1MGAzW7aITkM0z9jZ
         VZQF2CTU5yICkSGludPHRQ/uVqfPdTk13Qnq0WfAjoYh0P7WbkAHS8/3Q6IaXtWCK9cJ
         YqqNrlzfYjd4HuYxHAqLvyQoRz7olYXDRNreeXDbmoEgFsv125bkKXYnisYgtcrLt9jz
         6YgdGZ0n1B6gu2sXfDLOQkvc6DRGdGPtrbDesKqefY6we3dpTul79gsmFi0zr8AWreyW
         dpxg==
X-Forwarded-Encrypted: i=1; AJvYcCUDBhBYJnIVz6BGhbJpZxWyIPwf1Z3+/XLcU+8MjlPqXQ1BDrLRXczqf0qghReW8P3Lq+5BkoJzc/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4jeaycbuzEQlMeu27exTygQi1CrQcBkXlOnhF3ZVXM4vK2vb7
	YuH1VGPV4+YUTa6JXLcJ1LAQ0VWy29oDY+LFIbFF7d2OIkgyuFsma60NP2VEalhjkA==
X-Gm-Gg: AZuq6aKaBa8Bu5I1tJvjcqErQBd3hDf8mRleC3oAKjScbBIEOuVWSdAtUyoTQ7q4FQo
	AKDr0Xp8P7ulW1/ipw0lhRMpwaEV9HzWnZdzRJBUOPkpiws98kLKE0+qQuHnaron4sZ00kxAfq/
	ItISvFl3rb84Btyny4m4Qvo9+SS6aVtqSHSU75LHIbm/y0q0peY7+HBiqHqNwMBwWRd8sKTT0tR
	UZrNOq8QdRviiU2Ox59qsGArhjhAkd393jQeZsJK7op52eZve0Irm5UdEDYR2Kv4AQukd5NqTiK
	2vI6+M9BPzqp0jDFUQ33UcWJYU/1Ri1oZHHn9p1UUYL3YDJ+6W0qvEUA6e0ZSkR6ejbWvyEk/Av
	eWP7cDjCX4mfggLGVoz50BjkgnATOSkxzi3180DV2tWfHZ999Ujp6j2g2SPQcn7x/w/xOZQ57uF
	ydZGgLnvIxequ/Qt74I2nMpC8uxUiiJ3csXJHXYYSw0Naq8cvdSjT+KLQ5BF+gHa9VoNKd2RRZL
	XTOhvFvzX1r/Pg=
X-Received: by 2002:a05:600c:1388:b0:483:a21:774c with SMTP id 5b1f17b1804b1-4832097808dmr203919415e9.25.1770724540667;
        Tue, 10 Feb 2026 03:55:40 -0800 (PST)
Message-ID: <82adaa8a-b7d9-40fa-b59b-0851776fb59b@suse.com>
Date: Tue, 10 Feb 2026 12:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for
 FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-8-andrew.cooper3@citrix.com>
 <e314d193-79f2-4d77-a2ed-1590375b4b96@suse.com>
 <6786174e-e00e-46fd-8b82-7eb823ad96a8@citrix.com>
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
In-Reply-To: <6786174e-e00e-46fd-8b82-7eb823ad96a8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:mid,suse.com:dkim,suse.com:email];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 57CBC11A731
X-Rspamd-Action: no action

On 10.02.2026 12:15, Andrew Cooper wrote:
> On 07/10/2025 4:58 pm, Jan Beulich wrote:
>> On 04.10.2025 00:53, Andrew Cooper wrote:
>>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>>> means that switch_stack_and_jump() needs to discard one extra word when FRED
>>> is active.
>>>
>>> Fix a typo in the parameter name, which should be shstk_base.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
>>> to parse as an instruction immediate.
>> I don't follow. Where would the 2nd $ come from if you write ...
>>
>>> --- a/xen/arch/x86/include/asm/current.h
>>> +++ b/xen/arch/x86/include/asm/current.h
>>> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>      "rdsspd %[ssp];"                                            \
>>>      "cmp $1, %[ssp];"                                           \
>>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>>> -    "mov $%c[skstk_base], %[val];"                              \
>>> +    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
>>> +                "mov $%c[shstk_base] + 8, %[val];",             \
>>> +                X86_FEATURE_XEN_FRED)                           \
>>     ALTERNATIVE("mov %[shstk_base], %[val];",                   \
>>                 "mov %[shstk_base] + 8, %[val];",               \
>>                 X86_FEATURE_XEN_FRED)                           \
> 
> I find this feedback completely uncharacteristic.  You always goes out
> of your way to hide % inside macros to prohibit non-register operands.
> 
> This is exactly the same, except to force an immediate operand, so the
> length of the two instructions is the same.

Thinking about it more, are you perhaps referring to assembler macros?
There indeed I prefer to have the % inside the macros; the same may go
for $ there, but I don't think we had the need so far. For inline
assembly the situation is different: The compiler emits the % (and also
the $), unless special modifiers are used. It wouldn't even occur to me
to ask that we use %%%V[val] for a register operand. That really is the
register equivalent of the $%c[val] that you use above.

Jan

