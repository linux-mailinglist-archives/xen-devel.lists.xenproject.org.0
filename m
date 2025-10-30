Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E4C1ED7A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 08:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153366.1483724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENPC-0007BT-7B; Thu, 30 Oct 2025 07:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153366.1483724; Thu, 30 Oct 2025 07:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENPC-00078T-4L; Thu, 30 Oct 2025 07:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1153366;
 Thu, 30 Oct 2025 07:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vENPB-00078N-3k
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 07:49:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea35b14c-b564-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 08:49:08 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso561194f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 00:49:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5768sm31391898f8f.24.2025.10.30.00.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 00:49:07 -0700 (PDT)
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
X-Inumbo-ID: ea35b14c-b564-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761810547; x=1762415347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zIk56hTsi8RRlTiQIGCZQ8lRsHuGE3dGo+CL4Be8aTc=;
        b=d3gDYL12v//LwGOPo1uFK48dGcs3vwQZ2AwGy+ZhVSmDyBno74Fkhb7fS5Zj2rX+iS
         FMGho+5Jff2yRQCDp1xhx5ZEILzpni6GGTBwXR+wN/PR/ls6iO9bkfa3A1XINt/htZcN
         gu0ouPUiyuewGB/vLRV3nPHmS76Vj2b8WVqJelyYja6oCYAc+H7PClZvcLp3NrZdGjSa
         N8C85KDKvb5dAe/a/rQFzo3ZFZhMww2f88YHHus2Mzq+JKlchdaiXHuYffpMOAJMPUmB
         dfsS3Et4jAgqBswXesLa8ELJklptJTDwcKP2Oil7m+CVsldJFhdWQ3CwGYzs0Tddf8JJ
         45SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810547; x=1762415347;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIk56hTsi8RRlTiQIGCZQ8lRsHuGE3dGo+CL4Be8aTc=;
        b=txXGQM9llOLCEs5K4+1BsIH7Hd67StDomwxjbmDgoUDwtIPkJ7ptA++LR7jv5iwpXe
         9esR0R8jJYvTMj2JoH7Yry/BPuWDnX4iXVkeSCX5VRtyQM50tMJgU7thwBLPFG4ktVHU
         jPa/9T18xPM94WqlH5AIL63ELykIYCPvS2+SV2d8uIOk90Je2X5HQS3grSG+x9l/egEK
         k7u4p2aS1ELWKyIPRRu9iMqBhv5arvIf9o15lZy4iM688tKcUI0gQmCeCgOgRfzC3Ahf
         SYa7n239dL0+LD/TtKeDEXuAHorvpSxgbpJ16EQn9aE7LjEmuKWZPa5oh4GrlrQJ6lpH
         l15A==
X-Gm-Message-State: AOJu0YycCJYk6JXsTXa6wxxiPgFmmrXhXK/YmXfXYDPAQKdfOO5WyqNQ
	mJPk2T3yEMBWcaAcZiTzPr4yWDUljYeUmFiYTRxvVlh961lYKNwM+gDjDo+GG3ITdQ==
X-Gm-Gg: ASbGnctLBr1DnWLK+kryEx0tSLmMTxq0djFBaIQn35OnKCFX7T/8zwcklTX0BjphH3l
	cFDLCSdRNK3r5WA1oZ990t0reL8JJuCpc5NToU0f1DXOJJPkyxEAY8UC2FZvGkrwBGh7r81Mx7d
	ZXrQjpD7GZ8SnkIomHfNxPVNQl80gm/EyHG2a3Y9/sgBVju7A/E/d6rYaK1Iza+zUkgENs0Q9aS
	YlOvg0dfzarmkqeDSNCgif6dDDYyLtMWnZQ2YVLteMS3Vm8tJexSuFnKQh97SKQIR3N09K0SJ0a
	4t92fQZEbRaNyxdUMUHDl1cDU0MumRT18GkT9Wpafc2Iwrv4550NFr/Sz6NTOe2dbUFzXISsLkW
	DOmHkFBttIZxVFzLYHYS9jq4a89s8c7BjxpJcHxRRRbKGpWarWmyztoBURCGY8klMVGVA4BdlRX
	HAB3KyoWkVa/nLpsE2vYIoCaJm20cAG3qtXd3MELqiOAE5K1VVDTJYgjyAK1v8HodXQfOnLz4=
X-Google-Smtp-Source: AGHT+IG8T81TvpdL4T3/KNCNHjksEY+wkQoDQPHjmy27sxHFJK/aE2iVpVJAweevEl2MRpK+A1NLMw==
X-Received: by 2002:a5d:64c4:0:b0:428:1dca:ffdc with SMTP id ffacd0b85a97d-429aefbde19mr4964204f8f.47.1761810547501;
        Thu, 30 Oct 2025 00:49:07 -0700 (PDT)
Message-ID: <2dc8848d-fe1c-49f2-ac5a-e98338d4515f@suse.com>
Date: Thu, 30 Oct 2025 08:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
 <aQJiZQ37v9av7De2@Mac.lan>
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
In-Reply-To: <aQJiZQ37v9av7De2@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.10.2025 19:52, Roger Pau Monné wrote:
> Seeing there are no changes to the ACPI tables exposed to the guest,
> do we want to start exposing X2APIC MADT entries instead of the plain
> APIC entries?
> 
> The ACPI spec seems to suggest that you can expose APIC entries for
> APICs below 255, for compatibility reasons.  But given that we would
> force the guest to use X2APIC mode it would certainly need to
> understand how to process X2APIC MADT entries anyway.

+1

Jan

