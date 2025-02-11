Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A2A303BE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 07:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885086.1294861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thjvT-0002tS-2G; Tue, 11 Feb 2025 06:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885086.1294861; Tue, 11 Feb 2025 06:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thjvS-0002rg-Vl; Tue, 11 Feb 2025 06:39:18 +0000
Received: by outflank-mailman (input) for mailman id 885086;
 Tue, 11 Feb 2025 06:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thjvS-0002ra-5I
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 06:39:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e977abfd-e842-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 07:39:15 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7c6fc35b3so268438166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 22:39:15 -0800 (PST)
Received: from ?IPV6:2003:ca:b70b:b490:a848:f95e:2d0a:6216?
 (p200300cab70bb490a848f95e2d0a6216.dip0.t-ipconnect.de.
 [2003:ca:b70b:b490:a848:f95e:2d0a:6216])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7d4d291bdsm159233566b.17.2025.02.10.22.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 22:39:14 -0800 (PST)
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
X-Inumbo-ID: e977abfd-e842-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739255955; x=1739860755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6XnuT2dN+lcYcr5tGZ/+mmtDorWamyiAOeVBMVCeq8=;
        b=JvkvjV8JKJEoQjyU3yCOmU/qe6OUu2QwV4b0neIN0xAET011nSvIlxTQBQ9P9nzk9A
         UnLtgPTDbv+p/HpGE/XvttKojW5GY7bRy9BrWbPHl1S/efaHi3R5NgM0ewGQdIttRFwD
         zVceUCx5ip/nMRddYw528Hj/PvpOaxx69Wl7C1Z14DIxClhOqawqThjMAJKoUVunmaFi
         kUFXkSJWWj4iJIUj6M1pYREtOsbLYPh5XJ2DLPG3L618QAP0XM8wspF3CQ9Ca9nXF9t+
         2M5JVhsvNMNqkeed3ehpap59fHLchZQ9jFkr9mAMf0it5wLbOj+qhCmDiaRewF8BVdyb
         Ipbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739255955; x=1739860755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6XnuT2dN+lcYcr5tGZ/+mmtDorWamyiAOeVBMVCeq8=;
        b=B8JJpVfaVcOnsFvSIFuZ8kA2mZNfyhZzXWSyvSt3h/UqOOqCxZ7l3UBkbOO5oxA+Qt
         guBySYzFgwk4rZZ2xXsoIhEt1Qx4HXOioR0U99J3SCd2TFAcMIJxZoOOq/rpYfThPnd+
         6cJFwSzPlfNPhspR53b7foaaHykKDPNS5wBe51VahnqgwDuGfHCSX7O38z1z0CxkMHgM
         CtDU7K7BI0zB4R5F+CXDHbfY+B8Mp0+/RvH5fK/QTgiEcc2G0FDyX8G4oVUhcNqxnUcS
         EQWDiHTEOWZXXSwNnipWydC/o4yUHlO1/7QXlMhAmKcFDrMfRaygtjQAg1lOgxUtF6yb
         FexQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnThodWiZu4K9qvPZDOi3JcOlCKqz3PUFJMN+zFa4yQOh2EC1psWu+Zwlbt/9F8mLx3lACj/k/trc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDk+K30wc2FPBl/1KcV+SHFpKrNQcyv7qMhR5n7djAsWg0eUN8
	r8bl5LJPrnAPd0mxOgs7Z3UyXg7I7xGj7iAmV5oUPeYcJK/Fw0RqCiU5KYv9cg==
X-Gm-Gg: ASbGncs5TfFaEQHZY8jmVirfyAa4bvC6VOTa0sioaYAwP3OXOyRkHoNOPs51fWy3kbU
	S25mhg6z/gTukZOTppD68GDEfeF8EGfjswtTE9NdDk3Stap2nANaqrJP7HmS5eMNBovrOByuN0u
	vi+mZ1X8N3Vy2/TwD0SQ7wmLg1/DBZDHYNhyz4V2P04V12QMg7hDkxhV1Kb3z5M/uo4peCA5guY
	bJ4zi41G3tHY/rTEsQH6JK2ZxBuJ3Y02CN5ilLpMeefyU0Twg+SiqOWSzM6bHBGOHbn7ePJJzfp
	hwVQvpJezo18uFN221W09GRZra758T2zso4fEVEX4kLmvMaQr3N79kjMD+ImcUTyKHOmR3epulS
	zdhnqddo/29ApFc7l2MhJIdMVUfjyBA8AmP5jGuA38eyNYRGRuw==
X-Google-Smtp-Source: AGHT+IHB3T7LMt95vc4SH917zVXPzNlqun7gJCUAEFnLO6T+K1vFFhmH/ht2951ISlaJ+Pz2S+l9NA==
X-Received: by 2002:a17:907:18c6:b0:ab7:a4b1:99f with SMTP id a640c23a62f3a-ab7da399ba1mr181687366b.30.1739255954901;
        Mon, 10 Feb 2025 22:39:14 -0800 (PST)
Message-ID: <c9b8ae2c-ed90-4256-8a61-19ed85b1a774@suse.com>
Date: Tue, 11 Feb 2025 07:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] xen/x86: prevent local APIC errors at shutdown
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250206150615.52052-1-roger.pau@citrix.com>
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
In-Reply-To: <20250206150615.52052-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 16:06, Roger Pau Monne wrote:
> The following series aims to prevent local APIC errors from stalling the
> shtudown process.  On XenServer testing we have seen reports of AMD
> boxes sporadically getting stuck in a spam of:
> 
> APIC error on CPU0: 00(08), Receive accept error
> 
> Messages during shutdown, as a result of device interrupts targeting
> CPUs that are offline (and have the local APIC disabled).

One more thought here: Have you/we perhaps discovered the reason why there
was that 1ms delay at the end of fixup_irqs() that was badly commented,
and that you removed in e2bb28d62158 ("x86/irq: forward pending interrupts
to new destination in fixup_irqs()")? May be worth mentioning that by way
of a Fixes: tag.

Jan

