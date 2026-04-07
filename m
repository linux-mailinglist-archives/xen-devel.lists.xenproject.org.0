Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNPQMKcI1WnMzgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:37:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C53AF454
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274999.1560973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6cW-0004EU-UJ; Tue, 07 Apr 2026 13:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274999.1560973; Tue, 07 Apr 2026 13:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6cW-0004CI-RU; Tue, 07 Apr 2026 13:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1274999;
 Tue, 07 Apr 2026 13:37:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA6cV-0004CC-D6
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:37:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA6cU-00GRJr-PG
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:37:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d50893-2eae-0a2a0a5409dd-0a2a4504a4e0-8
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:37:30 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d5089a-bb33-0a2a45040019-d155dd34b505-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:37:30 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43b8e8e7432so4122989f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 06:37:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c50a7sm50487498f8f.15.2026.04.07.06.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 06:37:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1775569050; x=1776173850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gay1F9QM5baGBw82sPQPNBF5RzElQYDYXWXl9uQuAPw=;
        b=I/+ZPh8JMHirnSA3l1PQIeVB1p7fKwtiKIPu3hfR10YTx4WOmTmCp9sA9l/SDQrZ9u
         /DYu2ATpdaXr2IqT3Bys9QxSuONc/Aep/0r3YSGk7REyIbPq1F9vMBOy4+8+ISQUL4Jm
         8pRKFkCCXD4aemwVyFfRi79JyBgpC+RHYyOumqVhYCcoQdwek/UvMOZdGcoCpiP7tZxU
         Z+smaZd/f+IvQWKvJ3wz2fXCL9uTt4Uz8gWs3A5yIv55x0yoHStWaWEwuVSZejpLxy/B
         Zjag1lcWInVYBT2WWxYuR5ZCv+e5QNslyMlWH1H/8cxb/EBqmJdprR4Ob19vaz2vl+zh
         ZPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569050; x=1776173850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gay1F9QM5baGBw82sPQPNBF5RzElQYDYXWXl9uQuAPw=;
        b=kZL4MdCJN+L427nfsANzTUSUrl1h1k1cPtk/v8ZQcILIKIegh6UKltlLpkqOcuiqYw
         xkANLFCTc9bvnJWktxSb1Fax69z/QuaaxxjSIj0ML4i60hkWRNmxVANRfsVM13caAoiG
         MmrSAyvE/O8SIsY98ki8lGU3m9OPSIxCYAZEST53UgIfxMaXkIPJ0IHFn5oZREKO8C6P
         bDOzAnoMsfQi3+OEqnNVQA6FuWpt2btpW9uHEyg7iHmXMicxGznAgfm6Fp0T/LqqC4u5
         9AKnSwbomKWc0zsRdNaEfygC2kedW1GAjeP/UZ/XUMIxboAB57MUiuK7V7mpUoOkA+vw
         6DFg==
X-Forwarded-Encrypted: i=1; AJvYcCWZqyj3Y4iRLbt7u0/pPno11Mg4qD2Eiq1/dX1N5dHiWAZnsO73ZraK3Vttu0qgswO7tNEOEz7H7/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXcnLy+GqOdptAshh22vg+xP9QX/R2bmNeH5R2oBvHzzY7O18r
	Wi2ag4wHC6vYA7quDiO3/4PE2DO+GwSngO+rxFc9ojtqSOfEIan+3axEIsgMeKzBnA==
X-Gm-Gg: AeBDietC/uZm1Ryjb57yPx1L+FkiAKRYyENe3R22FacJnLON0THDluT1s+u0t5MhiPB
	Zjrc4uXvgorqFmWt4BW8G/rS4Bpit8FKu/XEiw9ZwFCWzMp+nARkVFfFfFs6M4FrqELfX4B8rZu
	iyIQioDUT44yO/1UnajsLNNjRFQs+S22t5Co/xw9jA5mxZ0ePK0+4OAUKKVKYYbuU1b+/1CWVIb
	guCzdjsyvvTPoLLdEI37oVwaUQGpI0jJeLLYCnG+0dT30fwChS779eeBWNp208IxgrSvrifxBvK
	hB07/tSWmJWZ8H05dSU9NCnUH6Nw/pSIq2BWeXTZ9HuF6U1gJD/w1Fnw+x9tvJsk+S9laOEKtMU
	5PA0OuzKP1S6Adgu3QD/EXSkzTqBMkGwL/HixhFeeZNtti3l0jTb5wc04P86/vGoRzV01siLNbV
	y6gd5X/r495WbMHzkUf7lMtbU7cnHbCXFFzVT2p8alLL4kF+dKrDDmxgvWTNr1JqwycZ7JmJF+V
	KYsKYc52jJq1AYZVLUlnfeCRA==
X-Received: by 2002:a05:6000:2489:b0:43d:26a2:f8c3 with SMTP id ffacd0b85a97d-43d292e87f6mr24049750f8f.35.1775569050119;
        Tue, 07 Apr 2026 06:37:30 -0700 (PDT)
Message-ID: <85e9d1bc-dda0-4766-b0ff-b2895a63d1fd@suse.com>
Date: Tue, 7 Apr 2026 15:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as x86 reviewer
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260407124840.80174-2-teddy.astie@vates.tech>
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
In-Reply-To: <20260407124840.80174-2-teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775569050-32B3851B-CF0B32B6/0/0
X-purgate-type: clean
X-purgate-size: 237
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 260C53AF454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 14:49, Teddy Astie wrote:
> I already started reviewing patches, but would like to
> be more active in that area.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


