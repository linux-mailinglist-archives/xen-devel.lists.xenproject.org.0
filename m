Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF95BC56D2
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139795.1475032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6V40-0003Uw-I3; Wed, 08 Oct 2025 14:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139795.1475032; Wed, 08 Oct 2025 14:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6V40-0003T6-ES; Wed, 08 Oct 2025 14:22:44 +0000
Received: by outflank-mailman (input) for mailman id 1139795;
 Wed, 08 Oct 2025 14:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6V3z-0003T0-IG
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:22:43 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5c6f82-a452-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:22:41 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6399706fd3cso6509768a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:22:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639f4109046sm71123a12.44.2025.10.08.07.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:22:39 -0700 (PDT)
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
X-Inumbo-ID: 3f5c6f82-a452-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759933360; x=1760538160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=okl9eWLacisYcY17Z21lkbNIx/NgzQgsC5anypX0D3M=;
        b=DyiWw1C5Kc/AVwBw5+Udc4dP/sjJq1Y8QEUP7nTH7KtZlAISebutJLiJ6GzEB2J3ni
         dtx6amBtEpdovPwjpZgZpD7roWOnrwnpxKJnqrBRR2KJAK8FZh0xjKSK/QfyEXOzpEuK
         WJktO4mX/A2UXBYWU7kuRb5HSjby5i5cIOFGeYvXWAA83tPn5vqjog1ywpo1v1897Prv
         d2dr/Kh6Sok/JajlodquWWljTLHHXJ4lGm0fLVSfM3NqgKDWZNtJRiiQZetvDUm3ZUgu
         dDEoqgebjAxstBFaIr5rVJIklIjtZs0TwFBRp6eMlX0ihkA2AVQabT3r32dkPE7V3uzv
         Gitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759933360; x=1760538160;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okl9eWLacisYcY17Z21lkbNIx/NgzQgsC5anypX0D3M=;
        b=tt/C76kvFIRgxAXA/Cnv+0uCcs1rCNrrpdi+1txGw56y1FeC4G1IDbZkdyakypS6iu
         FtaMvX895BQAmdJcbJC4FweAkByCb3sa43EZxP+X46F5lYd21WCHImZVCznaU7yCAxcp
         KfAj+rsNN+n8Z3oUpBRRwbDDTizeJNc624s09oh//QFawxC23XivgLk7wMFaZ08ngDUJ
         9MvM9kNCTWOOlYtNYOjGJ+XMUVVXo31xcuzU/1zMjkNqudr3Ze+Buw17P2Nez6VMI7NH
         wAsoJ+l5CcSreg3dXM/1KyXnA53gbPFE5+KsN8QETeC6LAECCnlMfclEVS5ZzjQQVX64
         pmSg==
X-Forwarded-Encrypted: i=1; AJvYcCUDENuxqeusWpRks3LEC3orzNal6Uztm0os5XAGI9x8zsqglgg7YynSnmnjD7UGk32FtxJFavBNzZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAA3ZfhCgJmf4j17SmSySjlFKhdEh+rn459hrfhWjOvAYnyJdV
	KWlMhxo+QMGNaZlSDeg+lXrbWxtDR4NC+LHpnuMoC3kE/wr2cheKfB5kthcNjkEkTg==
X-Gm-Gg: ASbGncsNTAQmjZs7Ke5QbqT1A0JH5ZMPMSnYu6Vv6z7RbtEewKidagJyXtkXv1ubsXo
	SqFkk33EcOGTwffWMwAiU1m4noxww9ZWhXrZqljJx5Llfd06j5C/iGAytjBWVzhFUY4mlKNKb62
	GS3Ro48P/oedfZKfq4UVyqE8zvwbtF3EBGBDUhPTBAiNTOxlPjnySiCoOKOO/ustQoOlxyqQnto
	4mubqD3ldhVevzdYRWRtOjMh/QFZqkmk4nCBavWRDx6NPNA60ERYZo1Fd5jCNzmwbAmQ6rKGish
	kj5K748QXxR4ub4ADOmNHodhBVSP/xzbzDKqIiWiMNPTztTLdzmYRu5QmyUbZkGjQI8p8TMeePn
	wPbwnTcDEr4V8BCklSUkW9VT/QRUnv5TAupsp1wR4VJOCJzPscNkphLxSkOji7JQ6+yWr7tV6hU
	n5qmhsUP0FnG8WcihCzqNqXi1e7MrC9OH8AHS5vywUavKDUCkp3DGY
X-Google-Smtp-Source: AGHT+IHOef2gKWdo4NVnqdvmY3bf3ewSE8su/oQAei+J3aYoPpQ2PxRLZASalcvndeNdBMXpZCcMig==
X-Received: by 2002:a05:6402:26c9:b0:639:dab5:d605 with SMTP id 4fb4d7f45d1cf-639dab5db04mr3026535a12.27.1759933360112;
        Wed, 08 Oct 2025 07:22:40 -0700 (PDT)
Message-ID: <bb45b249-ecfb-40e3-9196-f7c7fb3e2f7a@suse.com>
Date: Wed, 8 Oct 2025 16:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
 <e8fa4e2e-d788-4dcc-b1b5-9a3e0a70ef49@citrix.com>
 <f92139ba-b944-495f-8057-07271f3f7b17@suse.com>
Content-Language: en-US
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
In-Reply-To: <f92139ba-b944-495f-8057-07271f3f7b17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 16:05, Jan Beulich wrote:
> On 08.10.2025 15:04, Andrew Cooper wrote:
>> I'm afraid this introduces a vulnerability.
>>
>> APIC_LVR is a toolstack-provided value.  Nothing bounds checks the
>> MAX_LVT value in it AFAICT, and previously this did not matter (from a
>> security point of view at least) because the loop bounds were constant.
> 
> Oh, right, I should have thought of that. As you don't suggest anything,
> I'm going to simply add a check that the incoming value matches the one
> that's there already.

Actually - no, that won't fly. We just need to bounds-check MAXLVT.

Jan

