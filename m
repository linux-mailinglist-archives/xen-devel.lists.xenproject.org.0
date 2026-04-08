Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDVMFbw71mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:27:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36703BB394
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275749.1561492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAR4G-0006Y3-JC; Wed, 08 Apr 2026 11:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275749.1561492; Wed, 08 Apr 2026 11:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAR4G-0006W7-GU; Wed, 08 Apr 2026 11:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1275749;
 Wed, 08 Apr 2026 11:27:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAR4F-0006Vz-6b
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:27:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAR4E-005guk-Io
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:27:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d63b91-bab6-0a2a0a5309dd-0a2a450ca434-46
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:27:30 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d63b2a-f40c-0a2a450c0019-d155dd36d1e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:25:30 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43cfde3c3f3so5923938f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 04:25:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f08sm60438329f8f.6.2026.04.08.04.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 04:25:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1775647530; x=1776252330; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SBdtrVKnRDnuCZ5SKaN1WgYqxSH99iwR1eEH7wK1pxI=;
        b=Z1OI6+u6uuUIecuDuxiuNmmcNxUw3H6AAh3IBNFjrbItn4nSScgG0ZhYPr9xkrp6EL
         2jIH9DW6RUonMGAlCvkHHnuiSiMqOYvyYdiK5+/KmaA/WrYVKUFVuJRAa5FeXvavfKFk
         FUQzd2SYTvpo3qhJxWPqQTwC2eJj1MoXdx4zhln0LBdxVR4VYcGWd+MzSsoEhO32SqzJ
         Pz+ovfnK9ChYXXi+wFldEFxwl4PVeOdala0RNLdhYMREr33dpCfzPNK8x734gvaKOOSF
         GIpwHvGfsi5olblYDBkzYQR+fRPhjJ8Dlv93XMW+uMsZ4tIFf7v3IzfSA09uAm6Sr/G8
         CDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647530; x=1776252330;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBdtrVKnRDnuCZ5SKaN1WgYqxSH99iwR1eEH7wK1pxI=;
        b=rxOORMA2ndl9VhxKy43jVQpsrbPIfzRdfsTMB3iCOAnjS4xnIvYQB6DlmA4BRLlsAv
         5jnvfq6kKk/S4YFzHRBC9IKxr654Vdpwl8aKUyRZmC1n3ZxPJSKHQOhQL12FbpkQUW56
         6qc0EcdHquXpJizqPSR5DsQ488BhW70OsVb/+qxP1dmHm4OntgztwsMevohKgs5pESK+
         hRkGvzioYnjdggWV8Tvi807mYiCcOcVYBh854zY28XqZQqsCp4kVy8+A0/rCS4jd3pjd
         FJziqvGj9YbklGXJgshfNcRX4j99xU1kdgCNIrdxEKB8SjHRes2/PBrGIQWK0vDeNsGf
         PKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHXgwBWYfAqCoSURY7kCJ8OI6L9Zip2xWIsZEGNXNDBJtxqdX4cL/pc24dpiP4m4YDzO4QE0tJ+/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOD97a9gRFb5E4xcDtTUZHh8RPPoTRVBXT98GDo1JGLQ32n3ih
	KyIcjwmWM/+dHH2+dsa0T9/WUjz2BUHSWYeic6Vai2auBqXzcRWNcoLcE7swQbgSFg==
X-Gm-Gg: AeBDievdQEU6RMGxw3+7sQE1SGsi2th3tavwphQJTnuOS5VG2+rwk4uxskc9svG9IVm
	WwgLZ8FrEcgqOhiJGuQfQy+JbqVLzqNIe6QoUEf3cMd0GNgYWu1cNk8o0wAEDqE7zNaFUTo+Mn2
	UYqq8gA8/aW4p4WlHWfUIeTwoTALefiWEavQxUdEZrGWmUtcMl1+V1qxs1HpRqgTgNhqUFFq6mL
	Y8Vv5LUjtWqDoZw+U+3MuEpEB9fekT0taGlOaEknV7UebzNytpU9edoZxGghSUZEVEq4c6jIK93
	1+Z6JHS8cHyWoCf/0Qk6GTCu3e1daXfEIU1HbcoGPwQH1VFPCS9MneDk8ez2vQKo0A/1K1JDLvr
	PER2JhbQb+UalfW9aY7u6op4+RClNS6VM2Un8RqMbWK/qQnE5RMPTe2NftrzE/qfRiK9iba9c7b
	7IdxP+zq3YqWxdoD68JPexNHcHwo8eE6iSDz7laACANyBn5zT9KvlsxbHx6B+ZEnoKMcJSf0jVV
	QdPXpnoHXZU/7U=
X-Received: by 2002:a5d:5f85:0:b0:43c:f7f6:6016 with SMTP id ffacd0b85a97d-43d292daa51mr30310863f8f.32.1775647529378;
        Wed, 08 Apr 2026 04:25:29 -0700 (PDT)
Message-ID: <2830de65-c037-439b-a9ff-bfe6d9cce212@suse.com>
Date: Wed, 8 Apr 2026 13:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/riscv: allow Xen to use SSTC while hiding it
 from guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <ff0e2e7332d5b887d00ad10caf01952f90f5da5c.1774863161.git.oleksii.kurochko@gmail.com>
 <df6fb4f1-b420-4b5f-90e1-dea9069311bf@suse.com>
 <e69e8de7-dbcc-4839-bff6-866c3fa50ea2@gmail.com>
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
In-Reply-To: <e69e8de7-dbcc-4839-bff6-866c3fa50ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775647530-FDD53A3D-800E6822/0/0
X-purgate-type: clean
X-purgate-size: 2574
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B36703BB394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 12:58, Oleksii Kurochko wrote:
> On 4/2/26 8:41 AM, Jan Beulich wrote:
>> On 31.03.2026 21:04, Oleksii Kurochko wrote:
>>> @@ -61,20 +73,7 @@ int reprogram_timer(s_time_t timeout)
>>>       if ( deadline <= now )
>>>           return 0;
>>>   
>>> -    /*
>>> -     * TODO: When the SSTC extension is supported, it would be preferable to
>>> -     *       use the supervisor timer registers directly here for better
>>> -     *       performance, since an SBI call and mode switch would no longer
>>> -     *       be required.
>>> -     *
>>> -     *       This would also reduce reliance on a specific SBI implementation.
>>> -     *       For example, it is not ideal to panic() if sbi_set_timer() returns
>>> -     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
>>> -     *       without SSTC we still need an implementation because only the
>>> -     *       M-mode timer is available, and it can only be programmed in
>>> -     *       M-mode.
>>> -     */
>>> -    if ( (rc = sbi_set_timer(deadline)) )
>>> +    if ( (rc = set_xen_timer(deadline)) )
>>>           panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>>   
>>>       /* Enable timer interrupt */
>>> @@ -85,10 +84,17 @@ int reprogram_timer(s_time_t timeout)
>>>   
>>>   void __init preinit_xen_time(void)
>>>   {
>>> +    unsigned long tmp;
>>> +
>>>       if ( acpi_disabled )
>>>           preinit_dt_xen_time();
>>>       else
>>>           panic("%s: ACPI isn't supported\n", __func__);
>>>   
>>>       boot_clock_cycles = get_cycles();
>>> +
>>> +    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
>>> +        set_xen_timer = sstc_set_xen_timer;
>>> +    else
>>> +        set_xen_timer = sbi_set_timer;
>>>   }
>>
>> Doesn't all of this together eliminate the need for sbi_set_timer as a
>> separate global variable?
> There's still a need for that SBI-level dispatch. However, sbi_set_timer 
> doesn't need to be a global variable (exported from sbi.h). Since the 
> only external user after this patch is the time.c, sbi_set_timer could 
> be refactored into a plain static internal pointer with a non-static 
> wrapper function:
> 
> // sbi.c — keep dispatch internal
> static int (* __ro_after_init sbi_set_timer_fn)(uint64_t) = 
> sbi_set_timer_v01;
> 
> int cf_check sbi_set_timer(uint64_t stime_value)
> {
>      return sbi_set_timer_fn(stime_value);
> }
> 
> Do you mean this?

No. Why is it that we'd still need both set_xen_timer and sbi_set_timer
as distinct variables?

Jan

