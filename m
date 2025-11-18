Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A4C6814F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 08:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164500.1491448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGYN-0002Xt-Ke; Tue, 18 Nov 2025 07:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164500.1491448; Tue, 18 Nov 2025 07:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGYN-0002Vc-Hx; Tue, 18 Nov 2025 07:55:07 +0000
Received: by outflank-mailman (input) for mailman id 1164500;
 Tue, 18 Nov 2025 07:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLGYM-0002VV-4m
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 07:55:06 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4e05756-c453-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 08:55:05 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so21678575e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 23:55:05 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a80:314a:d80f:dc29:6f97?
 (p200300cab70c6a80314ad80fdc296f97.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a80:314a:d80f:dc29:6f97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e8e6acsm361384625e9.9.2025.11.17.23.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:55:04 -0800 (PST)
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
X-Inumbo-ID: e4e05756-c453-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763452504; x=1764057304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/veRBfMZ2+Tzgh+9tTcf9q8mea1n5+ECWQwua59jLuk=;
        b=OJENjXMQ0jG9aAqpj88trwK30RklNLiyg6CmR4XYLGSlYIpGRpzaQ3+thvh6w2ZPJW
         VnXWefiJhzaMVd6j/gcb52HY6/+I1tUs0Gf5qMd6I3TYaZmmS9CK4YFoIuLCKTv3hJ9X
         4ZqWe/NqGh7Vayf/Auep/IfeDu5Qumu2S6NSGjfciXZnHKpeWBOd8iK6sIVe4CzERe3D
         TnNOABEE2ZYx90ZCrXOydX2IMoObMCqRk5/LzetPNN7bqgsiSI0iyfIPpJSnKMNsT30G
         dv2X7FSu4W5Zfxql38NFyb8AHZ9i/isVQy38NWOHc2CdCD9OW0+zvwsBUaIFCBd3t2kb
         s94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452504; x=1764057304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/veRBfMZ2+Tzgh+9tTcf9q8mea1n5+ECWQwua59jLuk=;
        b=q07DHrjiwyGVayLwjlVytckGulvijDkzPXb4NCcN7oJPgl3Dgc+Af2fd3JMBa1LS4Q
         j1xs/A7nGsmSoZvccKg6MyBsHXSADZtIgGYCNWBKti1DB7UzjAlsaOhgDoT6FDeI8hmf
         0ir5jijR/iyE0DvxgNwK+mEG0JFVWP22ParwTTHNXq610J2Fiu3C8CcykVZvKWcTdIut
         g23iOXd+kBkTLCIsL5kDYAiVZeILsuQngE+BCppuaqLW3Lt8wbuR1oUCn9cphrWt5VpD
         Hodw6R5txd1bRl0tOc3+0/qbnZaYkwEFGZZJgQEOBJdiOjWXLlA2sPZQ3g4/nfViYIq4
         dvOg==
X-Forwarded-Encrypted: i=1; AJvYcCX1o7KDynFmPLiBj+PBTh47QQ28bBTDbO8MQtlo2wvlC68V1uRYryAehRJ8AtAgXN+NOZl3BSesLgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOhWTdNeEbsyg5JklC3epXEdLEyit4ENO2AsyLedaj8nJLhGL5
	4Kky9/EiT1+PlilwBdBvIzzeW2Z+EqUWKLCBXIzzBDNfprCDWG9KD6ASuNdzDCgQpQ==
X-Gm-Gg: ASbGncukDxNvjHia4vKoxFe/o7rDlElL/pFUbL7KaHfc0knOmLTf2PIz7p0LBddEl90
	VVGs6HHFwBG2qX21EIQWVOuROgeF4MYA+i8NtJsCe+eCRRKobyt9/fZBDh8sWn9JrwoiHIifKAx
	VK4jjNqO9U3O0R+DezYYPOgBP6rVMhPSkH7WTDO01wyv6Dqi2dKAjQ0ztXPT5NGRD6Q6rTSkK6D
	EYq1hJ+tlIIb9+u3Et6JwjPXNz1dbw5ZorPFshZOSwKEfjqFCmjwHgIlCS/GoIF9EkHEZLmnONO
	h0WNBRkCFedGMcOjiNgMEbeRs3Dz0GYN4XobF0L+lFqbd9Kzbwz6wWHdmeROmepvaWNUr/JuPDD
	Eiqmf+csGnkmuEYpaaoHIOw3MwACm0hvWIx/3i2Yld+e4n3xOQnYurgKjDR+QIWwMjJWIiNyaU0
	92ka3KU3rN0DrAh7PSts0W8WQQ3HOuw1RINSmQXWQXK2WuuSd/BDPrR5IZjeJ5KzG1stle0EoKe
	xZCBDoAQiu5MCktOJuuDmAK/ZLn2xeYCjBJLQ==
X-Google-Smtp-Source: AGHT+IH7nLKvkBBl9FAgvxy+N/uRlhNil8mMf7AwDKFtMeSejqfKzesvECd6FErG0L72tQF/JaHvZg==
X-Received: by 2002:a05:600c:4695:b0:477:63b4:ef7a with SMTP id 5b1f17b1804b1-4778feaa8a1mr123155525e9.20.1763452504497;
        Mon, 17 Nov 2025 23:55:04 -0800 (PST)
Message-ID: <bb9c4550-3503-4274-9df0-9bfc93edbc55@suse.com>
Date: Tue, 18 Nov 2025 08:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/ucode: Drop structurally unreachable ASSERT()s
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251117222120.473451-1-andrew.cooper3@citrix.com>
 <20251117222120.473451-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251117222120.473451-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2025 23:21, Andrew Cooper wrote:
> It's impossible for wait_for_state() to return false when looking for
> LOADING_EXIT, so much so that the optimiser can drop the ASSERT()s.
> 
> No functional change.
> 
> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Besides helping code clarity, mainly a Misra fix as it looks (unreachable
code).

Jan

