Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E510A72C4B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928770.1331432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjT5-0006g3-JA; Thu, 27 Mar 2025 09:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928770.1331432; Thu, 27 Mar 2025 09:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjT5-0006dU-GU; Thu, 27 Mar 2025 09:24:07 +0000
Received: by outflank-mailman (input) for mailman id 928770;
 Thu, 27 Mar 2025 09:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txjT3-0006dL-Rq
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:24:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39d5f307-0aed-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 10:24:04 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso5144195e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:24:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f76sm19498690f8f.37.2025.03.27.02.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:24:03 -0700 (PDT)
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
X-Inumbo-ID: 39d5f307-0aed-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743067444; x=1743672244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VOZTxA0bXH2G6iAH3ohMfXD0PvN8W2Q9SpYZINI6vr4=;
        b=ddAaR+SD5r6uXYD8+BUWfFgnt0bDshPQA4yj++qVEoBXV3A8dTWm1v+oT++yVXg3iZ
         jMN+27yVdlYiX29YRZqYQdOgECcEran3KUZ8L9PVVgLTVM00v81wetlscjLuQZjX59WR
         42H71eJEfWa1LiI0+SAtzG6smBAjzn39L8Ek/kGH91W9VkaXaoHaH8S77s/32jaXrzhF
         lFKSVvnZ3DW/gU6eZBzieH7S9Ava/3+Lh/gSwafGgEFP+jfE8iVPbJDA8GNnZilY3hRL
         L1u2nlfqh4l0z0ZpzVssmdt4k9G62q05KqOSfs0GPWgyLsXYLAsjxuC5TtO9v9kSGulA
         iYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743067444; x=1743672244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOZTxA0bXH2G6iAH3ohMfXD0PvN8W2Q9SpYZINI6vr4=;
        b=IHewCWXRv2a1lOMnpj0aKinnTZMsls1x1jqNpnVG6oFx+IcnAI7M6Zd+9nLl0cZGZn
         5yuVh/M6KeN5Vi/w9pKmV1M48ODKhE5fcZ6AdZb8ysiiF5+OAE1jCq7jTq3iLoHQ7d0g
         STMPVtKZydGHyJUW8h8ZmWhCbfAsObrpv2hXcxYdjsrAddujRa3zoLb4d2tr4H7mb9zT
         0R2dlzo5HmO1rVAYqPucKay5s02S16suGmgUkYX8BuMjc/dNPV2Veiit8dneEVq1frKD
         VNzvpV6PdD06lIe8TqFxErfvazLWUPYvdSz0lSr/+h6FddOSuvM2Cr7H0jCUCQMM+5LR
         Y0Pg==
X-Gm-Message-State: AOJu0YyfIeeCUhV2hg7gzm8i+ozqu4EvrjNioEiF+GzVXsG3pKtV2K1e
	9zLw3S57sdKOc4bLy8O9nB89fMuGJppjrgbC9BDy7mrt7s6ObayvF4EJIEoyqA==
X-Gm-Gg: ASbGncv91vcyI/0PYd49vrSO643DGoKplDDLAorjap28AiUjfKUosrHlQTqsL+2686Q
	7X+i3ifDmelnJm+yBL8ue11W2F0nWl7cvH4vlupe866oatww9ctBazi6PhffzyiUj/OK0wQqp+U
	jtC//PJiw8eP3DKTAbouH7vYBZLq/+v57RJn4ExpLzAsMm0zDdonBD2nqITHxeaFeW2P+rjK+u+
	GhX+TEwNMK/ftqeQOCsacD1OdLlkdKzWabXvTcA/XUqEY3NtxmnjwyFg2T0nPjWW+ZdTj5lp97l
	lI1w+KwqYeJ9Ey+FgzxxUmZWOt/If441fdAIsjhMuMRm3Xz1ejt550mk8rwxTHUqcgokk6k/Ggw
	PgWxQSlUDB3djhmibZVSgrmXmJzosyg==
X-Google-Smtp-Source: AGHT+IG0+XNuSAXedirfzs1FEAUuLGE0vViOUNeaJrq8ps2lssiE6D+klPQf0yJKszT8fmuuLHbmig==
X-Received: by 2002:a5d:5847:0:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-39ad176bc4emr3143519f8f.35.1743067443740;
        Thu, 27 Mar 2025 02:24:03 -0700 (PDT)
Message-ID: <307f7c6e-bb31-4c0a-890e-a21b7a4e178f@suse.com>
Date: Thu, 27 Mar 2025 10:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <b590b590-764a-4dfe-9e13-975122790329@suse.com>
 <Z-UToaPviR7b73iG@macbook.local>
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
In-Reply-To: <Z-UToaPviR7b73iG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 10:00, Roger Pau Monné wrote:
> On Tue, Mar 25, 2025 at 08:17:04AM +0100, Jan Beulich wrote:
>> Handling of both grants and foreign pages was different between the two
>> paths.
>>
>> While permitting access to grants would be desirable, doing so would
>> require more involved handling; undo that for the time being. In
>> particular the page reference obtained would prevent the owning domain
>> from changing e.g. the page's type (after the grantee has released the
>> last reference of the grant). Instead perhaps another reference on the
>> grant would need obtaining. Which in turn would require determining
>> which grant that was.
>>
>> Foreign pages in any event need permitting on both paths.
> 
> I've been wondering about this, and AFAICT the PV equivalent of this
> function (the tail of get_page_from_gfn()) is much more limited in
> that it just allows access to domain owned RAM or MMIO that has a
> backing page (I expect mostly for the low 1MB?).
> 
> However for HVM domains we allow to take references to foreign mapped
> pages and taking references to MMIO pages is not permitted.
> 
> Should the tail of get_page_from_gfn() also be adjusted to make use of
> the newly introduced get_page_from_mfn_and_type(), thus unifying the
> logic for both PV and HVM?

There's no (proper) use of P2M types in PV, so I don't think using this
function is viable for PV. In particular we'd never observe p2m_foreign
in PV, if I'm not mistaken.

> Could possibly be done in a separate change, I'm just trying to
> understand why we have this seemingly different handling for PV vs
> HVM.

The difference is because access to foreign pages was hacked in to work
for PVH in a much different (and imo yet more hacky) way than it was
made work far longer ago for PV. The crucial part of that is in
get_page_from_l1e(), so get_page_from_gfn() isn't that relevant there
(I think).

Jan

