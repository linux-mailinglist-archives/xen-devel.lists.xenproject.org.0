Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BTH5ECN9T2oeiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:51:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9B72FE15
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DqEZitlu;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357940.1612259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmLN-0006kI-Hm; Thu, 09 Jul 2026 10:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357940.1612259; Thu, 09 Jul 2026 10:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmLN-0006ha-EQ; Thu, 09 Jul 2026 10:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1357940;
 Thu, 09 Jul 2026 10:51:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whmLM-0006hT-5h
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:51:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whmLL-003GEE-Ih
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:50:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f7cff-bab6-0a2a0a5309dd-0a2a450bb05a-16
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:50:59 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f7d13-ac48-0a2a450b0019-d1558029bc58-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:50:59 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so6019135e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:50:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a5d174sm152617145e9.2.2026.07.09.03.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 03:50:58 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783594259; x=1784199059; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9MPQwdIV+Nu7TcVBl8DF2RO+FoikfaRso3mr6SfkoI=;
        b=DqEZitlun0ijAXIlXspLT9TB83lvEbHdZijnUWT4k5o5qVScIi+W8i4rYSs6mZ7uTO
         czDqhjCpdMwN5MZrbJ55bnkpqhhDo0Pzxx+KOcjnpMGnfbS5Nm1NzedXrtqosuN+xmSU
         3QeDPTIS4ocLyPAz9WpgrILJ4icnoi5sDR1hUew/C/wjsBvCky4qH/9OQUAOMwece9Ye
         Xbpi3Dtwu64SA8Dtw7IWOdSoQvBX7oFjC/mTiuAVZJYgcsnqbdtq7my7elfq56q9XRsm
         mtwntsHQdibnwgsEujo8VT7hCScDQRWTgQyNVMlal96R8nejD5VQLwzyvBlZC3TU0WkM
         2DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594259; x=1784199059;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9MPQwdIV+Nu7TcVBl8DF2RO+FoikfaRso3mr6SfkoI=;
        b=RxwjflYdL8BtDvwBmukgZq4aBFS0b8erPFjnc17It6yDwc2gTKBrKjaawQnpPKGMbk
         qZEw/sSFVv3BX9b9WvIZrQ5EWsFZeXllBkw6ozUqdmmfE9/Q6qP61ex+/OfzHemiH3iD
         Dmlgjv968nNQJBP60HiBf7Uv9ZoGDUxxsiYpAWacUxf84bDpH6fBamQgmfkI7t/vvI+e
         C+Spzqkph8Q+ltzA+xyEA848SYEJ1McWkvPL2ALVzBn8Q2H9W/VRTle/gRF7M0FSjzgM
         gVrlWmL2kC7GQwDtEg8j0W0ixK34ZjWj+to6h68+6uSzYwJej6roArb/E7MlM+rSmcRP
         gSrw==
X-Gm-Message-State: AOJu0Yydcci28/d5DWNEXn/gJtcE2k7ao1ohYFiy3zZd7Z9Ainmjm9Tu
	/H4I+NSbRtKa3cc3V1bMI1yeQNg7bYIyFtr2lALiQQXXo3RrYRPN/PHe+EV+wZvU0SdsE7yb+Fo
	qgL97Ng==
X-Gm-Gg: AfdE7cmT8FGrQNslk7of7q6qF4OLfA0jpmELREv+CP1pQHlAbA1UtdpJEciKIQFCuky
	Fw1OBOKB816AR8SWr5R6U1pIaDcqgjfXKWgvafMjVxRXbrdD/Bx8EQQNXjyb1ABtnZ6nJaDoGW5
	fVYaOxxPDRfHDn3ogv1mgVOCXHVSLgVCXGc7yd/zSoURUGZZeV11qF9Up84wFyvnPHX5Lk7W4BK
	ocrTiNfq/mmjDHNnRWmwGZzNuy3q0oP3xIUYSHLj5mQx7kscoveLV3BX74d8buv24Oym8aDzmth
	/sHt1OFVyqoWRe5txGWPWsxjrFnOClBPrmaD4CJFZ7QLxurKlGs0KdgbtqxFy5dlJb8uW9fmFgy
	OhDn05OSC+m5FZm2E/zA73CL+zg770mWM3Ia9c/xcbL2Tc0uuwKzxC9cV8OFVEfyWYkko4b3ix6
	CBL2KmqXwsW08N/hsPmDsc1fdhE7gO7KpcjnJVvLHGAP5fhhW7O9FF8Wa6tvOZqZaXMWJ92nJD4
	USa
X-Received: by 2002:a05:600c:6206:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-493e68c3aecmr64379895e9.14.1783594258887;
        Thu, 09 Jul 2026 03:50:58 -0700 (PDT)
Message-ID: <fc7508e4-2170-4928-9fca-060d7c6f4863@suse.com>
Date: Thu, 9 Jul 2026 12:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
 <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
 <d6dcde3d-99eb-4fa3-9078-a13e35c8a1b4@epam.com>
 <b0738b79-2a9f-4571-8465-bfb00123300f@epam.com>
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
In-Reply-To: <b0738b79-2a9f-4571-8465-bfb00123300f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783594259-4014E220-99102854/0/0
X-purgate-type: clean
X-purgate-size: 2922
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	RCPT_COUNT_TWO(0.00)[2];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CB9B72FE15

On 09.07.2026 12:00, Dmytro Prokopchuk1 wrote:
> On 6/22/26 13:29, Dmytro Prokopchuk wrote:
>> On 4/10/26 09:04, Jan Beulich wrote:
>>> On 09.04.2026 19:37, Dmytro Prokopchuk1 wrote:
>>>> MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
>>>>
>>>> In certain build configurations,
>>>
>>> Can you give an example where ...
>> If CONFIG_VM_EVENT is enabled on ARM.
>>>
>>>> the function 'altp2m_vcpu_idx()' is defined
>>>> as an inline function that contains the 'BUG()' macro. This resulted 
>>>> in a
>>>> violation because the 'BUG()' macro makes the function non-returning.
>>>>
>>>> To ensure compliance with MISRA C Rule 2.1, this patch removes the 
>>>> inline
>>>> function implementation and its BUG()-based unreachable code. It is 
>>>> replaced
>>>> with an unconditional function declaration for 'altp2m_vcpu_idx()'.
>>>
>>> ... a declaration is needed? The sole non-x86 reference I see is from
>> Yes, declaration is needed. The file 'common/monitor.c' contains a usage 
>> of the 'altp2m_vcpu_idx()' and compiler must see it to avoid "error: 
>> implicit declaration of function ‘altp2m_vcpu_idx’".
>>> common/monitor.c, and the sole relevant Kconfig option I can spot is
>>> VM_EVENT. When that's off, the file won't be built at all.
>> But when 'CONFIG_VM_EVENT=y' this file is compiled on ARM.
>>>
>>> Further, BUG() and a few more constructs have a dedicated deviation
>>> already in place. I don't mind a useless function to be shrunk (or, as
>>> per above, perhaps even dropped), but the justification then needs to
>>> be different.
>> Well, with Stefano's comment regarding return type, the commit subject 
>> and message could be rewritten like:
>>
>> generic/altp2m: align and simplify altp2m_vcpu_idx()
>>
>> The return type of 'altp2m_vcpu_idx()' in the generic altp2m.h header is
>> currently 'unsigned int', which is inconsistent with its 'uint16_t'
>> return type on x86 and the 'altp2m_idx' member of the monitor structures.
>>
>> To fix this type inconsistency and simplify the header, this patch
>> replaces the static inline implementation of 
>> 'altp2m_vcpu_idx()' (contained a BUG() stub) with a simple function 
>> declaration returning
>> uint16_t.
>>
>> For architectures using the generic altp2m.h header (such as ARM when
>> CONFIG_VM_EVENT is enabled), common code calls to 'altp2m_vcpu_idx()' in 
>> common/monitor.c are guarded by 'altp2m_active()', which
>> statically returns 'false'. The compiler's DCE will optimize out these 
>> calls, avoiding any linker issues for the missing definition.
> 
> Hello Jan,
> 
> kind reminder. Please, take a look.

I did, back then already. No specific question was asked for me to answer,
so I was expecting a re-submission, allowing to see new description and
code changes together. That'll then make it easier / more natural to
comment on.

Jan

