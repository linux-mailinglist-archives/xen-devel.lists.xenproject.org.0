Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PlCEZmn6GnEOQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA5444F74
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290253.1569892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFV8E-000486-DX; Wed, 22 Apr 2026 10:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290253.1569892; Wed, 22 Apr 2026 10:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFV8E-00045u-Ar; Wed, 22 Apr 2026 10:48:34 +0000
Received: by outflank-mailman (input) for mailman id 1290253;
 Wed, 22 Apr 2026 10:48:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFV8C-00045o-Na
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFV8C-00781B-4D
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:48:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8a76a-e002-0a2a0a5209dd-0a2a4509df02-44
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:48:32 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8a77f-2497-0a2a45090019-d1558034c045-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:48:32 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso59524625e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 03:48:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891978ef6bsm112376715e9.4.2026.04.22.03.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 03:48:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1776854911; x=1777459711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6tx9jbdpinew4yDHwaxKss7KZnzno1jUKuWkAieus00=;
        b=XVtgsULRmRdsVCxbt7lmDbT0gorQAfArK8+6T7wRsikOjaK19D1I4xJWFO2h+AIJq9
         w3wuQnC5whWzwJG+WEfrgVw5pRK2ISDwHmLJQsTUyHmlMnE/caNnXCeWumaqGKmhMVNI
         LzPBPYtFacqGFHeP2eTAd4eVABeIac5BPYFnGkop/LK09ohG3hWxJpLhgcru0KAirb11
         m7ywNV8t46j+byf5ilisStgU5SuutjISAheStrxtKY7hILJlbl1qSWEwPo0I8SYxFJNV
         Z+jeqorFCgSiYVnh0iVUTdYFtoDbtl4+XWsqPznWdmuVWuJBdT2xHdmuWipaKKtWMjbg
         +IfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854911; x=1777459711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tx9jbdpinew4yDHwaxKss7KZnzno1jUKuWkAieus00=;
        b=JGHB+88pRjOjGYLWVUS2JcV12kDGiuOx7EITvRv5FfD67WtgfAyRAZ+VgtxK4e8vdJ
         ih1mxzgSHTiQtixDLANcJZ55LqDe3KKUjFH1Y6zS+D4ilXgVz6lJZj1SEGBrh+/0zRdM
         strLB0McvxIMEEbWTPtfU0QsKBFMej5lHrDEpqpvd4PsENHkVjateF3Uz+j7UryGS/S0
         oI+P02U2czgk1tfO3fwGU47AKqMV4yfoQSuUPEzTTwPv5mOiqYpBPJczrYEtxgrVkohG
         lLqBQsl88beQAa9wcsjbZM4Kok+JRHabvmX4LTbbA9Og6NyilqPZ6a7B77ty13Wc1jVU
         40sA==
X-Forwarded-Encrypted: i=1; AFNElJ+9BcC5RCem1CQxsBqnIax08bs/s5s7MiWU0cZoHcDqN523W/mklYfsviBucGLyyHuwMPFHR3vQtRg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW1Rw8HN1F0i3+cUcEgkPrrrAnje4VSbyik4ffjWPCptaoOajO
	4drpgGZU34powFdHSiICCDkhJmwgH99zaICSMuFqhaO/1gDBgX7LsRK5EKA1GU/FlA==
X-Gm-Gg: AeBDietLsPUznMQghViVaYzbgrPRUBRCwBr3FwnKJDg4+1u4tsi+v42iD09/fwcHgjR
	Yf2cR6Vw2gO/rtt85rfGpJfmecHzkJe0smr49mqiT8boLxfaevTXWcjzjcIg6U8WCYD1DcqPgUh
	djOsPOcysLBOb/YndrUztpy2qA8ExNTImf8ELkvNrWFF5oda0xaKoW402BsBuSGTGUJOXGLdiwt
	HkRfUQBpiYmpL1GW+aP8xdtDHzK7ZmrY6GgJk5BAkp/giTpArA8iOpGuJfym1Ot4lX4Rh9vA1R5
	DC2ZbXh4dmcPmkvZGQ85MFkhFJg28kk6cstkqYAbY1xhiCqK10NGkpDLAWEVds9Upr3688taEQP
	jc/95jQ2iInAuZyv3wh6cR//29yJHLxJBe3PP1c6+tz4FtgZ2ry589yNuaH1Rqe0pxqMW5HZwdp
	3QMXzEAnHSCy0UjQ8bUHprnW70n/Qzq1VHCROMO/JHk1Frw3eJWnNc02wTMzwJLadd89wWXscOm
	lQ0JyAnPQL4UFyaEcHuYoDpWg==
X-Received: by 2002:a05:600c:c090:b0:488:c744:49b with SMTP id 5b1f17b1804b1-488fb74a53dmr228037865e9.7.1776854911460;
        Wed, 22 Apr 2026 03:48:31 -0700 (PDT)
Message-ID: <14bf7225-25de-4fb0-8b68-082192929ace@suse.com>
Date: Wed, 22 Apr 2026 12:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] xen/efi: Config parsing: Free the same page count as
 allocated.
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <127e7a4e0bf360d7ffe8be94022840a353a307b2.1776787216.git.bernhard.kaindl@citrix.com>
 <170028cb-ce5c-4677-88e4-32f57f372fea@suse.com>
 <52c21d8a-f2ba-42e4-aa63-ddf65d460401@suse.com>
 <LV3PR03MB7707C25AD7EBF0118B2CAE65872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
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
In-Reply-To: <LV3PR03MB7707C25AD7EBF0118B2CAE65872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776854912-4236CA53-BE5D1C75/0/0
X-purgate-type: clean
X-purgate-size: 1235
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AEDA5444F74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.04.2026 10:46, Bernhard Kaindl wrote:
> Jan Beulich wrote at 10:20:
>> On 22.04.2026 08:48, Jan Beulich wrote:
>>
>>> As indicated above, I'm not convinced though that we really want to
>>> alter file->size. I'd instead add 1 in the few instances of
>>> "efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size))". Sadly the adding of 1
>>> is conditional in read_section(), so maybe a "need_to_increment"
>>> boolean wants adding next to the need_to_free one? Then a small helper
>>> function may be warranted for those few instances of freeing cfg.addr.
>>
>> Actually, no separate flag looks to be needed. If for the cfg file we set
>> ->need_to_free, we know we allocated the one extra byte.
> 
> No, also cfg->need_to_free is always set when AllocatePages was successful,
> xen/common/efi/boot.c, read_file(), lines 862 to 867:
> 
>     ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>                                 PFN_UP(size + (file == &cfg)), &file->addr);
>     if ( EFI_ERROR(ret) )
>         goto fail;
> 
>     file->need_to_free = true;

Of course. And for the cfg file (and only that) it means there's one more
byte allocated. So cfg file buffer freeing can uniformly add 1.

Jan

