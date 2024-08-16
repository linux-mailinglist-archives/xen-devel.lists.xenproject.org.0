Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC895418F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 08:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778386.1188425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seqBZ-0001z6-W7; Fri, 16 Aug 2024 06:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778386.1188425; Fri, 16 Aug 2024 06:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seqBZ-0001wY-T2; Fri, 16 Aug 2024 06:11:41 +0000
Received: by outflank-mailman (input) for mailman id 778386;
 Fri, 16 Aug 2024 06:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seqBX-0001wS-Oz
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 06:11:39 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646e0212-5b96-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 08:11:36 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff443so248a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 23:11:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838eee8bsm206505966b.92.2024.08.15.23.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 23:11:27 -0700 (PDT)
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
X-Inumbo-ID: 646e0212-5b96-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723788688; x=1724393488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T6eIWBP3KkooutfeP1FxtFPBsUDuYmn9030CgneZzjQ=;
        b=S7dM/+ZrUI+SgcR8YHfXYvVvGf97uqk6+P0f8pWKzqxr6tFTODl+0JB2hcU8V4dtOv
         ci5/y/kviDjXDZSI2mUyTfvdafmGey1FwRjLzgucynv71PWDgXehGc1bGbWpdyPMdt+4
         9DHhcLhEAjv2lyiR3l8mH4X+C/HAP1f0E/Q13ncu1f7hfrDy4MCVBO/SZ9voby5Iwi0n
         r6K0kdo0hrnhes2J1bmS5mvnl0WPtjfmWqLGF3iL8kxpz3i3fbB8XpZNKPmCoTkhiyg9
         uxauSjkFq+ktrTUitGwWCYWRmzmbGLXaOsDrUtZSM09J9GE8FxKq2Yf+UtLw2IHWIogN
         j7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723788688; x=1724393488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6eIWBP3KkooutfeP1FxtFPBsUDuYmn9030CgneZzjQ=;
        b=RG/dB0kZd4CaJGaAea6GDnH4AuXIhipBxTpbMQhZDASyozso6q2KyMjPpmp+sTXACp
         3uUYWWAUYIY1deuzLjZdi4VmvUvZZGXlBpQ2tdcwEhi0mDgOjFScs7IysC6HT6i5OQmp
         DCWAf3IjFGBkNjE5a4V9TRahQixwUcE8+mDVRj3lIHel9gRHuNEUySOAXte/O5cO48ZF
         rFzlb/nRfhJaaOKGtmXnSZbTnTfGOlsRQ+xFjJ4pQG9XmdO6zsKmAaQ45U0PDew/sqmi
         eq+KhhAdtnQXhI9zaJT0uu13g9j9WCv9KA+/RNj7kab/cPWzNlJIM6gJfnzk6V3irflN
         UJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCXa7YVxGcr01nyyCd5poWSbNFaTrs7klLOT2IcemhpWEV8I3cFzCjbBaFcVWpxrO/Sc5uk6zT/R3JXCupwJ4h3hO6HVm2WSExJaVy324BM=
X-Gm-Message-State: AOJu0YzEwb6LIFCQO2ynMTw1fwK4+VYEnSpWl/x1mo7mIltoTTIIrY8X
	s38Jm1IqJURs9/ysmLS5l7/6w5XJ9jtVyvmnsOejBTl49/a+jeZEIcwuRwS2oQ==
X-Google-Smtp-Source: AGHT+IFEwZn0+PQXboCoU1N8NU3WXC0yMG/ExvjZl3pCkoNUfL5Wczvj0j3KFjMRKHoQTQprZ1wCqg==
X-Received: by 2002:a17:907:d85d:b0:a7a:83f8:cfd2 with SMTP id a640c23a62f3a-a839292e6f4mr136129066b.17.1723788688137;
        Thu, 15 Aug 2024 23:11:28 -0700 (PDT)
Message-ID: <89137a5a-4d7d-469e-a60c-3c6f649ee4f5@suse.com>
Date: Fri, 16 Aug 2024 08:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/pv: Introduce x86_merge_dr6() and fix
 do_debug()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
 <20240815131600.4037415-2-andrew.cooper3@citrix.com>
 <82f78de2-3d93-4e51-a845-5bb96559a4cf@suse.com>
 <c02c15d6-9f59-41ff-aaf5-499bfffe4b8e@citrix.com>
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
In-Reply-To: <c02c15d6-9f59-41ff-aaf5-499bfffe4b8e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2024 18:34, Andrew Cooper wrote:
> On 15/08/2024 4:41 pm, Jan Beulich wrote:
>> On 15.08.2024 15:15, Andrew Cooper wrote:
>>> Pretty much everywhere in Xen the logic to update %dr6 when injecting #DB is
>>> buggy.  The architectural behaviour is to overwrite B{0..3} (rather than
>>> accumulate) and accumulate all other bits.
>> Just to double check (after 6 years I clearly don't recall anything that isn't
>> written down in the description): The SDM pretty vaguely says "Certain debug
>> exceptions may clear bits 0-3." What other information sources are there to
>> make this less uncertain? (Picking an old hardcopy from the shelf, that
>> confirms that long ago DR6 was indeed documented as all sticky.)
> 
> Well, "talking with the architects", but as always "it's complicated".
> 
> The debug infrastructure has had several breaking changes in it over the
> years (e.g. the reserved bits didn't use to be f's), and this one
> probably changed with the introduction of superscalar pipelines.  That
> said, I don't think I've ever found a Spec Update / Revision Guide that
> doesn't have one "oops we don't do breakpoints properly in this case"
> erratum listed.
> 
> I'm informed it's "most going on all exceptions" these days, and the
> behaviour here did come mostly from my discussions about XSA-308 (or
> rather, the pre-security angle where it was just a bugfix) with Intel.
> 
> A guest that does clear the status bits every #DB won't notice, and one
> that doesn't will have problems on real hardware.
> 
> But I can reword if if you'd prefer?

If I may ask, I'd like it to at least be clarified that documentation isn't
quite precise here. Kind of to soften "architectural behaviour" a little.

Jan

