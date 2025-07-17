Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582AB0847B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046105.1416328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHfy-0004an-Bl; Thu, 17 Jul 2025 06:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046105.1416328; Thu, 17 Jul 2025 06:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHfy-0004Y4-8N; Thu, 17 Jul 2025 06:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1046105;
 Thu, 17 Jul 2025 06:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucHfw-0004Xy-Bi
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:01:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6612e9fb-62d3-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:00:54 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so537258f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:00:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f46a57sm14657800b3a.112.2025.07.16.23.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:00:52 -0700 (PDT)
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
X-Inumbo-ID: 6612e9fb-62d3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752732053; x=1753336853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=neXYVfaWHJ9T3UT2Ok7AM9qTttl3ZBGJhrW+0vhwC+U=;
        b=L1WRqoAeTvHTganSjlYU+XL7zxeM4pajaqu5WgfH6ftJLxwZ3SGsd1eBXNSIv9kH9c
         YLXuNniMHMk1acmtfElSJfPKNO4x3nQ4UWix/Du/116vYRiizgHU9aPpzzJ70UNEXLuG
         ubEmAReQ3mdf//vyVoJbi4Il6SlLdHYvxy0BHHkyYTOUm8N+2DuzrBSOyEjA2d/pgBoI
         0HTKxjK/3Dh0gdCRxQ2Af7DlAjUPrdN1leAfaiCJt6SFJQ4bHjc1/+h2F2ryqzVmLEQa
         OgQg/r6vYvF7e30eMZxocJqpcetMC8HUea05WPk95uDvFCO+qrqQztnFKOBksbUGhivh
         TmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732053; x=1753336853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neXYVfaWHJ9T3UT2Ok7AM9qTttl3ZBGJhrW+0vhwC+U=;
        b=pXZHhc8+HTGItCUqFziikxE89WoTGqFuSDzl0bINvnJLnODrlmIZz72GFtcMkwFJgg
         e6/iB1LBVmOpjKM7HyupzBs126k7MJ70cu6ChnHoYDCM7u7IZeAnAv1uIPk69ek/MJ5a
         p5iP225LKEwvDOYwE/fTMLvreWNwqWGo+8g+cAP6wmdqpgX9rmzwi8/xDrlR4TISbPsN
         E1RrKwTbl2oVKGG/uTxiyk9Fq0yeyl3FlG67jg6cT9A0j+nXjlEDovV65esBnwlhdY0J
         paKjksUzrSIcR2D8ZPB9vI8BK8Qs72ZM1ZR6wTxYM8ueOh8or3Wan3lEf9znPmh/dcTN
         RuQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhNE4SIG/NoGOYHgAq7lHEj44kcEcyZmSu/Ro+H/MA1wUg/A+j33oCtC/vMp9FF72vRPiXwGdOurI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL3UTGwCDdju5vNC2ARCKb2ODnByhV7E9zALbX7SAL+HyUrRbr
	yWHL8vqTGbMVc0/Vy7YsTfJB/ZFbXF8mJGq+gRan+eyUZAMAYnLc+8EMI0ZtQEX7CA==
X-Gm-Gg: ASbGncsRsk4tBkyj2XXKGxLUQzEE/jfbU5n0dN2xnrhWMdtDBeH7yP6KB8XZjtjCpF7
	q2l2inTj600eUyBF3wZk6fbQ7puv0Q9OBwRL5YMsHb4ce02tMn67vMzrZZK0bwqp0KmZqTorOjU
	9UFoEvGxr5RRCrCIHZWrGvN+G8u/N75g+Cv5eNRzpY4vmXU5a9bY/EZ0GZ20XnrwW08ot7ve2eM
	BSd4jGsUoioNaaHDCiMuk/7acbnFYU4+PFNc03FNliuY5HjxUoWibneqdIKe/PDgS8dgqVdAktp
	La1BDxTlYFnQFhjlG391H8FY7t9A2kUoQyFvUdNFUlh22hXRUp8vEizHXRq7KFiWnYgzyvJ+UCl
	CmgRDM5K3ctH/upwu57nCB0W62T44I9w+Gm8G823KSS57nuy46oRRMT0vDQw3PYyrRqc39t0bOD
	KUT2YQtpkrp4PyjFzc6g==
X-Google-Smtp-Source: AGHT+IE4bOLlKBWDiviW9bORmclwy5V2yd9Gd6LrTUZiSj/2zsnHXrP4A06jk17sGfjrj6ukl+OHZA==
X-Received: by 2002:a05:6000:42c2:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3b60dd7b179mr3055128f8f.44.1752732053449;
        Wed, 16 Jul 2025 23:00:53 -0700 (PDT)
Message-ID: <7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com>
Date: Thu, 17 Jul 2025 08:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen.efi has MEM_DISCARDABLE flag in Characteristics field of
 .reloc section
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: yann@sionneau.net,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <39104717-4b64-483c-b6fd-d30069df4c58@gmail.com>
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
In-Reply-To: <39104717-4b64-483c-b6fd-d30069df4c58@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 05:11, Demi Marie Obenour wrote:
> This was discovered by GitHub user @fallen and leads
> to an "Unsupported relocation type" crash during boot
> because shim and some patched versions of GRUB do not load
> the section.  See
> https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-3078795967
> for more details.
> 
> I'm not sure if this is a bug in Xen or a bug in the linker.

As said on Matrix, my take is that - if at all - the linker could do something
about it only with a to-be-added command line option. For all "normal" purposes
.reloc being discardable is what is wanted. Since such a command line option
would be extremely niche, I think this will need taking care of on the Xen side
(which, however, is unlikely to end up very pretty).

Jan

