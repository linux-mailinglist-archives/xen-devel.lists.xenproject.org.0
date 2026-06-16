Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4AMZG53qMGrSYgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:18:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63368C718
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GlcssZrx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338657.1599687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZN6Q-0002wJ-Ri; Tue, 16 Jun 2026 06:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338657.1599687; Tue, 16 Jun 2026 06:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZN6Q-0002u3-NF; Tue, 16 Jun 2026 06:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1338657;
 Tue, 16 Jun 2026 06:16:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZN6O-0002tx-VJ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 06:16:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZN6K-004EYp-V8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:16:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30ea33-e002-0a2a0a5209dd-0a2a450cae18-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:16:44 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30ea4c-62f1-0a2a450c0019-d155dd2addbb-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:16:44 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so3101737f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 23:16:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f309sm39518222f8f.14.2026.06.15.23.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 23:16:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1781590604; x=1782195404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Qx29apA+FKhNRV7HHzoMBSrTmjvf5CKFT/qaonk3Ag=;
        b=GlcssZrxEj7QdH4aIGWWyO7yYIPBFo5QDoNrNmiiIkwTB9M1IxeC4X99Z9PavR9Usf
         yqXyBBLNQXzaNRqcb80QZPrhZmkRi42iXJEi37iRf/F+YudpDzV7D1n8zyN1uWtvbkb8
         XcjJAEheGJ2uAO/rli7gAsfCHeJ654gQuDBaxCa1ETiElbVCkosBfWqgaMA1hQbL9XFA
         hmNtTNT1pfIudp9L+poCTApDaUYQYfQiar1I8+lxPLkSHRuR7TLgv71UPp9DLAtQqKQv
         I2XK7txoVfjbO3p9/P2QuEo4NymKrY+D9YGu02bzMqDYJcsdjAWGesjB/JrDYoasJKgC
         ISIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590604; x=1782195404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Qx29apA+FKhNRV7HHzoMBSrTmjvf5CKFT/qaonk3Ag=;
        b=MgcwFRk9ZKQ4PDbBwwTpU7AwkNl+4fzuzG0oM04WC/EbNAqUpp1DxVDnQlFlMleRW6
         ziXvJxqt8cUE++35xr9Bk38dCdQDYbDh39ZWMJCDIl4FCn5GM9EXtrrOYeHeyeRN5X5J
         Szw/zHu3JQ2nvUUEIkl4Z/YlH77fPeBR5YPi6EWaCeBy0jj0oyvc1hgA8OsktREEdwwl
         iM6+4wAceyOfP7ywAzvC/M6CaAzE3NLCXItOpKkP9eLAhnueBJcgsCq1Tf/1M4ArjW0k
         lNLgSw9LkNf/Ict5szieye0BZEF4ErGv4GJR/XkntiJ8hSRXdScDvTxiypfMMf0uXatT
         YUbw==
X-Gm-Message-State: AOJu0YxOww2bGW3Uh8udmq/CA8v3CAr5LGwYQlI6YCQuzeU+xDazU8d3
	mUrhBjIc79iMi09WOKhUtm3cpzyzv6SffaOtuAGl7U2nr+YBH4v6dMhuy0TU2a/Y4Q==
X-Gm-Gg: Acq92OFhNpalS4rVQM6yG63Bja9HWD++gb1AWy2X1V6sefB7wPCQe6BTz1L3W04SEYp
	2BvKB3CZORFgw0Iv3SZqBBpsQLSKD+2lqfKgt+ud8vzzWpYT1ca02cXbwoXbz1Ao/hEwSrmvXEu
	XmsMIm27ZL98irGdOhW7EBZOycKUySUJBS0gWwyMUKO2sfPlPJMgpxUNL2k5MF3FhTsx42RILbw
	KFKtF1UwvqVmK7J6JzC+BcS6wCatT9CwAqzFL0ft1ZrFbLyMjkaIJpWVXK/EwYDKBUAx6VjCozd
	mUz3WKVXvaQNEd0PBaiBgoW2w5eUIrYvGpqmVfrkdvE3O82C2P2jfXz0BkrZS0XPBKDIMeqVAfa
	XZVH1qIaztAUMUGErmkQxC3bEfBGrFtREH/YQo0DlZ5oOyn+5pQ6WTLK+8cXNcEVqtC+v3ZNjTF
	D/gWDauElpZnNyWTxPw2lbul7KFvxvWQP9F3t4bEBxzVQbbnfFsi7jMVXvgH/MNLM8sEtSdP3aP
	vfQUSO+fO4EHW4=
X-Received: by 2002:a05:6000:15c1:b0:460:71e6:e11 with SMTP id ffacd0b85a97d-4619f3afba7mr2989189f8f.24.1781590603580;
        Mon, 15 Jun 2026 23:16:43 -0700 (PDT)
Message-ID: <0037ce13-8db1-4855-8ef0-dbeefba54fab@suse.com>
Date: Tue, 16 Jun 2026 08:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ross Lagerwall
 <ross.lagerwall@citrix.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl> <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
 <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@vates.tech>
 <ai-_jUw0QmdC7gPK@macbook.local>
 <1781534374.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@vates.tech>
 <aea699f2-c869-4301-b67c-ddea1e08ae9a@citrix.com>
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
In-Reply-To: <aea699f2-c869-4301-b67c-ddea1e08ae9a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781590604-E3D7BCF5-3D15A3B4/0/0
X-purgate-type: clean
X-purgate-size: 1487
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB63368C718

On 15.06.2026 19:02, Andrew Cooper wrote:
> On 15/06/2026 3:39 pm, Anthony PERARD wrote:
>> [06Ah 0106 001h]         RTC Day Alarm Index : 0D
>> [06Bh 0107 001h]       RTC Month Alarm Index : 00
>> [06Ch 0108 001h]           RTC Century Index : 32
>> [06Dh 0109 002h]  Boot Flags (decoded below) : 0033
>>                Legacy Devices Supported (V2) : 1
>>             8042 Present on ports 60/64 (V2) : 1
>>                         VGA Not Present (V4) : 0
>>                       MSI Not Supported (V4) : 0
>>                 PCIe ASPM Not Supported (V4) : 1
>>                    CMOS RTC Not Present (V5) : 1
>> [06Fh 0111 001h]                    Reserved : 00
>> [070h 0112 004h]       Flags (decoded below) : 000004A5
>>       WBINVD instruction is operational (V1) : 1
>>               WBINVD flushes all caches (V1) : 0
>>                     All CPUs support C1 (V1) : 1
>>                   C2 works on MP system (V1) : 0
>>             Control Method Power Button (V1) : 0
>>             Control Method Sleep Button (V1) : 1
>>         RTC wake not in fixed reg space (V1) : 0
>>             RTC can wake system from S4 (V1) : 1
> 
> There's 3 pieces of information on here which confirm an RTC is
> present.  Setting RTC_NOT_PRESENT is clearly a bug.
> 
> We should probably have a quirk to ignore RTC_NOT_PRESENT on this system.

Imo we should go that far only if EfiGetTime() didn't work there. Afaics
Linux also has no such quirk.

Jan

