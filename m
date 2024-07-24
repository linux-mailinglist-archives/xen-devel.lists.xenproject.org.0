Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49A93ACF7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 09:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763798.1174121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWW69-0001pX-Qu; Wed, 24 Jul 2024 07:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763798.1174121; Wed, 24 Jul 2024 07:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWW69-0001nJ-OL; Wed, 24 Jul 2024 07:07:41 +0000
Received: by outflank-mailman (input) for mailman id 763798;
 Wed, 24 Jul 2024 07:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWW69-0001nA-9C
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 07:07:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6982e8db-498b-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 09:07:39 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7aa4bf4d1eso89250266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 00:07:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785db7sm624168066b.12.2024.07.24.00.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:07:38 -0700 (PDT)
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
X-Inumbo-ID: 6982e8db-498b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721804858; x=1722409658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7z+mc6hUQOaZlRkUCe8P38HatGZheB9ibsjiaAOfh3E=;
        b=N6txcjDgzXyoGname82ILBcVB9XQNK1XfAtVyxChrrKR3CKzdQ7F/QmiCpoZZKHHtw
         N1zmd2odt1Pw9axfW3ha6L9wPJGxKR4szLg7CUtgQjG3rRDClVPbRaHuz8FWZ0eHjB+W
         2n6jwAN4ZG5jjwDYvWdZbceIhE6W4HqNnM1DCs4730oqJwQ9wgDaH8aifB+VmVKLDpdn
         AGGnWR6SMSqjE8XgUptBjbzdhLx0VZp+y6opnASfgIBCWhiV3/nir6fB81NEApLr3NRx
         KpYPjZU0E1PZdzoRcOn250OHnSMAzXILN0b5XV2CO0lBCRxjnmAC22pSsGieHje1/468
         pMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721804858; x=1722409658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z+mc6hUQOaZlRkUCe8P38HatGZheB9ibsjiaAOfh3E=;
        b=TxHwMgh2VrdABhYgCfi91FM+FfMVNX9/zSiCvPreQcRiV7254AgrL5oIrx83u3uYNw
         JJ1PSU8dG3+DyL71qEjrFDkLeNTSQIn4GLH5lnWcna21JxPPUYlQj1qbV1wpnk3n9l9N
         dano2i+O0fG+gSNNCFVvmHHgEyvNEfFjGO31mWY2LaIUaJSlLwK/hcgtqJiMZIhsOEBW
         HovtHe5MD4Prq1LkouqFTjinNzVyv9tz2pmUPEl76MFZB+zk0Cb4DWLgbc5P3E47rSQV
         tuNrEUHg5nMs7A75G27KLvRhBEQRMHpBCBGHuLt6i3V7L4EClXQCFT0tJ4iwtoeh9qnY
         iz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0yrOtl2/vXFjBV9mfFVPKTf6KTFDoET1HXMlOMMk7oaf2DWrhaRdezdYszTWqyONuSMoKggX/5eRfFFN7b2lsHC/qlEu5KFF4hjiETfc=
X-Gm-Message-State: AOJu0YwWFeW51zMWOdwFO3mlHthh9ckfb4o4McCsrGerUO3eu+7vb0mi
	iVyRHwHQ+Es9dTl7YeERv7g9UllrWlnXqgk0aFu9FzDaYjT88vphcZgx3BAZFQ==
X-Google-Smtp-Source: AGHT+IGr33Fq44uKsGyZAZLQzaQFHomHoysGXsfB5BViVO3Ce481CaTI2H6w7Kj46RWeBX8OcxpHWw==
X-Received: by 2002:a17:907:86ac:b0:a7a:a5ae:11ba with SMTP id a640c23a62f3a-a7aa5ae13acmr217281566b.50.1721804858579;
        Wed, 24 Jul 2024 00:07:38 -0700 (PDT)
Message-ID: <afb2c8c8-e716-4079-9bfe-68032bdd09ec@suse.com>
Date: Wed, 24 Jul 2024 09:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen for Apple Silicon (M1 and beyond)
To: Techguru <techguru@byiq.org>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d5c3e0900db98aaaeb7fb52f16598257@mail.infomaniak.com>
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
In-Reply-To: <d5c3e0900db98aaaeb7fb52f16598257@mail.infomaniak.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2024 03:14, Techguru wrote:
> I am in the process of getting up to speed on your governance
> policies, applied for Coverity access to use some of the known issues
> there as training wheels, and putting my gitlab fork into good working
> order with CI.
> 
> I would rather not duplicate effort which has already been proposed,
> so definitely open to any pointers, any requests for how to chunk
> things into smaller patches, any requests for particular
> ordering/sequencing of patch sets.
> 
> Some obvious areas:   16k pages;

For this I'd suggest that you start with a conceptual model rather than
thinking of patches straight away. It has been the topic of past
discussions, without - iirc - conclusive results. I'm sure you're aware
that 4k page size is, sadly, baked into certain parts of the public
interface (see e.g. io/ring.h). Otoh it may well be that you're goal is
explicitly not to be able to run any guests working with 4k pages. If
so, what would need ensuring is that such guests would cleanly fail to
start, rather than crash early in a cryptic way.

Jan

> device trees; interrupts; power
> management; any essential device drivers.
> 
> 
> 


