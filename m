Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0B91A2D5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749880.1158106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMleC-0004VG-Pl; Thu, 27 Jun 2024 09:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749880.1158106; Thu, 27 Jun 2024 09:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMleC-0004TK-Md; Thu, 27 Jun 2024 09:42:32 +0000
Received: by outflank-mailman (input) for mailman id 749880;
 Thu, 27 Jun 2024 09:42:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMleB-0004TE-Lw
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:42:31 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9264e58a-3469-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 11:42:30 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so98041111fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 02:42:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac8e06e7sm9226485ad.6.2024.06.27.02.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 02:42:29 -0700 (PDT)
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
X-Inumbo-ID: 9264e58a-3469-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719481350; x=1720086150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P/S8BVEh4uCDLugoaFpR3ia2RAVlpPmLeAL81b5KYvc=;
        b=CTFNibEr/sQO4Yn+cb4fBI/INMuDOU79IRR24gk4bX2JCYm3dc4pzrxnsqX9U+4YHj
         AtffeNfm8rBOqMGfYrk0SAkSESUqJM8xuxsAJvE1qWi20qzqnig+oswq6tk62M0VPIc4
         XFRJ25XCS4KsGlXFtgnPcvhAV96R1PJzxglLrvjxZt3g0ZOwxfSF/d2qyss9lev93sWW
         pGCUwK0RPYV0pV5KWo+V+qsyD8cL2O2NVKZo3TR5K6ug/cmM6LJ7ZVF8lKoEj7k10ov5
         CfpDkQ8DwDQzq2AYHKrVrtcUO+CnTe3MDCILpc1zVpBvcXNEcKQdYXdnn2P/4RqZEv8p
         +U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719481350; x=1720086150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/S8BVEh4uCDLugoaFpR3ia2RAVlpPmLeAL81b5KYvc=;
        b=VHQCLL+CZ1ozYRjMinT3KzzT8FZMgm8utkYCsTy8VI1efvrwkxLhcJFRTgSTX6yTni
         jNHFHfC+usKInJyepY3r4/ggux+UrepZbKq02WHooygXlRBzR0je54XCVtEjGMLInaM5
         Yc3uARx6msuUpq/rOTRAcfq0ivMDyxY4H7y5qbHHLFHAZG+78eJro3q3Qn/rx2L0X9L5
         iSufSqTBpt4CxJVD9srNOZ2+S/xq9LHqrovDoRy2MjjfPOcPfoP8UmnKt+ipAOwX+6k3
         XmGuykfpgVyudXvl8fTtwrm75c9rMn+Z4ViOfgBVrCkNrkdRCo/1ujZSbV9FXkvIMaRV
         JAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5YhZdKpEX7i2BPo/iM5NpaoFgrrHQGzmvi404gn2ykfdPx5++iDXYMBJ0/v6mTAz7KlpsfX+wWZckDVSJs05BOnzWoOT0FCczBfY4KCA=
X-Gm-Message-State: AOJu0Yz1ShZoQwebPnx71X+VPx6+VLJ/8niww9r0xhhvx52PWNQK5+GY
	N54x+tMoqRTWyd0q0DIX6kN5dLJEq2ijtnP3e7nGt49x+uOzFUhhMVy0ctTirg==
X-Google-Smtp-Source: AGHT+IGSlcojHbxVy/T92BB0xSExuMdGmuxvJCW31A9UK6LatjIMgU7MEyJDHyC0sifor2vuqrfscQ==
X-Received: by 2002:a2e:800a:0:b0:2ec:4e59:a3de with SMTP id 38308e7fff4ca-2ec57967be5mr87038181fa.10.1719481349919;
        Thu, 27 Jun 2024 02:42:29 -0700 (PDT)
Message-ID: <fe255839-f8ab-4dd1-abe8-8ec834099a8d@suse.com>
Date: Thu, 27 Jun 2024 11:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] tools/libguest: Make setting MTRR registers
 unconditional
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
 <2c55d486bb0c54a3e813abc66d32f321edd28b81.1719416329.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <2c55d486bb0c54a3e813abc66d32f321edd28b81.1719416329.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 18:28, Alejandro Vallejo wrote:
> This greatly simplifies a later patch that makes use of HVM contexts to upload
> LAPIC data. The idea is to reuse MTRR setting procedure to avoid code
> duplication. It's currently only used for PVH, but there's no real reason to
> overcomplicate the toolstack preventing them being set for HVM too when
> hvmloader will override them anyway.

Yet then - why set them when hvmloader will do so again? Is it even guaranteed
to be no change in (guest) behavior to do so?

Plus what about a guest which was configured to have the CPUID bit for MTRRs
clear? I think we ought to document this as not supported for PVH (we may
actually choose to refuse building such a guest), but in principle the MTRR
save/load operations should simply fail for a HVM guest in said configuration.
Making such a change in Xen now would, afaict, be benign to the tool stack.
After this adjustment it would result in a perceived regression, when there
shouldn't be any.

Thinking about it, even for PVH it may make sense to allow CPUID.MTRR=0, as
long as CPUID.PAT=1, thus forcing it into PAT-only mode. I think we did even
discuss this possible configuration before.

Jan

