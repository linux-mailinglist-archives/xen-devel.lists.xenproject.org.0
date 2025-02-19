Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C286A3C2F0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893085.1302016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklas-0001JV-Rj; Wed, 19 Feb 2025 15:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893085.1302016; Wed, 19 Feb 2025 15:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklas-0001GN-Oq; Wed, 19 Feb 2025 15:02:34 +0000
Received: by outflank-mailman (input) for mailman id 893085;
 Wed, 19 Feb 2025 15:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tklaq-0001Fy-Vq
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:02:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aca18e7-eed2-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 16:02:31 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abb81285d33so777868566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:02:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaf6ec730sm425622066b.163.2025.02.19.07.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 07:02:28 -0800 (PST)
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
X-Inumbo-ID: 8aca18e7-eed2-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739977351; x=1740582151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F+i7NCT3dpy2slXSnmufM4/WDbKWSEWhkdofUGnVL3c=;
        b=OFFsVBEpnvB3OLUl6BdBR5CrscEic3nmkrUIHHqWLiV2jJL6wSEWCR3z0sCyLF2e4A
         W629L5FIubcj4WEABWBmKHAjBswRuUYmnROfyeLWs2EdXZsTInl6F4p1Qr6ROIVzZVQi
         MjHYwIUkeEAI50Xr3o0/aT5mqmWbooLCfJId5FsKUkVwXpAVSqIOI4jctHgGggDB4uiG
         QsUgzJoB7ZOVlthuG48nY5T7zsNAsW4jyOVOT+iyNngLV/3Xe8FXq5X7TPuGj7UTKbIA
         sczoByLTCyofi6V5yi+EXUskodggNFhyPXJuIGEmnzqsejxA1pTbCX/lufQPYLSHn2NM
         RSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977351; x=1740582151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+i7NCT3dpy2slXSnmufM4/WDbKWSEWhkdofUGnVL3c=;
        b=k12TgqTHV5tAPWcZrXq5KztuLm503V/B8cE8NnKlMNKU9IhN2AL67/sDzINs3OFqwy
         jWmCke4S5vs0BaInCv94T8Ml6vTeF4uLvjdvgfXi4uRn/3/JzvZPwPOxCRtqrnEW7ClB
         nGROFogaf/J8wiJmN2b4CFlZBv/QFyLx9sJ2BXVe8gtjOH4XcelmKOFEv83ipSXJwDu7
         zA7UJc4uRFfHzb9d/frEN3WAAKx0gncTVUoysTNp5pP9EStSamnAwRAU5w36mQ9LIcnB
         f6W9HvMW0gyP9lr2iEUk4DnOPF234hqM+RqS2hi9/PP3FM7yCqAYX1mvtlhKjE+pWZQW
         7gzA==
X-Forwarded-Encrypted: i=1; AJvYcCVOBX10LZCejgIYWaqhZ9FWMsm8R09wpxs2/Av5r6PscyePsDVQlCqtAf1ZtIGhbvuGjlVuYBO77tE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9QJ1fjdE9q0kjbUXBFycQhQQbu0J/a7NhKuTpegK/asRJ0U+q
	GdY6Fne/gkjsnMnxbv4oVCkD87iV5KxcyGsQ7I2PeLlXykAPJIrz023VLQOFVQ==
X-Gm-Gg: ASbGncuM0aTJgko8Ocotx1EvT6K+qED8c22/jJfxh6BunN9VCGiF7x2ke/VvWlsq6nj
	KkFmQxcTgBOyuvls5R3qX57LdD8flfLOX3Fl9bht+MT+ES/7gZENfFg9cmYc8CZAji6H91+0+MF
	Mlady/Bt1z5C0miPhCTsdnyLMdmh3i574fCeHCGMzJPsg0KbdbllY3LInsyiWRAHCwuQgeYMrlJ
	ZlF240CbKv4D/HSjFnSnAfdsN8xZWVXDwuKuvmPojjagoxtJ9XAgnS3pG4YRLlYMzIgLcO7cBy1
	gLKUy1OnZjmaiCo4K4YH3b0UK6pczOzSod4X8krrwitP5cu8cEeIQKn8Z/vcKIJfGVDK217GR2W
	9
X-Google-Smtp-Source: AGHT+IH860Y3ezPW0rwUsxJzUoLzjvtbTpiXCUan3ZMOU1Ky+2JY+ks+gQ9AZqIKNAozcq4Q68Ub3Q==
X-Received: by 2002:a17:907:3f96:b0:ab9:4451:3329 with SMTP id a640c23a62f3a-abb70e5ca89mr2063437966b.51.1739977348987;
        Wed, 19 Feb 2025 07:02:28 -0800 (PST)
Message-ID: <b5ed0862-6d06-4c6e-b8fb-74bb0fc8237f@suse.com>
Date: Wed, 19 Feb 2025 16:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v6 1/2] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
 <82c9611b923170b0525a7b76337ef067e359dc96.1739355004.git.oleksii.kurochko@gmail.com>
 <10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com>
 <16b2411c-9d5d-4c54-a4bd-f2d7215688c1@gmail.com>
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
In-Reply-To: <16b2411c-9d5d-4c54-a4bd-f2d7215688c1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 15:55, Oleksii Kurochko wrote:
> On 2/18/25 6:03 PM, Jan Beulich wrote:
>> On 12.02.2025 17:50, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/Kconfig
>>> +++ b/xen/arch/riscv/Kconfig
>>> @@ -28,16 +28,6 @@ choice
>>>   	help
>>>   	  This selects the base ISA extensions that Xen will target.
>>>   
>>> -config RISCV_ISA_RV64G
>>> -	bool "RV64G"
>>> -	help
>>> -	  Use the RV64I base ISA, plus
>>> -	  "M" for multiply/divide,
>>> -	  "A" for atomic instructions,
>>> -	  “F”/"D" for  {single/double}-precision floating-point instructions,
>>> -	  "Zicsr" for control and status register access,
>>> -	  "Zifencei" for instruction-fetch fence.
>>> -
>>>   endchoice
>> Shouldn't the choice be removed altogether then, for now being empty?
> 
> Overlooked that, "Base ISA" choice could be removed too then. or just change to:
> choice
> 	prompt "Base ISA"
> 	default "ima" if RISCV_64
> 	help
> 	  This selects the base ISA extensions that Xen will target.
> 
> endchoice

Besides me wondering what use that would be (there's no variable to store
the "ima" into), I kind of suspect kconfig might choke on the construct.
Plus even if there was some variable, I'd then ask where it is used. There
isn't a lot of sense in having a Kconfig setting with no user.

Jan

