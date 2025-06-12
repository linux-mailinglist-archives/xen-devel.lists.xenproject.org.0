Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA13DAD69DD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 10:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012495.1390958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPctZ-0004XM-7b; Thu, 12 Jun 2025 08:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012495.1390958; Thu, 12 Jun 2025 08:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPctZ-0004V7-51; Thu, 12 Jun 2025 08:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1012495;
 Thu, 12 Jun 2025 08:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPctX-0004V1-QY
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 08:02:43 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dea9663-4763-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 10:02:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453066fad06so4295465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 01:02:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b6d4desm958345a91.47.2025.06.12.01.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 01:02:41 -0700 (PDT)
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
X-Inumbo-ID: 9dea9663-4763-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749715362; x=1750320162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IGigL6h22F5ISr34Cwwks41W1bOFtfBfoLyRQxUOzbM=;
        b=LlnX8Ar1SSKVVaydC0Y878xaKmF9RoT9bu8pTReAPAALzuw4xH+OmqG3z+4esNKzSt
         X1OZG0wD+8L0SndQFXQL4NHmE4M2UKB9GmCniVlGT4H6kwiVJUe915xA5hNmZIXUieNS
         GFnujJQ6od4qlOPuBOjtPfN3OP1xL7D3wnZrWozTmXXr3xHgoFDwh4NutMifv/imgUA5
         dvhnm136hfRsVOUS7lVYVAt62AruB3u3o1xXWhUDKTLWRW33hP39WAg6BTrpq2DF1hyo
         RwModjjMINV+1o+QcunqWM3qYObeA9NpeW4dugbmy8da539G+N/2E0dZb5D+YjISwA65
         KQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715362; x=1750320162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGigL6h22F5ISr34Cwwks41W1bOFtfBfoLyRQxUOzbM=;
        b=rTuGzlz0uNZifI2z32n69plNohzg7YxWkcNEBz8JRVqtS8DGij0QxL5pKU1LOHDyrK
         GRzwtPn6IluA2LGYRrO3cQvXbWXbsNPlGWOepMfodFfH+KXWcaHpEtAOZp5GxTAjNXYy
         Gc2AFRNq6sCYjm14kbofFm2rgEjVP1E/f4yYl1H1bhzdKNiHVLMdMpZB231mwHXZuL+j
         cINaI1MHNjSE28WLiELBMAknuYMkPCRB4spqjv1nNfIG5Ayq4hMlrvglI6wMX7VE/8dm
         bp9ryCTBhOw7841tBhzL7mudgYeXvP1fCu9Uqoy6dO9z6cTg0e/4ZEfH/uX+4e9KeHHK
         R7Fg==
X-Gm-Message-State: AOJu0YxCGZEUcLk4CG6J99fbrr/mYGNpaEy7No4ew9Rj1OTuG1Sv0AiZ
	87g2ld1l6zAVinxlqO3Agb7v1yrtyq1CvQM/ZPIhXnVf2hYxaOBP2T0BKHBTVBK1Pg==
X-Gm-Gg: ASbGnctQeUYCbJ+EPtbrFzwv08HyVr3UnEUHgiy9PAMvmc83mID0NCUwZw+gQAJRZ1x
	vPh+wLewLl3XEUlsyLYmdxHYSh03JBPvhPcuj+IA8mnSE0m6TuthYSgfnntyJqrB9VOaTFRgMwy
	sJ8EHy+LX0zlf3oJXmAXF6mxbRy7T5SO2bFYcFZVb531DiIQs6AGsr5LkrEMKVZQ/BTWuStOb4R
	Ae/XJfnHLkSkdt3knQaZ60JU/aRs3yqzlNiUGcRQk0OalbgB9PeQFozysLr9Aokmh4QDmhsqQsi
	/BFCuOqTvl3E78rOi8u/9lJHivazKoDD1NLzrbB5ZFdYRa+np1dFtrwxLjuz/RWMZlYuRPDg8T2
	ql90IdOzTdtGW3m1zh7jnchp47evpC2HDK8irXb73Hs59ZCv7acjF1slczw==
X-Google-Smtp-Source: AGHT+IEHhlaRmU89cM/aXPpZoPGfqzlxfbFsHVaLaRUTdiWtCrUFyJLQPhqgz1P+acUOZjX10Ao1uw==
X-Received: by 2002:a05:6000:2dc9:b0:3a5:3af1:e21b with SMTP id ffacd0b85a97d-3a5586f3433mr4961781f8f.47.1749715362089;
        Thu, 12 Jun 2025 01:02:42 -0700 (PDT)
Message-ID: <031338df-8f6b-4c6f-86b9-aa0b7c808bfc@suse.com>
Date: Thu, 12 Jun 2025 10:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 trenchboot-devel@googlegroups.com, ross.philipson@oracle.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5792bec7-cd2f-4d27-aa3b-f417b07c8ea8@oracle.com> <aEn_3U3YxdeUXC6p@MjU3Nj>
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
In-Reply-To: <aEn_3U3YxdeUXC6p@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 00:14, Sergii Dmytruk wrote:
> On Tue, Jun 03, 2025 at 09:17:29AM -0700, ross.philipson@oracle.com wrote:
>>> +static inline void *txt_init(void)
>>> +{
>>> +    void *txt_heap;
>>> +
>>> +    /* Clear the TXT error register for a clean start of the day. */
>>> +    txt_write(TXTCR_ERRORCODE, 0);
>>> +
>>> +    txt_heap = _p(txt_read(TXTCR_HEAP_BASE));
>>> +
>>> +    if ( txt_os_mle_data_size(txt_heap) < sizeof(struct txt_os_mle_data) ||
>>> +         txt_os_sinit_data_size(txt_heap) < sizeof(struct txt_os_sinit_data) )
>>> +        txt_reset(SLAUNCH_ERROR_GENERIC);
>>
>> I know the list of error codes pulled in are from the patches for Linux
>> Secure Launch which seems right. The Xen work is free to add more specific
>> error codes e.g. somewhere like here. We could even consider using regions
>> in the vendor error code space for different things like generic errors vs
>> architecture specific ones vs etc.
> 
> I think some codes were already added and this is the only place where
> SLAUNCH_ERROR_GENERIC is used, not really sure why, will add a couple
> more.  By the way, the new errors were inserted in the middle making
> about half of the errors out of sync with Linux, should Xen and Linux be
> in sync?

As the uses isolated to Xen and Linux respectively, or are the values
propagated between the two in some way? In the former case there's no
need for them to stay in sync, I think. Whereas in the latter case them
staying in sync would want enforcing somehow, if at all possible.

Jan

