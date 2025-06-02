Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD05ACA9D1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002812.1382201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzQO-0001oc-M2; Mon, 02 Jun 2025 07:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002812.1382201; Mon, 02 Jun 2025 07:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzQO-0001nB-Ic; Mon, 02 Jun 2025 07:17:36 +0000
Received: by outflank-mailman (input) for mailman id 1002812;
 Mon, 02 Jun 2025 07:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uLzQN-0001n5-AB
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:17:35 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6c71e15-3f81-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 09:17:33 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso79298f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 00:17:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeabc6asm7211856b3a.53.2025.06.02.00.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 00:17:31 -0700 (PDT)
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
X-Inumbo-ID: a6c71e15-3f81-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748848652; x=1749453452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MBNE0WMUvarYwLkTpc6pA2ckZ9CoSB6Ya1Gn/flLcnA=;
        b=IOjuXXxILBIN9d9+/yN46u4x+I4tgEOHzB+pShVyoKKmdsLxg9w9+faX+nzeJRf4Nq
         TZ/TuVHrr5Ilsrt2sYcAp4x47iQvVcsIhn9S91Ieg9LWBIyyXvn4XlNjMxFIdmCDIsLz
         jLrmSxGEpEWBAVTzjbSUD+NQDQTvley1DRQAyGLzbh39t6dSrnPPcj4g/waNZWkzZo5D
         P5ubknsqAJ40I0MyGdKCbK8VFBxca6uBkv5/V4gBk1ltFAKafDz3wggqbgxd543L5VmH
         DHDEyTUmiDZwImNfVDLlL2J318BTU6dTZdEWd2pyNolWdIv2FLD2EUh/6JlZZGEGswJe
         sW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748848652; x=1749453452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBNE0WMUvarYwLkTpc6pA2ckZ9CoSB6Ya1Gn/flLcnA=;
        b=q2W1greYo4xBRESkRfdAhT8EYRWphm9ijYLJhpwjey/mGOTL09hVso0Tp2gg//t6yj
         q5Gh/6hYefW6Y+DYcNdE9Jw8GH5gwj5PKBdfBDXlP80k/I2JPY8Td7h69CCPnjLcVagO
         TGoWHZUSwmEa8yoWv4VXM+Bod9FE3ozFrP5iHVCi7BN4pgZB4VubMmv3iucwrpC2c8qV
         P5Jo+HTiJFMGtFQrHXIWl25J2MWRgKyaPciRQikAETZXbxTMfMiywXl5Qx/Bp452+qmU
         C3T3ZMVC9VE6lulFPVbsNKbk7hBDk5c0z+EVd6hJt+OBhjsWFKJJfZ+1hhe/iCwl1e5g
         b/lA==
X-Forwarded-Encrypted: i=1; AJvYcCUGuzFar+FT/jl9dzemZ3E5xZN6gb5XMn/rl6Jl/teL7vgVGuM1VWRs1d44CyTvZdIf6oIcRE+AT5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSBsCyO8i75Ct5SAgse4MvOhHeLcGawb2XM0isdAtMaIQWvRzF
	a0NgGGfVLjQ2h0i5bEVFt6E6HYr7NOE89J+gTmVdiuYBQAUrwhtJnYwbcrr7RbxZuQ==
X-Gm-Gg: ASbGncus50zF9RBOrbVeJMSYTC7VzE/8c/Xd0D/j/luL9gSw6Me1CEdrbrETyL2GPqu
	1Fe+e56sxGHVCA/VsFsX0xy6WglmK/5caUbccgbkW3MQcnYTIoq68O9VGOLB32KZlDSqAiPHa1T
	v0Iax1nVKGUDtpmb/rLA5lvb6xdGeZQGo9PiCa8KBikgJpEOgpCJKk3jrNZv1vv5eVhWIfeKI0D
	CUTlfoePXrGxjRAn13SvR1Fm/ToJFrq4G5VY0WXGq4r+D3ui7O7P+nyGQ1FSQ96z9kF8C09xI0p
	2miobCB9As0EUX+iMqazEfXRfazmpO2htqibEpbUSrYHtlH8MiKMNDibqsVU2Q2PdC0fdVSM1Nl
	BIOqcYlfscwba3WGVX5zFk0FTgHWXAs9sxmIxDAASidIIwR5H3gZKtASCUQ==
X-Google-Smtp-Source: AGHT+IFsT4MR1Zj3Rc92bGRXe/kVD0xAK/1FUYonEqZOHZe8p/1N9q5nzHEkCAjesKtnuzKgtFmdYQ==
X-Received: by 2002:a05:6000:18ab:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a4f7aafa70mr10891201f8f.53.1748848652480;
        Mon, 02 Jun 2025 00:17:32 -0700 (PDT)
Message-ID: <31c7faf1-d393-40d5-87f9-1a01d1ab39cb@suse.com>
Date: Mon, 2 Jun 2025 09:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <bf892a80-fe3c-4163-b857-9d073a093451@suse.com> <aDDRrOviNNSvFig8@MjU3Nj>
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
In-Reply-To: <aDDRrOviNNSvFig8@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2025 21:51, Sergii Dmytruk wrote:
> On Wed, May 21, 2025 at 05:19:57PM +0200, Jan Beulich wrote:
>>> +/*
>>> + * Secure Launch defined OS/MLE TXT Heap table
>>> + */
>>> +struct txt_os_mle_data {
>>> +    uint32_t version;
>>> +    uint32_t reserved;
>>> +    uint64_t slrt;
>>> +    uint64_t txt_info;
>>> +    uint32_t ap_wake_block;
>>> +    uint32_t ap_wake_block_size;
>>> +    uint8_t mle_scratch[64];
>>> +} __packed;
>>
>> This being x86-specific, what's the __packed intended to achieve here?
> 
> This structure is passed to Xen by a bootloader, __packed makes sure the
> structure has a compatible layout.

And it won't have a compatible layout without the attribute?

>>> +/*
>>> + * TXT specification defined BIOS data TXT Heap table
>>> + */
>>> +struct txt_bios_data {
>>> +    uint32_t version; /* Currently 5 for TPM 1.2 and 6 for TPM 2.0 */
>>> +    uint32_t bios_sinit_size;
>>> +    uint64_t reserved1;
>>> +    uint64_t reserved2;
>>> +    uint32_t num_logical_procs;
>>> +    /* Versions >= 3 && < 5 */
>>> +    uint32_t sinit_flags;
>>> +    /* Versions >= 5 with updates in version 6 */
>>> +    uint32_t mle_flags;
>>> +    /* Versions >= 4 */
>>> +    /* Ext Data Elements */
>>> +} __packed;
>>
>> It does affect sizeof() here, which I'm unsure is going to matter.
> 
> It doesn't hurt anything and makes sure offsets match those in the
> specification.

It similarly doesn't appear to hurt anything if the attribute was omitted.
Imo we ought to use compiler extensions on when there is a need to do so.

>>> +static inline uint64_t txt_bios_data_size(void *heap)
>>
>> Here, below, and in general: Please try to have code be const-correct, i.e.
>> use pointers-to-const wherever applicable.
> 
> I assume this doesn't apply to functions returning `void *`.  The
> approach used in libc is to accept pointers-to-const but then cast the
> constness away for the return value, but this header isn't a widely-used
> code.

Which is, from all I know, bad practice not only by my own view.

Jan

