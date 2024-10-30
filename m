Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3F9B5E83
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 10:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827941.1242712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64mS-0006aa-Dk; Wed, 30 Oct 2024 09:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827941.1242712; Wed, 30 Oct 2024 09:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t64mS-0006Xr-Ar; Wed, 30 Oct 2024 09:14:20 +0000
Received: by outflank-mailman (input) for mailman id 827941;
 Wed, 30 Oct 2024 09:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t64mQ-0006Xl-IE
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 09:14:18 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55285e8e-969f-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 10:14:14 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so6505861e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 02:14:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9a53sm15106595e9.30.2024.10.30.02.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 02:14:13 -0700 (PDT)
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
X-Inumbo-ID: 55285e8e-969f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU1Mjg1ZThlLTk2OWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjc5NjU0LjU1OTc3LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730279654; x=1730884454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=77U9kJygoKk2fPUYbr6q+Ks7XvmG1zHE/5cTi75uY8o=;
        b=HKZSQ2WAptU4WA6vuMiZpYO3IE+FyyxAqlENcnWFNNP1GBgml5u3352dbfp9/gfLae
         C4iEPhBfhZfFWrei720Nvp5Cf+fxmGZBiCVI+PLGuUFgAnQK3YKXZ4PqQbPFRn4BidF4
         Egi4pvKtjEW+BKeMyP3KHFE7nkFya1ALpQoi4VvtV+rDUw30vMBXn6vbpxAF66I7HFqR
         pBJJzbKWCwtI0cD5s+8IhExo3k0tpRKHr5R2dP777bZvckGBoLCJB4yxj9wr0evnZg01
         Ztfk9JM6OSTckgEe4VNVlAssftb7wkzDPvaE+IJC8fijGxcpZNBek53snNCmlgmdRaAT
         3jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730279654; x=1730884454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77U9kJygoKk2fPUYbr6q+Ks7XvmG1zHE/5cTi75uY8o=;
        b=UcHHuK++XSesxxwyvlGws3aFAl97zeDrAzfherHuLB0DhHF9TsSxpuwMCB6xVe+o6K
         SxNYXZfAU2O/e6TuM/f6jwrqtHgRUamLXPEoSX0RQL22zFsbahUrJXSsDZEi36VysBqa
         vCgQSRmEZ0bki8kLuu1Bk8BeLmJNmpk/wnVSzIiA/hljLj2JaF4ki510B2zbHmn0wEcx
         8dKQykUJ2C3+h2uFi02x6SffNw5s0MTtqtoRwC/vqOSW0fX87SQSduk5L+4ouVsgHULd
         ViPt/9DHnR0iSZbMEjlC/8DAxYyyOCKbIDWjYJZ1yNkmwpy6Z8ddRvhBwk2e3r+RR4F9
         Tj3A==
X-Forwarded-Encrypted: i=1; AJvYcCV6v2/7/mS9w6HSl0+0bfet0Nbux3uP/c0SESzw4DiakwQ13cxiptx3mB3zcFO9d899lb9YTdNUVkA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZHwplGkj5G5jm8aAN1x3zlCqyNCsnhOlNFSZkGfrTh7NtfJnt
	gNXM8WLy7mkgCE3kzHkkz3xMlaIwJvkVnyUwqJ13rMAzySU3Y2k4jHASWFe2Cw==
X-Google-Smtp-Source: AGHT+IGi+9YEwQc5FVqOQY3Z206fvhVT0CCSY4sheLj1AEqCecRhhoMs+eqf+KIqnEApxVo8XUA14w==
X-Received: by 2002:a05:6512:318c:b0:53b:1f14:e11a with SMTP id 2adb3069b0e04-53b348d0d32mr7006875e87.15.1730279653796;
        Wed, 30 Oct 2024 02:14:13 -0700 (PDT)
Message-ID: <3bf067c7-617c-42c0-bf6d-4387d97658ae@suse.com>
Date: Wed, 30 Oct 2024 10:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] xen/abi: On wide bitfields inside primitive types
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 19:16, Alejandro Vallejo wrote:
> Non-boolean bitfields in the hypercall ABI make it fairly inconvenient to
> create bindings for any language because (a) they are always ad-hoc and are
> subject to restrictions regular fields are not (b) require boilerplate that
> regular fields do not and (c) might not even be part of the core language,
> forcing avoidable external libraries into any sort of generic library.
> 
> This patch (it's a series merely to split roughly by maintainer) is one such
> case that I happened to spot while playing around. It's the grant_version
> field, buried under an otherwise empty grant_opts.
> 
> The invariant I'd like to (slowly) introduce and discuss is that fields may
> have bitflags (e.g: a packed array of booleans indexed by some enumerated
> type), but not be mixed with wider fields in the same primitive type. This
> ensures any field containing an integer of any kind can be referred by pointer
> and treated the same way as any other with regards to sizeof() and the like.

While I don't strictly mind, I'm also not really seeing why taking addresses
or applying sizeof() would be commonly necessary. Can you perhaps provide a
concrete example of where the present way of dealing with grant max version
is getting in the way? After all your use of the term "bitfield" doesn't
really mean C's understanding of it, so especially (c) above escapes me to a
fair degree.

> I'd like to have a certain consensus about this general point before going
> establishing this restriction in the IDL system I'm working on.
> 
> My preference would be to fold everything into a single patch if we decide to
> follow through with this particular case. As I said before, the split is
> artificial for review.

That's not just a preference, but a requirement, or else the build will break
in the middle of the series (harming bisection at the very least).

Jan

