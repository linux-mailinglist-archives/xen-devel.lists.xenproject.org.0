Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CECiJKT5+mnjUwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:19:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0664D7C4F
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301264.1575556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXTl-0004th-3c; Wed, 06 May 2026 08:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301264.1575556; Wed, 06 May 2026 08:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXTl-0004r1-05; Wed, 06 May 2026 08:19:37 +0000
Received: by outflank-mailman (input) for mailman id 1301264;
 Wed, 06 May 2026 08:19:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKXTj-0004qv-VI
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:19:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXTi-001jOe-TU
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:19:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69faf990-e002-0a2a0a5209dd-0a2a45039f9a-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:19:34 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69faf996-672d-0a2a45030019-d155dd2be8f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:19:34 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so1784738f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:19:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505238e7c0sm9732867f8f.3.2026.05.06.01.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 01:19:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1778055574; x=1778660374; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ioSht9cqqiUvuP9fix6u3yL/pHqOGG/1WWyLkWJHJFk=;
        b=NsQ98ZVGw6LywAa4aYXm9akIqWAQ0JO+KULJj6rxDqYe+xIZ+mftBehPIHL8MkkvhO
         wHUBKr2rbk450MqGyjbVtiokWZPeK45t0CQ38oBA2Io4cS0EG6od0o7Pv4Yj4RS95Xzh
         0AT+s+rm1/evRlLCexp2kyjWskn5eNy4TniZZ10VukbObMaHGsyNanyfO8k4igG0cclv
         qyn0RvyWVBou9JTCvgpBiLbeRqxGauuw/UUeu9u8p4XmuEBJH1gY2wSPQp/PUYZzzxt7
         FP9yFDZokdBTIjUHtrdhaAfWSF3qXl827LqTaC5d8BqKbUBq7adY0qqT8UGIAqYU49wV
         PxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778055574; x=1778660374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioSht9cqqiUvuP9fix6u3yL/pHqOGG/1WWyLkWJHJFk=;
        b=GEBKIFabgmMJALBAXgadM12fT41CQRG6EBq4/iV6ErEuipalalvEV789RgLYEAOJa+
         5MdpHx/IsaRQijZUz8NzVMGvCUUN3/DVRIDwBlDhne2FaJWTfb8PpAdTd2GqOcS4ADIW
         M4S2/q4ckGz36LMfahi7bOle5kLvFRG2DDNYJVf0mU+F1Ni1biskH/eEwXvwMEPUmnO0
         gINxiT8BxWKQ5tFxg+PfxuyWjNLoQCo9tkpKjSSqPZ1l0VBFgDmxK/wMCED9nvnpNPFK
         BAyu6YKDvWUip01uqnUf3tmc3Nq7y7vKsj4Y9ClB2fQKjr8jHL9G2LvBuiMxozwdlZ6H
         5KrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sP759SYfNNrAxZI9M3D2KFS2q+OAhc2p/HmyUh9FwzOG7F2dEO73/8MMS9op4ynlfjKV2mgn4LoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk5Kp7F69TA1iQAwgdBT/PmLLPXwIbj+8D95Cz+KZOOZ+DqxRm
	o0Re+maUDyOpACtWAsrWdbsK6dlJYHXNMzAR+sKZXXt3FRZ8tby3aigFsoZBysbp9g==
X-Gm-Gg: AeBDiesef1Z90VHJKDprDJFtkwm9/KTtbwABJ7toxd6OPJ76hCKecRaP/n2tphx/13D
	EjojGHBJTjZ3ZzeTR1i+/TO8hXFHpAQ/DebyN67YbWii1f4BJOUJchqvf35waEXKIov8BEnXPVZ
	VsYeISPRgeGySBD9UoA5rk6A2zltTEV9oXVIfyoaTpTPHCGIDlSCFgNSbtuh+IIZ+PuZqEXFOYd
	PmiY0dFoBvpdHEi8tglRhFLvQzJG3q+/W/5kTiSrw7Ph6Lk/JmkHkdROlLqKlVHzQEmLfiB4vum
	KmGw8YR504p601oeyNxDb0SUVwsMLFIOtnhg5sYtMM5WLOEI64Sioct4wHM9ssfCm4tIWd/0kWg
	iv6Vru4erQR5rmQSHG5VxPkkC396FhtM4C1u4FGF9Ur8X2fuLnxf1w0M3oJ9CrlGZj2xRkZElEY
	xMK6VPgvGeKPku8KdfviH73BRcCTJivyvlbfboT7nroLdFeyhvhJoilGQ0wPxU7PUWOWZxuyOJi
	s4ojkpPx3xrgWxj3MQD7bvw2Q==
X-Received: by 2002:a05:6000:611:b0:44a:247e:67b4 with SMTP id ffacd0b85a97d-4515b9f31camr4156412f8f.18.1778055574075;
        Wed, 06 May 2026 01:19:34 -0700 (PDT)
Message-ID: <d6756e97-a928-4401-826f-5e12e4721648@suse.com>
Date: Wed, 6 May 2026 10:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/amd-vi: allow disable_iommu() against
 non-initialized IOMMUs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-2-roger.pau@citrix.com>
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
In-Reply-To: <20260506073719.40075-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778055574-A2D63938-00C51063/0/0
X-purgate-type: clean
X-purgate-size: 432
X-Rspamd-Queue-Id: 0B0664D7C4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06.05.2026 09:37, Roger Pau Monne wrote:
> Introduce a force option to disable_iommu() that allows it to disable the
> IOMMU, even when ->enabled is not set.  While there remove the unlikely(),
> this is not a hot path anyway.
> 
> No functional change, as there are no current callers that pass force ==
> true.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


