Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AEEB086E5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 09:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046308.1416630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJ9O-0006h8-Hg; Thu, 17 Jul 2025 07:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046308.1416630; Thu, 17 Jul 2025 07:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJ9O-0006ef-Er; Thu, 17 Jul 2025 07:35:30 +0000
Received: by outflank-mailman (input) for mailman id 1046308;
 Thu, 17 Jul 2025 07:35:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucJ9M-0006Z7-Ef
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 07:35:28 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bf023b7-62e0-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 09:35:27 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so5715005e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 00:35:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1f53fsm15433683b3a.91.2025.07.17.00.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 00:35:26 -0700 (PDT)
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
X-Inumbo-ID: 9bf023b7-62e0-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752737727; x=1753342527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ifsfYWm7w4d0HjCI1vmxMByrI2E3cxz/2mBh7dEu5bU=;
        b=EvrmnIgNIqo0yiTHHBkBffQULloh/Q3DRJu2Iq3AyR/ksQwx07dfyNXzryeZJXJt2J
         ydCNkUL8e/rLc9hwaoFCV5u6z3Ns2MTuPiYHGYu+4H2EaJand1VanICEEYB6LuvA7Zb6
         ZwMSGJBIxlsMwWSZJ2ikROWxDZtiXfVdfA2OFCTiRT/ZtLF2vvPV9nTyzp4tdGmU6U21
         bvc/X1/mlowryKqiswyhLyqH1aBradCroO9rkNKna4BE38VLbuANXrVBJTvwHYac0+a4
         324Xie59wZI4tak4erRtk9QdC2v6kBOaAkzbpI79NeLmDVPuExvK6Hc6FoTSQVuA98nf
         pXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737727; x=1753342527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifsfYWm7w4d0HjCI1vmxMByrI2E3cxz/2mBh7dEu5bU=;
        b=l3/JtAQvb2Bl22LsAKZsNSt7yX8COfotBAFVycJ1wT052O/D6WTzcNtrBnZ1O38v73
         i2UJw2Ykyu+jDBzYxFKYt7yMqZsudVLst0VuO2oIeR2tEBwkR0r0cDE2tNcsxbpnlQQY
         J58X3wi0Bj3Y7e7znkVhxF7YUOQJ8sTmclqZYdbgjoF00odCtE8HWXkZKl4flEyRv2RU
         u8NHM9zn+rK/GBdeca18oy3V5oUPv8a9FjTmfpxw1V3DjEBKKw4SjH4+eHvkX7M1yD55
         WYo8BspzBaQaNllamsdfdzV03XdWeN3SDKKVRAOmHGCyn366q45KvU7taR1pSFKWTN2Q
         WP5w==
X-Forwarded-Encrypted: i=1; AJvYcCVPI1hGsx4owxUN6uX8T8Zhcx6K3Mtd004ccn+Fybx9AMqNvPEeUNWuFUrT4rOlyvK9U121pcP40i0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtUFzrinHiCgSKNyduknTsocAst4AzVGjFfsCSpgg4NuAzTFOc
	pB/J0JksbKFgJJCrJIdvcPdRDkBEQEYiHR35g2gw4/W6iynvGi5OsMIaHOtU4i0QnQ==
X-Gm-Gg: ASbGncs1RULSgBY6WmubCCZIDuzYCfE5n/+FSnQeiHxbIsHego1Syx8nCoW0znnochg
	uCT8sfdCViJr7YvFNHUg+9xyNrDw7kwSZWeMd9BRJCxYxWfdn456VAIGhoEnF4+raIqOtsBEABc
	dKw5dmrhC25M8Sd8yYs5ij4hHbIxpN1WV/XAg4cS06Tv1L1zUT3E5Puf0riS53O9ir0sfOnAFHq
	pnEnWJV0AwDAJknOpqFbZFACFucHjnNY3FnHgjIEHu/QSQ5CZZcqKVzbgDlBIv9bwku2ihCGelV
	TYNvibnC9NbHiMw+cyuarUEgBL5iadPhWNEr/ClH3j6plwQ9qB84sP27TQSgKhDp/QFBzwCrRtv
	/PGdaDV19QfAq+aJbuLtC7JV3aQ3EMhukBaJtQgTza8FvwWJnWeSizcRYtXzgsn27dAeeMRQJjE
	s+ZPaTA24=
X-Google-Smtp-Source: AGHT+IHqOXp1EoE26PUUY0/wVfjft2Scs6CYkPWkVb7fq/C+xvvcAY2Elj8t0M9feZeHqDL0xdickA==
X-Received: by 2002:a05:6000:26c9:b0:3b4:9dbd:eee9 with SMTP id ffacd0b85a97d-3b60e510026mr4446162f8f.36.1752737727226;
        Thu, 17 Jul 2025 00:35:27 -0700 (PDT)
Message-ID: <f6243e9e-78ae-47c3-8697-e4761f0b394b@suse.com>
Date: Thu, 17 Jul 2025 09:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86/match-cpu: Introduce X86_MATCH_VFM() and convert
 intel_idle_ids[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716173132.2213891-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 19:31, Andrew Cooper wrote:
> mwait-idle's ICPU() is the most convenient place to get started.  Introduce
> X86_MATCH_CPU() and X86_MATCH_VFM() following their Linux counterparts.
> 
> This involves match-cpu.h including more headers, which in turn allows us to
> drop a few.

intel-cpu.h doesn't really need to move, does it? Conceivably there can be users
of match-cpu.h which don't need the Intel constants. Hence no point in forcing
them to see those.

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> We now have X86_FEATURE_ANY and X86_FEATURE_ALWAYS as aliases of LM.  Given
> the contexts they're used in, I've left the naming as-is.

What's wrong with sticking to ALWAYS, which we already have?

> It's a bit nasty (preprocessing wise) triple-expanding VFM in X86_MATCH_VFM(),
> but we need an Integer Constant Expression.

Not sure what alternative you're alluding to, or in fact what nastiness you're
seeing. But maybe I'm getting "triple-expanding" wrong: To me that means going
through three layers of expansion, when you may mean the fact that
X86_MATCH_VFM() evaluates its parameter three times. If so - yes, but as you
say: What do you do (in this case).

Jan

