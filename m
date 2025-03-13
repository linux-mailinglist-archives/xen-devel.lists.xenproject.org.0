Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7DA5F7E3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 15:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912333.1318626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjSS-0000yT-VN; Thu, 13 Mar 2025 14:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912333.1318626; Thu, 13 Mar 2025 14:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjSS-0000wZ-S6; Thu, 13 Mar 2025 14:22:48 +0000
Received: by outflank-mailman (input) for mailman id 912333;
 Thu, 13 Mar 2025 14:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsjSQ-0000wT-OJ
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 14:22:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a21a6a17-0016-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 15:22:45 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso6460645e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 07:22:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df35f7sm2301107f8f.13.2025.03.13.07.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 07:22:44 -0700 (PDT)
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
X-Inumbo-ID: a21a6a17-0016-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741875765; x=1742480565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mii+gNG2ictccJktdUeZiV2ed+rWMYcQ+yEDAo3t+Dw=;
        b=evqkXGAJVfva2TOcpMh1ysd8JwBhfI312d+e1S7uEplP7JESOK3SmG2xOp18RavKtc
         2T8bDoEB3xYFY0TTUeJJVtmpp7Wxkf9uwf8ueDtHfe4H6zRXhEY3BO1diQzyudOd3512
         sThwOwvRGL9wmk1jM0mtiDRi4cvKhjG+4U5PVE7XfoPaxfIfsGBozBu3WTMF919hg4RB
         kLA/9s4QqiTswIfTdMIVgOIc6oMgZIrn3uIyHHxpo/sP3BOJ41y0tKT78AgV5hpFgAwf
         Opek+h4CSe8ChZbS3Q0t3Ux8PIEyHnnyuqaDyLJ+byg6U/BXaoHmoyrVjUzJlbC8ELeS
         IFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875765; x=1742480565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mii+gNG2ictccJktdUeZiV2ed+rWMYcQ+yEDAo3t+Dw=;
        b=LUf/ISXV9wp9d1BpC9kDliXt8opzd0WIXf+DnJRz1di8uT76vVt5VBJEwwrZTroVrI
         IUC2kYMbZa5q0p1AOZAe9C8Vdr17jL3eDOYYevkgeMr0GIYlwAL8ilfZbWQro/JZxWP6
         uPpApw1Fsrn8tqHb7KzeBJHfVMesqCTuWZvQE0yre3JAO2CKBDK7aJqR7CrqvOpEid36
         2zGu0NHqzsS63ds76ZHo3KFhcgHDnK+d2Vrk1xBM7Mu5nF2H1tgFOofGSEj6ZjH8Ugou
         plSnm1jXQIpH69Y0TABqI3C0jD01OC4UqAUM4itMUt+7dFUHdsMlHSONgXzjUsmPUw2u
         MWLA==
X-Forwarded-Encrypted: i=1; AJvYcCWpfHrO76hgNEjPeN7njcXZPTvNBpfXLhZjZtANMeGykurLxcuX7qBcAGeMx2mx0Ud75B062PSxB3E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz0UIo2dstr9EMqdJj4QV8F34p1/m/3LP2odIpuVL664RM2vDB
	VL4PFJzkq8GH3ajZNKCh80Zb2JfDnjkeWkqlrtOQtM/N8v2w4kP54SmI//9+1w==
X-Gm-Gg: ASbGncs2iRtmV5Gwv4s+UPuigaRLABbNsj6oJOUDA19hXzaF0rn1iXGsGam/cmuSBUD
	Qb4+SH1tkhDNaAH+MXmedv2Ubd+sd4VDtAguEfaWMT6lzKjzqlefxnocTtCi/iCpIMR2bEq6VE8
	bAkDu9JXlkwRxe3o/xZrcY+wzuU7ywHGhzyWpi4nk6DHXq9w6Y8TGDk9dRBvOxwvfPv6t3hPXRD
	KXE3e6tUlgKXAboFkPlBXRwEKq14MKe4fM9pWPXugPE+zCRYxY3kp2dqF2UcMu2CjUkxsxDqACT
	ZqAshldRekVtTJqGZXgiVbSzApz2QLqHPA382rw26583CtNSUcHLhvv1/MvUrnuS7NaxsQ7tVq5
	NQ0GHCIC/5ApjO6vmw0Vv3HUUtUbrXoBteKDzuhsT
X-Google-Smtp-Source: AGHT+IF3e/uTh3+XHYwzHnGVQUVgw63J9guxcnRFMu83gT5m0tHylu0LyG2yrBz47Lm6wXbt+ZSvNQ==
X-Received: by 2002:a05:600c:1c06:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d01bd1c94mr107725725e9.2.1741875765325;
        Thu, 13 Mar 2025 07:22:45 -0700 (PDT)
Message-ID: <fa3f879d-e068-4296-8281-95c6dd10ce4b@suse.com>
Date: Thu, 13 Mar 2025 15:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] xen/arch: Strip out tlb-clock stubs for
 non-implementors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-7-andrew.cooper3@citrix.com>
 <c3890a8a-afe5-44ef-9c67-2ef0d73346a6@suse.com>
 <504726b4-0e21-4664-87b9-3dd78526abc9@citrix.com>
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
In-Reply-To: <504726b4-0e21-4664-87b9-3dd78526abc9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 15:11, Andrew Cooper wrote:
> On 13/03/2025 1:05 pm, Jan Beulich wrote:
>> On 12.03.2025 18:45, Andrew Cooper wrote:
>>> Now that there's a common stub implementation TLB clocks, there's no need for
>>> architectures to provide their own.
>>>
>>> Repeatedly zeroing page->tlbflush_timestamp is no use, so provide an even more
>>> empty common stub for page_set_tlbflush_timestamp().
>> At which point the field itself could in principle go away. There are three
>> printk()s (accompanying BUG()s) which use it; surely we can find a way to
>> abstract that out. This may then still be enough of a reason to introduce
>> HAS_TLB_CLOCK.
> 
> I wanted to remove the field, but it wasn't trivial, and I've probably
> spent more time than I can afford on this.

I can understand this. It'll remain to be seen how useful HAS_TLB_CLOCK is
with patch 4 corrected. And of course it's ...

> I'm tempted to leave a TODO in tlb-clock.h to make it clear that there's
> more that ought to be done.

... kind of okay to leave parts to be done later, as long as it's at least
halfway clear what it is that wants doing.

Jan

