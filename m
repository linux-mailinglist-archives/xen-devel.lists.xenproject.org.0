Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOJGEFmIDGo1iwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:57:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A3581D53
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313202.1583425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMoU-0003rN-EA; Tue, 19 May 2026 15:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313202.1583425; Tue, 19 May 2026 15:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMoU-0003pw-Ag; Tue, 19 May 2026 15:56:58 +0000
Received: by outflank-mailman (input) for mailman id 1313202;
 Tue, 19 May 2026 15:56:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPMoS-0003pq-UN
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:56:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPMoS-004f5R-6t
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:56:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c8845-2eae-0a2a0a5409dd-0a2a4507a8fe-6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:56:56 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c8847-229c-0a2a45070019-d155802bb0d6-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:56:55 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49021532ebdso7673685e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:56:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaa2c96csm111547385e9.2.2026.05.19.08.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 08:56:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1779206215; x=1779811015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xObgkIv4v1Gk2dZyQaSVG5Agqt8ZF9d1ZOFCs2ReudM=;
        b=NQq2JmrqQiWvVTguhuUtbfVOFBYSwgFKh0ni7kR0cFBbL59YHls3dkDq3nM1qXE2EI
         nX6yL7DCXef3YtpJ4K+VOhs+R9ZDx4VubnJveMeOb70/cxxC/DEl151Ypl/m/8guPmJB
         E8gg4ptW+D9lLZ3/BZHBnc2cNkyOe7KPx2QhT/X/vzRco4kpaAeVbIqghkEK15c/ciQ6
         Fc2qgLjVT321G9Jv69uzvZOcruRU4U+qHS+hT92Yw0A9V9ELboekzdvfLmAlCBPLn8+A
         lJcxhNEmEfwiR/yVbrr4Jqe7w4rowAISEZWBQER/9SmRKY6roVhyqR+HjOKmsi7zrHdS
         hozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206215; x=1779811015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xObgkIv4v1Gk2dZyQaSVG5Agqt8ZF9d1ZOFCs2ReudM=;
        b=EJxZQr+9Ue2ZNMbVmPzte636idDhEcZKQAzAQabNs7FG9iaBUxvTOh1VaM9+SACr+O
         +VzFJEBWJH4dH9rO6XgeZ55x3f7czzMpImg3G8becz4VElRuda0Q7y/NxAS29eBw4nVL
         WvZjt6qGTIgM49B2/b4P8a9Bub9Kwtg5U/V+ZWccGFu6DKgHUgRtj5ixvCljoR6adjl/
         jf3xbEVe+sQZzQUkhbCzgqK0h03yKacZrI2DG+BH6GsS14PIBBcEtBpn3bl0jyaZ+5hH
         yJhzOx/WOhAsvsy5yTQBXAZ4ZNW+v/RtOS4ZZqXEAWR33Alo6pczVgt2ZnMnFHxyPMpy
         aW6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gxC9f4GK1M+OTU2uZRA48crWB/rUEiYhcwARUBUGNU+jOPPaUibmY1wvMMs/7iQgL0P7GonpxvqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw06Dyi0GOaUsrqCm5LxBGf0G0Ac/gDdTA3JSiF9qr/+XL6bxDd
	8h9qh5mB/kvxu9dyUylir5fXGxbJ7cwIp5Cvr7K32k65Hpfw19dPtwh5pX0SKpv33Q==
X-Gm-Gg: Acq92OG9XqSbj0tsRoinEshK2R9mcN4e0xA2iP56XHAxzG1KZSDz35WvroOyBztay4x
	DJmy/JNedZg54DwFo4CBnNBdEvMO7yrmJCqNMRPa5SQj++MBxPKAx5jtVUbccHOSJPPRydevXEk
	VIqG+po8GqTyK2U2mm4LKHtqEm0zre3LTC7hAH7JZv477xSCBPp1Ou76+5rq8deHa83y7xjqWTc
	szJtAik2qSbZ8ljLoUVKdBWr6GF2nC4hFsdD4UdJL8+NlxtM6B9vA855Hvpj5pOuNFCvXy9DFTH
	iAC/2CT4NaZc6siovto4NOPA4JsZuIyUr5V0MffRQ+H60qC0FzdTCQPjLkkvL8wgQ/jhtTzgCZJ
	iESEZ3HAn0FUU3S9/Qe7zUY9fDKQOA+ZDJCrp8p03YNQlTG5tywetDl9Ht+Oa607ht1CjJXm2qC
	Mx1wqdTZvRjQw+RVqqDVADJFI7UIq/Nx23JTqTCUk/KLZw//yyKKoX9FSSVRo7UCyOE9zoMtBsn
	QxGlL1YI1Ft++k=
X-Received: by 2002:a05:600c:5304:b0:490:17da:27f8 with SMTP id 5b1f17b1804b1-49017da2830mr104668965e9.18.1779206215317;
        Tue, 19 May 2026 08:56:55 -0700 (PDT)
Message-ID: <f499de94-e75c-487e-bd1a-0bd3b4eda39f@suse.com>
Date: Tue, 19 May 2026 17:56:53 +0200
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
 <3d9e2a3a-6839-4909-b60f-28b4c1a02cdd@suse.com>
 <fa617f4f-7057-4b59-8f28-5a014b0c423a@gmail.com>
 <3b5f681c-bda4-4c46-a96d-cd3da1658e28@suse.com>
 <8472866e-49e6-45e8-8d86-3b6b09d2c177@gmail.com>
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
In-Reply-To: <8472866e-49e6-45e8-8d86-3b6b09d2c177@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779206215-0B77AC48-E3E6A16F/0/0
X-purgate-type: clean
X-purgate-size: 1017
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 8B3A3581D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 17:17, Oleksii Kurochko wrote:
> On 5/19/26 4:53 PM, Jan Beulich wrote:
>> On 19.05.2026 16:49, Oleksii Kurochko wrote:
>>> int init_guest_isa(struct domain *d)
>>> {
>>>       int len;
>>>
>>>       bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
>>>                     RISCV_ISA_EXT_MAX);
>>>
>>>       len = build_guest_isa_str(NULL, 0, d->arch.isa);
>>>       if ( len < 0 )
>>>           return len;
>>>
>>>       d->arch.isa_str = xmalloc_array(char, len + 1);
>>>       if ( !d->arch.isa_str )
>>>           return -ENOMEM;
>>>
>>>       build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa);
>>
>> At least ASSERT() the success of this?
> 
> I will add:
> 
> ASSERT(build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) == len);

Ehem. Please check how ASSERT() works (and the difference to BUG_ON()).

Jan

> but I expect that we won't be here if len is incorrect or 
> d->arch.isa_str wasn't allocated properly.
> 
> Thanks.
> 
> ~ Oleksii


