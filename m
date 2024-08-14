Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4B8951BC1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777201.1187392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDxR-0007xY-II; Wed, 14 Aug 2024 13:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777201.1187392; Wed, 14 Aug 2024 13:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDxR-0007ut-Fb; Wed, 14 Aug 2024 13:22:33 +0000
Received: by outflank-mailman (input) for mailman id 777201;
 Wed, 14 Aug 2024 13:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seDxQ-0007un-QW
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 13:22:32 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42c98bc4-5a40-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 15:22:31 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso7694191a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 06:22:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411b536sm170627266b.137.2024.08.14.06.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 06:22:30 -0700 (PDT)
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
X-Inumbo-ID: 42c98bc4-5a40-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723641751; x=1724246551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jLeNxn7AJ1sMXGbcOCfVV+yHbJrURsaNatRZLeQ1ddo=;
        b=Ht4vR1Pr9GfCngfe+5RPevR/a+KwmMEEuOaqPLiyCaKakSOCTClMb6K9bkpUdv5d+j
         56EJkoOssjwz9pwk9mlF0tCDRKAlmLq5V/T/k5+jm+CCzE+UG36+OfOc8cbdfsh9dJm5
         rk1b2zdXzUVrIOLVRqX1oDT01KgtIRWHV+Tgy8QjhFUFspOquIvzdVgr/HHDu4GpAdRD
         ezv8w+lac0YyGyOZM0NQtrgXA3+9215BUIelBuw5fF8+iBf7T5w4Ndtrv2BhBDLIVd+M
         aJrE2+pk0v8HSj3PmqgLUHplTZVZFo1PpHsMK1oBSwAVbHPHA0ILHIB9JwKxVZdxOuGz
         zxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723641751; x=1724246551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLeNxn7AJ1sMXGbcOCfVV+yHbJrURsaNatRZLeQ1ddo=;
        b=D64WBtSGR7JWAp99zfnLJNPEZ4VOIogFr43Wtl3BBjEZe1Fu3q2U3wyh6EPy9BKyJY
         Emb0AUa+o+AOrh/uaycH23lV/T/FzSTv04yEhe9kuSrdUgReKDZ6GiTMoqJu/SxnnHsG
         48WcirML7B3ACLolbk4G6Se++Iam27le0qH4iYgRGye7Fa9SML02MWHc4y/LENFTywAm
         LQaSY9BLmydkpTgcT0MsZlD77lZb2QLIM0ULz2FXVJ5X9pTFp5j5Hu8gtwdtZv3Yc5ta
         g9ghX2DFfqJd/kKjfD4L8AAn8zteUg1PcZbPEnxBsfn6//wPjfRkhcHQPDXSz+LAOtfr
         VC9A==
X-Forwarded-Encrypted: i=1; AJvYcCVpys6LvUkHWT1e2v7DGiEXyNGXbdxGv/zTNxfl0DIQjXGMxp23J66gFQIhK2c8YhLsSz7FjTN9GilToJXnNoccxZ6Z1+KTZyVR7/d5CgE=
X-Gm-Message-State: AOJu0Yztw6Q9c8dCxxISne6bt+nTZmQ32hq9c6kdcC3o6vDQe0pZJC+l
	wZJhRjjzgORjueaFsTkzyqUsJob31nUxTRZVn9RLGKsa8KKWOf4jofOYL+GdKg==
X-Google-Smtp-Source: AGHT+IEENYskvceH3ssTqCxMfqDSJkfBSfs2dgpk/DoGRP8rZiXeLlwHsPTWkMs7IiABaM7qnvavGw==
X-Received: by 2002:a17:907:f143:b0:a7a:8e0f:aaed with SMTP id a640c23a62f3a-a8366fefc47mr187774366b.50.1723641751182;
        Wed, 14 Aug 2024 06:22:31 -0700 (PDT)
Message-ID: <022a142d-0d0f-4183-a89d-bcf10ce75689@suse.com>
Date: Wed, 14 Aug 2024 15:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
 <a7d15429-ce49-43b1-9bbd-7b0129094388@citrix.com>
 <e0081fc2-c631-45a0-a847-edc8dcc3988e@suse.com>
 <3cc3f16b-bdc2-45e7-9a6b-fd6270e952c2@citrix.com>
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
In-Reply-To: <3cc3f16b-bdc2-45e7-9a6b-fd6270e952c2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 14:49, Andrew Cooper wrote:
> On 12/08/2024 3:05 pm, Jan Beulich wrote:
>> On 12.08.2024 15:04, Andrew Cooper wrote:
>>> Also, looking at the emulator logic, we're missing the DPL vs
>>> CPL/RPL/Conforming checks.
>> There's surely nothing "conforming" for a nul selector. Hence perhaps you
>> refer to something entirely unrelated?
> 
> Sorry, yes.  I think this is a general bug in how we emulate VERW/VERR,
> unrelated to this specific OSS-fuzz report.

In protmode_load_seg() we have

    case x86_seg_none:
        /* Non-conforming segment: check DPL against RPL and CPL. */
        if ( ((desc.b & (0x1c << 8)) != (0x1c << 8)) &&
             ((dpl < cpl) || (dpl < rpl)) )
            return X86EMUL_EXCEPTION;
        a_flag = 0;
        break;

Is there anything else you think is needed?

Jan

