Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PjLaOlHjM2q4HgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:23:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6669FFE1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:23:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NMGCu0gk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341051.1601615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBmN-0002Tf-2I; Thu, 18 Jun 2026 12:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341051.1601615; Thu, 18 Jun 2026 12:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBmM-0002Qt-Vo; Thu, 18 Jun 2026 12:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1341051;
 Thu, 18 Jun 2026 12:23:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waBmL-0002Qn-DU
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:23:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waBmK-003vhC-Cp
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:23:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a33e339-e002-0a2a0a5209dd-0a2a4501a804-14
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:23:28 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a33e340-e031-0a2a45010019-d155dd2edc68-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:23:28 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso661177f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 05:23:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d70sm63151469f8f.19.2026.06.18.05.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 05:23:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1781785408; x=1782390208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JaITbc/yY2MWdF6t7F2eR4oxm72TOgLMlgZ7F99VRcw=;
        b=NMGCu0gk4zTOyD9g4EhUR2JhKJwopMlN80jqWQ3+X259jnQ4Wfq8pCGbZX+Ui7VSRc
         cpcb2lzTHwBUqSJODGoTs5Hzn9sRVH80GtBaAQFtMzuW02fbrwBN/nwisD76V3yHQnbV
         kdxZ2mv1+9J6UezdhIm7Fs2dXLUEe347x2sZDXew0clOEuMrzpX1iCyDdwtEsH5oFCpW
         csKo2rJ46VRzMFObiGsm1xvyQXrH2/LBt2Vp9fTegOLJ+qPwcM9axMvSp0ofdpHENzIh
         N9sE6I35D7Lz7rohTJYqt6wi929vgu1kW2tPWtSKKy+4bKkaFKLwgTphH8g71IhFUK/v
         q6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785408; x=1782390208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaITbc/yY2MWdF6t7F2eR4oxm72TOgLMlgZ7F99VRcw=;
        b=XdoVkZy/6zxUi5aBPWwnXbOreLlBGeTJNdMXXBBKnOLwdPgC29qx3W+aEGPmW1vHf/
         nyJWmZsmnlpr4C7Mp4te+v+XMErcqDV2OcxruXe+qySoaTFBUN4ZPGuov0R60hjPO7UO
         8oQKd9f/6wnQeoYFcErZibDleyi7O7ak6s6Fx63U2V/Ykpq+VYOiREAK01sQjjvpnLpm
         4pCMkGzWFUMUtg0R7UATTgmAjayBs/2ersdtHx/BZyQeKq9jofe/qvAvfqiFUM/VgG52
         YANFRGHsyedoBXj9FjX3DYZD4omxkvvsqHwjMeyJba5dT2XrQ3XpKvaklA29um67X3do
         GGgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z2WTMGhC36HH34ZKiOUTJ7xGAT8r+keNxe21xrtqBntBuIrZvQ85rKBR06/o7s6RUNNeXoOy1X9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/ZkJ2kvQj2Jru6dNEiamShIAUc2hoBsTK8Wxo9qrHWE+rIDmv
	ClprNJ9WwuvI5ZK43Ty84IdUiZ7uWvE6E5GJqijz0W0/BCpnEK06LKyFMoL2dP85Q2eYI3ykjnC
	zquM=
X-Gm-Gg: AfdE7clTC4H0SyWiBXLwb9uAgmRM/BWx+BKIfBvizKGHW8HZC43ktt2Bx9rDcGWGC8K
	OLsZdVzTk//NVrc1LloAEd/94u4egE1PwRWs2TsYx4jbppuFrn8B4ICibJXlswmXF5UkLO1iKKJ
	xrlqxTzGoLXv+wxood5amVFMq8wV4Ujr85ZfQAr2VlR/+qfnQLF5EOCxHfgmEJHddnY5h9iX3Ss
	d+CXvtOkSECxzr0SHIhBhBVNf5vhnA6FMBFpx55qEqumPUbiNzBDCaJoI6+sz5E9XBLk7Zqbyvf
	N81C8n7Zj8mYl5cv4HKgzplwpIxyiVdporakDMetIFq/Grb7Y1suaajrAvZVKhNj5aUSpjX29Pk
	eO0/jIrbJA+UABkIxHJ8ZdY+86zKWhu/gKrqO1g7LJu7e65Q2SMO/wPpmGjDw7NBc99F+0d8KPh
	gQGQAdfNyj0jwgG+KSF45/Pt+pSNZ4LCtsw1RJmlHOsS9PDHFHrTDZaVnxEVAUXUTeflqp1oymq
	80SyZ9TlPGJnR8=
X-Received: by 2002:a05:600c:c491:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-492333bf72cmr143085065e9.11.1781785407628;
        Thu, 18 Jun 2026 05:23:27 -0700 (PDT)
Message-ID: <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
Date: Thu, 18 Jun 2026 14:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
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
In-Reply-To: <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781785408-493B8E30-87AF1118/0/0
X-purgate-type: clean
X-purgate-size: 1802
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BC6669FFE1

On 18.06.2026 14:13, Andrew Cooper wrote:
> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>> hypervisors.
>>
>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>> those for xsm_page_offline() (where the hook pointer field already is
>> suitably guarded).
>>
>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
> too, which should be able to spot things like this.
> 
> This is a regression vs 4.21, so does need including.

Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

Thanks.

>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>  #endif
>>      int (*set_target)(struct domain *d, struct domain *e);
>>      int (*domctl)(struct domain *d, struct xen_domctl *op);
>> +#ifdef CONFIG_SYSCTL
>>      int (*sysctl)(int cmd);
>>      int (*readconsole)(uint32_t clear);
>> +#endif
> 
> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
> 
> I know it will grow the diff, but can we see about collecting them into
> a single region, and in dummy_ops too?  It will shrink the overall
> result, and the order of pointers in this ops structure is uninteresting.

I have a far more consolidating patch in the works, which is how I actually
noticed the issue. I'd prefer to keep things as simple as possible here.

Jan

