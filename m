Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPp2GjMpC2q5EAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:58:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8BB56F62D
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311984.1582150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzQK-0004I0-Iz; Mon, 18 May 2026 14:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311984.1582150; Mon, 18 May 2026 14:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzQK-0004Fz-G4; Mon, 18 May 2026 14:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1311984;
 Mon, 18 May 2026 14:58:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOzQI-0004Ft-O9
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:58:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOzQI-00GYPV-39
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:58:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b28f2-e002-0a2a0a5209dd-0a2a4508ea26-40
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:58:25 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2911-63b5-0a2a45080019-d155dd2ec061-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:58:25 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4526a8170ceso1023684f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:58:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768bcesm40184558f8f.4.2026.05.18.07.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 07:58:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1779116305; x=1779721105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bVh7wBdGdJcnJWgIg8Ugj0xZ3jQ8W4FnLwiuJhQXol4=;
        b=FMVf7fZY1pf8KLPEwf8FzGIppcbi6G9ZDKSIf0CCJbEbHmcBWFfgXsrYXuJFdqcSx1
         TB7/E1FfqX50r2Red8zy99FO5W7mCtfQVxtee03Ysc+Va65ql7s8pQs5rKGkzFnSs0H9
         0qr3Vxxa6jLbyVnwmw/4sBQCJWmCpzRuhh+2pHUIeYdZgsRDdOWJLP4dFaNDg4jcFmLS
         9a7z5pMO7xY51T0ocabumut9ZAJ7NXf8OusLh/KLtdSfa3dvECpxJJxWMeImI0JI5PP7
         W8hfhuiazu0pm4LwCvfbtKoeE51523KWXZ9p9y6DREBUuYXbERU6GRpI3ymTlqIPB8ua
         3Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116305; x=1779721105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVh7wBdGdJcnJWgIg8Ugj0xZ3jQ8W4FnLwiuJhQXol4=;
        b=HWfYOO9PdfNyEQeS2HrYv+JffqCwukXrDO1vst60fpfM7dpbagAVIjeI02VMBaIkBZ
         uKVN19xcbpYtSiZY6mdXjjmfarnlB8GSgTQ191gDrcm41FLb84AyrcIDxI5UHxhDbbnz
         FPV+BF6WOFsI9JIU5DGK/VnamnJN0NvLmzZeA8u6T21ycQEDGSJF1fF2yV8ZYXUrQzcB
         dJXBhu4Uo1jGCDNypGEVThWnC/i+sh0uKBmW15+VV43mlnWc05yyuhM4le6P8UsBs7QW
         T9XoCiz/61JSV+77n6iqiqZGAuOf9Znk6CqNf5E0V7oipAeqQu+0s9E06HF9JecD4vnc
         5yzw==
X-Gm-Message-State: AOJu0YxmsQBDNSPM7G9r7HuIv5XaPAa0GKipyI6yQeR4Vh9JhAtMOX5B
	R9pgZuTkG47piwiRso2JV5LQxOnrD6ByPmNKsJWvAGlDYQcHSHW20xk5DSy5r0MDfA==
X-Gm-Gg: Acq92OHkQ/Rb5wnoFjFiCL5Y4M3Z/7VRlhnfVH80mQSZpFrpP05VHlyFKN5kKsOQ5qj
	3zHukXO3Clj4SE48jc9nMMlbyZT5YBoNyQ0Gr/IzQ3fOeLj6QfvL7gi8j2ixTY8r98dERVsi8EY
	B4z2SVbKCmlVxSlup0HQILXbnM/4QnqofgWVxbXXeB6ZB2P/jueEpdqKcFQ5iKX+WJwR25FL4ju
	iN7/cOC9PF/287CBLLB8bozgwSBjLTqDDS8DZA9txoJNTDKu0147HYzf6jnWNL8co1D8OtUfrW/
	B2h4MiadmDDZ25ND6abW2wtJx58oDuiyLjr62cnnyU6i3eWl3RD4jZTGYGZSPA3mnI25MuQA4Er
	126s7t4K1I53GBPq8gdA7RQu1VkzEHu/SRb6R1BZI5/JprMWAoGdwIiZhvrtV0ydjSZ1i3pFvlU
	W1xF3k+KXmYCt/j5Hx51upiEEkezuh3ncBVjTCd+NWGLE1tLu+7GNCB32PkV3vE914rcHgl8vOg
	tpu8WbuSPcmKO8=
X-Received: by 2002:a5d:5f50:0:b0:43c:f8b4:e58 with SMTP id ffacd0b85a97d-45e5c60d77cmr23374165f8f.41.1779116305317;
        Mon, 18 May 2026 07:58:25 -0700 (PDT)
Message-ID: <51437c77-f622-4934-aa81-682fa06be3fb@suse.com>
Date: Mon, 18 May 2026 16:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/shim: adjust for Misra C:2012 rule 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <fddf4e43-8b8b-4b89-97b9-24deb46e2c9c@suse.com>
 <8fc9b5efd6c83bc2aadbe058eed83615@bugseng.com>
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
In-Reply-To: <8fc9b5efd6c83bc2aadbe058eed83615@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779116305-B7171DB1-097A4195/0/0
X-purgate-type: clean
X-purgate-size: 794
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,bugseng.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BC8BB56F62D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 16:33, Nicola Vetrini wrote:
> On 2026-05-18 13:42, Jan Beulich wrote:
>> ... ("A macro parameter used as an operand to the `#' or `##' 
>> operators,
>> which is itself subject to further macro replacement, shall only be 
>> used
>> as an operand to these operators"). Leverage the SAF-6 annotation we 
>> have
>> available.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

>> ---
>> As per the placement in arm/tee/ffa.c two instances of the SAF comment
>> (ahead of the macro definitions) should suffice. Eclair demands one
>> instance per macro use here, however (much like we have it in
>> x86/dom{ain,ctl}.c).

Do you perhaps have any insight on this (apparent?) anomaly?

Jan

