Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDQLH59y1ml2FQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:22:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6D3BE1DF
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276280.1561801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAUiY-0000Dj-Oy; Wed, 08 Apr 2026 15:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276280.1561801; Wed, 08 Apr 2026 15:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAUiY-0000C6-M8; Wed, 08 Apr 2026 15:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1276280;
 Wed, 08 Apr 2026 15:21:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAUiX-0000C0-NB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:21:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAUiW-00Fs0p-V0
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:21:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d67263-e002-0a2a0a5209dd-0a2a4508cc20-28
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:21:20 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d67270-fab6-0a2a45080019-d155dd33bdd2-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:21:20 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43cfd96354aso3984002f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 08:21:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c54bdsm59936427f8f.16.2026.04.08.08.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 08:21:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1775661680; x=1776266480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nN7jnZnW6PGIJXI6Q5gGVQuBuev2kT9V5ckxdBWgIuc=;
        b=OQVc9Dbdrz8gC1YkGpORVPRrfrTFwQImyJNV5kI8qH4mcYIayKOSz+gApS39kcBxvy
         UkY09zS48PPQvXoxxYyyRTi+H9wjcR7Ubmc4EVjPlDHEMjpiGDp/GIGsEi3Ys0a1gu+O
         ggbfEbmACxBwBKLUCNAjRKdRTwGWw1SrWbApmasVoF8bGqCw1ISXSMDstdwQirJNblzd
         hEbTXjiqcOuJy7utGiFrU7Xc7cSs558YfS+UZBZ/mZyfjibvXAMioCsu1gOVmWMjzQAS
         eT3nLSj14Alu+muI083waoSQZCMoCmyJNRJ986qHbEf8axq4JcjUqJd7KqPeZa3j1rRV
         smhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775661680; x=1776266480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN7jnZnW6PGIJXI6Q5gGVQuBuev2kT9V5ckxdBWgIuc=;
        b=d3OFB/1PCd5cXvZE2S4JdPRxCsPSS8N5sZJ6kaYNFFRU3Ow0t3zrIFmBBOGYq+9aXI
         Ka58z3xQjfflL/rkCmb9FGaWc7u+Q3L3y4TBxVzCOi3QPH4YSP3+GhZqyZv15scpL73r
         E2kiytgR1f7q8AMZqlwZYi+oy5Wg1yNJuHeVA9TXEAlfJMeU04bALmCOMNhfbvyuPcGW
         iNag3kdypuEyIrlrjZZqgnVsX3k60ZETaWg3VSdQhTAro5CaRHBMVn/2DdITKHw+CIAM
         h+9ct3znselF4eMcmXq0lbLd9gU9EEM9yzEWfY8TsOYKEoZVwF8iE2ZkDcK6cLwHt+qR
         NxbA==
X-Forwarded-Encrypted: i=1; AJvYcCWfDuIeMzbTJF0MtDPDs/20QiH09z9UwmHZ/n8lpOJiIxGw25JTE6ajQMfBgCRf++qaKrw0PWickEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbeRFPiFz4sRyLFbElvB+awNaAroVUo0ffJbBdbHim3iyUmXUj
	mmLQyC5Ngj0gG4gKkK0xCPIBBYRdupC4sPvNo31gfnL13tKNu4WVwLVUoAUP7vbF/w==
X-Gm-Gg: AeBDiest6IGaUtBOI8muvIedPz2lzf8wDJm7QG+tlTfLF3nDmcc8LzuPPPO3EzA+jVL
	ht0bEdvNHFX4ymBlDeKqAuB+CosTyNqnFN2AQ2eVqBySZi9O3T2e5sYq6os4HHAyfVEmLS8e47w
	DXue9F803O/4hhrEWLNTxekQdwAg6SQggbpl7ZZI/3YBFO/Xd35ZBXEHkoeqxs7krVJGc7VJRVH
	u4+29HEU1SW2aVazvtj1yz4C9Z+om1hX2Y7ltiTF+0Tlz8kKVjUCsLlpMOnTEsbdKF4TVFE53gY
	M1ikFMBorrDNPnpFUWPELy2z+dhzNe0CBNCNTR4BKN+j/koagv9ppjYplxwHqX4BF9Bw8WSa3Dx
	O6lbeST4SSM+BeTilW0yie6clIubnFx6kSBm9ylYonsjaSr9aPbfBXG8MjVGpqTkb9KJlVevstx
	QUgr5m16B24dsYvyiaHorQPWLn4S3GjfLs3czG1+1+bnfI7aZd4ji0wVJdkkN6NBwmwrPYrRntG
	WfBT8FnL/Q+LR0=
X-Received: by 2002:a05:6000:2dc1:b0:43d:127b:7e81 with SMTP id ffacd0b85a97d-43d292d33e0mr32003321f8f.28.1775661679988;
        Wed, 08 Apr 2026 08:21:19 -0700 (PDT)
Message-ID: <b985f554-0338-4426-8981-0613f112f166@suse.com>
Date: Wed, 8 Apr 2026 17:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] x86/hap: Wait for remote CPUs during TLB flush
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <20260401163521.3603665-2-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260401163521.3603665-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775661680-F7149497-C060318B/0/0
X-purgate-type: clean
X-purgate-size: 587
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D5B6D3BE1DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 18:35, Ross Lagerwall wrote:
> A future change to on_selected_cpus() will change the semantics of the
> wait parameter so that it doesn't wait for remote CPUs to "check in" if
> wait == 0. Adjust the call here to retain the existing behaviour so it
> continues to wait for the remote CPUs to VMExit.

Doesn't this go too far though? IOW wouldn't we better make the "wait"
parameter a tristate then?

As to the semantic change, peeking at patch 2 I don't see you discussing
the safety of doing so for the several other callers that also pass 0
right now.

Jan

